unit SDL3_mixer;

interface

uses
  SDL3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  const
    {$IFDEF Linux}
    libSDL3_mixer = 'libSDL3_mixer.so';
    {$ENDIF}

    {$IFDEF Windows}
    libSDL3_mixer = 'SDL3_mixer.dll';
    {$ENDIF}

    {$IFDEF Darwin}
    libSDL3_mixer = 'libSDL3_mixer.dylib';
    {$ENDIF}

const
  SDL_MIXER_MAJOR_VERSION = 3;
  SDL_MIXER_MINOR_VERSION = 0;
  SDL_MIXER_PATCHLEVEL = 0;

  MIX_MAJOR_VERSION = SDL_MIXER_MAJOR_VERSION;
  MIX_MINOR_VERSION = SDL_MIXER_MINOR_VERSION;
  MIX_PATCHLEVEL = SDL_MIXER_PATCHLEVEL;

//procedure SDL_MIXER_VERSION(X: PSDL_Version);
//procedure MIX_VERSION(X: PSDL_Version);
function SDL_MIXER_COMPILEDVERSION: longint;

//function Mix_Linked_Version: PSDL_Version; cdecl; external sdl3_mixer_lib;

type
  PMIX_InitFlags = ^TMIX_InitFlags;
  TMIX_InitFlags = longint;

const
  MIX_INIT_FLAC = $00000001;
  MIX_INIT_MOD = $00000002;
  MIX_INIT_MP3 = $00000008;
  MIX_INIT_OGG = $00000010;
  MIX_INIT_MID = $00000020;
  MIX_INIT_OPUS = $00000040;
  MIX_INIT_WAVPACK = $00000080;

function Mix_Init(flags: longint): longint; cdecl; external libSDL3_mixer;
procedure Mix_Quit; cdecl; external libSDL3_mixer;

const
  MIX_CHANNELS = 8;

const
  MIX_DEFAULT_FREQUENCY = 44100;
  MIX_DEFAULT_FORMAT = SDL_AUDIO_S16;
  MIX_DEFAULT_CHANNELS = 2;
//  MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME;

type
  PMix_Chunk = ^TMix_Chunk;

  TMix_Chunk = record
    allocated: longint;
    abuf: PUint8;
    alen: TUint32;
    volume: TUint8;
  end;

  PMix_Fading = ^TMix_Fading;
  TMix_Fading = longint;

const
  MIX_NO_FADING = 0;
  MIX_FADING_OUT = 1;
  MIX_FADING_IN = 2;

type
  PMix_MusicType = ^TMix_MusicType;
  TMix_MusicType = longint;

const
  MUS_NONE = 0;
  MUS_CMD = 1;
  MUS_WAV = 2;
  MUS_MOD = 3;
  MUS_MID = 4;
  MUS_OGG = 5;
  MUS_MP3 = 6;
  MUS_MP3_MAD_UNUSED = 7;
  MUS_FLAC = 8;
  MUS_MODPLUG_UNUSED = 9;
  MUS_OPUS = 10;
  MUS_WAVPACK = 11;
  MUS_GME = 12;

type
  TMix_Music = Pointer;
  PMix_Music = ^TMix_Music;

function Mix_OpenAudio(devid: TSDL_AudioDeviceID; spec: PSDL_AudioSpec): longint; cdecl; external libSDL3_mixer;
procedure Mix_PauseAudio(pause_on: longint); cdecl; external libSDL3_mixer;
function Mix_QuerySpec(frequency: Plongint; format: PUint16; channels: Plongint): longint; cdecl; external libSDL3_mixer;
function Mix_AllocateChannels(numchans: longint): longint; cdecl; external libSDL3_mixer;
function Mix_LoadWAV_IO(src: PSDL_IOStream; closeio: Boolean): PMix_Chunk; cdecl; external libSDL3_mixer;
function Mix_LoadWAV(file_: PAnsiChar): PMix_Chunk; cdecl; external libSDL3_mixer;
function Mix_LoadMUS(file_: PAnsiChar): PMix_Music; cdecl; external libSDL3_mixer;
function Mix_LoadMUS_IO(src: PSDL_IOStream; closeio: Boolean): PMix_Music; cdecl; external libSDL3_mixer;
function Mix_LoadMUSType_IO(src: PSDL_IOStream; _type: TMix_MusicType; closeio: Boolean): PMix_Music; cdecl; external libSDL3_mixer;
function Mix_QuickLoad_WAV(mem: PUint8): PMix_Chunk; cdecl; external libSDL3_mixer;
function Mix_QuickLoad_RAW(mem: PUint8; len: TUint32): PMix_Chunk; cdecl; external libSDL3_mixer;
procedure Mix_FreeChunk(chunk: PMix_Chunk); cdecl; external libSDL3_mixer;
procedure Mix_FreeMusic(music: PMix_Music); cdecl; external libSDL3_mixer;
function Mix_GetNumChunkDecoders: longint; cdecl; external libSDL3_mixer;
function Mix_GetChunkDecoder(index: longint): PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_HasChunkDecoder(Name: PAnsiChar): Boolean; cdecl; external libSDL3_mixer;
function Mix_GetNumMusicDecoders: longint; cdecl; external libSDL3_mixer;
function Mix_GetMusicDecoder(index: longint): PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_HasMusicDecoder(Name: PAnsiChar): Boolean; cdecl; external libSDL3_mixer;
function Mix_GetMusicType(music: PMix_Music): TMix_MusicType; cdecl; external libSDL3_mixer;
function Mix_GetMusicTitle(music: PMix_Music): PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_GetMusicTitleTag(music: PMix_Music): PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_GetMusicArtistTag(music: PMix_Music): PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_GetMusicAlbumTag(music: PMix_Music): PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_GetMusicCopyrightTag(music: PMix_Music): PAnsiChar; cdecl; external libSDL3_mixer;

