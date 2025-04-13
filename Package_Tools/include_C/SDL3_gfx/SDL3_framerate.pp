
unit SDL3_framerate;
interface

{
  Automatically converted by H2Pas 1.0.0 from SDL3_framerate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL3_framerate.h
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
PFPSmanager  = ^FPSmanager;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{

SDL3_framerate.h: framerate manager

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
{$ifndef _SDL3_framerate_h}
{$define _SDL3_framerate_h}
{ Set up for C function definitions, even when using C++  }
{ C++ extern C conditionnal removed }
{ ---  }
{$include <SDL3/SDL.h>}
{ --------- Definitions  }
{!
	\brief Highest possible rate supported by framerate controller in Hz (1/s).
	 }

const
  FPS_UPPER_LIMIT = 200;  
{!
	\brief Lowest possible rate supported by framerate controller in Hz (1/s).
	 }
  FPS_LOWER_LIMIT = 1;  
{!
	\brief Default rate of framerate controller in Hz (1/s).
	 }
  FPS_DEFAULT = 30;  
{! 
	\brief Structure holding the state and timing information of the framerate controller. 
	 }
type
  PFPSmanager = ^TFPSmanager;
  TFPSmanager = record
      framecount : TUint32;
      rateticks : single;
      baseticks : TUint64;
      lastticks : TUint64;
      rate : TUint32;
    end;
{ ---- Function Prototypes  }
{ Functions return 0 or value for sucess and -1 for error  }

procedure SDL_initFramerate(manager:PFPSmanager);cdecl;external;
function SDL_setFramerate(manager:PFPSmanager; rate:TUint32):longint;cdecl;external;
function SDL_getFramerate(manager:PFPSmanager):longint;cdecl;external;
function SDL_getFramecount(manager:PFPSmanager):longint;cdecl;external;
function SDL_framerateDelay(manager:PFPSmanager):TUint64;cdecl;external;
{ ---  }
{ Ends C function definitions when using C++  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _SDL3_framerate_h  }

implementation


end.
