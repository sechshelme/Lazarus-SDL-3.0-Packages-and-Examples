pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;

package SDL3_SDL_version_h is

   SDL_MAJOR_VERSION : constant := 3;  --  /usr/local/include/SDL3/SDL_version.h:47

   SDL_MINOR_VERSION : constant := 5;  --  /usr/local/include/SDL3/SDL_version.h:56

   SDL_MICRO_VERSION : constant := 0;  --  /usr/local/include/SDL3/SDL_version.h:65
   --  arg-macro: function SDL_VERSIONNUM (major, minor, patch)
   --    return (major) * 1000000 + (minor) * 1000 + (patch);
   --  arg-macro: function SDL_VERSIONNUM_MAJOR (version)
   --    return (version) / 1000000;
   --  arg-macro: function SDL_VERSIONNUM_MINOR (version)
   --    return ((version) / 1000) mod 1000;
   --  arg-macro: function SDL_VERSIONNUM_MICRO (version)
   --    return (version) mod 1000;
   --  unsupported macro: SDL_VERSION SDL_VERSIONNUM(SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_MICRO_VERSION)
   --  arg-macro: function SDL_VERSION_ATLEAST (X, Y, Z)
   --    return SDL_VERSION >= SDL_VERSIONNUM(X, Y, Z);

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
  -- * # CategoryVersion
  -- *
  -- * Functionality to query the current SDL version, both as headers the app was
  -- * compiled against, and a library the app is linked to.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * The current major version of SDL headers.
  -- *
  -- * If this were SDL version 3.2.1, this value would be 3.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * The current minor version of the SDL headers.
  -- *
  -- * If this were SDL version 3.2.1, this value would be 2.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * The current micro (or patchlevel) version of the SDL headers.
  -- *
  -- * If this were SDL version 3.2.1, this value would be 1.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * This macro turns the version numbers into a numeric value.
  -- *
  -- * (1,2,3) becomes 1002003.
  -- *
  -- * \param major the major version number.
  -- * \param minor the minorversion number.
  -- * \param patch the patch version number.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * This macro extracts the major version from a version number
  -- *
  -- * 1002003 becomes 1.
  -- *
  -- * \param version the version number.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * This macro extracts the minor version from a version number
  -- *
  -- * 1002003 becomes 2.
  -- *
  -- * \param version the version number.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * This macro extracts the micro version from a version number
  -- *
  -- * 1002003 becomes 3.
  -- *
  -- * \param version the version number.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * This is the version number macro for the current SDL version.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetVersion
  --  

  --*
  -- * This macro will evaluate to true if compiled with SDL at least X.Y.Z.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Get the version of SDL that is linked against your program.
  -- *
  -- * If you are linking to SDL dynamically, then it is possible that the current
  -- * version will be different than the version you compiled against. This
  -- * function returns the current version, while SDL_VERSION is the version you
  -- * compiled with.
  -- *
  -- * This function may be called safely at any time, even before SDL_Init().
  -- *
  -- * \returns the version of the linked library.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRevision
  --  

   function SDL_GetVersion return int  -- /usr/local/include/SDL3/SDL_version.h:148
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetVersion";

  --*
  -- * Get the code revision of the SDL library that is linked against your
  -- * program.
  -- *
  -- * This value is the revision of the code you are linking against and may be
  -- * different from the code you are compiling with, which is found in the
  -- * constant SDL_REVISION if you explicitly include SDL_revision.h
  -- *
  -- * The revision is an arbitrary string (a hash value) uniquely identifying the
  -- * exact revision of the SDL library in use, and is only useful in comparing
  -- * against other revisions. It is NOT an incrementing number.
  -- *
  -- * If SDL wasn't built from a git repository with the appropriate tools, this
  -- * will return an empty string.
  -- *
  -- * You shouldn't use this function for anything but logging it for debugging
  -- * purposes. The string is not intended to be reliable in any way.
  -- *
  -- * \returns an arbitrary string, uniquely identifying the exact revision of
  -- *          the SDL library in use.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetVersion
  --  

   function SDL_GetRevision return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_version.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRevision";

  -- Ends C function definitions when using C++  
end SDL3_SDL_version_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