type
  Tmix_func_proc = procedure(udata: pointer; stream: PUint8; len: longint);

procedure Mix_SetPostMix(mix_func: Tmix_func_proc; arg: pointer); cdecl; external libSDL3_mixer;
procedure Mix_HookMusic(mix_func: Tmix_func_proc; arg: pointer); cdecl; external libSDL3_mixer;

type
  Tmusic_finished_proc = procedure;

procedure Mix_HookMusicFinished(music_finished: Tmusic_finished_proc); cdecl; external libSDL3_mixer;
function Mix_GetMusicHookData: pointer; cdecl; external libSDL3_mixer;

type
  Tchannel_finished_proc = procedure(channel: longint);

procedure Mix_ChannelFinished(channel_finished: Tchannel_finished_proc); cdecl; external libSDL3_mixer;

const
  MIX_CHANNEL_POST = -(2);

type

  TMix_EffectFunc_t = procedure(chan: longint; stream: pointer; len: longint; udata: pointer); cdecl;
  TMix_EffectDone_t = procedure(chan: longint; udata: pointer); cdecl;

function Mix_RegisterEffect(chan: longint; f: TMix_EffectFunc_t; d: TMix_EffectDone_t; arg: pointer): longint; cdecl; external libSDL3_mixer;
function Mix_UnregisterEffect(channel: longint; f: TMix_EffectFunc_t): longint; cdecl; external libSDL3_mixer;
function Mix_UnregisterAllEffects(channel: longint): longint; cdecl; external libSDL3_mixer;

const
  MIX_EFFECTSMAXSPEED = 'MIX_EFFECTSMAXSPEED';

