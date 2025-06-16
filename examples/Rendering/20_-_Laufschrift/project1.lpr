program project1;

{$modeswitch arrayoperators on}

uses
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    TextLength: SizeInt;
    yPixelOffset: TUint64;
    marqueeText: array of string;
  end;
  PAppState = ^TAppState;


  function timer_cp(userdata: pointer; timerID: TSDL_TimerID; interval: TUint32): TUint32; cdecl;
  var
    app: PAppstate absolute userdata;
  const
    Counter: integer = 0;
  begin
    app^.yPixelOffset := Counter mod 12 - 12;
    if Counter mod 12 = 0 then begin
      if Length(app^.marqueeText) > 0 then  begin
        Delete(app^.marqueeText, 0, 1);
      end;

      if Length(app^.marqueeText) <= app^.TextLength then  begin
        app^.marqueeText += [''];
      end;
    end;
    Inc(Counter);

    Result := interval;
  end;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    w, h: longint;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Clear', '1.0', 'com.example.renderer-clear');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, SDL_WINDOW_RESIZABLE, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_GetWindowSize(app^.window, @w, @h);
    app^.TextLength := h div 12;
    SetLength(app^.marqueeText, app^.TextLength);

    SDL_AddTimer(10, @timer_cp, app);

    Exit(SDL_APP_CONTINUE);
  end;

  procedure printData(app: PAppstate);
  var
    i: integer;
    len, ofs, y: SizeInt;
    w, h: longint;
    alpha: single;
    x: extended;
  begin
    len := Length(app^.marqueeText);
    ofs := len - app^.TextLength + 1;
    if ofs < 0 then begin
      ofs := 0;
    end;
    SDL_GetWindowSize(app^.window, @w, @h);

    for i := len - ofs downto 0 do begin
      y := 1 + (app^.TextLength - i) * 12 + app^.yPixelOffset;
      x := (w - Length(app^.marqueeText[i]) * 12) / 2;
      alpha := 1 - 1 / h * y;
      SDL_SetRenderDrawColorFloat(app^.renderer, 1.0, 1.0, 1.0, alpha);
      SDL_RenderDebugText(app^.renderer, x, y, PChar(app^.marqueeText[i]));
    end;
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    now: double;
    red, green, blue: double;
  begin
    now := SDL_GetTicks / 1000.0;

    red := 0.5 + 0.5 * SDL_sin(now);
    green := 0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 2 / 3);
    blue := 0.5 + 0.5 * SDL_sin(now + SDL_PI_D * 4 / 3);

    SDL_SetRenderDrawColorFloat(app^.renderer, red, green, blue, SDL_ALPHA_OPAQUE_FLOAT);
    SDL_RenderClear(app^.renderer);

    printData(app);

    SDL_RenderPresent(app^.renderer);
    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    s: string;
    w, h: longint;
  const
    index: integer = 0;
  begin
    WriteStr(s, index, '.   Ev: ', event^._type);
    app^.marqueeText += [s];
    Inc(index);

    case event^._type of
      SDL_EVENT_QUIT: begin
        Exit(SDL_APP_SUCCESS);
      end;
      SDL_EVENT_WINDOW_RESIZED: begin
        SDL_GetWindowSize(app^.window, @w, @h);
        app^.TextLength := h div 12;
        SetLength(app^.marqueeText, app^.TextLength);
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
