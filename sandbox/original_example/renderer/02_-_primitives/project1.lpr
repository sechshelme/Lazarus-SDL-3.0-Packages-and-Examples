program project1;

uses
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    points: array[0..499] of TSDL_FPoint;
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

    SDL_SetAppMetadata('Example Renderer Primitives', '1.0', 'com.example.renderer-primitives');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    for i := 0 to Length(app^.points) - 1 do begin
      app^.points[i].x := (SDL_randf * 440.0) + 100.0;
      app^.points[i].y := (SDL_randf * 280.0) + 100.0;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    rect: TSDL_FRect = (items: (100, 100, 440, 280));
  begin
    SDL_SetRenderDrawColor(app^.renderer, 33, 33, 33, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(app^.renderer, @rect);

    SDL_SetRenderDrawColor(app^.renderer, 255, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderPoints(app^.renderer, app^.points, Length(app^.points));

    SDL_SetRenderDrawColor(app^.renderer, 0, 255, 0, SDL_ALPHA_OPAQUE);
    rect.x += 30;
    rect.y += 30;
    rect.w -= 60;
    rect.h -= 60;
    SDL_RenderRect(app^.renderer, @rect);

    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderLine(app^.renderer, 0, 0, 640, 480);
    SDL_RenderLine(app^.renderer, 0, 480, 640, 0);

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
