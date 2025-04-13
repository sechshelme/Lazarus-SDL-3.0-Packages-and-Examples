unit SDL3_framerate;

interface

uses
  ctypes, SDL3, SDL3_gfx;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  FPS_UPPER_LIMIT = 200;
  FPS_LOWER_LIMIT = 1;
  FPS_DEFAULT = 30;

type
  TFPSmanager = record
    framecount: TUint32;
    rateticks: single;
    baseticks: TUint64;
    lastticks: TUint64;
    rate: TUint32;
  end;
  PFPSmanager = ^TFPSmanager;

procedure SDL_initFramerate(manager: PFPSmanager); cdecl; external libSDL3_gfx;
function SDL_setFramerate(manager: PFPSmanager; rate: TUint32): longint; cdecl; external libSDL3_gfx;
function SDL_getFramerate(manager: PFPSmanager): longint; cdecl; external libSDL3_gfx;
function SDL_getFramecount(manager: PFPSmanager): longint; cdecl; external libSDL3_gfx;
function SDL_framerateDelay(manager: PFPSmanager): TUint64; cdecl; external libSDL3_gfx;

implementation


end.
