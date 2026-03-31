pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_h;

package x86_64_linux_gnu_bits_stdint_least_h is

  -- Define int_leastN_t and uint_leastN types.
  --   Copyright (C) 2024 Free Software Foundation, Inc.
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

  -- Signed.   
   subtype int_least8_t is x86_64_linux_gnu_bits_types_h.uu_int_least8_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:25

   subtype int_least16_t is x86_64_linux_gnu_bits_types_h.uu_int_least16_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:26

   subtype int_least32_t is x86_64_linux_gnu_bits_types_h.uu_int_least32_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:27

   subtype int_least64_t is x86_64_linux_gnu_bits_types_h.uu_int_least64_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:28

  -- Unsigned.   
   subtype uint_least8_t is x86_64_linux_gnu_bits_types_h.uu_uint_least8_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:31

   subtype uint_least16_t is x86_64_linux_gnu_bits_types_h.uu_uint_least16_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:32

   subtype uint_least32_t is x86_64_linux_gnu_bits_types_h.uu_uint_least32_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:33

   subtype uint_least64_t is x86_64_linux_gnu_bits_types_h.uu_uint_least64_t;  -- /usr/include/x86_64-linux-gnu/bits/stdint-least.h:34

end x86_64_linux_gnu_bits_stdint_least_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
