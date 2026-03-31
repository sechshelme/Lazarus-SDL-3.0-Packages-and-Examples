pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with SDL3_SDL_stdinc_h;

package SDL3_SDL_time_h is

  --Simple DirectMedia Layer
  --Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
  --This software is provided 'as-is', without any express or implied
  --warranty.  In no event will the authors be held liable for any damages
  --arising from the use of this software.
  --Permission is granted to anyone to use this software for any purpose,
  --including commercial applications, and to alter it and redistribute it
  --freely, subject to the following restrictions:
  --1. The origin of this software must not be misrepresented; you must not
  --   claim that you wrote the original software. If you use this software
  --   in a product, an acknowledgment in the product documentation would be
  --   appreciated but is not required.
  --2. Altered source versions must be plainly marked as such, and must not be
  --   misrepresented as being the original software.
  --3. This notice may not be removed or altered from any source distribution.
  -- 

  --*
  -- * # CategoryTime
  -- *
  -- * SDL realtime clock and date/time routines.
  -- *
  -- * There are two data types that are used in this category: SDL_Time, which
  -- * represents the nanoseconds since a specific moment (an "epoch"), and
  -- * SDL_DateTime, which breaks time down into human-understandable components:
  -- * years, months, days, hours, etc.
  -- *
  -- * Much of the functionality is involved in converting those two types to
  -- * other useful forms.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * A structure holding a calendar date and time broken down into its
  -- * components.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< Year  
   type SDL_DateTime is record
      year : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:56
      month : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:57
      day : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:58
      hour : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:59
      minute : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:60
      second : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:61
      nanosecond : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:62
      day_of_week : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:63
      utc_offset : aliased int;  -- /usr/local/include/SDL3/SDL_time.h:64
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_time.h:54

  --*< Month [01-12]  
  --*< Day of the month [01-31]  
  --*< Hour [0-23]  
  --*< Minute [0-59]  
  --*< Seconds [0-60]  
  --*< Nanoseconds [0-999999999]  
  --*< Day of the week [0-6] (0 being Sunday)  
  --*< Seconds east of UTC  
  --*
  -- * The preferred date format of the current system locale.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetDateTimeLocalePreferences
  --  

   type SDL_DateFormat is 
     (SDL_DATE_FORMAT_YYYYMMDD,
      SDL_DATE_FORMAT_DDMMYYYY,
      SDL_DATE_FORMAT_MMDDYYYY)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_time.h:74

  --*< Year/Month/Day  
  --*< Day/Month/Year  
  --*< Month/Day/Year  
  --*
  -- * The preferred time format of the current system locale.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetDateTimeLocalePreferences
  --  

   type SDL_TimeFormat is 
     (SDL_TIME_FORMAT_24HR,
      SDL_TIME_FORMAT_12HR)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_time.h:88

  --*< 24 hour time  
  --*< 12 hour time  
  --*
  -- * Gets the current preferred date and time format for the system locale.
  -- *
  -- * This might be a "slow" call that has to query the operating system. It's
  -- * best to ask for this once and save the results. However, the preferred
  -- * formats can change, usually because the user has changed a system
  -- * preference outside of your program.
  -- *
  -- * \param dateFormat a pointer to the SDL_DateFormat to hold the returned date
  -- *                   format, may be NULL.
  -- * \param timeFormat a pointer to the SDL_TimeFormat to hold the returned time
  -- *                   format, may be NULL.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetDateTimeLocalePreferences (dateFormat : access SDL_DateFormat; timeFormat : access SDL_TimeFormat) return Extensions.bool  -- /usr/local/include/SDL3/SDL_time.h:111
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetDateTimeLocalePreferences";

  --*
  -- * Gets the current value of the system realtime clock in nanoseconds since
  -- * Jan 1, 1970 in Universal Coordinated Time (UTC).
  -- *
  -- * \param ticks the SDL_Time to hold the returned tick count.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetCurrentTime (ticks : access SDL3_SDL_stdinc_h.SDL_Time) return Extensions.bool  -- /usr/local/include/SDL3/SDL_time.h:123
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetCurrentTime";

  --*
  -- * Converts an SDL_Time in nanoseconds since the epoch to a calendar time in
  -- * the SDL_DateTime format.
  -- *
  -- * \param ticks the SDL_Time to be converted.
  -- * \param dt the resulting SDL_DateTime.
  -- * \param localTime the resulting SDL_DateTime will be expressed in local time
  -- *                  if true, otherwise it will be in Universal Coordinated
  -- *                  Time (UTC).
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_TimeToDateTime
     (ticks : SDL3_SDL_stdinc_h.SDL_Time;
      dt : access SDL_DateTime;
      localTime : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_time.h:139
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TimeToDateTime";

  --*
  -- * Converts a calendar time to an SDL_Time in nanoseconds since the epoch.
  -- *
  -- * This function ignores the day_of_week member of the SDL_DateTime struct, so
  -- * it may remain unset.
  -- *
  -- * \param dt the source SDL_DateTime.
  -- * \param ticks the resulting SDL_Time.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_DateTimeToTime (dt : access constant SDL_DateTime; ticks : access SDL3_SDL_stdinc_h.SDL_Time) return Extensions.bool  -- /usr/local/include/SDL3/SDL_time.h:154
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DateTimeToTime";

  --*
  -- * Converts an SDL time into a Windows FILETIME (100-nanosecond intervals
  -- * since January 1, 1601).
  -- *
  -- * This function fills in the two 32-bit values of the FILETIME structure.
  -- *
  -- * \param ticks the time to convert.
  -- * \param dwLowDateTime a pointer filled in with the low portion of the
  -- *                      Windows FILETIME value.
  -- * \param dwHighDateTime a pointer filled in with the high portion of the
  -- *                       Windows FILETIME value.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_TimeToWindows
     (ticks : SDL3_SDL_stdinc_h.SDL_Time;
      dwLowDateTime : access SDL3_SDL_stdinc_h.Uint32;
      dwHighDateTime : access SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_time.h:170
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TimeToWindows";

  --*
  -- * Converts a Windows FILETIME (100-nanosecond intervals since January 1,
  -- * 1601) to an SDL time.
  -- *
  -- * This function takes the two 32-bit values of the FILETIME structure as
  -- * parameters.
  -- *
  -- * \param dwLowDateTime the low portion of the Windows FILETIME value.
  -- * \param dwHighDateTime the high portion of the Windows FILETIME value.
  -- * \returns the converted SDL time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_TimeFromWindows (dwLowDateTime : SDL3_SDL_stdinc_h.Uint32; dwHighDateTime : SDL3_SDL_stdinc_h.Uint32) return SDL3_SDL_stdinc_h.SDL_Time  -- /usr/local/include/SDL3/SDL_time.h:185
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_TimeFromWindows";

  --*
  -- * Get the number of days in a month for a given year.
  -- *
  -- * \param year the year.
  -- * \param month the month [1-12].
  -- * \returns the number of days in the requested month or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetDaysInMonth (year : int; month : int) return int  -- /usr/local/include/SDL3/SDL_time.h:197
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetDaysInMonth";

  --*
  -- * Get the day of year for a calendar date.
  -- *
  -- * \param year the year component of the date.
  -- * \param month the month component of the date.
  -- * \param day the day component of the date.
  -- * \returns the day of year [0-365] if the date is valid or -1 on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetDayOfYear
     (year : int;
      month : int;
      day : int) return int  -- /usr/local/include/SDL3/SDL_time.h:210
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetDayOfYear";

  --*
  -- * Get the day of week for a calendar date.
  -- *
  -- * \param year the year component of the date.
  -- * \param month the month component of the date.
  -- * \param day the day component of the date.
  -- * \returns a value between 0 and 6 (0 being Sunday) if the date is valid or
  -- *          -1 on failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetDayOfWeek
     (year : int;
      month : int;
      day : int) return int  -- /usr/local/include/SDL3/SDL_time.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetDayOfWeek";

  -- Ends C function definitions when using C++  
end SDL3_SDL_time_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
