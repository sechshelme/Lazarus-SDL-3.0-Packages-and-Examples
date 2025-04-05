program project1;

uses
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    i: integer;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Lines', '1.0', 'com.example.renderer-lines');

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
    rect: TSDL_FRect;
    i: integer;
  const
    size = 30.0;
    x = 320.0;
    y = 95.0 - (size / 2);
    line_points: array of TSDL_FPoint = (
      (items: (100, 354)), (items: (220, 230)), (items: (140, 230)),
      (items: (320, 100)), (items: (500, 230)), (items: (420, 230)),
      (items: (540, 354)), (items: (400, 354)), (items: (100, 354)));

  begin
    SDL_SetRenderDrawColor(app^.renderer, 100, 100, 100, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    SDL_SetRenderDrawColor(app^.renderer, 127, 49, 32, SDL_ALPHA_OPAQUE);
    SDL_RenderLine(app^.renderer, 240, 450, 400, 450);
    SDL_RenderLine(app^.renderer, 240, 356, 400, 356);
    SDL_RenderLine(app^.renderer, 240, 356, 240, 450);
    SDL_RenderLine(app^.renderer, 400, 356, 400, 450);

    SDL_SetRenderDrawColor(app^.renderer, 0, 255, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderLines(app^.renderer, PSDL_FPoint(line_points), Length(line_points));

    for i := 0 to 359 do begin
      SDL_SetRenderDrawColor(app^.renderer, SDL_rand(256), SDL_rand(256), SDL_rand(256), SDL_ALPHA_OPAQUE);
      SDL_RenderLine(app^.renderer, x, y, x + SDL_sinf(i) * size, y + SDL_cosf(i) * size);
    end;

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
