pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_types_u_locale_t_h;

package x86_64_linux_gnu_bits_types_locale_t_h is

  -- Definition of locale_t.
  --   Copyright (C) 2017-2024 Free Software Foundation, Inc.
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

   subtype locale_t is x86_64_linux_gnu_bits_types_u_locale_t_h.uu_locale_t;  -- /usr/include/x86_64-linux-gnu/bits/types/locale_t.h:24

end x86_64_linux_gnu_bits_types_locale_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
