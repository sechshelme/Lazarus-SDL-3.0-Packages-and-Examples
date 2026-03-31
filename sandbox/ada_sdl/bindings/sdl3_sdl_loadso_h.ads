pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with SDL3_SDL_stdinc_h;

package SDL3_SDL_loadso_h is

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

  -- WIKI CATEGORY: SharedObject  
  --*
  -- * # CategorySharedObject
  -- *
  -- * System-dependent library loading routines.
  -- *
  -- * Shared objects are code that is programmatically loadable at runtime.
  -- * Windows calls these "DLLs", Linux calls them "shared libraries", etc.
  -- *
  -- * To use them, build such a library, then call SDL_LoadObject() on it. Once
  -- * loaded, you can use SDL_LoadFunction() on that object to find the address
  -- * of its exported symbols. When done with the object, call SDL_UnloadObject()
  -- * to dispose of it.
  -- *
  -- * Some things to keep in mind:
  -- *
  -- * - These functions only work on C function names. Other languages may have
  -- *   name mangling and intrinsic language support that varies from compiler to
  -- *   compiler.
  -- * - Make sure you declare your function pointers with the same calling
  -- *   convention as the actual library function. Your code will crash
  -- *   mysteriously if you do not do this.
  -- * - Avoid namespace collisions. If you load a symbol from the library, it is
  -- *   not defined whether or not it goes into the global symbol namespace for
  -- *   the application. If it does and it conflicts with symbols in your code or
  -- *   other shared libraries, you will not get the results you expect. :)
  -- * - Once a library is unloaded, all pointers into it obtained through
  -- *   SDL_LoadFunction() become invalid, even if the library is later reloaded.
  -- *   Don't unload a library if you plan to use these pointers in the future.
  -- *   Notably: beware of giving one of these pointers to atexit(), since it may
  -- *   call that pointer after the library unloads.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * An opaque datatype that represents a loaded shared object.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LoadObject
  -- * \sa SDL_LoadFunction
  -- * \sa SDL_UnloadObject
  --  

   type SDL_SharedObject is null record;   -- incomplete struct

  --*
  -- * Dynamically load a shared object.
  -- *
  -- * \param sofile a system-dependent name of the object file.
  -- * \returns an opaque pointer to the object handle or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LoadFunction
  -- * \sa SDL_UnloadObject
  --  

   function SDL_LoadObject (sofile : Interfaces.C.Strings.chars_ptr) return access SDL_SharedObject  -- /usr/local/include/SDL3/SDL_loadso.h:93
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadObject";

  --*
  -- * Look up the address of the named function in a shared object.
  -- *
  -- * This function pointer is no longer valid after calling SDL_UnloadObject().
  -- *
  -- * This function can only look up C function names. Other languages may have
  -- * name mangling and intrinsic language support that varies from compiler to
  -- * compiler.
  -- *
  -- * Make sure you declare your function pointers with the same calling
  -- * convention as the actual library function. Your code will crash
  -- * mysteriously if you do not do this.
  -- *
  -- * If the requested function doesn't exist, NULL is returned.
  -- *
  -- * \param handle a valid shared object handle returned by SDL_LoadObject().
  -- * \param name the name of the function to look up.
  -- * \returns a pointer to the function or NULL on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LoadObject
  --  

   function SDL_LoadFunction (handle : access SDL_SharedObject; name : Interfaces.C.Strings.chars_ptr) return SDL3_SDL_stdinc_h.SDL_FunctionPointer  -- /usr/local/include/SDL3/SDL_loadso.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadFunction";

  --*
  -- * Unload a shared object from memory.
  -- *
  -- * Note that any pointers from this object looked up through
  -- * SDL_LoadFunction() will no longer be valid.
  -- *
  -- * \param handle a valid shared object handle returned by SDL_LoadObject().
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LoadObject
  --  

   procedure SDL_UnloadObject (handle : access SDL_SharedObject)  -- /usr/local/include/SDL3/SDL_loadso.h:137
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnloadObject";

  -- Ends C function definitions when using C++  
end SDL3_SDL_loadso_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
