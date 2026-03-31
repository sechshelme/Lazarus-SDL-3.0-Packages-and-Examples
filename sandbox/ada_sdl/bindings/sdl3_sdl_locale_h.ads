pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;

package SDL3_SDL_locale_h is

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
  -- * # CategoryLocale
  -- *
  -- * SDL locale services.
  -- *
  -- * This provides a way to get a list of preferred locales (language plus
  -- * country) for the user. There is exactly one function:
  -- * SDL_GetPreferredLocales(), which handles all the heavy lifting, and offers
  -- * documentation on all the strange ways humans might have configured their
  -- * language settings.
  --  

  -- Set up for C function definitions, even when using C++  
  -- *INDENT-OFF*  
  -- *INDENT-ON*  
  --*
  -- * A struct to provide locale data.
  -- *
  -- * Locale data is split into a spoken language, like English, and an optional
  -- * country, like Canada. The language will be in ISO-639 format (so English
  -- * would be "en"), and the country, if not NULL, will be an ISO-3166 country
  -- * code (so Canada would be "CA").
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPreferredLocales
  --  

  --*< A language name, like "en" for English.  
   type SDL_Locale is record
      language : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_locale.h:62
      country : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_locale.h:63
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_locale.h:60

  --*< A country, like "US" for America. Can be NULL.  
  --*
  -- * Report the user's preferred locale.
  -- *
  -- * Returned language strings are in the format xx, where 'xx' is an ISO-639
  -- * language specifier (such as "en" for English, "de" for German, etc).
  -- * Country strings are in the format YY, where "YY" is an ISO-3166 country
  -- * code (such as "US" for the United States, "CA" for Canada, etc). Country
  -- * might be NULL if there's no specific guidance on them (so you might get {
  -- * "en", "US" } for American English, but { "en", NULL } means "English
  -- * language, generically"). Language strings are never NULL, except to
  -- * terminate the array.
  -- *
  -- * Please note that not all of these strings are 2 characters; some are three
  -- * or more.
  -- *
  -- * The returned list of locales are in the order of the user's preference. For
  -- * example, a German citizen that is fluent in US English and knows enough
  -- * Japanese to navigate around Tokyo might have a list like: { "de", "en_US",
  -- * "jp", NULL }. Someone from England might prefer British English (where
  -- * "color" is spelled "colour", etc), but will settle for anything like it: {
  -- * "en_GB", "en", NULL }.
  -- *
  -- * This function returns NULL on error, including when the platform does not
  -- * supply this information at all.
  -- *
  -- * This might be a "slow" call that has to query the operating system. It's
  -- * best to ask for this once and save the results. However, this list can
  -- * change, usually because the user has changed a system preference outside of
  -- * your program; SDL will send an SDL_EVENT_LOCALE_CHANGED event in this case,
  -- * if possible, and you can call this function again to get an updated copy of
  -- * preferred locales.
  -- *
  -- * \param count a pointer filled in with the number of locales returned, may
  -- *              be NULL.
  -- * \returns a NULL terminated array of locale pointers, or NULL on failure;
  -- *          call SDL_GetError() for more information. This is a single
  -- *          allocation that should be freed with SDL_free() when it is no
  -- *          longer needed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetPreferredLocales (count : access int) return System.Address  -- /usr/local/include/SDL3/SDL_locale.h:107
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPreferredLocales";

  -- Ends C function definitions when using C++  
  -- *INDENT-OFF*  
  -- *INDENT-ON*  
end SDL3_SDL_locale_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
