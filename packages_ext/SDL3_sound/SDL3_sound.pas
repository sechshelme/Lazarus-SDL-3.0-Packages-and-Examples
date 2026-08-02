unit SDL3_sound;

interface

uses
  ctypes, SDL3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libSDL3_sound = 'SDL3_sound';
  {$ENDIF}

  {$IFDEF msWindows}
  libSDL3_sound = 'SDL3_sound';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3_sound = 'SDL3_sound.dylib';
  {$ENDIF}

const
  SDL_SOUND_MAJOR_VERSION = 3;
  SDL_SOUND_MINOR_VERSION = 2;
  SDL_SOUND_MICRO_VERSION = 0;

function Sound_Version: longint; cdecl; external libSDL3_sound;

type
  PSound_SampleFlags = ^TSound_SampleFlags;
  TSound_SampleFlags = longint;
const
  SOUND_SAMPLEFLAG_NONE = 0;
  SOUND_SAMPLEFLAG_CANSEEK = 1;
  SOUND_SAMPLEFLAG_EOF = 1 shl 29;
  SOUND_SAMPLEFLAG_ERROR = 1 shl 30;
  SOUND_SAMPLEFLAG_EAGAIN = 1 shl 31;

type
  PPSound_DecoderInfo = ^PSound_DecoderInfo;
  PSound_DecoderInfo = ^TSound_DecoderInfo;
  TSound_DecoderInfo = record
    extensions: ^pchar;
    description: pchar;
    author: pchar;
    url: pchar;
  end;

  PSound_Sample = ^TSound_Sample;
  TSound_Sample = record
    opaque: pointer;
    decoder: PSound_DecoderInfo;
    desired: TSDL_AudioSpec;
    actual: TSDL_AudioSpec;
    buffer: pointer;
    buffer_size: TUint32;
    flags: TSound_SampleFlags;
  end;

function Sound_Init: longint; cdecl; external libSDL3_sound;
function Sound_Quit: longint; cdecl; external libSDL3_sound;
function Sound_AvailableDecoders: PPSound_DecoderInfo; cdecl; external libSDL3_sound;
function Sound_GetError: pchar; cdecl; external libSDL3_sound;
procedure Sound_ClearError; cdecl; external libSDL3_sound;
function Sound_NewSample(io: PSDL_IOStream; ext: pchar; desired: PSDL_AudioSpec; bufferSize: TUint32): PSound_Sample; cdecl; external libSDL3_sound;
function Sound_NewSampleFromMem(data: PUint8; size: TUint32; ext: pchar; desired: PSDL_AudioSpec; bufferSize: TUint32): PSound_Sample; cdecl; external libSDL3_sound;
function Sound_NewSampleFromFile(filename: pchar; desired: PSDL_AudioSpec; bufferSize: TUint32): PSound_Sample; cdecl; external libSDL3_sound;
procedure Sound_FreeSample(sample: PSound_Sample); cdecl; external libSDL3_sound;
function Sound_GetDuration(sample: PSound_Sample): TSint32; cdecl; external libSDL3_sound;
function Sound_SetBufferSize(sample: PSound_Sample; new_size: TUint32): longint; cdecl; external libSDL3_sound;
function Sound_SetDesiredFormat(sample: PSound_Sample; desired: PSDL_AudioSpec): longint; cdecl; external libSDL3_sound;
function Sound_Decode(sample: PSound_Sample): TUint32; cdecl; external libSDL3_sound;
function Sound_DecodeAll(sample: PSound_Sample): TUint32; cdecl; external libSDL3_sound;
function Sound_Rewind(sample: PSound_Sample): longint; cdecl; external libSDL3_sound;
function Sound_Seek(sample: PSound_Sample; ms: TUint32): longint; cdecl; external libSDL3_sound;

function SDL_SOUND_VERSION_ATLEAST(X, Y, Z: integer): boolean; inline;
function SDL_SOUND_VERSION: longint;

implementation

function SDL_SOUND_VERSION: longint;
begin
  SDL_SOUND_VERSION := SDL_VERSIONNUM(SDL_SOUND_MAJOR_VERSION, SDL_SOUND_MINOR_VERSION, SDL_SOUND_MICRO_VERSION);
end;

function SDL_SOUND_VERSION_ATLEAST(X, Y, Z: integer): boolean; inline;
begin
  Result := (SDL_SOUND_MAJOR_VERSION >= X) and
    ((SDL_SOUND_MAJOR_VERSION > X) or (SDL_SOUND_MINOR_VERSION >= Y)) and
    ((SDL_SOUND_MAJOR_VERSION > X) or (SDL_SOUND_MINOR_VERSION > Y) or (SDL_SOUND_MICRO_VERSION >= Z));
end;

end.
