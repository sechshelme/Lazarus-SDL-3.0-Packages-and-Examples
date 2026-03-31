pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Strings;

package SDL3_SDL_guid_h is

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

  -- WIKI CATEGORY: GUID  
  --*
  -- * # CategoryGUID
  -- *
  -- * A GUID is a 128-bit value that represents something that is uniquely
  -- * identifiable by this value: "globally unique."
  -- *
  -- * SDL provides functions to convert a GUID to/from a string.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * An SDL_GUID is a 128-bit identifier for an input device that identifies
  -- * that device across runs of SDL programs on the same platform.
  -- *
  -- * If the device is detached and then re-attached to a different port, or if
  -- * the base system is rebooted, the device should still report the same GUID.
  -- *
  -- * GUIDs are as precise as possible but are not guaranteed to distinguish
  -- * physically distinct but equivalent devices. For example, two game
  -- * controllers from the same vendor with the same product ID and revision may
  -- * have the same GUID.
  -- *
  -- * GUIDs may be platform-dependent (i.e., the same device may report different
  -- * GUIDs on different operating systems).
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type anon_array2521 is array (0 .. 15) of aliased SDL3_SDL_stdinc_h.Uint8;
   type SDL_GUID is record
      data : aliased anon_array2521;  -- /usr/local/include/SDL3/SDL_guid.h:62
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_guid.h:61

  -- Function prototypes  
  --*
  -- * Get an ASCII string representation for a given SDL_GUID.
  -- *
  -- * \param guid the SDL_GUID you wish to convert to string.
  -- * \param pszGUID buffer in which to write the ASCII string.
  -- * \param cbGUID the size of pszGUID, should be at least 33 bytes.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_StringToGUID
  --  

   procedure SDL_GUIDToString
     (guid : SDL_GUID;
      pszGUID : Interfaces.C.Strings.chars_ptr;
      cbGUID : int)  -- /usr/local/include/SDL3/SDL_guid.h:80
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GUIDToString";

  --*
  -- * Convert a GUID string into a SDL_GUID structure.
  -- *
  -- * Performs no error checking. If this function is given a string containing
  -- * an invalid GUID, the function will silently succeed, but the GUID generated
  -- * will not be useful.
  -- *
  -- * \param pchGUID string containing an ASCII representation of a GUID.
  -- * \returns a SDL_GUID structure.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GUIDToString
  --  

   function SDL_StringToGUID (pchGUID : Interfaces.C.Strings.chars_ptr) return SDL_GUID  -- /usr/local/include/SDL3/SDL_guid.h:98
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StringToGUID";

  -- Ends C function definitions when using C++  
end SDL3_SDL_guid_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
