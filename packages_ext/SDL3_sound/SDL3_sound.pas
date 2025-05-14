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
  libSDL3_sound = 'SDL3_sounddylib';
  {$ENDIF}

  // =====================

const
  SOUND_VER_MAJOR = 3;
  SOUND_VER_MINOR = 0;
  SOUND_VER_PATCH = 0;

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
  TSound_AudioInfo = record
    format: TUint16;
    channels: TUint8;
    rate: TUint32;
  end;
  PSound_AudioInfo = ^TSound_AudioInfo;

  TSound_DecoderInfo = record
    extensions: ^pchar;
    description: pchar;
    author: pchar;
    url: pchar;
  end;
  PSound_DecoderInfo = ^TSound_DecoderInfo;
  PPSound_DecoderInfo = ^PSound_DecoderInfo;

  TSound_Sample = record
    opaque: pointer;
    decoder: PSound_DecoderInfo;
    desired: TSound_AudioInfo;
    actual: TSound_AudioInfo;
    buffer: pointer;
    buffer_size: TUint32;
    flags: TSound_SampleFlags;
  end;
  PSound_Sample = ^TSound_Sample;

  TSound_Version = record
    major: longint;
    minor: longint;
    patch: longint;
  end;
  PSound_Version = ^TSound_Version;

procedure SOUND_VERSION(x: PSound_Version);

procedure Sound_GetLinkedVersion(ver: PSound_Version); cdecl; external libSDL3_sound;
function Sound_Init: longint; cdecl; external libSDL3_sound;
function Sound_Quit: longint; cdecl; external libSDL3_sound;
function Sound_AvailableDecoders: PPSound_DecoderInfo; cdecl; external libSDL3_sound;
function Sound_GetError: pchar; cdecl; external libSDL3_sound;
procedure Sound_ClearError; cdecl; external libSDL3_sound;
function Sound_NewSample(rw: PSDL_IOStream; ext: pchar; desired: PSound_AudioInfo; bufferSize: TUint32): PSound_Sample; cdecl; external libSDL3_sound;
function Sound_NewSampleFromMem(data: PUint8; size: TUint32; ext: pchar; desired: PSound_AudioInfo; bufferSize: TUint32): PSound_Sample; cdecl; external libSDL3_sound;
function Sound_NewSampleFromFile(fname: pchar; desired: PSound_AudioInfo; bufferSize: TUint32): PSound_Sample; cdecl; external libSDL3_sound;
procedure Sound_FreeSample(sample: PSound_Sample); cdecl; external libSDL3_sound;
function Sound_GetDuration(sample: PSound_Sample): TSint32; cdecl; external libSDL3_sound;
function Sound_SetBufferSize(sample: PSound_Sample; new_size: TUint32): longint; cdecl; external libSDL3_sound;
function Sound_Decode(sample: PSound_Sample): TUint32; cdecl; external libSDL3_sound;
function Sound_DecodeAll(sample: PSound_Sample): TUint32; cdecl; external libSDL3_sound;
function Sound_Rewind(sample: PSound_Sample): longint; cdecl; external libSDL3_sound;
function Sound_Seek(sample: PSound_Sample; ms: TUint32): longint; cdecl; external libSDL3_sound;

implementation

procedure SOUND_VERSION(x: PSound_Version);
begin
  x^.major := SOUND_VER_MAJOR;
  x^.minor := SOUND_VER_MINOR;
  x^.patch := SOUND_VER_PATCH;
end;

end.
