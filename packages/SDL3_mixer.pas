unit SDL3_mixer;

interface

uses
  SDL3;

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

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PMIX_Mixer = type Pointer;
  PMIX_Audio = type Pointer;
  PMIX_Track = type Pointer;
  PPMIX_Track = ^PMIX_Track;
  PMIX_Group = type Pointer;

const
  SDL_MIXER_MAJOR_VERSION = 3;
  SDL_MIXER_MINOR_VERSION = 1;
  SDL_MIXER_MICRO_VERSION = 2;

function SDL_MIXER_VERSION: longint;
function SDL_MIXER_VERSION_ATLEAST(X, Y, Z: longint): boolean;

function MIX_Version: longint; cdecl; external libSDL3_mixer;
function MIX_Init: Tbool; cdecl; external libSDL3_mixer;
procedure MIX_Quit; cdecl; external libSDL3_mixer;
function MIX_GetNumAudioDecoders: longint; cdecl; external libSDL3_mixer;
function MIX_GetAudioDecoder(index: longint): pchar; cdecl; external libSDL3_mixer;
function MIX_CreateMixerDevice(devid: TSDL_AudioDeviceID; spec: PSDL_AudioSpec): PMIX_Mixer; cdecl; external libSDL3_mixer;
function MIX_CreateMixer(spec: PSDL_AudioSpec): PMIX_Mixer; cdecl; external libSDL3_mixer;
procedure MIX_DestroyMixer(mixer: PMIX_Mixer); cdecl; external libSDL3_mixer;
function MIX_GetMixerProperties(mixer: PMIX_Mixer): TSDL_PropertiesID; cdecl; external libSDL3_mixer;

const
  MIX_PROP_MIXER_DEVICE_NUMBER = 'SDL_mixer.mixer.device';

function MIX_GetMixerFormat(mixer: PMIX_Mixer; spec: PSDL_AudioSpec): Tbool; cdecl; external libSDL3_mixer;
function MIX_LoadAudio_IO(mixer: PMIX_Mixer; io: PSDL_IOStream; predecode: Tbool; closeio: Tbool): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_LoadAudio(mixer: PMIX_Mixer; path: pchar; predecode: Tbool): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_LoadAudioWithProperties(props: TSDL_PropertiesID): PMIX_Audio; cdecl; external libSDL3_mixer;

const
  MIX_PROP_AUDIO_LOAD_IOSTREAM_POINTER = 'SDL_mixer.audio.load.iostream';
  MIX_PROP_AUDIO_LOAD_CLOSEIO_BOOLEAN = 'SDL_mixer.audio.load.closeio';
  MIX_PROP_AUDIO_LOAD_PREDECODE_BOOLEAN = 'SDL_mixer.audio.load.predecode';
  MIX_PROP_AUDIO_LOAD_PREFERRED_MIXER_POINTER = 'SDL_mixer.audio.load.preferred_mixer';
  MIX_PROP_AUDIO_LOAD_SKIP_METADATA_TAGS_BOOLEAN = 'SDL_mixer.audio.load.skip_metadata_tags';
  MIX_PROP_AUDIO_DECODER_STRING = 'SDL_mixer.audio.decoder';

function MIX_LoadRawAudio_IO(mixer: PMIX_Mixer; io: PSDL_IOStream; spec: PSDL_AudioSpec; closeio: Tbool): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_LoadRawAudio(mixer: PMIX_Mixer; data: pointer; datalen: Tsize_t; spec: PSDL_AudioSpec): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_LoadRawAudioNoCopy(mixer: PMIX_Mixer; data: pointer; datalen: Tsize_t; spec: PSDL_AudioSpec; free_when_done: Tbool): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_CreateSineWaveAudio(mixer: PMIX_Mixer; hz: longint; amplitude: single; ms: TSint64): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_GetAudioProperties(audio: PMIX_Audio): TSDL_PropertiesID; cdecl; external libSDL3_mixer;

const
  MIX_PROP_METADATA_TITLE_STRING = 'SDL_mixer.metadata.title';
  MIX_PROP_METADATA_ARTIST_STRING = 'SDL_mixer.metadata.artist';
  MIX_PROP_METADATA_ALBUM_STRING = 'SDL_mixer.metadata.album';
  MIX_PROP_METADATA_COPYRIGHT_STRING = 'SDL_mixer.metadata.copyright';
  MIX_PROP_METADATA_TRACK_NUMBER = 'SDL_mixer.metadata.track';
  MIX_PROP_METADATA_TOTAL_TRACKS_NUMBER = 'SDL_mixer.metadata.total_tracks';
  MIX_PROP_METADATA_YEAR_NUMBER = 'SDL_mixer.metadata.year';
  MIX_PROP_METADATA_DURATION_FRAMES_NUMBER = 'SDL_mixer.metadata.duration_frames';
  MIX_PROP_METADATA_DURATION_INFINITE_BOOLEAN = 'SDL_mixer.metadata.duration_infinite';

