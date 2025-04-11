program project1;

uses
  SDL3;

type
  TLine = record
    Text: PUInt32;
    length: integer;
  end;
  PLine = ^TLine;
  PPLine = ^PLine;

  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    Text: pchar;
    end_: pchar;
    progress: pchar;
    start_time: TSDL_Time;
    end_time: TSDL_Time;
    row, rows, cols: integer;
    Lines: PPLine;
    monkey_chars: TLine;
    monkeys: integer;
  end;
  PAppState = ^TAppState;

const
  MIN_MONKEY_SCANCODE = SDL_SCANCODE_A;
  MAX_MONKEY_SCANCODE = SDL_SCANCODE_SLASH;

const
  default_text: pchar =
    'Jabberwocky, by Lewis Carroll'#10 +
    #10 +
    '''Twas brillig, and the slithy toves'#10 +
    '      Did gyre and gimble in the wabe:'#10 +
    'All mimsy were the borogoves,'#10 +
    '      And the mome raths outgrabe.'#10 +
    #10 +
    '"Beware the Jabberwock, my son!'#10 +
    '      The jaws that bite, the claws that catch!'#10 +
    'Beware the Jubjub bird, and shun'#10 +
    '      The frumious Bandersnatch!"'#10 +
    #10 +
    'He took his vorpal sword in hand;'#10 +
    '      Long time the manxome foe he sought-'#10 +
    'So rested he by the Tumtum tree'#10 +
    '      And stood awhile in thought.'#10 +
    #10 +
    'And, as in uffish thought he stood,'#10 +
    '      The Jabberwock, with eyes of flame,'#10 +
    'Came whiffling through the tulgey wood,'#10 +
    '      And burbled as it came!'#10 +
    #10 +
    'One, two! One, two! And through and through'#10 +
    '      The vorpal blade went snicker-snack!'#10 +
    'He left it dead, and with its head'#10 +
    '      He went galumphing back.'#10 +
    #10 +
    '"And hast thou slain the Jabberwock?'#10 +
    '      Come to my arms, my beamish boy!'#10 +
    'O frabjous day! Callooh! Callay!"'#10 +
    '      He chortled in his joy.'#10 +
    #10 +
    '''Twas brillig, and the slithy toves'#10 +
    '      Did gyre and gimble in the wabe:'#10 +
    'All mimsy were the borogoves,'#10 +
    '      And the mome raths outgrabe.';


  procedure FreeLines(appstate: pointer);
  var
    app: PAppstate absolute appstate;
    i: integer;
  begin
    with app^ do begin
      if (rows > 0) and (cols > 0) then begin
        for i := 0 to rows - 1 do begin
          SDL_Free(Lines[i]^.Text);
          SDL_Free(Lines[i]);
        end;
        SDL_Free(Lines);
        Lines := nil;
      end;

      SDL_Free(monkey_chars.Text);
      monkey_chars.Text := nil;
    end;
  end;

  procedure OnWindowSizeChanged(appstate: pointer);
  var
    app: PAppstate absolute appstate;
    w, h: integer;
    i: integer;
  begin
    with app^ do begin
      if not SDL_GetCurrentRenderOutputSize(renderer, @w, @h) then begin
        Exit;
      end;

      FreeLines(app);

      row := 0;
      rows := (h div SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE) - 4;
      cols := (w div SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE);

      if (rows > 0) and (cols > 0) then begin
        Lines := PPLine(SDL_malloc(rows * SizeOf(PLine)));
        if Lines <> nil then begin
          for i := 0 to rows - 1 do begin
            Lines[i] := PLine(SDL_malloc(SizeOf(TLine)));
            if Lines[i] = nil then begin
              FreeLines(app);
              Break;
            end;

            Lines[i]^.Text := PUint32(SDL_malloc(cols * SizeOf(uint32)));
            if Lines[i]^.Text = nil then begin
              FreeLines(app);
              Break;
            end;

            Lines[i]^.length := 0;
          end;
        end;

        monkey_chars.Text := PUint32(SDL_malloc(cols * SizeOf(uint32)));
        if monkey_chars.Text <> nil then begin
          for i := 0 to cols - 1 do begin
            monkey_chars.Text[i] := Ord(' ');
          end;

          monkey_chars.length := cols;
        end;
      end;
    end;
  end;



  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    arg: integer = 1;
    fileName: pansichar;
    size: Tsize_t;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    app^.monkeys := 100;
    appstate^ := app;

    SDL_SetAppMetadata('Infinite Monkeys', '1.0', 'com.example.infinite-monkeys');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;
    SDL_SetRenderVSync(app^.renderer, 1);

    if (argv[arg] <> nil) and (SDL_strcmp(argv[arg], '--monkeys') = 0) then  begin
      Inc(arg);
      if argv[arg] <> nil then begin
        app^.monkeys := SDL_atoi(argv[arg]);
        Inc(arg);
      end else begin
        SDL_Log('Usage: %s [--monkeys N] [file.txt]', argv[0]);
        Exit(SDL_APP_FAILURE);
      end;
    end;

    if argv[arg] <> nil then begin
      fileName := argv[arg];
      app^.Text := pansichar(SDL_LoadFile(fileName, @size));
      if app^.Text = nil then begin
        SDL_Log('Couldn''t open %s: %s', fileName, SDL_GetError());
        Exit(SDL_APP_FAILURE);
      end;
      app^.end_ := app^.Text + size;
    end else begin
      app^.Text := SDL_strdup(default_text);
      app^.end_ := app^.Text + SDL_strlen(app^.Text);
    end;

    app^.progress := app^.Text;
    SDL_GetCurrentTime(@app^.start_time);
    OnWindowSizeChanged(app);

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
    SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED: begin
      OnWindowSizeChanged(app);
    end;
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
