unit SDL3_gfx;

interface

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



implementation

end.

