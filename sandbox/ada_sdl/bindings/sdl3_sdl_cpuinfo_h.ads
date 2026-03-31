pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with stddef_h;

package SDL3_SDL_cpuinfo_h is

   SDL_CACHELINE_SIZE : constant := 128;  --  /usr/local/include/SDL3/SDL_cpuinfo.h:60

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

  -- WIKI CATEGORY: CPUInfo  
  --*
  -- * # CategoryCPUInfo
  -- *
  -- * CPU feature detection for SDL.
  -- *
  -- * These functions are largely concerned with reporting if the system has
  -- * access to various SIMD instruction sets, but also has other important info
  -- * to share, such as system RAM size and number of logical CPU cores.
  -- *
  -- * CPU instruction set checks, like SDL_HasSSE() and SDL_HasNEON(), are
  -- * available on all platforms, even if they don't make sense (an ARM processor
  -- * will never have SSE and an x86 processor will never have NEON, for example,
  -- * but these functions still exist and will simply return false in these
  -- * cases).
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * A guess for the cacheline size used for padding.
  -- *
  -- * Most x86 processors have a 64 byte cache line. The 64-bit PowerPC
  -- * processors have a 128 byte cache line. We use the larger value to be
  -- * generally safe.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Get the number of logical CPU cores available.
  -- *
  -- * \returns the total number of logical CPU cores. On CPUs that include
  -- *          technologies such as hyperthreading, the number of logical cores
  -- *          may be more than the number of physical cores.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetNumLogicalCPUCores return int  -- /usr/local/include/SDL3/SDL_cpuinfo.h:73
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumLogicalCPUCores";

  --*
  -- * Determine the L1 cache line size of the CPU.
  -- *
  -- * This is useful for determining multi-threaded structure padding or SIMD
  -- * prefetch sizes.
  -- *
  -- * \returns the L1 cache line size of the CPU, in bytes.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetCPUCacheLineSize return int  -- /usr/local/include/SDL3/SDL_cpuinfo.h:87
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetCPUCacheLineSize";

  --*
  -- * Determine whether the CPU has AltiVec features.
  -- *
  -- * This always returns false on CPUs that aren't using PowerPC instruction
  -- * sets.
  -- *
  -- * \returns true if the CPU has AltiVec features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_HasAltiVec return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:101
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasAltiVec";

  --*
  -- * Determine whether the CPU has MMX features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has MMX features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_HasMMX return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:114
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasMMX";

  --*
  -- * Determine whether the CPU has SSE features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has SSE features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasSSE2
  -- * \sa SDL_HasSSE3
  -- * \sa SDL_HasSSE41
  -- * \sa SDL_HasSSE42
  --  

   function SDL_HasSSE return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:132
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasSSE";

  --*
  -- * Determine whether the CPU has SSE2 features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has SSE2 features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasSSE
  -- * \sa SDL_HasSSE3
  -- * \sa SDL_HasSSE41
  -- * \sa SDL_HasSSE42
  --  

   function SDL_HasSSE2 return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:150
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasSSE2";

  --*
  -- * Determine whether the CPU has SSE3 features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has SSE3 features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasSSE
  -- * \sa SDL_HasSSE2
  -- * \sa SDL_HasSSE41
  -- * \sa SDL_HasSSE42
  --  

   function SDL_HasSSE3 return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:168
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasSSE3";

  --*
  -- * Determine whether the CPU has SSE4.1 features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has SSE4.1 features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasSSE
  -- * \sa SDL_HasSSE2
  -- * \sa SDL_HasSSE3
  -- * \sa SDL_HasSSE42
  --  

   function SDL_HasSSE41 return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:186
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasSSE41";

  --*
  -- * Determine whether the CPU has SSE4.2 features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has SSE4.2 features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasSSE
  -- * \sa SDL_HasSSE2
  -- * \sa SDL_HasSSE3
  -- * \sa SDL_HasSSE41
  --  

   function SDL_HasSSE42 return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:204
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasSSE42";

  --*
  -- * Determine whether the CPU has AVX features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has AVX features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasAVX2
  -- * \sa SDL_HasAVX512F
  --  

   function SDL_HasAVX return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:220
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasAVX";

  --*
  -- * Determine whether the CPU has AVX2 features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has AVX2 features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasAVX
  -- * \sa SDL_HasAVX512F
  --  

   function SDL_HasAVX2 return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:236
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasAVX2";

  --*
  -- * Determine whether the CPU has AVX-512F (foundation) features.
  -- *
  -- * This always returns false on CPUs that aren't using Intel instruction sets.
  -- *
  -- * \returns true if the CPU has AVX-512F features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasAVX
  -- * \sa SDL_HasAVX2
  --  

   function SDL_HasAVX512F return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:252
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasAVX512F";

  --*
  -- * Determine whether the CPU has ARM SIMD (ARMv6) features.
  -- *
  -- * This is different from ARM NEON, which is a different instruction set.
  -- *
  -- * This always returns false on CPUs that aren't using ARM instruction sets.
  -- *
  -- * \returns true if the CPU has ARM SIMD features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasNEON
  --  

   function SDL_HasARMSIMD return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:269
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasARMSIMD";

  --*
  -- * Determine whether the CPU has NEON (ARM SIMD) features.
  -- *
  -- * This always returns false on CPUs that aren't using ARM instruction sets.
  -- *
  -- * \returns true if the CPU has ARM NEON features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_HasNEON return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:282
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasNEON";

  --*
  -- * Determine whether the CPU has LSX (LOONGARCH SIMD) features.
  -- *
  -- * This always returns false on CPUs that aren't using LOONGARCH instruction
  -- * sets.
  -- *
  -- * \returns true if the CPU has LOONGARCH LSX features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_HasLSX return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:296
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasLSX";

  --*
  -- * Determine whether the CPU has LASX (LOONGARCH SIMD) features.
  -- *
  -- * This always returns false on CPUs that aren't using LOONGARCH instruction
  -- * sets.
  -- *
  -- * \returns true if the CPU has LOONGARCH LASX features or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_HasLASX return Extensions.bool  -- /usr/local/include/SDL3/SDL_cpuinfo.h:310
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasLASX";

  --*
  -- * Get the amount of RAM configured in the system.
  -- *
  -- * \returns the amount of RAM configured in the system in MiB.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetSystemRAM return int  -- /usr/local/include/SDL3/SDL_cpuinfo.h:321
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSystemRAM";

  --*
  -- * Report the alignment this system needs for SIMD allocations.
  -- *
  -- * This will return the minimum number of bytes to which a pointer must be
  -- * aligned to be compatible with SIMD instructions on the current machine. For
  -- * example, if the machine supports SSE only, it will return 16, but if it
  -- * supports AVX-512F, it'll return 64 (etc). This only reports values for
  -- * instruction sets SDL knows about, so if your SDL build doesn't have
  -- * SDL_HasAVX512F(), then it might return 16 for the SSE support it sees and
  -- * not 64 for the AVX-512 instructions that exist but SDL doesn't know about.
  -- * Plan accordingly.
  -- *
  -- * \returns the alignment in bytes needed for available, known SIMD
  -- *          instructions.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_aligned_alloc
  -- * \sa SDL_aligned_free
  --  

   function SDL_GetSIMDAlignment return stddef_h.size_t  -- /usr/local/include/SDL3/SDL_cpuinfo.h:345
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSIMDAlignment";

  --*
  -- * Report the size of a page of memory.
  -- *
  -- * Different platforms might have different memory page sizes. In current
  -- * times, 4 kilobytes is not unusual, but newer systems are moving to larger
  -- * page sizes, and esoteric platforms might have any unexpected size.
  -- *
  -- * Note that this function can return 0, which means SDL can't determine the
  -- * page size on this platform. It will _not_ set an error string to be
  -- * retrieved with SDL_GetError() in this case! In this case, defaulting to
  -- * 4096 is often a reasonable option.
  -- *
  -- * \returns the size of a single page of memory, in bytes, or 0 if SDL can't
  -- *          determine this information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_GetSystemPageSize return int  -- /usr/local/include/SDL3/SDL_cpuinfo.h:366
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSystemPageSize";

  -- Ends C function definitions when using C++  
end SDL3_SDL_cpuinfo_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
