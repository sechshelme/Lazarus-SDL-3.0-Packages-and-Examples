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
  SNAKE_CELL_MAX_BITS = 3;

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
    cells: array[0..((SNAKE_MATRIX_SIZE * SNAKE_CELL_MAX_BITS) div 8) - 1] of byte; // Array für die Zellen
    head_xpos: shortint;       // X-Position des Kopfes
    head_ypos: shortint;       // Y-Position des Kopfes
    tail_xpos: shortint;       // X-Position des Schwanzes
    tail_ypos: shortint;       // Y-Position des Schwanzes
    next_dir: shortint;        // Nächste Richtung (als char in C)
    inhibit_tail_step: shortint; // Flag, um den Schwanzschritt zu unterdrücken
    occupied_cells: cardinal;  // Anzahl der belegten Zellen (unsigned in C)
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

    // Kopiere die Daten aus dem Speicherbereich
    //    Move(ctx^.cells[shift div 8], range, SizeOf(range));

    // Berechne und gib die entsprechende SnakeCell zurück
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
    pos: pchar;
    range: word;
    p: pbyte;
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

  procedure wrap_around_(var val: shortint; max: shortint);
  begin
    if val < 0 then begin
      val := max - 1;
    end else if val > max - 1 then begin
      val := 0;
    end;
  end;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Clear', '1.0', 'com.example.renderer-clear');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    now: double;
    red, green, blue: Tdouble;
  begin
    now := SDL_GetTicks / 1000.0;

    red := 0.5 + 0.5 * SDL_sin(now);
    green := 0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 2 / 3);
    blue := 0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 4 / 3);

    SDL_SetRenderDrawColorFloat(app^.renderer, red, green, blue, SDL_ALPHA_OPAQUE_FLOAT);

    SDL_RenderClear(app^.renderer);
    SDL_RenderPresent(app^.renderer);
    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    case event^._type of
      SDL_EVENT_QUIT: begin
        Exit(SDL_APP_SUCCESS);
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
