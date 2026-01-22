program project1;

uses
  SDL3,
  SDL3_mixer;

type
  TAppState = record
    mixer: PMIX_Mixer;
    track: PMIX_Track;
    audio: PMIX_Audio;
  end;
  PAppState = ^TAppState;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
  const
    audiofname = '/home/tux/Schreibtisch/sound/test.mp3';

  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetHint(SDL_HINT_MAIN_CALLBACK_RATE, '5');

    if not MIX_Init then begin
      SDL_Log('Couldn''t initialize SDL_mixer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.mixer := MIX_CreateMixerDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, nil);
    if app^.mixer = nil then begin
      SDL_Log('Couldn''t create mixer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.audio := MIX_LoadAudio(app^.mixer, audiofname, True);
    if app^.audio = nil then begin
      SDL_Log('Couldn''t load audio from %s: %s', audiofname, SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    app^.track := MIX_CreateTrack(app^.mixer);
    if app^.track = nil then begin
      SDL_Log('Couldn''t create track: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    MIX_SetTrackAudio(app^.track, app^.audio);
    MIX_PlayTrack(app^.track, 0);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    if MIX_TrackPlaying(app^.track) then  begin
      Exit(SDL_APP_CONTINUE);
    end else begin
      Exit(SDL_APP_SUCCESS);
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
