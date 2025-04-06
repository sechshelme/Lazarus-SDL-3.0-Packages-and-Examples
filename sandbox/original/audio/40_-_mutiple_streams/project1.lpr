program project1;

uses
  SDL3;

type
  TSound = record
    wav_data: PUInt8;
    wav_data_len: uint32;
    stream: PSDL_AudioStream;
  end;
  PSound = ^TSound;

  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    audio_device: TSDL_AudioDeviceID;
    sounds: array[0..1] of TSound;
  end;
  PAppState = ^TAppState;

  function initSound(app: PAppState; fname: pchar; sound: PSound): boolean;
  var
    wav_path: pansichar;
    spec: TSDL_AudioSpec;
  begin
    Result := False;
    SDL_asprintf(@wav_path, '%s/../../media/%s', SDL_GetBasePath, fname);
    if not SDL_LoadWAV(wav_path, @spec, @sound^.wav_data, @sound^.wav_data_len) then begin
      SDL_Log('Couldn''t load .wav file: %s', SDL_GetError);
      Exit(False);
    end;

    sound^.stream := SDL_CreateAudioStream(@spec, nil);
    if sound^.stream = nil then begin
      SDL_Log('Couldn''t create audio stream: %s', SDL_GetError);
    end else if not SDL_BindAudioStream(app^.audio_device, sound^.stream) then begin
      SDL_Log('Failed to bind ''%s'' stream to device: %s', fname, SDL_GetError);
    end else begin
      Result := True;
    end;

    SDL_free(wav_path);
  end;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    spec: TSDL_AudioSpec;
    wav_path: pansichar = nil;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Audio Multiple Streams', '1.0', 'com.example.audio-multiple-streams');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_AUDIO) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.audio_device := SDL_OpenAudioDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, nil);
    if app^.audio_device = 0 then begin
      SDL_Log('Couldn''t open audio device: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not initSound(app, 'sample.wav', @app^.sounds[0]) then begin
      Exit(SDL_APP_FAILURE);
    end else if not initSound(app, 'sword.wav', @app^.sounds[1]) then begin
      Exit(SDL_APP_FAILURE);
    end else begin
      Exit(SDL_APP_CONTINUE);
    end;
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    i: integer;
  begin
    for i := 0 to Length(app^.sounds) - 1 do begin
      if SDL_GetAudioStreamQueued(app^.sounds[i].stream) < app^.sounds[i].wav_data_len then begin
        SDL_PutAudioStreamData(app^.sounds[i].stream, app^.sounds[i].wav_data, app^.sounds[i].wav_data_len);
      end;
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
