program project1;

uses
  SDL3;

const
  STEP_RATE_IN_MILLISECONDS = 125;
  SNAKE_BLOCK_SIZE_IN_PIXELS = 24;
  SNAKE_GAME_WIDTH = 24;
  SNAKE_GAME_HEIGHT = 18;
  SDL_WINDOW_WIDTH = (SNAKE_BLOCK_SIZE_IN_PIXELS * SNAKE_GAME_WIDTH);
  SDL_WINDOW_HEIGHT = (SNAKE_BLOCK_SIZE_IN_PIXELS * SNAKE_GAME_HEIGHT);

  SNAKE_MATRIX_SIZE = (SNAKE_GAME_WIDTH * SNAKE_GAME_HEIGHT);
  SNAKE_CELL_MAX_BITS = 13;

  THREE_BITS = $7;

  function SHIFT(x, y: integer): integer;
  begin
    SHIFT := ((x + (y * SNAKE_GAME_WIDTH)) * SNAKE_CELL_MAX_BITS);
  end;

type
  PSnakeCell = ^TSnakeCell;
  TSnakeCell = longint;
const
  SNAKE_CELL_NOTHING = 0;
  SNAKE_CELL_SRIGHT = 1;
  SNAKE_CELL_SUP = 2;
  SNAKE_CELL_SLEFT = 3;
  SNAKE_CELL_SDOWN = 4;
  SNAKE_CELL_FOOD = 5;

type
  PSnakeDirection = ^TSnakeDirection;
  TSnakeDirection = longint;
const
  SNAKE_DIR_RIGHT = 0;
  SNAKE_DIR_UP = 1;
  SNAKE_DIR_LEFT = 2;
  SNAKE_DIR_DOWN = 3;

