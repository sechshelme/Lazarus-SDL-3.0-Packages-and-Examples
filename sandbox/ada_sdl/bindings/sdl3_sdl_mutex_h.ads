pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with SDL3_SDL_stdinc_h;
with SDL3_SDL_atomic_h;
with SDL3_SDL_thread_h;
with System;

package SDL3_SDL_mutex_h is

   --  arg-macro: procedure SDL_CAPABILITY (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(capability(x))
   --  unsupported macro: SDL_SCOPED_CAPABILITY SDL_THREAD_ANNOTATION_ATTRIBUTE__(scoped_lockable)
   --  arg-macro: procedure SDL_GUARDED_BY (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(guarded_by(x))
   --  arg-macro: procedure SDL_PT_GUARDED_BY (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(pt_guarded_by(x))
   --  arg-macro: procedure SDL_ACQUIRED_BEFORE (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquired_before(x))
   --  arg-macro: procedure SDL_ACQUIRED_AFTER (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquired_after(x))
   --  arg-macro: procedure SDL_REQUIRES (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(requires_capability(x))
   --  arg-macro: procedure SDL_REQUIRES_SHARED (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(requires_shared_capability(x))
   --  arg-macro: procedure SDL_ACQUIRE (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquire_capability(x))
   --  arg-macro: procedure SDL_ACQUIRE_SHARED (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(acquire_shared_capability(x))
   --  arg-macro: procedure SDL_RELEASE (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(release_capability(x))
   --  arg-macro: procedure SDL_RELEASE_SHARED (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(release_shared_capability(x))
   --  arg-macro: procedure SDL_RELEASE_GENERIC (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(release_generic_capability(x))
   --  arg-macro: procedure SDL_TRY_ACQUIRE (x, y)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(try_acquire_capability(x, y))
   --  arg-macro: procedure SDL_TRY_ACQUIRE_SHARED (x, y)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(try_acquire_shared_capability(x, y))
   --  arg-macro: procedure SDL_EXCLUDES (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(locks_excluded(x))
   --  arg-macro: procedure SDL_ASSERT_CAPABILITY (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(assert_capability(x))
   --  arg-macro: procedure SDL_ASSERT_SHARED_CAPABILITY (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(assert_shared_capability(x))
   --  arg-macro: procedure SDL_RETURN_CAPABILITY (x)
   --    SDL_THREAD_ANNOTATION_ATTRIBUTE__(lock_returned(x))
   --  unsupported macro: SDL_NO_THREAD_SAFETY_ANALYSIS SDL_THREAD_ANNOTATION_ATTRIBUTE__(no_thread_safety_analysis)
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
  -- * # CategoryMutex
  -- *
  -- * SDL offers several thread synchronization primitives. This document can't
  -- * cover the complicated topic of thread safety, but reading up on what each
  -- * of these primitives are, why they are useful, and how to correctly use them
  -- * is vital to writing correct and safe multithreaded programs.
  -- *
  -- * - Mutexes: SDL_CreateMutex()
  -- * - Read/Write locks: SDL_CreateRWLock()
  -- * - Semaphores: SDL_CreateSemaphore()
  -- * - Condition variables: SDL_CreateCondition()
  -- *
  -- * SDL also offers a datatype, SDL_InitState, which can be used to make sure
  -- * only one thread initializes/deinitializes some resource that several
  -- * threads might try to use for the first time simultaneously.
  --  

  --*
  -- * Enable thread safety attributes, only with clang.
  -- *
  -- * The attributes can be safely erased when compiling with other compilers.
  -- *
  -- * To enable analysis, set these environment variables before running cmake:
  -- *
  -- * ```bash
  -- * export CC=clang
  -- * export CFLAGS="-DSDL_THREAD_SAFETY_ANALYSIS -Wthread-safety"
  -- * ```
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Wrapper around Clang thread safety analysis annotations.
  -- *
  -- * Please see https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#mutex-h
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --**************************************************************************** 
  -- Set up for C function definitions, even when using C++  
  --*
  -- *  \name Mutex functions
  --  

  -- @{  
  --*
  -- * A means to serialize access to a resource between threads.
  -- *
  -- * Mutexes (short for "mutual exclusion") are a synchronization primitive that
  -- * allows exactly one thread to proceed at a time.
  -- *
  -- * Wikipedia has a thorough explanation of the concept:
  -- *
  -- * https://en.wikipedia.org/wiki/Mutex
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Mutex is null record;   -- incomplete struct

  --*
  -- * Create a new mutex.
  -- *
  -- * All newly-created mutexes begin in the _unlocked_ state.
  -- *
  -- * Calls to SDL_LockMutex() will not return while the mutex is locked by
  -- * another thread. See SDL_TryLockMutex() to attempt to lock without blocking.
  -- *
  -- * SDL mutexes are reentrant.
  -- *
  -- * \returns the initialized and unlocked mutex or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroyMutex
  -- * \sa SDL_LockMutex
  -- * \sa SDL_TryLockMutex
  -- * \sa SDL_UnlockMutex
  --  

   function SDL_CreateMutex return access SDL_Mutex  -- /usr/local/include/SDL3/SDL_mutex.h:318
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateMutex";

  --*
  -- * Lock the mutex.
  -- *
  -- * This will block until the mutex is available, which is to say it is in the
  -- * unlocked state and the OS has chosen the caller as the next thread to lock
  -- * it. Of all threads waiting to lock the mutex, only one may do so at a time.
  -- *
  -- * It is legal for the owning thread to lock an already-locked mutex. It must
  -- * unlock it the same number of times before it is actually made available for
  -- * other threads in the system (this is known as a "recursive mutex").
  -- *
  -- * This function does not fail; if mutex is NULL, it will return immediately
  -- * having locked nothing. If the mutex is valid, this function will always
  -- * block until it can lock the mutex, and return with it locked.
  -- *
  -- * \param mutex the mutex to lock.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_TryLockMutex
  -- * \sa SDL_UnlockMutex
  --  

   procedure SDL_LockMutex (mutex : access SDL_Mutex)  -- /usr/local/include/SDL3/SDL_mutex.h:342
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockMutex";

  --*
  -- * Try to lock a mutex without blocking.
  -- *
  -- * This works just like SDL_LockMutex(), but if the mutex is not available,
  -- * this function returns false immediately.
  -- *
  -- * This technique is useful if you need exclusive access to a resource but
  -- * don't want to wait for it, and will return to it to try again later.
  -- *
  -- * This function returns true if passed a NULL mutex.
  -- *
  -- * \param mutex the mutex to try to lock.
  -- * \returns true on success, false if the mutex would block.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockMutex
  -- * \sa SDL_UnlockMutex
  --  

   function SDL_TryLockMutex (mutex : access SDL_Mutex) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:363
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TryLockMutex";

  --*
  -- * Unlock the mutex.
  -- *
  -- * It is legal for the owning thread to lock an already-locked mutex. It must
  -- * unlock it the same number of times before it is actually made available for
  -- * other threads in the system (this is known as a "recursive mutex").
  -- *
  -- * It is illegal to unlock a mutex that has not been locked by the current
  -- * thread, and doing so results in undefined behavior.
  -- *
  -- * \param mutex the mutex to unlock.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockMutex
  -- * \sa SDL_TryLockMutex
  --  

   procedure SDL_UnlockMutex (mutex : access SDL_Mutex)  -- /usr/local/include/SDL3/SDL_mutex.h:382
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockMutex";

  --*
  -- * Destroy a mutex created with SDL_CreateMutex().
  -- *
  -- * This function must be called on any mutex that is no longer needed. Failure
  -- * to destroy a mutex will result in a system memory or resource leak. While
  -- * it is safe to destroy a mutex that is _unlocked_, it is not safe to attempt
  -- * to destroy a locked mutex, and may result in undefined behavior depending
  -- * on the platform.
  -- *
  -- * \param mutex the mutex to destroy.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateMutex
  --  

   procedure SDL_DestroyMutex (mutex : access SDL_Mutex)  -- /usr/local/include/SDL3/SDL_mutex.h:399
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyMutex";

  -- @}  
  -- Mutex functions  
  --*
  -- *  \name Read/write lock functions
  --  

  -- @{  
  --*
  -- * A mutex that allows read-only threads to run in parallel.
  -- *
  -- * A rwlock is roughly the same concept as SDL_Mutex, but allows threads that
  -- * request read-only access to all hold the lock at the same time. If a thread
  -- * requests write access, it will block until all read-only threads have
  -- * released the lock, and no one else can hold the thread (for reading or
  -- * writing) at the same time as the writing thread.
  -- *
  -- * This can be more efficient in cases where several threads need to access
  -- * data frequently, but changes to that data are rare.
  -- *
  -- * There are other rules that apply to rwlocks that don't apply to mutexes,
  -- * about how threads are scheduled and when they can be recursively locked.
  -- * These are documented in the other rwlock functions.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_RWLock is null record;   -- incomplete struct

  --*
  -- * Create a new read/write lock.
  -- *
  -- * A read/write lock is useful for situations where you have multiple threads
  -- * trying to access a resource that is rarely updated. All threads requesting
  -- * a read-only lock will be allowed to run in parallel; if a thread requests a
  -- * write lock, it will be provided exclusive access. This makes it safe for
  -- * multiple threads to use a resource at the same time if they promise not to
  -- * change it, and when it has to be changed, the rwlock will serve as a
  -- * gateway to make sure those changes can be made safely.
  -- *
  -- * In the right situation, a rwlock can be more efficient than a mutex, which
  -- * only lets a single thread proceed at a time, even if it won't be modifying
  -- * the data.
  -- *
  -- * All newly-created read/write locks begin in the _unlocked_ state.
  -- *
  -- * Calls to SDL_LockRWLockForReading() and SDL_LockRWLockForWriting will not
  -- * return while the rwlock is locked _for writing_ by another thread. See
  -- * SDL_TryLockRWLockForReading() and SDL_TryLockRWLockForWriting() to attempt
  -- * to lock without blocking.
  -- *
  -- * SDL read/write locks are only recursive for read-only locks! They are not
  -- * guaranteed to be fair, or provide access in a FIFO manner! They are not
  -- * guaranteed to favor writers. You may not lock a rwlock for both read-only
  -- * and write access at the same time from the same thread (so you can't
  -- * promote your read-only lock to a write lock without unlocking first).
  -- *
  -- * \returns the initialized and unlocked read/write lock or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroyRWLock
  -- * \sa SDL_LockRWLockForReading
  -- * \sa SDL_LockRWLockForWriting
  -- * \sa SDL_TryLockRWLockForReading
  -- * \sa SDL_TryLockRWLockForWriting
  -- * \sa SDL_UnlockRWLock
  --  

   function SDL_CreateRWLock return access SDL_RWLock  -- /usr/local/include/SDL3/SDL_mutex.h:469
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateRWLock";

  --*
  -- * Lock the read/write lock for _read only_ operations.
  -- *
  -- * This will block until the rwlock is available, which is to say it is not
  -- * locked for writing by any other thread. Of all threads waiting to lock the
  -- * rwlock, all may do so at the same time as long as they are requesting
  -- * read-only access; if a thread wants to lock for writing, only one may do so
  -- * at a time, and no other threads, read-only or not, may hold the lock at the
  -- * same time.
  -- *
  -- * It is legal for the owning thread to lock an already-locked rwlock for
  -- * reading. It must unlock it the same number of times before it is actually
  -- * made available for other threads in the system (this is known as a
  -- * "recursive rwlock").
  -- *
  -- * Note that locking for writing is not recursive (this is only available to
  -- * read-only locks).
  -- *
  -- * It is illegal to request a read-only lock from a thread that already holds
  -- * the write lock. Doing so results in undefined behavior. Unlock the write
  -- * lock before requesting a read-only lock. (But, of course, if you have the
  -- * write lock, you don't need further locks to read in any case.)
  -- *
  -- * This function does not fail; if rwlock is NULL, it will return immediately
  -- * having locked nothing. If the rwlock is valid, this function will always
  -- * block until it can lock the mutex, and return with it locked.
  -- *
  -- * \param rwlock the read/write lock to lock.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockRWLockForWriting
  -- * \sa SDL_TryLockRWLockForReading
  -- * \sa SDL_UnlockRWLock
  --  

   procedure SDL_LockRWLockForReading (rwlock : access SDL_RWLock)  -- /usr/local/include/SDL3/SDL_mutex.h:506
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockRWLockForReading";

  --*
  -- * Lock the read/write lock for _write_ operations.
  -- *
  -- * This will block until the rwlock is available, which is to say it is not
  -- * locked for reading or writing by any other thread. Only one thread may hold
  -- * the lock when it requests write access; all other threads, whether they
  -- * also want to write or only want read-only access, must wait until the
  -- * writer thread has released the lock.
  -- *
  -- * It is illegal for the owning thread to lock an already-locked rwlock for
  -- * writing (read-only may be locked recursively, writing can not). Doing so
  -- * results in undefined behavior.
  -- *
  -- * It is illegal to request a write lock from a thread that already holds a
  -- * read-only lock. Doing so results in undefined behavior. Unlock the
  -- * read-only lock before requesting a write lock.
  -- *
  -- * This function does not fail; if rwlock is NULL, it will return immediately
  -- * having locked nothing. If the rwlock is valid, this function will always
  -- * block until it can lock the mutex, and return with it locked.
  -- *
  -- * \param rwlock the read/write lock to lock.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockRWLockForReading
  -- * \sa SDL_TryLockRWLockForWriting
  -- * \sa SDL_UnlockRWLock
  --  

   procedure SDL_LockRWLockForWriting (rwlock : access SDL_RWLock)  -- /usr/local/include/SDL3/SDL_mutex.h:537
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockRWLockForWriting";

  --*
  -- * Try to lock a read/write lock _for reading_ without blocking.
  -- *
  -- * This works just like SDL_LockRWLockForReading(), but if the rwlock is not
  -- * available, then this function returns false immediately.
  -- *
  -- * This technique is useful if you need access to a resource but don't want to
  -- * wait for it, and will return to it to try again later.
  -- *
  -- * Trying to lock for read-only access can succeed if other threads are
  -- * holding read-only locks, as this won't prevent access.
  -- *
  -- * This function returns true if passed a NULL rwlock.
  -- *
  -- * \param rwlock the rwlock to try to lock.
  -- * \returns true on success, false if the lock would block.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockRWLockForReading
  -- * \sa SDL_TryLockRWLockForWriting
  -- * \sa SDL_UnlockRWLock
  --  

   function SDL_TryLockRWLockForReading (rwlock : access SDL_RWLock) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:562
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TryLockRWLockForReading";

  --*
  -- * Try to lock a read/write lock _for writing_ without blocking.
  -- *
  -- * This works just like SDL_LockRWLockForWriting(), but if the rwlock is not
  -- * available, then this function returns false immediately.
  -- *
  -- * This technique is useful if you need exclusive access to a resource but
  -- * don't want to wait for it, and will return to it to try again later.
  -- *
  -- * It is illegal for the owning thread to lock an already-locked rwlock for
  -- * writing (read-only may be locked recursively, writing can not). Doing so
  -- * results in undefined behavior.
  -- *
  -- * It is illegal to request a write lock from a thread that already holds a
  -- * read-only lock. Doing so results in undefined behavior. Unlock the
  -- * read-only lock before requesting a write lock.
  -- *
  -- * This function returns true if passed a NULL rwlock.
  -- *
  -- * \param rwlock the rwlock to try to lock.
  -- * \returns true on success, false if the lock would block.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockRWLockForWriting
  -- * \sa SDL_TryLockRWLockForReading
  -- * \sa SDL_UnlockRWLock
  --  

   function SDL_TryLockRWLockForWriting (rwlock : access SDL_RWLock) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:592
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TryLockRWLockForWriting";

  --*
  -- * Unlock the read/write lock.
  -- *
  -- * Use this function to unlock the rwlock, whether it was locked for read-only
  -- * or write operations.
  -- *
  -- * It is legal for the owning thread to lock an already-locked read-only lock.
  -- * It must unlock it the same number of times before it is actually made
  -- * available for other threads in the system (this is known as a "recursive
  -- * rwlock").
  -- *
  -- * It is illegal to unlock a rwlock that has not been locked by the current
  -- * thread, and doing so results in undefined behavior.
  -- *
  -- * \param rwlock the rwlock to unlock.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockRWLockForReading
  -- * \sa SDL_LockRWLockForWriting
  -- * \sa SDL_TryLockRWLockForReading
  -- * \sa SDL_TryLockRWLockForWriting
  --  

   procedure SDL_UnlockRWLock (rwlock : access SDL_RWLock)  -- /usr/local/include/SDL3/SDL_mutex.h:617
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockRWLock";

  --*
  -- * Destroy a read/write lock created with SDL_CreateRWLock().
  -- *
  -- * This function must be called on any read/write lock that is no longer
  -- * needed. Failure to destroy a rwlock will result in a system memory or
  -- * resource leak. While it is safe to destroy a rwlock that is _unlocked_, it
  -- * is not safe to attempt to destroy a locked rwlock, and may result in
  -- * undefined behavior depending on the platform.
  -- *
  -- * \param rwlock the rwlock to destroy.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRWLock
  --  

   procedure SDL_DestroyRWLock (rwlock : access SDL_RWLock)  -- /usr/local/include/SDL3/SDL_mutex.h:634
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyRWLock";

  -- @}  
  -- Read/write lock functions  
  --*
  -- *  \name Semaphore functions
  --  

  -- @{  
  --*
  -- * A means to manage access to a resource, by count, between threads.
  -- *
  -- * Semaphores (specifically, "counting semaphores"), let X number of threads
  -- * request access at the same time, each thread granted access decrementing a
  -- * counter. When the counter reaches zero, future requests block until a prior
  -- * thread releases their request, incrementing the counter again.
  -- *
  -- * Wikipedia has a thorough explanation of the concept:
  -- *
  -- * https://en.wikipedia.org/wiki/Semaphore_(programming)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Semaphore is null record;   -- incomplete struct

  --*
  -- * Create a semaphore.
  -- *
  -- * This function creates a new semaphore and initializes it with the value
  -- * `initial_value`. Each wait operation on the semaphore will atomically
  -- * decrement the semaphore value and potentially block if the semaphore value
  -- * is 0. Each post operation will atomically increment the semaphore value and
  -- * wake waiting threads and allow them to retry the wait operation.
  -- *
  -- * \param initial_value the starting value of the semaphore.
  -- * \returns a new semaphore or NULL on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroySemaphore
  -- * \sa SDL_SignalSemaphore
  -- * \sa SDL_TryWaitSemaphore
  -- * \sa SDL_GetSemaphoreValue
  -- * \sa SDL_WaitSemaphore
  -- * \sa SDL_WaitSemaphoreTimeout
  --  

   function SDL_CreateSemaphore (initial_value : SDL3_SDL_stdinc_h.Uint32) return access SDL_Semaphore  -- /usr/local/include/SDL3/SDL_mutex.h:682
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSemaphore";

  --*
  -- * Destroy a semaphore.
  -- *
  -- * It is not safe to destroy a semaphore if there are threads currently
  -- * waiting on it.
  -- *
  -- * \param sem the semaphore to destroy.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateSemaphore
  --  

   procedure SDL_DestroySemaphore (sem : access SDL_Semaphore)  -- /usr/local/include/SDL3/SDL_mutex.h:696
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroySemaphore";

  --*
  -- * Wait until a semaphore has a positive value and then decrements it.
  -- *
  -- * This function suspends the calling thread until the semaphore pointed to by
  -- * `sem` has a positive value, and then atomically decrement the semaphore
  -- * value.
  -- *
  -- * This function is the equivalent of calling SDL_WaitSemaphoreTimeout() with
  -- * a time length of -1.
  -- *
  -- * \param sem the semaphore wait on.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SignalSemaphore
  -- * \sa SDL_TryWaitSemaphore
  -- * \sa SDL_WaitSemaphoreTimeout
  --  

   procedure SDL_WaitSemaphore (sem : access SDL_Semaphore)  -- /usr/local/include/SDL3/SDL_mutex.h:716
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitSemaphore";

  --*
  -- * See if a semaphore has a positive value and decrement it if it does.
  -- *
  -- * This function checks to see if the semaphore pointed to by `sem` has a
  -- * positive value and atomically decrements the semaphore value if it does. If
  -- * the semaphore doesn't have a positive value, the function immediately
  -- * returns false.
  -- *
  -- * \param sem the semaphore to wait on.
  -- * \returns true if the wait succeeds, false if the wait would block.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SignalSemaphore
  -- * \sa SDL_WaitSemaphore
  -- * \sa SDL_WaitSemaphoreTimeout
  --  

   function SDL_TryWaitSemaphore (sem : access SDL_Semaphore) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:735
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TryWaitSemaphore";

  --*
  -- * Wait until a semaphore has a positive value and then decrements it.
  -- *
  -- * This function suspends the calling thread until either the semaphore
  -- * pointed to by `sem` has a positive value or the specified time has elapsed.
  -- * If the call is successful it will atomically decrement the semaphore value.
  -- *
  -- * \param sem the semaphore to wait on.
  -- * \param timeoutMS the length of the timeout, in milliseconds, or -1 to wait
  -- *                  indefinitely.
  -- * \returns true if the wait succeeds or false if the wait times out.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SignalSemaphore
  -- * \sa SDL_TryWaitSemaphore
  -- * \sa SDL_WaitSemaphore
  --  

   function SDL_WaitSemaphoreTimeout (sem : access SDL_Semaphore; timeoutMS : SDL3_SDL_stdinc_h.Sint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:755
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitSemaphoreTimeout";

  --*
  -- * Atomically increment a semaphore's value and wake waiting threads.
  -- *
  -- * \param sem the semaphore to increment.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_TryWaitSemaphore
  -- * \sa SDL_WaitSemaphore
  -- * \sa SDL_WaitSemaphoreTimeout
  --  

   procedure SDL_SignalSemaphore (sem : access SDL_Semaphore)  -- /usr/local/include/SDL3/SDL_mutex.h:768
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SignalSemaphore";

  --*
  -- * Get the current value of a semaphore.
  -- *
  -- * \param sem the semaphore to query.
  -- * \returns the current value of the semaphore.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetSemaphoreValue (sem : access SDL_Semaphore) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_mutex.h:778
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSemaphoreValue";

  -- @}  
  -- Semaphore functions  
  --*
  -- *  \name Condition variable functions
  --  

  -- @{  
  --*
  -- * A means to block multiple threads until a condition is satisfied.
  -- *
  -- * Condition variables, paired with an SDL_Mutex, let an app halt multiple
  -- * threads until a condition has occurred, at which time the app can release
  -- * one or all waiting threads.
  -- *
  -- * Wikipedia has a thorough explanation of the concept:
  -- *
  -- * https://en.wikipedia.org/wiki/Condition_variable
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Condition is null record;   -- incomplete struct

  --*
  -- * Create a condition variable.
  -- *
  -- * \returns a new condition variable or NULL on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BroadcastCondition
  -- * \sa SDL_SignalCondition
  -- * \sa SDL_WaitCondition
  -- * \sa SDL_WaitConditionTimeout
  -- * \sa SDL_DestroyCondition
  --  

   function SDL_CreateCondition return access SDL_Condition  -- /usr/local/include/SDL3/SDL_mutex.h:817
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateCondition";

  --*
  -- * Destroy a condition variable.
  -- *
  -- * \param cond the condition variable to destroy.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateCondition
  --  

   procedure SDL_DestroyCondition (cond : access SDL_Condition)  -- /usr/local/include/SDL3/SDL_mutex.h:828
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyCondition";

  --*
  -- * Restart one of the threads that are waiting on the condition variable.
  -- *
  -- * \param cond the condition variable to signal.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BroadcastCondition
  -- * \sa SDL_WaitCondition
  -- * \sa SDL_WaitConditionTimeout
  --  

   procedure SDL_SignalCondition (cond : access SDL_Condition)  -- /usr/local/include/SDL3/SDL_mutex.h:843
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SignalCondition";

  --*
  -- * Restart all threads that are waiting on the condition variable.
  -- *
  -- * \param cond the condition variable to signal.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SignalCondition
  -- * \sa SDL_WaitCondition
  -- * \sa SDL_WaitConditionTimeout
  --  

   procedure SDL_BroadcastCondition (cond : access SDL_Condition)  -- /usr/local/include/SDL3/SDL_mutex.h:858
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BroadcastCondition";

  --*
  -- * Wait until a condition variable is signaled.
  -- *
  -- * This function unlocks the specified `mutex` and waits for another thread to
  -- * call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
  -- * variable `cond`. Once the condition variable is signaled, the mutex is
  -- * re-locked and the function returns.
  -- *
  -- * The mutex must be locked before calling this function. Locking the mutex
  -- * recursively (more than once) is not supported and leads to undefined
  -- * behavior.
  -- *
  -- * This function is the equivalent of calling SDL_WaitConditionTimeout() with
  -- * a time length of -1.
  -- *
  -- * \param cond the condition variable to wait on.
  -- * \param mutex the mutex used to coordinate thread access.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BroadcastCondition
  -- * \sa SDL_SignalCondition
  -- * \sa SDL_WaitConditionTimeout
  --  

   procedure SDL_WaitCondition (cond : access SDL_Condition; mutex : access SDL_Mutex)  -- /usr/local/include/SDL3/SDL_mutex.h:886
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitCondition";

  --*
  -- * Wait until a condition variable is signaled or a certain time has passed.
  -- *
  -- * This function unlocks the specified `mutex` and waits for another thread to
  -- * call SDL_SignalCondition() or SDL_BroadcastCondition() on the condition
  -- * variable `cond`, or for the specified time to elapse. Once the condition
  -- * variable is signaled or the time elapsed, the mutex is re-locked and the
  -- * function returns.
  -- *
  -- * The mutex must be locked before calling this function. Locking the mutex
  -- * recursively (more than once) is not supported and leads to undefined
  -- * behavior.
  -- *
  -- * \param cond the condition variable to wait on.
  -- * \param mutex the mutex used to coordinate thread access.
  -- * \param timeoutMS the maximum time to wait, in milliseconds, or -1 to wait
  -- *                  indefinitely.
  -- * \returns true if the condition variable is signaled, false if the condition
  -- *          is not signaled in the allotted time.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BroadcastCondition
  -- * \sa SDL_SignalCondition
  -- * \sa SDL_WaitCondition
  --  

   function SDL_WaitConditionTimeout
     (cond : access SDL_Condition;
      mutex : access SDL_Mutex;
      timeoutMS : SDL3_SDL_stdinc_h.Sint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:916
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitConditionTimeout";

  -- @}  
  -- Condition variable functions  
  --*
  -- *  \name Thread-safe initialization state functions
  --  

  -- @{  
  --*
  -- * The current status of an SDL_InitState structure.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_InitStatus is 
     (SDL_INIT_STATUS_UNINITIALIZED,
      SDL_INIT_STATUS_INITIALIZING,
      SDL_INIT_STATUS_INITIALIZED,
      SDL_INIT_STATUS_UNINITIALIZING)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_mutex.h:931

  --*
  -- * A structure used for thread-safe initialization and shutdown.
  -- *
  -- * Here is an example of using this:
  -- *
  -- * ```c
  -- *    static SDL_InitState init;
  -- *
  -- *    bool InitSystem(void)
  -- *    {
  -- *        if (!SDL_ShouldInit(&init)) {
  -- *            // The system is initialized
  -- *            return true;
  -- *        }
  -- *
  -- *        // At this point, you should not leave this function without calling SDL_SetInitialized()
  -- *
  -- *        bool initialized = DoInitTasks();
  -- *        SDL_SetInitialized(&init, initialized);
  -- *        return initialized;
  -- *    }
  -- *
  -- *    bool UseSubsystem(void)
  -- *    {
  -- *        if (SDL_ShouldInit(&init)) {
  -- *            // Error, the subsystem isn't initialized
  -- *            SDL_SetInitialized(&init, false);
  -- *            return false;
  -- *        }
  -- *
  -- *        // Do work using the initialized subsystem
  -- *
  -- *        return true;
  -- *    }
  -- *
  -- *    void QuitSystem(void)
  -- *    {
  -- *        if (!SDL_ShouldQuit(&init)) {
  -- *            // The system is not initialized
  -- *            return;
  -- *        }
  -- *
  -- *        // At this point, you should not leave this function without calling SDL_SetInitialized()
  -- *
  -- *        DoQuitTasks();
  -- *        SDL_SetInitialized(&init, false);
  -- *    }
  -- * ```
  -- *
  -- * Note that this doesn't protect any resources created during initialization,
  -- * or guarantee that nobody is using those resources during cleanup. You
  -- * should use other mechanisms to protect those, if that's a concern for your
  -- * code.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_InitState is record
      status : aliased SDL3_SDL_atomic_h.SDL_AtomicInt;  -- /usr/local/include/SDL3/SDL_mutex.h:997
      thread : aliased SDL3_SDL_thread_h.SDL_ThreadID;  -- /usr/local/include/SDL3/SDL_mutex.h:998
      reserved : System.Address;  -- /usr/local/include/SDL3/SDL_mutex.h:999
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_mutex.h:995

  --*
  -- * Return whether initialization should be done.
  -- *
  -- * This function checks the passed in state and if initialization should be
  -- * done, sets the status to `SDL_INIT_STATUS_INITIALIZING` and returns true.
  -- * If another thread is already modifying this state, it will wait until
  -- * that's done before returning.
  -- *
  -- * If this function returns true, the calling code must call
  -- * SDL_SetInitialized() to complete the initialization.
  -- *
  -- * \param state the initialization state to check.
  -- * \returns true if initialization needs to be done, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetInitialized
  -- * \sa SDL_ShouldQuit
  --  

   function SDL_ShouldInit (state : access SDL_InitState) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:1023
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShouldInit";

  --*
  -- * Return whether cleanup should be done.
  -- *
  -- * This function checks the passed in state and if cleanup should be done,
  -- * sets the status to `SDL_INIT_STATUS_UNINITIALIZING` and returns true.
  -- *
  -- * If this function returns true, the calling code must call
  -- * SDL_SetInitialized() to complete the cleanup.
  -- *
  -- * \param state the initialization state to check.
  -- * \returns true if cleanup needs to be done, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetInitialized
  -- * \sa SDL_ShouldInit
  --  

   function SDL_ShouldQuit (state : access SDL_InitState) return Extensions.bool  -- /usr/local/include/SDL3/SDL_mutex.h:1044
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShouldQuit";

  --*
  -- * Finish an initialization state transition.
  -- *
  -- * This function sets the status of the passed in state to
  -- * `SDL_INIT_STATUS_INITIALIZED` or `SDL_INIT_STATUS_UNINITIALIZED` and allows
  -- * any threads waiting for the status to proceed.
  -- *
  -- * \param state the initialization state to check.
  -- * \param initialized the new initialization state.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ShouldInit
  -- * \sa SDL_ShouldQuit
  --  

   procedure SDL_SetInitialized (state : access SDL_InitState; initialized : Extensions.bool)  -- /usr/local/include/SDL3/SDL_mutex.h:1063
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetInitialized";

  -- @}  
  -- Thread-safe initialization state functions  
  -- Ends C function definitions when using C++  
end SDL3_SDL_mutex_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
