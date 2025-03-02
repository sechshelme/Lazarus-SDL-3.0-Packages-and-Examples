program Project2;

{$APPTYPE CONSOLE}

const
  {$IFDEF Linux}
  libSDL3 = 'SDL3';
  {$ENDIF}

  {$IFDEF msWindows}
  libSDL3 = 'SDL3';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3 = 'libSDL3.dylib';
  {$ENDIF}

type
  TSDL_Window = record
  end;
  PSDL_Window = ^TSDL_Window;

const
  SDL_INIT_VIDEO = $00000020;
  SDL_WINDOW_RESIZABLE = $00000020;

  function SDL_Init(flags: integer): integer; cdecl; external libSDL3;
  function SDL_CreateWindow(title: pchar; w, h: integer; flags: integer): PSDL_Window; cdecl; external libSDL3;
  function SDL_DestroyWindow(window: PSDL_Window): Pointer; cdecl; external libSDL3;
  procedure SDL_Delay(ms: integer); cdecl; external libSDL3;

var
  window: PSDL_Window;

begin
  SDL_Init(SDL_INIT_VIDEO);

  window := SDL_CreateWindow('SDL3 Window', 320, 200, SDL_WINDOW_RESIZABLE);
  SDL_Delay(3000);
  SDL_DestroyWindow(window);
end.