type
  TSnakeContext = record
    cells: array[0..((SNAKE_MATRIX_SIZE * SNAKE_CELL_MAX_BITS) div 4) - 1] of byte; // Array für die Zellen
    head_xpos: int8;       // X-Position des Kopfes
    head_ypos: int8;       // Y-Position des Kopfes
    tail_xpos: int8;       // X-Position des Schwanzes
    tail_ypos: int8;       // Y-Position des Schwanzes
    next_dir: int8;        // Nächste Richtung (als char in C)
    inhibit_tail_step: int8; // Flag, um den Schwanzschritt zu unterdrücken
    occupied_cells: uint32;  // Anzahl der belegten Zellen (unsigned in C)
  end;
  PSnakeContext = ^TSnakeContext;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    snake_ctx: TSnakeContext;
    last_step: uint64;
  end;
  PAppState = ^TAppState;

  function snake_cell_at(ctx: PSnakeContext; x, y: byte): TSnakeCell;
  var
    shift_: integer;
    range: uint16;
  begin
    shift_ := Shift(x, y);
    SDL_memcpy(@range, @ctx^.cells[shift_ div 8], SizeOf(range));
    Result := TSnakeCell((range shr (shift_ mod 8)) and THREE_BITS);
  end;

  procedure set_rect_xy_(r: PSDL_FRect; x, y: byte);
  begin
    r^.x := x * SNAKE_BLOCK_SIZE_IN_PIXELS;
    r^.y := y * SNAKE_BLOCK_SIZE_IN_PIXELS;
  end;

  procedure put_cell_at(ctx: PSnakeContext; x, y: byte; ct: TSnakeCell);
  var
    shift_: integer;
    adjust: integer;
    pos: PInt8;
    range: UInt16;
  begin
    shift_ := SHIFT(x, y);
    adjust := shift_ mod 8;

    pos := @ctx^.cells[shift_ div 8];
    SDL_memcpy(@range, pos, SizeOf(range));
    range := range and not (THREE_BITS shl adjust); // clear bits
    range := range or ((ct and THREE_BITS) shl adjust);
    SDL_memcpy(pos, @range, SizeOf(range));
  end;

  function are_cells_full_(ctx: PSnakeContext): boolean;
  begin
    Result := ctx^.occupied_cells = SNAKE_GAME_WIDTH * SNAKE_GAME_HEIGHT;
  end;

  procedure new_food_pos_(ctx: PSnakeContext);
  var
    x, y: byte;
  begin
    while True do begin
      x := SDL_rand(SNAKE_GAME_WIDTH);
      y := SDL_rand(SNAKE_GAME_HEIGHT);
      if snake_cell_at(ctx, x, y) = SNAKE_CELL_NOTHING then begin
        put_cell_at(ctx, x, y, SNAKE_CELL_FOOD);
        Break;
      end;
    end;
  end;

  procedure snake_initialize(ctx: PSnakeContext);
  var
    i: integer;
  begin
    FillChar(ctx^.cells, SizeOf(ctx^.cells), 0);

    ctx^.head_xpos := SNAKE_GAME_WIDTH div 2;
    ctx^.tail_xpos := SNAKE_GAME_WIDTH div 2;
    ctx^.head_ypos := SNAKE_GAME_HEIGHT div 2;
    ctx^.tail_ypos := SNAKE_GAME_HEIGHT div 2;

    ctx^.next_dir := SNAKE_DIR_RIGHT;
    ctx^.inhibit_tail_step := 4;
    ctx^.occupied_cells := 4;

    Dec(ctx^.occupied_cells);

    put_cell_at(ctx, ctx^.tail_xpos, ctx^.tail_ypos, SNAKE_CELL_SRIGHT);

    for i := 0 to 3 do begin
      new_food_pos_(ctx);
      Inc(ctx^.occupied_cells);
    end;
  end;

  procedure snake_redir(ctx: PSnakeContext; dir: TSnakeDirection);
  var
    ct: TSnakeCell;
  begin
    ct := snake_cell_at(ctx, ctx^.head_xpos, ctx^.head_ypos);
    if ((dir = SNAKE_DIR_RIGHT) and (ct <> SNAKE_CELL_SLEFT)) or
      ((dir = SNAKE_DIR_UP) and (ct <> SNAKE_CELL_SDOWN)) or
      ((dir = SNAKE_DIR_LEFT) and (ct <> SNAKE_CELL_SRIGHT)) or
      ((dir = SNAKE_DIR_DOWN) and (ct <> SNAKE_CELL_SUP)) then begin
      ctx^.next_dir := dir;
    end;
  end;

  procedure wrap_around_(val: PInt8; max: int8);
  begin
    if val^ < 0 then begin
      val^ := max - 1;
    end else if val^ > max - 1 then begin
      val^ := 0;
    end;
  end;

  procedure snake_step(ctx: PSnakeContext);
  var
    dir_as_cell: TSnakeCell;
    ct: TSnakeCell;
    prev_xpos, prev_ypos: byte;
  begin
    dir_as_cell := TSnakeCell(ctx^.next_dir + 1);

    { Schwanz vorwärts bewegen }
    if ctx^.inhibit_tail_step > 0 then begin
      Dec(ctx^.inhibit_tail_step);
    end;

    if ctx^.inhibit_tail_step = 0 then begin
      Inc(ctx^.inhibit_tail_step);
      ct := snake_cell_at(ctx, ctx^.tail_xpos, ctx^.tail_ypos);
      put_cell_at(ctx, ctx^.tail_xpos, ctx^.tail_ypos, SNAKE_CELL_NOTHING);

      case ct of
        SNAKE_CELL_SRIGHT: begin
          Inc(ctx^.tail_xpos);
        end;
        SNAKE_CELL_SUP: begin
          Dec(ctx^.tail_ypos);
        end;
        SNAKE_CELL_SLEFT: begin
          Dec(ctx^.tail_xpos);
        end;
        SNAKE_CELL_SDOWN: begin
          Inc(ctx^.tail_ypos);
        end;
      end;

      wrap_around_(@ctx^.tail_xpos, SNAKE_GAME_WIDTH);
      wrap_around_(@ctx^.tail_ypos, SNAKE_GAME_HEIGHT);
    end;

    { Kopf vorwärts bewegen }
    prev_xpos := ctx^.head_xpos;
    prev_ypos := ctx^.head_ypos;

    case ctx^.next_dir of
      SNAKE_DIR_RIGHT: begin
        Inc(ctx^.head_xpos);
      end;
      SNAKE_DIR_UP: begin
        Dec(ctx^.head_ypos);
      end;
      SNAKE_DIR_LEFT: begin
        Dec(ctx^.head_xpos);
      end;
      SNAKE_DIR_DOWN: begin
        Inc(ctx^.head_xpos);
      end;
    end;

    wrap_around_(@ctx^.head_xpos, SNAKE_GAME_WIDTH);
    wrap_around_(@ctx^.head_ypos, SNAKE_GAME_HEIGHT);

    { Kollisionen }
    ct := snake_cell_at(ctx, ctx^.head_xpos, ctx^.head_ypos);

    if (ct <> SNAKE_CELL_NOTHING) and (ct <> SNAKE_CELL_FOOD) then begin
      snake_initialize(ctx);
      Exit;
    end;

    put_cell_at(ctx, prev_xpos, prev_ypos, dir_as_cell);
    put_cell_at(ctx, ctx^.head_xpos, ctx^.head_ypos, dir_as_cell);

    if ct = SNAKE_CELL_FOOD then begin
      if are_cells_full_(ctx) then begin
        snake_initialize(ctx);
        Exit;
      end;

      new_food_pos_(ctx);
      Inc(ctx^.inhibit_tail_step);
      Inc(ctx^.occupied_cells);
    end;
  end;

  function handle_key_event(ctx: PSnakeContext; keyCode: TSDL_Scancode): TSDL_AppResult;
  begin
    case keyCode of
      // Quit
      SDL_SCANCODE_ESCAPE,
      SDL_SCANCODE_Q: begin
        Exit(SDL_APP_SUCCESS);
      end;

      // Restart the game as if the program was launched
      SDL_SCANCODE_R: begin
        snake_initialize(ctx);
      end;

      // Decide new direction of the snake
      SDL_SCANCODE_RIGHT: begin
        snake_redir(ctx, SNAKE_DIR_RIGHT);
      end;
      SDL_SCANCODE_UP: begin
        snake_redir(ctx, SNAKE_DIR_UP);
      end;
      SDL_SCANCODE_LEFT: begin
        snake_redir(ctx, SNAKE_DIR_LEFT);
      end;
      SDL_SCANCODE_DOWN: begin
        snake_redir(ctx, SNAKE_DIR_DOWN);
      end;
      else begin
      end
      // Default case does nothing
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  // =====================

