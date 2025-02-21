
unit ttf;
interface

{
  Automatically converted by H2Pas 1.0.0 from ttf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ttf.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(* Const before type ignored *)

function TTF_StringToTag(_string:Pchar):TUint32;cdecl;external;
procedure TTF_TagToString(tag:TUint32; _string:Pchar; size:Tsize_t);cdecl;external;

implementation


end.
