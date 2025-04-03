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

  procedure FeedTheAudioStreamMore(userdata: pointer; stream: PSDL_AudioStream; additional_amount: longint; total_amount: longint); cdecl;
  var
    app: PAppstate absolute userdata;
    samples: array [0..128 - 1] of single;
    freq, i: integer;
    phase: single;
    total: longint;
  begin
    additional_amount := additional_amount div SizeOf(single);

    while additional_amount > 0 do begin
      total := SDL_min(additional_amount, Length(samples));
      for i := 0 to total - 1 do begin
        freq := 440;
        phase := app^.current_sine_sample * freq / 8000.0;
        samples[i] := SDL_sinf(phase * 2 * SDL_PI_F);
        Inc(app^.current_sine_sample);
      end;

      app^.current_sine_sample := app^.current_sine_sample mod 8000;
      SDL_PutAudioStreamData(stream, @samples, total * SizeOf(single));
      additional_amount := additional_amount - total;
    end;
  end;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    spec: TSDL_AudioSpec;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Audio Simple Playback Callback', '1.0', 'com.example.audio-simple-playback-callback');

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

    app^.stream := SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, @spec, @FeedTheAudioStreamMore, app);
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