function MIX_GetAudioDuration(audio: PMIX_Audio): TSint64; cdecl; external libSDL3_mixer;

const
  MIX_DURATION_UNKNOWN = -(1);
  MIX_DURATION_INFINITE = -(2);

function MIX_GetAudioFormat(audio: PMIX_Audio; spec: PSDL_AudioSpec): Tbool; cdecl; external libSDL3_mixer;
procedure MIX_DestroyAudio(audio: PMIX_Audio); cdecl; external libSDL3_mixer;
function MIX_CreateTrack(mixer: PMIX_Mixer): PMIX_Track; cdecl; external libSDL3_mixer;
procedure MIX_DestroyTrack(track: PMIX_Track); cdecl; external libSDL3_mixer;
function MIX_GetTrackProperties(track: PMIX_Track): TSDL_PropertiesID; cdecl; external libSDL3_mixer;
function MIX_GetTrackMixer(track: PMIX_Track): PMIX_Mixer; cdecl; external libSDL3_mixer;
function MIX_SetTrackAudio(track: PMIX_Track; audio: PMIX_Audio): Tbool; cdecl; external libSDL3_mixer;
function MIX_SetTrackAudioStream(track: PMIX_Track; stream: PSDL_AudioStream): Tbool; cdecl; external libSDL3_mixer;
function MIX_SetTrackIOStream(track: PMIX_Track; io: PSDL_IOStream; closeio: Tbool): Tbool; cdecl; external libSDL3_mixer;
function MIX_SetTrackRawIOStream(track: PMIX_Track; io: PSDL_IOStream; spec: PSDL_AudioSpec; closeio: Tbool): Tbool; cdecl; external libSDL3_mixer;
function MIX_TagTrack(track: PMIX_Track; tag: pchar): Tbool; cdecl; external libSDL3_mixer;
procedure MIX_UntagTrack(track: PMIX_Track; tag: pchar); cdecl; external libSDL3_mixer;
function MIX_GetTrackTags(track: PMIX_Track; count: Plongint): PPchar; cdecl; external libSDL3_mixer;
function MIX_GetTaggedTracks(mixer: PMIX_Mixer; tag: pchar; count: Plongint): PPMIX_Track; cdecl; external libSDL3_mixer;
function MIX_SetTrackPlaybackPosition(track: PMIX_Track; frames: TSint64): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetTrackPlaybackPosition(track: PMIX_Track): TSint64; cdecl; external libSDL3_mixer;
function MIX_GetTrackFadeFrames(track: PMIX_Track): TSint64; cdecl; external libSDL3_mixer;
function MIX_GetTrackLoops(track: PMIX_Track): longint; cdecl; external libSDL3_mixer;
function MIX_SetTrackLoops(track: PMIX_Track; num_loops: longint): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetTrackAudio(track: PMIX_Track): PMIX_Audio; cdecl; external libSDL3_mixer;
function MIX_GetTrackAudioStream(track: PMIX_Track): PSDL_AudioStream; cdecl; external libSDL3_mixer;
function MIX_GetTrackRemaining(track: PMIX_Track): TSint64; cdecl; external libSDL3_mixer;
function MIX_TrackMSToFrames(track: PMIX_Track; ms: TSint64): TSint64; cdecl; external libSDL3_mixer;
function MIX_TrackFramesToMS(track: PMIX_Track; frames: TSint64): TSint64; cdecl; external libSDL3_mixer;
function MIX_AudioMSToFrames(audio: PMIX_Audio; ms: TSint64): TSint64; cdecl; external libSDL3_mixer;
function MIX_AudioFramesToMS(audio: PMIX_Audio; frames: TSint64): TSint64; cdecl; external libSDL3_mixer;
function MIX_MSToFrames(sample_rate: longint; ms: TSint64): TSint64; cdecl; external libSDL3_mixer;
function MIX_FramesToMS(sample_rate: longint; frames: TSint64): TSint64; cdecl; external libSDL3_mixer;
function MIX_PlayTrack(track: PMIX_Track; options: TSDL_PropertiesID): Tbool; cdecl; external libSDL3_mixer;

