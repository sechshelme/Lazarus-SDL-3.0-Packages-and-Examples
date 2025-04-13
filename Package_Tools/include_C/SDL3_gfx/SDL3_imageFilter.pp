
unit SDL3_imageFilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from SDL3_imageFilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL3_imageFilter.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{

SDL3_imageFilter.h: byte-image "filter" routines 

Copyright (C) 2012-2014  Andreas Schiffler

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
claim that you wrote the original software. If you use this software
in a product, an acknowledgment in the product documentation would be
appreciated but is not required.

2. Altered source versions must be plainly marked as such, and must not be
misrepresented as being the original software.

3. This notice may not be removed or altered from any source
distribution.

Andreas Schiffler -- aschiffler at ferzkopp dot net

 }
{$ifndef _SDL3_imageFilter_h}
{$define _SDL3_imageFilter_h}
{ Set up for C function definitions, even when using C++  }
{ C++ extern C conditionnal removed }
{ ---- Function Prototypes  }
{ Comments:                                                                            }
{  1.) MMX functions work best if all data blocks are aligned on a 32 bytes boundary.  }
{  2.) Data that is not within an 8 byte boundary is processed using the C routine.    }
{  3.) Convolution routines do not have C routines at this time.                       }
{ Detect MMX capability in CPU }

function SDL_imageFilterMMXdetect:longint;cdecl;external;
{ Force use of MMX off (or turn possible use back on) }
procedure SDL_imageFilterMMXoff;cdecl;external;
procedure SDL_imageFilterMMXon;cdecl;external;
{ }
{ All routines return: }
{   0   OK }
{  -1   Error (internal error, parameter error) }
{ }
{  SDL_imageFilterAdd: D = saturation255(S1 + S2) }
function SDL_imageFilterAdd(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterMean: D = S1/2 + S2/2 }
function SDL_imageFilterMean(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterSub: D = saturation0(S1 - S2) }
function SDL_imageFilterSub(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterAbsDiff: D = | S1 - S2 | }
function SDL_imageFilterAbsDiff(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterMult: D = saturation(S1 * S2) }
function SDL_imageFilterMult(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterMultNor: D = S1 * S2   (non-MMX) }
function SDL_imageFilterMultNor(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterMultDivby2: D = saturation255(S1/2 * S2) }
function SDL_imageFilterMultDivby2(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterMultDivby4: D = saturation255(S1/2 * S2/2) }
function SDL_imageFilterMultDivby4(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterBitAnd: D = S1 & S2 }
function SDL_imageFilterBitAnd(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterBitOr: D = S1 | S2 }
function SDL_imageFilterBitOr(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterDiv: D = S1 / S2   (non-MMX) }
function SDL_imageFilterDiv(Src1:Pbyte; Src2:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterBitNegation: D = !S }
function SDL_imageFilterBitNegation(Src1:Pbyte; Dest:Pbyte; length:dword):longint;cdecl;external;
{  SDL_imageFilterAddByte: D = saturation255(S + C) }
function SDL_imageFilterAddByte(Src1:Pbyte; Dest:Pbyte; length:dword; C:byte):longint;cdecl;external;
{  SDL_imageFilterAddUint: D = saturation255(S + (uint)C) }
function SDL_imageFilterAddUint(Src1:Pbyte; Dest:Pbyte; length:dword; C:dword):longint;cdecl;external;
{  SDL_imageFilterAddByteToHalf: D = saturation255(S/2 + C) }
function SDL_imageFilterAddByteToHalf(Src1:Pbyte; Dest:Pbyte; length:dword; C:byte):longint;cdecl;external;
{  SDL_imageFilterSubByte: D = saturation0(S - C) }
function SDL_imageFilterSubByte(Src1:Pbyte; Dest:Pbyte; length:dword; C:byte):longint;cdecl;external;
{  SDL_imageFilterSubUint: D = saturation0(S - (uint)C) }
function SDL_imageFilterSubUint(Src1:Pbyte; Dest:Pbyte; length:dword; C:dword):longint;cdecl;external;
{  SDL_imageFilterShiftRight: D = saturation0(S >> N) }
function SDL_imageFilterShiftRight(Src1:Pbyte; Dest:Pbyte; length:dword; N:byte):longint;cdecl;external;
{  SDL_imageFilterShiftRightUint: D = saturation0((uint)S >> N) }
function SDL_imageFilterShiftRightUint(Src1:Pbyte; Dest:Pbyte; length:dword; N:byte):longint;cdecl;external;
{  SDL_imageFilterMultByByte: D = saturation255(S * C) }
function SDL_imageFilterMultByByte(Src1:Pbyte; Dest:Pbyte; length:dword; C:byte):longint;cdecl;external;
{  SDL_imageFilterShiftRightAndMultByByte: D = saturation255((S >> N) * C) }
function SDL_imageFilterShiftRightAndMultByByte(Src1:Pbyte; Dest:Pbyte; length:dword; N:byte; C:byte):longint;cdecl;external;
{  SDL_imageFilterShiftLeftByte: D = (S << N) }
function SDL_imageFilterShiftLeftByte(Src1:Pbyte; Dest:Pbyte; length:dword; N:byte):longint;cdecl;external;
{  SDL_imageFilterShiftLeftUint: D = ((uint)S << N) }
function SDL_imageFilterShiftLeftUint(Src1:Pbyte; Dest:Pbyte; length:dword; N:byte):longint;cdecl;external;
{  SDL_imageFilterShiftLeft: D = saturation255(S << N) }
function SDL_imageFilterShiftLeft(Src1:Pbyte; Dest:Pbyte; length:dword; N:byte):longint;cdecl;external;
{  SDL_imageFilterBinarizeUsingThreshold: D = S >= T ? 255:0 }
function SDL_imageFilterBinarizeUsingThreshold(Src1:Pbyte; Dest:Pbyte; length:dword; T:byte):longint;cdecl;external;
{  SDL_imageFilterClipToRange: D = (S >= Tmin) & (S <= Tmax) 255:0 }
function SDL_imageFilterClipToRange(Src1:Pbyte; Dest:Pbyte; length:dword; Tmin:byte; Tmax:byte):longint;cdecl;external;
{  SDL_imageFilterNormalizeLinear: D = saturation255((Nmax - Nmin)/(Cmax - Cmin)*(S - Cmin) + Nmin) }
function SDL_imageFilterNormalizeLinear(Src:Pbyte; Dest:Pbyte; length:dword; Cmin:longint; Cmax:longint; 
           Nmin:longint; Nmax:longint):longint;cdecl;external;
{ Ends C function definitions when using C++  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _SDL3_imageFilter_h  }

implementation


end.
