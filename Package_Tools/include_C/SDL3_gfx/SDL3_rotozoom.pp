
unit SDL3_rotozoom;
interface

{
  Automatically converted by H2Pas 1.0.0 from SDL3_rotozoom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL3_rotozoom.h
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
Plongint  = ^longint;
PSDL_Surface  = ^SDL_Surface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  

SDL3_rotozoom.c: rotozoomer, zoomer and shrinker for 32bit or 8bit surfaces

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
{$ifndef _SDL3_rotozoom_h}
{$define _SDL3_rotozoom_h}
{$include <math.h>}
{ Set up for C function definitions, even when using C++  }
{ C++ extern C conditionnal removed }
{$ifndef M_PI}

const
  M_PI = 3.1415926535897932384626433832795;  
{$endif}
{$include <SDL3/SDL.h>}
{ ---- Defines  }
{!
	\brief Disable anti-aliasing (no smoothing).
	 }

const
  SMOOTHING_OFF = 0;  
{!
	\brief Enable anti-aliasing (smoothing).
	 }
  SMOOTHING_ON = 1;  
{ ---- Function Prototypes  }
{ 

	Rotozoom functions

	 }

function rotozoomSurface(src:PSDL_Surface; angle:Tdouble; zoom:Tdouble; smooth:longint):PSDL_Surface;cdecl;external;
function rotozoomSurfaceXY(src:PSDL_Surface; angle:Tdouble; zoomx:Tdouble; zoomy:Tdouble; smooth:longint):PSDL_Surface;cdecl;external;
procedure rotozoomSurfaceSize(width:longint; height:longint; angle:Tdouble; zoom:Tdouble; dstwidth:Plongint; 
            dstheight:Plongint);cdecl;external;
procedure rotozoomSurfaceSizeXY(width:longint; height:longint; angle:Tdouble; zoomx:Tdouble; zoomy:Tdouble; 
            dstwidth:Plongint; dstheight:Plongint);cdecl;external;
{ 

	Zooming functions

	 }
function zoomSurface(src:PSDL_Surface; zoomx:Tdouble; zoomy:Tdouble; smooth:longint):PSDL_Surface;cdecl;external;
procedure zoomSurfaceSize(width:longint; height:longint; zoomx:Tdouble; zoomy:Tdouble; dstwidth:Plongint; 
            dstheight:Plongint);cdecl;external;
{ 

	Shrinking functions

	 }function shrinkSurface(src:PSDL_Surface; factorx:longint; factory:longint):PSDL_Surface;cdecl;external;
{ 

	Specialized rotation functions

	 }
function rotateSurface90Degrees(src:PSDL_Surface; numClockwiseTurns:longint):PSDL_Surface;cdecl;external;
{ Ends C function definitions when using C++  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _SDL3_rotozoom_h  }

implementation


end.
