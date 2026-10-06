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
    if (app^.rows > 0) and (app^.cols > 0) then begin
      for i := 0 to app^.rows - 1 do begin
        SDL_Free(app^.Lines[i]^.Text);
        SDL_Free(app^.Lines[i]);
      end;
      SDL_Free(app^.Lines);
      app^.Lines := nil;
    end;

    SDL_Free(app^.monkey_chars.Text);
    app^.monkey_chars.Text := nil;
  end;

  procedure OnWindowSizeChanged(appstate: pointer);
  var
    app: PAppstate absolute appstate;
    w, h: integer;
    i: integer;
  begin
    if not SDL_GetCurrentRenderOutputSize(app^.renderer, @w, @h) then begin
      Exit;
    end;

    FreeLines(app);

    app^.row := 0;
    app^.rows := (h div SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE) - 4;
    app^.cols := (w div SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE);

    if (app^.rows > 0) and (app^.cols > 0) then begin
      app^.Lines := PPLine(SDL_malloc(app^.rows * SizeOf(PLine)));
      if app^.Lines <> nil then begin
        for i := 0 to app^.rows - 1 do begin
          app^.Lines[i] := PLine(SDL_malloc(SizeOf(TLine)));
          if app^.Lines[i] = nil then begin
            FreeLines(app);
            Break;
          end;

          app^.Lines[i]^.Text := PUint32(SDL_malloc(app^.cols * SizeOf(uint32)));
          if app^.Lines[i]^.Text = nil then begin
            FreeLines(app);
            Break;
          end;

          app^.Lines[i]^.length := 0;
        end;
      end;

      app^.monkey_chars.Text := PUint32(SDL_malloc(app^.cols * SizeOf(uint32)));
      if app^.monkey_chars.Text <> nil then begin
        for i := 0 to app^.cols - 1 do begin
          app^.monkey_chars.Text[i] := Ord(' ');
        end;

        app^.monkey_chars.length := app^.cols;
      end;
    end;
  end;

  procedure DisplayLine(appstate: pointer; x, y: single; line: PLine);
  var
    app: PAppstate absolute appstate;
    utf8: pchar;
    spot: pchar;
    i: integer;
  begin
    utf8 := SDL_malloc(line^.length * 4 + 1);
    if utf8 <> nil then  begin
      spot := utf8;

      for i := 0 to line^.length - 1 do begin
        spot := SDL_UCS4ToUTF8(line^.Text[i], spot);
      end;
      spot^ := #0;

      SDL_RenderDebugText(app^.renderer, x, y, utf8);
      SDL_free(utf8);
    end;
  end;

  function CanMonkeyType(ch: uint32): boolean;
  var
    modstate: TSDL_Keymod;
    scancode: TSDL_Scancode;
  begin
    scancode := SDL_GetScancodeFromKey(ch, @modstate);
    if (scancode < MIN_MONKEY_SCANCODE) or (scancode > MAX_MONKEY_SCANCODE) then begin
      Exit(False);
    end;

    if (modstate and not SDL_KMOD_SHIFT) <> 0 then begin
      Exit(False);
    end;

    Result := True;
  end;

  procedure AdvanceRow(appstate: pointer);
  var
    app: PAppstate absolute appstate;
    line: PLine;
  begin
    Inc(app^.row);
    line := app^.Lines[app^.row mod app^.rows];
    line^.length := 0;
  end;

  procedure AddMonkeyChar(appstate: pointer; monkey: integer; ch: uint32);
  var
    app: PAppstate absolute appstate;
    line: PLine;
  begin
    if (monkey >= 0) and (app^.monkey_chars.Text <> nil) then  begin
      app^.monkey_chars.Text[(monkey mod app^.cols)] := ch;
    end;

    if app^.Lines <> nil then  begin
      if ch = Ord(#10) then begin
        AdvanceRow(app);
      end else begin
        line := app^.Lines[app^.row mod app^.rows];
        line^.Text[line^.length] := ch;
        Inc(line^.length);
        if line^.length = app^.cols then begin
          AdvanceRow(app);
        end;
      end;
    end;

    SDL_StepUTF8(@app^.progress, nil);
  end;

  function GetNextChar(appstate: pointer): uint32;
  var
    app: PAppstate absolute appstate;
    ch: uint32;
    spot: pchar;
  begin
    ch := 0;
    while app^.progress < app^.end_ do begin
      spot := app^.progress;
      ch := SDL_StepUTF8(@spot, nil);
      if CanMonkeyType(ch) then begin
        Break;
      end else begin
        AddMonkeyChar(app, -1, ch);
      end;
    end;
    Result := ch;
  end;

  function MonkeyPlay: uint32;
  var
    Count: integer;
    scancode: TSDL_Scancode;
    modstate: TSDL_Keymod;
  begin
    Count := (MAX_MONKEY_SCANCODE - MIN_MONKEY_SCANCODE + 1);
    scancode := TSDL_Scancode(MIN_MONKEY_SCANCODE + SDL_Rand(Count));
    if SDL_Rand(2) <> 0 then begin
      modstate := SDL_KMOD_SHIFT;
    end else begin
      modstate := 0;
    end;

    Result := SDL_GetKeyFromScancode(scancode, modstate, False);
  end;

  // =========================

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
    i, monkey: integer;
    next_char, ch: uint32;
    x, y: single;
    Caption: pchar;
    now, elapsed: TSDL_Time;
    hours, minutes, seconds, row_offset: integer;
    rect: TSDL_FRect;
    line: PLine;
  begin
    next_char := 0;
    Caption := nil;
    for monkey := 0 to app^.monkeys - 1 do begin
      if next_char = 0 then begin
        next_char := GetNextChar(app);
        if next_char = 0 then begin
          Break;
        end;
      end;

      ch := MonkeyPlay();
      if ch = next_char then begin
        AddMonkeyChar(app, monkey, ch);
        next_char := 0;
      end;
    end;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    x := 0.0;
    y := 0.0;

    if app^.Lines <> nil then begin
      row_offset := app^.row - app^.rows + 1;
      if row_offset < 0 then begin
        row_offset := 0;
      end;

      for i := 0 to app^.rows - 1 do begin
        line := app^.Lines[(row_offset + i) mod app^.rows];
        DisplayLine(app, x, y, line);
        y += SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
      end;

      y := (app^.rows + 1) * SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;

      if app^.progress = app^.end_ then begin
        if app^.end_time = 0 then begin
          SDL_GetCurrentTime(@app^.end_time);
        end;

        now := app^.end_time;
      end else begin
        SDL_GetCurrentTime(@now);
      end;

      elapsed := now - app^.start_time;
      elapsed := elapsed div SDL_NS_PER_SECOND;

      seconds := Trunc(elapsed) mod 60;
      elapsed := elapsed div 60;

      minutes := Trunc(elapsed) mod 60;
      elapsed := elapsed div 60;

      hours := Trunc(elapsed);

      SDL_asprintf(@Caption, 'Monkeys: %d - %dH:%dM:%dS', app^.monkeys, hours, minutes, seconds);

      if Caption <> nil then begin
        SDL_RenderDebugText(app^.renderer, x, y, Caption);
        SDL_free(Caption);
      end;

      y += SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;

      DisplayLine(app, x, y, @app^.monkey_chars);
      y += SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;
    end;

    SDL_SetRenderDrawColor(app^.renderer, 0, 255, 0, SDL_ALPHA_OPAQUE);
    rect.x := x;
    rect.y := y;
    rect.w := ((app^.progress - app^.Text) / (app^.end_ - app^.Text)) * (app^.cols * SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE);
    rect.h := SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;

    SDL_RenderFillRect(app^.renderer, @rect);

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
    FreeLines(app);
    SDL_free(app^.Text);
    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
