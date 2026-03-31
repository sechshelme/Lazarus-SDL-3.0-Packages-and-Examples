pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with SDL3_SDL_pixels_h;
with System;
with SDL3_SDL_properties_h;
with Interfaces.C.Extensions;
limited with SDL3_SDL_iostream_h;
with Interfaces.C.Strings;
with SDL3_SDL_blendmode_h;
limited with SDL3_SDL_rect_h;

package SDL3_SDL_surface_h is

   SDL_SURFACE_PREALLOCATED : constant := 16#00000001#;  --  /usr/local/include/SDL3/SDL_surface.h:70
   SDL_SURFACE_LOCK_NEEDED : constant := 16#00000002#;  --  /usr/local/include/SDL3/SDL_surface.h:71
   SDL_SURFACE_LOCKED : constant := 16#00000004#;  --  /usr/local/include/SDL3/SDL_surface.h:72
   SDL_SURFACE_SIMD_ALIGNED : constant := 16#00000008#;  --  /usr/local/include/SDL3/SDL_surface.h:73
   --  arg-macro: function SDL_MUSTLOCK (S)
   --    return ((S).flags and SDL_SURFACE_LOCK_NEEDED) = SDL_SURFACE_LOCK_NEEDED;

   SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT : aliased constant String := "SDL.surface.SDR_white_point" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_surface.h:261
   SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT : aliased constant String := "SDL.surface.HDR_headroom" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_surface.h:262
   SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING : aliased constant String := "SDL.surface.tonemap" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_surface.h:263
   SDL_PROP_SURFACE_HOTSPOT_X_NUMBER : aliased constant String := "SDL.surface.hotspot.x" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_surface.h:264
   SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER : aliased constant String := "SDL.surface.hotspot.y" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_surface.h:265
   SDL_PROP_SURFACE_ROTATION_FLOAT : aliased constant String := "SDL.surface.rotation" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_surface.h:266

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
  -- * # CategorySurface
  -- *
  -- * SDL surfaces are buffers of pixels in system RAM. These are useful for
  -- * passing around and manipulating images that are not stored in GPU memory.
  -- *
  -- * SDL_Surface makes serious efforts to manage images in various formats, and
  -- * provides a reasonable toolbox for transforming the data, including copying
  -- * between surfaces, filling rectangles in the image data, etc.
  -- *
  -- * There is also a simple .bmp loader, SDL_LoadBMP(), and a simple .png
  -- * loader, SDL_LoadPNG(). SDL itself does not provide loaders for other file
  -- * formats, but there are several excellent external libraries that do,
  -- * including its own satellite library,
  -- * [SDL_image](https://wiki.libsdl.org/SDL3_image)
  -- * .
  -- *
  -- * In general these functions are thread-safe in that they can be called on
  -- * different threads with different surfaces. You should not try to modify any
  -- * surface from two threads simultaneously.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * The flags on an SDL_Surface.
  -- *
  -- * These are generally considered read-only.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_SurfaceFlags is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_surface.h:68

  --*
  -- * Evaluates to true if the surface needs to be locked before access.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * The scaling mode.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_ScaleMode is int;
   SDL_ScaleMode_SDL_SCALEMODE_INVALID : constant SDL_ScaleMode := -1;
   SDL_ScaleMode_SDL_SCALEMODE_NEAREST : constant SDL_ScaleMode := 0;
   SDL_ScaleMode_SDL_SCALEMODE_LINEAR : constant SDL_ScaleMode := 1;
   SDL_ScaleMode_SDL_SCALEMODE_PIXELART : constant SDL_ScaleMode := 2;  -- /usr/local/include/SDL3/SDL_surface.h:87

  --*< nearest pixel sampling  
  --*< linear filtering  
  --*< nearest pixel sampling with improved scaling for pixel art, available since SDL 3.4.0  
  --*
  -- * The flip mode.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_FlipMode is 
     (SDL_FLIP_NONE,
      SDL_FLIP_HORIZONTAL,
      SDL_FLIP_VERTICAL,
      SDL_FLIP_HORIZONTAL_AND_VERTICAL)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_surface.h:100

  --*< Do not flip  
  --*< flip horizontally  
  --*< flip vertically  
  --*< flip horizontally and vertically (not a diagonal flip)  
  --*
  -- * A collection of pixels used in software blitting.
  -- *
  -- * Pixels are arranged in memory in rows, with the top row first. Each row
  -- * occupies an amount of memory given by the pitch (sometimes known as the row
  -- * stride in non-SDL APIs).
  -- *
  -- * Within each row, pixels are arranged from left to right until the width is
  -- * reached. Each pixel occupies a number of bits appropriate for its format,
  -- * with most formats representing each pixel as one or more whole bytes (in
  -- * some indexed formats, instead multiple pixels are packed into each byte),
  -- * and a byte order given by the format. After encoding all pixels, any
  -- * remaining bytes to reach the pitch are used as padding to reach a desired
  -- * alignment, and have undefined contents.
  -- *
  -- * When a surface holds YUV format data, the planes are assumed to be
  -- * contiguous without padding between them, e.g. a 32x32 surface in NV12
  -- * format with a pitch of 32 would consist of 32x32 bytes of Y plane followed
  -- * by 32x16 bytes of UV plane.
  -- *
  -- * When a surface holds MJPG format data, pixels points at the compressed JPEG
  -- * image and pitch is the length of that data.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateSurface
  -- * \sa SDL_DestroySurface
  --  

  --*< The flags of the surface, read-only  
   type SDL_Surface is record
      flags : aliased SDL_SurfaceFlags;  -- /usr/local/include/SDL3/SDL_surface.h:140
      format : aliased SDL3_SDL_pixels_h.SDL_PixelFormat;  -- /usr/local/include/SDL3/SDL_surface.h:141
      w : aliased int;  -- /usr/local/include/SDL3/SDL_surface.h:142
      h : aliased int;  -- /usr/local/include/SDL3/SDL_surface.h:143
      pitch : aliased int;  -- /usr/local/include/SDL3/SDL_surface.h:144
      pixels : System.Address;  -- /usr/local/include/SDL3/SDL_surface.h:145
      refcount : aliased int;  -- /usr/local/include/SDL3/SDL_surface.h:147
      reserved : System.Address;  -- /usr/local/include/SDL3/SDL_surface.h:149
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_surface.h:138

  --*< The format of the surface, read-only  
  --*< The width of the surface, read-only.  
  --*< The height of the surface, read-only.  
  --*< The distance in bytes between rows of pixels, read-only  
  --*< A pointer to the pixels of the surface, the pixels are writeable if non-NULL  
  --*< Application reference count, used when freeing surface  
  --*< Reserved for internal use  
  --*
  -- * Allocate a new surface with a specific pixel format.
  -- *
  -- * The pixels of the new surface are initialized to zero.
  -- *
  -- * \param width the width of the surface.
  -- * \param height the height of the surface.
  -- * \param format the SDL_PixelFormat for the new surface's pixel format.
  -- * \returns the new SDL_Surface structure that is created or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateSurfaceFrom
  -- * \sa SDL_DestroySurface
  --  

   function SDL_CreateSurface
     (width : int;
      height : int;
      format : SDL3_SDL_pixels_h.SDL_PixelFormat) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:173
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSurface";

  --*
  -- * Allocate a new surface with a specific pixel format and existing pixel
  -- * data.
  -- *
  -- * No copy is made of the pixel data. Pixel data is not managed automatically;
  -- * you must free the surface before you free the pixel data.
  -- *
  -- * Pitch is the offset in bytes from one row of pixels to the next, e.g.
  -- * `width*4` for `SDL_PIXELFORMAT_RGBA8888`.
  -- *
  -- * You may pass NULL for pixels and 0 for pitch to create a surface that you
  -- * will fill in with valid values later.
  -- *
  -- * \param width the width of the surface.
  -- * \param height the height of the surface.
  -- * \param format the SDL_PixelFormat for the new surface's pixel format.
  -- * \param pixels a pointer to existing pixel data.
  -- * \param pitch the number of bytes between each row, including padding.
  -- * \returns the new SDL_Surface structure that is created or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateSurface
  -- * \sa SDL_DestroySurface
  --  

   function SDL_CreateSurfaceFrom
     (width : int;
      height : int;
      format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      pixels : System.Address;
      pitch : int) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:203
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSurfaceFrom";

  --*
  -- * Free a surface.
  -- *
  -- * It is safe to pass NULL to this function.
  -- *
  -- * \param surface the SDL_Surface to free.
  -- *
  -- * \threadsafety No other thread should be using the surface when it is freed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateSurface
  -- * \sa SDL_CreateSurfaceFrom
  --  

   procedure SDL_DestroySurface (surface : access SDL_Surface)  -- /usr/local/include/SDL3/SDL_surface.h:219
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroySurface";

  --*
  -- * Get the properties associated with a surface.
  -- *
  -- * The following properties are understood by SDL:
  -- *
  -- * - `SDL_PROP_SURFACE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating point
  -- *   surfaces, this defines the value of 100% diffuse white, with higher
  -- *   values being displayed in the High Dynamic Range headroom. This defaults
  -- *   to 203 for HDR10 surfaces and 1.0 for floating point surfaces.
  -- * - `SDL_PROP_SURFACE_HDR_HEADROOM_FLOAT`: for HDR10 and floating point
  -- *   surfaces, this defines the maximum dynamic range used by the content, in
  -- *   terms of the SDR white point. This defaults to 0.0, which disables tone
  -- *   mapping.
  -- * - `SDL_PROP_SURFACE_TONEMAP_OPERATOR_STRING`: the tone mapping operator
  -- *   used when compressing from a surface with high dynamic range to another
  -- *   with lower dynamic range. Currently this supports "chrome", which uses
  -- *   the same tone mapping that Chrome uses for HDR content, the form "*=N",
  -- *   where N is a floating point scale factor applied in linear space, and
  -- *   "none", which disables tone mapping. This defaults to "chrome".
  -- * - `SDL_PROP_SURFACE_HOTSPOT_X_NUMBER`: the hotspot pixel offset from the
  -- *   left edge of the image, if this surface is being used as a cursor.
  -- * - `SDL_PROP_SURFACE_HOTSPOT_Y_NUMBER`: the hotspot pixel offset from the
  -- *   top edge of the image, if this surface is being used as a cursor.
  -- * - `SDL_PROP_SURFACE_ROTATION_FLOAT`: the number of degrees a surface's data
  -- *   is meant to be rotated clockwise to make the image right-side up. Default
  -- *   0. This is used by the camera API, if a mobile device is oriented
  -- *   differently than what its camera provides (i.e. - the camera always
  -- *   provides portrait images but the phone is being held in landscape
  -- *   orientation). Since SDL 3.4.0.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \returns a valid property ID on success or 0 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetSurfaceProperties (surface : access SDL_Surface) return SDL3_SDL_properties_h.SDL_PropertiesID  -- /usr/local/include/SDL3/SDL_surface.h:259
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceProperties";

  --*
  -- * Set the colorspace used by a surface.
  -- *
  -- * Setting the colorspace doesn't change the pixels, only how they are
  -- * interpreted in color operations.
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param colorspace an SDL_Colorspace value describing the surface
  -- *                   colorspace.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceColorspace
  --  

   function SDL_SetSurfaceColorspace (surface : access SDL_Surface; colorspace : SDL3_SDL_pixels_h.SDL_Colorspace) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:287
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceColorspace";

  --*
  -- * Get the colorspace used by a surface.
  -- *
  -- * The colorspace defaults to SDL_COLORSPACE_SRGB_LINEAR for floating point
  -- * formats, SDL_COLORSPACE_HDR10 for 10-bit formats, SDL_COLORSPACE_SRGB for
  -- * other RGB surfaces and SDL_COLORSPACE_BT709_FULL for YUV textures.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \returns the colorspace used by the surface, or SDL_COLORSPACE_UNKNOWN if
  -- *          the surface is NULL.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfaceColorspace
  --  

   function SDL_GetSurfaceColorspace (surface : access SDL_Surface) return SDL3_SDL_pixels_h.SDL_Colorspace  -- /usr/local/include/SDL3/SDL_surface.h:307
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceColorspace";

  --*
  -- * Create a palette and associate it with a surface.
  -- *
  -- * This function creates a palette compatible with the provided surface. The
  -- * palette is then returned for you to modify, and the surface will
  -- * automatically use the new palette in future operations. You do not need to
  -- * destroy the returned palette, it will be freed when the reference count
  -- * reaches 0, usually when the surface is destroyed.
  -- *
  -- * Bitmap surfaces (with format SDL_PIXELFORMAT_INDEX1LSB or
  -- * SDL_PIXELFORMAT_INDEX1MSB) will have the palette initialized with 0 as
  -- * white and 1 as black. Other surfaces will get a palette initialized with
  -- * white in every entry.
  -- *
  -- * If this function is called for a surface that already has a palette, a new
  -- * palette will be created to replace it.
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
  -- *          the surface didn't have an index format); call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetPaletteColors
  --  

   function SDL_CreateSurfacePalette (surface : access SDL_Surface) return access SDL3_SDL_pixels_h.SDL_Palette  -- /usr/local/include/SDL3/SDL_surface.h:338
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSurfacePalette";

  --*
  -- * Set the palette used by a surface.
  -- *
  -- * Setting the palette keeps an internal reference to the palette, which can
  -- * be safely destroyed afterwards.
  -- *
  -- * A single palette can be shared with many surfaces.
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param palette the SDL_Palette structure to use.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreatePalette
  -- * \sa SDL_GetSurfacePalette
  --  

   function SDL_SetSurfacePalette (surface : access SDL_Surface; palette : access SDL3_SDL_pixels_h.SDL_Palette) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:361
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfacePalette";

  --*
  -- * Get the palette used by a surface.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \returns a pointer to the palette used by the surface, or NULL if there is
  -- *          no palette used.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfacePalette
  --  

   function SDL_GetSurfacePalette (surface : access SDL_Surface) return access SDL3_SDL_pixels_h.SDL_Palette  -- /usr/local/include/SDL3/SDL_surface.h:376
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfacePalette";

  --*
  -- * Add an alternate version of a surface.
  -- *
  -- * This function adds an alternate version of this surface, usually used for
  -- * content with high DPI representations like cursors or icons. The size,
  -- * format, and content do not need to match the original surface, and these
  -- * alternate versions will not be updated when the original surface changes.
  -- *
  -- * This function adds a reference to the alternate version, so you should call
  -- * SDL_DestroySurface() on the image after this call.
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param image a pointer to an alternate SDL_Surface to associate with this
  -- *              surface.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RemoveSurfaceAlternateImages
  -- * \sa SDL_GetSurfaceImages
  -- * \sa SDL_SurfaceHasAlternateImages
  --  

   function SDL_AddSurfaceAlternateImage (surface : access SDL_Surface; image : access SDL_Surface) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:404
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddSurfaceAlternateImage";

  --*
  -- * Return whether a surface has alternate versions available.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \returns true if alternate versions are available or false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddSurfaceAlternateImage
  -- * \sa SDL_RemoveSurfaceAlternateImages
  -- * \sa SDL_GetSurfaceImages
  --  

   function SDL_SurfaceHasAlternateImages (surface : access SDL_Surface) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:420
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SurfaceHasAlternateImages";

  --*
  -- * Get an array including all versions of a surface.
  -- *
  -- * This returns all versions of a surface, with the surface being queried as
  -- * the first element in the returned array.
  -- *
  -- * Freeing the array of surfaces does not affect the surfaces in the array.
  -- * They are still referenced by the surface being queried and will be cleaned
  -- * up normally.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \param count a pointer filled in with the number of surface pointers
  -- *              returned, may be NULL.
  -- * \returns a NULL terminated array of SDL_Surface pointers or NULL on
  -- *          failure; call SDL_GetError() for more information. This should be
  -- *          freed with SDL_free() when it is no longer needed.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddSurfaceAlternateImage
  -- * \sa SDL_RemoveSurfaceAlternateImages
  -- * \sa SDL_SurfaceHasAlternateImages
  --  

   function SDL_GetSurfaceImages (surface : access SDL_Surface; count : access int) return System.Address  -- /usr/local/include/SDL3/SDL_surface.h:448
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceImages";

  --*
  -- * Remove all alternate versions of a surface.
  -- *
  -- * This function removes a reference from all the alternative versions,
  -- * destroying them if this is the last reference to them.
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddSurfaceAlternateImage
  -- * \sa SDL_GetSurfaceImages
  -- * \sa SDL_SurfaceHasAlternateImages
  --  

   procedure SDL_RemoveSurfaceAlternateImages (surface : access SDL_Surface)  -- /usr/local/include/SDL3/SDL_surface.h:467
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RemoveSurfaceAlternateImages";

  --*
  -- * Set up a surface for directly accessing the pixels.
  -- *
  -- * Between calls to SDL_LockSurface() / SDL_UnlockSurface(), you can write to
  -- * and read from `surface->pixels`, using the pixel format stored in
  -- * `surface->format`. Once you are done accessing the surface, you should use
  -- * SDL_UnlockSurface() to release it.
  -- *
  -- * Not all surfaces require locking. If `SDL_MUSTLOCK(surface)` evaluates to
  -- * 0, then you can read and write to the surface at any time, and the pixel
  -- * format of the surface will not change.
  -- *
  -- * \param surface the SDL_Surface structure to be locked.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces. The locking referred to by this function
  -- *               is making the pixels available for direct access, not
  -- *               thread-safe locking.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MUSTLOCK
  -- * \sa SDL_UnlockSurface
  --  

   function SDL_LockSurface (surface : access SDL_Surface) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:495
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockSurface";

  --*
  -- * Release a surface after directly accessing the pixels.
  -- *
  -- * \param surface the SDL_Surface structure to be unlocked.
  -- *
  -- * \threadsafety This function is not thread safe. The locking referred to by
  -- *               this function is making the pixels available for direct
  -- *               access, not thread-safe locking.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockSurface
  --  

   procedure SDL_UnlockSurface (surface : access SDL_Surface)  -- /usr/local/include/SDL3/SDL_surface.h:510
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockSurface";

  --*
  -- * Load a BMP or PNG image from a seekable SDL data stream.
  -- *
  -- * The new surface should be freed with SDL_DestroySurface(). Not doing so
  -- * will result in a memory leak.
  -- *
  -- * \param src the data stream for the surface.
  -- * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
  -- *                in the case of an error.
  -- * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_DestroySurface
  -- * \sa SDL_LoadSurface
  --  

   function SDL_LoadSurface_IO (src : access SDL3_SDL_iostream_h.SDL_IOStream; closeio : Extensions.bool) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:531
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadSurface_IO";

  --*
  -- * Load a BMP or PNG image from a file.
  -- *
  -- * The new surface should be freed with SDL_DestroySurface(). Not doing so
  -- * will result in a memory leak.
  -- *
  -- * \param file the file to load.
  -- * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_DestroySurface
  -- * \sa SDL_LoadSurface_IO
  --  

   function SDL_LoadSurface (file : Interfaces.C.Strings.chars_ptr) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:550
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadSurface";

  --*
  -- * Load a BMP image from a seekable SDL data stream.
  -- *
  -- * The new surface should be freed with SDL_DestroySurface(). Not doing so
  -- * will result in a memory leak.
  -- *
  -- * \param src the data stream for the surface.
  -- * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
  -- *                in the case of an error.
  -- * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroySurface
  -- * \sa SDL_LoadBMP
  -- * \sa SDL_SaveBMP_IO
  --  

   function SDL_LoadBMP_IO (src : access SDL3_SDL_iostream_h.SDL_IOStream; closeio : Extensions.bool) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:572
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadBMP_IO";

  --*
  -- * Load a BMP image from a file.
  -- *
  -- * The new surface should be freed with SDL_DestroySurface(). Not doing so
  -- * will result in a memory leak.
  -- *
  -- * \param file the BMP file to load.
  -- * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroySurface
  -- * \sa SDL_LoadBMP_IO
  -- * \sa SDL_SaveBMP
  --  

   function SDL_LoadBMP (file : Interfaces.C.Strings.chars_ptr) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:592
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadBMP";

  --*
  -- * Save a surface to a seekable SDL data stream in BMP format.
  -- *
  -- * Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
  -- * BMP directly. Other RGB formats with 8-bit or higher get converted to a
  -- * 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
  -- * surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
  -- * not supported.
  -- *
  -- * \param surface the SDL_Surface structure containing the image to be saved.
  -- * \param dst a data stream to save to.
  -- * \param closeio if true, calls SDL_CloseIO() on `dst` before returning, even
  -- *                in the case of an error.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LoadBMP_IO
  -- * \sa SDL_SaveBMP
  --  

   function SDL_SaveBMP_IO
     (surface : access SDL_Surface;
      dst : access SDL3_SDL_iostream_h.SDL_IOStream;
      closeio : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:618
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SaveBMP_IO";

  --*
  -- * Save a surface to a file in BMP format.
  -- *
  -- * Surfaces with a 24-bit, 32-bit and paletted 8-bit format get saved in the
  -- * BMP directly. Other RGB formats with 8-bit or higher get converted to a
  -- * 24-bit surface or, if they have an alpha mask or a colorkey, to a 32-bit
  -- * surface before they are saved. YUV and paletted 1-bit and 4-bit formats are
  -- * not supported.
  -- *
  -- * \param surface the SDL_Surface structure containing the image to be saved.
  -- * \param file a file to save to.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LoadBMP
  -- * \sa SDL_SaveBMP_IO
  --  

   function SDL_SaveBMP (surface : access SDL_Surface; file : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:642
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SaveBMP";

  --*
  -- * Load a PNG image from a seekable SDL data stream.
  -- *
  -- * This is intended as a convenience function for loading images from trusted
  -- * sources. If you want to load arbitrary images you should use libpng or
  -- * another image loading library designed with security in mind.
  -- *
  -- * The new surface should be freed with SDL_DestroySurface(). Not doing so
  -- * will result in a memory leak.
  -- *
  -- * \param src the data stream for the surface.
  -- * \param closeio if true, calls SDL_CloseIO() on `src` before returning, even
  -- *                in the case of an error.
  -- * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_DestroySurface
  -- * \sa SDL_LoadPNG
  -- * \sa SDL_SavePNG_IO
  --  

   function SDL_LoadPNG_IO (src : access SDL3_SDL_iostream_h.SDL_IOStream; closeio : Extensions.bool) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:668
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadPNG_IO";

  --*
  -- * Load a PNG image from a file.
  -- *
  -- * This is intended as a convenience function for loading images from trusted
  -- * sources. If you want to load arbitrary images you should use libpng or
  -- * another image loading library designed with security in mind.
  -- *
  -- * The new surface should be freed with SDL_DestroySurface(). Not doing so
  -- * will result in a memory leak.
  -- *
  -- * \param file the PNG file to load.
  -- * \returns a pointer to a new SDL_Surface structure or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_DestroySurface
  -- * \sa SDL_LoadPNG_IO
  -- * \sa SDL_SavePNG
  --  

   function SDL_LoadPNG (file : Interfaces.C.Strings.chars_ptr) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:692
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LoadPNG";

  --*
  -- * Save a surface to a seekable SDL data stream in PNG format.
  -- *
  -- * \param surface the SDL_Surface structure containing the image to be saved.
  -- * \param dst a data stream to save to.
  -- * \param closeio if true, calls SDL_CloseIO() on `dst` before returning, even
  -- *                in the case of an error.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_LoadPNG_IO
  -- * \sa SDL_SavePNG
  --  

   function SDL_SavePNG_IO
     (surface : access SDL_Surface;
      dst : access SDL3_SDL_iostream_h.SDL_IOStream;
      closeio : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:712
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SavePNG_IO";

  --*
  -- * Save a surface to a file in PNG format.
  -- *
  -- * \param surface the SDL_Surface structure containing the image to be saved.
  -- * \param file a file to save to.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_LoadPNG
  -- * \sa SDL_SavePNG_IO
  --  

   function SDL_SavePNG (surface : access SDL_Surface; file : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:730
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SavePNG";

  --*
  -- * Set the RLE acceleration hint for a surface.
  -- *
  -- * If RLE is enabled, color key and alpha blending blits are much faster, but
  -- * the surface must be locked before directly accessing the pixels.
  -- *
  -- * \param surface the SDL_Surface structure to optimize.
  -- * \param enabled true to enable RLE acceleration, false to disable it.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurface
  -- * \sa SDL_LockSurface
  -- * \sa SDL_UnlockSurface
  --  

   function SDL_SetSurfaceRLE (surface : access SDL_Surface; enabled : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:752
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceRLE";

  --*
  -- * Returns whether the surface is RLE enabled.
  -- *
  -- * It is safe to pass a NULL `surface` here; it will return false.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \returns true if the surface is RLE enabled, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfaceRLE
  --  

   function SDL_SurfaceHasRLE (surface : access SDL_Surface) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:768
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SurfaceHasRLE";

  --*
  -- * Set the color key (transparent pixel) in a surface.
  -- *
  -- * The color key defines a pixel value that will be treated as transparent in
  -- * a blit. For example, one can use this to specify that cyan pixels should be
  -- * considered transparent, and therefore not rendered.
  -- *
  -- * It is a pixel of the format used by the surface, as generated by
  -- * SDL_MapRGB().
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param enabled true to enable color key, false to disable color key.
  -- * \param key the transparent pixel.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceColorKey
  -- * \sa SDL_SetSurfaceRLE
  -- * \sa SDL_SurfaceHasColorKey
  --  

   function SDL_SetSurfaceColorKey
     (surface : access SDL_Surface;
      enabled : Extensions.bool;
      key : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:795
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceColorKey";

  --*
  -- * Returns whether the surface has a color key.
  -- *
  -- * It is safe to pass a NULL `surface` here; it will return false.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \returns true if the surface has a color key, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfaceColorKey
  -- * \sa SDL_GetSurfaceColorKey
  --  

   function SDL_SurfaceHasColorKey (surface : access SDL_Surface) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:812
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SurfaceHasColorKey";

  --*
  -- * Get the color key (transparent pixel) for a surface.
  -- *
  -- * The color key is a pixel of the format used by the surface, as generated by
  -- * SDL_MapRGB().
  -- *
  -- * If the surface doesn't have color key enabled this function returns false.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \param key a pointer filled in with the transparent pixel.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfaceColorKey
  -- * \sa SDL_SurfaceHasColorKey
  --  

   function SDL_GetSurfaceColorKey (surface : access SDL_Surface; key : access SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:834
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceColorKey";

  --*
  -- * Set an additional color value multiplied into blit operations.
  -- *
  -- * When this surface is blitted, during the blit operation each source color
  -- * channel is modulated by the appropriate color value according to the
  -- * following formula:
  -- *
  -- * `srcC = srcC * (color / 255)`
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param r the red color value multiplied into blit operations.
  -- * \param g the green color value multiplied into blit operations.
  -- * \param b the blue color value multiplied into blit operations.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceColorMod
  -- * \sa SDL_SetSurfaceAlphaMod
  --  

   function SDL_SetSurfaceColorMod
     (surface : access SDL_Surface;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:860
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceColorMod";

  --*
  -- * Get the additional color value multiplied into blit operations.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \param r a pointer filled in with the current red color value.
  -- * \param g a pointer filled in with the current green color value.
  -- * \param b a pointer filled in with the current blue color value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceAlphaMod
  -- * \sa SDL_SetSurfaceColorMod
  --  

   function SDL_GetSurfaceColorMod
     (surface : access SDL_Surface;
      r : access SDL3_SDL_stdinc_h.Uint8;
      g : access SDL3_SDL_stdinc_h.Uint8;
      b : access SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:881
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceColorMod";

  --*
  -- * Set an additional alpha value used in blit operations.
  -- *
  -- * When this surface is blitted, during the blit operation the source alpha
  -- * value is modulated by this alpha value according to the following formula:
  -- *
  -- * `srcA = srcA * (alpha / 255)`
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param alpha the alpha value multiplied into blit operations.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceAlphaMod
  -- * \sa SDL_SetSurfaceColorMod
  --  

   function SDL_SetSurfaceAlphaMod (surface : access SDL_Surface; alpha : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:904
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceAlphaMod";

  --*
  -- * Get the additional alpha value used in blit operations.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \param alpha a pointer filled in with the current alpha value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceColorMod
  -- * \sa SDL_SetSurfaceAlphaMod
  --  

   function SDL_GetSurfaceAlphaMod (surface : access SDL_Surface; alpha : access SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:921
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceAlphaMod";

  --*
  -- * Set the blend mode used for blit operations.
  -- *
  -- * To copy a surface to another surface (or texture) without blending with the
  -- * existing data, the blendmode of the SOURCE surface should be set to
  -- * `SDL_BLENDMODE_NONE`.
  -- *
  -- * \param surface the SDL_Surface structure to update.
  -- * \param blendMode the SDL_BlendMode to use for blit blending.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceBlendMode
  --  

   function SDL_SetSurfaceBlendMode (surface : access SDL_Surface; blendMode : SDL3_SDL_blendmode_h.SDL_BlendMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:942
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceBlendMode";

  --*
  -- * Get the blend mode used for blit operations.
  -- *
  -- * \param surface the SDL_Surface structure to query.
  -- * \param blendMode a pointer filled in with the current SDL_BlendMode.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfaceBlendMode
  --  

   function SDL_GetSurfaceBlendMode (surface : access SDL_Surface; blendMode : access SDL3_SDL_blendmode_h.SDL_BlendMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:958
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceBlendMode";

  --*
  -- * Set the clipping rectangle for a surface.
  -- *
  -- * When `surface` is the destination of a blit, only the area within the clip
  -- * rectangle is drawn into.
  -- *
  -- * Note that blits are automatically clipped to the edges of the source and
  -- * destination surfaces.
  -- *
  -- * \param surface the SDL_Surface structure to be clipped.
  -- * \param rect the SDL_Rect structure representing the clipping rectangle, or
  -- *             NULL to disable clipping.
  -- * \returns true if the rectangle intersects the surface, otherwise false and
  -- *          blits will be completely clipped.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetSurfaceClipRect
  --  

   function SDL_SetSurfaceClipRect (surface : access SDL_Surface; rect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:982
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetSurfaceClipRect";

  --*
  -- * Get the clipping rectangle for a surface.
  -- *
  -- * When `surface` is the destination of a blit, only the area within the clip
  -- * rectangle is drawn into.
  -- *
  -- * \param surface the SDL_Surface structure representing the surface to be
  -- *                clipped.
  -- * \param rect an SDL_Rect structure filled in with the clipping rectangle for
  -- *             the surface.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetSurfaceClipRect
  --  

   function SDL_GetSurfaceClipRect (surface : access SDL_Surface; rect : access SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1004
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSurfaceClipRect";

  --*
  -- * Flip a surface vertically or horizontally.
  -- *
  -- * \param surface the surface to flip.
  -- * \param flip the direction to flip.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_FlipSurface (surface : access SDL_Surface; flip : SDL_FlipMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1019
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FlipSurface";

  --*
  -- * Return a copy of a surface rotated clockwise a number of degrees.
  -- *
  -- * The angle of rotation can be negative for counter-clockwise rotation.
  -- *
  -- * When the rotation isn't a multiple of 90 degrees, the resulting surface is
  -- * larger than the original, with the background filled in with the colorkey,
  -- * if available, or RGBA 255/255/255/0 if not.
  -- *
  -- * If `surface` has the SDL_PROP_SURFACE_ROTATION_FLOAT property set on it,
  -- * the new copy will have the adjusted value set: if the rotation property is
  -- * 90 and `angle` was 30, the new surface will have a property value of 60
  -- * (that is: to be upright vs gravity, this surface needs to rotate 60 more
  -- * degrees). However, note that further rotations on the new surface in this
  -- * example will produce unexpected results, since the image will have resized
  -- * and padded to accommodate the not-90 degree angle.
  -- *
  -- * \param surface the surface to rotate.
  -- * \param angle the rotation angle, in degrees.
  -- * \returns a rotated copy of the surface or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_RotateSurface (surface : access SDL_Surface; angle : float) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:1048
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RotateSurface";

  --*
  -- * Creates a new surface identical to the existing surface.
  -- *
  -- * If the original surface has alternate images, the new surface will have a
  -- * reference to them as well.
  -- *
  -- * The returned surface should be freed with SDL_DestroySurface().
  -- *
  -- * \param surface the surface to duplicate.
  -- * \returns a copy of the surface or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroySurface
  --  

   function SDL_DuplicateSurface (surface : access SDL_Surface) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:1069
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DuplicateSurface";

  --*
  -- * Creates a new surface identical to the existing surface, scaled to the
  -- * desired size.
  -- *
  -- * The returned surface should be freed with SDL_DestroySurface().
  -- *
  -- * \param surface the surface to duplicate and scale.
  -- * \param width the width of the new surface.
  -- * \param height the height of the new surface.
  -- * \param scaleMode the SDL_ScaleMode to be used.
  -- * \returns a copy of the surface or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroySurface
  --  

   function SDL_ScaleSurface
     (surface : access SDL_Surface;
      width : int;
      height : int;
      scaleMode : SDL_ScaleMode) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:1091
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ScaleSurface";

  --*
  -- * Copy an existing surface to a new surface of the specified format.
  -- *
  -- * This function is used to optimize images for faster *repeat* blitting. This
  -- * is accomplished by converting the original and storing the result as a new
  -- * surface. The new, optimized surface can then be used as the source for
  -- * future blits, making them faster.
  -- *
  -- * If you are converting to an indexed surface and want to map colors to a
  -- * palette, you can use SDL_ConvertSurfaceAndColorspace() instead.
  -- *
  -- * If the original surface has alternate images, the new surface will have a
  -- * reference to them as well.
  -- *
  -- * \param surface the existing SDL_Surface structure to convert.
  -- * \param format the new pixel format.
  -- * \returns the new SDL_Surface structure that is created or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ConvertSurfaceAndColorspace
  -- * \sa SDL_DestroySurface
  --  

   function SDL_ConvertSurface (surface : access SDL_Surface; format : SDL3_SDL_pixels_h.SDL_PixelFormat) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:1120
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ConvertSurface";

  --*
  -- * Copy an existing surface to a new surface of the specified format and
  -- * colorspace.
  -- *
  -- * This function converts an existing surface to a new format and colorspace
  -- * and returns the new surface. This will perform any pixel format and
  -- * colorspace conversion needed.
  -- *
  -- * If the original surface has alternate images, the new surface will have a
  -- * reference to them as well.
  -- *
  -- * \param surface the existing SDL_Surface structure to convert.
  -- * \param format the new pixel format.
  -- * \param palette an optional palette to use for indexed formats, may be NULL.
  -- * \param colorspace the new colorspace.
  -- * \param props an SDL_PropertiesID with additional color properties, or 0.
  -- * \returns the new SDL_Surface structure that is created or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ConvertSurface
  -- * \sa SDL_DestroySurface
  --  

   function SDL_ConvertSurfaceAndColorspace
     (surface : access SDL_Surface;
      format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      palette : access SDL3_SDL_pixels_h.SDL_Palette;
      colorspace : SDL3_SDL_pixels_h.SDL_Colorspace;
      props : SDL3_SDL_properties_h.SDL_PropertiesID) return access SDL_Surface  -- /usr/local/include/SDL3/SDL_surface.h:1149
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ConvertSurfaceAndColorspace";

  --*
  -- * Copy a block of pixels of one format to another format.
  -- *
  -- * \param width the width of the block to copy, in pixels.
  -- * \param height the height of the block to copy, in pixels.
  -- * \param src_format an SDL_PixelFormat value of the `src` pixels format.
  -- * \param src a pointer to the source pixels.
  -- * \param src_pitch the pitch of the source pixels, in bytes.
  -- * \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
  -- * \param dst a pointer to be filled in with new pixel data.
  -- * \param dst_pitch the pitch of the destination pixels, in bytes.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety The same destination pixels should not be used from two
  -- *               threads at once. It is safe to use the same source pixels
  -- *               from multiple threads.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ConvertPixelsAndColorspace
  --  

   function SDL_ConvertPixels
     (width : int;
      height : int;
      src_format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      src : System.Address;
      src_pitch : int;
      dst_format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      dst : System.Address;
      dst_pitch : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1173
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ConvertPixels";

  --*
  -- * Copy a block of pixels of one format and colorspace to another format and
  -- * colorspace.
  -- *
  -- * \param width the width of the block to copy, in pixels.
  -- * \param height the height of the block to copy, in pixels.
  -- * \param src_format an SDL_PixelFormat value of the `src` pixels format.
  -- * \param src_colorspace an SDL_Colorspace value describing the colorspace of
  -- *                       the `src` pixels.
  -- * \param src_properties an SDL_PropertiesID with additional source color
  -- *                       properties, or 0.
  -- * \param src a pointer to the source pixels.
  -- * \param src_pitch the pitch of the source pixels, in bytes.
  -- * \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
  -- * \param dst_colorspace an SDL_Colorspace value describing the colorspace of
  -- *                       the `dst` pixels.
  -- * \param dst_properties an SDL_PropertiesID with additional destination color
  -- *                       properties, or 0.
  -- * \param dst a pointer to be filled in with new pixel data.
  -- * \param dst_pitch the pitch of the destination pixels, in bytes.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety The same destination pixels should not be used from two
  -- *               threads at once. It is safe to use the same source pixels
  -- *               from multiple threads.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ConvertPixels
  --  

   function SDL_ConvertPixelsAndColorspace
     (width : int;
      height : int;
      src_format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      src_colorspace : SDL3_SDL_pixels_h.SDL_Colorspace;
      src_properties : SDL3_SDL_properties_h.SDL_PropertiesID;
      src : System.Address;
      src_pitch : int;
      dst_format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      dst_colorspace : SDL3_SDL_pixels_h.SDL_Colorspace;
      dst_properties : SDL3_SDL_properties_h.SDL_PropertiesID;
      dst : System.Address;
      dst_pitch : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1206
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ConvertPixelsAndColorspace";

  --*
  -- * Premultiply the alpha on a block of pixels.
  -- *
  -- * This is safe to use with src == dst, but not for other overlapping areas.
  -- *
  -- * \param width the width of the block to convert, in pixels.
  -- * \param height the height of the block to convert, in pixels.
  -- * \param src_format an SDL_PixelFormat value of the `src` pixels format.
  -- * \param src a pointer to the source pixels.
  -- * \param src_pitch the pitch of the source pixels, in bytes.
  -- * \param dst_format an SDL_PixelFormat value of the `dst` pixels format.
  -- * \param dst a pointer to be filled in with premultiplied pixel data.
  -- * \param dst_pitch the pitch of the destination pixels, in bytes.
  -- * \param linear true to convert from sRGB to linear space for the alpha
  -- *               multiplication, false to do multiplication in sRGB space.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety The same destination pixels should not be used from two
  -- *               threads at once. It is safe to use the same source pixels
  -- *               from multiple threads.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_PremultiplyAlpha
     (width : int;
      height : int;
      src_format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      src : System.Address;
      src_pitch : int;
      dst_format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      dst : System.Address;
      dst_pitch : int;
      linear : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1232
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PremultiplyAlpha";

  --*
  -- * Premultiply the alpha in a surface.
  -- *
  -- * This is safe to use with src == dst, but not for other overlapping areas.
  -- *
  -- * \param surface the surface to modify.
  -- * \param linear true to convert from sRGB to linear space for the alpha
  -- *               multiplication, false to do multiplication in sRGB space.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_PremultiplySurfaceAlpha (surface : access SDL_Surface; linear : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1250
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PremultiplySurfaceAlpha";

  --*
  -- * Clear a surface with a specific color, with floating point precision.
  -- *
  -- * This function handles all surface formats, and ignores any clip rectangle.
  -- *
  -- * If the surface is YUV, the color is assumed to be in the sRGB colorspace,
  -- * otherwise the color is assumed to be in the colorspace of the surface.
  -- *
  -- * \param surface the SDL_Surface to clear.
  -- * \param r the red component of the pixel, normally in the range 0-1.
  -- * \param g the green component of the pixel, normally in the range 0-1.
  -- * \param b the blue component of the pixel, normally in the range 0-1.
  -- * \param a the alpha component of the pixel, normally in the range 0-1.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_ClearSurface
     (surface : access SDL_Surface;
      r : float;
      g : float;
      b : float;
      a : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1273
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ClearSurface";

  --*
  -- * Perform a fast fill of a rectangle with a specific color.
  -- *
  -- * `color` should be a pixel of the format used by the surface, and can be
  -- * generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
  -- * alpha component then the destination is simply filled with that alpha
  -- * information, no blending takes place.
  -- *
  -- * If there is a clip rectangle set on the destination (set via
  -- * SDL_SetSurfaceClipRect()), then this function will fill based on the
  -- * intersection of the clip rectangle and `rect`.
  -- *
  -- * \param dst the SDL_Surface structure that is the drawing target.
  -- * \param rect the SDL_Rect structure representing the rectangle to fill, or
  -- *             NULL to fill the entire surface.
  -- * \param color the color to fill with.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_FillSurfaceRects
  --  

   function SDL_FillSurfaceRect
     (dst : access SDL_Surface;
      rect : access constant SDL3_SDL_rect_h.SDL_Rect;
      color : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1301
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FillSurfaceRect";

  --*
  -- * Perform a fast fill of a set of rectangles with a specific color.
  -- *
  -- * `color` should be a pixel of the format used by the surface, and can be
  -- * generated by SDL_MapRGB() or SDL_MapRGBA(). If the color value contains an
  -- * alpha component then the destination is simply filled with that alpha
  -- * information, no blending takes place.
  -- *
  -- * If there is a clip rectangle set on the destination (set via
  -- * SDL_SetSurfaceClipRect()), then this function will fill based on the
  -- * intersection of the clip rectangle and `rect`.
  -- *
  -- * \param dst the SDL_Surface structure that is the drawing target.
  -- * \param rects an array of SDL_Rects representing the rectangles to fill.
  -- * \param count the number of rectangles in the array.
  -- * \param color the color to fill with.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_FillSurfaceRect
  --  

   function SDL_FillSurfaceRects
     (dst : access SDL_Surface;
      rects : access constant SDL3_SDL_rect_h.SDL_Rect;
      count : int;
      color : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1329
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FillSurfaceRects";

  --*
  -- * Performs a fast blit from the source surface to the destination surface
  -- * with clipping.
  -- *
  -- * If either `srcrect` or `dstrect` are NULL, the entire surface (`src` or
  -- * `dst`) is copied while ensuring clipping to `dst->clip_rect`.
  -- *
  -- * The blit function should not be called on a locked surface.
  -- *
  -- * The blit semantics for surfaces with and without blending and colorkey are
  -- * defined as follows:
  -- *
  -- * ```
  -- *    RGBA->RGB:
  -- *      Source surface blend mode set to SDL_BLENDMODE_BLEND:
  -- *       alpha-blend (using the source alpha-channel and per-surface alpha)
  -- *       SDL_SRCCOLORKEY ignored.
  -- *     Source surface blend mode set to SDL_BLENDMODE_NONE:
  -- *       copy RGB.
  -- *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  -- *       RGB values of the source color key, ignoring alpha in the
  -- *       comparison.
  -- *
  -- *   RGB->RGBA:
  -- *     Source surface blend mode set to SDL_BLENDMODE_BLEND:
  -- *       alpha-blend (using the source per-surface alpha)
  -- *     Source surface blend mode set to SDL_BLENDMODE_NONE:
  -- *       copy RGB, set destination alpha to source per-surface alpha value.
  -- *     both:
  -- *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  -- *       source color key.
  -- *
  -- *   RGBA->RGBA:
  -- *     Source surface blend mode set to SDL_BLENDMODE_BLEND:
  -- *       alpha-blend (using the source alpha-channel and per-surface alpha)
  -- *       SDL_SRCCOLORKEY ignored.
  -- *     Source surface blend mode set to SDL_BLENDMODE_NONE:
  -- *       copy all of RGBA to the destination.
  -- *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  -- *       RGB values of the source color key, ignoring alpha in the
  -- *       comparison.
  -- *
  -- *   RGB->RGB:
  -- *     Source surface blend mode set to SDL_BLENDMODE_BLEND:
  -- *       alpha-blend (using the source per-surface alpha)
  -- *     Source surface blend mode set to SDL_BLENDMODE_NONE:
  -- *       copy RGB.
  -- *     both:
  -- *       if SDL_SRCCOLORKEY set, only copy the pixels that do not match the
  -- *       source color key.
  -- * ```
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, or NULL to copy the entire surface.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the x and y position in
  -- *                the destination surface, or NULL for (0,0). The width and
  -- *                height are ignored, and are copied from `srcrect`. If you
  -- *                want a specific width and height, you should use
  -- *                SDL_BlitSurfaceScaled().
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurfaceScaled
  --  

   function SDL_BlitSurface
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1402
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurface";

  --*
  -- * Perform low-level surface blitting only.
  -- *
  -- * This is a semi-private blit function and it performs low-level surface
  -- * blitting, assuming the input rectangles have already been clipped.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, may not be NULL.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, may not be NULL.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurface
  --  

   function SDL_BlitSurfaceUnchecked
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1426
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurfaceUnchecked";

  --*
  -- * Perform a scaled blit to a destination surface, which may be of a different
  -- * format.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, or NULL to copy the entire surface.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, or NULL to fill the entire
  -- *                destination surface.
  -- * \param scaleMode the SDL_ScaleMode to be used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurface
  --  

   function SDL_BlitSurfaceScaled
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      scaleMode : SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1450
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurfaceScaled";

  --*
  -- * Perform low-level surface scaled blitting only.
  -- *
  -- * This is a semi-private function and it performs low-level surface blitting,
  -- * assuming the input rectangles have already been clipped.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, may not be NULL.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, may not be NULL.
  -- * \param scaleMode the SDL_ScaleMode to be used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurfaceScaled
  --  

   function SDL_BlitSurfaceUncheckedScaled
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      scaleMode : SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1475
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurfaceUncheckedScaled";

  --*
  -- * Perform a stretched pixel copy from one surface to another.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, or NULL to copy the entire surface.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, or NULL to fill the entire
  -- *                destination surface.
  -- * \param scaleMode the SDL_ScaleMode to be used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_BlitSurfaceScaled
  --  

   function SDL_StretchSurface
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      scaleMode : SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1498
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StretchSurface";

  --*
  -- * Perform a tiled blit to a destination surface, which may be of a different
  -- * format.
  -- *
  -- * The pixels in `srcrect` will be repeated as many times as needed to
  -- * completely fill `dstrect`.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, or NULL to copy the entire surface.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, or NULL to fill the entire surface.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurface
  --  

   function SDL_BlitSurfaceTiled
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1523
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurfaceTiled";

  --*
  -- * Perform a scaled and tiled blit to a destination surface, which may be of a
  -- * different format.
  -- *
  -- * The pixels in `srcrect` will be scaled and repeated as many times as needed
  -- * to completely fill `dstrect`.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be
  -- *                copied, or NULL to copy the entire surface.
  -- * \param scale the scale used to transform srcrect into the destination
  -- *              rectangle, e.g. a 32x32 texture with a scale of 2 would fill
  -- *              64x64 tiles.
  -- * \param scaleMode scale algorithm to be used.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, or NULL to fill the entire surface.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurface
  --  

   function SDL_BlitSurfaceTiledWithScale
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      scale : float;
      scaleMode : SDL_ScaleMode;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1552
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurfaceTiledWithScale";

  --*
  -- * Perform a scaled blit using the 9-grid algorithm to a destination surface,
  -- * which may be of a different format.
  -- *
  -- * The pixels in the source surface are split into a 3x3 grid, using the
  -- * different corner sizes for each corner, and the sides and center making up
  -- * the remaining pixels. The corners are then scaled using `scale` and fit
  -- * into the corners of the destination rectangle. The sides and center are
  -- * then stretched into place to cover the remaining destination rectangle.
  -- *
  -- * \param src the SDL_Surface structure to be copied from.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be used
  -- *                for the 9-grid, or NULL to use the entire surface.
  -- * \param left_width the width, in pixels, of the left corners in `srcrect`.
  -- * \param right_width the width, in pixels, of the right corners in `srcrect`.
  -- * \param top_height the height, in pixels, of the top corners in `srcrect`.
  -- * \param bottom_height the height, in pixels, of the bottom corners in
  -- *                      `srcrect`.
  -- * \param scale the scale used to transform the corner of `srcrect` into the
  -- *              corner of `dstrect`, or 0.0f for an unscaled blit.
  -- * \param scaleMode scale algorithm to be used.
  -- * \param dst the SDL_Surface structure that is the blit target.
  -- * \param dstrect the SDL_Rect structure representing the target rectangle in
  -- *                the destination surface, or NULL to fill the entire surface.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety Only one thread should be using the `src` and `dst` surfaces
  -- *               at any given time.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitSurface
  --  

   function SDL_BlitSurface9Grid
     (src : access SDL_Surface;
      srcrect : access constant SDL3_SDL_rect_h.SDL_Rect;
      left_width : int;
      right_width : int;
      top_height : int;
      bottom_height : int;
      scale : float;
      scaleMode : SDL_ScaleMode;
      dst : access SDL_Surface;
      dstrect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1588
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitSurface9Grid";

  --*
  -- * Map an RGB triple to an opaque pixel value for a surface.
  -- *
  -- * This function maps the RGB color value to the specified pixel format and
  -- * returns the pixel value best approximating the given RGB color value for
  -- * the given pixel format.
  -- *
  -- * If the surface has a palette, the index of the closest matching color in
  -- * the palette will be returned.
  -- *
  -- * If the surface pixel format has an alpha component it will be returned as
  -- * all 1 bits (fully opaque).
  -- *
  -- * If the pixel format bpp (color depth) is less than 32-bpp then the unused
  -- * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
  -- * format the return value can be assigned to a Uint16, and similarly a Uint8
  -- * for an 8-bpp format).
  -- *
  -- * \param surface the surface to use for the pixel format and palette.
  -- * \param r the red component of the pixel in the range 0-255.
  -- * \param g the green component of the pixel in the range 0-255.
  -- * \param b the blue component of the pixel in the range 0-255.
  -- * \returns a pixel value.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MapSurfaceRGBA
  --  

   function SDL_MapSurfaceRGB
     (surface : access SDL_Surface;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_surface.h:1621
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MapSurfaceRGB";

  --*
  -- * Map an RGBA quadruple to a pixel value for a surface.
  -- *
  -- * This function maps the RGBA color value to the specified pixel format and
  -- * returns the pixel value best approximating the given RGBA color value for
  -- * the given pixel format.
  -- *
  -- * If the surface pixel format has no alpha component the alpha value will be
  -- * ignored (as it will be in formats with a palette).
  -- *
  -- * If the surface has a palette, the index of the closest matching color in
  -- * the palette will be returned.
  -- *
  -- * If the pixel format bpp (color depth) is less than 32-bpp then the unused
  -- * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
  -- * format the return value can be assigned to a Uint16, and similarly a Uint8
  -- * for an 8-bpp format).
  -- *
  -- * \param surface the surface to use for the pixel format and palette.
  -- * \param r the red component of the pixel in the range 0-255.
  -- * \param g the green component of the pixel in the range 0-255.
  -- * \param b the blue component of the pixel in the range 0-255.
  -- * \param a the alpha component of the pixel in the range 0-255.
  -- * \returns a pixel value.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_MapSurfaceRGB
  --  

   function SDL_MapSurfaceRGBA
     (surface : access SDL_Surface;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8;
      a : SDL3_SDL_stdinc_h.Uint8) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_surface.h:1655
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MapSurfaceRGBA";

  --*
  -- * Retrieves a single pixel from a surface.
  -- *
  -- * This function prioritizes correctness over speed: it is suitable for unit
  -- * tests, but is not intended for use in a game engine.
  -- *
  -- * Like SDL_GetRGBA, this uses the entire 0..255 range when converting color
  -- * components from pixel formats with less than 8 bits per RGB component.
  -- *
  -- * \param surface the surface to read.
  -- * \param x the horizontal coordinate, 0 <= x < width.
  -- * \param y the vertical coordinate, 0 <= y < height.
  -- * \param r a pointer filled in with the red channel, 0-255, or NULL to ignore
  -- *          this channel.
  -- * \param g a pointer filled in with the green channel, 0-255, or NULL to
  -- *          ignore this channel.
  -- * \param b a pointer filled in with the blue channel, 0-255, or NULL to
  -- *          ignore this channel.
  -- * \param a a pointer filled in with the alpha channel, 0-255, or NULL to
  -- *          ignore this channel.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_ReadSurfacePixel
     (surface : access SDL_Surface;
      x : int;
      y : int;
      r : access SDL3_SDL_stdinc_h.Uint8;
      g : access SDL3_SDL_stdinc_h.Uint8;
      b : access SDL3_SDL_stdinc_h.Uint8;
      a : access SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1685
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadSurfacePixel";

  --*
  -- * Retrieves a single pixel from a surface.
  -- *
  -- * This function prioritizes correctness over speed: it is suitable for unit
  -- * tests, but is not intended for use in a game engine.
  -- *
  -- * \param surface the surface to read.
  -- * \param x the horizontal coordinate, 0 <= x < width.
  -- * \param y the vertical coordinate, 0 <= y < height.
  -- * \param r a pointer filled in with the red channel, normally in the range
  -- *          0-1, or NULL to ignore this channel.
  -- * \param g a pointer filled in with the green channel, normally in the range
  -- *          0-1, or NULL to ignore this channel.
  -- * \param b a pointer filled in with the blue channel, normally in the range
  -- *          0-1, or NULL to ignore this channel.
  -- * \param a a pointer filled in with the alpha channel, normally in the range
  -- *          0-1, or NULL to ignore this channel.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_ReadSurfacePixelFloat
     (surface : access SDL_Surface;
      x : int;
      y : int;
      r : access float;
      g : access float;
      b : access float;
      a : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1712
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReadSurfacePixelFloat";

  --*
  -- * Writes a single pixel to a surface.
  -- *
  -- * This function prioritizes correctness over speed: it is suitable for unit
  -- * tests, but is not intended for use in a game engine.
  -- *
  -- * Like SDL_MapRGBA, this uses the entire 0..255 range when converting color
  -- * components from pixel formats with less than 8 bits per RGB component.
  -- *
  -- * \param surface the surface to write.
  -- * \param x the horizontal coordinate, 0 <= x < width.
  -- * \param y the vertical coordinate, 0 <= y < height.
  -- * \param r the red channel value, 0-255.
  -- * \param g the green channel value, 0-255.
  -- * \param b the blue channel value, 0-255.
  -- * \param a the alpha channel value, 0-255.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_WriteSurfacePixel
     (surface : access SDL_Surface;
      x : int;
      y : int;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8;
      a : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1738
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteSurfacePixel";

  --*
  -- * Writes a single pixel to a surface.
  -- *
  -- * This function prioritizes correctness over speed: it is suitable for unit
  -- * tests, but is not intended for use in a game engine.
  -- *
  -- * \param surface the surface to write.
  -- * \param x the horizontal coordinate, 0 <= x < width.
  -- * \param y the vertical coordinate, 0 <= y < height.
  -- * \param r the red channel value, normally in the range 0-1.
  -- * \param g the green channel value, normally in the range 0-1.
  -- * \param b the blue channel value, normally in the range 0-1.
  -- * \param a the alpha channel value, normally in the range 0-1.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function can be called on different threads with
  -- *               different surfaces.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_WriteSurfacePixelFloat
     (surface : access SDL_Surface;
      x : int;
      y : int;
      r : float;
      g : float;
      b : float;
      a : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_surface.h:1761
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WriteSurfacePixelFloat";

  -- Ends C function definitions when using C++  
end SDL3_SDL_surface_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
