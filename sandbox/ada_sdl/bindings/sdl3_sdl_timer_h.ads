pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with System;
with Interfaces.C.Extensions;

package SDL3_SDL_timer_h is

   SDL_MS_PER_SECOND : constant := 1000;  --  /usr/local/include/SDL3/SDL_timer.h:62

   SDL_US_PER_SECOND : constant := 1000000;  --  /usr/local/include/SDL3/SDL_timer.h:71

   SDL_NS_PER_SECOND : constant := 1000000000;  --  /usr/local/include/SDL3/SDL_timer.h:80

   SDL_NS_PER_MS : constant := 1000000;  --  /usr/local/include/SDL3/SDL_timer.h:89

   SDL_NS_PER_US : constant := 1000;  --  /usr/local/include/SDL3/SDL_timer.h:98
   --  arg-macro: function SDL_SECONDS_TO_NS (S)
   --    return ((Uint64)(S)) * SDL_NS_PER_SECOND;
   --  arg-macro: function SDL_NS_TO_SECONDS (NS)
   --    return (NS) / SDL_NS_PER_SECOND;
   --  arg-macro: function SDL_MS_TO_NS (MS)
   --    return ((Uint64)(MS)) * SDL_NS_PER_MS;
   --  arg-macro: function SDL_NS_TO_MS (NS)
   --    return (NS) / SDL_NS_PER_MS;
   --  arg-macro: function SDL_US_TO_NS (US)
   --    return ((Uint64)(US)) * SDL_NS_PER_US;
   --  arg-macro: function SDL_NS_TO_US (NS)
   --    return (NS) / SDL_NS_PER_US;

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
  -- * # CategoryTimer
  -- *
  -- * SDL provides time management functionality. It is useful for dealing with
  -- * (usually) small durations of time.
  -- *
  -- * This is not to be confused with _calendar time_ management, which is
  -- * provided by [CategoryTime](CategoryTime).
  -- *
  -- * This category covers measuring time elapsed (SDL_GetTicks(),
  -- * SDL_GetPerformanceCounter()), putting a thread to sleep for a certain
  -- * amount of time (SDL_Delay(), SDL_DelayNS(), SDL_DelayPrecise()), and firing
  -- * a callback function after a certain amount of time has elapsed
  -- * (SDL_AddTimer(), etc).
  -- *
  -- * There are also useful macros to convert between time units, like
  -- * SDL_SECONDS_TO_NS() and such.
  --  

  -- Set up for C function definitions, even when using C++  
  -- SDL time constants  
  --*
  -- * Number of milliseconds in a second.
  -- *
  -- * This is always 1000.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Number of microseconds in a second.
  -- *
  -- * This is always 1000000.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Number of nanoseconds in a second.
  -- *
  -- * This is always 1000000000.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Number of nanoseconds in a millisecond.
  -- *
  -- * This is always 1000000.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Number of nanoseconds in a microsecond.
  -- *
  -- * This is always 1000.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert seconds to nanoseconds.
  -- *
  -- * This only converts whole numbers, not fractional seconds.
  -- *
  -- * \param S the number of seconds to convert.
  -- * \returns S, expressed in nanoseconds.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert nanoseconds to seconds.
  -- *
  -- * This performs a division, so the results can be dramatically different if
  -- * `NS` is an integer or floating point value.
  -- *
  -- * \param NS the number of nanoseconds to convert.
  -- * \returns NS, expressed in seconds.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert milliseconds to nanoseconds.
  -- *
  -- * This only converts whole numbers, not fractional milliseconds.
  -- *
  -- * \param MS the number of milliseconds to convert.
  -- * \returns MS, expressed in nanoseconds.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert nanoseconds to milliseconds.
  -- *
  -- * This performs a division, so the results can be dramatically different if
  -- * `NS` is an integer or floating point value.
  -- *
  -- * \param NS the number of nanoseconds to convert.
  -- * \returns NS, expressed in milliseconds.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert microseconds to nanoseconds.
  -- *
  -- * This only converts whole numbers, not fractional microseconds.
  -- *
  -- * \param US the number of microseconds to convert.
  -- * \returns US, expressed in nanoseconds.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Convert nanoseconds to microseconds.
  -- *
  -- * This performs a division, so the results can be dramatically different if
  -- * `NS` is an integer or floating point value.
  -- *
  -- * \param NS the number of nanoseconds to convert.
  -- * \returns NS, expressed in microseconds.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Get the number of milliseconds that have elapsed since the SDL library
  -- * initialization.
  -- *
  -- * \returns an unsigned 64‑bit integer that represents the number of
  -- *          milliseconds that have elapsed since the SDL library was
  -- *          initialized (typically via a call to SDL_Init).
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTicksNS
  --  

   function SDL_GetTicks return SDL3_SDL_stdinc_h.Uint64  -- /usr/local/include/SDL3/SDL_timer.h:201
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTicks";

  --*
  -- * Get the number of nanoseconds since SDL library initialization.
  -- *
  -- * \returns an unsigned 64-bit value representing the number of nanoseconds
  -- *          since the SDL library initialized.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTicksNS return SDL3_SDL_stdinc_h.Uint64  -- /usr/local/include/SDL3/SDL_timer.h:213
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTicksNS";

  --*
  -- * Get the current value of the high resolution counter.
  -- *
  -- * This function is typically used for profiling.
  -- *
  -- * The counter values are only meaningful relative to each other. Differences
  -- * between values can be converted to times by using
  -- * SDL_GetPerformanceFrequency().
  -- *
  -- * \returns the current counter value.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPerformanceFrequency
  --  

   function SDL_GetPerformanceCounter return SDL3_SDL_stdinc_h.Uint64  -- /usr/local/include/SDL3/SDL_timer.h:232
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPerformanceCounter";

  --*
  -- * Get the count per second of the high resolution counter.
  -- *
  -- * \returns a platform-specific count per second.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPerformanceCounter
  --  

   function SDL_GetPerformanceFrequency return SDL3_SDL_stdinc_h.Uint64  -- /usr/local/include/SDL3/SDL_timer.h:245
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPerformanceFrequency";

  --*
  -- * Wait a specified number of milliseconds before returning.
  -- *
  -- * This function waits a specified number of milliseconds before returning. It
  -- * waits at least the specified time, but possibly longer due to OS
  -- * scheduling.
  -- *
  -- * \param ms the number of milliseconds to delay.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DelayNS
  -- * \sa SDL_DelayPrecise
  --  

   procedure SDL_Delay (ms : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_timer.h:263
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_Delay";

  --*
  -- * Wait a specified number of nanoseconds before returning.
  -- *
  -- * This function waits a specified number of nanoseconds before returning. It
  -- * waits at least the specified time, but possibly longer due to OS
  -- * scheduling.
  -- *
  -- * \param ns the number of nanoseconds to delay.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_Delay
  -- * \sa SDL_DelayPrecise
  --  

   procedure SDL_DelayNS (ns : SDL3_SDL_stdinc_h.Uint64)  -- /usr/local/include/SDL3/SDL_timer.h:281
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DelayNS";

  --*
  -- * Wait a specified number of nanoseconds before returning.
  -- *
  -- * This function waits a specified number of nanoseconds before returning. It
  -- * will attempt to wait as close to the requested time as possible, busy
  -- * waiting if necessary, but could return later due to OS scheduling.
  -- *
  -- * \param ns the number of nanoseconds to delay.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_Delay
  -- * \sa SDL_DelayNS
  --  

   procedure SDL_DelayPrecise (ns : SDL3_SDL_stdinc_h.Uint64)  -- /usr/local/include/SDL3/SDL_timer.h:299
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DelayPrecise";

  --*
  -- * Definition of the timer ID type.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_TimerID is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_timer.h:306

  --*
  -- * Function prototype for the millisecond timer callback function.
  -- *
  -- * The callback function is passed the current timer interval and returns the
  -- * next timer interval, in milliseconds. If the returned value is the same as
  -- * the one passed in, the periodic alarm continues, otherwise a new alarm is
  -- * scheduled. If the callback returns 0, the periodic alarm is canceled and
  -- * will be removed.
  -- *
  -- * \param userdata an arbitrary pointer provided by the app through
  -- *                 SDL_AddTimer, for its own use.
  -- * \param timerID the current timer being processed.
  -- * \param interval the current callback time interval.
  -- * \returns the new callback time interval, or 0 to disable further runs of
  -- *          the callback.
  -- *
  -- * \threadsafety SDL may call this callback at any time from a background
  -- *               thread; the application is responsible for locking resources
  -- *               the callback touches that need to be protected.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddTimer
  --  

   type SDL_TimerCallback is access function
        (arg1 : System.Address;
         arg2 : SDL_TimerID;
         arg3 : SDL3_SDL_stdinc_h.Uint32) return SDL3_SDL_stdinc_h.Uint32
   with Convention => C;  -- /usr/local/include/SDL3/SDL_timer.h:332

  --*
  -- * Call a callback function at a future time.
  -- *
  -- * The callback function is passed the current timer interval and the user
  -- * supplied parameter from the SDL_AddTimer() call and should return the next
  -- * timer interval. If the value returned from the callback is 0, the timer is
  -- * canceled and will be removed.
  -- *
  -- * The callback is run on a separate thread, and for short timeouts can
  -- * potentially be called before this function returns.
  -- *
  -- * Timers take into account the amount of time it took to execute the
  -- * callback. For example, if the callback took 250 ms to execute and returned
  -- * 1000 (ms), the timer would only wait another 750 ms before its next
  -- * iteration.
  -- *
  -- * Timing may be inexact due to OS scheduling. Be sure to note the current
  -- * time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
  -- * callback needs to adjust for variances.
  -- *
  -- * \param interval the timer delay, in milliseconds, passed to `callback`.
  -- * \param callback the SDL_TimerCallback function to call when the specified
  -- *                 `interval` elapses.
  -- * \param userdata a pointer that is passed to `callback`.
  -- * \returns a timer ID or 0 on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddTimerNS
  -- * \sa SDL_RemoveTimer
  --  

   function SDL_AddTimer
     (interval : SDL3_SDL_stdinc_h.Uint32;
      callback : SDL_TimerCallback;
      userdata : System.Address) return SDL_TimerID  -- /usr/local/include/SDL3/SDL_timer.h:368
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddTimer";

  --*
  -- * Function prototype for the nanosecond timer callback function.
  -- *
  -- * The callback function is passed the current timer interval and returns the
  -- * next timer interval, in nanoseconds. If the returned value is the same as
  -- * the one passed in, the periodic alarm continues, otherwise a new alarm is
  -- * scheduled. If the callback returns 0, the periodic alarm is canceled and
  -- * will be removed.
  -- *
  -- * \param userdata an arbitrary pointer provided by the app through
  -- *                 SDL_AddTimer, for its own use.
  -- * \param timerID the current timer being processed.
  -- * \param interval the current callback time interval.
  -- * \returns the new callback time interval, or 0 to disable further runs of
  -- *          the callback.
  -- *
  -- * \threadsafety SDL may call this callback at any time from a background
  -- *               thread; the application is responsible for locking resources
  -- *               the callback touches that need to be protected.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddTimerNS
  --  

   type SDL_NSTimerCallback is access function
        (arg1 : System.Address;
         arg2 : SDL_TimerID;
         arg3 : SDL3_SDL_stdinc_h.Uint64) return SDL3_SDL_stdinc_h.Uint64
   with Convention => C;  -- /usr/local/include/SDL3/SDL_timer.h:394

  --*
  -- * Call a callback function at a future time.
  -- *
  -- * The callback function is passed the current timer interval and the user
  -- * supplied parameter from the SDL_AddTimerNS() call and should return the
  -- * next timer interval. If the value returned from the callback is 0, the
  -- * timer is canceled and will be removed.
  -- *
  -- * The callback is run on a separate thread, and for short timeouts can
  -- * potentially be called before this function returns.
  -- *
  -- * Timers take into account the amount of time it took to execute the
  -- * callback. For example, if the callback took 250 ns to execute and returned
  -- * 1000 (ns), the timer would only wait another 750 ns before its next
  -- * iteration.
  -- *
  -- * Timing may be inexact due to OS scheduling. Be sure to note the current
  -- * time with SDL_GetTicksNS() or SDL_GetPerformanceCounter() in case your
  -- * callback needs to adjust for variances.
  -- *
  -- * \param interval the timer delay, in nanoseconds, passed to `callback`.
  -- * \param callback the SDL_TimerCallback function to call when the specified
  -- *                 `interval` elapses.
  -- * \param userdata a pointer that is passed to `callback`.
  -- * \returns a timer ID or 0 on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddTimer
  -- * \sa SDL_RemoveTimer
  --  

   function SDL_AddTimerNS
     (interval : SDL3_SDL_stdinc_h.Uint64;
      callback : SDL_NSTimerCallback;
      userdata : System.Address) return SDL_TimerID  -- /usr/local/include/SDL3/SDL_timer.h:430
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddTimerNS";

  --*
  -- * Remove a timer created with SDL_AddTimer().
  -- *
  -- * \param id the ID of the timer to remove.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddTimer
  --  

   function SDL_RemoveTimer (id : SDL_TimerID) return Extensions.bool  -- /usr/local/include/SDL3/SDL_timer.h:445
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RemoveTimer";

  -- Ends C function definitions when using C++  
end SDL3_SDL_timer_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
