pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with x86_64_linux_gnu_bits_stdint_intn_h;
with x86_64_linux_gnu_bits_stdint_uintn_h;
with System;
with stddef_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;

package SDL3_SDL_stdinc_h is

   --  unsupported macro: alloca __builtin_alloca
   --  unsupported macro: SDL_SIZE_MAX SIZE_MAX
   --  unsupported macro: SDL_COMPILE_TIME_ASSERT(name,x) _Static_assert(x, #x)
   --  arg-macro: function SDL_arraysize (array)
   --    return sizeof(array)/sizeof(array(0));
   --  unsupported macro: SDL_STRINGIFY_ARG(arg) #arg
   --  arg-macro: function SDL_reinterpret_cast (type, expression)
   --    return (type)(expression);
   --  arg-macro: function SDL_static_cast (type, expression)
   --    return (type)(expression);
   --  arg-macro: function SDL_const_cast (type, expression)
   --    return (type)(expression);
   --  arg-macro: function SDL_FOURCC (A, B, C, D)
   --    return (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (A))) << 0) or (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (B))) << 8) or (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (C))) << 16) or (SDL_static_cast(Uint32, SDL_static_cast(Uint8, (D))) << 24);
   --  arg-macro: procedure SDL_SINT64_C (c)
   --    INT64_C(c)
   --  arg-macro: procedure SDL_UINT64_C (c)
   --    UINT64_C(c)
   --  unsupported macro: SDL_MAX_SINT8 ((Sint8)0x7F)
   --  unsupported macro: SDL_MIN_SINT8 ((Sint8)(~0x7F))
   --  unsupported macro: SDL_MAX_UINT8 ((Uint8)0xFF)
   --  unsupported macro: SDL_MIN_UINT8 ((Uint8)0x00)
   --  unsupported macro: SDL_MAX_SINT16 ((Sint16)0x7FFF)
   --  unsupported macro: SDL_MIN_SINT16 ((Sint16)(~0x7FFF))
   --  unsupported macro: SDL_MAX_UINT16 ((Uint16)0xFFFF)
   --  unsupported macro: SDL_MIN_UINT16 ((Uint16)0x0000)
   --  unsupported macro: SDL_MAX_SINT32 ((Sint32)0x7FFFFFFF)
   --  unsupported macro: SDL_MIN_SINT32 ((Sint32)(~0x7FFFFFFF))
   --  unsupported macro: SDL_MAX_UINT32 ((Uint32)0xFFFFFFFFu)
   --  unsupported macro: SDL_MIN_UINT32 ((Uint32)0x00000000)
   --  unsupported macro: SDL_MAX_SINT64 SDL_SINT64_C(0x7FFFFFFFFFFFFFFF)
   --  unsupported macro: SDL_MIN_SINT64 ~SDL_SINT64_C(0x7FFFFFFFFFFFFFFF)
   --  unsupported macro: SDL_MAX_UINT64 SDL_UINT64_C(0xFFFFFFFFFFFFFFFF)
   --  unsupported macro: SDL_MIN_UINT64 SDL_UINT64_C(0x0000000000000000)
   --  unsupported macro: SDL_MAX_TIME SDL_MAX_SINT64
   --  unsupported macro: SDL_MIN_TIME SDL_MIN_SINT64
   SDL_FLT_EPSILON : constant := 1.1920928955078125e-07;  --  /usr/local/include/SDL3/SDL_stdinc.h:550
   --  unsupported macro: SDL_PRIs64 PRId64
   --  unsupported macro: SDL_PRIu64 PRIu64
   --  unsupported macro: SDL_PRIx64 PRIx64
   --  unsupported macro: SDL_PRIX64 PRIX64
   --  unsupported macro: SDL_PRIs32 PRId32
   --  unsupported macro: SDL_PRIu32 PRIu32
   --  unsupported macro: SDL_PRIx32 PRIx32
   --  unsupported macro: SDL_PRIX32 PRIX32

   SDL_PRILL_PREFIX : aliased constant String := "ll" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_stdinc.h:814
   --  unsupported macro: SDL_PRILLd SDL_PRILL_PREFIX "d"
   --  unsupported macro: SDL_PRILLu SDL_PRILL_PREFIX "u"
   --  unsupported macro: SDL_PRILLx SDL_PRILL_PREFIX "x"
   --  unsupported macro: SDL_PRILLX SDL_PRILL_PREFIX "X"
   --  arg-macro: procedure SDL_PRINTF_VARARG_FUNC (fmtargnumber)
   --    __attribute__ (( format( __printf__, fmtargnumber, fmtargnumber+1 )))
   --  arg-macro: procedure SDL_PRINTF_VARARG_FUNCV (fmtargnumber)
   --    __attribute__(( format( __printf__, fmtargnumber, 0 )))
   --  arg-macro: procedure SDL_SCANF_VARARG_FUNC (fmtargnumber)
   --    __attribute__ (( format( __scanf__, fmtargnumber, fmtargnumber+1 )))
   --  arg-macro: procedure SDL_SCANF_VARARG_FUNCV (fmtargnumber)
   --    __attribute__(( format( __scanf__, fmtargnumber, 0 )))
   --  arg-macro: procedure SDL_INIT_INTERFACE (iface)
   --    do { SDL_zerop(iface); (iface).version := sizeof(*(iface)); } while (0)
   --  arg-macro: function SDL_stack_alloc (type, count)
   --    return type*)alloca(sizeof(type)*(count);
   --  arg-macro: function SDL_min (x, y)
   --    return ((x) < (y)) ? (x) : (y);
   --  arg-macro: function SDL_max (x, y)
   --    return ((x) > (y)) ? (x) : (y);
   --  arg-macro: function SDL_clamp (x, a, b)
   --    return ((x) < (a)) ? (a) : (((x) > (b)) ? (b) : (x));
   --  unsupported macro: SDL_memcpy memcpy
   --  arg-macro: procedure SDL_copyp (dst, src)
   --    { SDL_COMPILE_TIME_ASSERT(SDL_copyp, sizeof (*(dst)) = sizeof (*(src))); } SDL_memcpy((dst), (src), sizeof(*(src)))
   --  unsupported macro: SDL_memmove memmove
   --  unsupported macro: SDL_memset memset
   --  arg-macro: procedure SDL_zero (x)
   --    SDL_memset(and(x), 0, sizeof((x)))
   --  arg-macro: procedure SDL_zerop (x)
   --    SDL_memset((x), 0, sizeof(*(x)))
   --  arg-macro: procedure SDL_zeroa (x)
   --    SDL_memset((x), 0, sizeof((x)))

   SDL_INVALID_UNICODE_CODEPOINT : constant := 16#FFFD#;  --  /usr/local/include/SDL3/SDL_stdinc.h:3983

   SDL_PI_D : constant := 3.141592653589793238462643383279502884;  --  /usr/local/include/SDL3/SDL_stdinc.h:4478

   SDL_PI_F : constant := 3.141592653589793238462643383279502884;  --  /usr/local/include/SDL3/SDL_stdinc.h:4490
   --  unsupported macro: SDL_ICONV_ERROR (size_t)-1
   --  unsupported macro: SDL_ICONV_E2BIG (size_t)-2
   --  unsupported macro: SDL_ICONV_EILSEQ (size_t)-3
   --  unsupported macro: SDL_ICONV_EINVAL (size_t)-4
   --  arg-macro: procedure SDL_iconv_utf8_locale (S)
   --    SDL_iconv_string("", & "UTF-8", S, SDL_strlen(S)+1)
   --  arg-macro: procedure SDL_iconv_utf8_ucs2 (S)
   --    SDL_reinterpret_cast(Uint16 *, SDL_iconv_string("UCS-2", & "UTF-8", S, SDL_strlen(S)+1))
   --  arg-macro: procedure SDL_iconv_utf8_ucs4 (S)
   --    SDL_reinterpret_cast(Uint32 *, SDL_iconv_string("UCS-4", & "UTF-8", S, SDL_strlen(S)+1))
   --  arg-macro: procedure SDL_iconv_wchar_utf8 (S)
   --    SDL_iconv_string("UTF-8", & "WCHAR_T", SDL_reinterpret_cast(const char *, S), (SDL_wcslen(S)+1)*sizeof(wchar_t))
   --  arg-macro: procedure SDL_size_mul_check_overflow (a, b, ret)
   --    SDL_size_mul_check_overflow_builtin(a, b, ret)
   --  arg-macro: procedure SDL_size_add_check_overflow (a, b, ret)
   --    SDL_size_add_check_overflow_builtin(a, b, ret)

  --  Simple DirectMedia Layer
  --  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
  --  This software is provided 'as-is', without any express or implied
  --  warranty.  In no event will the authors be held liable for any damages
  --  arising from the use of this software.
  --  Permission is granted to anyone to use this software for any purpose,
  --  including commercial applications, and to alter it and redistribute it
  --  freely, subject to the following restrictions:
  --  1. The origin of this software must not be misrepresented; you must not
  --     claim that you wrote the original software. If you use this software
  --     in a product, an acknowledgment in the product documentation would be
  --     appreciated but is not required.
  --  2. Altered source versions must be plainly marked as such, and must not be
  --     misrepresented as being the original software.
  --  3. This notice may not be removed or altered from any source distribution.
  -- 

  --*
  -- * # CategoryStdinc
  -- *
  -- * SDL provides its own implementation of some of the most important C runtime
  -- * functions.
  -- *
  -- * Using these functions allows an app to have access to common C
  -- * functionality without depending on a specific C runtime (or a C runtime at
  -- * all). More importantly, the SDL implementations work identically across
  -- * platforms, so apps can avoid surprises like snprintf() behaving differently
  -- * between Windows and Linux builds, or itoa() only existing on some
  -- * platforms.
  -- *
  -- * For many of the most common functions, like SDL_memcpy, SDL might just call
  -- * through to the usual C runtime behind the scenes, if it makes sense to do
  -- * so (if it's faster and always available/reliable on a given platform),
  -- * reducing library size and offering the most optimized option.
  -- *
  -- * SDL also offers other C-runtime-adjacent functionality in this header that
  -- * either isn't, strictly speaking, part of any C runtime standards, like
  -- * SDL_crc32() and SDL_reinterpret_cast, etc. It also offers a few better
  -- * options, like SDL_strlcpy(), which functions as a safer form of strcpy().
  --  

  -- Most everything except Visual Studio 2008 and earlier has stdint.h now  
  --*
  -- * Don't let SDL use "long long" C types.
  -- *
  -- * SDL will define this if it believes the compiler doesn't understand the
  -- * "long long" syntax for C datatypes. This can happen on older compilers.
  -- *
  -- * If _your_ compiler doesn't support "long long" but SDL doesn't know it, it
  -- * is safe to define this yourself to build against the SDL headers.
  -- *
  -- * If this is defined, it will remove access to some C runtime support
  -- * functions, like SDL_ulltoa and SDL_strtoll that refer to this datatype
  -- * explicitly. The rest of SDL will still be available.
  -- *
  -- * SDL's own source code cannot be built with a compiler that has this
  -- * defined, for various technical reasons.
  --  

  --*
  -- * The largest value that a `size_t` can hold for the target platform.
  -- *
  -- * `size_t` is generally the same size as a pointer in modern times, but this
  -- * can get weird on very old and very esoteric machines. For example, on a
  -- * 16-bit Intel 286, you might have a 32-bit "far" pointer (16-bit segment
  -- * plus 16-bit offset), but `size_t` is 16 bits, because it can only deal with
  -- * the offset into an individual segment.
  -- *
  -- * In modern times, it's generally expected to cover an entire linear address
  -- * space. But be careful!
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A compile-time assertion.
  -- *
  -- * This can check constant values _known to the compiler at build time_ for
  -- * correctness, and end the compile with the error if they fail.
  -- *
  -- * Often times these are used to verify basic truths, like the size of a
  -- * datatype is what is expected:
  -- *
  -- * ```c
  -- * SDL_COMPILE_TIME_ASSERT(uint32_size, sizeof(Uint32) == 4);
  -- * ```
  -- *
  -- * The `name` parameter must be a valid C symbol, and must be unique across
  -- * all compile-time asserts in the same compilation unit (one run of the
  -- * compiler), or the build might fail with cryptic errors on some targets.
  -- * This is used with a C language trick that works on older compilers that
  -- * don't support better assertion techniques.
  -- *
  -- * If you need an assertion that operates at runtime, on variable data, you
  -- * should try SDL_assert instead.
  -- *
  -- * \param name a unique identifier for this assertion.
  -- * \param x the value to test. Must be a boolean value.
  -- *
  -- * \threadsafety This macro doesn't generate any code to run.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_assert
  --  

  -- Keep C++ case alone: Some versions of gcc will define __STDC_VERSION__ even when compiling in C++ mode.  
  -- universal, but may trigger -Wunused-local-typedefs  
  --*
  -- * The number of elements in a static array.
  -- *
  -- * This will compile but return incorrect results for a pointer to an array;
  -- * it has to be an array the compiler knows the size of.
  -- *
  -- * This macro looks like it double-evaluates the argument, but it does so
  -- * inside of `sizeof`, so there are no side-effects here, as expressions do
  -- * not actually run any code in these cases.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro useful for building other macros with strings in them.
  -- *
  -- * For example:
  -- *
  -- * ```c
  -- * #define LOG_ERROR(X) OutputDebugString(SDL_STRINGIFY_ARG(__FUNCTION__) ": " X "\n")`
  -- * ```
  -- *
  -- * \param arg the text to turn into a string literal.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- *  \name Cast operators
  -- *
  -- *  Use proper C++ casts when compiled as C++ to be compatible with the option
  -- *  -Wold-style-cast of GCC (and -Werror=old-style-cast in GCC 4.2 and above).
  --  

  -- @{  
  --*
  -- * Handle a Reinterpret Cast properly whether using C or C++.
  -- *
  -- * If compiled as C++, this macro offers a proper C++ reinterpret_cast<>.
  -- *
  -- * If compiled as C, this macro does a normal C-style cast.
  -- *
  -- * This is helpful to avoid compiler warnings in C++.
  -- *
  -- * \param type the type to cast the expression to.
  -- * \param expression the expression to cast to a different type.
  -- * \returns `expression`, cast to `type`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_static_cast
  -- * \sa SDL_const_cast
  --  

  --*
  -- * Handle a Static Cast properly whether using C or C++.
  -- *
  -- * If compiled as C++, this macro offers a proper C++ static_cast<>.
  -- *
  -- * If compiled as C, this macro does a normal C-style cast.
  -- *
  -- * This is helpful to avoid compiler warnings in C++.
  -- *
  -- * \param type the type to cast the expression to.
  -- * \param expression the expression to cast to a different type.
  -- * \returns `expression`, cast to `type`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_reinterpret_cast
  -- * \sa SDL_const_cast
  --  

  --*
  -- * Handle a Const Cast properly whether using C or C++.
  -- *
  -- * If compiled as C++, this macro offers a proper C++ const_cast<>.
  -- *
  -- * If compiled as C, this macro does a normal C-style cast.
  -- *
  -- * This is helpful to avoid compiler warnings in C++.
  -- *
  -- * \param type the type to cast the expression to.
  -- * \param expression the expression to cast to a different type.
  -- * \returns `expression`, cast to `type`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_reinterpret_cast
  -- * \sa SDL_static_cast
  --  

  -- @}  
  -- Cast operators  
  --*
  -- * Define a four character code as a Uint32.
  -- *
  -- * \param A the first ASCII character.
  -- * \param B the second ASCII character.
  -- * \param C the third ASCII character.
  -- * \param D the fourth ASCII character.
  -- * \returns the four characters converted into a Uint32, one character
  -- *          per-byte.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Append the 64 bit integer suffix to a signed integer literal.
  -- *
  -- * This helps compilers that might believe a integer literal larger than
  -- * 0xFFFFFFFF is overflowing a 32-bit value. Use `SDL_SINT64_C(0xFFFFFFFF1)`
  -- * instead of `0xFFFFFFFF1` by itself.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UINT64_C
  --  

  --*
  -- * Append the 64 bit integer suffix to an unsigned integer literal.
  -- *
  -- * This helps compilers that might believe a integer literal larger than
  -- * 0xFFFFFFFF is overflowing a 32-bit value. Use `SDL_UINT64_C(0xFFFFFFFF1)`
  -- * instead of `0xFFFFFFFF1` by itself.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SINT64_C
  --  

  --*
  -- *  \name Basic data types
  --  

  -- @{  
  --*
  -- * A signed 8-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

   subtype Sint8 is x86_64_linux_gnu_bits_stdint_intn_h.int8_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:443

  --*
  -- * An unsigned 8-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

   subtype Uint8 is x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:452

  --*
  -- * A signed 16-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

   subtype Sint16 is x86_64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:461

  --*
  -- * An unsigned 16-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

   subtype Uint16 is x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:470

  --*
  -- * A signed 32-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

   subtype Sint32 is x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:479

  --*
  -- * An unsigned 32-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

   subtype Uint32 is x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:488

  --*
  -- * A signed 64-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SINT64_C
  --  

   subtype Sint64 is x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:499

  --*
  -- * An unsigned 64-bit integer type.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UINT64_C
  --  

   subtype Uint64 is x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:510

  --*
  -- * SDL times are signed, 64-bit integers representing nanoseconds since the
  -- * Unix epoch (Jan 1, 1970).
  -- *
  -- * They can be converted between POSIX time_t values with SDL_NS_TO_SECONDS()
  -- * and SDL_SECONDS_TO_NS(), and between Windows FILETIME values with
  -- * SDL_TimeToWindows() and SDL_TimeFromWindows().
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MAX_SINT64
  -- * \sa SDL_MIN_SINT64
  --  

   subtype SDL_Time is Sint64;  -- /usr/local/include/SDL3/SDL_stdinc.h:527

  -- @}  
  -- Basic data types  
  --*
  -- *  \name Floating-point constants
  --  

  -- @{  
  --*
  -- * Epsilon constant, used for comparing floating-point numbers.
  -- *
  -- * Equals by default to platform-defined `FLT_EPSILON`, or
  -- * `1.1920928955078125e-07F` if that's not available.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- @}  
  -- Floating-point constants  
  --*
  -- * A printf-formatting string for an Sint64 value.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIs64 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a Uint64 value.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIu64 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a Uint64 value as lower-case hexadecimal.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIx64 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a Uint64 value as upper-case hexadecimal.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIX64 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for an Sint32 value.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIs32 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a Uint32 value.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIu32 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a Uint32 value as lower-case hexadecimal.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIx32 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a Uint32 value as upper-case hexadecimal.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRIX32 " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string prefix for a `long long` value.
  -- *
  -- * This is just the prefix! You probably actually want SDL_PRILLd, SDL_PRILLu,
  -- * SDL_PRILLx, or SDL_PRILLX instead.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRILL_PREFIX "d bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a `long long` value.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRILLd " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for a `unsigned long long` value.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRILLu " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for an `unsigned long long` value as lower-case
  -- * hexadecimal.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRILLx " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A printf-formatting string for an `unsigned long long` value as upper-case
  -- * hexadecimal.
  -- *
  -- * Use it like this:
  -- *
  -- * ```c
  -- * SDL_Log("There are %" SDL_PRILLX " bottles of beer on the wall.", bottles);
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- Make sure we have macros for printing width-based integers.
  -- * <inttypes.h> should define these but this is not true all platforms.
  -- * (for example win32)  

  -- Specifically for the `long long` -- SDL-specific.  
  -- using I64 for windows - make sure `long long` is 64 bits.  
  -- Annotations to help code analysis tools  
  --*
  -- * Macro that annotates function params with input buffer size.
  -- *
  -- * If we were to annotate `memcpy`:
  -- *
  -- * ```c
  -- * void *memcpy(void *dst, SDL_IN_BYTECAP(len) const void *src, size_t len);
  -- * ```
  -- *
  -- * This notes that `src` should be `len` bytes in size and is only read by the
  -- * function. The compiler or other analysis tools can warn when this doesn't
  -- * appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params with input/output string buffer size.
  -- *
  -- * If we were to annotate `strlcat`:
  -- *
  -- * ```c
  -- * size_t strlcat(SDL_INOUT_Z_CAP(maxlen) char *dst, const char *src, size_t maxlen);
  -- * ```
  -- *
  -- * This notes that `dst` is a null-terminated C string, should be `maxlen`
  -- * bytes in size, and is both read from and written to by the function. The
  -- * compiler or other analysis tools can warn when this doesn't appear to be
  -- * the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params with output string buffer size.
  -- *
  -- * If we were to annotate `snprintf`:
  -- *
  -- * ```c
  -- * int snprintf(SDL_OUT_Z_CAP(maxlen) char *text, size_t maxlen, const char *fmt, ...);
  -- * ```
  -- *
  -- * This notes that `text` is a null-terminated C string, should be `maxlen`
  -- * bytes in size, and is only written to by the function. The compiler or
  -- * other analysis tools can warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params with output buffer size.
  -- *
  -- * If we were to annotate `wcsncpy`:
  -- *
  -- * ```c
  -- * char *wcscpy(SDL_OUT_CAP(bufsize) wchar_t *dst, const wchar_t *src, size_t bufsize);
  -- * ```
  -- *
  -- * This notes that `dst` should have a capacity of `bufsize` wchar_t in size,
  -- * and is only written to by the function. The compiler or other analysis
  -- * tools can warn when this doesn't appear to be the case.
  -- *
  -- * This operates on counts of objects, not bytes. Use SDL_OUT_BYTECAP for
  -- * bytes.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params with output buffer size.
  -- *
  -- * If we were to annotate `memcpy`:
  -- *
  -- * ```c
  -- * void *memcpy(SDL_OUT_BYTECAP(bufsize) void *dst, const void *src, size_t bufsize);
  -- * ```
  -- *
  -- * This notes that `dst` should have a capacity of `bufsize` bytes in size,
  -- * and is only written to by the function. The compiler or other analysis
  -- * tools can warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params with output buffer string size.
  -- *
  -- * If we were to annotate `strcpy`:
  -- *
  -- * ```c
  -- * char *strcpy(SDL_OUT_Z_BYTECAP(bufsize) char *dst, const char *src, size_t bufsize);
  -- * ```
  -- *
  -- * This notes that `dst` should have a capacity of `bufsize` bytes in size,
  -- * and a zero-terminated string is written to it by the function. The compiler
  -- * or other analysis tools can warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params as printf-style format strings.
  -- *
  -- * If we were to annotate `fprintf`:
  -- *
  -- * ```c
  -- * int fprintf(FILE *f, SDL_PRINTF_FORMAT_STRING const char *fmt, ...);
  -- * ```
  -- *
  -- * This notes that `fmt` should be a printf-style format string. The compiler
  -- * or other analysis tools can warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates function params as scanf-style format strings.
  -- *
  -- * If we were to annotate `fscanf`:
  -- *
  -- * ```c
  -- * int fscanf(FILE *f, SDL_SCANF_FORMAT_STRING const char *fmt, ...);
  -- * ```
  -- *
  -- * This notes that `fmt` should be a scanf-style format string. The compiler
  -- * or other analysis tools can warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates a vararg function that operates like printf.
  -- *
  -- * If we were to annotate `fprintf`:
  -- *
  -- * ```c
  -- * int fprintf(FILE *f, const char *fmt, ...) SDL_PRINTF_VARARG_FUNC(2);
  -- * ```
  -- *
  -- * This notes that the second parameter should be a printf-style format
  -- * string, followed by `...`. The compiler or other analysis tools can warn
  -- * when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * This can (and should) be used with SDL_PRINTF_FORMAT_STRING as well, which
  -- * between them will cover at least Visual Studio, GCC, and Clang.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates a va_list function that operates like printf.
  -- *
  -- * If we were to annotate `vfprintf`:
  -- *
  -- * ```c
  -- * int vfprintf(FILE *f, const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(2);
  -- * ```
  -- *
  -- * This notes that the second parameter should be a printf-style format
  -- * string, followed by a va_list. The compiler or other analysis tools can
  -- * warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * This can (and should) be used with SDL_PRINTF_FORMAT_STRING as well, which
  -- * between them will cover at least Visual Studio, GCC, and Clang.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates a vararg function that operates like scanf.
  -- *
  -- * If we were to annotate `fscanf`:
  -- *
  -- * ```c
  -- * int fscanf(FILE *f, const char *fmt, ...) SDL_PRINTF_VARARG_FUNCV(2);
  -- * ```
  -- *
  -- * This notes that the second parameter should be a scanf-style format string,
  -- * followed by `...`. The compiler or other analysis tools can warn when this
  -- * doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * This can (and should) be used with SDL_SCANF_FORMAT_STRING as well, which
  -- * between them will cover at least Visual Studio, GCC, and Clang.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates a va_list function that operates like scanf.
  -- *
  -- * If we were to annotate `vfscanf`:
  -- *
  -- * ```c
  -- * int vfscanf(FILE *f, const char *fmt, va_list ap) SDL_PRINTF_VARARG_FUNCV(2);
  -- * ```
  -- *
  -- * This notes that the second parameter should be a scanf-style format string,
  -- * followed by a va_list. The compiler or other analysis tools can warn when
  -- * this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * This can (and should) be used with SDL_SCANF_FORMAT_STRING as well, which
  -- * between them will cover at least Visual Studio, GCC, and Clang.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates a vararg function that operates like wprintf.
  -- *
  -- * If we were to annotate `fwprintf`:
  -- *
  -- * ```c
  -- * int fwprintf(FILE *f, const wchar_t *fmt, ...) SDL_WPRINTF_VARARG_FUNC(2);
  -- * ```
  -- *
  -- * This notes that the second parameter should be a wprintf-style format wide
  -- * string, followed by `...`. The compiler or other analysis tools can warn
  -- * when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * This can (and should) be used with SDL_PRINTF_FORMAT_STRING as well, which
  -- * between them will cover at least Visual Studio, GCC, and Clang.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Macro that annotates a va_list function that operates like wprintf.
  -- *
  -- * If we were to annotate `vfwprintf`:
  -- *
  -- * ```c
  -- * int vfwprintf(FILE *f, const wchar_t *fmt, va_list ap) SDL_WPRINTF_VARARG_FUNC(2);
  -- * ```
  -- *
  -- * This notes that the second parameter should be a wprintf-style format wide
  -- * string, followed by a va_list. The compiler or other analysis tools can
  -- * warn when this doesn't appear to be the case.
  -- *
  -- * On compilers without this annotation mechanism, this is defined to nothing.
  -- *
  -- * This can (and should) be used with SDL_PRINTF_FORMAT_STRING as well, which
  -- * between them will cover at least Visual Studio, GCC, and Clang.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --* \cond  
   type SDL_alignment_test is record
      a : aliased Uint8;  -- /usr/local/include/SDL3/SDL_stdinc.h:1190
      b : System.Address;  -- /usr/local/include/SDL3/SDL_stdinc.h:1191
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_stdinc.h:1188

  --* \endcond  
  -- Check to make sure enums are the size of ints, for structure packing.
  --   For both Watcom C/C++ and Borland C/C++ the compiler option that makes
  --   enums having the size of an int must be enabled.
  --   This is "-b" for Borland C/C++ and "-ei" for Watcom C/C++ (v11).
  -- 

  --* \cond  
  -- TODO: include/SDL_stdinc.h:390: error: size of array 'SDL_dummy_enum' is negative  
   type SDL_DUMMY_ENUM is 
     (DUMMY_ENUM_VALUE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1208

  --* \endcond  
  -- Set up for C function definitions, even when using C++  
  --*
  -- * A macro to initialize an SDL interface.
  -- *
  -- * This macro will initialize an SDL interface structure and should be called
  -- * before you fill out the fields with your implementation.
  -- *
  -- * You can use it like this:
  -- *
  -- * ```c
  -- * SDL_IOStreamInterface iface;
  -- *
  -- * SDL_INIT_INTERFACE(&iface);
  -- *
  -- * // Fill in the interface function pointers with your implementation
  -- * iface.seek = ...
  -- *
  -- * stream = SDL_OpenIO(&iface, NULL);
  -- * ```
  -- *
  -- * If you are using designated initializers, you can use the size of the
  -- * interface as the version, e.g.
  -- *
  -- * ```c
  -- * SDL_IOStreamInterface iface = {
  -- *     .version = sizeof(iface),
  -- *     .seek = ...
  -- * };
  -- * stream = SDL_OpenIO(&iface, NULL);
  -- * ```
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_IOStreamInterface
  -- * \sa SDL_StorageInterface
  -- * \sa SDL_VirtualJoystickDesc
  --  

  --*
  -- * Allocate memory on the stack (maybe).
  -- *
  -- * If SDL knows how to access alloca() on the current platform, it will use it
  -- * to stack-allocate memory here. If it doesn't, it will use SDL_malloc() to
  -- * heap-allocate memory.
  -- *
  -- * Since this might not be stack memory at all, it's important that you check
  -- * the returned pointer for NULL, and that you call SDL_stack_free on the
  -- * memory when done with it. Since this might be stack memory, it's important
  -- * that you don't allocate large amounts of it, or allocate in a loop without
  -- * returning from the function, so the stack doesn't overflow.
  -- *
  -- * \param type the datatype of the memory to allocate.
  -- * \param count the number of `type` objects to allocate.
  -- * \returns newly-allocated memory, or NULL on failure.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_stack_free
  --  

  --*
  -- * Free memory previously allocated with SDL_stack_alloc.
  -- *
  -- * If SDL used alloca() to allocate this memory, this macro does nothing and
  -- * the allocated memory will be automatically released when the function that
  -- * called SDL_stack_alloc() returns. If SDL used SDL_malloc(), it will
  -- * SDL_free the memory immediately.
  -- *
  -- * \param data the pointer, from SDL_stack_alloc(), to free.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_stack_alloc
  --  

  --*
  -- * Allocate uninitialized memory.
  -- *
  -- * The allocated memory returned by this function must be freed with
  -- * SDL_free().
  -- *
  -- * If `size` is 0, it will be set to 1.
  -- *
  -- * If the allocation is successful, the returned pointer is guaranteed to be
  -- * aligned to either the *fundamental alignment* (`alignof(max_align_t)` in
  -- * C11 and later) or `2 * sizeof(void *)`, whichever is smaller. Use
  -- * SDL_aligned_alloc() if you need to allocate memory aligned to an alignment
  -- * greater than this guarantee.
  -- *
  -- * \param size the size to allocate.
  -- * \returns a pointer to the allocated memory, or NULL if allocation failed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_free
  -- * \sa SDL_calloc
  -- * \sa SDL_realloc
  -- * \sa SDL_aligned_alloc
  --  

   function SDL_malloc (size : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:1347
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_malloc";

  --*
  -- * Allocate a zero-initialized array.
  -- *
  -- * The memory returned by this function must be freed with SDL_free().
  -- *
  -- * If either of `nmemb` or `size` is 0, they will both be set to 1.
  -- *
  -- * If the allocation is successful, the returned pointer is guaranteed to be
  -- * aligned to either the *fundamental alignment* (`alignof(max_align_t)` in
  -- * C11 and later) or `2 * sizeof(void *)`, whichever is smaller.
  -- *
  -- * \param nmemb the number of elements in the array.
  -- * \param size the size of each element of the array.
  -- * \returns a pointer to the allocated array, or NULL if allocation failed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_free
  -- * \sa SDL_malloc
  -- * \sa SDL_realloc
  --  

   function SDL_calloc (nmemb : stddef_h.size_t; size : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:1372
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_calloc";

  --*
  -- * Change the size of allocated memory.
  -- *
  -- * The memory returned by this function must be freed with SDL_free().
  -- *
  -- * If `size` is 0, it will be set to 1. Note that this is unlike some other C
  -- * runtime `realloc` implementations, which may treat `realloc(mem, 0)` the
  -- * same way as `free(mem)`.
  -- *
  -- * If `mem` is NULL, the behavior of this function is equivalent to
  -- * SDL_malloc(). Otherwise, the function can have one of three possible
  -- * outcomes:
  -- *
  -- * - If it returns the same pointer as `mem`, it means that `mem` was resized
  -- *   in place without freeing.
  -- * - If it returns a different non-NULL pointer, it means that `mem` was freed
  -- *   and cannot be dereferenced anymore.
  -- * - If it returns NULL (indicating failure), then `mem` will remain valid and
  -- *   must still be freed with SDL_free().
  -- *
  -- * If the allocation is successfully resized, the returned pointer is
  -- * guaranteed to be aligned to either the *fundamental alignment*
  -- * (`alignof(max_align_t)` in C11 and later) or `2 * sizeof(void *)`,
  -- * whichever is smaller.
  -- *
  -- * \param mem a pointer to allocated memory to reallocate, or NULL.
  -- * \param size the new size of the memory.
  -- * \returns a pointer to the newly allocated memory, or NULL if allocation
  -- *          failed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_free
  -- * \sa SDL_malloc
  -- * \sa SDL_calloc
  --  

   function SDL_realloc (mem : System.Address; size : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:1412
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_realloc";

  --*
  -- * Free allocated memory.
  -- *
  -- * The pointer is no longer valid after this call and cannot be dereferenced
  -- * anymore.
  -- *
  -- * If `mem` is NULL, this function does nothing.
  -- *
  -- * \param mem a pointer to allocated memory, or NULL.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_malloc
  -- * \sa SDL_calloc
  -- * \sa SDL_realloc
  --  

   procedure SDL_free (mem : System.Address)  -- /usr/local/include/SDL3/SDL_stdinc.h:1432
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_free";

  --*
  -- * A callback used to implement SDL_malloc().
  -- *
  -- * SDL will always ensure that the passed `size` is greater than 0.
  -- *
  -- * \param size the size to allocate.
  -- * \returns a pointer to the allocated memory, or NULL if allocation failed.
  -- *
  -- * \threadsafety It should be safe to call this callback from any thread.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_malloc
  -- * \sa SDL_GetOriginalMemoryFunctions
  -- * \sa SDL_GetMemoryFunctions
  -- * \sa SDL_SetMemoryFunctions
  --  

   type SDL_malloc_func is access function (arg1 : stddef_h.size_t) return System.Address
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1451

  --*
  -- * A callback used to implement SDL_calloc().
  -- *
  -- * SDL will always ensure that the passed `nmemb` and `size` are both greater
  -- * than 0.
  -- *
  -- * \param nmemb the number of elements in the array.
  -- * \param size the size of each element of the array.
  -- * \returns a pointer to the allocated array, or NULL if allocation failed.
  -- *
  -- * \threadsafety It should be safe to call this callback from any thread.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_calloc
  -- * \sa SDL_GetOriginalMemoryFunctions
  -- * \sa SDL_GetMemoryFunctions
  -- * \sa SDL_SetMemoryFunctions
  --  

   type SDL_calloc_func is access function (arg1 : stddef_h.size_t; arg2 : stddef_h.size_t) return System.Address
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1472

  --*
  -- * A callback used to implement SDL_realloc().
  -- *
  -- * SDL will always ensure that the passed `size` is greater than 0.
  -- *
  -- * \param mem a pointer to allocated memory to reallocate, or NULL.
  -- * \param size the new size of the memory.
  -- * \returns a pointer to the newly allocated memory, or NULL if allocation
  -- *          failed.
  -- *
  -- * \threadsafety It should be safe to call this callback from any thread.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_realloc
  -- * \sa SDL_GetOriginalMemoryFunctions
  -- * \sa SDL_GetMemoryFunctions
  -- * \sa SDL_SetMemoryFunctions
  --  

   type SDL_realloc_func is access function (arg1 : System.Address; arg2 : stddef_h.size_t) return System.Address
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1493

  --*
  -- * A callback used to implement SDL_free().
  -- *
  -- * SDL will always ensure that the passed `mem` is a non-NULL pointer.
  -- *
  -- * \param mem a pointer to allocated memory.
  -- *
  -- * \threadsafety It should be safe to call this callback from any thread.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_free
  -- * \sa SDL_GetOriginalMemoryFunctions
  -- * \sa SDL_GetMemoryFunctions
  -- * \sa SDL_SetMemoryFunctions
  --  

   type SDL_free_func is access procedure (arg1 : System.Address)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1511

  --*
  -- * Get the original set of SDL memory functions.
  -- *
  -- * This is what SDL_malloc and friends will use by default, if there has been
  -- * no call to SDL_SetMemoryFunctions. This is not necessarily using the C
  -- * runtime's `malloc` functions behind the scenes! Different platforms and
  -- * build configurations might do any number of unexpected things.
  -- *
  -- * \param malloc_func filled with malloc function.
  -- * \param calloc_func filled with calloc function.
  -- * \param realloc_func filled with realloc function.
  -- * \param free_func filled with free function.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_GetOriginalMemoryFunctions
     (malloc_func : System.Address;
      calloc_func : System.Address;
      realloc_func : System.Address;
      free_func : System.Address)  -- /usr/local/include/SDL3/SDL_stdinc.h:1530
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetOriginalMemoryFunctions";

  --*
  -- * Get the current set of SDL memory functions.
  -- *
  -- * \param malloc_func filled with malloc function.
  -- * \param calloc_func filled with calloc function.
  -- * \param realloc_func filled with realloc function.
  -- * \param free_func filled with free function.
  -- *
  -- * \threadsafety This does not hold a lock, so do not call this in the
  -- *               unlikely event of a background thread calling
  -- *               SDL_SetMemoryFunctions simultaneously.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetMemoryFunctions
  -- * \sa SDL_GetOriginalMemoryFunctions
  --  

   procedure SDL_GetMemoryFunctions
     (malloc_func : System.Address;
      calloc_func : System.Address;
      realloc_func : System.Address;
      free_func : System.Address)  -- /usr/local/include/SDL3/SDL_stdinc.h:1552
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetMemoryFunctions";

  --*
  -- * Replace SDL's memory allocation functions with a custom set.
  -- *
  -- * It is not safe to call this function once any allocations have been made,
  -- * as future calls to SDL_free will use the new allocator, even if they came
  -- * from an SDL_malloc made with the old one!
  -- *
  -- * If used, usually this needs to be the first call made into the SDL library,
  -- * if not the very first thing done at program startup time.
  -- *
  -- * \param malloc_func custom malloc function.
  -- * \param calloc_func custom calloc function.
  -- * \param realloc_func custom realloc function.
  -- * \param free_func custom free function.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, but one
  -- *               should not replace the memory functions once any allocations
  -- *               are made!
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetMemoryFunctions
  -- * \sa SDL_GetOriginalMemoryFunctions
  --  

   function SDL_SetMemoryFunctions
     (malloc_func : SDL_malloc_func;
      calloc_func : SDL_calloc_func;
      realloc_func : SDL_realloc_func;
      free_func : SDL_free_func) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:1583
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetMemoryFunctions";

  --*
  -- * Allocate memory aligned to a specific alignment.
  -- *
  -- * The memory returned by this function must be freed with SDL_aligned_free(),
  -- * _not_ SDL_free().
  -- *
  -- * If `alignment` is less than the size of `void *`, it will be increased to
  -- * match that.
  -- *
  -- * The returned memory address will be a multiple of the alignment value, and
  -- * the size of the memory allocated will be a multiple of the alignment value.
  -- *
  -- * \param alignment the alignment of the memory.
  -- * \param size the size to allocate.
  -- * \returns a pointer to the aligned memory, or NULL if allocation failed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_aligned_free
  --  

   function SDL_aligned_alloc (alignment : stddef_h.size_t; size : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:1610
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_aligned_alloc";

  --*
  -- * Free memory allocated by SDL_aligned_alloc().
  -- *
  -- * The pointer is no longer valid after this call and cannot be dereferenced
  -- * anymore.
  -- *
  -- * If `mem` is NULL, this function does nothing.
  -- *
  -- * \param mem a pointer previously returned by SDL_aligned_alloc(), or NULL.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_aligned_alloc
  --  

   procedure SDL_aligned_free (mem : System.Address)  -- /usr/local/include/SDL3/SDL_stdinc.h:1628
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_aligned_free";

  --*
  -- * Get the number of outstanding (unfreed) allocations.
  -- *
  -- * \returns the number of allocations or -1 if allocation counting is
  -- *          disabled.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetNumAllocations return int  -- /usr/local/include/SDL3/SDL_stdinc.h:1640
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumAllocations";

  --*
  -- * A thread-safe set of environment variables
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironment
  -- * \sa SDL_CreateEnvironment
  -- * \sa SDL_GetEnvironmentVariable
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_SetEnvironmentVariable
  -- * \sa SDL_UnsetEnvironmentVariable
  -- * \sa SDL_DestroyEnvironment
  --  

   type SDL_Environment is null record;   -- incomplete struct

  --*
  -- * Get the process environment.
  -- *
  -- * This is initialized at application start and is not affected by setenv()
  -- * and unsetenv() calls after that point. Use SDL_SetEnvironmentVariable() and
  -- * SDL_UnsetEnvironmentVariable() if you want to modify this environment, or
  -- * SDL_setenv_unsafe() or SDL_unsetenv_unsafe() if you want changes to persist
  -- * in the C runtime environment after SDL_Quit().
  -- *
  -- * \returns a pointer to the environment for the process or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironmentVariable
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_SetEnvironmentVariable
  -- * \sa SDL_UnsetEnvironmentVariable
  --  

   function SDL_GetEnvironment return access SDL_Environment  -- /usr/local/include/SDL3/SDL_stdinc.h:1678
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetEnvironment";

  --*
  -- * Create a set of environment variables
  -- *
  -- * \param populated true to initialize it from the C runtime environment,
  -- *                  false to create an empty environment.
  -- * \returns a pointer to the new environment or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety If `populated` is false, it is safe to call this function
  -- *               from any thread, otherwise it is safe if no other threads are
  -- *               calling setenv() or unsetenv()
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironmentVariable
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_SetEnvironmentVariable
  -- * \sa SDL_UnsetEnvironmentVariable
  -- * \sa SDL_DestroyEnvironment
  --  

   function SDL_CreateEnvironment (populated : Extensions.bool) return access SDL_Environment  -- /usr/local/include/SDL3/SDL_stdinc.h:1700
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateEnvironment";

  --*
  -- * Get the value of a variable in the environment.
  -- *
  -- * \param env the environment to query.
  -- * \param name the name of the variable to get.
  -- * \returns a pointer to the value of the variable or NULL if it can't be
  -- *          found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironment
  -- * \sa SDL_CreateEnvironment
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_SetEnvironmentVariable
  -- * \sa SDL_UnsetEnvironmentVariable
  --  

   function SDL_GetEnvironmentVariable (env : access SDL_Environment; name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:1720
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetEnvironmentVariable";

  --*
  -- * Get all variables in the environment.
  -- *
  -- * \param env the environment to query.
  -- * \returns a NULL terminated array of pointers to environment variables in
  -- *          the form "variable=value" or NULL on failure; call SDL_GetError()
  -- *          for more information. This is a single allocation that should be
  -- *          freed with SDL_free() when it is no longer needed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironment
  -- * \sa SDL_CreateEnvironment
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_SetEnvironmentVariable
  -- * \sa SDL_UnsetEnvironmentVariable
  --  

   function SDL_GetEnvironmentVariables (env : access SDL_Environment) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:1741
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetEnvironmentVariables";

  --*
  -- * Set the value of a variable in the environment.
  -- *
  -- * \param env the environment to modify.
  -- * \param name the name of the variable to set.
  -- * \param value the value of the variable to set.
  -- * \param overwrite true to overwrite the variable if it exists, false to
  -- *                  return success without setting the variable if it already
  -- *                  exists.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironment
  -- * \sa SDL_CreateEnvironment
  -- * \sa SDL_GetEnvironmentVariable
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_UnsetEnvironmentVariable
  --  

   function SDL_SetEnvironmentVariable
     (env : access SDL_Environment;
      name : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr;
      overwrite : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:1765
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetEnvironmentVariable";

  --*
  -- * Clear a variable from the environment.
  -- *
  -- * \param env the environment to modify.
  -- * \param name the name of the variable to unset.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEnvironment
  -- * \sa SDL_CreateEnvironment
  -- * \sa SDL_GetEnvironmentVariable
  -- * \sa SDL_GetEnvironmentVariables
  -- * \sa SDL_SetEnvironmentVariable
  -- * \sa SDL_UnsetEnvironmentVariable
  --  

   function SDL_UnsetEnvironmentVariable (env : access SDL_Environment; name : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:1786
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnsetEnvironmentVariable";

  --*
  -- * Destroy a set of environment variables.
  -- *
  -- * \param env the environment to destroy.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the environment is no longer in use.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateEnvironment
  --  

   procedure SDL_DestroyEnvironment (env : access SDL_Environment)  -- /usr/local/include/SDL3/SDL_stdinc.h:1800
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyEnvironment";

  --*
  -- * Get the value of a variable in the environment.
  -- *
  -- * This function uses SDL's cached copy of the environment and is thread-safe.
  -- *
  -- * \param name the name of the variable to get.
  -- * \returns a pointer to the value of the variable or NULL if it can't be
  -- *          found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_getenv (name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:1815
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_getenv";

  --*
  -- * Get the value of a variable in the environment.
  -- *
  -- * This function bypasses SDL's cached copy of the environment and is not
  -- * thread-safe.
  -- *
  -- * \param name the name of the variable to get.
  -- * \returns a pointer to the value of the variable or NULL if it can't be
  -- *          found.
  -- *
  -- * \threadsafety This function is not thread safe, consider using SDL_getenv()
  -- *               instead.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_getenv
  --  

   function SDL_getenv_unsafe (name : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:1834
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_getenv_unsafe";

  --*
  -- * Set the value of a variable in the environment.
  -- *
  -- * \param name the name of the variable to set.
  -- * \param value the value of the variable to set.
  -- * \param overwrite 1 to overwrite the variable if it exists, 0 to return
  -- *                  success without setting the variable if it already exists.
  -- * \returns 0 on success, -1 on error.
  -- *
  -- * \threadsafety This function is not thread safe, consider using
  -- *               SDL_SetEnvironmentVariable() instead.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetEnvironmentVariable
  --  

   function SDL_setenv_unsafe
     (name : Interfaces.C.Strings.chars_ptr;
      value : Interfaces.C.Strings.chars_ptr;
      overwrite : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:1852
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_setenv_unsafe";

  --*
  -- * Clear a variable from the environment.
  -- *
  -- * \param name the name of the variable to unset.
  -- * \returns 0 on success, -1 on error.
  -- *
  -- * \threadsafety This function is not thread safe, consider using
  -- *               SDL_UnsetEnvironmentVariable() instead.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UnsetEnvironmentVariable
  --  

   function SDL_unsetenv_unsafe (name : Interfaces.C.Strings.chars_ptr) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:1867
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_unsetenv_unsafe";

  --*
  -- * A callback used with SDL sorting and binary search functions.
  -- *
  -- * \param a a pointer to the first element being compared.
  -- * \param b a pointer to the second element being compared.
  -- * \returns -1 if `a` should be sorted before `b`, 1 if `b` should be sorted
  -- *          before `a`, 0 if they are equal. If two elements are equal, their
  -- *          order in the sorted array is undefined.
  -- *
  -- * \since This callback is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_bsearch
  -- * \sa SDL_qsort
  --  

   type SDL_CompareCallback is access function (arg1 : System.Address; arg2 : System.Address) return int
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1883

  --*
  -- * Sort an array.
  -- *
  -- * For example:
  -- *
  -- * ```c
  -- * typedef struct {
  -- *     int key;
  -- *     const char *string;
  -- * } data;
  -- *
  -- * int SDLCALL compare(const void *a, const void *b)
  -- * {
  -- *     const data *A = (const data *)a;
  -- *     const data *B = (const data *)b;
  -- *
  -- *     if (A->n < B->n) {
  -- *         return -1;
  -- *     } else if (B->n < A->n) {
  -- *         return 1;
  -- *     } else {
  -- *         return 0;
  -- *     }
  -- * }
  -- *
  -- * data values[] = {
  -- *     { 3, "third" }, { 1, "first" }, { 2, "second" }
  -- * };
  -- *
  -- * SDL_qsort(values, SDL_arraysize(values), sizeof(values[0]), compare);
  -- * ```
  -- *
  -- * \param base a pointer to the start of the array.
  -- * \param nmemb the number of elements in the array.
  -- * \param size the size of the elements in the array.
  -- * \param compare a function used to compare elements in the array.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_bsearch
  -- * \sa SDL_qsort_r
  --  

   procedure SDL_qsort
     (base : System.Address;
      nmemb : stddef_h.size_t;
      size : stddef_h.size_t;
      compare : SDL_CompareCallback)  -- /usr/local/include/SDL3/SDL_stdinc.h:1929
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_qsort";

  --*
  -- * Perform a binary search on a previously sorted array.
  -- *
  -- * For example:
  -- *
  -- * ```c
  -- * typedef struct {
  -- *     int key;
  -- *     const char *string;
  -- * } data;
  -- *
  -- * int SDLCALL compare(const void *a, const void *b)
  -- * {
  -- *     const data *A = (const data *)a;
  -- *     const data *B = (const data *)b;
  -- *
  -- *     if (A->n < B->n) {
  -- *         return -1;
  -- *     } else if (B->n < A->n) {
  -- *         return 1;
  -- *     } else {
  -- *         return 0;
  -- *     }
  -- * }
  -- *
  -- * data values[] = {
  -- *     { 1, "first" }, { 2, "second" }, { 3, "third" }
  -- * };
  -- * data key = { 2, NULL };
  -- *
  -- * data *result = SDL_bsearch(&key, values, SDL_arraysize(values), sizeof(values[0]), compare);
  -- * ```
  -- *
  -- * \param key a pointer to a key equal to the element being searched for.
  -- * \param base a pointer to the start of the array.
  -- * \param nmemb the number of elements in the array.
  -- * \param size the size of the elements in the array.
  -- * \param compare a function used to compare elements in the array.
  -- * \returns a pointer to the matching element in the array, or NULL if not
  -- *          found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_bsearch_r
  -- * \sa SDL_qsort
  --  

   function SDL_bsearch
     (key : System.Address;
      base : System.Address;
      nmemb : stddef_h.size_t;
      size : stddef_h.size_t;
      compare : SDL_CompareCallback) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:1979
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_bsearch";

  --*
  -- * A callback used with SDL sorting and binary search functions.
  -- *
  -- * \param userdata the `userdata` pointer passed to the sort function.
  -- * \param a a pointer to the first element being compared.
  -- * \param b a pointer to the second element being compared.
  -- * \returns -1 if `a` should be sorted before `b`, 1 if `b` should be sorted
  -- *          before `a`, 0 if they are equal. If two elements are equal, their
  -- *          order in the sorted array is undefined.
  -- *
  -- * \since This callback is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_qsort_r
  -- * \sa SDL_bsearch_r
  --  

   type SDL_CompareCallback_r is access function
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : System.Address) return int
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:1996

  --*
  -- * Sort an array, passing a userdata pointer to the compare function.
  -- *
  -- * For example:
  -- *
  -- * ```c
  -- * typedef enum {
  -- *     sort_increasing,
  -- *     sort_decreasing,
  -- * } sort_method;
  -- *
  -- * typedef struct {
  -- *     int key;
  -- *     const char *string;
  -- * } data;
  -- *
  -- * int SDLCALL compare(const void *userdata, const void *a, const void *b)
  -- * {
  -- *     sort_method method = (sort_method)(uintptr_t)userdata;
  -- *     const data *A = (const data *)a;
  -- *     const data *B = (const data *)b;
  -- *
  -- *     if (A->key < B->key) {
  -- *         return (method == sort_increasing) ? -1 : 1;
  -- *     } else if (B->key < A->key) {
  -- *         return (method == sort_increasing) ? 1 : -1;
  -- *     } else {
  -- *         return 0;
  -- *     }
  -- * }
  -- *
  -- * data values[] = {
  -- *     { 3, "third" }, { 1, "first" }, { 2, "second" }
  -- * };
  -- *
  -- * SDL_qsort_r(values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
  -- * ```
  -- *
  -- * \param base a pointer to the start of the array.
  -- * \param nmemb the number of elements in the array.
  -- * \param size the size of the elements in the array.
  -- * \param compare a function used to compare elements in the array.
  -- * \param userdata a pointer to pass to the compare function.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_bsearch_r
  -- * \sa SDL_qsort
  --  

   procedure SDL_qsort_r
     (base : System.Address;
      nmemb : stddef_h.size_t;
      size : stddef_h.size_t;
      compare : SDL_CompareCallback_r;
      userdata : System.Address)  -- /usr/local/include/SDL3/SDL_stdinc.h:2049
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_qsort_r";

  --*
  -- * Perform a binary search on a previously sorted array, passing a userdata
  -- * pointer to the compare function.
  -- *
  -- * For example:
  -- *
  -- * ```c
  -- * typedef enum {
  -- *     sort_increasing,
  -- *     sort_decreasing,
  -- * } sort_method;
  -- *
  -- * typedef struct {
  -- *     int key;
  -- *     const char *string;
  -- * } data;
  -- *
  -- * int SDLCALL compare(const void *userdata, const void *a, const void *b)
  -- * {
  -- *     sort_method method = (sort_method)(uintptr_t)userdata;
  -- *     const data *A = (const data *)a;
  -- *     const data *B = (const data *)b;
  -- *
  -- *     if (A->key < B->key) {
  -- *         return (method == sort_increasing) ? -1 : 1;
  -- *     } else if (B->key < A->key) {
  -- *         return (method == sort_increasing) ? 1 : -1;
  -- *     } else {
  -- *         return 0;
  -- *     }
  -- * }
  -- *
  -- * data values[] = {
  -- *     { 1, "first" }, { 2, "second" }, { 3, "third" }
  -- * };
  -- * data key = { 2, NULL };
  -- *
  -- * data *result = SDL_bsearch_r(&key, values, SDL_arraysize(values), sizeof(values[0]), compare, (const void *)(uintptr_t)sort_increasing);
  -- * ```
  -- *
  -- * \param key a pointer to a key equal to the element being searched for.
  -- * \param base a pointer to the start of the array.
  -- * \param nmemb the number of elements in the array.
  -- * \param size the size of the elements in the array.
  -- * \param compare a function used to compare elements in the array.
  -- * \param userdata a pointer to pass to the compare function.
  -- * \returns a pointer to the matching element in the array, or NULL if not
  -- *          found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_bsearch
  -- * \sa SDL_qsort_r
  --  

   function SDL_bsearch_r
     (key : System.Address;
      base : System.Address;
      nmemb : stddef_h.size_t;
      size : stddef_h.size_t;
      compare : SDL_CompareCallback_r;
      userdata : System.Address) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:2107
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_bsearch_r";

  --*
  -- * Compute the absolute value of `x`.
  -- *
  -- * \param x an integer value.
  -- * \returns the absolute value of x.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_abs (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2119
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_abs";

  --*
  -- * Return the lesser of two values.
  -- *
  -- * This is a helper macro that might be more clear than writing out the
  -- * comparisons directly, and works with any type that can be compared with the
  -- * `<` operator. However, it double-evaluates both its parameters, so do not
  -- * use expressions with side-effects here.
  -- *
  -- * \param x the first value to compare.
  -- * \param y the second value to compare.
  -- * \returns the lesser of `x` and `y`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Return the greater of two values.
  -- *
  -- * This is a helper macro that might be more clear than writing out the
  -- * comparisons directly, and works with any type that can be compared with the
  -- * `>` operator. However, it double-evaluates both its parameters, so do not
  -- * use expressions with side-effects here.
  -- *
  -- * \param x the first value to compare.
  -- * \param y the second value to compare.
  -- * \returns the greater of `x` and `y`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Return a value clamped to a range.
  -- *
  -- * If `x` is outside the range a values between `a` and `b`, the returned
  -- * value will be `a` or `b` as appropriate. Otherwise, `x` is returned.
  -- *
  -- * This macro will produce incorrect results if `b` is less than `a`.
  -- *
  -- * This is a helper macro that might be more clear than writing out the
  -- * comparisons directly, and works with any type that can be compared with the
  -- * `<` and `>` operators. However, it double-evaluates all its parameters, so
  -- * do not use expressions with side-effects here.
  -- *
  -- * \param x the value to compare.
  -- * \param a the low end value.
  -- * \param b the high end value.
  -- * \returns x, clamped between a and b.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Query if a character is alphabetic (a letter).
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * for English 'a-z' and 'A-Z' as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isalpha (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2194
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isalpha";

  --*
  -- * Query if a character is alphabetic (a letter) or a number.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * for English 'a-z', 'A-Z', and '0-9' as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isalnum (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2209
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isalnum";

  --*
  -- * Report if a character is blank (a space or tab).
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * 0x20 (space) or 0x9 (tab) as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isblank (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2224
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isblank";

  --*
  -- * Report if a character is a control character.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * 0 through 0x1F, and 0x7F, as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_iscntrl (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2239
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_iscntrl";

  --*
  -- * Report if a character is a numeric digit.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * '0' (0x30) through '9' (0x39), as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isdigit (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2254
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isdigit";

  --*
  -- * Report if a character is a hexadecimal digit.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * 'A' through 'F', 'a' through 'f', and '0' through '9', as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isxdigit (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2269
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isxdigit";

  --*
  -- * Report if a character is a punctuation mark.
  -- *
  -- * **WARNING**: Regardless of system locale, this is equivalent to
  -- * `((SDL_isgraph(x)) && (!SDL_isalnum(x)))`.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_isgraph
  -- * \sa SDL_isalnum
  --  

   function SDL_ispunct (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2287
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ispunct";

  --*
  -- * Report if a character is whitespace.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat the
  -- * following ASCII values as true:
  -- *
  -- * - space (0x20)
  -- * - tab (0x09)
  -- * - newline (0x0A)
  -- * - vertical tab (0x0B)
  -- * - form feed (0x0C)
  -- * - return (0x0D)
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isspace (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2309
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isspace";

  --*
  -- * Report if a character is upper case.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * 'A' through 'Z' as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isupper (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2324
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isupper";

  --*
  -- * Report if a character is lower case.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * 'a' through 'z' as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_islower (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2339
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_islower";

  --*
  -- * Report if a character is "printable".
  -- *
  -- * Be advised that "printable" has a definition that goes back to text
  -- * terminals from the dawn of computing, making this a sort of special case
  -- * function that is not suitable for Unicode (or most any) text management.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only treat ASCII values
  -- * ' ' (0x20) through '~' (0x7E) as true.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_isprint (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2358
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isprint";

  --*
  -- * Report if a character is any "printable" except space.
  -- *
  -- * Be advised that "printable" has a definition that goes back to text
  -- * terminals from the dawn of computing, making this a sort of special case
  -- * function that is not suitable for Unicode (or most any) text management.
  -- *
  -- * **WARNING**: Regardless of system locale, this is equivalent to
  -- * `(SDL_isprint(x)) && ((x) != ' ')`.
  -- *
  -- * \param x character value to check.
  -- * \returns non-zero if x falls within the character class, zero otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_isprint
  --  

   function SDL_isgraph (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2379
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isgraph";

  --*
  -- * Convert low-ASCII English letters to uppercase.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only convert ASCII
  -- * values 'a' through 'z' to uppercase.
  -- *
  -- * This function returns the uppercase equivalent of `x`. If a character
  -- * cannot be converted, or is already uppercase, this function returns `x`.
  -- *
  -- * \param x character value to check.
  -- * \returns capitalized version of x, or x if no conversion available.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_toupper (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2397
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_toupper";

  --*
  -- * Convert low-ASCII English letters to lowercase.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only convert ASCII
  -- * values 'A' through 'Z' to lowercase.
  -- *
  -- * This function returns the lowercase equivalent of `x`. If a character
  -- * cannot be converted, or is already lowercase, this function returns `x`.
  -- *
  -- * \param x character value to check.
  -- * \returns lowercase version of x, or x if no conversion available.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_tolower (x : int) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2415
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_tolower";

  --*
  -- * Calculate a CRC-16 value.
  -- *
  -- * https://en.wikipedia.org/wiki/Cyclic_redundancy_check
  -- *
  -- * This function can be called multiple times, to stream data to be
  -- * checksummed in blocks. Each call must provide the previous CRC-16 return
  -- * value to be updated with the next block. The first call to this function
  -- * for a set of blocks should pass in a zero CRC value.
  -- *
  -- * \param crc the current checksum for this data set, or 0 for a new data set.
  -- * \param data a new block of data to add to the checksum.
  -- * \param len the size, in bytes, of the new block of data.
  -- * \returns a CRC-16 checksum value of all blocks in the data set.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_crc16
     (crc : Uint16;
      data : System.Address;
      len : stddef_h.size_t) return Uint16  -- /usr/local/include/SDL3/SDL_stdinc.h:2436
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_crc16";

  --*
  -- * Calculate a CRC-32 value.
  -- *
  -- * https://en.wikipedia.org/wiki/Cyclic_redundancy_check
  -- *
  -- * This function can be called multiple times, to stream data to be
  -- * checksummed in blocks. Each call must provide the previous CRC-32 return
  -- * value to be updated with the next block. The first call to this function
  -- * for a set of blocks should pass in a zero CRC value.
  -- *
  -- * \param crc the current checksum for this data set, or 0 for a new data set.
  -- * \param data a new block of data to add to the checksum.
  -- * \param len the size, in bytes, of the new block of data.
  -- * \returns a CRC-32 checksum value of all blocks in the data set.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_crc32
     (crc : Uint32;
      data : System.Address;
      len : stddef_h.size_t) return Uint32  -- /usr/local/include/SDL3/SDL_stdinc.h:2457
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_crc32";

  --*
  -- * Calculate a 32-bit MurmurHash3 value for a block of data.
  -- *
  -- * https://en.wikipedia.org/wiki/MurmurHash
  -- *
  -- * A seed may be specified, which changes the final results consistently, but
  -- * this does not work like SDL_crc16 and SDL_crc32: you can't feed a previous
  -- * result from this function back into itself as the next seed value to
  -- * calculate a hash in chunks; it won't produce the same hash as it would if
  -- * the same data was provided in a single call.
  -- *
  -- * If you aren't sure what to provide for a seed, zero is fine. Murmur3 is not
  -- * cryptographically secure, so it shouldn't be used for hashing top-secret
  -- * data.
  -- *
  -- * \param data the data to be hashed.
  -- * \param len the size of data, in bytes.
  -- * \param seed a value that alters the final hash value.
  -- * \returns a Murmur3 32-bit hash value.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_murmur3_32
     (data : System.Address;
      len : stddef_h.size_t;
      seed : Uint32) return Uint32  -- /usr/local/include/SDL3/SDL_stdinc.h:2483
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_murmur3_32";

  --*
  -- * Copy non-overlapping memory.
  -- *
  -- * The memory regions must not overlap. If they do, use SDL_memmove() instead.
  -- *
  -- * \param dst The destination memory region. Must not be NULL, and must not
  -- *            overlap with `src`.
  -- * \param src The source memory region. Must not be NULL, and must not overlap
  -- *            with `dst`.
  -- * \param len The length in bytes of both `dst` and `src`.
  -- * \returns `dst`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_memmove
  --  

   function SDL_memcpy
     (dst : System.Address;
      src : System.Address;
      len : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:2503
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_memcpy";

  -- Take advantage of compiler optimizations for memcpy  
  --*
  -- * A macro to copy memory between objects, with basic type checking.
  -- *
  -- * SDL_memcpy and SDL_memmove do not care where you copy memory to and from,
  -- * which can lead to bugs. This macro aims to avoid most of those bugs by
  -- * making sure that the source and destination are both pointers to objects
  -- * that are the same size. It does not check that the objects are the same
  -- * _type_, just that the copy will not overflow either object.
  -- *
  -- * The size check happens at compile time, and the compiler will throw an
  -- * error if the objects are different sizes.
  -- *
  -- * Generally this is intended to copy a single object, not an array.
  -- *
  -- * This macro looks like it double-evaluates its parameters, but the extras
  -- * them are in `sizeof` sections, which generate no code nor side-effects.
  -- *
  -- * \param dst a pointer to the destination object. Must not be NULL.
  -- * \param src a pointer to the source object. Must not be NULL.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Copy memory ranges that might overlap.
  -- *
  -- * It is okay for the memory regions to overlap. If you are confident that the
  -- * regions never overlap, using SDL_memcpy() may improve performance.
  -- *
  -- * \param dst The destination memory region. Must not be NULL.
  -- * \param src The source memory region. Must not be NULL.
  -- * \param len The length in bytes of both `dst` and `src`.
  -- * \returns `dst`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_memcpy
  --  

   function SDL_memmove
     (dst : System.Address;
      src : System.Address;
      len : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:2559
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_memmove";

  -- Take advantage of compiler optimizations for memmove  
  --*
  -- * Initialize all bytes of buffer of memory to a specific value.
  -- *
  -- * This function will set `len` bytes, pointed to by `dst`, to the value
  -- * specified in `c`.
  -- *
  -- * Despite `c` being an `int` instead of a `char`, this only operates on
  -- * bytes; `c` must be a value between 0 and 255, inclusive.
  -- *
  -- * \param dst the destination memory region. Must not be NULL.
  -- * \param c the byte value to set.
  -- * \param len the length, in bytes, to set in `dst`.
  -- * \returns `dst`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_memset
     (dst : System.Address;
      c : int;
      len : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:2587
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_memset";

  --*
  -- * Initialize all 32-bit words of buffer of memory to a specific value.
  -- *
  -- * This function will set a buffer of `dwords` Uint32 values, pointed to by
  -- * `dst`, to the value specified in `val`.
  -- *
  -- * Unlike SDL_memset, this sets 32-bit values, not bytes, so it's not limited
  -- * to a range of 0-255.
  -- *
  -- * \param dst the destination memory region. Must not be NULL.
  -- * \param val the Uint32 value to set.
  -- * \param dwords the number of Uint32 values to set in `dst`.
  -- * \returns `dst`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_memset4
     (dst : System.Address;
      val : Uint32;
      dwords : stddef_h.size_t) return System.Address  -- /usr/local/include/SDL3/SDL_stdinc.h:2607
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_memset4";

  -- Take advantage of compiler optimizations for memset  
  --*
  -- * Clear an object's memory to zero.
  -- *
  -- * This is wrapper over SDL_memset that handles calculating the object size,
  -- * so there's no chance of copy/paste errors, and the code is cleaner.
  -- *
  -- * This requires an object, not a pointer to an object, nor an array.
  -- *
  -- * \param x the object to clear.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_zerop
  -- * \sa SDL_zeroa
  --  

  --*
  -- * Clear an object's memory to zero, using a pointer.
  -- *
  -- * This is wrapper over SDL_memset that handles calculating the object size,
  -- * so there's no chance of copy/paste errors, and the code is cleaner.
  -- *
  -- * This requires a pointer to an object, not an object itself, nor an array.
  -- *
  -- * \param x a pointer to the object to clear.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_zero
  -- * \sa SDL_zeroa
  --  

  --*
  -- * Clear an array's memory to zero.
  -- *
  -- * This is wrapper over SDL_memset that handles calculating the array size, so
  -- * there's no chance of copy/paste errors, and the code is cleaner.
  -- *
  -- * This requires an array, not an object, nor a pointer to an object.
  -- *
  -- * \param x an array to clear.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_zero
  -- * \sa SDL_zerop
  --  

  --*
  -- * Compare two buffers of memory.
  -- *
  -- * \param s1 the first buffer to compare. NULL is not permitted!
  -- * \param s2 the second buffer to compare. NULL is not permitted!
  -- * \param len the number of bytes to compare between the buffers.
  -- * \returns less than zero if s1 is "less than" s2, greater than zero if s1 is
  -- *          "greater than" s2, and zero if the buffers match exactly for `len`
  -- *          bytes.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_memcmp
     (s1 : System.Address;
      s2 : System.Address;
      len : stddef_h.size_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2689
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_memcmp";

  --*
  -- * This works exactly like wcslen() but doesn't require access to a C runtime.
  -- *
  -- * Counts the number of wchar_t values in `wstr`, excluding the null
  -- * terminator.
  -- *
  -- * Like SDL_strlen only counts bytes and not codepoints in a UTF-8 string,
  -- * this counts wchar_t values in a string, even if the string's encoding is of
  -- * variable width, like UTF-16.
  -- *
  -- * Also be aware that wchar_t is different sizes on different platforms (4
  -- * bytes on Linux, 2 on Windows, etc).
  -- *
  -- * \param wstr The null-terminated wide string to read. Must not be NULL.
  -- * \returns the length (in wchar_t values, excluding the null terminator) of
  -- *          `wstr`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_wcsnlen
  -- * \sa SDL_utf8strlen
  -- * \sa SDL_utf8strnlen
  --  

   function SDL_wcslen (wstr : access stddef_h.wchar_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2716
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcslen";

  --*
  -- * This works exactly like wcsnlen() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Counts up to a maximum of `maxlen` wchar_t values in `wstr`, excluding the
  -- * null terminator.
  -- *
  -- * Like SDL_strnlen only counts bytes and not codepoints in a UTF-8 string,
  -- * this counts wchar_t values in a string, even if the string's encoding is of
  -- * variable width, like UTF-16.
  -- *
  -- * Also be aware that wchar_t is different sizes on different platforms (4
  -- * bytes on Linux, 2 on Windows, etc).
  -- *
  -- * Also, `maxlen` is a count of wide characters, not bytes!
  -- *
  -- * \param wstr The null-terminated wide string to read. Must not be NULL.
  -- * \param maxlen The maximum amount of wide characters to count.
  -- * \returns the length (in wide characters, excluding the null terminator) of
  -- *          `wstr` but never more than `maxlen`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_wcslen
  -- * \sa SDL_utf8strlen
  -- * \sa SDL_utf8strnlen
  --  

   function SDL_wcsnlen (wstr : access stddef_h.wchar_t; maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2747
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcsnlen";

  --*
  -- * Copy a wide string.
  -- *
  -- * This function copies `maxlen` - 1 wide characters from `src` to `dst`, then
  -- * appends a null terminator.
  -- *
  -- * `src` and `dst` must not overlap.
  -- *
  -- * If `maxlen` is 0, no wide characters are copied and no null terminator is
  -- * written.
  -- *
  -- * \param dst The destination buffer. Must not be NULL, and must not overlap
  -- *            with `src`.
  -- * \param src The null-terminated wide string to copy. Must not be NULL, and
  -- *            must not overlap with `dst`.
  -- * \param maxlen The length (in wide characters) of the destination buffer.
  -- * \returns the length (in wide characters, excluding the null terminator) of
  -- *          `src`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_wcslcat
  --  

   function SDL_wcslcpy
     (dst : access stddef_h.wchar_t;
      src : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2774
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcslcpy";

  --*
  -- * Concatenate wide strings.
  -- *
  -- * This function appends up to `maxlen` - SDL_wcslen(dst) - 1 wide characters
  -- * from `src` to the end of the wide string in `dst`, then appends a null
  -- * terminator.
  -- *
  -- * `src` and `dst` must not overlap.
  -- *
  -- * If `maxlen` - SDL_wcslen(dst) - 1 is less than or equal to 0, then `dst` is
  -- * unmodified.
  -- *
  -- * \param dst The destination buffer already containing the first
  -- *            null-terminated wide string. Must not be NULL and must not
  -- *            overlap with `src`.
  -- * \param src The second null-terminated wide string. Must not be NULL, and
  -- *            must not overlap with `dst`.
  -- * \param maxlen The length (in wide characters) of the destination buffer.
  -- * \returns the length (in wide characters, excluding the null terminator) of
  -- *          the string in `dst` plus the length of `src`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_wcslcpy
  --  

   function SDL_wcslcat
     (dst : access stddef_h.wchar_t;
      src : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2803
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcslcat";

  --*
  -- * Allocate a copy of a wide string.
  -- *
  -- * This allocates enough space for a null-terminated copy of `wstr`, using
  -- * SDL_malloc, and then makes a copy of the string into this space.
  -- *
  -- * The returned string is owned by the caller, and should be passed to
  -- * SDL_free when no longer needed.
  -- *
  -- * \param wstr the string to copy.
  -- * \returns a pointer to the newly-allocated wide string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcsdup (wstr : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2821
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcsdup";

  --*
  -- * Search a wide string for the first instance of a specific substring.
  -- *
  -- * The search ends once it finds the requested substring, or a null terminator
  -- * byte to end the string.
  -- *
  -- * Note that this looks for strings of _wide characters_, not _codepoints_, so
  -- * it's legal to search for malformed and incomplete UTF-16 sequences.
  -- *
  -- * \param haystack the wide string to search. Must not be NULL.
  -- * \param needle the wide string to search for. Must not be NULL.
  -- * \returns a pointer to the first instance of `needle` in the string, or NULL
  -- *          if not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcsstr (haystack : access stddef_h.wchar_t; needle : access stddef_h.wchar_t) return access stddef_h.wchar_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2841
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcsstr";

  --*
  -- * Search a wide string, up to n wide chars, for the first instance of a
  -- * specific substring.
  -- *
  -- * The search ends once it finds the requested substring, or a null terminator
  -- * value to end the string, or `maxlen` wide character have been examined. It
  -- * is possible to use this function on a wide string without a null
  -- * terminator.
  -- *
  -- * Note that this looks for strings of _wide characters_, not _codepoints_, so
  -- * it's legal to search for malformed and incomplete UTF-16 sequences.
  -- *
  -- * \param haystack the wide string to search. Must not be NULL.
  -- * \param needle the wide string to search for. Must not be NULL.
  -- * \param maxlen the maximum number of wide characters to search in
  -- *               `haystack`.
  -- * \returns a pointer to the first instance of `needle` in the string, or NULL
  -- *          if not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcsnstr
     (haystack : access stddef_h.wchar_t;
      needle : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t) return access stddef_h.wchar_t  -- /usr/local/include/SDL3/SDL_stdinc.h:2866
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcsnstr";

  --*
  -- * Compare two null-terminated wide strings.
  -- *
  -- * This only compares wchar_t values until it hits a null-terminating
  -- * character; it does not care if the string is well-formed UTF-16 (or UTF-32,
  -- * depending on your platform's wchar_t size), or uses valid Unicode values.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcscmp (str1 : access stddef_h.wchar_t; str2 : access stddef_h.wchar_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2885
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcscmp";

  --*
  -- * Compare two wide strings up to a number of wchar_t values.
  -- *
  -- * This only compares wchar_t values; it does not care if the string is
  -- * well-formed UTF-16 (or UTF-32, depending on your platform's wchar_t size),
  -- * or uses valid Unicode values.
  -- *
  -- * Note that while this function is intended to be used with UTF-16 (or
  -- * UTF-32, depending on your platform's definition of wchar_t), it is
  -- * comparing raw wchar_t values and not Unicode codepoints: `maxlen` specifies
  -- * a wchar_t limit! If the limit lands in the middle of a multi-wchar UTF-16
  -- * sequence, it will only compare a portion of the final character.
  -- *
  -- * `maxlen` specifies a maximum number of wchar_t to compare; if the strings
  -- * match to this number of wide chars (or both have matched to a
  -- * null-terminator character before this count), they will be considered
  -- * equal.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \param maxlen the maximum number of wchar_t to compare.
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcsncmp
     (str1 : access stddef_h.wchar_t;
      str2 : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2916
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcsncmp";

  --*
  -- * Compare two null-terminated wide strings, case-insensitively.
  -- *
  -- * This will work with Unicode strings, using a technique called
  -- * "case-folding" to handle the vast majority of case-sensitive human
  -- * languages regardless of system locale. It can deal with expanding values: a
  -- * German Eszett character can compare against two ASCII 's' chars and be
  -- * considered a match, for example. A notable exception: it does not handle
  -- * the Turkish 'i' character; human language is complicated!
  -- *
  -- * Depending on your platform, "wchar_t" might be 2 bytes, and expected to be
  -- * UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
  -- * handles Unicode, it expects the string to be well-formed and not a
  -- * null-terminated string of arbitrary bytes. Characters that are not valid
  -- * UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), which is to say two strings of random bits may turn out to
  -- * match if they convert to the same amount of replacement characters.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcscasecmp (str1 : access stddef_h.wchar_t; str2 : access stddef_h.wchar_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2946
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcscasecmp";

  --*
  -- * Compare two wide strings, case-insensitively, up to a number of wchar_t.
  -- *
  -- * This will work with Unicode strings, using a technique called
  -- * "case-folding" to handle the vast majority of case-sensitive human
  -- * languages regardless of system locale. It can deal with expanding values: a
  -- * German Eszett character can compare against two ASCII 's' chars and be
  -- * considered a match, for example. A notable exception: it does not handle
  -- * the Turkish 'i' character; human language is complicated!
  -- *
  -- * Depending on your platform, "wchar_t" might be 2 bytes, and expected to be
  -- * UTF-16 encoded (like Windows), or 4 bytes in UTF-32 format. Since this
  -- * handles Unicode, it expects the string to be well-formed and not a
  -- * null-terminated string of arbitrary bytes. Characters that are not valid
  -- * UTF-16 (or UTF-32) are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), which is to say two strings of random bits may turn out to
  -- * match if they convert to the same amount of replacement characters.
  -- *
  -- * Note that while this function might deal with variable-sized characters,
  -- * `maxlen` specifies a _wchar_ limit! If the limit lands in the middle of a
  -- * multi-byte UTF-16 sequence, it may convert a portion of the final character
  -- * to one or more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not
  -- * to overflow a buffer.
  -- *
  -- * `maxlen` specifies a maximum number of wchar_t values to compare; if the
  -- * strings match to this number of wchar_t (or both have matched to a
  -- * null-terminator character before this number of bytes), they will be
  -- * considered equal.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \param maxlen the maximum number of wchar_t values to compare.
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_wcsncasecmp
     (str1 : access stddef_h.wchar_t;
      str2 : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:2988
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcsncasecmp";

  --*
  -- * Parse a `long` from a wide string.
  -- *
  -- * If `str` starts with whitespace, then those whitespace characters are
  -- * skipped before attempting to parse the number.
  -- *
  -- * If the parsed number does not fit inside a `long`, the result is clamped to
  -- * the minimum and maximum representable `long` values.
  -- *
  -- * \param str The null-terminated wide string to read. Must not be NULL.
  -- * \param endp If not NULL, the address of the first invalid wide character
  -- *             (i.e. the next character after the parsed number) will be
  -- *             written to this pointer.
  -- * \param base The base of the integer to read. Supported values are 0 and 2
  -- *             to 36 inclusive. If 0, the base will be inferred from the
  -- *             number's prefix (0x for hexadecimal, 0 for octal, decimal
  -- *             otherwise).
  -- * \returns the parsed `long`, or 0 if no number could be parsed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strtol
  --  

   function SDL_wcstol
     (str : access stddef_h.wchar_t;
      endp : System.Address;
      base : int) return long  -- /usr/local/include/SDL3/SDL_stdinc.h:3015
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_wcstol";

  --*
  -- * This works exactly like strlen() but doesn't require access to a C runtime.
  -- *
  -- * Counts the bytes in `str`, excluding the null terminator.
  -- *
  -- * If you need the length of a UTF-8 string, consider using SDL_utf8strlen().
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \returns the length (in bytes, excluding the null terminator) of `src`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strnlen
  -- * \sa SDL_utf8strlen
  -- * \sa SDL_utf8strnlen
  --  

   function SDL_strlen (str : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3035
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strlen";

  --*
  -- * This works exactly like strnlen() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Counts up to a maximum of `maxlen` bytes in `str`, excluding the null
  -- * terminator.
  -- *
  -- * If you need the length of a UTF-8 string, consider using SDL_utf8strnlen().
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \param maxlen The maximum amount of bytes to count.
  -- * \returns the length (in bytes, excluding the null terminator) of `src` but
  -- *          never more than `maxlen`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strlen
  -- * \sa SDL_utf8strlen
  -- * \sa SDL_utf8strnlen
  --  

   function SDL_strnlen (str : Interfaces.C.Strings.chars_ptr; maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3059
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strnlen";

  --*
  -- * Copy a string.
  -- *
  -- * This function copies up to `maxlen` - 1 characters from `src` to `dst`,
  -- * then appends a null terminator.
  -- *
  -- * If `maxlen` is 0, no characters are copied and no null terminator is
  -- * written.
  -- *
  -- * If you want to copy an UTF-8 string but need to ensure that multi-byte
  -- * sequences are not truncated, consider using SDL_utf8strlcpy().
  -- *
  -- * \param dst The destination buffer. Must not be NULL, and must not overlap
  -- *            with `src`.
  -- * \param src The null-terminated string to copy. Must not be NULL, and must
  -- *            not overlap with `dst`.
  -- * \param maxlen The length (in characters) of the destination buffer.
  -- * \returns the length (in characters, excluding the null terminator) of
  -- *          `src`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strlcat
  -- * \sa SDL_utf8strlcpy
  --  

   function SDL_strlcpy
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3088
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strlcpy";

  --*
  -- * Copy an UTF-8 string.
  -- *
  -- * This function copies up to `dst_bytes` - 1 bytes from `src` to `dst` while
  -- * also ensuring that the string written to `dst` does not end in a truncated
  -- * multi-byte sequence. Finally, it appends a null terminator.
  -- *
  -- * `src` and `dst` must not overlap.
  -- *
  -- * Note that unlike SDL_strlcpy(), this function returns the number of bytes
  -- * written, not the length of `src`.
  -- *
  -- * \param dst The destination buffer. Must not be NULL, and must not overlap
  -- *            with `src`.
  -- * \param src The null-terminated UTF-8 string to copy. Must not be NULL, and
  -- *            must not overlap with `dst`.
  -- * \param dst_bytes The length (in bytes) of the destination buffer. Must not
  -- *                  be 0.
  -- * \returns the number of bytes written, excluding the null terminator.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strlcpy
  --  

   function SDL_utf8strlcpy
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      dst_bytes : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3116
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_utf8strlcpy";

  --*
  -- * Concatenate strings.
  -- *
  -- * This function appends up to `maxlen` - SDL_strlen(dst) - 1 characters from
  -- * `src` to the end of the string in `dst`, then appends a null terminator.
  -- *
  -- * `src` and `dst` must not overlap.
  -- *
  -- * If `maxlen` - SDL_strlen(dst) - 1 is less than or equal to 0, then `dst` is
  -- * unmodified.
  -- *
  -- * \param dst The destination buffer already containing the first
  -- *            null-terminated string. Must not be NULL and must not overlap
  -- *            with `src`.
  -- * \param src The second null-terminated string. Must not be NULL, and must
  -- *            not overlap with `dst`.
  -- * \param maxlen The length (in characters) of the destination buffer.
  -- * \returns the length (in characters, excluding the null terminator) of the
  -- *          string in `dst` plus the length of `src`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strlcpy
  --  

   function SDL_strlcat
     (dst : Interfaces.C.Strings.chars_ptr;
      src : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3144
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strlcat";

  --*
  -- * Allocate a copy of a string.
  -- *
  -- * This allocates enough space for a null-terminated copy of `str`, using
  -- * SDL_malloc, and then makes a copy of the string into this space.
  -- *
  -- * The returned string is owned by the caller, and should be passed to
  -- * SDL_free when no longer needed.
  -- *
  -- * \param str the string to copy.
  -- * \returns a pointer to the newly-allocated string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strdup (str : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3162
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strdup";

  --*
  -- * Allocate a copy of a string, up to n characters.
  -- *
  -- * This allocates enough space for a null-terminated copy of `str`, up to
  -- * `maxlen` bytes, using SDL_malloc, and then makes a copy of the string into
  -- * this space.
  -- *
  -- * If the string is longer than `maxlen` bytes, the returned string will be
  -- * `maxlen` bytes long, plus a null-terminator character that isn't included
  -- * in the count.
  -- *
  -- * The returned string is owned by the caller, and should be passed to
  -- * SDL_free when no longer needed.
  -- *
  -- * \param str the string to copy.
  -- * \param maxlen the maximum length of the copied string, not counting the
  -- *               null-terminator character.
  -- * \returns a pointer to the newly-allocated string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strndup (str : Interfaces.C.Strings.chars_ptr; maxlen : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3187
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strndup";

  --*
  -- * Reverse a string's contents.
  -- *
  -- * This reverses a null-terminated string in-place. Only the content of the
  -- * string is reversed; the null-terminator character remains at the end of the
  -- * reversed string.
  -- *
  -- * **WARNING**: This function reverses the _bytes_ of the string, not the
  -- * codepoints. If `str` is a UTF-8 string with Unicode codepoints > 127, this
  -- * will ruin the string data. You should only use this function on strings
  -- * that are completely comprised of low ASCII characters.
  -- *
  -- * \param str the string to reverse.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strrev (str : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3208
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strrev";

  --*
  -- * Convert a string to uppercase.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only convert ASCII
  -- * values 'A' through 'Z' to uppercase.
  -- *
  -- * This function operates on a null-terminated string of bytes--even if it is
  -- * malformed UTF-8!--and converts ASCII characters 'a' through 'z' to their
  -- * uppercase equivalents in-place, returning the original `str` pointer.
  -- *
  -- * \param str the string to convert in-place. Can not be NULL.
  -- * \returns the `str` pointer passed into this function.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strlwr
  --  

   function SDL_strupr (str : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3229
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strupr";

  --*
  -- * Convert a string to lowercase.
  -- *
  -- * **WARNING**: Regardless of system locale, this will only convert ASCII
  -- * values 'A' through 'Z' to lowercase.
  -- *
  -- * This function operates on a null-terminated string of bytes--even if it is
  -- * malformed UTF-8!--and converts ASCII characters 'A' through 'Z' to their
  -- * lowercase equivalents in-place, returning the original `str` pointer.
  -- *
  -- * \param str the string to convert in-place. Can not be NULL.
  -- * \returns the `str` pointer passed into this function.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_strupr
  --  

   function SDL_strlwr (str : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3250
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strlwr";

  --*
  -- * Search a string for the first instance of a specific byte.
  -- *
  -- * The search ends once it finds the requested byte value, or a null
  -- * terminator byte to end the string.
  -- *
  -- * Note that this looks for _bytes_, not _characters_, so you cannot match
  -- * against a Unicode codepoint > 255, regardless of character encoding.
  -- *
  -- * \param str the string to search. Must not be NULL.
  -- * \param c the byte value to search for.
  -- * \returns a pointer to the first instance of `c` in the string, or NULL if
  -- *          not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strchr (str : Interfaces.C.Strings.chars_ptr; c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3270
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strchr";

  --*
  -- * Search a string for the last instance of a specific byte.
  -- *
  -- * The search must go until it finds a null terminator byte to end the string.
  -- *
  -- * Note that this looks for _bytes_, not _characters_, so you cannot match
  -- * against a Unicode codepoint > 255, regardless of character encoding.
  -- *
  -- * \param str the string to search. Must not be NULL.
  -- * \param c the byte value to search for.
  -- * \returns a pointer to the last instance of `c` in the string, or NULL if
  -- *          not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strrchr (str : Interfaces.C.Strings.chars_ptr; c : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3289
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strrchr";

  --*
  -- * Search a string for the first instance of a specific substring.
  -- *
  -- * The search ends once it finds the requested substring, or a null terminator
  -- * byte to end the string.
  -- *
  -- * Note that this looks for strings of _bytes_, not _characters_, so it's
  -- * legal to search for malformed and incomplete UTF-8 sequences.
  -- *
  -- * \param haystack the string to search. Must not be NULL.
  -- * \param needle the string to search for. Must not be NULL.
  -- * \returns a pointer to the first instance of `needle` in the string, or NULL
  -- *          if not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strstr (haystack : Interfaces.C.Strings.chars_ptr; needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3309
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strstr";

  --*
  -- * Search a string, up to n bytes, for the first instance of a specific
  -- * substring.
  -- *
  -- * The search ends once it finds the requested substring, or a null terminator
  -- * byte to end the string, or `maxlen` bytes have been examined. It is
  -- * possible to use this function on a string without a null terminator.
  -- *
  -- * Note that this looks for strings of _bytes_, not _characters_, so it's
  -- * legal to search for malformed and incomplete UTF-8 sequences.
  -- *
  -- * \param haystack the string to search. Must not be NULL.
  -- * \param needle the string to search for. Must not be NULL.
  -- * \param maxlen the maximum number of bytes to search in `haystack`.
  -- * \returns a pointer to the first instance of `needle` in the string, or NULL
  -- *          if not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strnstr
     (haystack : Interfaces.C.Strings.chars_ptr;
      needle : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3332
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strnstr";

  --*
  -- * Search a UTF-8 string for the first instance of a specific substring,
  -- * case-insensitively.
  -- *
  -- * This will work with Unicode strings, using a technique called
  -- * "case-folding" to handle the vast majority of case-sensitive human
  -- * languages regardless of system locale. It can deal with expanding values: a
  -- * German Eszett character can compare against two ASCII 's' chars and be
  -- * considered a match, for example. A notable exception: it does not handle
  -- * the Turkish 'i' character; human language is complicated!
  -- *
  -- * Since this handles Unicode, it expects the strings to be well-formed UTF-8
  -- * and not a null-terminated string of arbitrary bytes. Bytes that are not
  -- * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), which is to say two strings of random bits may turn out to
  -- * match if they convert to the same amount of replacement characters.
  -- *
  -- * \param haystack the string to search. Must not be NULL.
  -- * \param needle the string to search for. Must not be NULL.
  -- * \returns a pointer to the first instance of `needle` in the string, or NULL
  -- *          if not found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strcasestr (haystack : Interfaces.C.Strings.chars_ptr; needle : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3360
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strcasestr";

  --*
  -- * This works exactly like strtok_r() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Break a string up into a series of tokens.
  -- *
  -- * To start tokenizing a new string, `str` should be the non-NULL address of
  -- * the string to start tokenizing. Future calls to get the next token from the
  -- * same string should specify a NULL.
  -- *
  -- * Note that this function will overwrite pieces of `str` with null chars to
  -- * split it into tokens. This function cannot be used with const/read-only
  -- * strings!
  -- *
  -- * `saveptr` just needs to point to a `char *` that can be overwritten; SDL
  -- * will use this to save tokenizing state between calls. It is initialized if
  -- * `str` is non-NULL, and used to resume tokenizing when `str` is NULL.
  -- *
  -- * \param str the string to tokenize, or NULL to continue tokenizing.
  -- * \param delim the delimiter string that separates tokens.
  -- * \param saveptr pointer to a char *, used for ongoing state.
  -- * \returns A pointer to the next token, or NULL if no tokens remain.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strtok_r
     (str : Interfaces.C.Strings.chars_ptr;
      delim : Interfaces.C.Strings.chars_ptr;
      saveptr : System.Address) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3389
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strtok_r";

  --*
  -- * Count the number of codepoints in a UTF-8 string.
  -- *
  -- * Counts the _codepoints_, not _bytes_, in `str`, excluding the null
  -- * terminator.
  -- *
  -- * If you need to count the bytes in a string instead, consider using
  -- * SDL_strlen().
  -- *
  -- * Since this handles Unicode, it expects the strings to be well-formed UTF-8
  -- * and not a null-terminated string of arbitrary bytes. Bytes that are not
  -- * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the
  -- * count by several replacement characters.
  -- *
  -- * \param str The null-terminated UTF-8 string to read. Must not be NULL.
  -- * \returns The length (in codepoints, excluding the null terminator) of
  -- *          `src`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_utf8strnlen
  -- * \sa SDL_strlen
  --  

   function SDL_utf8strlen (str : Interfaces.C.Strings.chars_ptr) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3417
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_utf8strlen";

  --*
  -- * Count the number of codepoints in a UTF-8 string, up to n bytes.
  -- *
  -- * Counts the _codepoints_, not _bytes_, in `str`, excluding the null
  -- * terminator.
  -- *
  -- * If you need to count the bytes in a string instead, consider using
  -- * SDL_strnlen().
  -- *
  -- * The counting stops at `bytes` bytes (not codepoints!). This seems
  -- * counterintuitive, but makes it easy to express the total size of the
  -- * string's buffer.
  -- *
  -- * Since this handles Unicode, it expects the strings to be well-formed UTF-8
  -- * and not a null-terminated string of arbitrary bytes. Bytes that are not
  -- * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), so a malformed or incomplete UTF-8 sequence might increase the
  -- * count by several replacement characters.
  -- *
  -- * \param str The null-terminated UTF-8 string to read. Must not be NULL.
  -- * \param bytes The maximum amount of bytes to count.
  -- * \returns The length (in codepoints, excluding the null terminator) of `src`
  -- *          but never more than `maxlen`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_utf8strlen
  -- * \sa SDL_strnlen
  --  

   function SDL_utf8strnlen (str : Interfaces.C.Strings.chars_ptr; bytes : stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:3450
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_utf8strnlen";

  --*
  -- * Convert an integer into a string.
  -- *
  -- * This requires a radix to specified for string format. Specifying 10
  -- * produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
  -- * to 36.
  -- *
  -- * Note that this function will overflow a buffer if `str` is not large enough
  -- * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
  -- * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
  -- * much more space than you expect to use (and don't forget possible negative
  -- * signs, null terminator bytes, etc).
  -- *
  -- * \param value the integer to convert.
  -- * \param str the buffer to write the string into.
  -- * \param radix the radix to use for string generation.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_uitoa
  -- * \sa SDL_ltoa
  -- * \sa SDL_lltoa
  --  

   function SDL_itoa
     (value : int;
      str : Interfaces.C.Strings.chars_ptr;
      radix : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3478
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_itoa";

  --*
  -- * Convert an unsigned integer into a string.
  -- *
  -- * This requires a radix to specified for string format. Specifying 10
  -- * produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
  -- * to 36.
  -- *
  -- * Note that this function will overflow a buffer if `str` is not large enough
  -- * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
  -- * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
  -- * much more space than you expect to use (and don't forget null terminator
  -- * bytes, etc).
  -- *
  -- * \param value the unsigned integer to convert.
  -- * \param str the buffer to write the string into.
  -- * \param radix the radix to use for string generation.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_itoa
  -- * \sa SDL_ultoa
  -- * \sa SDL_ulltoa
  --  

   function SDL_uitoa
     (value : unsigned;
      str : Interfaces.C.Strings.chars_ptr;
      radix : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3506
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_uitoa";

  --*
  -- * Convert a long integer into a string.
  -- *
  -- * This requires a radix to specified for string format. Specifying 10
  -- * produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
  -- * to 36.
  -- *
  -- * Note that this function will overflow a buffer if `str` is not large enough
  -- * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
  -- * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
  -- * much more space than you expect to use (and don't forget possible negative
  -- * signs, null terminator bytes, etc).
  -- *
  -- * \param value the long integer to convert.
  -- * \param str the buffer to write the string into.
  -- * \param radix the radix to use for string generation.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ultoa
  -- * \sa SDL_itoa
  -- * \sa SDL_lltoa
  --  

   function SDL_ltoa
     (value : long;
      str : Interfaces.C.Strings.chars_ptr;
      radix : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3534
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ltoa";

  --*
  -- * Convert an unsigned long integer into a string.
  -- *
  -- * This requires a radix to specified for string format. Specifying 10
  -- * produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
  -- * to 36.
  -- *
  -- * Note that this function will overflow a buffer if `str` is not large enough
  -- * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
  -- * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
  -- * much more space than you expect to use (and don't forget null terminator
  -- * bytes, etc).
  -- *
  -- * \param value the unsigned long integer to convert.
  -- * \param str the buffer to write the string into.
  -- * \param radix the radix to use for string generation.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ltoa
  -- * \sa SDL_uitoa
  -- * \sa SDL_ulltoa
  --  

   function SDL_ultoa
     (value : unsigned_long;
      str : Interfaces.C.Strings.chars_ptr;
      radix : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3562
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ultoa";

  --*
  -- * Convert a long long integer into a string.
  -- *
  -- * This requires a radix to specified for string format. Specifying 10
  -- * produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
  -- * to 36.
  -- *
  -- * Note that this function will overflow a buffer if `str` is not large enough
  -- * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
  -- * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
  -- * much more space than you expect to use (and don't forget possible negative
  -- * signs, null terminator bytes, etc).
  -- *
  -- * \param value the long long integer to convert.
  -- * \param str the buffer to write the string into.
  -- * \param radix the radix to use for string generation.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ulltoa
  -- * \sa SDL_itoa
  -- * \sa SDL_ltoa
  --  

   function SDL_lltoa
     (value : Long_Long_Integer;
      str : Interfaces.C.Strings.chars_ptr;
      radix : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3592
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_lltoa";

  --*
  -- * Convert an unsigned long long integer into a string.
  -- *
  -- * This requires a radix to specified for string format. Specifying 10
  -- * produces a decimal number, 16 hexadecimal, etc. Must be in the range of 2
  -- * to 36.
  -- *
  -- * Note that this function will overflow a buffer if `str` is not large enough
  -- * to hold the output! It may be safer to use SDL_snprintf to clamp output, or
  -- * SDL_asprintf to allocate a buffer. Otherwise, it doesn't hurt to allocate
  -- * much more space than you expect to use (and don't forget null terminator
  -- * bytes, etc).
  -- *
  -- * \param value the unsigned long long integer to convert.
  -- * \param str the buffer to write the string into.
  -- * \param radix the radix to use for string generation.
  -- * \returns `str`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_lltoa
  -- * \sa SDL_uitoa
  -- * \sa SDL_ultoa
  --  

   function SDL_ulltoa
     (value : Extensions.unsigned_long_long;
      str : Interfaces.C.Strings.chars_ptr;
      radix : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3620
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ulltoa";

  --*
  -- * Parse an `int` from a string.
  -- *
  -- * The result of calling `SDL_atoi(str)` is equivalent to
  -- * `(int)SDL_strtol(str, NULL, 10)`.
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \returns the parsed `int`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atof
  -- * \sa SDL_strtol
  -- * \sa SDL_strtoul
  -- * \sa SDL_strtoll
  -- * \sa SDL_strtoull
  -- * \sa SDL_strtod
  -- * \sa SDL_itoa
  --  

   function SDL_atoi (str : Interfaces.C.Strings.chars_ptr) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:3644
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_atoi";

  --*
  -- * Parse a `double` from a string.
  -- *
  -- * The result of calling `SDL_atof(str)` is equivalent to `SDL_strtod(str,
  -- * NULL)`.
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \returns the parsed `double`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atoi
  -- * \sa SDL_strtol
  -- * \sa SDL_strtoul
  -- * \sa SDL_strtoll
  -- * \sa SDL_strtoull
  -- * \sa SDL_strtod
  --  

   function SDL_atof (str : Interfaces.C.Strings.chars_ptr) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:3666
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_atof";

  --*
  -- * Parse a `long` from a string.
  -- *
  -- * If `str` starts with whitespace, then those whitespace characters are
  -- * skipped before attempting to parse the number.
  -- *
  -- * If the parsed number does not fit inside a `long`, the result is clamped to
  -- * the minimum and maximum representable `long` values.
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \param endp If not NULL, the address of the first invalid character (i.e.
  -- *             the next character after the parsed number) will be written to
  -- *             this pointer.
  -- * \param base The base of the integer to read. Supported values are 0 and 2
  -- *             to 36 inclusive. If 0, the base will be inferred from the
  -- *             number's prefix (0x for hexadecimal, 0 for octal, decimal
  -- *             otherwise).
  -- * \returns the parsed `long`, or 0 if no number could be parsed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atoi
  -- * \sa SDL_atof
  -- * \sa SDL_strtoul
  -- * \sa SDL_strtoll
  -- * \sa SDL_strtoull
  -- * \sa SDL_strtod
  -- * \sa SDL_ltoa
  -- * \sa SDL_wcstol
  --  

   function SDL_strtol
     (str : Interfaces.C.Strings.chars_ptr;
      endp : System.Address;
      base : int) return long  -- /usr/local/include/SDL3/SDL_stdinc.h:3700
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strtol";

  --*
  -- * Parse an `unsigned long` from a string.
  -- *
  -- * If `str` starts with whitespace, then those whitespace characters are
  -- * skipped before attempting to parse the number.
  -- *
  -- * If the parsed number does not fit inside an `unsigned long`, the result is
  -- * clamped to the maximum representable `unsigned long` value.
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \param endp If not NULL, the address of the first invalid character (i.e.
  -- *             the next character after the parsed number) will be written to
  -- *             this pointer.
  -- * \param base The base of the integer to read. Supported values are 0 and 2
  -- *             to 36 inclusive. If 0, the base will be inferred from the
  -- *             number's prefix (0x for hexadecimal, 0 for octal, decimal
  -- *             otherwise).
  -- * \returns the parsed `unsigned long`, or 0 if no number could be parsed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atoi
  -- * \sa SDL_atof
  -- * \sa SDL_strtol
  -- * \sa SDL_strtoll
  -- * \sa SDL_strtoull
  -- * \sa SDL_strtod
  -- * \sa SDL_ultoa
  --  

   function SDL_strtoul
     (str : Interfaces.C.Strings.chars_ptr;
      endp : System.Address;
      base : int) return unsigned_long  -- /usr/local/include/SDL3/SDL_stdinc.h:3733
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strtoul";

  --*
  -- * Parse a `long long` from a string.
  -- *
  -- * If `str` starts with whitespace, then those whitespace characters are
  -- * skipped before attempting to parse the number.
  -- *
  -- * If the parsed number does not fit inside a `long long`, the result is
  -- * clamped to the minimum and maximum representable `long long` values.
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \param endp If not NULL, the address of the first invalid character (i.e.
  -- *             the next character after the parsed number) will be written to
  -- *             this pointer.
  -- * \param base The base of the integer to read. Supported values are 0 and 2
  -- *             to 36 inclusive. If 0, the base will be inferred from the
  -- *             number's prefix (0x for hexadecimal, 0 for octal, decimal
  -- *             otherwise).
  -- * \returns the parsed `long long`, or 0 if no number could be parsed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atoi
  -- * \sa SDL_atof
  -- * \sa SDL_strtol
  -- * \sa SDL_strtoul
  -- * \sa SDL_strtoull
  -- * \sa SDL_strtod
  -- * \sa SDL_lltoa
  --  

   function SDL_strtoll
     (str : Interfaces.C.Strings.chars_ptr;
      endp : System.Address;
      base : int) return Long_Long_Integer  -- /usr/local/include/SDL3/SDL_stdinc.h:3768
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strtoll";

  --*
  -- * Parse an `unsigned long long` from a string.
  -- *
  -- * If `str` starts with whitespace, then those whitespace characters are
  -- * skipped before attempting to parse the number.
  -- *
  -- * If the parsed number does not fit inside an `unsigned long long`, the
  -- * result is clamped to the maximum representable `unsigned long long` value.
  -- *
  -- * \param str The null-terminated string to read. Must not be NULL.
  -- * \param endp If not NULL, the address of the first invalid character (i.e.
  -- *             the next character after the parsed number) will be written to
  -- *             this pointer.
  -- * \param base The base of the integer to read. Supported values are 0 and 2
  -- *             to 36 inclusive. If 0, the base will be inferred from the
  -- *             number's prefix (0x for hexadecimal, 0 for octal, decimal
  -- *             otherwise).
  -- * \returns the parsed `unsigned long long`, or 0 if no number could be
  -- *          parsed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atoi
  -- * \sa SDL_atof
  -- * \sa SDL_strtol
  -- * \sa SDL_strtoll
  -- * \sa SDL_strtoul
  -- * \sa SDL_strtod
  -- * \sa SDL_ulltoa
  --  

   function SDL_strtoull
     (str : Interfaces.C.Strings.chars_ptr;
      endp : System.Address;
      base : int) return Extensions.unsigned_long_long  -- /usr/local/include/SDL3/SDL_stdinc.h:3802
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strtoull";

  --*
  -- * Parse a `double` from a string.
  -- *
  -- * This function makes fewer guarantees than the C runtime `strtod`:
  -- *
  -- * - Only decimal notation is guaranteed to be supported. The handling of
  -- *   scientific and hexadecimal notation is unspecified.
  -- * - Whether or not INF and NAN can be parsed is unspecified.
  -- * - The precision of the result is unspecified.
  -- *
  -- * \param str the null-terminated string to read. Must not be NULL.
  -- * \param endp if not NULL, the address of the first invalid character (i.e.
  -- *             the next character after the parsed number) will be written to
  -- *             this pointer.
  -- * \returns the parsed `double`, or 0 if no number could be parsed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atoi
  -- * \sa SDL_atof
  -- * \sa SDL_strtol
  -- * \sa SDL_strtoll
  -- * \sa SDL_strtoul
  -- * \sa SDL_strtoull
  --  

   function SDL_strtod (str : Interfaces.C.Strings.chars_ptr; endp : System.Address) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:3832
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strtod";

  --*
  -- * Compare two null-terminated UTF-8 strings.
  -- *
  -- * Due to the nature of UTF-8 encoding, this will work with Unicode strings,
  -- * since effectively this function just compares bytes until it hits a
  -- * null-terminating character. Also due to the nature of UTF-8, this can be
  -- * used with SDL_qsort() to put strings in (roughly) alphabetical order.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strcmp (str1 : Interfaces.C.Strings.chars_ptr; str2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:3852
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strcmp";

  --*
  -- * Compare two UTF-8 strings up to a number of bytes.
  -- *
  -- * Due to the nature of UTF-8 encoding, this will work with Unicode strings,
  -- * since effectively this function just compares bytes until it hits a
  -- * null-terminating character. Also due to the nature of UTF-8, this can be
  -- * used with SDL_qsort() to put strings in (roughly) alphabetical order.
  -- *
  -- * Note that while this function is intended to be used with UTF-8, it is
  -- * doing a bytewise comparison, and `maxlen` specifies a _byte_ limit! If the
  -- * limit lands in the middle of a multi-byte UTF-8 sequence, it will only
  -- * compare a portion of the final character.
  -- *
  -- * `maxlen` specifies a maximum number of bytes to compare; if the strings
  -- * match to this number of bytes (or both have matched to a null-terminator
  -- * character before this number of bytes), they will be considered equal.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \param maxlen the maximum number of _bytes_ to compare.
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strncmp
     (str1 : Interfaces.C.Strings.chars_ptr;
      str2 : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:3882
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strncmp";

  --*
  -- * Compare two null-terminated UTF-8 strings, case-insensitively.
  -- *
  -- * This will work with Unicode strings, using a technique called
  -- * "case-folding" to handle the vast majority of case-sensitive human
  -- * languages regardless of system locale. It can deal with expanding values: a
  -- * German Eszett character can compare against two ASCII 's' chars and be
  -- * considered a match, for example. A notable exception: it does not handle
  -- * the Turkish 'i' character; human language is complicated!
  -- *
  -- * Since this handles Unicode, it expects the string to be well-formed UTF-8
  -- * and not a null-terminated string of arbitrary bytes. Bytes that are not
  -- * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), which is to say two strings of random bits may turn out to
  -- * match if they convert to the same amount of replacement characters.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strcasecmp (str1 : Interfaces.C.Strings.chars_ptr; str2 : Interfaces.C.Strings.chars_ptr) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:3910
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strcasecmp";

  --*
  -- * Compare two UTF-8 strings, case-insensitively, up to a number of bytes.
  -- *
  -- * This will work with Unicode strings, using a technique called
  -- * "case-folding" to handle the vast majority of case-sensitive human
  -- * languages regardless of system locale. It can deal with expanding values: a
  -- * German Eszett character can compare against two ASCII 's' chars and be
  -- * considered a match, for example. A notable exception: it does not handle
  -- * the Turkish 'i' character; human language is complicated!
  -- *
  -- * Since this handles Unicode, it expects the string to be well-formed UTF-8
  -- * and not a null-terminated string of arbitrary bytes. Bytes that are not
  -- * valid UTF-8 are treated as Unicode character U+FFFD (REPLACEMENT
  -- * CHARACTER), which is to say two strings of random bits may turn out to
  -- * match if they convert to the same amount of replacement characters.
  -- *
  -- * Note that while this function is intended to be used with UTF-8, `maxlen`
  -- * specifies a _byte_ limit! If the limit lands in the middle of a multi-byte
  -- * UTF-8 sequence, it may convert a portion of the final character to one or
  -- * more Unicode character U+FFFD (REPLACEMENT CHARACTER) so as not to overflow
  -- * a buffer.
  -- *
  -- * `maxlen` specifies a maximum number of bytes to compare; if the strings
  -- * match to this number of bytes (or both have matched to a null-terminator
  -- * character before this number of bytes), they will be considered equal.
  -- *
  -- * \param str1 the first string to compare. NULL is not permitted!
  -- * \param str2 the second string to compare. NULL is not permitted!
  -- * \param maxlen the maximum number of bytes to compare.
  -- * \returns less than zero if str1 is "less than" str2, greater than zero if
  -- *          str1 is "greater than" str2, and zero if the strings match
  -- *          exactly.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strncasecmp
     (str1 : Interfaces.C.Strings.chars_ptr;
      str2 : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:3950
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strncasecmp";

  --*
  -- * Searches a string for the first occurrence of any character contained in a
  -- * breakset, and returns a pointer from the string to that character.
  -- *
  -- * \param str The null-terminated string to be searched. Must not be NULL, and
  -- *            must not overlap with `breakset`.
  -- * \param breakset A null-terminated string containing the list of characters
  -- *                 to look for. Must not be NULL, and must not overlap with
  -- *                 `str`.
  -- * \returns A pointer to the location, in str, of the first occurrence of a
  -- *          character present in the breakset, or NULL if none is found.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_strpbrk (str : Interfaces.C.Strings.chars_ptr; breakset : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:3968
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_strpbrk";

  --*
  -- * The Unicode REPLACEMENT CHARACTER codepoint.
  -- *
  -- * SDL_StepUTF8() and SDL_StepBackUTF8() report this codepoint when they
  -- * encounter a UTF-8 string with encoding errors.
  -- *
  -- * This tends to render as something like a question mark in most places.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_StepBackUTF8
  -- * \sa SDL_StepUTF8
  --  

  --*
  -- * Decode a UTF-8 string, one Unicode codepoint at a time.
  -- *
  -- * This will return the first Unicode codepoint in the UTF-8 encoded string in
  -- * `*pstr`, and then advance `*pstr` past any consumed bytes before returning.
  -- *
  -- * It will not access more than `*pslen` bytes from the string. `*pslen` will
  -- * be adjusted, as well, subtracting the number of bytes consumed.
  -- *
  -- * `pslen` is allowed to be NULL, in which case the string _must_ be
  -- * NULL-terminated, as the function will blindly read until it sees the NULL
  -- * char.
  -- *
  -- * if `*pslen` is zero, it assumes the end of string is reached and returns a
  -- * zero codepoint regardless of the contents of the string buffer.
  -- *
  -- * If the resulting codepoint is zero (a NULL terminator), or `*pslen` is
  -- * zero, it will not advance `*pstr` or `*pslen` at all.
  -- *
  -- * Generally this function is called in a loop until it returns zero,
  -- * adjusting its parameters each iteration.
  -- *
  -- * If an invalid UTF-8 sequence is encountered, this function returns
  -- * SDL_INVALID_UNICODE_CODEPOINT and advances the string/length by one byte
  -- * (which is to say, a multibyte sequence might produce several
  -- * SDL_INVALID_UNICODE_CODEPOINT returns before it syncs to the next valid
  -- * UTF-8 sequence).
  -- *
  -- * Several things can generate invalid UTF-8 sequences, including overlong
  -- * encodings, the use of UTF-16 surrogate values, and truncated data. Please
  -- * refer to
  -- * [RFC3629](https://www.ietf.org/rfc/rfc3629.txt)
  -- * for details.
  -- *
  -- * \param pstr a pointer to a UTF-8 string pointer to be read and adjusted.
  -- * \param pslen a pointer to the number of bytes in the string, to be read and
  -- *              adjusted. NULL is allowed.
  -- * \returns the first Unicode codepoint in the string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_StepUTF8 (pstr : System.Address; pslen : access stddef_h.size_t) return Uint32  -- /usr/local/include/SDL3/SDL_stdinc.h:4028
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StepUTF8";

  --*
  -- * Decode a UTF-8 string in reverse, one Unicode codepoint at a time.
  -- *
  -- * This will go to the start of the previous Unicode codepoint in the string,
  -- * move `*pstr` to that location and return that codepoint.
  -- *
  -- * If `*pstr` is already at the start of the string), it will not advance
  -- * `*pstr` at all.
  -- *
  -- * Generally this function is called in a loop until it returns zero,
  -- * adjusting its parameter each iteration.
  -- *
  -- * If an invalid UTF-8 sequence is encountered, this function returns
  -- * SDL_INVALID_UNICODE_CODEPOINT.
  -- *
  -- * Several things can generate invalid UTF-8 sequences, including overlong
  -- * encodings, the use of UTF-16 surrogate values, and truncated data. Please
  -- * refer to
  -- * [RFC3629](https://www.ietf.org/rfc/rfc3629.txt)
  -- * for details.
  -- *
  -- * \param start a pointer to the beginning of the UTF-8 string.
  -- * \param pstr a pointer to a UTF-8 string pointer to be read and adjusted.
  -- * \returns the previous Unicode codepoint in the string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_StepBackUTF8 (start : Interfaces.C.Strings.chars_ptr; pstr : System.Address) return Uint32  -- /usr/local/include/SDL3/SDL_stdinc.h:4059
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StepBackUTF8";

  --*
  -- * Convert a single Unicode codepoint to UTF-8.
  -- *
  -- * The buffer pointed to by `dst` must be at least 4 bytes long, as this
  -- * function may generate between 1 and 4 bytes of output.
  -- *
  -- * This function returns the first byte _after_ the newly-written UTF-8
  -- * sequence, which is useful for encoding multiple codepoints in a loop, or
  -- * knowing where to write a NULL-terminator character to end the string (in
  -- * either case, plan to have a buffer of _more_ than 4 bytes!).
  -- *
  -- * If `codepoint` is an invalid value (outside the Unicode range, or a UTF-16
  -- * surrogate value, etc), this will use U+FFFD (REPLACEMENT CHARACTER) for the
  -- * codepoint instead, and not set an error.
  -- *
  -- * If `dst` is NULL, this returns NULL immediately without writing to the
  -- * pointer and without setting an error.
  -- *
  -- * \param codepoint a Unicode codepoint to convert to UTF-8.
  -- * \param dst the location to write the encoded UTF-8. Must point to at least
  -- *            4 bytes!
  -- * \returns the first byte past the newly-written UTF-8 sequence.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_UCS4ToUTF8 (codepoint : Uint32; dst : Interfaces.C.Strings.chars_ptr) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:4088
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UCS4ToUTF8";

  --*
  -- * This works exactly like sscanf() but doesn't require access to a C runtime.
  -- *
  -- * Scan a string, matching a format string, converting each '%' item and
  -- * storing it to pointers provided through variable arguments.
  -- *
  -- * \param text the string to scan. Must not be NULL.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ... a list of pointers to values to be filled in with scanned items.
  -- * \returns the number of items that matched the format string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_sscanf (text : Interfaces.C.Strings.chars_ptr; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4105
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_sscanf";

  --*
  -- * This works exactly like vsscanf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Functions identically to SDL_sscanf(), except it takes a `va_list` instead
  -- * of using `...` variable arguments.
  -- *
  -- * \param text the string to scan. Must not be NULL.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ap a `va_list` of pointers to values to be filled in with scanned
  -- *           items.
  -- * \returns the number of items that matched the format string.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_vsscanf
     (text : Interfaces.C.Strings.chars_ptr;
      fmt : Interfaces.C.Strings.chars_ptr;
      ap : access System.Address) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4124
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_vsscanf";

  --*
  -- * This works exactly like snprintf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Format a string of up to `maxlen`-1 bytes, converting each '%' item with
  -- * values provided through variable arguments.
  -- *
  -- * While some C runtimes differ on how to deal with too-large strings, this
  -- * function null-terminates the output, by treating the null-terminator as
  -- * part of the `maxlen` count. Note that if `maxlen` is zero, however, no
  -- * bytes will be written at all.
  -- *
  -- * This function returns the number of _bytes_ (not _characters_) that should
  -- * be written, excluding the null-terminator character. If this returns a
  -- * number >= `maxlen`, it means the output string was truncated. A negative
  -- * return value means an error occurred.
  -- *
  -- * Referencing the output string's pointer with a format item is undefined
  -- * behavior.
  -- *
  -- * \param text the buffer to write the string into. Must not be NULL.
  -- * \param maxlen the maximum bytes to write, including the null-terminator.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ... a list of values to be used with the format string.
  -- * \returns the number of bytes that should be written, not counting the
  -- *          null-terminator char, or a negative value on error.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_snprintf
     (text : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4157
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_snprintf";

  --*
  -- * This works exactly like swprintf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Format a wide string of up to `maxlen`-1 wchar_t values, converting each
  -- * '%' item with values provided through variable arguments.
  -- *
  -- * While some C runtimes differ on how to deal with too-large strings, this
  -- * function null-terminates the output, by treating the null-terminator as
  -- * part of the `maxlen` count. Note that if `maxlen` is zero, however, no wide
  -- * characters will be written at all.
  -- *
  -- * This function returns the number of _wide characters_ (not _codepoints_)
  -- * that should be written, excluding the null-terminator character. If this
  -- * returns a number >= `maxlen`, it means the output string was truncated. A
  -- * negative return value means an error occurred.
  -- *
  -- * Referencing the output string's pointer with a format item is undefined
  -- * behavior.
  -- *
  -- * \param text the buffer to write the wide string into. Must not be NULL.
  -- * \param maxlen the maximum wchar_t values to write, including the
  -- *               null-terminator.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ... a list of values to be used with the format string.
  -- * \returns the number of wide characters that should be written, not counting
  -- *          the null-terminator char, or a negative value on error.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_swprintf
     (text : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t;
      fmt : access stddef_h.wchar_t  -- , ...
      ) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4191
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_swprintf";

  --*
  -- * This works exactly like vsnprintf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Functions identically to SDL_snprintf(), except it takes a `va_list`
  -- * instead of using `...` variable arguments.
  -- *
  -- * \param text the buffer to write the string into. Must not be NULL.
  -- * \param maxlen the maximum bytes to write, including the null-terminator.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ap a `va_list` values to be used with the format string.
  -- * \returns the number of bytes that should be written, not counting the
  -- *          null-terminator char, or a negative value on error.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_vsnprintf
     (text : Interfaces.C.Strings.chars_ptr;
      maxlen : stddef_h.size_t;
      fmt : Interfaces.C.Strings.chars_ptr;
      ap : access System.Address) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4211
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_vsnprintf";

  --*
  -- * This works exactly like vswprintf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Functions identically to SDL_swprintf(), except it takes a `va_list`
  -- * instead of using `...` variable arguments.
  -- *
  -- * \param text the buffer to write the string into. Must not be NULL.
  -- * \param maxlen the maximum wide characters to write, including the
  -- *               null-terminator.
  -- * \param fmt a printf-style format wide string. Must not be NULL.
  -- * \param ap a `va_list` values to be used with the format string.
  -- * \returns the number of wide characters that should be written, not counting
  -- *          the null-terminator char, or a negative value on error.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_vswprintf
     (text : access stddef_h.wchar_t;
      maxlen : stddef_h.size_t;
      fmt : access stddef_h.wchar_t;
      ap : access System.Address) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4232
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_vswprintf";

  --*
  -- * This works exactly like asprintf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Functions identically to SDL_snprintf(), except it allocates a buffer large
  -- * enough to hold the output string on behalf of the caller.
  -- *
  -- * On success, this function returns the number of bytes (not characters)
  -- * comprising the output string, not counting the null-terminator character,
  -- * and sets `*strp` to the newly-allocated string.
  -- *
  -- * On error, this function returns a negative number, and the value of `*strp`
  -- * is undefined.
  -- *
  -- * The returned string is owned by the caller, and should be passed to
  -- * SDL_free when no longer needed.
  -- *
  -- * \param strp on output, is set to the new string. Must not be NULL.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ... a list of values to be used with the format string.
  -- * \returns the number of bytes in the newly-allocated string, not counting
  -- *          the null-terminator char, or a negative value on error.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_asprintf (strp : System.Address; fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4261
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_asprintf";

  --*
  -- * This works exactly like vasprintf() but doesn't require access to a C
  -- * runtime.
  -- *
  -- * Functions identically to SDL_asprintf(), except it takes a `va_list`
  -- * instead of using `...` variable arguments.
  -- *
  -- * \param strp on output, is set to the new string. Must not be NULL.
  -- * \param fmt a printf-style format string. Must not be NULL.
  -- * \param ap a `va_list` values to be used with the format string.
  -- * \returns the number of bytes in the newly-allocated string, not counting
  -- *          the null-terminator char, or a negative value on error.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_vasprintf
     (strp : System.Address;
      fmt : Interfaces.C.Strings.chars_ptr;
      ap : access System.Address) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:4280
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_vasprintf";

  --*
  -- * Seeds the pseudo-random number generator.
  -- *
  -- * Reusing the seed number will cause SDL_rand() to repeat the same stream of
  -- * 'random' numbers.
  -- *
  -- * \param seed the value to use as a random number seed, or 0 to use
  -- *             SDL_GetPerformanceCounter().
  -- *
  -- * \threadsafety This should be called on the same thread that calls
  -- *               SDL_rand()
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_rand
  -- * \sa SDL_rand_bits
  -- * \sa SDL_randf
  --  

   procedure SDL_srand (seed : Uint64)  -- /usr/local/include/SDL3/SDL_stdinc.h:4300
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_srand";

  --*
  -- * Generate a pseudo-random number less than n for positive n
  -- *
  -- * The method used is faster and of better quality than `rand() % n`. Odds are
  -- * roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
  -- * much worse as n gets bigger.
  -- *
  -- * Example: to simulate a d6 use `SDL_rand(6) + 1` The +1 converts 0..5 to
  -- * 1..6
  -- *
  -- * If you want to generate a pseudo-random number in the full range of Sint32,
  -- * you should use: (Sint32)SDL_rand_bits()
  -- *
  -- * If you want reproducible output, be sure to initialize with SDL_srand()
  -- * first.
  -- *
  -- * There are no guarantees as to the quality of the random sequence produced,
  -- * and this should not be used for security (cryptography, passwords) or where
  -- * money is on the line (loot-boxes, casinos). There are many random number
  -- * libraries available with different characteristics and you should pick one
  -- * of those to meet any serious needs.
  -- *
  -- * \param n the number of possible outcomes. n must be positive.
  -- * \returns a random value in the range of [0 .. n-1].
  -- *
  -- * \threadsafety All calls should be made from a single thread
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_srand
  -- * \sa SDL_randf
  --  

   function SDL_rand (n : Sint32) return Sint32  -- /usr/local/include/SDL3/SDL_stdinc.h:4334
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_rand";

  --*
  -- * Generate a uniform pseudo-random floating point number less than 1.0
  -- *
  -- * If you want reproducible output, be sure to initialize with SDL_srand()
  -- * first.
  -- *
  -- * There are no guarantees as to the quality of the random sequence produced,
  -- * and this should not be used for security (cryptography, passwords) or where
  -- * money is on the line (loot-boxes, casinos). There are many random number
  -- * libraries available with different characteristics and you should pick one
  -- * of those to meet any serious needs.
  -- *
  -- * \returns a random value in the range of [0.0, 1.0).
  -- *
  -- * \threadsafety All calls should be made from a single thread
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_srand
  -- * \sa SDL_rand
  --  

   function SDL_randf return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4357
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_randf";

  --*
  -- * Generate 32 pseudo-random bits.
  -- *
  -- * You likely want to use SDL_rand() to get a psuedo-random number instead.
  -- *
  -- * There are no guarantees as to the quality of the random sequence produced,
  -- * and this should not be used for security (cryptography, passwords) or where
  -- * money is on the line (loot-boxes, casinos). There are many random number
  -- * libraries available with different characteristics and you should pick one
  -- * of those to meet any serious needs.
  -- *
  -- * \returns a random value in the range of [0-SDL_MAX_UINT32].
  -- *
  -- * \threadsafety All calls should be made from a single thread
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_rand
  -- * \sa SDL_randf
  -- * \sa SDL_srand
  --  

   function SDL_rand_bits return Uint32  -- /usr/local/include/SDL3/SDL_stdinc.h:4380
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_rand_bits";

  --*
  -- * Generate a pseudo-random number less than n for positive n
  -- *
  -- * The method used is faster and of better quality than `rand() % n`. Odds are
  -- * roughly 99.9% even for n = 1 million. Evenness is better for smaller n, and
  -- * much worse as n gets bigger.
  -- *
  -- * Example: to simulate a d6 use `SDL_rand_r(state, 6) + 1` The +1 converts
  -- * 0..5 to 1..6
  -- *
  -- * If you want to generate a pseudo-random number in the full range of Sint32,
  -- * you should use: (Sint32)SDL_rand_bits_r(state)
  -- *
  -- * There are no guarantees as to the quality of the random sequence produced,
  -- * and this should not be used for security (cryptography, passwords) or where
  -- * money is on the line (loot-boxes, casinos). There are many random number
  -- * libraries available with different characteristics and you should pick one
  -- * of those to meet any serious needs.
  -- *
  -- * \param state a pointer to the current random number state, this may not be
  -- *              NULL.
  -- * \param n the number of possible outcomes. n must be positive.
  -- * \returns a random value in the range of [0 .. n-1].
  -- *
  -- * \threadsafety This function is thread-safe, as long as the state pointer
  -- *               isn't shared between threads.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_rand
  -- * \sa SDL_rand_bits_r
  -- * \sa SDL_randf_r
  --  

   function SDL_rand_r (state : access Uint64; n : Sint32) return Sint32  -- /usr/local/include/SDL3/SDL_stdinc.h:4415
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_rand_r";

  --*
  -- * Generate a uniform pseudo-random floating point number less than 1.0
  -- *
  -- * If you want reproducible output, be sure to initialize with SDL_srand()
  -- * first.
  -- *
  -- * There are no guarantees as to the quality of the random sequence produced,
  -- * and this should not be used for security (cryptography, passwords) or where
  -- * money is on the line (loot-boxes, casinos). There are many random number
  -- * libraries available with different characteristics and you should pick one
  -- * of those to meet any serious needs.
  -- *
  -- * \param state a pointer to the current random number state, this may not be
  -- *              NULL.
  -- * \returns a random value in the range of [0.0, 1.0).
  -- *
  -- * \threadsafety This function is thread-safe, as long as the state pointer
  -- *               isn't shared between threads.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_rand_bits_r
  -- * \sa SDL_rand_r
  -- * \sa SDL_randf
  --  

   function SDL_randf_r (state : access Uint64) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4442
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_randf_r";

  --*
  -- * Generate 32 pseudo-random bits.
  -- *
  -- * You likely want to use SDL_rand_r() to get a psuedo-random number instead.
  -- *
  -- * There are no guarantees as to the quality of the random sequence produced,
  -- * and this should not be used for security (cryptography, passwords) or where
  -- * money is on the line (loot-boxes, casinos). There are many random number
  -- * libraries available with different characteristics and you should pick one
  -- * of those to meet any serious needs.
  -- *
  -- * \param state a pointer to the current random number state, this may not be
  -- *              NULL.
  -- * \returns a random value in the range of [0-SDL_MAX_UINT32].
  -- *
  -- * \threadsafety This function is thread-safe, as long as the state pointer
  -- *               isn't shared between threads.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_rand_r
  -- * \sa SDL_randf_r
  --  

   function SDL_rand_bits_r (state : access Uint64) return Uint32  -- /usr/local/include/SDL3/SDL_stdinc.h:4467
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_rand_bits_r";

  --*
  -- * The value of Pi, as a double-precision floating point literal.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PI_F
  --  

  --*
  -- * The value of Pi, as a single-precision floating point literal.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PI_D
  --  

  --*
  -- * Compute the arc cosine of `x`.
  -- *
  -- * The definition of `y = acos(x)` is `x = cos(y)`.
  -- *
  -- * Domain: `-1 <= x <= 1`
  -- *
  -- * Range: `0 <= y <= Pi`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_acosf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns arc cosine of `x`, in radians.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_acosf
  -- * \sa SDL_asin
  -- * \sa SDL_cos
  --  

   function SDL_acos (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4521
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_acos";

  --*
  -- * Compute the arc cosine of `x`.
  -- *
  -- * The definition of `y = acos(x)` is `x = cos(y)`.
  -- *
  -- * Domain: `-1 <= x <= 1`
  -- *
  -- * Range: `0 <= y <= Pi`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_acos for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns arc cosine of `x`, in radians.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_acos
  -- * \sa SDL_asinf
  -- * \sa SDL_cosf
  --  

   function SDL_acosf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4551
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_acosf";

  --*
  -- * Compute the arc sine of `x`.
  -- *
  -- * The definition of `y = asin(x)` is `x = sin(y)`.
  -- *
  -- * Domain: `-1 <= x <= 1`
  -- *
  -- * Range: `-Pi/2 <= y <= Pi/2`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_asinf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns arc sine of `x`, in radians.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_asinf
  -- * \sa SDL_acos
  -- * \sa SDL_sin
  --  

   function SDL_asin (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4581
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_asin";

  --*
  -- * Compute the arc sine of `x`.
  -- *
  -- * The definition of `y = asin(x)` is `x = sin(y)`.
  -- *
  -- * Domain: `-1 <= x <= 1`
  -- *
  -- * Range: `-Pi/2 <= y <= Pi/2`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_asin for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns arc sine of `x`, in radians.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_asin
  -- * \sa SDL_acosf
  -- * \sa SDL_sinf
  --  

   function SDL_asinf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4611
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_asinf";

  --*
  -- * Compute the arc tangent of `x`.
  -- *
  -- * The definition of `y = atan(x)` is `x = tan(y)`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-Pi/2 <= y <= Pi/2`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_atanf for single-precision floats.
  -- *
  -- * To calculate the arc tangent of y / x, use SDL_atan2.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns arc tangent of of `x` in radians, or 0 if `x = 0`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atanf
  -- * \sa SDL_atan2
  -- * \sa SDL_tan
  --  

   function SDL_atan (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4643
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_atan";

  --*
  -- * Compute the arc tangent of `x`.
  -- *
  -- * The definition of `y = atan(x)` is `x = tan(y)`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-Pi/2 <= y <= Pi/2`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_atan for dboule-precision floats.
  -- *
  -- * To calculate the arc tangent of y / x, use SDL_atan2f.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns arc tangent of of `x` in radians, or 0 if `x = 0`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atan
  -- * \sa SDL_atan2f
  -- * \sa SDL_tanf
  --  

   function SDL_atanf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4675
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_atanf";

  --*
  -- * Compute the arc tangent of `y / x`, using the signs of x and y to adjust
  -- * the result's quadrant.
  -- *
  -- * The definition of `z = atan2(x, y)` is `y = x tan(z)`, where the quadrant
  -- * of z is determined based on the signs of x and y.
  -- *
  -- * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
  -- *
  -- * Range: `-Pi <= y <= Pi`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_atan2f for single-precision floats.
  -- *
  -- * To calculate the arc tangent of a single value, use SDL_atan.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param y floating point value of the numerator (y coordinate).
  -- * \param x floating point value of the denominator (x coordinate).
  -- * \returns arc tangent of of `y / x` in radians, or, if `x = 0`, either
  -- *          `-Pi/2`, `0`, or `Pi/2`, depending on the value of `y`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atan2f
  -- * \sa SDL_atan
  -- * \sa SDL_tan
  --  

   function SDL_atan2 (y : double; x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4711
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_atan2";

  --*
  -- * Compute the arc tangent of `y / x`, using the signs of x and y to adjust
  -- * the result's quadrant.
  -- *
  -- * The definition of `z = atan2(x, y)` is `y = x tan(z)`, where the quadrant
  -- * of z is determined based on the signs of x and y.
  -- *
  -- * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
  -- *
  -- * Range: `-Pi <= y <= Pi`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_atan2 for double-precision floats.
  -- *
  -- * To calculate the arc tangent of a single value, use SDL_atanf.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param y floating point value of the numerator (y coordinate).
  -- * \param x floating point value of the denominator (x coordinate).
  -- * \returns arc tangent of of `y / x` in radians, or, if `x = 0`, either
  -- *          `-Pi/2`, `0`, or `Pi/2`, depending on the value of `y`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_atan2
  -- * \sa SDL_atan
  -- * \sa SDL_tan
  --  

   function SDL_atan2f (y : float; x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4747
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_atan2f";

  --*
  -- * Compute the ceiling of `x`.
  -- *
  -- * The ceiling of `x` is the smallest integer `y` such that `y >= x`, i.e `x`
  -- * rounded up to the nearest integer.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_ceilf for single-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \returns the ceiling of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ceilf
  -- * \sa SDL_floor
  -- * \sa SDL_trunc
  -- * \sa SDL_round
  -- * \sa SDL_lround
  --  

   function SDL_ceil (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4775
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ceil";

  --*
  -- * Compute the ceiling of `x`.
  -- *
  -- * The ceiling of `x` is the smallest integer `y` such that `y >= x`, i.e `x`
  -- * rounded up to the nearest integer.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_ceil for double-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \returns the ceiling of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ceil
  -- * \sa SDL_floorf
  -- * \sa SDL_truncf
  -- * \sa SDL_roundf
  -- * \sa SDL_lroundf
  --  

   function SDL_ceilf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4803
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ceilf";

  --*
  -- * Copy the sign of one floating-point value to another.
  -- *
  -- * The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.
  -- *
  -- * Domain: `-INF <= x <= INF`, ``-INF <= y <= f``
  -- *
  -- * Range: `-INF <= z <= INF`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_copysignf for single-precision floats.
  -- *
  -- * \param x floating point value to use as the magnitude.
  -- * \param y floating point value to use as the sign.
  -- * \returns the floating point value with the sign of y and the magnitude of
  -- *          x.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_copysignf
  -- * \sa SDL_fabs
  --  

   function SDL_copysign (x : double; y : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4829
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_copysign";

  --*
  -- * Copy the sign of one floating-point value to another.
  -- *
  -- * The definition of copysign is that ``copysign(x, y) = abs(x) * sign(y)``.
  -- *
  -- * Domain: `-INF <= x <= INF`, ``-INF <= y <= f``
  -- *
  -- * Range: `-INF <= z <= INF`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_copysign for double-precision floats.
  -- *
  -- * \param x floating point value to use as the magnitude.
  -- * \param y floating point value to use as the sign.
  -- * \returns the floating point value with the sign of y and the magnitude of
  -- *          x.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_copysign
  -- * \sa SDL_fabsf
  --  

   function SDL_copysignf (x : float; y : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4855
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_copysignf";

  --*
  -- * Compute the cosine of `x`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-1 <= y <= 1`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_cosf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value, in radians.
  -- * \returns cosine of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_cosf
  -- * \sa SDL_acos
  -- * \sa SDL_sin
  --  

   function SDL_cos (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4883
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_cos";

  --*
  -- * Compute the cosine of `x`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-1 <= y <= 1`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_cos for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value, in radians.
  -- * \returns cosine of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_cos
  -- * \sa SDL_acosf
  -- * \sa SDL_sinf
  --  

   function SDL_cosf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4911
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_cosf";

  --*
  -- * Compute the exponential of `x`.
  -- *
  -- * The definition of `y = exp(x)` is `y = e^x`, where `e` is the base of the
  -- * natural logarithm. The inverse is the natural logarithm, SDL_log.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `0 <= y <= INF`
  -- *
  -- * The output will overflow if `exp(x)` is too large to be represented.
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_expf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns value of `e^x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_expf
  -- * \sa SDL_log
  --  

   function SDL_exp (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4943
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_exp";

  --*
  -- * Compute the exponential of `x`.
  -- *
  -- * The definition of `y = exp(x)` is `y = e^x`, where `e` is the base of the
  -- * natural logarithm. The inverse is the natural logarithm, SDL_logf.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `0 <= y <= INF`
  -- *
  -- * The output will overflow if `exp(x)` is too large to be represented.
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_exp for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value.
  -- * \returns value of `e^x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_exp
  -- * \sa SDL_logf
  --  

   function SDL_expf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:4975
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_expf";

  --*
  -- * Compute the absolute value of `x`
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `0 <= y <= INF`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_fabsf for single-precision floats.
  -- *
  -- * \param x floating point value to use as the magnitude.
  -- * \returns the absolute value of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_fabsf
  --  

   function SDL_fabs (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:4996
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_fabs";

  --*
  -- * Compute the absolute value of `x`
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `0 <= y <= INF`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_fabs for double-precision floats.
  -- *
  -- * \param x floating point value to use as the magnitude.
  -- * \returns the absolute value of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_fabs
  --  

   function SDL_fabsf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5017
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_fabsf";

  --*
  -- * Compute the floor of `x`.
  -- *
  -- * The floor of `x` is the largest integer `y` such that `y <= x`, i.e `x`
  -- * rounded down to the nearest integer.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_floorf for single-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \returns the floor of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_floorf
  -- * \sa SDL_ceil
  -- * \sa SDL_trunc
  -- * \sa SDL_round
  -- * \sa SDL_lround
  --  

   function SDL_floor (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5045
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_floor";

  --*
  -- * Compute the floor of `x`.
  -- *
  -- * The floor of `x` is the largest integer `y` such that `y <= x`, i.e `x`
  -- * rounded down to the nearest integer.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_floor for double-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \returns the floor of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_floor
  -- * \sa SDL_ceilf
  -- * \sa SDL_truncf
  -- * \sa SDL_roundf
  -- * \sa SDL_lroundf
  --  

   function SDL_floorf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5073
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_floorf";

  --*
  -- * Truncate `x` to an integer.
  -- *
  -- * Rounds `x` to the next closest integer to 0. This is equivalent to removing
  -- * the fractional part of `x`, leaving only the integer part.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_truncf for single-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \returns `x` truncated to an integer.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_truncf
  -- * \sa SDL_fmod
  -- * \sa SDL_ceil
  -- * \sa SDL_floor
  -- * \sa SDL_round
  -- * \sa SDL_lround
  --  

   function SDL_trunc (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5102
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_trunc";

  --*
  -- * Truncate `x` to an integer.
  -- *
  -- * Rounds `x` to the next closest integer to 0. This is equivalent to removing
  -- * the fractional part of `x`, leaving only the integer part.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_trunc for double-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \returns `x` truncated to an integer.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_trunc
  -- * \sa SDL_fmodf
  -- * \sa SDL_ceilf
  -- * \sa SDL_floorf
  -- * \sa SDL_roundf
  -- * \sa SDL_lroundf
  --  

   function SDL_truncf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5131
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_truncf";

  --*
  -- * Return the floating-point remainder of `x / y`
  -- *
  -- * Divides `x` by `y`, and returns the remainder.
  -- *
  -- * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`, `y != 0`
  -- *
  -- * Range: `-y <= z <= y`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_fmodf for single-precision floats.
  -- *
  -- * \param x the numerator.
  -- * \param y the denominator. Must not be 0.
  -- * \returns the remainder of `x / y`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_fmodf
  -- * \sa SDL_modf
  -- * \sa SDL_trunc
  -- * \sa SDL_ceil
  -- * \sa SDL_floor
  -- * \sa SDL_round
  -- * \sa SDL_lround
  --  

   function SDL_fmod (x : double; y : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5161
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_fmod";

  --*
  -- * Return the floating-point remainder of `x / y`
  -- *
  -- * Divides `x` by `y`, and returns the remainder.
  -- *
  -- * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`, `y != 0`
  -- *
  -- * Range: `-y <= z <= y`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_fmod for double-precision floats.
  -- *
  -- * \param x the numerator.
  -- * \param y the denominator. Must not be 0.
  -- * \returns the remainder of `x / y`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_fmod
  -- * \sa SDL_truncf
  -- * \sa SDL_modff
  -- * \sa SDL_ceilf
  -- * \sa SDL_floorf
  -- * \sa SDL_roundf
  -- * \sa SDL_lroundf
  --  

   function SDL_fmodf (x : float; y : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5191
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_fmodf";

  --*
  -- * Return whether the value is infinity.
  -- *
  -- * \param x double-precision floating point value.
  -- * \returns non-zero if the value is infinity, 0 otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_isinff
  --  

   function SDL_isinf (x : double) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:5205
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isinf";

  --*
  -- * Return whether the value is infinity.
  -- *
  -- * \param x floating point value.
  -- * \returns non-zero if the value is infinity, 0 otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_isinf
  --  

   function SDL_isinff (x : float) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:5219
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isinff";

  --*
  -- * Return whether the value is NaN.
  -- *
  -- * \param x double-precision floating point value.
  -- * \returns non-zero if the value is NaN, 0 otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_isnanf
  --  

   function SDL_isnan (x : double) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:5233
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isnan";

  --*
  -- * Return whether the value is NaN.
  -- *
  -- * \param x floating point value.
  -- * \returns non-zero if the value is NaN, 0 otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_isnan
  --  

   function SDL_isnanf (x : float) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:5247
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_isnanf";

  --*
  -- * Compute the natural logarithm of `x`.
  -- *
  -- * Domain: `0 < x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * It is an error for `x` to be less than or equal to 0.
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_logf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value. Must be greater than 0.
  -- * \returns the natural logarithm of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_logf
  -- * \sa SDL_log10
  -- * \sa SDL_exp
  --  

   function SDL_log (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5277
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_log";

  --*
  -- * Compute the natural logarithm of `x`.
  -- *
  -- * Domain: `0 < x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * It is an error for `x` to be less than or equal to 0.
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_log for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value. Must be greater than 0.
  -- * \returns the natural logarithm of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_log
  -- * \sa SDL_expf
  --  

   function SDL_logf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5306
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_logf";

  --*
  -- * Compute the base-10 logarithm of `x`.
  -- *
  -- * Domain: `0 < x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * It is an error for `x` to be less than or equal to 0.
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_log10f for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value. Must be greater than 0.
  -- * \returns the logarithm of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_log10f
  -- * \sa SDL_log
  -- * \sa SDL_pow
  --  

   function SDL_log10 (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5336
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_log10";

  --*
  -- * Compute the base-10 logarithm of `x`.
  -- *
  -- * Domain: `0 < x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * It is an error for `x` to be less than or equal to 0.
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_log10 for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value. Must be greater than 0.
  -- * \returns the logarithm of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_log10
  -- * \sa SDL_logf
  -- * \sa SDL_powf
  --  

   function SDL_log10f (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5366
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_log10f";

  --*
  -- * Split `x` into integer and fractional parts
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_modff for single-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \param y output pointer to store the integer part of `x`.
  -- * \returns the fractional part of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_modff
  -- * \sa SDL_trunc
  -- * \sa SDL_fmod
  --  

   function SDL_modf (x : double; y : access double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5386
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_modf";

  --*
  -- * Split `x` into integer and fractional parts
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_modf for double-precision floats.
  -- *
  -- * \param x floating point value.
  -- * \param y output pointer to store the integer part of `x`.
  -- * \returns the fractional part of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_modf
  -- * \sa SDL_truncf
  -- * \sa SDL_fmodf
  --  

   function SDL_modff (x : float; y : access float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5406
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_modff";

  --*
  -- * Raise `x` to the power `y`
  -- *
  -- * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
  -- *
  -- * Range: `-INF <= z <= INF`
  -- *
  -- * If `y` is the base of the natural logarithm (e), consider using SDL_exp
  -- * instead.
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_powf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x the base.
  -- * \param y the exponent.
  -- * \returns `x` raised to the power `y`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_powf
  -- * \sa SDL_exp
  -- * \sa SDL_log
  --  

   function SDL_pow (x : double; y : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5438
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_pow";

  --*
  -- * Raise `x` to the power `y`
  -- *
  -- * Domain: `-INF <= x <= INF`, `-INF <= y <= INF`
  -- *
  -- * Range: `-INF <= z <= INF`
  -- *
  -- * If `y` is the base of the natural logarithm (e), consider using SDL_exp
  -- * instead.
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_pow for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x the base.
  -- * \param y the exponent.
  -- * \returns `x` raised to the power `y`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_pow
  -- * \sa SDL_expf
  -- * \sa SDL_logf
  --  

   function SDL_powf (x : float; y : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5470
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_powf";

  --*
  -- * Round `x` to the nearest integer.
  -- *
  -- * Rounds `x` to the nearest integer. Values halfway between integers will be
  -- * rounded away from zero.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_roundf for single-precision floats. To get the result as an integer
  -- * type, use SDL_lround.
  -- *
  -- * \param x floating point value.
  -- * \returns the nearest integer to `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_roundf
  -- * \sa SDL_lround
  -- * \sa SDL_floor
  -- * \sa SDL_ceil
  -- * \sa SDL_trunc
  --  

   function SDL_round (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5499
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_round";

  --*
  -- * Round `x` to the nearest integer.
  -- *
  -- * Rounds `x` to the nearest integer. Values halfway between integers will be
  -- * rounded away from zero.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`, y integer
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_round for double-precision floats. To get the result as an integer
  -- * type, use SDL_lroundf.
  -- *
  -- * \param x floating point value.
  -- * \returns the nearest integer to `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_round
  -- * \sa SDL_lroundf
  -- * \sa SDL_floorf
  -- * \sa SDL_ceilf
  -- * \sa SDL_truncf
  --  

   function SDL_roundf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5528
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_roundf";

  --*
  -- * Round `x` to the nearest integer representable as a long
  -- *
  -- * Rounds `x` to the nearest integer. Values halfway between integers will be
  -- * rounded away from zero.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `MIN_LONG <= y <= MAX_LONG`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_lroundf for single-precision floats. To get the result as a
  -- * floating-point type, use SDL_round.
  -- *
  -- * \param x floating point value.
  -- * \returns the nearest integer to `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_lroundf
  -- * \sa SDL_round
  -- * \sa SDL_floor
  -- * \sa SDL_ceil
  -- * \sa SDL_trunc
  --  

   function SDL_lround (x : double) return long  -- /usr/local/include/SDL3/SDL_stdinc.h:5557
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_lround";

  --*
  -- * Round `x` to the nearest integer representable as a long
  -- *
  -- * Rounds `x` to the nearest integer. Values halfway between integers will be
  -- * rounded away from zero.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `MIN_LONG <= y <= MAX_LONG`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_lround for double-precision floats. To get the result as a
  -- * floating-point type, use SDL_roundf.
  -- *
  -- * \param x floating point value.
  -- * \returns the nearest integer to `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_lround
  -- * \sa SDL_roundf
  -- * \sa SDL_floorf
  -- * \sa SDL_ceilf
  -- * \sa SDL_truncf
  --  

   function SDL_lroundf (x : float) return long  -- /usr/local/include/SDL3/SDL_stdinc.h:5586
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_lroundf";

  --*
  -- * Scale `x` by an integer power of two.
  -- *
  -- * Multiplies `x` by the `n`th power of the floating point radix (always 2).
  -- *
  -- * Domain: `-INF <= x <= INF`, `n` integer
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_scalbnf for single-precision floats.
  -- *
  -- * \param x floating point value to be scaled.
  -- * \param n integer exponent.
  -- * \returns `x * 2^n`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_scalbnf
  -- * \sa SDL_pow
  --  

   function SDL_scalbn (x : double; n : int) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5611
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_scalbn";

  --*
  -- * Scale `x` by an integer power of two.
  -- *
  -- * Multiplies `x` by the `n`th power of the floating point radix (always 2).
  -- *
  -- * Domain: `-INF <= x <= INF`, `n` integer
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_scalbn for double-precision floats.
  -- *
  -- * \param x floating point value to be scaled.
  -- * \param n integer exponent.
  -- * \returns `x * 2^n`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_scalbn
  -- * \sa SDL_powf
  --  

   function SDL_scalbnf (x : float; n : int) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5636
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_scalbnf";

  --*
  -- * Compute the sine of `x`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-1 <= y <= 1`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_sinf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value, in radians.
  -- * \returns sine of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_sinf
  -- * \sa SDL_asin
  -- * \sa SDL_cos
  --  

   function SDL_sin (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5664
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_sin";

  --*
  -- * Compute the sine of `x`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-1 <= y <= 1`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_sin for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value, in radians.
  -- * \returns sine of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_sin
  -- * \sa SDL_asinf
  -- * \sa SDL_cosf
  --  

   function SDL_sinf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5692
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_sinf";

  --*
  -- * Compute the square root of `x`.
  -- *
  -- * Domain: `0 <= x <= INF`
  -- *
  -- * Range: `0 <= y <= INF`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_sqrtf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value. Must be greater than or equal to 0.
  -- * \returns square root of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_sqrtf
  --  

   function SDL_sqrt (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5718
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_sqrt";

  --*
  -- * Compute the square root of `x`.
  -- *
  -- * Domain: `0 <= x <= INF`
  -- *
  -- * Range: `0 <= y <= INF`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_sqrt for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value. Must be greater than or equal to 0.
  -- * \returns square root of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_sqrt
  --  

   function SDL_sqrtf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5744
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_sqrtf";

  --*
  -- * Compute the tangent of `x`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * This function operates on double-precision floating point values, use
  -- * SDL_tanf for single-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value, in radians.
  -- * \returns tangent of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_tanf
  -- * \sa SDL_sin
  -- * \sa SDL_cos
  -- * \sa SDL_atan
  -- * \sa SDL_atan2
  --  

   function SDL_tan (x : double) return double  -- /usr/local/include/SDL3/SDL_stdinc.h:5774
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_tan";

  --*
  -- * Compute the tangent of `x`.
  -- *
  -- * Domain: `-INF <= x <= INF`
  -- *
  -- * Range: `-INF <= y <= INF`
  -- *
  -- * This function operates on single-precision floating point values, use
  -- * SDL_tan for double-precision floats.
  -- *
  -- * This function may use a different approximation across different versions,
  -- * platforms and configurations. i.e, it can return a different value given
  -- * the same input on different machines or operating systems, or if SDL is
  -- * updated.
  -- *
  -- * \param x floating point value, in radians.
  -- * \returns tangent of `x`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_tan
  -- * \sa SDL_sinf
  -- * \sa SDL_cosf
  -- * \sa SDL_atanf
  -- * \sa SDL_atan2f
  --  

   function SDL_tanf (x : float) return float  -- /usr/local/include/SDL3/SDL_stdinc.h:5804
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_tanf";

  --*
  -- * An opaque handle representing string encoding conversion state.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_iconv_open
  --  

   type SDL_iconv_data_t is null record;   -- incomplete struct

   type SDL_iconv_t is access all SDL_iconv_data_t;  -- /usr/local/include/SDL3/SDL_stdinc.h:5813

  --*
  -- * This function allocates a context for the specified character set
  -- * conversion.
  -- *
  -- * \param tocode The target character encoding, must not be NULL.
  -- * \param fromcode The source character encoding, must not be NULL.
  -- * \returns a handle that must be freed with SDL_iconv_close, or
  -- *          SDL_ICONV_ERROR on failure.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_iconv
  -- * \sa SDL_iconv_close
  -- * \sa SDL_iconv_string
  --  

   function SDL_iconv_open (tocode : Interfaces.C.Strings.chars_ptr; fromcode : Interfaces.C.Strings.chars_ptr) return SDL_iconv_t  -- /usr/local/include/SDL3/SDL_stdinc.h:5830
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_iconv_open";

  --*
  -- * This function frees a context used for character set conversion.
  -- *
  -- * \param cd The character set conversion handle.
  -- * \returns 0 on success, or -1 on failure.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_iconv
  -- * \sa SDL_iconv_open
  -- * \sa SDL_iconv_string
  --  

   function SDL_iconv_close (cd : SDL_iconv_t) return int  -- /usr/local/include/SDL3/SDL_stdinc.h:5845
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_iconv_close";

  --*
  -- * This function converts text between encodings, reading from and writing to
  -- * a buffer.
  -- *
  -- * It returns the number of successful conversions on success. On error,
  -- * SDL_ICONV_E2BIG is returned when the output buffer is too small, or
  -- * SDL_ICONV_EILSEQ is returned when an invalid input sequence is encountered,
  -- * or SDL_ICONV_EINVAL is returned when an incomplete input sequence is
  -- * encountered.
  -- *
  -- * On exit:
  -- *
  -- * - inbuf will point to the beginning of the next multibyte sequence. On
  -- *   error, this is the location of the problematic input sequence. On
  -- *   success, this is the end of the input sequence.
  -- * - inbytesleft will be set to the number of bytes left to convert, which
  -- *   will be 0 on success.
  -- * - outbuf will point to the location where to store the next output byte.
  -- * - outbytesleft will be set to the number of bytes left in the output
  -- *   buffer.
  -- *
  -- * \param cd The character set conversion context, created in
  -- *           SDL_iconv_open().
  -- * \param inbuf Address of variable that points to the first character of the
  -- *              input sequence.
  -- * \param inbytesleft The number of bytes in the input buffer.
  -- * \param outbuf Address of variable that points to the output buffer.
  -- * \param outbytesleft The number of bytes in the output buffer.
  -- * \returns the number of conversions on success, or a negative error code.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_iconv_open
  -- * \sa SDL_iconv_close
  -- * \sa SDL_iconv_string
  --  

   function SDL_iconv
     (cd : SDL_iconv_t;
      inbuf : System.Address;
      inbytesleft : access stddef_h.size_t;
      outbuf : System.Address;
      outbytesleft : access stddef_h.size_t) return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_stdinc.h:5883
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_iconv";

  --*
  -- * Helper function to convert a string's encoding in one call.
  -- *
  -- * This function converts a buffer or string between encodings in one pass.
  -- *
  -- * The string does not need to be NULL-terminated; this function operates on
  -- * the number of bytes specified in `inbytesleft` whether there is a NULL
  -- * character anywhere in the buffer.
  -- *
  -- * The returned string is owned by the caller, and should be passed to
  -- * SDL_free when no longer needed.
  -- *
  -- * \param tocode the character encoding of the output string. Examples are
  -- *               "UTF-8", "UCS-4", etc.
  -- * \param fromcode the character encoding of data in `inbuf`.
  -- * \param inbuf the string to convert to a different encoding.
  -- * \param inbytesleft the size of the input string _in bytes_.
  -- * \returns a new string, converted to the new encoding, or NULL on error.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_iconv_open
  -- * \sa SDL_iconv_close
  -- * \sa SDL_iconv
  --  

   function SDL_iconv_string
     (tocode : Interfaces.C.Strings.chars_ptr;
      fromcode : Interfaces.C.Strings.chars_ptr;
      inbuf : Interfaces.C.Strings.chars_ptr;
      inbytesleft : stddef_h.size_t) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_stdinc.h:5918
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_iconv_string";

  -- Some helper macros for common SDL_iconv_string cases...  
  --*
  -- * Convert a UTF-8 string to the current locale's character encoding.
  -- *
  -- * This is a helper macro that might be more clear than calling
  -- * SDL_iconv_string directly. However, it double-evaluates its parameter, so
  -- * do not use an expression with side-effects here.
  -- *
  -- * \param S the string to convert.
  -- * \returns a new string, converted to the new encoding, or NULL on error.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert a UTF-8 string to UCS-2.
  -- *
  -- * This is a helper macro that might be more clear than calling
  -- * SDL_iconv_string directly. However, it double-evaluates its parameter, so
  -- * do not use an expression with side-effects here.
  -- *
  -- * \param S the string to convert.
  -- * \returns a new string, converted to the new encoding, or NULL on error.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert a UTF-8 string to UCS-4.
  -- *
  -- * This is a helper macro that might be more clear than calling
  -- * SDL_iconv_string directly. However, it double-evaluates its parameter, so
  -- * do not use an expression with side-effects here.
  -- *
  -- * \param S the string to convert.
  -- * \returns a new string, converted to the new encoding, or NULL on error.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert a wchar_t string to UTF-8.
  -- *
  -- * This is a helper macro that might be more clear than calling
  -- * SDL_iconv_string directly. However, it double-evaluates its parameter, so
  -- * do not use an expression with side-effects here.
  -- *
  -- * \param S the string to convert.
  -- * \returns a new string, converted to the new encoding, or NULL on error.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- force builds using Clang's static analysis tools to use literal C runtime
  --   here, since there are possibly tests that are ineffective otherwise.  

  -- The analyzer knows about strlcpy even when the system doesn't provide it  
  -- The analyzer knows about strlcat even when the system doesn't provide it  
  -- strdup is not ANSI but POSIX, and its prototype might be hidden...  
  -- not for windows: might conflict with string.h where strdup may have
  -- * dllimport attribute: https://github.com/libsdl-org/SDL/issues/12948  

  -- Starting LLVM 16, the analyser errors out if these functions do not have
  --   their prototype defined (clang-diagnostic-implicit-function-declaration)  

  --*
  -- * Multiply two integers, checking for overflow.
  -- *
  -- * If `a * b` would overflow, return false.
  -- *
  -- * Otherwise store `a * b` via ret and return true.
  -- *
  -- * \param a the multiplicand.
  -- * \param b the multiplier.
  -- * \param ret on non-overflow output, stores the multiplication result, may
  -- *            not be NULL.
  -- * \returns false on overflow, true if result is multiplied without overflow.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_size_mul_check_overflow
     (a : stddef_h.size_t;
      b : stddef_h.size_t;
      ret : access stddef_h.size_t) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:6077
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_size_mul_check_overflow";

  -- This needs to be wrapped in an inline rather than being a direct #define,
  -- * because __builtin_mul_overflow() is type-generic, but we want to be
  -- * consistent about interpreting a and b as size_t.  

   function SDL_size_mul_check_overflow_builtin
     (a : stddef_h.size_t;
      b : stddef_h.size_t;
      ret : access stddef_h.size_t) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:6091
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_size_mul_check_overflow_builtin";

  --*
  -- * Add two integers, checking for overflow.
  -- *
  -- * If `a + b` would overflow, return false.
  -- *
  -- * Otherwise store `a + b` via ret and return true.
  -- *
  -- * \param a the first addend.
  -- * \param b the second addend.
  -- * \param ret on non-overflow output, stores the addition result, may not be
  -- *            NULL.
  -- * \returns false on overflow, true if result is added without overflow.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_size_add_check_overflow
     (a : stddef_h.size_t;
      b : stddef_h.size_t;
      ret : access stddef_h.size_t) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:6116
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_size_add_check_overflow";

  -- This needs to be wrapped in an inline rather than being a direct #define,
  -- * the same as the call to __builtin_mul_overflow() above.  

   function SDL_size_add_check_overflow_builtin
     (a : stddef_h.size_t;
      b : stddef_h.size_t;
      ret : access stddef_h.size_t) return Extensions.bool  -- /usr/local/include/SDL3/SDL_stdinc.h:6129
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_size_add_check_overflow_builtin";

  -- This is a generic function pointer which should be cast to the type you expect  
  --*
  -- * A generic function pointer.
  -- *
  -- * In theory, generic function pointers should use this, instead of `void *`,
  -- * since some platforms could treat code addresses differently than data
  -- * addresses. Although in current times no popular platforms make this
  -- * distinction, it is more correct and portable to use the correct type for a
  -- * generic pointer.
  -- *
  -- * If for some reason you need to force this typedef to be an actual `void *`,
  -- * perhaps to work around a compiler or existing code, you can define
  -- * `SDL_FUNCTION_POINTER_IS_VOID_POINTER` before including any SDL headers.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   type SDL_FunctionPointer is access procedure
   with Convention => C;  -- /usr/local/include/SDL3/SDL_stdinc.h:6159

  -- Ends C function definitions when using C++  
end SDL3_SDL_stdinc_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
