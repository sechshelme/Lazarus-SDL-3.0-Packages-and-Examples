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

const
  MAX_LEN = 20;
var
  Laufschrift: array of string;

  function Timer_cp(userdata: pointer; timerID: TSDL_TimerID; interval: TUint32): TUint32; cdecl;
  var
    i: integer;
    len, ofs: SizeInt;
  begin
    ClrScr;

    len := Length(Laufschrift);
    ofs := len - MAX_LEN;
    if ofs < 0 then begin
      ofs := 0;
    end;
    for i := len-ofs downto  0  do begin
      WriteLn(Laufschrift[i]);
    end;


    //for i := Length(Laufschrift) - 1 downto 0 do begin
    //  WriteLn(Laufschrift[i]);
    //  if i+MAX_LEN< Length(Laufschrift) then Continue;
    //end;
    //    for i := 0 to Length(Laufschrift) - 1 do begin
    //      WriteLn(Laufschrift[i]);
    //    end;
    if Length(Laufschrift) > 0 then  begin
      Delete(Laufschrift, 0, 1);
    end;

    if Length(Laufschrift) < MAX_LEN then  begin
      Laufschrift += ['-'];
    end;

    Result := interval;
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

    SDL_AddTimer(300, @Timer_cp, app);

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
    s: string;
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