const
  MIX_PROP_PLAY_LOOPS_NUMBER = 'SDL_mixer.play.loops';
  MIX_PROP_PLAY_MAX_FRAME_NUMBER = 'SDL_mixer.play.max_frame';
  MIX_PROP_PLAY_MAX_MILLISECONDS_NUMBER = 'SDL_mixer.play.max_milliseconds';
  MIX_PROP_PLAY_START_FRAME_NUMBER = 'SDL_mixer.play.start_frame';
  MIX_PROP_PLAY_START_MILLISECOND_NUMBER = 'SDL_mixer.play.start_millisecond';
  MIX_PROP_PLAY_LOOP_START_FRAME_NUMBER = 'SDL_mixer.play.loop_start_frame';
  MIX_PROP_PLAY_LOOP_START_MILLISECOND_NUMBER = 'SDL_mixer.play.loop_start_millisecond';
  MIX_PROP_PLAY_FADE_IN_FRAMES_NUMBER = 'SDL_mixer.play.fade_in_frames';
  MIX_PROP_PLAY_FADE_IN_MILLISECONDS_NUMBER = 'SDL_mixer.play.fade_in_milliseconds';
  MIX_PROP_PLAY_FADE_IN_START_GAIN_FLOAT = 'SDL_mixer.play.fade_in_start_gain';
  MIX_PROP_PLAY_APPEND_SILENCE_FRAMES_NUMBER = 'SDL_mixer.play.append_silence_frames';
  MIX_PROP_PLAY_APPEND_SILENCE_MILLISECONDS_NUMBER = 'SDL_mixer.play.append_silence_milliseconds';

function MIX_PlayTag(mixer: PMIX_Mixer; tag: pchar; options: TSDL_PropertiesID): Tbool; cdecl; external libSDL3_mixer;
function MIX_PlayAudio(mixer: PMIX_Mixer; audio: PMIX_Audio): Tbool; cdecl; external libSDL3_mixer;
function MIX_StopTrack(track: PMIX_Track; fade_out_frames: TSint64): Tbool; cdecl; external libSDL3_mixer;
function MIX_StopAllTracks(mixer: PMIX_Mixer; fade_out_ms: TSint64): Tbool; cdecl; external libSDL3_mixer;
function MIX_StopTag(mixer: PMIX_Mixer; tag: pchar; fade_out_ms: TSint64): Tbool; cdecl; external libSDL3_mixer;
function MIX_PauseTrack(track: PMIX_Track): Tbool; cdecl; external libSDL3_mixer;
function MIX_PauseAllTracks(mixer: PMIX_Mixer): Tbool; cdecl; external libSDL3_mixer;
function MIX_PauseTag(mixer: PMIX_Mixer; tag: pchar): Tbool; cdecl; external libSDL3_mixer;
function MIX_ResumeTrack(track: PMIX_Track): Tbool; cdecl; external libSDL3_mixer;
function MIX_ResumeAllTracks(mixer: PMIX_Mixer): Tbool; cdecl; external libSDL3_mixer;
function MIX_ResumeTag(mixer: PMIX_Mixer; tag: pchar): Tbool; cdecl; external libSDL3_mixer;
function MIX_TrackPlaying(track: PMIX_Track): Tbool; cdecl; external libSDL3_mixer;
function MIX_TrackPaused(track: PMIX_Track): Tbool; cdecl; external libSDL3_mixer;
function MIX_SetMixerGain(mixer: PMIX_Mixer; gain: single): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetMixerGain(mixer: PMIX_Mixer): single; cdecl; external libSDL3_mixer;
function MIX_SetTrackGain(track: PMIX_Track; gain: single): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetTrackGain(track: PMIX_Track): single; cdecl; external libSDL3_mixer;
function MIX_SetTagGain(mixer: PMIX_Mixer; tag: pchar; gain: single): Tbool; cdecl; external libSDL3_mixer;
function MIX_SetMixerFrequencyRatio(mixer: PMIX_Mixer; ratio: single): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetMixerFrequencyRatio(mixer: PMIX_Mixer): single; cdecl; external libSDL3_mixer;
function MIX_SetTrackFrequencyRatio(track: PMIX_Track; ratio: single): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetTrackFrequencyRatio(track: PMIX_Track): single; cdecl; external libSDL3_mixer;
function MIX_SetTrackOutputChannelMap(track: PMIX_Track; chmap: Plongint; count: longint): Tbool; cdecl; external libSDL3_mixer;

type
  TMIX_StereoGains = record
    left: single;
    right: single;
  end;
  PMIX_StereoGains = ^TMIX_StereoGains;

function MIX_SetTrackStereo(track: PMIX_Track; gains: PMIX_StereoGains): Tbool; cdecl; external libSDL3_mixer;

type
  TMIX_Point3D = record
    x: single;
    y: single;
    z: single;
  end;
  PMIX_Point3D = ^TMIX_Point3D;

