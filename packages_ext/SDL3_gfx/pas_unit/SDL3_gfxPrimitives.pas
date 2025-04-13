unit SDL3_gfxPrimitives;

interface

uses
  ctypes, SDL3, SDL3_gfx;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  M_PI = 3.1415926535897932384626433832795;

const
  SDL3_GFXPRIMITIVES_MAJOR = 1;
  SDL3_GFXPRIMITIVES_MINOR = 0;
  SDL3_GFXPRIMITIVES_MICRO = 0;

function pixelColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function pixelRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function hlineColor(renderer: PSDL_Renderer; x1: TSint16; x2: TSint16; y: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function hlineRGBA(renderer: PSDL_Renderer; x1: TSint16; x2: TSint16; y: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function vlineColor(renderer: PSDL_Renderer; x: TSint16; y1: TSint16; y2: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function vlineRGBA(renderer: PSDL_Renderer; x: TSint16; y1: TSint16; y2: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function rectangleColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function rectangleRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function roundedRectangleColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; rad: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function roundedRectangleRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; rad: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function boxColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function boxRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function roundedBoxColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; rad: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function roundedBoxRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; rad: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function lineColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function lineRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function aalineColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function aalineRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function thickLineColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; Width: TUint8; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function thickLineRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; Width: TUint8; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function circleColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function circleRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function arcColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; start: TSint16; end_: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function arcRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; start: TSint16; end_: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function aacircleColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function aacircleRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function filledCircleColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; r: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function filledCircleRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function ellipseColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rx: TSint16; ry: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function ellipseRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rx: TSint16; ry: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function aaellipseColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rx: TSint16; ry: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function aaellipseRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rx: TSint16; ry: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function filledEllipseColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rx: TSint16; ry: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function filledEllipseRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rx: TSint16; ry: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function pieColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; start: TSint16; end_: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function pieRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; start: TSint16; end_: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function filledPieColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; start: TSint16; end_: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function filledPieRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; rad: TSint16; start: TSint16; end_: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function trigonColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; x3: TSint16; y3: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function trigonRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; x3: TSint16; y3: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function aatrigonColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; x3: TSint16; y3: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function aatrigonRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; x3: TSint16; y3: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function filledTrigonColor(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; x3: TSint16; y3: TSint16; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function filledTrigonRGBA(renderer: PSDL_Renderer; x1: TSint16; y1: TSint16; x2: TSint16; y2: TSint16; x3: TSint16; y3: TSint16; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function polygonColor(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function polygonRGBA(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function aapolygonColor(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function aapolygonRGBA(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function filledPolygonColor(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function filledPolygonRGBA(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function texturedPolygon(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; texture: PSDL_Surface; texture_dx: longint; texture_dy: longint): Tbool; cdecl; external libSDL3_gfx;
function bezierColor(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; s: longint; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function bezierRGBA(renderer: PSDL_Renderer; vx: PSint16; vy: PSint16; n: longint; s: longint; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
procedure gfxPrimitivesSetFont(fontdata: pointer; cw: TUint32; ch: TUint32); cdecl; external libSDL3_gfx;
procedure gfxPrimitivesSetFontRotation(rotation: TUint32); cdecl; external libSDL3_gfx;
function characterColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; c: char; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function characterRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; c: char; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;
function stringColor(renderer: PSDL_Renderer; x: TSint16; y: TSint16; s: pchar; color: TUint32): Tbool; cdecl; external libSDL3_gfx;
function stringRGBA(renderer: PSDL_Renderer; x: TSint16; y: TSint16; s: pchar; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3_gfx;

implementation


end.
