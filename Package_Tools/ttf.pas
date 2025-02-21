unit ttf;

interface

uses
  ctypes, SDL3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function TTF_StringToTag(_string:Pchar):TUint32;cdecl;external libSDL3_ttf;
procedure TTF_TagToString(tag:TUint32; _string:Pchar; size:Tsize_t);cdecl;external libSDL3_ttf;

implementation


end.
