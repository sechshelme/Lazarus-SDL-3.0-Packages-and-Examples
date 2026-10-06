program project1;

uses
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    stream: PSDL_AudioStream;
    current_sine_sample: integer;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    spec: TSDL_AudioSpec;
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

    spec.channels := 1;
    spec.format := SDL_AUDIO_F32;
    spec.freq := 8000;

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
    samples: array [0..512 - 1] of single;
    freq, i: integer;
    phase: single;
  const
    minimum_audio:Integer = (8000 * SizeOf(Single)) div 2;
  begin
    if SDL_GetAudioStreamQueued(app^.stream) < minimum_audio then begin
      for i := 0 to Length(samples) - 1 do begin
        freq := 440;
        phase := app^.current_sine_sample * freq / 8000.0;
        samples[i] := SDL_sinf(phase * 2 * SDL_PI_F);
        Inc(app^.current_sine_sample);
      end;

      app^.current_sine_sample := app^.current_sine_sample mod 8000;
      SDL_PutAudioStreamData(app^.stream, @samples, SizeOf(samples));
    end;

    SDL_RenderClear(app^.renderer);
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
