{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit sdl3_native_midi_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  SDL3_native_midi, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('sdl3_native_midi_package', @Register);
end.
