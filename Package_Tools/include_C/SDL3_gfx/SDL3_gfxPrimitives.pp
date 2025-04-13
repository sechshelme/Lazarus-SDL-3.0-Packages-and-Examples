
unit SDL3_gfxPrimitives;
interface

{
  Automatically converted by H2Pas 1.0.0 from SDL3_gfxPrimitives.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL3_gfxPrimitives.h
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
Pchar  = ^char;
PSDL_Renderer  = ^SDL_Renderer;
PSDL_Surface  = ^SDL_Surface;
PSint16  = ^Sint16;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ 

SDL3_gfxPrimitives.h: graphics primitives for SDL

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
{$ifndef _SDL3_gfxPrimitives_h}
{$define _SDL3_gfxPrimitives_h}
{$include <math.h>}
{$ifndef M_PI}

const
  M_PI = 3.1415926535897932384626433832795;  
{$endif}
{$include <SDL3/SDL.h>}
{ Set up for C function definitions, even when using C++  }
{ C++ extern C conditionnal removed }
{ ----- Versioning  }

const
  SDL3_GFXPRIMITIVES_MAJOR = 1;  
  SDL3_GFXPRIMITIVES_MINOR = 0;  
  SDL3_GFXPRIMITIVES_MICRO = 0;  
{ ---- Function Prototypes  }
{ Note: all ___Color routines expect the color to be in format 0xRRGGBBAA  }
{ Pixel  }

function pixelColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; color:TUint32):Tbool;cdecl;external;
function pixelRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; r:TUint8; g:TUint8; 
           b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Horizontal line  }
function hlineColor(renderer:PSDL_Renderer; x1:TSint16; x2:TSint16; y:TSint16; color:TUint32):Tbool;cdecl;external;
function hlineRGBA(renderer:PSDL_Renderer; x1:TSint16; x2:TSint16; y:TSint16; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Vertical line  }
function vlineColor(renderer:PSDL_Renderer; x:TSint16; y1:TSint16; y2:TSint16; color:TUint32):Tbool;cdecl;external;
function vlineRGBA(renderer:PSDL_Renderer; x:TSint16; y1:TSint16; y2:TSint16; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Rectangle  }
function rectangleColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function rectangleRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Rounded-Corner Rectangle  }
function roundedRectangleColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           rad:TSint16; color:TUint32):Tbool;cdecl;external;
function roundedRectangleRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           rad:TSint16; r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Filled rectangle (Box)  }
function boxColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function boxRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Rounded-Corner Filled rectangle (Box)  }
function roundedBoxColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           rad:TSint16; color:TUint32):Tbool;cdecl;external;
function roundedBoxRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           rad:TSint16; r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Line  }
function lineColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function lineRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ AA Line  }
function aalineColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function aalineRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Thick Line  }
function thickLineColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           width:TUint8; color:TUint32):Tbool;cdecl;external;
function thickLineRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           width:TUint8; r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Circle  }
function circleColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; color:TUint32):Tbool;cdecl;external;
function circleRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Arc  }
function arcColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; start:TSint16; 
           end:TSint16; color:TUint32):Tbool;cdecl;external;
function arcRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; start:TSint16; 
           end:TSint16; r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ AA Circle  }
function aacircleColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; color:TUint32):Tbool;cdecl;external;
function aacircleRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Filled Circle  }
function filledCircleColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; r:TSint16; color:TUint32):Tbool;cdecl;external;
function filledCircleRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Ellipse  }
function ellipseColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rx:TSint16; ry:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function ellipseRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rx:TSint16; ry:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ AA Ellipse  }
function aaellipseColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rx:TSint16; ry:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function aaellipseRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rx:TSint16; ry:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Filled Ellipse  }
function filledEllipseColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rx:TSint16; ry:TSint16; 
           color:TUint32):Tbool;cdecl;external;
function filledEllipseRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rx:TSint16; ry:TSint16; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Pie  }
function pieColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; start:TSint16; 
           end:TSint16; color:TUint32):Tbool;cdecl;external;
function pieRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; start:TSint16; 
           end:TSint16; r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Filled Pie  }
function filledPieColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; start:TSint16; 
           end:TSint16; color:TUint32):Tbool;cdecl;external;
function filledPieRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; rad:TSint16; start:TSint16; 
           end:TSint16; r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Trigon  }
function trigonColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           x3:TSint16; y3:TSint16; color:TUint32):Tbool;cdecl;external;
function trigonRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           x3:TSint16; y3:TSint16; r:TUint8; g:TUint8; b:TUint8; 
           a:TUint8):Tbool;cdecl;external;
{ AA-Trigon  }
function aatrigonColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           x3:TSint16; y3:TSint16; color:TUint32):Tbool;cdecl;external;
function aatrigonRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           x3:TSint16; y3:TSint16; r:TUint8; g:TUint8; b:TUint8; 
           a:TUint8):Tbool;cdecl;external;
{ Filled Trigon  }
function filledTrigonColor(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           x3:TSint16; y3:TSint16; color:TUint32):Tbool;cdecl;external;
function filledTrigonRGBA(renderer:PSDL_Renderer; x1:TSint16; y1:TSint16; x2:TSint16; y2:TSint16; 
           x3:TSint16; y3:TSint16; r:TUint8; g:TUint8; b:TUint8; 
           a:TUint8):Tbool;cdecl;external;
{ Polygon  }
(* Const before type ignored *)
(* Const before type ignored *)
function polygonColor(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; color:TUint32):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function polygonRGBA(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ AA-Polygon  }
(* Const before type ignored *)
(* Const before type ignored *)
function aapolygonColor(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; color:TUint32):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function aapolygonRGBA(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Filled Polygon  }
(* Const before type ignored *)
(* Const before type ignored *)
function filledPolygonColor(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; color:TUint32):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function filledPolygonRGBA(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Textured Polygon  }
(* Const before type ignored *)
(* Const before type ignored *)
function texturedPolygon(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; texture:PSDL_Surface; 
           texture_dx:longint; texture_dy:longint):Tbool;cdecl;external;
{ Bezier  }
(* Const before type ignored *)
(* Const before type ignored *)
function bezierColor(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; s:longint; 
           color:TUint32):Tbool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function bezierRGBA(renderer:PSDL_Renderer; vx:PSint16; vy:PSint16; n:longint; s:longint; 
           r:TUint8; g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Characters/Strings  }
(* Const before type ignored *)
procedure gfxPrimitivesSetFont(fontdata:pointer; cw:TUint32; ch:TUint32);cdecl;external;
procedure gfxPrimitivesSetFontRotation(rotation:TUint32);cdecl;external;
function characterColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; c:char; color:TUint32):Tbool;cdecl;external;
function characterRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; c:char; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
(* Const before type ignored *)
function stringColor(renderer:PSDL_Renderer; x:TSint16; y:TSint16; s:Pchar; color:TUint32):Tbool;cdecl;external;
(* Const before type ignored *)
function stringRGBA(renderer:PSDL_Renderer; x:TSint16; y:TSint16; s:Pchar; r:TUint8; 
           g:TUint8; b:TUint8; a:TUint8):Tbool;cdecl;external;
{ Ends C function definitions when using C++  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ _SDL3_gfxPrimitives_h  }

implementation


end.
