
unit SDL_test_compare;
interface

{
  Automatically converted by H2Pas 0.99.16 from SDL_test_compare.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL_test_compare.h
}

Type
PSDL_Surface = ^TSDL_Surface;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Simple DirectMedia Layer
  Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
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
  3. This notice may not be removed or altered from any source distribution.
 }
{*
 *  \file SDL_test_compare.h
 *
 *  Comparison function of SDL test framework.
 *
 *  This code is a part of the SDL test library, not the main SDL library.
  }
{

 Defines comparison functions (i.e. for surfaces).

 }
{$ifndef SDL_test_compare_h_}
{$define SDL_test_compare_h_}
{$include <SDL3/SDL.h>}
{$include <SDL3/SDL_begin_code.h>}
{ Set up for C function definitions, even when using C++  }
{ C++ extern C conditionnal removed }
{*
 * Compares a surface and with reference image data for equality
 *
 * \param surface Surface used in comparison
 * \param referenceSurface Test Surface used in comparison
 * \param allowable_error Allowable difference (=sum of squared difference for each RGB component) in blending accuracy.
 *
 * \returns 0 if comparison succeeded, >0 (=number of pixels for which the comparison failed) if comparison failed, -1 if any of the surfaces were NULL, -2 if the surface sizes differ.
  }

function SDLTest_CompareSurfaces(surface:PSDL_Surface; referenceSurface:PSDL_Surface; allowable_error:longint):longint;cdecl;external;
{*
 * Compares 2 memory blocks for equality
 *
 * \param actual Memory used in comparison, displayed on the left
 * \param size_actual Size of actual in bytes
 * \param reference Reference memory, displayed on the right
 * \param size_reference Size of reference in bytes
 *
 * \returns 0 if the left and right memory block are equal, non-zero if they are non-equal.
 *
 * \since This function is available since SDL 3.1.3.
  }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function SDLTest_CompareMemory(actual:pointer; size_actual:Tsize_t; reference:pointer; size_reference:Tsize_t):longint;cdecl;external;
{ Ends C function definitions when using C++  }
{ C++ end of extern C conditionnal removed }
{$include <SDL3/SDL_close_code.h>}
{$endif}
{ SDL_test_compare_h_  }

implementation


end.
