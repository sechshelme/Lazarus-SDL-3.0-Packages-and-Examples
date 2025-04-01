program Project1;

uses
  ctypes;

const
  libSDL3 = 'SDL3';
var
  f: Double;

  procedure SDL_Log(fmt: PChar); varargs; cdecl; external libSDL3;
  function SDL_log(x: double): double; cdecl; external libSDL3;
  function SDL_Cos(x: double): double; cdecl; external libSDL3;



begin
  f:=SDL_log(12.45);

  WriteLn('Log: ',f);
  WriteLn('Log: ',SDL_Log(12.45));
  WriteLn('-------');
  SDL_Log('%ix%i', 123, 456);
  SDL_Log('log 1');
  SDL_Log('Mathe log: %f', SDL_log(12.45));

  f:=SDL_cos(12.34);
  WriteLn(f);
  WriteLn(SDL_cos(12.34));

end.
