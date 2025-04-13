unit SDL3_gfx;

interface

uses
  SDL3;

const
  {$IFDEF Linux}
  libSDL3_gfx = 'SDL3_gfx';
  {$ENDIF}

  {$IFDEF msWindows}
  libSDL3_gfx = 'SDL3_gfx';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3_gfx = 'libSDL3_gfx.dylib';
  {$ENDIF}

const
  M_PI = 3.1415926535897932384626433832795;


  {$DEFINE read_interface}
  {$include inc/SDL3_gfxPrimitives_font.inc}
  {$include inc/SDL3_framerate.inc}
  {$include inc/SDL3_imageFilter.inc}
  {$include inc/SDL3_rotozoom.inc}
  {$include inc/SDL3_gfxPrimitives.inc}
  {$UNDEF read_interface}



implementation

{$DEFINE read_implementation}
{$include inc/SDL3_gfxPrimitives_font.inc}
{$include inc/SDL3_framerate.inc}
{$include inc/SDL3_imageFilter.inc}
{$include inc/SDL3_rotozoom.inc}
{$include inc/SDL3_gfxPrimitives.inc}
{$UNDEF read_implementation}


end.
