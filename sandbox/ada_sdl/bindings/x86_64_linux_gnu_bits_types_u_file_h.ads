pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package x86_64_linux_gnu_bits_types_u_FILE_h is

   type u_IO_FILE is null record;   -- incomplete struct

   subtype uu_FILE is u_IO_FILE;  -- /usr/include/x86_64-linux-gnu/bits/types/__FILE.h:5

end x86_64_linux_gnu_bits_types_u_FILE_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
