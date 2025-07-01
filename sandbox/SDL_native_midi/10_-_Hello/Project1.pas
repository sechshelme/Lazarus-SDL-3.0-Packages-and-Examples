program project1;

uses
  SDL3,
  SDL3_native_midi;

var
  song: PNativeMidi_Song;
const
  path = '/home/tux/Schreibtisch/sound/doom.mid';
begin
  if not NativeMidi_Init then begin
    SDL_Log('NativeMidi_Init failed: %s', SDL_GetError);
    Halt;
  end;
  SDL_Log('Loading song %s ...', path);
  song := NativeMidi_LoadSong(path);
  if song = nil then begin
    SDL_Log('Failed to load %s', SDL_GetError);
    Halt;
  end;

  SDL_Log('Starting song %s ...', path);
  NativeMidi_Start(song, 0);
  while NativeMidi_Active do begin
    SDL_Delay(300);
  end;

  SDL_Log('Song %s done', path);
  NativeMidi_DestroySong(song);

  NativeMidi_Quit;
end.
