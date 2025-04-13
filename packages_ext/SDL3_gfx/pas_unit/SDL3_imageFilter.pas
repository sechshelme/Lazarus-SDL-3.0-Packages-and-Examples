unit SDL3_imageFilter;

interface

uses
  ctypes, SDL3, SDL3_gfx;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function SDL_imageFilterMMXdetect: longint; cdecl; external libSDL3_gfx;
procedure SDL_imageFilterMMXoff; cdecl; external libSDL3_gfx;
procedure SDL_imageFilterMMXon; cdecl; external libSDL3_gfx;
function SDL_imageFilterAdd(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterMean(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterSub(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterAbsDiff(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterMult(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterMultNor(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterMultDivby2(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterMultDivby4(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterBitAnd(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterBitOr(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterDiv(Src1: pbyte; Src2: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterBitNegation(Src1: pbyte; Dest: pbyte; length: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterAddByte(Src1: pbyte; Dest: pbyte; length: dword; C: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterAddUint(Src1: pbyte; Dest: pbyte; length: dword; C: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterAddByteToHalf(Src1: pbyte; Dest: pbyte; length: dword; C: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterSubByte(Src1: pbyte; Dest: pbyte; length: dword; C: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterSubUint(Src1: pbyte; Dest: pbyte; length: dword; C: dword): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterShiftRight(Src1: pbyte; Dest: pbyte; length: dword; N: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterShiftRightUint(Src1: pbyte; Dest: pbyte; length: dword; N: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterMultByByte(Src1: pbyte; Dest: pbyte; length: dword; C: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterShiftRightAndMultByByte(Src1: pbyte; Dest: pbyte; length: dword; N: byte; C: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterShiftLeftByte(Src1: pbyte; Dest: pbyte; length: dword; N: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterShiftLeftUint(Src1: pbyte; Dest: pbyte; length: dword; N: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterShiftLeft(Src1: pbyte; Dest: pbyte; length: dword; N: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterBinarizeUsingThreshold(Src1: pbyte; Dest: pbyte; length: dword; T: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterClipToRange(Src1: pbyte; Dest: pbyte; length: dword; Tmin: byte; Tmax: byte): longint; cdecl; external libSDL3_gfx;
function SDL_imageFilterNormalizeLinear(Src: pbyte; Dest: pbyte; length: dword; Cmin: longint; Cmax: longint;
  Nmin: longint; Nmax: longint): longint; cdecl; external libSDL3_gfx;

implementation


end.
