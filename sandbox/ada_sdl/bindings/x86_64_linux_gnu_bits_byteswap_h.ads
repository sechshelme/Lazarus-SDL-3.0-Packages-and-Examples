pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package x86_64_linux_gnu_bits_byteswap_h is

  -- Macros and inline functions to swap the order of bytes in integer values.
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

  -- Swap bytes in 16-bit value.   
   --  skipped func __bswap_16

  -- Swap bytes in 32-bit value.   
   --  skipped func __bswap_32

  -- Swap bytes in 64-bit value.   
   --  skipped func __bswap_64

end x86_64_linux_gnu_bits_byteswap_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
