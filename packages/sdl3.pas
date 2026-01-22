unit SDL3;

interface

uses
  {$IFDEF Linux}
  x, xlib;
  {$ENDIF}

  {$IFDEF Windows}
  Windows;
  {$ENDIF}

  const
    {$IFDEF Linux}
    libSDL3 = 'SDL3';
    {$ENDIF}

    {$IFDEF Windows}
    libSDL3 = 'SDL3';
    {$ENDIF}

    {$IFDEF Darwin}
    libSDL3 = 'libSDL3.dylib';
    {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tlong = int64;
  Tulong = uint64;
  {$ENDIF}

  {$IFDEF Darwin}
  Tlong = int64;
  Tulong = uint64;
  {$ENDIF}

  {$IFDEF Windows}
  Tlong = int32;
  Tulong = uint32;
  {$ENDIF}
  Pulong = ^Tulong;
  Plong = ^Tlong;

  {$DEFINE read_interface}
  {$include SDL3_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include SDL3_includes.inc}
{$UNDEF read_implementation}

{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
{$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
{$ENDIF}end.
