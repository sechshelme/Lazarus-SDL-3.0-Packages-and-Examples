pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Strings;
with x86_64_linux_gnu_bits_types_locale_t_h;

package strings_h is

  -- Copyright (C) 1991-2024 Free Software Foundation, Inc.
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

  -- Tell the caller that we provide correct C++ prototypes.   
  -- Compare N bytes of S1 and S2 (same as memcmp).   
   function bcmp
     (uu_s1 : System.Address;
      uu_s2 : System.Address;
      uu_n : stddef_h.size_t) return int  -- /usr/include/strings.h:34
   with Import => True, 
        Convention => C, 
        External_Name => "bcmp";

  -- Copy N bytes of SRC to DEST (like memmove, but args reversed).   
   procedure bcopy
     (uu_src : System.Address;
      uu_dest : System.Address;
      uu_n : stddef_h.size_t)  -- /usr/include/strings.h:38
   with Import => True, 
        Convention => C, 
        External_Name => "bcopy";

  -- Set N bytes of S to 0.   
   procedure bzero (uu_s : System.Address; uu_n : stddef_h.size_t)  -- /usr/include/strings.h:42
   with Import => True, 
        Convention => C, 
        External_Name => "bzero";

  -- Find the first occurrence of C in S (same as strchr).   
   function index (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/strings.h:68
   with Import => True, 
        Convention => C, 
        External_Name => "index";

  -- Find the last occurrence of C in S (same as strrchr).   
   function rindex (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/strings.h:96
   with Import => True, 
        Convention => C, 
        External_Name => "rindex";

  -- Return the position of the first bit set in I, or 0 if none are set.
  --   The least-significant bit is position 1, the most-significant 32.   

   function ffs (uu_i : int) return int  -- /usr/include/strings.h:104
   with Import => True, 
        Convention => C, 
        External_Name => "ffs";

  -- The following two functions are non-standard but necessary for non-32 bit
  --   platforms.   

   function ffsl (uu_l : long) return int  -- /usr/include/strings.h:110
   with Import => True, 
        Convention => C, 
        External_Name => "ffsl";

   function ffsll (uu_ll : Long_Long_Integer) return int  -- /usr/include/strings.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "ffsll";

  -- Compare S1 and S2, ignoring case.   
   function strcasecmp (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/strings.h:116
   with Import => True, 
        Convention => C, 
        External_Name => "strcasecmp";

  -- Compare no more than N chars of S1 and S2, ignoring case.   
   function strncasecmp
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return int  -- /usr/include/strings.h:120
   with Import => True, 
        Convention => C, 
        External_Name => "strncasecmp";

  -- POSIX.1-2008 extended locale interface (see locale.h).   
  -- Compare S1 and S2, ignoring case, using collation rules from LOC.   
   function strcasecmp_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_loc : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int  -- /usr/include/strings.h:128
   with Import => True, 
        Convention => C, 
        External_Name => "strcasecmp_l";

  -- Compare no more than N chars of S1 and S2, ignoring case, using
  --   collation rules from LOC.   

   function strncasecmp_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_loc : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int  -- /usr/include/strings.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "strncasecmp_l";

  -- Functions with security checks.   
end strings_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
