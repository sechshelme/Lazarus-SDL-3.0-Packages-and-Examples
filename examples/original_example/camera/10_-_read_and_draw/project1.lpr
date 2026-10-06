program project1;

uses
  SDL3;


type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    camera: PSDL_Camera;
    texture: PSDL_Texture;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    devcount: longint = 0;
    devices: PSDL_CameraID;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Camera Read and Draw', '1.0', 'com.example.camera-read-and-draw');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    devices := SDL_GetCameras(@devcount);
    if devices = nil then begin
      SDL_Log('Couldn''t enumerate camera devices: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end else if devcount = 0 then begin
      SDL_Log('Couldn''t find any camera devices! Please connect a camera and try again.');
      Exit(SDL_APP_FAILURE);
    end;

    app^.camera := SDL_OpenCamera(devices[0], nil);
    SDL_free(devices);
    if app^.camera = nil then begin
      SDL_Log('Couldn''t open camera: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    timestampNS: uint64 = 0;
    frame: PSDL_Surface;
  begin
    frame := SDL_AcquireCameraFrame(app^.camera, @timestampNS);

    if frame <> nil then begin
      if app^.texture = nil then begin
        SDL_SetWindowSize(app^.window, frame^.w, frame^.h);
        app^.texture := SDL_CreateTexture(app^.renderer, frame^.format, SDL_TEXTUREACCESS_STREAMING, frame^.w, frame^.h);
      end;

      if app^.texture <> nil then  begin
        SDL_UpdateTexture(app^.texture, nil, frame^.pixels, frame^.pitch);
      end;

      SDL_ReleaseCameraFrame(app^.camera, frame);
    end;

    SDL_SetRenderDrawColor(app^.renderer, $99, $99, $99, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);
    if app^.texture <> nil then begin
      SDL_RenderTexture(app^.renderer, app^.texture, nil, nil);
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
      SDL_EVENT_CAMERA_DEVICE_APPROVED: begin
        SDL_Log('Camera use approved by user!');
      end;
      SDL_EVENT_CAMERA_DEVICE_DENIED: begin
        SDL_Log('Camera use denied by user!');
        Exit(SDL_APP_FAILURE);
      end;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  procedure AppQuit(appstate: pointer; Result: TSDL_AppResult); cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    SDL_CloseCamera(app^.camera);
    SDL_DestroyTexture(app^.texture);

    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
