unit SDL3_native_midi;

interface

uses SDL3;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libSDL3_native_midi = 'libSDL_native_midi';
  {$ENDIF}

  {$IFDEF msWindows}
  libSDL3_native_midi = 'libSDL_native_midi.dll';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3_native_midi = 'libSDL_native_midi.dylib';
  {$ENDIF}

type
  TNativeMidi_Song = record
  end;
  PNativeMidi_Song = ^TNativeMidi_Song;

function NativeMidi_Init: Tbool; cdecl; external libSDL3_native_midi;
procedure NativeMidi_Quit; cdecl; external libSDL3_native_midi;
function NativeMidi_LoadSong_IO(src: PSDL_IOStream; closeio: Tbool): PNativeMidi_Song; cdecl; external libSDL3_native_midi;
function NativeMidi_LoadSong(path: pchar): PNativeMidi_Song; cdecl; external libSDL3_native_midi;
procedure NativeMidi_DestroySong(song: PNativeMidi_Song); cdecl; external libSDL3_native_midi;
procedure NativeMidi_Start(song: PNativeMidi_Song; loops: longint); cdecl; external libSDL3_native_midi;
procedure NativeMidi_Pause; cdecl; external libSDL3_native_midi;
procedure NativeMidi_Resume; cdecl; external libSDL3_native_midi;
procedure NativeMidi_Stop; cdecl; external libSDL3_native_midi;
function NativeMidi_Active: Tbool; cdecl; external libSDL3_native_midi;
procedure NativeMidi_SetVolume(volume: single); cdecl; external libSDL3_native_midi;

implementation


end.
