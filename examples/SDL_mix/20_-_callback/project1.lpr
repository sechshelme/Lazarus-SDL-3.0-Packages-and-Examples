program project1;

uses
  SDL3,
  SDL3_mixer;

type
  TAppState = record
    done: boolean;
    spec: TSDL_AudioSpec;
    audiodecoder: PMIX_AudioDecoder;
  end;
  PAppState = ^TAppState;

  procedure AudioDeviceCallback(userdata: pointer; stream: PSDL_AudioStream; additional_amount: longint; total_amount: longint); cdecl;
  var
    app: PAppstate absolute userdata;
    buffer: array[0..1023] of uint8;
    needed, br: longint;
  begin
    if additional_amount = 0 then begin
      Exit;
    end;

    while additional_amount > 0 do begin
      needed := SDL_min(Length(buffer), additional_amount);
      br := MIX_DecodeAudio(app^.audiodecoder, @buffer, needed, @app^.spec);
      if br <= 0 then begin
        app^.done := True;
        break;
      end;

      SDL_PutAudioStreamData(stream, @buffer, br);
      additional_amount -= br;
    end;
  end;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    stream: PSDL_AudioStream;
  const
    audiofname = '/home/tux/Schreibtisch/sound/test.mp3';

  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    app^.done := False;

    SDL_SetAppMetadata('Test SDL_mixer MIX_AudioDecoder', '1.0', 'org.libsdl.testmixeraudiodecoder');
    SDL_SetHint(SDL_HINT_MAIN_CALLBACK_RATE, '5');

    if not SDL_Init(SDL_INIT_AUDIO) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end else if not MIX_Init then begin
      SDL_Log('Couldn''t initialize SDL_mixer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.audiodecoder := MIX_CreateAudioDecoder(audiofname, 0);
    if app^.audiodecoder = nil then begin
      SDL_Log('Failed to create audiodecoder for ''%s'': %s', audiofname, SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    stream := SDL_OpenAudioDeviceStream(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, nil, @AudioDeviceCallback, app);
    if stream = nil then begin
      SDL_Log('Failed to open audio device: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_GetAudioStreamFormat(stream, @app^.spec, nil);
    SDL_ResumeAudioStreamDevice(stream);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    if app^.done then  begin
      Exit(SDL_APP_SUCCESS);
    end else begin
      Exit(SDL_APP_CONTINUE);
    end;
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
    MIX_Quit;
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
