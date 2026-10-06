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
    texture: PSDL_Texture;
    texture_width, texture_height: integer;
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

    SDL_SetAppMetadata('Example Renderer Textures', '1.0', 'com.example.renderer-textures');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_asprintf(@bmp_path, '%s/../../media/sample.bmp', SDL_GetBasePath);
    surface := SDL_LoadBMP(bmp_path);
    if surface = nil then begin
      SDL_Log('Couldn''t load bitmap: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_free(bmp_path);

    app^.texture_width := surface^.w;
    app^.texture_height := surface^.h;

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
    direction, scale: single;
    des_rect: TSDL_FRect;
  begin
    now := SDL_GetTicks;

    if (now mod 2000) >= 1000 then begin
      direction := 1.0;
    end else begin
      direction := -1.0;
    end;
    scale := (((integer(now mod 1000)) - 500) / 500.0) * direction;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    des_rect.x := 100.0 * scale;
    des_rect.y := 0.0;
    des_rect.w := app^.texture_width;
    des_rect.h := app^.texture_height;
    SDL_RenderTexture(app^.renderer, app^.texture, nil, @des_rect);

    des_rect.x := (WINDOW_WIDTH - app^.texture_width) / 2;
    des_rect.y := (WINDOW_HEIGHT - app^.texture_height) / 2;
    des_rect.w := app^.texture_width;
    des_rect.h := app^.texture_height;
    SDL_RenderTexture(app^.renderer, app^.texture, nil, @des_rect);

    des_rect.x := (WINDOW_WIDTH - app^.texture_width) - (100.0 * scale);
    des_rect.y := WINDOW_HEIGHT - app^.texture_height;
    des_rect.w := app^.texture_width;
    des_rect.h := app^.texture_height;
    SDL_RenderTexture(app^.renderer, app^.texture, nil, @des_rect);

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
