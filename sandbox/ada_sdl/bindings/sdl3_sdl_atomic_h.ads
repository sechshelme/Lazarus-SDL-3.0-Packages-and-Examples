pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with SDL3_SDL_stdinc_h;
with System;

package SDL3_SDL_atomic_h is

   --  arg-macro: procedure SDL_CompilerBarrier ()
   --    __asm__ __volatile__ ("" : : : & "memory")
   --  arg-macro: procedure SDL_MemoryBarrierRelease ()
   --    SDL_CompilerBarrier()
   --  arg-macro: procedure SDL_MemoryBarrierAcquire ()
   --    SDL_CompilerBarrier()
   --  arg-macro: procedure SDL_CPUPauseInstruction ()
   --    __asm__ __volatile__("pause" & ASCII.LF & "")
   --  arg-macro: procedure SDL_AtomicIncRef (a)
   --    SDL_AddAtomicInt(a, 1)
   --  arg-macro: function SDL_AtomicDecRef (a)
   --    return SDL_AddAtomicInt(a, -1) = 1;
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
  -- * # CategoryAtomic
  -- *
  -- * Atomic operations.
  -- *
  -- * IMPORTANT: If you are not an expert in concurrent lockless programming, you
  -- * should not be using any functions in this file. You should be protecting
  -- * your data structures with full mutexes instead.
  -- *
  -- * ***Seriously, here be dragons!***
  -- *
  -- * You can find out a little more about lockless programming and the subtle
  -- * issues that can arise here:
  -- * https://learn.microsoft.com/en-us/windows/win32/dxtecharts/lockless-programming
  -- *
  -- * There's also lots of good information here:
  -- *
  -- * - https://www.1024cores.net/home/lock-free-algorithms
  -- * - https://preshing.com/
  -- *
  -- * These operations may or may not actually be implemented using processor
  -- * specific atomic operations. When possible they are implemented as true
  -- * processor specific atomic operations. When that is not possible the are
  -- * implemented using locks that *do* use the available atomic operations.
  -- *
  -- * All of the atomic operations that modify memory are full memory barriers.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * An atomic spinlock.
  -- *
  -- * The atomic locks are efficient spinlocks using CPU instructions, but are
  -- * vulnerable to starvation and can spin forever if a thread holding a lock
  -- * has been terminated. For this reason you should minimize the code executed
  -- * inside an atomic lock and never do expensive things like API or system
  -- * calls while holding them.
  -- *
  -- * They are also vulnerable to starvation if the thread holding the lock is
  -- * lower priority than other threads and doesn't get scheduled. In general you
  -- * should use mutexes instead, since they have better performance and
  -- * contention behavior.
  -- *
  -- * The atomic locks are not safe to lock recursively.
  -- *
  -- * Porting Note: The spin lock functions and type are required and can not be
  -- * emulated because they are used in the atomic emulation code.
  --  

   subtype SDL_SpinLock is int;  -- /usr/local/include/SDL3/SDL_atomic.h:82

  --*
  -- * Try to lock a spin lock by setting it to a non-zero value.
  -- *
  -- * ***Please note that spinlocks are dangerous if you don't know what you're
  -- * doing. Please be careful using any sort of spinlock!***
  -- *
  -- * \param lock a pointer to a lock variable.
  -- * \returns true if the lock succeeded, false if the lock is already held.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockSpinlock
  -- * \sa SDL_UnlockSpinlock
  --  

   function SDL_TryLockSpinlock (lock : access SDL_SpinLock) return Extensions.bool  -- /usr/local/include/SDL3/SDL_atomic.h:100
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TryLockSpinlock";

  --*
  -- * Lock a spin lock by setting it to a non-zero value.
  -- *
  -- * ***Please note that spinlocks are dangerous if you don't know what you're
  -- * doing. Please be careful using any sort of spinlock!***
  -- *
  -- * \param lock a pointer to a lock variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_TryLockSpinlock
  -- * \sa SDL_UnlockSpinlock
  --  

   procedure SDL_LockSpinlock (lock : access SDL_SpinLock)  -- /usr/local/include/SDL3/SDL_atomic.h:117
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockSpinlock";

  --*
  -- * Unlock a spin lock by setting it to 0.
  -- *
  -- * Always returns immediately.
  -- *
  -- * ***Please note that spinlocks are dangerous if you don't know what you're
  -- * doing. Please be careful using any sort of spinlock!***
  -- *
  -- * \param lock a pointer to a lock variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockSpinlock
  -- * \sa SDL_TryLockSpinlock
  --  

   procedure SDL_UnlockSpinlock (lock : access SDL_SpinLock)  -- /usr/local/include/SDL3/SDL_atomic.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockSpinlock";

  --*
  -- * Mark a compiler barrier.
  -- *
  -- * A compiler barrier prevents the compiler from reordering reads and writes
  -- * to globally visible variables across the call.
  -- *
  -- * This macro only prevents the compiler from reordering reads and writes, it
  -- * does not prevent the CPU from reordering reads and writes. However, all of
  -- * the atomic operations that modify memory are full memory barriers.
  -- *
  -- * \threadsafety Obviously this macro is safe to use from any thread at any
  -- *               time, but if you find yourself needing this, you are probably
  -- *               dealing with some very sensitive code; be careful!
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- This is correct for all CPUs when using GCC or Solaris Studio 12.1+.  
  --*
  -- * Insert a memory release barrier (function version).
  -- *
  -- * Please refer to SDL_MemoryBarrierRelease for details. This is a function
  -- * version, which might be useful if you need to use this functionality from a
  -- * scripting language, etc. Also, some of the macro versions call this
  -- * function behind the scenes, where more heavy lifting can happen inside of
  -- * SDL. Generally, though, an app written in C/C++/etc should use the macro
  -- * version, as it will be more efficient.
  -- *
  -- * \threadsafety Obviously this function is safe to use from any thread at any
  -- *               time, but if you find yourself needing this, you are probably
  -- *               dealing with some very sensitive code; be careful!
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MemoryBarrierRelease
  --  

   procedure SDL_MemoryBarrierReleaseFunction  -- /usr/local/include/SDL3/SDL_atomic.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MemoryBarrierReleaseFunction";

  --*
  -- * Insert a memory acquire barrier (function version).
  -- *
  -- * Please refer to SDL_MemoryBarrierRelease for details. This is a function
  -- * version, which might be useful if you need to use this functionality from a
  -- * scripting language, etc. Also, some of the macro versions call this
  -- * function behind the scenes, where more heavy lifting can happen inside of
  -- * SDL. Generally, though, an app written in C/C++/etc should use the macro
  -- * version, as it will be more efficient.
  -- *
  -- * \threadsafety Obviously this function is safe to use from any thread at any
  -- *               time, but if you find yourself needing this, you are probably
  -- *               dealing with some very sensitive code; be careful!
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MemoryBarrierAcquire
  --  

   procedure SDL_MemoryBarrierAcquireFunction  -- /usr/local/include/SDL3/SDL_atomic.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MemoryBarrierAcquireFunction";

  --*
  -- * Insert a memory release barrier (macro version).
  -- *
  -- * Memory barriers are designed to prevent reads and writes from being
  -- * reordered by the compiler and being seen out of order on multi-core CPUs.
  -- *
  -- * A typical pattern would be for thread A to write some data and a flag, and
  -- * for thread B to read the flag and get the data. In this case you would
  -- * insert a release barrier between writing the data and the flag,
  -- * guaranteeing that the data write completes no later than the flag is
  -- * written, and you would insert an acquire barrier between reading the flag
  -- * and reading the data, to ensure that all the reads associated with the flag
  -- * have completed.
  -- *
  -- * In this pattern you should always see a release barrier paired with an
  -- * acquire barrier and you should gate the data reads/writes with a single
  -- * flag variable.
  -- *
  -- * For more information on these semantics, take a look at the blog post:
  -- * http://preshing.com/20120913/acquire-and-release-semantics
  -- *
  -- * This is the macro version of this functionality; if possible, SDL will use
  -- * compiler intrinsics or inline assembly, but some platforms might need to
  -- * call the function version of this, SDL_MemoryBarrierReleaseFunction to do
  -- * the heavy lifting. Apps that can use the macro should favor it over the
  -- * function.
  -- *
  -- * \threadsafety Obviously this macro is safe to use from any thread at any
  -- *               time, but if you find yourself needing this, you are probably
  -- *               dealing with some very sensitive code; be careful!
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MemoryBarrierAcquire
  -- * \sa SDL_MemoryBarrierReleaseFunction
  --  

  --*
  -- * Insert a memory acquire barrier (macro version).
  -- *
  -- * Please see SDL_MemoryBarrierRelease for the details on what memory barriers
  -- * are and when to use them.
  -- *
  -- * This is the macro version of this functionality; if possible, SDL will use
  -- * compiler intrinsics or inline assembly, but some platforms might need to
  -- * call the function version of this, SDL_MemoryBarrierAcquireFunction, to do
  -- * the heavy lifting. Apps that can use the macro should favor it over the
  -- * function.
  -- *
  -- * \threadsafety Obviously this macro is safe to use from any thread at any
  -- *               time, but if you find yourself needing this, you are probably
  -- *               dealing with some very sensitive code; be careful!
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MemoryBarrierRelease
  -- * \sa SDL_MemoryBarrierAcquireFunction
  --  

  -- Information from:
  --   https://chromium.googlesource.com/chromium/chromium/+/trunk/base/atomicops_internals_arm_gcc.h#19
  --   The Linux kernel provides a helper function which provides the right code for a memory barrier,
  --   hard-coded at address 0xffff0fa0
  -- 

  -- The mcr instruction isn't available in thumb mode, use real functions  
  -- This is correct for all CPUs on Solaris when using Solaris Studio 12.1+.  
  -- This is correct for the x86 and x64 CPUs, and we'll expand this over time.  
  -- "REP NOP" is PAUSE, coded for tools that don't know it by that name.  
  --*
  -- * A macro to insert a CPU-specific "pause" instruction into the program.
  -- *
  -- * This can be useful in busy-wait loops, as it serves as a hint to the CPU as
  -- * to the program's intent; some CPUs can use this to do more efficient
  -- * processing. On some platforms, this doesn't do anything, so using this
  -- * macro might just be a harmless no-op.
  -- *
  -- * Note that if you are busy-waiting, there are often more-efficient
  -- * approaches with other synchronization primitives: mutexes, semaphores,
  -- * condition variables, etc.
  -- *
  -- * \threadsafety This macro is safe to use from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A type representing an atomic integer value.
  -- *
  -- * This can be used to manage a value that is synchronized across multiple
  -- * CPUs without a race condition; when an app sets a value with
  -- * SDL_SetAtomicInt all other threads, regardless of the CPU it is running on,
  -- * will see that value when retrieved with SDL_GetAtomicInt, regardless of CPU
  -- * caches, etc.
  -- *
  -- * This is also useful for atomic compare-and-swap operations: a thread can
  -- * change the value as long as its current value matches expectations. When
  -- * done in a loop, one can guarantee data consistency across threads without a
  -- * lock (but the usual warnings apply: if you don't know what you're doing, or
  -- * you don't do it carefully, you can confidently cause any number of
  -- * disasters with this, so in most cases, you _should_ use a mutex instead of
  -- * this!).
  -- *
  -- * This is a struct so people don't accidentally use numeric operations on it
  -- * directly. You have to use SDL atomic functions.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CompareAndSwapAtomicInt
  -- * \sa SDL_GetAtomicInt
  -- * \sa SDL_SetAtomicInt
  -- * \sa SDL_AddAtomicInt
  --  

   type SDL_AtomicInt is record
      value : aliased int;  -- /usr/local/include/SDL3/SDL_atomic.h:395
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_atomic.h:395

  --*
  -- * Set an atomic variable to a new value if it is currently an old value.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicInt variable to be modified.
  -- * \param oldval the old value.
  -- * \param newval the new value.
  -- * \returns true if the atomic variable was set, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAtomicInt
  -- * \sa SDL_SetAtomicInt
  --  

   function SDL_CompareAndSwapAtomicInt
     (a : access SDL_AtomicInt;
      oldval : int;
      newval : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_atomic.h:415
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CompareAndSwapAtomicInt";

  --*
  -- * Set an atomic variable to a value.
  -- *
  -- * This function also acts as a full memory barrier.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicInt variable to be modified.
  -- * \param v the desired value.
  -- * \returns the previous value of the atomic variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAtomicInt
  --  

   function SDL_SetAtomicInt (a : access SDL_AtomicInt; v : int) return int  -- /usr/local/include/SDL3/SDL_atomic.h:435
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetAtomicInt";

  --*
  -- * Get the value of an atomic variable.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicInt variable.
  -- * \returns the current value of an atomic variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetAtomicInt
  --  

   function SDL_GetAtomicInt (a : access SDL_AtomicInt) return int  -- /usr/local/include/SDL3/SDL_atomic.h:452
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetAtomicInt";

  --*
  -- * Add to an atomic variable.
  -- *
  -- * This function also acts as a full memory barrier.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicInt variable to be modified.
  -- * \param v the desired value to add.
  -- * \returns the previous value of the atomic variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AtomicDecRef
  -- * \sa SDL_AtomicIncRef
  --  

   function SDL_AddAtomicInt (a : access SDL_AtomicInt; v : int) return int  -- /usr/local/include/SDL3/SDL_atomic.h:473
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddAtomicInt";

  --*
  -- * Increment an atomic variable used as a reference count.
  -- *
  -- * ***Note: If you don't know what this macro is for, you shouldn't use it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicInt to increment.
  -- * \returns the previous value of the atomic variable.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AtomicDecRef
  --  

  --*
  -- * Decrement an atomic variable used as a reference count.
  -- *
  -- * ***Note: If you don't know what this macro is for, you shouldn't use it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicInt to decrement.
  -- * \returns true if the variable reached zero after decrementing, false
  -- *          otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AtomicIncRef
  --  

  --*
  -- * A type representing an atomic unsigned 32-bit value.
  -- *
  -- * This can be used to manage a value that is synchronized across multiple
  -- * CPUs without a race condition; when an app sets a value with
  -- * SDL_SetAtomicU32 all other threads, regardless of the CPU it is running on,
  -- * will see that value when retrieved with SDL_GetAtomicU32, regardless of CPU
  -- * caches, etc.
  -- *
  -- * This is also useful for atomic compare-and-swap operations: a thread can
  -- * change the value as long as its current value matches expectations. When
  -- * done in a loop, one can guarantee data consistency across threads without a
  -- * lock (but the usual warnings apply: if you don't know what you're doing, or
  -- * you don't do it carefully, you can confidently cause any number of
  -- * disasters with this, so in most cases, you _should_ use a mutex instead of
  -- * this!).
  -- *
  -- * This is a struct so people don't accidentally use numeric operations on it
  -- * directly. You have to use SDL atomic functions.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CompareAndSwapAtomicU32
  -- * \sa SDL_GetAtomicU32
  -- * \sa SDL_SetAtomicU32
  --  

   type SDL_AtomicU32 is record
      value : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_atomic.h:540
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_atomic.h:540

  --*
  -- * Set an atomic variable to a new value if it is currently an old value.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicU32 variable to be modified.
  -- * \param oldval the old value.
  -- * \param newval the new value.
  -- * \returns true if the atomic variable was set, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAtomicU32
  -- * \sa SDL_SetAtomicU32
  --  

   function SDL_CompareAndSwapAtomicU32
     (a : access SDL_AtomicU32;
      oldval : SDL3_SDL_stdinc_h.Uint32;
      newval : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_atomic.h:560
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CompareAndSwapAtomicU32";

  --*
  -- * Set an atomic variable to a value.
  -- *
  -- * This function also acts as a full memory barrier.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicU32 variable to be modified.
  -- * \param v the desired value.
  -- * \returns the previous value of the atomic variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAtomicU32
  --  

   function SDL_SetAtomicU32 (a : access SDL_AtomicU32; v : SDL3_SDL_stdinc_h.Uint32) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_atomic.h:580
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetAtomicU32";

  --*
  -- * Get the value of an atomic variable.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicU32 variable.
  -- * \returns the current value of an atomic variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetAtomicU32
  --  

   function SDL_GetAtomicU32 (a : access SDL_AtomicU32) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_atomic.h:597
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetAtomicU32";

  --*
  -- * Add to an atomic variable.
  -- *
  -- * This function also acts as a full memory barrier.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to an SDL_AtomicU32 variable to be modified.
  -- * \param v the desired value to add or subtract.
  -- * \returns the previous value of the atomic variable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_AddAtomicU32 (a : access SDL_AtomicU32; v : int) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_atomic.h:615
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddAtomicU32";

  --*
  -- * Set a pointer to a new value if it is currently an old value.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to a pointer.
  -- * \param oldval the old pointer value.
  -- * \param newval the new pointer value.
  -- * \returns true if the pointer was set, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CompareAndSwapAtomicInt
  -- * \sa SDL_GetAtomicPointer
  -- * \sa SDL_SetAtomicPointer
  --  

   function SDL_CompareAndSwapAtomicPointer
     (a : System.Address;
      oldval : System.Address;
      newval : System.Address) return Extensions.bool  -- /usr/local/include/SDL3/SDL_atomic.h:636
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CompareAndSwapAtomicPointer";

  --*
  -- * Set a pointer to a value atomically.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to a pointer.
  -- * \param v the desired pointer value.
  -- * \returns the previous value of the pointer.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CompareAndSwapAtomicPointer
  -- * \sa SDL_GetAtomicPointer
  --  

   function SDL_SetAtomicPointer (a : System.Address; v : System.Address) return System.Address  -- /usr/local/include/SDL3/SDL_atomic.h:655
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetAtomicPointer";

  --*
  -- * Get the value of a pointer atomically.
  -- *
  -- * ***Note: If you don't know what this function is for, you shouldn't use
  -- * it!***
  -- *
  -- * \param a a pointer to a pointer.
  -- * \returns the current value of a pointer.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CompareAndSwapAtomicPointer
  -- * \sa SDL_SetAtomicPointer
  --  

   function SDL_GetAtomicPointer (a : System.Address) return System.Address  -- /usr/local/include/SDL3/SDL_atomic.h:673
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetAtomicPointer";

  -- Ends C function definitions when using C++  
end SDL3_SDL_atomic_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
