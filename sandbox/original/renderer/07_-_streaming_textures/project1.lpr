program project1;

uses
  SDL3;

const
  WINDOW_WIDTH = 640;
  WINDOW_HEIGHT = 480;
  TEXTURE_SIZE = 150;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    texture: PSDL_Texture;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Streaming Textures', '1.0', 'com.example.renderer-streaming-textures');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.texture := SDL_CreateTexture(app^.renderer, SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING, TEXTURE_SIZE, TEXTURE_SIZE);
    if app^.texture = nil then begin
      SDL_Log('Couldn''t create static texture: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    now: uint64;
    direction, scale: single;
    dst_rect: TSDL_FRect;
    surface: PSDL_Surface = nil;
    r: TSDL_Rect;
  begin
    now := SDL_GetTicks;

    if (now mod 2000) >= 1000 then begin
      direction := 1.0;
    end else begin
      direction := -1.0;
    end;
    scale := (((integer(now mod 1000)) - 500) / 500.0) * direction;

    if SDL_LockTextureToSurface(app^.texture, nil, @surface) then begin
      SDL_FillSurfaceRect(surface, nil, SDL_MapRGB(SDL_GetPixelFormatDetails(surface^.format), nil, 0, 0, 0));
      r.w := TEXTURE_SIZE;
      r.h := TEXTURE_SIZE div 10;
      r.x := 0;
      r.y := Round((TEXTURE_SIZE - r.h) * ((scale + 1.0) / 2.0));
      SDL_FillSurfaceRect(surface, @r, SDL_MapRGB(SDL_GetPixelFormatDetails(surface^.format), nil, 0, 255, 0));
      SDL_UnlockTexture(app^.texture);
    end;

    SDL_SetRenderDrawColor(app^.renderer, 66, 66, 66, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    dst_rect.x := (WINDOW_WIDTH - TEXTURE_SIZE) / 2.0;
    dst_rect.y := (WINDOW_HEIGHT - TEXTURE_SIZE) / 2.0;
    dst_rect.w := TEXTURE_SIZE;
    dst_rect.h := TEXTURE_SIZE;
    SDL_RenderTexture(app^.renderer, app^.texture, nil, @dst_rect);

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
