pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;

package stdint_h is

   INT8_MIN : constant := (-128);  --  /usr/include/stdint.h:105
   INT16_MIN : constant := (-32767-1);  --  /usr/include/stdint.h:106
   INT32_MIN : constant := (-2147483647-1);  --  /usr/include/stdint.h:107
   --  unsupported macro: INT64_MIN (-__INT64_C(9223372036854775807)-1)

   INT8_MAX : constant := (127);  --  /usr/include/stdint.h:110
   INT16_MAX : constant := (32767);  --  /usr/include/stdint.h:111
   INT32_MAX : constant := (2147483647);  --  /usr/include/stdint.h:112
   --  unsupported macro: INT64_MAX (__INT64_C(9223372036854775807))

   UINT8_MAX : constant := (255);  --  /usr/include/stdint.h:116
   UINT16_MAX : constant := (65535);  --  /usr/include/stdint.h:117
   UINT32_MAX : constant := (4294967295);  --  /usr/include/stdint.h:118
   --  unsupported macro: UINT64_MAX (__UINT64_C(18446744073709551615))

   INT_LEAST8_MIN : constant := (-128);  --  /usr/include/stdint.h:123
   INT_LEAST16_MIN : constant := (-32767-1);  --  /usr/include/stdint.h:124
   INT_LEAST32_MIN : constant := (-2147483647-1);  --  /usr/include/stdint.h:125
   --  unsupported macro: INT_LEAST64_MIN (-__INT64_C(9223372036854775807)-1)

   INT_LEAST8_MAX : constant := (127);  --  /usr/include/stdint.h:128
   INT_LEAST16_MAX : constant := (32767);  --  /usr/include/stdint.h:129
   INT_LEAST32_MAX : constant := (2147483647);  --  /usr/include/stdint.h:130
   --  unsupported macro: INT_LEAST64_MAX (__INT64_C(9223372036854775807))

   UINT_LEAST8_MAX : constant := (255);  --  /usr/include/stdint.h:134
   UINT_LEAST16_MAX : constant := (65535);  --  /usr/include/stdint.h:135
   UINT_LEAST32_MAX : constant := (4294967295);  --  /usr/include/stdint.h:136
   --  unsupported macro: UINT_LEAST64_MAX (__UINT64_C(18446744073709551615))

   INT_FAST8_MIN : constant := (-128);  --  /usr/include/stdint.h:141

   INT_FAST16_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:143
   INT_FAST32_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:144
   --  unsupported macro: INT_FAST64_MIN (-__INT64_C(9223372036854775807)-1)

   INT_FAST8_MAX : constant := (127);  --  /usr/include/stdint.h:151

   INT_FAST16_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:153
   INT_FAST32_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:154
   --  unsupported macro: INT_FAST64_MAX (__INT64_C(9223372036854775807))

   UINT_FAST8_MAX : constant := (255);  --  /usr/include/stdint.h:162

   UINT_FAST16_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:164
   UINT_FAST32_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:165
   --  unsupported macro: UINT_FAST64_MAX (__UINT64_C(18446744073709551615))

   INTPTR_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:175
   INTPTR_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:176
   UINTPTR_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:177
   --  unsupported macro: INTMAX_MIN (-__INT64_C(9223372036854775807)-1)
   --  unsupported macro: INTMAX_MAX (__INT64_C(9223372036854775807))
   --  unsupported macro: UINTMAX_MAX (__UINT64_C(18446744073709551615))

   PTRDIFF_MIN : constant := (-9223372036854775807-1);  --  /usr/include/stdint.h:198
   PTRDIFF_MAX : constant := (9223372036854775807);  --  /usr/include/stdint.h:199

   SIG_ATOMIC_MIN : constant := (-2147483647-1);  --  /usr/include/stdint.h:211
   SIG_ATOMIC_MAX : constant := (2147483647);  --  /usr/include/stdint.h:212

   SIZE_MAX : constant := (18446744073709551615);  --  /usr/include/stdint.h:216

   WINT_MIN : constant := (0);  --  /usr/include/stdint.h:233
   WINT_MAX : constant := (4294967295);  --  /usr/include/stdint.h:234
   --  arg-macro: procedure INT8_C (c)
   --    c
   --  arg-macro: procedure INT16_C (c)
   --    c
   --  arg-macro: procedure INT32_C (c)
   --    c
   --  unsupported macro: INT64_C(c) c ## L
   --  arg-macro: procedure UINT8_C (c)
   --    c
   --  arg-macro: procedure UINT16_C (c)
   --    c
   --  unsupported macro: UINT32_C(c) c ## U
   --  unsupported macro: UINT64_C(c) c ## UL
   --  unsupported macro: INTMAX_C(c) c ## L
   --  unsupported macro: UINTMAX_C(c) c ## UL

  -- Copyright (C) 1997-2024 Free Software Foundation, Inc.
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

  -- *	ISO C99: 7.18 Integer types <stdint.h>
  --  

  -- Exact integral types.   
  -- Signed.   
  -- Unsigned.   
  -- Small types.   
  -- Fast types.   
  -- Signed.   
   subtype int_fast8_t is signed_char;  -- /usr/include/stdint.h:47

   subtype int_fast16_t is long;  -- /usr/include/stdint.h:49

   subtype int_fast32_t is long;  -- /usr/include/stdint.h:50

   subtype int_fast64_t is long;  -- /usr/include/stdint.h:51

  -- Unsigned.   
   subtype uint_fast8_t is unsigned_char;  -- /usr/include/stdint.h:60

   subtype uint_fast16_t is unsigned_long;  -- /usr/include/stdint.h:62

   subtype uint_fast32_t is unsigned_long;  -- /usr/include/stdint.h:63

   subtype uint_fast64_t is unsigned_long;  -- /usr/include/stdint.h:64

  -- Types for `void *' pointers.   
   subtype intptr_t is long;  -- /usr/include/stdint.h:76

   subtype uintptr_t is unsigned_long;  -- /usr/include/stdint.h:79

  -- Largest integral types.   
   subtype intmax_t is x86_64_linux_gnu_bits_types_h.uu_intmax_t;  -- /usr/include/stdint.h:90

   subtype uintmax_t is x86_64_linux_gnu_bits_types_h.uu_uintmax_t;  -- /usr/include/stdint.h:91

  -- Limits of integral types.   
  -- Minimum of signed integral types.   
  -- Maximum of signed integral types.   
  -- Maximum of unsigned integral types.   
  -- Minimum of signed integral types having a minimum size.   
  -- Maximum of signed integral types having a minimum size.   
  -- Maximum of unsigned integral types having a minimum size.   
  -- Minimum of fast signed integral types having a minimum size.   
  -- Maximum of fast signed integral types having a minimum size.   
  -- Maximum of fast unsigned integral types having a minimum size.   
  -- Values to test for integral types holding `void *' pointer.   
  -- Minimum for largest signed integral type.   
  -- Maximum for largest signed integral type.   
  -- Maximum for largest unsigned integral type.   
  -- Limits of other integer types.   
  -- Limits of `ptrdiff_t' type.   
  -- Limits of `sig_atomic_t'.   
  -- Limit of `size_t' type.   
  -- Limits of `wchar_t'.   
  -- These constants might also be defined in <wchar.h>.   
  -- Limits of `wint_t'.   
  -- Signed.   
  -- Unsigned.   
  -- Maximal type.   
end stdint_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
