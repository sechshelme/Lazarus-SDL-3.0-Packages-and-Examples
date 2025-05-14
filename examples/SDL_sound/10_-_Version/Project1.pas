program project1;

uses
  SDL3,
  SDL3_sound;

var
  version: TSound_Version;
begin
  Sound_GetLinkedVersion(@version);

  SDL_Log('SDL Sound Version: %d.%d.%d', version.major, version.minor, version.patch);
end.
