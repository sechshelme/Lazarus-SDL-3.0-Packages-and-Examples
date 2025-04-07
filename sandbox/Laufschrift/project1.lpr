program project1;

{$modeswitch arrayoperators on}

uses
  crt,
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
  end;
  PAppState = ^TAppState;

var
  TextLength: SizeInt = 30;
  Laufschrift: array of string;

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
    TextLength := h div 12;
    SetLength(Laufschrift, TextLength);

    Exit(SDL_APP_CONTINUE);
  end;

  procedure printData(app: PAppstate);
  var
    i: integer;
    len, ofs: SizeInt;
  begin
    SDL_SetRenderDrawColorFloat(app^.renderer, 1.0, 1.0, 1.0, SDL_ALPHA_OPAQUE_FLOAT);

    len := Length(Laufschrift);
    ofs := len - TextLength + 1;
    if ofs < 0 then begin
      ofs := 0;
    end;

    ClrScr;
    for i := len - ofs downto 0 do begin
      GotoXY(5, 2 + TextLength - i);
      WriteLn(TextLength - i - 1, '.    ', Laufschrift[i]);

      SDL_RenderDebugText(app^.renderer, 10, 1 + (TextLength - i) * 12, PChar(Laufschrift[i]));
    end;

    if SDL_GetTicks mod 100 = 0 then begin
      if Length(Laufschrift) > 0 then  begin
        Delete(Laufschrift, 0, 1);
      end;

      if Length(Laufschrift) <= TextLength then  begin
        Laufschrift += ['-'];
      end;
    end;
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
    Laufschrift += [s];
    Inc(index);

    case event^._type of
      SDL_EVENT_QUIT: begin
        Exit(SDL_APP_SUCCESS);
      end;
      SDL_EVENT_WINDOW_RESIZED: begin
        SDL_GetWindowSize(app^.window, @w, @h);
        TextLength := h div 12;
        SetLength(Laufschrift, TextLength);
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
