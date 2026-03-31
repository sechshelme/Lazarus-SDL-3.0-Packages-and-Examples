pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with stddef_h;
with x86_64_linux_gnu_bits_types_locale_t_h;
with System;
with x86_64_linux_gnu_bits_types_wint_t_h;
limited with x86_64_linux_gnu_bits_types_u_mbstate_t_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with x86_64_linux_gnu_bits_types_u_FILE_h;

package wchar_h is

   --  unsupported macro: WCHAR_MIN __WCHAR_MIN
   --  unsupported macro: WCHAR_MAX __WCHAR_MAX
   WEOF : constant := (16#ffffffff#);  --  /usr/include/wchar.h:75

  -- Copyright (C) 1995-2024 Free Software Foundation, Inc.
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

  -- *      ISO C99 Standard: 7.24
  -- *	Extended multibyte and wide character utilities	<wchar.h>
  --  

  -- Gather machine dependent type support.   
  -- Tell the caller that we provide correct C++ prototypes.   
  -- These constants might also be defined in <inttypes.h>.   
  -- All versions of XPG prior to the publication of ISO C99 required
  --   the bulk of <wctype.h>'s declarations to appear in this header
  --   (because <wctype.h> did not exist prior to C99).  In POSIX.1-2001
  --   those declarations were marked as XSI extensions; in -2008 they
  --   were additionally marked as obsolescent.  _GNU_SOURCE mode
  --   anticipates the removal of these declarations in the next revision
  --   of POSIX.   

  -- This incomplete type is defined in <time.h> but needed here because
  --   of `wcsftime'.   

   type tm is null record;   -- incomplete struct

  -- Copy SRC to DEST.   
   function wcscpy (uu_dest : access stddef_h.wchar_t; uu_src : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "wcscpy";

  -- Copy no more than N wide-characters of SRC to DEST.   
   function wcsncpy
     (uu_dest : access stddef_h.wchar_t;
      uu_src : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:103
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncpy";

  -- Copy at most N - 1 characters from SRC to DEST.   
   function wcslcpy
     (uu_dest : access stddef_h.wchar_t;
      uu_src : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/wchar.h:109
   with Import => True, 
        Convention => C, 
        External_Name => "wcslcpy";

  -- Append SRC to DEST, possibly with truncation to keep the total size
  --   below N.   

   function wcslcat
     (uu_dest : access stddef_h.wchar_t;
      uu_src : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/wchar.h:115
   with Import => True, 
        Convention => C, 
        External_Name => "wcslcat";

  -- Append SRC onto DEST.   
   function wcscat (uu_dest : access stddef_h.wchar_t; uu_src : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "wcscat";

  -- Append no more than N wide-characters of SRC onto DEST.   
   function wcsncat
     (uu_dest : access stddef_h.wchar_t;
      uu_src : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:125
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncat";

  -- Compare S1 and S2.   
   function wcscmp (uu_s1 : access stddef_h.wchar_t; uu_s2 : access stddef_h.wchar_t) return int  -- /usr/include/wchar.h:130
   with Import => True, 
        Convention => C, 
        External_Name => "wcscmp";

  -- Compare N wide-characters of S1 and S2.   
   function wcsncmp
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return int  -- /usr/include/wchar.h:133
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncmp";

  -- Compare S1 and S2, ignoring case.   
   function wcscasecmp (uu_s1 : access stddef_h.wchar_t; uu_s2 : access stddef_h.wchar_t) return int  -- /usr/include/wchar.h:138
   with Import => True, 
        Convention => C, 
        External_Name => "wcscasecmp";

  -- Compare no more than N chars of S1 and S2, ignoring case.   
   function wcsncasecmp
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return int  -- /usr/include/wchar.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncasecmp";

  -- Similar to the two functions above but take the information from
  --   the provided locale and not the global locale.   

   function wcscasecmp_l
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_loc : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int  -- /usr/include/wchar.h:146
   with Import => True, 
        Convention => C, 
        External_Name => "wcscasecmp_l";

   function wcsncasecmp_l
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t;
      uu_loc : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int  -- /usr/include/wchar.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "wcsncasecmp_l";

  -- Compare S1 and S2, both interpreted as appropriate to the
  --   LC_COLLATE category of the current locale.   

   function wcscoll (uu_s1 : access stddef_h.wchar_t; uu_s2 : access stddef_h.wchar_t) return int  -- /usr/include/wchar.h:155
   with Import => True, 
        Convention => C, 
        External_Name => "wcscoll";

  -- Transform S2 into array pointed to by S1 such that if wcscmp is
  --   applied to two transformed strings the result is the as applying
  --   `wcscoll' to the original strings.   

   function wcsxfrm
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/wchar.h:159
   with Import => True, 
        Convention => C, 
        External_Name => "wcsxfrm";

  -- Similar to the two functions above but take the information from
  --   the provided locale and not the global locale.   

  -- Compare S1 and S2, both interpreted as appropriate to the
  --   LC_COLLATE category of the given locale.   

   function wcscoll_l
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_loc : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int  -- /usr/include/wchar.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "wcscoll_l";

  -- Transform S2 into array pointed to by S1 such that if wcscmp is
  --   applied to two transformed strings the result is the as applying
  --   `wcscoll' to the original strings.   

   function wcsxfrm_l
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t;
      uu_loc : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return stddef_h.size_t  -- /usr/include/wchar.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "wcsxfrm_l";

  -- Duplicate S, returning an identical malloc'd string.   
   function wcsdup (uu_s : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:178
   with Import => True, 
        Convention => C, 
        External_Name => "wcsdup";

  -- Find the first occurrence of WC in WCS.   
   function wcschr (uu_wcs : access stddef_h.wchar_t; uu_wc : stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "wcschr";

  -- Find the last occurrence of WC in WCS.   
   function wcsrchr (uu_wcs : access stddef_h.wchar_t; uu_wc : stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "wcsrchr";

  -- This function is similar to `wcschr'.  But it returns a pointer to
  --   the closing NUL wide character in case C is not found in S.   

  -- Return the length of the initial segmet of WCS which
  --   consists entirely of wide characters not in REJECT.   

   function wcscspn (uu_wcs : access stddef_h.wchar_t; uu_reject : access stddef_h.wchar_t) return stddef_h.size_t  -- /usr/include/wchar.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "wcscspn";

  -- Return the length of the initial segmet of WCS which
  --   consists entirely of wide characters in  ACCEPT.   

   function wcsspn (uu_wcs : access stddef_h.wchar_t; uu_accept : access stddef_h.wchar_t) return stddef_h.size_t  -- /usr/include/wchar.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "wcsspn";

  -- Find the first occurrence in WCS of any character in ACCEPT.   
   function wcspbrk (uu_wcs : access stddef_h.wchar_t; uu_accept : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:226
   with Import => True, 
        Convention => C, 
        External_Name => "wcspbrk";

  -- Find the first occurrence of NEEDLE in HAYSTACK.   
   function wcsstr (uu_haystack : access stddef_h.wchar_t; uu_needle : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:237
   with Import => True, 
        Convention => C, 
        External_Name => "wcsstr";

  -- Divide WCS into tokens separated by characters in DELIM.   
   function wcstok
     (uu_s : access stddef_h.wchar_t;
      uu_delim : access stddef_h.wchar_t;
      uu_ptr : System.Address) return access stddef_h.wchar_t  -- /usr/include/wchar.h:242
   with Import => True, 
        Convention => C, 
        External_Name => "wcstok";

  -- Return the number of wide characters in S.   
   function wcslen (uu_s : access stddef_h.wchar_t) return stddef_h.size_t  -- /usr/include/wchar.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "wcslen";

  -- Another name for `wcsstr' from XPG4.   
  -- Return the number of wide characters in S, but at most MAXLEN.   
   function wcsnlen (uu_s : access stddef_h.wchar_t; uu_maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/wchar.h:265
   with Import => True, 
        Convention => C, 
        External_Name => "wcsnlen";

  -- Search N wide characters of S for C.   
   function wmemchr
     (uu_s : access stddef_h.wchar_t;
      uu_c : stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:278
   with Import => True, 
        Convention => C, 
        External_Name => "wmemchr";

  -- Compare N wide characters of S1 and S2.   
   function wmemcmp
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return int  -- /usr/include/wchar.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "wmemcmp";

  -- Copy N wide characters of SRC to DEST.   
   function wmemcpy
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:287
   with Import => True, 
        Convention => C, 
        External_Name => "wmemcpy";

  -- Copy N wide characters of SRC to DEST, guaranteeing
  --   correct behavior for overlapping strings.   

   function wmemmove
     (uu_s1 : access stddef_h.wchar_t;
      uu_s2 : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:292
   with Import => True, 
        Convention => C, 
        External_Name => "wmemmove";

  -- Set N wide characters of S to C.   
   function wmemset
     (uu_s : access stddef_h.wchar_t;
      uu_c : stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:296
   with Import => True, 
        Convention => C, 
        External_Name => "wmemset";

  -- Copy N wide characters of SRC to DEST and return pointer to following
  --   wide character.   

  -- Determine whether C constitutes a valid (one-byte) multibyte
  --   character.   

   function btowc (uu_c : int) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:309
   with Import => True, 
        Convention => C, 
        External_Name => "btowc";

  -- Determine whether C corresponds to a member of the extended
  --   character set whose multibyte representation is a single byte.   

   function wctob (uu_c : x86_64_linux_gnu_bits_types_wint_t_h.wint_t) return int  -- /usr/include/wchar.h:313
   with Import => True, 
        Convention => C, 
        External_Name => "wctob";

  -- Determine whether PS points to an object representing the initial
  --   state.   

   function mbsinit (uu_ps : access constant x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return int  -- /usr/include/wchar.h:317
   with Import => True, 
        Convention => C, 
        External_Name => "mbsinit";

  -- Write wide character representation of multibyte character pointed
  --   to by S to PWC.   

   function mbrtowc
     (uu_pwc : access stddef_h.wchar_t;
      uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_p : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "mbrtowc";

  -- Write multibyte representation of wide character WC to S.   
   function wcrtomb
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_wc : stddef_h.wchar_t;
      uu_ps : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "wcrtomb";

  -- Return number of bytes in multibyte character pointed to by S.   
   --  skipped func __mbrlen

   function mbrlen
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_ps : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "mbrlen";

  -- Define inline function as optimization.   
  -- We can use the BTOWC and WCTOB optimizations since we know that all
  --   locales must use ASCII encoding for the values in the ASCII range
  --   and because the wchar_t encoding is always ISO 10646.   

  -- Write wide character representation of multibyte character string
  --   SRC to DST.   

   function mbsrtowcs
     (uu_dst : access stddef_h.wchar_t;
      uu_src : System.Address;
      uu_len : stddef_h.size_t;
      uu_ps : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:362
   with Import => True, 
        Convention => C, 
        External_Name => "mbsrtowcs";

  -- Write multibyte character representation of wide character string
  --   SRC to DST.   

   function wcsrtombs
     (uu_dst : Interfaces.C.Strings.chars_ptr;
      uu_src : System.Address;
      uu_len : stddef_h.size_t;
      uu_ps : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:368
   with Import => True, 
        Convention => C, 
        External_Name => "wcsrtombs";

  -- Write wide character representation of at most NMC bytes of the
  --   multibyte character string SRC to DST.   

   function mbsnrtowcs
     (uu_dst : access stddef_h.wchar_t;
      uu_src : System.Address;
      uu_nmc : stddef_h.size_t;
      uu_len : stddef_h.size_t;
      uu_ps : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:376
   with Import => True, 
        Convention => C, 
        External_Name => "mbsnrtowcs";

  -- Write multibyte character representation of at most NWC characters
  --   from the wide character string SRC to DST.   

   function wcsnrtombs
     (uu_dst : Interfaces.C.Strings.chars_ptr;
      uu_src : System.Address;
      uu_nwc : stddef_h.size_t;
      uu_len : stddef_h.size_t;
      uu_ps : access x86_64_linux_gnu_bits_types_u_mbstate_t_h.uu_mbstate_t) return stddef_h.size_t  -- /usr/include/wchar.h:382
   with Import => True, 
        Convention => C, 
        External_Name => "wcsnrtombs";

  -- The following functions are extensions found in X/Open CAE.   
  -- Determine number of column positions required for C.   
  -- Determine number of column positions required for first N wide
  --   characters (or fewer if S ends before this) in S.   

  -- Convert initial portion of the wide string NPTR to `double'
  --   representation.   

   function wcstod (uu_nptr : access stddef_h.wchar_t; uu_endptr : System.Address) return double  -- /usr/include/wchar.h:402
   with Import => True, 
        Convention => C, 
        External_Name => "wcstod";

  -- Likewise for `float' and `long double' sizes of floating-point numbers.   
   function wcstof (uu_nptr : access stddef_h.wchar_t; uu_endptr : System.Address) return float  -- /usr/include/wchar.h:407
   with Import => True, 
        Convention => C, 
        External_Name => "wcstof";

   function wcstold (uu_nptr : access stddef_h.wchar_t; uu_endptr : System.Address) return long_double  -- /usr/include/wchar.h:409
   with Import => True, 
        Convention => C, 
        External_Name => "wcstold";

  -- Likewise for `_FloatN' and `_FloatNx' when support is enabled.   
  -- Convert initial portion of wide string NPTR to `long int'
  --   representation.   

   function wcstol
     (uu_nptr : access stddef_h.wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return long  -- /usr/include/wchar.h:455
   with Import => True, 
        Convention => C, 
        External_Name => "wcstol";

  -- Convert initial portion of wide string NPTR to `unsigned long int'
  --   representation.   

   function wcstoul
     (uu_nptr : access stddef_h.wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return unsigned_long  -- /usr/include/wchar.h:460
   with Import => True, 
        Convention => C, 
        External_Name => "wcstoul";

  -- Convert initial portion of wide string NPTR to `long long int'
  --   representation.   

   function wcstoll
     (uu_nptr : access stddef_h.wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Long_Long_Integer  -- /usr/include/wchar.h:468
   with Import => True, 
        Convention => C, 
        External_Name => "wcstoll";

  -- Convert initial portion of wide string NPTR to `unsigned long long int'
  --   representation.   

   function wcstoull
     (uu_nptr : access stddef_h.wchar_t;
      uu_endptr : System.Address;
      uu_base : int) return Extensions.unsigned_long_long  -- /usr/include/wchar.h:475
   with Import => True, 
        Convention => C, 
        External_Name => "wcstoull";

  -- Convert initial portion of wide string NPTR to `long long int'
  --   representation.   

  -- Convert initial portion of wide string NPTR to `unsigned long long int'
  --   representation.   

  -- Versions of the above functions that handle '0b' and '0B' prefixes
  --   in base 0 or 2.   

  -- Parallel versions of the functions above which take the locale to
  --   use as an additional parameter.  These are GNU extensions inspired
  --   by the POSIX.1-2008 extended locale API.   

  -- Versions of the above functions that handle '0b' and '0B' prefixes
  --   in base 0 or 2.   

  -- Copy SRC to DEST, returning the address of the terminating L'\0' in
  --   DEST.   

   function wcpcpy (uu_dest : access stddef_h.wchar_t; uu_src : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:689
   with Import => True, 
        Convention => C, 
        External_Name => "wcpcpy";

  -- Copy no more than N characters of SRC to DEST, returning the address of
  --   the last character written into DEST.   

   function wcpncpy
     (uu_dest : access stddef_h.wchar_t;
      uu_src : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/include/wchar.h:694
   with Import => True, 
        Convention => C, 
        External_Name => "wcpncpy";

  -- Wide character I/O functions.   
  -- If the attribute macro hasn't been defined yet (by <stdio.h>) and
  --   fclose is a built-in, use it.   

  -- Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
  --   a wide character string.   

   function open_wmemstream (uu_bufloc : System.Address; uu_sizeloc : access stddef_h.size_t) return access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE  -- /usr/include/wchar.h:718
   with Import => True, 
        Convention => C, 
        External_Name => "open_wmemstream";

  -- Select orientation for stream.   
   function fwide (uu_fp : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE; uu_mode : int) return int  -- /usr/include/wchar.h:725
   with Import => True, 
        Convention => C, 
        External_Name => "fwide";

  -- Write formatted output to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fwprintf (uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE; uu_format : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/include/wchar.h:732
   with Import => True, 
        Convention => C, 
        External_Name => "fwprintf";

  -- __attribute__ ((__format__ (__wprintf__, 2, 3)))  
  -- Write formatted output to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function wprintf (uu_format : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/include/wchar.h:739
   with Import => True, 
        Convention => C, 
        External_Name => "wprintf";

  -- __attribute__ ((__format__ (__wprintf__, 1, 2)))  
  -- Write formatted output of at most N characters to S.   
   function swprintf
     (uu_s : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t;
      uu_format : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/include/wchar.h:742
   with Import => True, 
        Convention => C, 
        External_Name => "swprintf";

  -- __attribute__ ((__format__ (__wprintf__, 3, 4)))  
  -- Write formatted output to S from argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vfwprintf
     (uu_s : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE;
      uu_format : access stddef_h.wchar_t;
      uu_arg : access System.Address) return int  -- /usr/include/wchar.h:750
   with Import => True, 
        Convention => C, 
        External_Name => "vfwprintf";

  -- __attribute__ ((__format__ (__wprintf__, 2, 0)))  
  -- Write formatted output to stdout from argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function vwprintf (uu_format : access stddef_h.wchar_t; uu_arg : access System.Address) return int  -- /usr/include/wchar.h:758
   with Import => True, 
        Convention => C, 
        External_Name => "vwprintf";

  -- __attribute__ ((__format__ (__wprintf__, 1, 0)))  
  -- Write formatted output of at most N character to S from argument
  --   list ARG.   

   function vswprintf
     (uu_s : access stddef_h.wchar_t;
      uu_n : stddef_h.size_t;
      uu_format : access stddef_h.wchar_t;
      uu_arg : access System.Address) return int  -- /usr/include/wchar.h:763
   with Import => True, 
        Convention => C, 
        External_Name => "vswprintf";

  -- __attribute__ ((__format__ (__wprintf__, 3, 0)))  
  -- Read formatted input from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- Read formatted input from stdin.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- __attribute__ ((__format__ (__wscanf__, 1, 2)))  
  -- Read formatted input from S.   
  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- For historical reasons, the C99-compliant versions of the scanf
  --   functions are at alternative names.  When __LDBL_COMPAT or
  --   __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI are in effect, this is handled in
  --   bits/wchar-ldbl.h.   

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- __attribute__ ((__format__ (__wscanf__, 1, 2)))  
  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
   function fwscanf (uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE; uu_format : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/include/wchar.h:819
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_fwscanf";

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
   function wscanf (uu_format : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/include/wchar.h:823
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_wscanf";

  -- __attribute__ ((__format__ (__wscanf__, 1, 2)))  
   function swscanf (uu_s : access stddef_h.wchar_t; uu_format : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/include/wchar.h:826
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_swscanf";

  -- __attribute__ ((__format__ (__wscanf__, 2, 3)))  
  -- Read formatted input from S into argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- Read formatted input from stdin into argument list ARG.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

  -- __attribute__ ((__format__ (__wscanf__, 1, 0)))  
  -- Read formatted input from S into argument list ARG.   
  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- Same redirection as above for the v*wscanf family.   
  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- __attribute__ ((__format__ (__wscanf__, 1, 0)))  
  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
   function vfwscanf
     (uu_s : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE;
      uu_format : access stddef_h.wchar_t;
      uu_arg : access System.Address) return int  -- /usr/include/wchar.h:901
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_vfwscanf";

  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
   function vwscanf (uu_format : access stddef_h.wchar_t; uu_arg : access System.Address) return int  -- /usr/include/wchar.h:905
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_vwscanf";

  -- __attribute__ ((__format__ (__wscanf__, 1, 0)))  
   function vswscanf
     (uu_s : access stddef_h.wchar_t;
      uu_format : access stddef_h.wchar_t;
      uu_arg : access System.Address) return int  -- /usr/include/wchar.h:908
   with Import => True, 
        Convention => C, 
        External_Name => "__isoc99_vswscanf";

  -- __attribute__ ((__format__ (__wscanf__, 2, 0)))  
  -- Read a character from STREAM.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function fgetwc (uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:935
   with Import => True, 
        Convention => C, 
        External_Name => "fgetwc";

   function getwc (uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:936
   with Import => True, 
        Convention => C, 
        External_Name => "getwc";

  -- Read a character from stdin.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function getwchar return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:942
   with Import => True, 
        Convention => C, 
        External_Name => "getwchar";

  -- Write a character to STREAM.
  --   These functions are possible cancellation points and therefore not
  --   marked with __THROW.   

   function fputwc (uu_wc : stddef_h.wchar_t; uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:949
   with Import => True, 
        Convention => C, 
        External_Name => "fputwc";

   function putwc (uu_wc : stddef_h.wchar_t; uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:950
   with Import => True, 
        Convention => C, 
        External_Name => "putwc";

  -- Write a character to stdout.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function putwchar (uu_wc : stddef_h.wchar_t) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:956
   with Import => True, 
        Convention => C, 
        External_Name => "putwchar";

  -- Get a newline-terminated wide character string of finite length
  --   from STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fgetws
     (uu_ws : access stddef_h.wchar_t;
      uu_n : int;
      uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return access stddef_h.wchar_t  -- /usr/include/wchar.h:964
   with Import => True, 
        Convention => C, 
        External_Name => "fgetws";

  -- Write a string to STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function fputws (uu_ws : access stddef_h.wchar_t; uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return int  -- /usr/include/wchar.h:971
   with Import => True, 
        Convention => C, 
        External_Name => "fputws";

  -- Push a character back onto the input buffer of STREAM.
  --   This function is a possible cancellation point and therefore not
  --   marked with __THROW.   

   function ungetwc (uu_wc : x86_64_linux_gnu_bits_types_wint_t_h.wint_t; uu_stream : access x86_64_linux_gnu_bits_types_u_FILE_h.u_IO_FILE) return x86_64_linux_gnu_bits_types_wint_t_h.wint_t  -- /usr/include/wchar.h:979
   with Import => True, 
        Convention => C, 
        External_Name => "ungetwc";

  -- These are defined to be equivalent to the `char' functions defined
  --   in POSIX.1:1996.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

  -- This is the wide character version of a GNU extension.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Faster version when locking is not necessary.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- These are defined to be equivalent to the `char' functions defined
  --   in POSIX.1:1996.
  --   These functions are not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation they are cancellation points and
  --   therefore not marked with __THROW.   

  -- This function does the same as `fgetws' but does not lock the stream.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- This function does the same as `fputws' but does not lock the stream.
  --   This function is not part of POSIX and therefore no official
  --   cancellation point.  But due to similarity with an POSIX interface
  --   or due to the implementation it is a cancellation point and
  --   therefore not marked with __THROW.   

  -- Format TP into S according to FORMAT.
  --   Write no more than MAXSIZE wide characters and return the number
  --   of wide characters written, or 0 if it would exceed MAXSIZE.   

   function wcsftime
     (uu_s : access stddef_h.wchar_t;
      uu_maxsize : stddef_h.size_t;
      uu_format : access stddef_h.wchar_t;
      uu_tp : access constant tm) return stddef_h.size_t  -- /usr/include/wchar.h:1043
   with Import => True, 
        Convention => C, 
        External_Name => "wcsftime";

  -- Similar to `wcsftime' but takes the information from
  --   the provided locale and not the global locale.   

  -- Define some macros helping to catch buffer overflows.   
  -- Declare all functions from bits/wchar2-decl.h first.   
  -- The following headers provide asm redirections.  These redirections must
  --   appear before the first usage of these functions, e.g. in bits/wchar.h.   

  -- Now include the function definitions and redirects too.   
end wchar_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
