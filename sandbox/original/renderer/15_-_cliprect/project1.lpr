program project1;

uses
  SDL3;

const
  WINDOW_WIDTH = 640;
  WINDOW_HEIGHT = 480;
  CLIPRECT_SIZE = 250;
  CLIPRECT_SPEED = 200;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    texture: PSDL_Texture;
    cliprect_position: TSDL_FPoint;
    cliprect_direction: TSDL_FPoint;
    last_time: uint64;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    bmp_path: pansichar;
    surface: PSDL_Surface;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Clipping Rectangle', '1.0', 'com.example.renderer-cliprect');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.cliprect_direction.x := 1.0;
    app^.cliprect_direction.y := 1.0;

    app^.last_time := SDL_GetTicks;

    SDL_asprintf(@bmp_path, '%s/../../media/sample.bmp', SDL_GetBasePath);
    surface := SDL_LoadBMP(bmp_path);
    if surface = nil then begin
      SDL_Log('Couldn''t load bitmap: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;
    SDL_free(bmp_path);

    app^.texture := SDL_CreateTextureFromSurface(app^.renderer, surface);
    if app^.texture = nil then begin
      SDL_Log('Couldn''t create static texture: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_DestroySurface(surface);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    now: uint64;
    cliprect: TSDL_Rect;
    elapsed, distance: single;
  begin
    cliprect.x := SDL_lroundf(app^.cliprect_position.x);
    cliprect.y := SDL_lroundf(app^.cliprect_position.y);
    cliprect.w := CLIPRECT_SIZE;
    cliprect.h := CLIPRECT_SIZE;
    now := SDL_GetTicks;

    elapsed := ((now - app^.last_time)) / 1000.0;
    distance := elapsed * CLIPRECT_SPEED;
    app^.cliprect_position.x += distance * app^.cliprect_direction.x;
    if app^.cliprect_position.x < 0.0 then begin
      app^.cliprect_position.x := 0.0;
      app^.cliprect_direction.x := 1.0;
    end else if app^.cliprect_position.x >= (WINDOW_WIDTH - CLIPRECT_SIZE) then begin
      app^.cliprect_position.x := (WINDOW_WIDTH - CLIPRECT_SIZE) - 1;
      app^.cliprect_direction.x := -1.0;
    end;

    app^.cliprect_position.y += distance * app^.cliprect_direction.y;
    if app^.cliprect_position.y < 0.0 then begin
      app^.cliprect_position.y := 0.0;
      app^.cliprect_direction.y := 1.0;
    end else if app^.cliprect_position.y >= (WINDOW_HEIGHT - CLIPRECT_SIZE) then begin
      app^.cliprect_position.y := (WINDOW_HEIGHT - CLIPRECT_SIZE) - 1;
      app^.cliprect_direction.y := -1.0;
    end;
    SDL_SetRenderClipRect(app^.renderer, @cliprect);

    app^.last_time := now;

    SDL_SetRenderDrawColor(app^.renderer, 33, 33, 33, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    SDL_RenderTexture(app^.renderer, app^.texture, nil, nil);

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
    SDL_DestroyTexture(app^.texture);
    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
