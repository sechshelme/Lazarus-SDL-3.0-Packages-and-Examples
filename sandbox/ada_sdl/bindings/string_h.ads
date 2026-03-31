pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with stddef_h;
with Interfaces.C.Strings;
with x86_64_linux_gnu_bits_types_locale_t_h;

package string_h is

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

  -- *	ISO C99 Standard: 7.21 String handling	<string.h>
  --  

  -- Get size_t and NULL from <stddef.h>.   
  -- Tell the caller that we provide correct C++ prototypes.   
  -- Copy N bytes of SRC to DEST.   
   function memcpy
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_n : stddef_h.size_t) return System.Address  -- /usr/include/string.h:43
   with Import => True, 
        Convention => C, 
        External_Name => "memcpy";

  -- Copy N bytes of SRC to DEST, guaranteeing
  --   correct behavior for overlapping strings.   

   function memmove
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_n : stddef_h.size_t) return System.Address  -- /usr/include/string.h:47
   with Import => True, 
        Convention => C, 
        External_Name => "memmove";

  -- Copy no more than N bytes of SRC to DEST, stopping when C is found.
  --   Return the position in DEST one byte past where C was copied,
  --   or NULL if C was not found in the first N bytes of SRC.   

   function memccpy
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address  -- /usr/include/string.h:54
   with Import => True, 
        Convention => C, 
        External_Name => "memccpy";

  -- Set N bytes of S to C.   
   function memset
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address  -- /usr/include/string.h:61
   with Import => True, 
        Convention => C, 
        External_Name => "memset";

  -- Compare N bytes of S1 and S2.   
   function memcmp
     (uu_s1 : System.Address;
      uu_s2 : System.Address;
      uu_n : stddef_h.size_t) return int  -- /usr/include/string.h:64
   with Import => True, 
        Convention => C, 
        External_Name => "memcmp";

  -- Compare N bytes of S1 and S2.  Return zero if S1 and S2 are equal.
  --   Return some non-zero value otherwise.
  --   Essentially __memcmpeq has the exact same semantics as memcmp
  --   except the return value is less constrained.  memcmp is always a
  --   correct implementation of __memcmpeq.  As well !!memcmp, -memcmp,
  --   or bcmp are correct implementations.
  --   __memcmpeq is meant to be used by compilers when memcmp return is
  --   only used for its boolean value.
  --   __memcmpeq is declared only for use by compilers.  Programs should
  --   continue to use memcmp.   

   --  skipped func __memcmpeq

  -- Search N bytes of S for C.   
   function memchr
     (uu_s : System.Address;
      uu_c : int;
      uu_n : stddef_h.size_t) return System.Address  -- /usr/include/string.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "memchr";

  -- Search in S for C.  This is similar to `memchr' but there is no
  --   length limit.   

  -- Search N bytes of S for the final occurrence of C.   
  -- Copy SRC to DEST.   
   function strcpy (uu_dest : Interfaces.C.Strings.chars_ptr; uu_src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:141
   with Import => True, 
        Convention => C, 
        External_Name => "strcpy";

  -- Copy no more than N characters of SRC to DEST.   
   function strncpy
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:144
   with Import => True, 
        Convention => C, 
        External_Name => "strncpy";

  -- Append SRC onto DEST.   
   function strcat (uu_dest : Interfaces.C.Strings.chars_ptr; uu_src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:149
   with Import => True, 
        Convention => C, 
        External_Name => "strcat";

  -- Append no more than N characters from SRC onto DEST.   
   function strncat
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:152
   with Import => True, 
        Convention => C, 
        External_Name => "strncat";

  -- Compare S1 and S2.   
   function strcmp (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/string.h:156
   with Import => True, 
        Convention => C, 
        External_Name => "strcmp";

  -- Compare N characters of S1 and S2.   
   function strncmp
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return int  -- /usr/include/string.h:159
   with Import => True, 
        Convention => C, 
        External_Name => "strncmp";

  -- Compare the collated forms of S1 and S2.   
   function strcoll (uu_s1 : Interfaces.C.Strings.chars_ptr; uu_s2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/include/string.h:163
   with Import => True, 
        Convention => C, 
        External_Name => "strcoll";

  -- Put a transformation of SRC into no more than N bytes of DEST.   
   function strxfrm
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/string.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "strxfrm";

  -- POSIX.1-2008 extended locale interface (see locale.h).   
  -- Compare the collated forms of S1 and S2, using sorting rules from L.   
   function strcoll_l
     (uu_s1 : Interfaces.C.Strings.chars_ptr;
      uu_s2 : Interfaces.C.Strings.chars_ptr;
      uu_l : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return int  -- /usr/include/string.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "strcoll_l";

  -- Put a transformation of SRC into no more than N bytes of DEST,
  --   using sorting rules from L.   

   function strxfrm_l
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t;
      uu_l : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return stddef_h.size_t  -- /usr/include/string.h:179
   with Import => True, 
        Convention => C, 
        External_Name => "strxfrm_l";

  -- Duplicate S, returning an identical malloc'd string.   
   function strdup (uu_s : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:187
   with Import => True, 
        Convention => C, 
        External_Name => "strdup";

  -- Return a malloc'd copy of at most N bytes of STRING.  The
  --   resultant string is terminated even if no null terminator
  --   appears before STRING[N].   

   function strndup (uu_string : Interfaces.C.Strings.chars_ptr; uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:195
   with Import => True, 
        Convention => C, 
        External_Name => "strndup";

  -- Duplicate S, returning an identical alloca'd string.   
  -- Return an alloca'd copy of at most N bytes of string.   
  -- Find the first occurrence of C in S.   
   function strchr (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:246
   with Import => True, 
        Convention => C, 
        External_Name => "strchr";

  -- Find the last occurrence of C in S.   
   function strrchr (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "strrchr";

  -- This function is similar to `strchr'.  But it returns a pointer to
  --   the closing NUL byte in case C is not found in S.   

   function strchrnul (uu_s : Interfaces.C.Strings.chars_ptr; uu_c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:286
   with Import => True, 
        Convention => C, 
        External_Name => "strchrnul";

  -- Return the length of the initial segment of S which
  --   consists entirely of characters not in REJECT.   

   function strcspn (uu_s : Interfaces.C.Strings.chars_ptr; uu_reject : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t  -- /usr/include/string.h:293
   with Import => True, 
        Convention => C, 
        External_Name => "strcspn";

  -- Return the length of the initial segment of S which
  --   consists entirely of characters in ACCEPT.   

   function strspn (uu_s : Interfaces.C.Strings.chars_ptr; uu_accept : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t  -- /usr/include/string.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "strspn";

  -- Find the first occurrence in S of any character in ACCEPT.   
   function strpbrk (uu_s : Interfaces.C.Strings.chars_ptr; uu_accept : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "strpbrk";

  -- Find the first occurrence of NEEDLE in HAYSTACK.   
   function strstr (uu_haystack : Interfaces.C.Strings.chars_ptr; uu_needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:350
   with Import => True, 
        Convention => C, 
        External_Name => "strstr";

  -- Divide S into tokens separated by characters in DELIM.   
   function strtok (uu_s : Interfaces.C.Strings.chars_ptr; uu_delim : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:356
   with Import => True, 
        Convention => C, 
        External_Name => "strtok";

  -- Divide S into tokens separated by characters in DELIM.  Information
  --   passed between calls are stored in SAVE_PTR.   

   --  skipped func __strtok_r

   function strtok_r
     (uu_s : Interfaces.C.Strings.chars_ptr;
      uu_delim : Interfaces.C.Strings.chars_ptr;
      uu_save_ptr : System.Address) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "strtok_r";

  -- Similar to `strstr' but this function ignores the case of both strings.   
   function strcasestr (uu_haystack : Interfaces.C.Strings.chars_ptr; uu_needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:380
   with Import => True, 
        Convention => C, 
        External_Name => "strcasestr";

  -- Find the first occurrence of NEEDLE in HAYSTACK.
  --   NEEDLE is NEEDLELEN bytes long;
  --   HAYSTACK is HAYSTACKLEN bytes long.   

   function memmem
     (uu_haystack : System.Address;
      uu_haystacklen : stddef_h.size_t;
      uu_needle : System.Address;
      uu_needlelen : stddef_h.size_t) return System.Address  -- /usr/include/string.h:389
   with Import => True, 
        Convention => C, 
        External_Name => "memmem";

  -- Copy N bytes of SRC to DEST, return pointer to bytes after the
  --   last written byte.   

   --  skipped func __mempcpy

   function mempcpy
     (uu_dest : System.Address;
      uu_src : System.Address;
      uu_n : stddef_h.size_t) return System.Address  -- /usr/include/string.h:400
   with Import => True, 
        Convention => C, 
        External_Name => "mempcpy";

  -- Return the length of S.   
   function strlen (uu_s : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t  -- /usr/include/string.h:407
   with Import => True, 
        Convention => C, 
        External_Name => "strlen";

  -- Find the length of STRING, but scan at most MAXLEN characters.
  --   If no '\0' terminator is found in that many characters, return MAXLEN.   

   function strnlen (uu_string : Interfaces.C.Strings.chars_ptr; uu_maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/string.h:413
   with Import => True, 
        Convention => C, 
        External_Name => "strnlen";

  -- Return a string describing the meaning of the `errno' code in ERRNUM.   
   function strerror (uu_errnum : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:419
   with Import => True, 
        Convention => C, 
        External_Name => "strerror";

  -- Reentrant version of `strerror'.
  --   There are 2 flavors of `strerror_r', GNU which returns the string
  --   and may or may not use the supplied temporary buffer and POSIX one
  --   which fills the string into the buffer.
  --   To use the POSIX version, -D_XOPEN_SOURCE=600 or -D_POSIX_C_SOURCE=200112L
  --   without -D_GNU_SOURCE is needed, otherwise the GNU version is
  --   preferred.   

  -- Fill BUF with a string describing the meaning of the `errno' code in
  --   ERRNUM.   

   function strerror_r
     (uu_errnum : int;
      uu_buf : Interfaces.C.Strings.chars_ptr;
      uu_buflen : stddef_h.size_t) return int  -- /usr/include/string.h:432
   with Import => True, 
        Convention => C, 
        External_Name => "__xpg_strerror_r";

  -- If a temporary buffer is required, at most BUFLEN bytes of BUF will be
  --   used.   

  -- Return a string describing the meaning of tthe error in ERR.   
  -- Return a string with the error name in ERR.   
  -- Translate error number to string according to the locale L.   
   function strerror_l (uu_errnum : int; uu_l : x86_64_linux_gnu_bits_types_locale_t_h.locale_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:458
   with Import => True, 
        Convention => C, 
        External_Name => "strerror_l";

  -- Set N bytes of S to 0.  The compiler will not delete a call to this
  --   function, even if S is dead after the call.   

   procedure explicit_bzero (uu_s : System.Address; uu_n : stddef_h.size_t)  -- /usr/include/string.h:466
   with Import => True, 
        Convention => C, 
        External_Name => "explicit_bzero";

  -- Return the next DELIM-delimited token from *STRINGP,
  --   terminating it with a '\0', and update *STRINGP to point past it.   

   function strsep (uu_stringp : System.Address; uu_delim : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:471
   with Import => True, 
        Convention => C, 
        External_Name => "strsep";

  -- Return a string describing the meaning of the signal number in SIG.   
   function strsignal (uu_sig : int) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:478
   with Import => True, 
        Convention => C, 
        External_Name => "strsignal";

  -- Return an abbreviation string for the signal number SIG.   
  -- Return a string describing the meaning of the signal number in SIG,
  --   the result is not translated.   

  -- Copy SRC to DEST, returning the address of the terminating '\0' in DEST.   
   --  skipped func __stpcpy

   function stpcpy (uu_dest : Interfaces.C.Strings.chars_ptr; uu_src : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:491
   with Import => True, 
        Convention => C, 
        External_Name => "stpcpy";

  -- Copy no more than N characters of SRC to DEST, returning the address of
  --   the last character written into DEST.   

   --  skipped func __stpncpy

   function stpncpy
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/include/string.h:499
   with Import => True, 
        Convention => C, 
        External_Name => "stpncpy";

  -- Copy at most N - 1 characters from SRC to DEST.   
   function strlcpy
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/string.h:506
   with Import => True, 
        Convention => C, 
        External_Name => "strlcpy";

  -- Append SRC to DEST, possibly with truncation to keep the total size
  --   below N.   

   function strlcat
     (uu_dest : Interfaces.C.Strings.chars_ptr;
      uu_src : Interfaces.C.Strings.chars_ptr;
      uu_n : stddef_h.size_t) return stddef_h.size_t  -- /usr/include/string.h:512
   with Import => True, 
        Convention => C, 
        External_Name => "strlcat";

  -- Compare S1 and S2 as strings holding name & indices/version numbers.   
  -- Sautee STRING briskly.   
  -- Frobnicate N bytes of S.   
  -- Return the file name within directory of FILENAME.  We don't
  --   declare the function if the `basename' macro is available (defined
  --   in <libgen.h>) which makes the XPG version of this function
  --   available.   

  -- Functions with security checks.   
end string_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
