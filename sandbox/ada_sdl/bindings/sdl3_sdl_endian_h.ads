pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package SDL3_SDL_endian_h is

   SDL_LIL_ENDIAN : constant := 1234;  --  /usr/local/include/SDL3/SDL_endian.h:86

   SDL_BIG_ENDIAN : constant := 4321;  --  /usr/local/include/SDL3/SDL_endian.h:105
   --  unsupported macro: SDL_BYTEORDER __BYTE_ORDER
   --  unsupported macro: SDL_FLOATWORDORDER SDL_LIL_ENDIAN
   --  arg-macro: procedure SDL_Swap16 (x)
   --    __builtin_bswap16(x)
   --  arg-macro: procedure SDL_Swap32 (x)
   --    __builtin_bswap32(x)
   --  arg-macro: procedure SDL_Swap64 (x)
   --    __builtin_bswap64(x)
   --  arg-macro: function SDL_Swap16LE (x)
   --    return x;
   --  arg-macro: function SDL_Swap32LE (x)
   --    return x;
   --  arg-macro: function SDL_Swap64LE (x)
   --    return x;
   --  arg-macro: function SDL_SwapFloatLE (x)
   --    return x;
   --  arg-macro: procedure SDL_Swap16BE (x)
   --    SDL_Swap16(x)
   --  arg-macro: procedure SDL_Swap32BE (x)
   --    SDL_Swap32(x)
   --  arg-macro: procedure SDL_Swap64BE (x)
   --    SDL_Swap64(x)
   --  arg-macro: procedure SDL_SwapFloatBE (x)
   --    SDL_SwapFloat(x)

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
  -- * # CategoryEndian
  -- *
  -- * Functions converting endian-specific values to different byte orders.
  -- *
  -- * These functions either unconditionally swap byte order (SDL_Swap16,
  -- * SDL_Swap32, SDL_Swap64, SDL_SwapFloat), or they swap to/from the system's
  -- * native byte order (SDL_Swap16LE, SDL_Swap16BE, SDL_Swap32LE, SDL_Swap32BE,
  -- * SDL_Swap32LE, SDL_Swap32BE, SDL_SwapFloatLE, SDL_SwapFloatBE). In the
  -- * latter case, the functionality is provided by macros that become no-ops if
  -- * a swap isn't necessary: on an x86 (littleendian) processor, SDL_Swap32LE
  -- * does nothing, but SDL_Swap32BE reverses the bytes of the data. On a PowerPC
  -- * processor (bigendian), the macros behavior is reversed.
  -- *
  -- * The swap routines are inline functions, and attempt to use compiler
  -- * intrinsics, inline assembly, and other magic to make byteswapping
  -- * efficient.
  --  

  -- As of Clang 11, '_m_prefetchw' is conflicting with the winnt.h's version,
  --   so we define the needed '_m_prefetch' here as a pseudo-header, until the issue is fixed.  

  -- _MM_HINT_T0  
  --*
  -- *  \name The two types of endianness
  --  

  -- @{  
  --*
  -- * A value to represent littleendian byteorder.
  -- *
  -- * This is used with the preprocessor macro SDL_BYTEORDER, to determine a
  -- * platform's byte ordering:
  -- *
  -- * ```c
  -- * #if SDL_BYTEORDER == SDL_LIL_ENDIAN
  -- * SDL_Log("This system is littleendian.");
  -- * #endif
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BYTEORDER
  -- * \sa SDL_BIG_ENDIAN
  --  

  --*
  -- * A value to represent bigendian byteorder.
  -- *
  -- * This is used with the preprocessor macro SDL_BYTEORDER, to determine a
  -- * platform's byte ordering:
  -- *
  -- * ```c
  -- * #if SDL_BYTEORDER == SDL_BIG_ENDIAN
  -- * SDL_Log("This system is bigendian.");
  -- * #endif
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BYTEORDER
  -- * \sa SDL_LIL_ENDIAN
  --  

  -- @}  
  --*
  -- * A macro that reports the target system's byte order.
  -- *
  -- * This is set to either SDL_LIL_ENDIAN or SDL_BIG_ENDIAN (and maybe other
  -- * values in the future, if something else becomes popular). This can be
  -- * tested with the preprocessor, so decisions can be made at compile time.
  -- *
  -- * ```c
  -- * #if SDL_BYTEORDER == SDL_BIG_ENDIAN
  -- * SDL_Log("This system is bigendian.");
  -- * #endif
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LIL_ENDIAN
  -- * \sa SDL_BIG_ENDIAN
  --  

  -- predefs from newer gcc and clang versions:  
  --*
  -- * A macro that reports the target system's floating point word order.
  -- *
  -- * This is set to either SDL_LIL_ENDIAN or SDL_BIG_ENDIAN (and maybe other
  -- * values in the future, if something else becomes popular). This can be
  -- * tested with the preprocessor, so decisions can be made at compile time.
  -- *
  -- * ```c
  -- * #if SDL_FLOATWORDORDER == SDL_BIG_ENDIAN
  -- * SDL_Log("This system's floats are bigendian.");
  -- * #endif
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LIL_ENDIAN
  -- * \sa SDL_BIG_ENDIAN
  --  

  -- predefs from newer gcc versions:  
  -- For Maverick, float words are always little-endian.  
  -- For FPA, float words are always big-endian.  
  -- By default, assume that floats words follow the memory system mode.  
  -- Set up for C function definitions, even when using C++  
  -- various modern compilers may have builtin swap  
  -- this one is broken  
  -- Byte swap 16-bit integer.  
  -- Byte swap 32-bit integer.  
  -- Byte swap 64-bit integer.  
  -- Separate into high and low 32-bit values and swap them  
  --*
  -- * Byte-swap a floating point number.
  -- *
  -- * This will always byte-swap the value, whether it's currently in the native
  -- * byteorder of the system or not. You should use SDL_SwapFloatLE or
  -- * SDL_SwapFloatBE instead, in most cases.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param x the value to byte-swap.
  -- * \returns x, with its bytes in the opposite endian order.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SwapFloat (x : float) return float  -- /usr/local/include/SDL3/SDL_endian.h:408
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SwapFloat";

  -- remove extra macros  
  --*
  -- * Byte-swap an unsigned 16-bit number.
  -- *
  -- * This will always byte-swap the value, whether it's currently in the native
  -- * byteorder of the system or not. You should use SDL_Swap16LE or SDL_Swap16BE
  -- * instead, in most cases.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param x the value to byte-swap.
  -- * \returns `x`, with its bytes in the opposite endian order.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Byte-swap an unsigned 32-bit number.
  -- *
  -- * This will always byte-swap the value, whether it's currently in the native
  -- * byteorder of the system or not. You should use SDL_Swap32LE or SDL_Swap32BE
  -- * instead, in most cases.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param x the value to byte-swap.
  -- * \returns `x`, with its bytes in the opposite endian order.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Byte-swap an unsigned 64-bit number.
  -- *
  -- * This will always byte-swap the value, whether it's currently in the native
  -- * byteorder of the system or not. You should use SDL_Swap64LE or SDL_Swap64BE
  -- * instead, in most cases.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param x the value to byte-swap.
  -- * \returns `x`, with its bytes in the opposite endian order.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a 16-bit value from littleendian to native byte order.
  -- *
  -- * If this is running on a littleendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in littleendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a 32-bit value from littleendian to native byte order.
  -- *
  -- * If this is running on a littleendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in littleendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a 64-bit value from littleendian to native byte order.
  -- *
  -- * If this is running on a littleendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in littleendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a floating point value from littleendian to native byte order.
  -- *
  -- * If this is running on a littleendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in littleendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a 16-bit value from bigendian to native byte order.
  -- *
  -- * If this is running on a bigendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in bigendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a 32-bit value from bigendian to native byte order.
  -- *
  -- * If this is running on a bigendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in bigendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a 64-bit value from bigendian to native byte order.
  -- *
  -- * If this is running on a bigendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in bigendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Swap a floating point value from bigendian to native byte order.
  -- *
  -- * If this is running on a bigendian system, `x` is returned unchanged.
  -- *
  -- * This macro never references `x` more than once, avoiding side effects.
  -- *
  -- * \param x the value to swap, in bigendian byte order.
  -- * \returns `x` in native byte order.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- Ends C function definitions when using C++  
end SDL3_SDL_endian_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
