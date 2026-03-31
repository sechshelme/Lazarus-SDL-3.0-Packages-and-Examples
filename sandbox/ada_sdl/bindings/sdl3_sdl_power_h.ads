pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package SDL3_SDL_power_h is

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
  -- * # CategoryPower
  -- *
  -- * SDL power management routines.
  -- *
  -- * There is a single function in this category: SDL_GetPowerInfo().
  -- *
  -- * This function is useful for games on the go. This allows an app to know if
  -- * it's running on a draining battery, which can be useful if the app wants to
  -- * reduce processing, or perhaps framerate, to extend the duration of the
  -- * battery's charge. Perhaps the app just wants to show a battery meter when
  -- * fullscreen, or alert the user when the power is getting extremely low, so
  -- * they can save their game.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * The basic state for the system's power supply.
  -- *
  -- * These are results returned by SDL_GetPowerInfo().
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_PowerState is int;
   SDL_PowerState_SDL_POWERSTATE_ERROR : constant SDL_PowerState := -1;
   SDL_PowerState_SDL_POWERSTATE_UNKNOWN : constant SDL_PowerState := 0;
   SDL_PowerState_SDL_POWERSTATE_ON_BATTERY : constant SDL_PowerState := 1;
   SDL_PowerState_SDL_POWERSTATE_NO_BATTERY : constant SDL_PowerState := 2;
   SDL_PowerState_SDL_POWERSTATE_CHARGING : constant SDL_PowerState := 3;
   SDL_PowerState_SDL_POWERSTATE_CHARGED : constant SDL_PowerState := 4;  -- /usr/local/include/SDL3/SDL_power.h:56

  --*< error determining power status  
  --*< cannot determine power status  
  --*< Not plugged in, running on the battery  
  --*< Plugged in, no battery available  
  --*< Plugged in, charging battery  
  --*< Plugged in, battery charged  
  --*
  -- * Get the current power supply details.
  -- *
  -- * You should never take a battery status as absolute truth. Batteries
  -- * (especially failing batteries) are delicate hardware, and the values
  -- * reported here are best estimates based on what that hardware reports. It's
  -- * not uncommon for older batteries to lose stored power much faster than it
  -- * reports, or completely drain when reporting it has 20 percent left, etc.
  -- *
  -- * Battery status can change at any time; if you are concerned with power
  -- * state, you should call this function frequently, and perhaps ignore changes
  -- * until they seem to be stable for a few seconds.
  -- *
  -- * It's possible a platform can only report battery percentage or time left
  -- * but not both.
  -- *
  -- * On some platforms, retrieving power supply details might be expensive. If
  -- * you want to display continuous status you could call this function every
  -- * minute or so.
  -- *
  -- * \param seconds a pointer filled in with the seconds of battery life left,
  -- *                or NULL to ignore. This will be filled in with -1 if we
  -- *                can't determine a value or there is no battery.
  -- * \param percent a pointer filled in with the percentage of battery life
  -- *                left, between 0 and 100, or NULL to ignore. This will be
  -- *                filled in with -1 when we can't determine a value or there
  -- *                is no battery.
  -- * \returns the current battery state or `SDL_POWERSTATE_ERROR` on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetPowerInfo (seconds : access int; percent : access int) return SDL_PowerState  -- /usr/local/include/SDL3/SDL_power.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPowerInfo";

  -- Ends C function definitions when using C++  
end SDL3_SDL_power_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