type
  TExtendedMetadata = record
    key: pchar;
    Value: pchar;
  end;

const
  extended_metadata: array[0..3] of TExtendedMetadata = (
    (key: SDL_PROP_APP_METADATA_URL_STRING; Value: 'https://examples.libsdl.org/SDL3/demo/01-snake/'),
    (key: SDL_PROP_APP_METADATA_CREATOR_STRING; Value: 'SDL team'),
    (key: SDL_PROP_APP_METADATA_COPYRIGHT_STRING; Value: 'Placed in the public domain'),
    (key: SDL_PROP_APP_METADATA_TYPE_STRING; Value: 'game')
    );

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    i: integer;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    if not SDL_SetAppMetadata('Example Snake game', '1.0', 'com.example.Snake') then begin
      Exit(SDL_APP_FAILURE);
    end;

    for i := 0 to Length(extended_metadata) - 1 do begin
      if not SDL_SetAppMetadataProperty(extended_metadata[i].key, extended_metadata[i].Value) then begin
        Exit(SDL_APP_FAILURE);
      end;
    end;

    if not SDL_Init(SDL_INIT_VIDEO) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', SDL_WINDOW_WIDTH, SDL_WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    snake_initialize(@app^.snake_ctx);
    app^.last_step := SDL_GetTicks;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    now: double;
    ctx: PSnakeContext;
    r: TSDL_FRect;
    i, j: integer;
    ct: TSnakeCell;
  begin
    ctx := @app^.snake_ctx;
    now := SDL_GetTicks;

    while (now - app^.last_step) >= STEP_RATE_IN_MILLISECONDS do begin
      snake_step(ctx);
      app^.last_step := app^.last_step + STEP_RATE_IN_MILLISECONDS;
    end;

    r.w := SNAKE_BLOCK_SIZE_IN_PIXELS;
    r.h := SNAKE_BLOCK_SIZE_IN_PIXELS;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    for i := 0 to SNAKE_GAME_WIDTH - 1 do begin
      for j := 0 to SNAKE_GAME_HEIGHT - 1 do begin
        ct := snake_cell_at(ctx, i, j);
        if ct = SNAKE_CELL_NOTHING then begin
          Continue;
        end;

        set_rect_xy_(@r, i, j);

        if ct = SNAKE_CELL_FOOD then begin
          SDL_SetRenderDrawColor(app^.renderer, 80, 80, 255, SDL_ALPHA_OPAQUE);
        end else // Körper
        begin
          SDL_SetRenderDrawColor(app^.renderer, 0, 128, 0, SDL_ALPHA_OPAQUE);
        end;

        SDL_RenderFillRect(app^.renderer, @r);
      end;
    end;

    // Kopf zeichnen
    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 0, SDL_ALPHA_OPAQUE);
    set_rect_xy_(@r, ctx^.head_xpos, ctx^.head_ypos);
    SDL_RenderFillRect(app^.renderer, @r);


    SDL_RenderPresent(app^.renderer);
    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    ctx: PSnakeContext;
  begin
    ctx := @app^.snake_ctx;
    case event^._type of
      SDL_EVENT_QUIT: begin
        Exit(SDL_APP_SUCCESS);
      end;
      SDL_EVENT_KEY_DOWN: begin
        Exit(handle_key_event(ctx, event^.key.scancode));
      end;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  procedure AppQuit(appstate: pointer; Result: TSDL_AppResult); cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
