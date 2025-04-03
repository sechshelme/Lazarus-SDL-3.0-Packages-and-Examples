program project1;

uses
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    stream: PSDL_AudioStream;
    wav_data:PUInt8;
    wav_data_len:UInt32;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    spec: TSDL_AudioSpec;
    wav_path: PAnsiChar=nil;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Audio Simple Playback', '1.0', 'com.example.audio-simple-playback');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_AUDIO) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_asprintf(@wav_path, '%s/../../media/sample.wav', SDL_GetBasePath);
    if not SDL_LoadWAV(wav_path, @spec, @app^.wav_data, @app^.wav_data_len) then begin
        SDL_Log('Couldn''t load .wav file: %s', SDL_GetError);
        Exit(SDL_APP_FAILURE);
    end;

    app^.stream := SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, @spec, nil, nil);
    if app^.stream = nil then begin
      SDL_Log('Couldn''t create audio stream: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_ResumeAudioStreamDevice(app^.stream);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    if SDL_GetAudioStreamQueued(app^.stream) < app^.wav_data_len then begin
      SDL_PutAudioStreamData(app^.stream, app^.wav_data, app^.wav_data_len);
    end;

    SDL_RenderClear(app^.renderer);
    SDL_RenderPresent(app^.renderer);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    if event^._type = SDL_EVENT_QUIT then begin
      Exit(SDL_APP_SUCCESS);
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
