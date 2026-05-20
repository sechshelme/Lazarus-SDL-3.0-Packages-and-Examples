program Project1;

uses
  sdl3,
  SDL3_net;

var
  num_addrs: longint;
  i: integer;
  addrs: PPNet_Address;

begin
  if not Net_Init then begin
    SDL_Log('Fehler: SDLNet_Init: %s', SDL_GetError());
    halt;
  end;

  addrs := Net_GetLocalAddresses(@num_addrs);
  if addrs = nil then begin
    SDL_Log('Fehler: LocalAdress: %s', SDL_GetError());
    halt;
  end;

  for i := 0 to num_addrs - 1 do begin
    SDL_Log('  - %s', Net_GetAddressString(addrs[i]));
  end;

  Net_FreeLocalAddresses(addrs);
  Net_Quit;
end.