function MIX_SetTrack3DPosition(track: PMIX_Track; position: PMIX_Point3D): Tbool; cdecl; external libSDL3_mixer;
function MIX_GetTrack3DPosition(track: PMIX_Track; position: PMIX_Point3D): Tbool; cdecl; external libSDL3_mixer;
function MIX_CreateGroup(mixer: PMIX_Mixer): PMIX_Group; cdecl; external libSDL3_mixer;
procedure MIX_DestroyGroup(group: PMIX_Group); cdecl; external libSDL3_mixer;
function MIX_GetGroupProperties(group: PMIX_Group): TSDL_PropertiesID; cdecl; external libSDL3_mixer;
function MIX_GetGroupMixer(group: PMIX_Group): PMIX_Mixer; cdecl; external libSDL3_mixer;
function MIX_SetTrackGroup(track: PMIX_Track; group: PMIX_Group): Tbool; cdecl; external libSDL3_mixer;

type
  TMIX_TrackStoppedCallback = procedure(userdata: pointer; track: PMIX_Track); cdecl;

function MIX_SetTrackStoppedCallback(track: PMIX_Track; cb: TMIX_TrackStoppedCallback; userdata: pointer): Tbool; cdecl; external libSDL3_mixer;

type
  TMIX_TrackMixCallback = procedure(userdata: pointer; track: PMIX_Track; spec: PSDL_AudioSpec; pcm: Psingle; samples: longint); cdecl;

function MIX_SetTrackRawCallback(track: PMIX_Track; cb: TMIX_TrackMixCallback; userdata: pointer): Tbool; cdecl; external libSDL3_mixer;
function MIX_SetTrackCookedCallback(track: PMIX_Track; cb: TMIX_TrackMixCallback; userdata: pointer): Tbool; cdecl; external libSDL3_mixer;

type
  TMIX_GroupMixCallback = procedure(userdata: pointer; group: PMIX_Group; spec: PSDL_AudioSpec; pcm: Psingle; samples: longint); cdecl;

function MIX_SetGroupPostMixCallback(group: PMIX_Group; cb: TMIX_GroupMixCallback; userdata: pointer): Tbool; cdecl; external libSDL3_mixer;

type
  TMIX_PostMixCallback = procedure(userdata: pointer; mixer: PMIX_Mixer; spec: PSDL_AudioSpec; pcm: Psingle; samples: longint); cdecl;

function MIX_SetPostMixCallback(mixer: PMIX_Mixer; cb: TMIX_PostMixCallback; userdata: pointer): Tbool; cdecl; external libSDL3_mixer;
function MIX_Generate(mixer: PMIX_Mixer; buffer: pointer; buflen: longint): Tbool; cdecl; external libSDL3_mixer;

type
  PMIX_AudioDecoder = type Pointer;

function MIX_CreateAudioDecoder(path: pchar; props: TSDL_PropertiesID): PMIX_AudioDecoder; cdecl; external libSDL3_mixer;
function MIX_CreateAudioDecoder_IO(io: PSDL_IOStream; closeio: Tbool; props: TSDL_PropertiesID): PMIX_AudioDecoder; cdecl; external libSDL3_mixer;
procedure MIX_DestroyAudioDecoder(audiodecoder: PMIX_AudioDecoder); cdecl; external libSDL3_mixer;
function MIX_GetAudioDecoderProperties(audiodecoder: PMIX_AudioDecoder): TSDL_PropertiesID; cdecl; external libSDL3_mixer;
function MIX_GetAudioDecoderFormat(audiodecoder: PMIX_AudioDecoder; spec: PSDL_AudioSpec): Tbool; cdecl; external libSDL3_mixer;
function MIX_DecodeAudio(audiodecoder: PMIX_AudioDecoder; buffer: pointer; buflen: longint; spec: PSDL_AudioSpec): longint; cdecl; external libSDL3_mixer;

implementation

function SDL_MIXER_VERSION: longint;
begin
  SDL_MIXER_VERSION := SDL_VERSIONNUM(SDL_MIXER_MAJOR_VERSION, SDL_MIXER_MINOR_VERSION, SDL_MIXER_MICRO_VERSION);
end;

function SDL_MIXER_VERSION_ATLEAST(X, Y, Z: longint): boolean;
begin
  Result :=
    (SDL_MIXER_MAJOR_VERSION >= X) and
    ((SDL_MIXER_MAJOR_VERSION > X) or (SDL_MIXER_MINOR_VERSION >= Y)) and
    ((SDL_MIXER_MAJOR_VERSION > X) or (SDL_MIXER_MINOR_VERSION > Y) or (SDL_MIXER_MICRO_VERSION >= Z));
end;



end.