function Mix_SetPanning(channel: longint; left: TUint8; right: TUint8): longint; cdecl; external libSDL3_mixer;
function Mix_SetPosition(channel: longint; angle: TSint16; distance: TUint8): longint; cdecl; external libSDL3_mixer;
function Mix_SetDistance(channel: longint; distance: TUint8): longint; cdecl; external libSDL3_mixer;
function Mix_SetReverseStereo(channel: longint; flip: longint): longint; cdecl; external libSDL3_mixer;
function Mix_ReserveChannels(num: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GroupChannel(which: longint; tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GroupChannels(from: longint; to_: longint; tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GroupAvailable(tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GroupCount(tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GroupOldest(tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GroupNewer(tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_PlayChannel(channel: longint; chunk: PMix_Chunk; loops: longint): longint; cdecl; external libSDL3_mixer;
function Mix_PlayChannelTimed(channel: longint; chunk: PMix_Chunk; loops: longint; ticks: longint): longint; cdecl; external libSDL3_mixer;
function Mix_PlayMusic(music: PMix_Music; loops: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadeInMusic(music: PMix_Music; loops: longint; ms: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadeInMusicPos(music: PMix_Music; loops: longint; ms: longint; position: double): longint; cdecl; external libSDL3_mixer;
function Mix_FadeInChannel(channel: longint; chunk: PMix_Chunk; loops: longint; ms: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadeInChannelTimed(channel: longint; chunk: PMix_Chunk; loops: longint; ms: longint; ticks: longint): longint; cdecl; external libSDL3_mixer;
function Mix_Volume(channel: longint; volume: longint): longint; cdecl; external libSDL3_mixer;
function Mix_VolumeChunk(chunk: PMix_Chunk; volume: longint): longint; cdecl; external libSDL3_mixer;
function Mix_VolumeMusic(volume: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GetMusicVolume(music: PMix_Music): longint; cdecl; external libSDL3_mixer;
function Mix_MasterVolume(volume: longint): longint; cdecl; external libSDL3_mixer;
function Mix_HaltChannel(channel: longint): longint; cdecl; external libSDL3_mixer;
function Mix_HaltGroup(tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_HaltMusic: longint; cdecl; external libSDL3_mixer;
function Mix_ExpireChannel(channel: longint; ticks: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadeOutChannel(which: longint; ms: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadeOutGroup(tag: longint; ms: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadeOutMusic(ms: longint): longint; cdecl; external libSDL3_mixer;
function Mix_FadingMusic: TMix_Fading; cdecl; external libSDL3_mixer;
function Mix_FadingChannel(which: longint): TMix_Fading; cdecl; external libSDL3_mixer;
procedure Mix_Pause(channel: longint); cdecl; external libSDL3_mixer;
function Mix_PauseGroup(tag: longint): longint; cdecl; external libSDL3_mixer;
procedure Mix_Resume(channel: longint); cdecl; external libSDL3_mixer;
function Mix_ResumeGroup(tag: longint): longint; cdecl; external libSDL3_mixer;
function Mix_Paused(channel: longint): longint; cdecl; external libSDL3_mixer;
procedure Mix_PauseMusic; cdecl; external libSDL3_mixer;
procedure Mix_ResumeMusic; cdecl; external libSDL3_mixer;
procedure Mix_RewindMusic; cdecl; external libSDL3_mixer;
function Mix_PausedMusic: longint; cdecl; external libSDL3_mixer;
function Mix_ModMusicJumpToOrder(order: longint): longint; cdecl; external libSDL3_mixer;
function Mix_StartTrack(music: PMix_Music; track: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GetNumTracks(music: PMix_Music): longint; cdecl; external libSDL3_mixer;
function Mix_SetMusicPosition(position: double): longint; cdecl; external libSDL3_mixer;
function Mix_GetMusicPosition(music: PMix_Music): double; cdecl; external libSDL3_mixer;
function Mix_MusicDuration(music: PMix_Music): double; cdecl; external libSDL3_mixer;
function Mix_GetMusicLoopStartTime(music: PMix_Music): double; cdecl; external libSDL3_mixer;
function Mix_GetMusicLoopEndTime(music: PMix_Music): double; cdecl; external libSDL3_mixer;
function Mix_GetMusicLoopLengthTime(music: PMix_Music): double; cdecl; external libSDL3_mixer;
function Mix_Playing(channel: longint): longint; cdecl; external libSDL3_mixer;
function Mix_PlayingMusic: longint; cdecl; external libSDL3_mixer;
function Mix_SetMusicCMD(command: PAnsiChar): longint; cdecl; external libSDL3_mixer;
function Mix_SetSynchroValue(Value: longint): longint; cdecl; external libSDL3_mixer;
function Mix_GetSynchroValue: longint; cdecl; external libSDL3_mixer;
function Mix_SetSoundFonts(paths: PAnsiChar): longint; cdecl; external libSDL3_mixer;
function Mix_GetSoundFonts: PAnsiChar; cdecl; external libSDL3_mixer;

type
  TEachSoundFont_proc = function(para1: PAnsiChar; para2: pointer): longint;

function Mix_EachSoundFont(_function: TEachSoundFont_proc; Data: pointer): longint; cdecl; external libSDL3_mixer;
function Mix_SetTimidityCfg(path: PAnsiChar): longint; cdecl; external libSDL3_mixer;
function Mix_GetTimidityCfg: PAnsiChar; cdecl; external libSDL3_mixer;
function Mix_GetChunk(channel: longint): PMix_Chunk; cdecl; external libSDL3_mixer;
procedure Mix_CloseAudio; cdecl; external libSDL3_mixer;

function Mix_SetError(fmt: PAnsiChar): longint; varargs; cdecl; external libSDL3 Name 'SDL_SetError';
function Mix_GetError: PAnsiChar; cdecl; external libSDL3 Name 'SDL_GetError';
procedure Mix_ClearError; cdecl; external libSDL3 Name 'SDL_ClearError';
procedure Mix_OutOfMemory; cdecl; external libSDL3 Name 'SDL_OutOfMemory';
//function Mix_OutOfMemory: longint;

implementation

function SDL_MIXER_COMPILEDVERSION: longint;
begin
  SDL_MIXER_COMPILEDVERSION := SDL_VERSIONNUM(SDL_MIXER_MAJOR_VERSION, SDL_MIXER_MINOR_VERSION, SDL_MIXER_PATCHLEVEL);
end;

end.
