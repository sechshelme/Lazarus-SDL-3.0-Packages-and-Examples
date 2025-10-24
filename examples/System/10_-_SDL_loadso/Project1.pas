program Project1;

uses
  SDL3,
  ctypes;

const
  {$IFDEF Linux}
  libc = 'libc.so.6';
  {$ENDIF}
  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

var
  puts: function(s: pchar): integer; cdecl;
  printf: function(f: pchar): integer; varargs cdecl;

  procedure main;
  var
    libHandle: PSDL_SharedObject;
  begin
    libHandle := SDL_LoadObject(libc);
    if libHandle = nil then begin
      SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, 'Failed to load C library: %s', SDL_GetError);
    end;

    Pointer(puts) := SDL_LoadFunction(libHandle, 'puts');
    if puts = nil then begin
      SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, 'Failed to load function ''puts'': %s', SDL_GetError);
    end;

    Pointer(printf) := SDL_LoadFunction(libHandle, 'printf');
    if printf = nil then begin
      SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, 'Failed to load function ''printf'': %s', SDL_GetError);
    end;

    puts('Hello puts!');
    printf('Integer: %d  Float: %f  String: %s'#10#10#10, 123, 12.45, 'Hello printf!');
    SDL_UnloadObject(libHandle);
  end;


begin
  main;
end.
