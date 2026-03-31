pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package x86_64_linux_gnu_bits_types_u_locale_t_h is

  -- Definition of struct __locale_struct and __locale_t.
  --   Copyright (C) 1997-2024 Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, see
  --   <https://www.gnu.org/licenses/>.   

  -- POSIX.1-2008: the locale_t type, representing a locale context
  --   (implementation-namespace version).  This type should be treated
  --   as opaque by applications; some details are exposed for the sake of
  --   efficiency in e.g. ctype functions.   

  -- Note: LC_ALL is not a valid index into this array.   
  -- 13 = __LC_LAST.  
   type uu_locale_data is null record;   -- incomplete struct

   type anon_array1023 is array (0 .. 12) of access uu_locale_data;
   type anon_array1028 is array (0 .. 12) of Interfaces.C.Strings.chars_ptr;
   type uu_locale_struct is record
      uu_locales : anon_array1023;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:30
      uu_ctype_b : access unsigned_short;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:33
      uu_ctype_tolower : access int;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:34
      uu_ctype_toupper : access int;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:35
      uu_names : anon_array1028;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:38
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:27

  -- To increase the speed of this solution we add some special members.   
  -- Note: LC_ALL is not a valid index into this array.   
   type uu_locale_t is access all uu_locale_struct;  -- /usr/include/x86_64-linux-gnu/bits/types/__locale_t.h:41

end x86_64_linux_gnu_bits_types_u_locale_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
