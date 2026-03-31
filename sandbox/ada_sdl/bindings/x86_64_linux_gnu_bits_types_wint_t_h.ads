pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package x86_64_linux_gnu_bits_types_wint_t_h is

  -- Some versions of stddef.h provide wint_t, even though neither the
  --   C nor C++ standards, nor POSIX, specifies this.  We assume that
  --   stddef.h will define the macro _WINT_T if and only if it provides
  --   wint_t, and conversely, that it will avoid providing wint_t if
  --   _WINT_T is already defined.   

  -- Integral type unchanged by default argument promotions that can
  --   hold any value corresponding to members of the extended character
  --   set, as well as at least one value that does not correspond to any
  --   member of the extended character set.   

   subtype wint_t is unsigned;  -- /usr/include/x86_64-linux-gnu/bits/types/wint_t.h:20

end x86_64_linux_gnu_bits_types_wint_t_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
