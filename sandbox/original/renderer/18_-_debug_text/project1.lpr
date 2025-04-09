program project1;

uses
  SDL3;

const
  WINDOW_WIDTH = 640;
  WINDOW_HEIGHT = 480;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
  end;
  PAppState = ^TAppState;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Debug Texture', '1.0', 'com.example.renderer-debug-text');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    charsize: integer;
  begin
    charsize := SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderDebugText(app^.renderer, 272, 100, 'Hello world!');
    SDL_RenderDebugText(app^.renderer, 224, 150, 'This is some debug text.');

    SDL_SetRenderDrawColor(app^.renderer, 51, 102, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderDebugText(app^.renderer, 184, 200, 'You can do it in different colors.');
    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);

    SDL_SetRenderScale(app^.renderer, 4.0, 4.0);
    SDL_RenderDebugText(app^.renderer, 14, 65, 'It can be scaled.');
    SDL_SetRenderScale(app^.renderer, 1.0, 1.0);
    SDL_RenderDebugText(app^.renderer, 64, 350, 'This only does ASCII chars. So this laughing emoji won''t draw: 🤣');

    SDL_RenderDebugTextFormat(app^.renderer, (WINDOW_WIDTH - (charsize * 46) / 2), 400, '(This program has been running for %llu seconds.)', SDL_GetTicks / 1000);

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
