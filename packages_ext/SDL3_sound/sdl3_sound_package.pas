{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit SDL3_sound_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  SDL3_sound, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('SDL3_sound_package', @Register);
end.
