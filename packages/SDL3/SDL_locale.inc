
{$IFDEF read_interface}

type
  TSDL_Locale = record
    language: pansichar;
    country: pansichar;
  end;
  PSDL_Locale = ^TSDL_Locale;
  PPSDL_Locale = ^PSDL_Locale;

function SDL_GetPreferredLocales(Count: Plongint): PPSDL_Locale; cdecl; external libSDL3;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
