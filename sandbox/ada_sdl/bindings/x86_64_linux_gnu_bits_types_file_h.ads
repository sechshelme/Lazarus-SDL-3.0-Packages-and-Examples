pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_u_FILE_h;

package x86_64_linux_gnu_bits_types_FILE_h is

  -- The opaque type of streams.  This is the definition used elsewhere.   
   subtype FILE is x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE;  -- /usr/include/x86_64-linux-gnu/bits/types/FILE.h:7

end x86_64_linux_gnu_bits_types_FILE_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
