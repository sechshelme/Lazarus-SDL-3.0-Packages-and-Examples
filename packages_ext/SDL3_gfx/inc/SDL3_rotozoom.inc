{$IFDEF read_interface}


const
  SMOOTHING_OFF = 0;
  SMOOTHING_ON = 1;

function rotozoomSurface(src: PSDL_Surface; angle: Tdouble; zoom: Tdouble; smooth: longint): PSDL_Surface; cdecl; external libSDL3_gfx;
function rotozoomSurfaceXY(src: PSDL_Surface; angle: Tdouble; zoomx: Tdouble; zoomy: Tdouble; smooth: longint): PSDL_Surface; cdecl; external libSDL3_gfx;
procedure rotozoomSurfaceSize(Width: longint; Height: longint; angle: Tdouble; zoom: Tdouble; dstwidth: Plongint;
  dstheight: Plongint); cdecl; external libSDL3_gfx;
procedure rotozoomSurfaceSizeXY(Width: longint; Height: longint; angle: Tdouble; zoomx: Tdouble; zoomy: Tdouble;
  dstwidth: Plongint; dstheight: Plongint); cdecl; external libSDL3_gfx;
function zoomSurface(src: PSDL_Surface; zoomx: Tdouble; zoomy: Tdouble; smooth: longint): PSDL_Surface; cdecl; external libSDL3_gfx;
procedure zoomSurfaceSize(Width: longint; Height: longint; zoomx: Tdouble; zoomy: Tdouble; dstwidth: Plongint;
  dstheight: Plongint); cdecl; external libSDL3_gfx;
function shrinkSurface(src: PSDL_Surface; factorx: longint; factory: longint): PSDL_Surface; cdecl; external libSDL3_gfx;
function rotateSurface90Degrees(src: PSDL_Surface; numClockwiseTurns: longint): PSDL_Surface; cdecl; external libSDL3_gfx;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
