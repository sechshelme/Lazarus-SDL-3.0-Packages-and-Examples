pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package SDL3_SDL_pixels_h is

   SDL_ALPHA_OPAQUE : constant := 255;  --  /usr/local/include/SDL3/SDL_pixels.h:100

   SDL_ALPHA_OPAQUE_FLOAT : constant := 1.0;  --  /usr/local/include/SDL3/SDL_pixels.h:109

   SDL_ALPHA_TRANSPARENT : constant := 0;  --  /usr/local/include/SDL3/SDL_pixels.h:118

   SDL_ALPHA_TRANSPARENT_FLOAT : constant := 0.0;  --  /usr/local/include/SDL3/SDL_pixels.h:127
   --  arg-macro: procedure SDL_DEFINE_PIXELFOURCC (A, B, C, D)
   --    SDL_FOURCC(A, B, C, D)
   --  arg-macro: function SDL_DEFINE_PIXELFORMAT (type, order, layout, bits, bytes)
   --    return (2 ** 28) or ((type) << 24) or ((order) << 20) or ((layout) << 16) or ((bits) << 8) or ((bytes) << 0);
   --  arg-macro: function SDL_PIXELFLAG (format)
   --    return ((format) >> 28) and 16#0F#;
   --  arg-macro: function SDL_PIXELTYPE (format)
   --    return ((format) >> 24) and 16#0F#;
   --  arg-macro: function SDL_PIXELORDER (format)
   --    return ((format) >> 20) and 16#0F#;
   --  arg-macro: function SDL_PIXELLAYOUT (format)
   --    return ((format) >> 16) and 16#0F#;
   --  arg-macro: function SDL_BITSPERPIXEL (format)
   --    return SDL_ISPIXELFORMAT_FOURCC(format) ? 0 : (((format) >> 8) and 16#FF#);
   --  arg-macro: function SDL_BYTESPERPIXEL (format)
   --    return SDL_ISPIXELFORMAT_FOURCC(format) ? ((((format) = SDL_PIXELFORMAT_YUY2)  or else  ((format) = SDL_PIXELFORMAT_UYVY)  or else  ((format) = SDL_PIXELFORMAT_YVYU)  or else  ((format) = SDL_PIXELFORMAT_P010)) ? 2 : 1) : (((format) >> 0) and 16#FF#);
   --  arg-macro: function SDL_ISPIXELFORMAT_INDEXED (format)
   --    return notSDL_ISPIXELFORMAT_FOURCC(format)  and then  ((SDL_PIXELTYPE(format) = SDL_PIXELTYPE_INDEX1)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_INDEX2)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_INDEX4)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_INDEX8));
   --  arg-macro: function SDL_ISPIXELFORMAT_PACKED (format)
   --    return notSDL_ISPIXELFORMAT_FOURCC(format)  and then  ((SDL_PIXELTYPE(format) = SDL_PIXELTYPE_PACKED8)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_PACKED16)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_PACKED32));
   --  arg-macro: function SDL_ISPIXELFORMAT_ARRAY (format)
   --    return notSDL_ISPIXELFORMAT_FOURCC(format)  and then  ((SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYU8)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYU16)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYU32)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYF16)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYF32));
   --  arg-macro: function SDL_ISPIXELFORMAT_10BIT (format)
   --    return notSDL_ISPIXELFORMAT_FOURCC(format)  and then  ((SDL_PIXELTYPE(format) = SDL_PIXELTYPE_PACKED32)  and then  (SDL_PIXELLAYOUT(format) = SDL_PACKEDLAYOUT_2101010));
   --  arg-macro: function SDL_ISPIXELFORMAT_FLOAT (format)
   --    return notSDL_ISPIXELFORMAT_FOURCC(format)  and then  ((SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYF16)  or else  (SDL_PIXELTYPE(format) = SDL_PIXELTYPE_ARRAYF32));
   --  arg-macro: function SDL_ISPIXELFORMAT_ALPHA (format)
   --    return (SDL_ISPIXELFORMAT_PACKED(format)  and then  ((SDL_PIXELORDER(format) = SDL_PACKEDORDER_ARGB)  or else  (SDL_PIXELORDER(format) = SDL_PACKEDORDER_RGBA)  or else  (SDL_PIXELORDER(format) = SDL_PACKEDORDER_ABGR)  or else  (SDL_PIXELORDER(format) = SDL_PACKEDORDER_BGRA)))  or else  (SDL_ISPIXELFORMAT_ARRAY(format)  and then  ((SDL_PIXELORDER(format) = SDL_ARRAYORDER_ARGB)  or else  (SDL_PIXELORDER(format) = SDL_ARRAYORDER_RGBA)  or else  (SDL_PIXELORDER(format) = SDL_ARRAYORDER_ABGR)  or else  (SDL_PIXELORDER(format) = SDL_ARRAYORDER_BGRA)));
   --  arg-macro: function SDL_ISPIXELFORMAT_FOURCC (format)
   --    return (format)  and then  (SDL_PIXELFLAG(format) /= 1);
   --  arg-macro: function SDL_DEFINE_COLORSPACE (type, range, primaries, transfer, matrix, chroma)
   --    return ((Uint32)(type) << 28) or ((Uint32)(range) << 24) or ((Uint32)(chroma) << 20) or ((Uint32)(primaries) << 10) or ((Uint32)(transfer) << 5) or ((Uint32)(matrix) << 0);
   --  arg-macro: function SDL_COLORSPACETYPE (cspace)
   --    return SDL_ColorType)(((cspace) >> 28) and 16#0F#;
   --  arg-macro: function SDL_COLORSPACERANGE (cspace)
   --    return SDL_ColorRange)(((cspace) >> 24) and 16#0F#;
   --  arg-macro: function SDL_COLORSPACECHROMA (cspace)
   --    return SDL_ChromaLocation)(((cspace) >> 20) and 16#0F#;
   --  arg-macro: function SDL_COLORSPACEPRIMARIES (cspace)
   --    return SDL_ColorPrimaries)(((cspace) >> 10) and 16#1F#;
   --  arg-macro: function SDL_COLORSPACETRANSFER (cspace)
   --    return SDL_TransferCharacteristics)(((cspace) >> 5) and 16#1F#;
   --  arg-macro: function SDL_COLORSPACEMATRIX (cspace)
   --    return SDL_MatrixCoefficients)((cspace) and 16#1F#;
   --  arg-macro: function SDL_ISCOLORSPACE_MATRIX_BT601 (cspace)
   --    return SDL_COLORSPACEMATRIX(cspace) = SDL_MATRIX_COEFFICIENTS_BT601  or else  SDL_COLORSPACEMATRIX(cspace) = SDL_MATRIX_COEFFICIENTS_BT470BG;
   --  arg-macro: function SDL_ISCOLORSPACE_MATRIX_BT709 (cspace)
   --    return SDL_COLORSPACEMATRIX(cspace) = SDL_MATRIX_COEFFICIENTS_BT709;
   --  arg-macro: function SDL_ISCOLORSPACE_MATRIX_BT2020_NCL (cspace)
   --    return SDL_COLORSPACEMATRIX(cspace) = SDL_MATRIX_COEFFICIENTS_BT2020_NCL;
   --  arg-macro: function SDL_ISCOLORSPACE_LIMITED_RANGE (cspace)
   --    return SDL_COLORSPACERANGE(cspace) /= SDL_COLOR_RANGE_FULL;
   --  arg-macro: function SDL_ISCOLORSPACE_FULL_RANGE (cspace)
   --    return SDL_COLORSPACERANGE(cspace) = SDL_COLOR_RANGE_FULL;

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
  -- * # CategoryPixels
  -- *
  -- * SDL offers facilities for pixel management.
  -- *
  -- * Largely these facilities deal with pixel _format_: what does this set of
  -- * bits represent?
  -- *
  -- * If you mostly want to think of a pixel as some combination of red, green,
  -- * blue, and maybe alpha intensities, this is all pretty straightforward, and
  -- * in many cases, is enough information to build a perfectly fine game.
  -- *
  -- * However, the actual definition of a pixel is more complex than that:
  -- *
  -- * Pixels are a representation of a color in a particular color space.
  -- *
  -- * The first characteristic of a color space is the color type. SDL
  -- * understands two different color types, RGB and YCbCr, or in SDL also
  -- * referred to as YUV.
  -- *
  -- * RGB colors consist of red, green, and blue channels of color that are added
  -- * together to represent the colors we see on the screen.
  -- *
  -- * https://en.wikipedia.org/wiki/RGB_color_model
  -- *
  -- * YCbCr colors represent colors as a Y luma brightness component and red and
  -- * blue chroma color offsets. This color representation takes advantage of the
  -- * fact that the human eye is more sensitive to brightness than the color in
  -- * an image. The Cb and Cr components are often compressed and have lower
  -- * resolution than the luma component.
  -- *
  -- * https://en.wikipedia.org/wiki/YCbCr
  -- *
  -- * When the color information in YCbCr is compressed, the Y pixels are left at
  -- * full resolution and each Cr and Cb pixel represents an average of the color
  -- * information in a block of Y pixels. The chroma location determines where in
  -- * that block of pixels the color information is coming from.
  -- *
  -- * The color range defines how much of the pixel to use when converting a
  -- * pixel into a color on the display. When the full color range is used, the
  -- * entire numeric range of the pixel bits is significant. When narrow color
  -- * range is used, for historical reasons, the pixel uses only a portion of the
  -- * numeric range to represent colors.
  -- *
  -- * The color primaries and white point are a definition of the colors in the
  -- * color space relative to the standard XYZ color space.
  -- *
  -- * https://en.wikipedia.org/wiki/CIE_1931_color_space
  -- *
  -- * The transfer characteristic, or opto-electrical transfer function (OETF),
  -- * is the way a color is converted from mathematically linear space into a
  -- * non-linear output signals.
  -- *
  -- * https://en.wikipedia.org/wiki/Rec._709#Transfer_characteristics
  -- *
  -- * The matrix coefficients are used to convert between YCbCr and RGB colors.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * A fully opaque 8-bit alpha value.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ALPHA_TRANSPARENT
  --  

  --*
  -- * A fully opaque floating point alpha value.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ALPHA_TRANSPARENT_FLOAT
  --  

  --*
  -- * A fully transparent 8-bit alpha value.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ALPHA_OPAQUE
  --  

  --*
  -- * A fully transparent floating point alpha value.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ALPHA_OPAQUE_FLOAT
  --  

  --*
  -- * Pixel type.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_PixelType is 
     (SDL_PIXELTYPE_UNKNOWN,
      SDL_PIXELTYPE_INDEX1,
      SDL_PIXELTYPE_INDEX4,
      SDL_PIXELTYPE_INDEX8,
      SDL_PIXELTYPE_PACKED8,
      SDL_PIXELTYPE_PACKED16,
      SDL_PIXELTYPE_PACKED32,
      SDL_PIXELTYPE_ARRAYU8,
      SDL_PIXELTYPE_ARRAYU16,
      SDL_PIXELTYPE_ARRAYU32,
      SDL_PIXELTYPE_ARRAYF16,
      SDL_PIXELTYPE_ARRAYF32,
      SDL_PIXELTYPE_INDEX2)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:134

  -- appended at the end for compatibility with sdl2-compat:   
  --*
  -- * Bitmap pixel order, high bit -> low bit.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_BitmapOrder is 
     (SDL_BITMAPORDER_NONE,
      SDL_BITMAPORDER_4321,
      SDL_BITMAPORDER_1234)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:157

  --*
  -- * Packed component order, high bit -> low bit.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_PackedOrder is 
     (SDL_PACKEDORDER_NONE,
      SDL_PACKEDORDER_XRGB,
      SDL_PACKEDORDER_RGBX,
      SDL_PACKEDORDER_ARGB,
      SDL_PACKEDORDER_RGBA,
      SDL_PACKEDORDER_XBGR,
      SDL_PACKEDORDER_BGRX,
      SDL_PACKEDORDER_ABGR,
      SDL_PACKEDORDER_BGRA)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:169

  --*
  -- * Array component order, low byte -> high byte.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_ArrayOrder is 
     (SDL_ARRAYORDER_NONE,
      SDL_ARRAYORDER_RGB,
      SDL_ARRAYORDER_RGBA,
      SDL_ARRAYORDER_ARGB,
      SDL_ARRAYORDER_BGR,
      SDL_ARRAYORDER_BGRA,
      SDL_ARRAYORDER_ABGR)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:187

  --*
  -- * Packed component layout.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_PackedLayout is 
     (SDL_PACKEDLAYOUT_NONE,
      SDL_PACKEDLAYOUT_332,
      SDL_PACKEDLAYOUT_4444,
      SDL_PACKEDLAYOUT_1555,
      SDL_PACKEDLAYOUT_5551,
      SDL_PACKEDLAYOUT_565,
      SDL_PACKEDLAYOUT_8888,
      SDL_PACKEDLAYOUT_2101010,
      SDL_PACKEDLAYOUT_1010102)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:203

  --*
  -- * A macro for defining custom FourCC pixel formats.
  -- *
  -- * For example, defining SDL_PIXELFORMAT_YV12 looks like this:
  -- *
  -- * ```c
  -- * SDL_DEFINE_PIXELFOURCC('Y', 'V', '1', '2')
  -- * ```
  -- *
  -- * \param A the first character of the FourCC code.
  -- * \param B the second character of the FourCC code.
  -- * \param C the third character of the FourCC code.
  -- * \param D the fourth character of the FourCC code.
  -- * \returns a format value in the style of SDL_PixelFormat.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro for defining custom non-FourCC pixel formats.
  -- *
  -- * For example, defining SDL_PIXELFORMAT_RGBA8888 looks like this:
  -- *
  -- * ```c
  -- * SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4)
  -- * ```
  -- *
  -- * \param type the type of the new format, probably a SDL_PixelType value.
  -- * \param order the order of the new format, probably a SDL_BitmapOrder,
  -- *              SDL_PackedOrder, or SDL_ArrayOrder value.
  -- * \param layout the layout of the new format, probably an SDL_PackedLayout
  -- *               value or zero.
  -- * \param bits the number of bits per pixel of the new format.
  -- * \param bytes the number of bytes per pixel of the new format.
  -- * \returns a format value in the style of SDL_PixelFormat.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the flags of an SDL_PixelFormat.
  -- *
  -- * This macro is generally not needed directly by an app, which should use
  -- * specific tests, like SDL_ISPIXELFORMAT_FOURCC, instead.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns the flags of `format`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the type of an SDL_PixelFormat.
  -- *
  -- * This is usually a value from the SDL_PixelType enumeration.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns the type of `format`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the order of an SDL_PixelFormat.
  -- *
  -- * This is usually a value from the SDL_BitmapOrder, SDL_PackedOrder, or
  -- * SDL_ArrayOrder enumerations, depending on the format type.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns the order of `format`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the layout of an SDL_PixelFormat.
  -- *
  -- * This is usually a value from the SDL_PackedLayout enumeration, or zero if a
  -- * layout doesn't make sense for the format type.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns the layout of `format`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine an SDL_PixelFormat's bits per pixel.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * FourCC formats will report zero here, as it rarely makes sense to measure
  -- * them per-pixel.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns the bits-per-pixel of `format`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BYTESPERPIXEL
  --  

  --*
  -- * A macro to determine an SDL_PixelFormat's bytes per pixel.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * FourCC formats do their best here, but many of them don't have a meaningful
  -- * measurement of bytes per pixel.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns the bytes-per-pixel of `format`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BITSPERPIXEL
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat is an indexed format.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format is indexed, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat is a packed format.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format is packed, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat is an array format.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format is an array, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat is a 10-bit format.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format is 10-bit, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat is a floating point format.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format is a floating point, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat has an alpha channel.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format has alpha, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_PixelFormat is a "FourCC" format.
  -- *
  -- * This covers custom and other unusual formats.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param format an SDL_PixelFormat to check.
  -- * \returns true if the format has alpha, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- Note: If you modify this enum, update SDL_GetPixelFormatName()  
  --*
  -- * Pixel format.
  -- *
  -- * SDL's pixel formats have the following naming convention:
  -- *
  -- * - Names with a list of components and a single bit count, such as RGB24 and
  -- *   ABGR32, define a platform-independent encoding into bytes in the order
  -- *   specified. For example, in RGB24 data, each pixel is encoded in 3 bytes
  -- *   (red, green, blue) in that order, and in ABGR32 data, each pixel is
  -- *   encoded in 4 bytes (alpha, blue, green, red) in that order. Use these
  -- *   names if the property of a format that is important to you is the order
  -- *   of the bytes in memory or on disk.
  -- * - Names with a bit count per component, such as ARGB8888 and XRGB1555, are
  -- *   "packed" into an appropriately-sized integer in the platform's native
  -- *   endianness. For example, ARGB8888 is a sequence of 32-bit integers; in
  -- *   each integer, the most significant bits are alpha, and the least
  -- *   significant bits are blue. On a little-endian CPU such as x86, the least
  -- *   significant bits of each integer are arranged first in memory, but on a
  -- *   big-endian CPU such as s390x, the most significant bits are arranged
  -- *   first. Use these names if the property of a format that is important to
  -- *   you is the meaning of each bit position within a native-endianness
  -- *   integer.
  -- * - In indexed formats such as INDEX4LSB, each pixel is represented by
  -- *   encoding an index into the palette into the indicated number of bits,
  -- *   with multiple pixels packed into each byte if appropriate. In LSB
  -- *   formats, the first (leftmost) pixel is stored in the least-significant
  -- *   bits of the byte; in MSB formats, it's stored in the most-significant
  -- *   bits. INDEX8 does not need LSB/MSB variants, because each pixel exactly
  -- *   fills one byte.
  -- *
  -- * The 32-bit byte-array encodings such as RGBA32 are aliases for the
  -- * appropriate 8888 encoding for the current platform. For example, RGBA32 is
  -- * an alias for ABGR8888 on little-endian CPUs like x86, or an alias for
  -- * RGBA8888 on big-endian CPUs.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_PixelFormat is unsigned;
   SDL_PixelFormat_SDL_PIXELFORMAT_UNKNOWN : constant SDL_PixelFormat := 0;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX1LSB : constant SDL_PixelFormat := 286261504;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX1MSB : constant SDL_PixelFormat := 287310080;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX2LSB : constant SDL_PixelFormat := 470811136;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX2MSB : constant SDL_PixelFormat := 471859712;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX4LSB : constant SDL_PixelFormat := 303039488;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX4MSB : constant SDL_PixelFormat := 304088064;
   SDL_PixelFormat_SDL_PIXELFORMAT_INDEX8 : constant SDL_PixelFormat := 318769153;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGB332 : constant SDL_PixelFormat := 336660481;
   SDL_PixelFormat_SDL_PIXELFORMAT_XRGB4444 : constant SDL_PixelFormat := 353504258;
   SDL_PixelFormat_SDL_PIXELFORMAT_XBGR4444 : constant SDL_PixelFormat := 357698562;
   SDL_PixelFormat_SDL_PIXELFORMAT_XRGB1555 : constant SDL_PixelFormat := 353570562;
   SDL_PixelFormat_SDL_PIXELFORMAT_XBGR1555 : constant SDL_PixelFormat := 357764866;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB4444 : constant SDL_PixelFormat := 355602434;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA4444 : constant SDL_PixelFormat := 356651010;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR4444 : constant SDL_PixelFormat := 359796738;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA4444 : constant SDL_PixelFormat := 360845314;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB1555 : constant SDL_PixelFormat := 355667970;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA5551 : constant SDL_PixelFormat := 356782082;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR1555 : constant SDL_PixelFormat := 359862274;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA5551 : constant SDL_PixelFormat := 360976386;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGB565 : constant SDL_PixelFormat := 353701890;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGR565 : constant SDL_PixelFormat := 357896194;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGB24 : constant SDL_PixelFormat := 386930691;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGR24 : constant SDL_PixelFormat := 390076419;
   SDL_PixelFormat_SDL_PIXELFORMAT_XRGB8888 : constant SDL_PixelFormat := 370546692;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBX8888 : constant SDL_PixelFormat := 371595268;
   SDL_PixelFormat_SDL_PIXELFORMAT_XBGR8888 : constant SDL_PixelFormat := 374740996;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRX8888 : constant SDL_PixelFormat := 375789572;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB8888 : constant SDL_PixelFormat := 372645892;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA8888 : constant SDL_PixelFormat := 373694468;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR8888 : constant SDL_PixelFormat := 376840196;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA8888 : constant SDL_PixelFormat := 377888772;
   SDL_PixelFormat_SDL_PIXELFORMAT_XRGB2101010 : constant SDL_PixelFormat := 370614276;
   SDL_PixelFormat_SDL_PIXELFORMAT_XBGR2101010 : constant SDL_PixelFormat := 374808580;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB2101010 : constant SDL_PixelFormat := 372711428;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR2101010 : constant SDL_PixelFormat := 376905732;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGB48 : constant SDL_PixelFormat := 403714054;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGR48 : constant SDL_PixelFormat := 406859782;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA64 : constant SDL_PixelFormat := 404766728;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB64 : constant SDL_PixelFormat := 405815304;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA64 : constant SDL_PixelFormat := 407912456;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR64 : constant SDL_PixelFormat := 408961032;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGB48_FLOAT : constant SDL_PixelFormat := 437268486;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGR48_FLOAT : constant SDL_PixelFormat := 440414214;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA64_FLOAT : constant SDL_PixelFormat := 438321160;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB64_FLOAT : constant SDL_PixelFormat := 439369736;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA64_FLOAT : constant SDL_PixelFormat := 441466888;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR64_FLOAT : constant SDL_PixelFormat := 442515464;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGB96_FLOAT : constant SDL_PixelFormat := 454057996;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGR96_FLOAT : constant SDL_PixelFormat := 457203724;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA128_FLOAT : constant SDL_PixelFormat := 455114768;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB128_FLOAT : constant SDL_PixelFormat := 456163344;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA128_FLOAT : constant SDL_PixelFormat := 458260496;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR128_FLOAT : constant SDL_PixelFormat := 459309072;
   SDL_PixelFormat_SDL_PIXELFORMAT_YV12 : constant SDL_PixelFormat := 842094169;
   SDL_PixelFormat_SDL_PIXELFORMAT_IYUV : constant SDL_PixelFormat := 1448433993;
   SDL_PixelFormat_SDL_PIXELFORMAT_YUY2 : constant SDL_PixelFormat := 844715353;
   SDL_PixelFormat_SDL_PIXELFORMAT_UYVY : constant SDL_PixelFormat := 1498831189;
   SDL_PixelFormat_SDL_PIXELFORMAT_YVYU : constant SDL_PixelFormat := 1431918169;
   SDL_PixelFormat_SDL_PIXELFORMAT_NV12 : constant SDL_PixelFormat := 842094158;
   SDL_PixelFormat_SDL_PIXELFORMAT_NV21 : constant SDL_PixelFormat := 825382478;
   SDL_PixelFormat_SDL_PIXELFORMAT_P010 : constant SDL_PixelFormat := 808530000;
   SDL_PixelFormat_SDL_PIXELFORMAT_EXTERNAL_OES : constant SDL_PixelFormat := 542328143;
   SDL_PixelFormat_SDL_PIXELFORMAT_MJPG : constant SDL_PixelFormat := 1196444237;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBA32 : constant SDL_PixelFormat := 376840196;
   SDL_PixelFormat_SDL_PIXELFORMAT_ARGB32 : constant SDL_PixelFormat := 377888772;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRA32 : constant SDL_PixelFormat := 372645892;
   SDL_PixelFormat_SDL_PIXELFORMAT_ABGR32 : constant SDL_PixelFormat := 373694468;
   SDL_PixelFormat_SDL_PIXELFORMAT_RGBX32 : constant SDL_PixelFormat := 374740996;
   SDL_PixelFormat_SDL_PIXELFORMAT_XRGB32 : constant SDL_PixelFormat := 375789572;
   SDL_PixelFormat_SDL_PIXELFORMAT_BGRX32 : constant SDL_PixelFormat := 370546692;
   SDL_PixelFormat_SDL_PIXELFORMAT_XBGR32 : constant SDL_PixelFormat := 371595268;  -- /usr/local/include/SDL3/SDL_pixels.h:548

  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_4321, 0, 1, 0),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX1, SDL_BITMAPORDER_1234, 0, 1, 0),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_4321, 0, 2, 0),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX2, SDL_BITMAPORDER_1234, 0, 2, 0),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_4321, 0, 4, 0),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX4, SDL_BITMAPORDER_1234, 0, 4, 0),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_INDEX8, 0, 0, 8, 1),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED8, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_332, 8, 1),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_4444, 12, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_4444, 12, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_1555, 15, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_1555, 15, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_4444, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_4444, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_4444, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_4444, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_1555, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_5551, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_1555, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_5551, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_565, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED16, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_565, 16, 2),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_RGB, 0, 24, 3),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU8, SDL_ARRAYORDER_BGR, 0, 24, 3),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_8888, 24, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBX, SDL_PACKEDLAYOUT_8888, 24, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_8888, 24, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRX, SDL_PACKEDLAYOUT_8888, 24, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_8888, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_RGBA, SDL_PACKEDLAYOUT_8888, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_8888, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_BGRA, SDL_PACKEDLAYOUT_8888, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XRGB, SDL_PACKEDLAYOUT_2101010, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_XBGR, SDL_PACKEDLAYOUT_2101010, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ARGB, SDL_PACKEDLAYOUT_2101010, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_PACKED32, SDL_PACKEDORDER_ABGR, SDL_PACKEDLAYOUT_2101010, 32, 4),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGB, 0, 48, 6),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGR, 0, 48, 6),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_RGBA, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ARGB, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_BGRA, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYU16, SDL_ARRAYORDER_ABGR, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGB, 0, 48, 6),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGR, 0, 48, 6),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_RGBA, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ARGB, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_BGRA, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF16, SDL_ARRAYORDER_ABGR, 0, 64, 8),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGB, 0, 96, 12),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGR, 0, 96, 12),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_RGBA, 0, 128, 16),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ARGB, 0, 128, 16),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_BGRA, 0, 128, 16),  
  -- SDL_DEFINE_PIXELFORMAT(SDL_PIXELTYPE_ARRAYF32, SDL_ARRAYORDER_ABGR, 0, 128, 16),  
  --*< Planar mode: Y + V + U  (3 planes)  
  -- SDL_DEFINE_PIXELFOURCC('Y', 'V', '1', '2'),  
  --*< Planar mode: Y + U + V  (3 planes)  
  -- SDL_DEFINE_PIXELFOURCC('I', 'Y', 'U', 'V'),  
  --*< Packed mode: Y0+U0+Y1+V0 (1 plane)  
  -- SDL_DEFINE_PIXELFOURCC('Y', 'U', 'Y', '2'),  
  --*< Packed mode: U0+Y0+V0+Y1 (1 plane)  
  -- SDL_DEFINE_PIXELFOURCC('U', 'Y', 'V', 'Y'),  
  --*< Packed mode: Y0+V0+Y1+U0 (1 plane)  
  -- SDL_DEFINE_PIXELFOURCC('Y', 'V', 'Y', 'U'),  
  --*< Planar mode: Y + U/V interleaved  (2 planes)  
  -- SDL_DEFINE_PIXELFOURCC('N', 'V', '1', '2'),  
  --*< Planar mode: Y + V/U interleaved  (2 planes)  
  -- SDL_DEFINE_PIXELFOURCC('N', 'V', '2', '1'),  
  --*< Planar mode: Y + U/V interleaved  (2 planes)  
  -- SDL_DEFINE_PIXELFOURCC('P', '0', '1', '0'),  
  --*< Android video texture format  
  -- SDL_DEFINE_PIXELFOURCC('O', 'E', 'S', ' ')  
  --*< Motion JPEG  
  -- SDL_DEFINE_PIXELFOURCC('M', 'J', 'P', 'G')  
  -- Aliases for RGBA byte arrays of color data, for the current platform  
  --*
  -- * Colorspace color type.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_ColorType is 
     (SDL_COLOR_TYPE_UNKNOWN,
      SDL_COLOR_TYPE_RGB,
      SDL_COLOR_TYPE_YCBCR)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:709

  --*
  -- * Colorspace color range, as described by
  -- * https://www.itu.int/rec/R-REC-BT.2100-2-201807-I/en
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_ColorRange is 
     (SDL_COLOR_RANGE_UNKNOWN,
      SDL_COLOR_RANGE_LIMITED,
      SDL_COLOR_RANGE_FULL)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:722

  --*< Narrow range, e.g. 16-235 for 8-bit RGB and luma, and 16-240 for 8-bit chroma  
  --*< Full range, e.g. 0-255 for 8-bit RGB and luma, and 1-255 for 8-bit chroma  
  --*
  -- * Colorspace color primaries, as described by
  -- * https://www.itu.int/rec/T-REC-H.273-201612-S/en
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_ColorPrimaries is unsigned;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_UNKNOWN : constant SDL_ColorPrimaries := 0;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_BT709 : constant SDL_ColorPrimaries := 1;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_UNSPECIFIED : constant SDL_ColorPrimaries := 2;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_BT470M : constant SDL_ColorPrimaries := 4;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_BT470BG : constant SDL_ColorPrimaries := 5;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_BT601 : constant SDL_ColorPrimaries := 6;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_SMPTE240 : constant SDL_ColorPrimaries := 7;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_GENERIC_FILM : constant SDL_ColorPrimaries := 8;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_BT2020 : constant SDL_ColorPrimaries := 9;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_XYZ : constant SDL_ColorPrimaries := 10;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_SMPTE431 : constant SDL_ColorPrimaries := 11;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_SMPTE432 : constant SDL_ColorPrimaries := 12;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_EBU3213 : constant SDL_ColorPrimaries := 22;
   SDL_ColorPrimaries_SDL_COLOR_PRIMARIES_CUSTOM : constant SDL_ColorPrimaries := 31;  -- /usr/local/include/SDL3/SDL_pixels.h:735

  --*< ITU-R BT.709-6  
  --*< ITU-R BT.470-6 System M  
  --*< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625  
  --*< ITU-R BT.601-7 525, SMPTE 170M  
  --*< SMPTE 240M, functionally the same as SDL_COLOR_PRIMARIES_BT601  
  --*< Generic film (color filters using Illuminant C)  
  --*< ITU-R BT.2020-2 / ITU-R BT.2100-0  
  --*< SMPTE ST 428-1  
  --*< SMPTE RP 431-2  
  --*< SMPTE EG 432-1 / DCI P3  
  --*< EBU Tech. 3213-E  
  --*
  -- * Colorspace transfer characteristics.
  -- *
  -- * These are as described by https://www.itu.int/rec/T-REC-H.273-201612-S/en
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_TransferCharacteristics is unsigned;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_UNKNOWN : constant SDL_TransferCharacteristics := 0;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_BT709 : constant SDL_TransferCharacteristics := 1;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_UNSPECIFIED : constant SDL_TransferCharacteristics := 2;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_GAMMA22 : constant SDL_TransferCharacteristics := 4;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_GAMMA28 : constant SDL_TransferCharacteristics := 5;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_BT601 : constant SDL_TransferCharacteristics := 6;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_SMPTE240 : constant SDL_TransferCharacteristics := 7;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_LINEAR : constant SDL_TransferCharacteristics := 8;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_LOG100 : constant SDL_TransferCharacteristics := 9;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_LOG100_SQRT10 : constant SDL_TransferCharacteristics := 10;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_IEC61966 : constant SDL_TransferCharacteristics := 11;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_BT1361 : constant SDL_TransferCharacteristics := 12;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_SRGB : constant SDL_TransferCharacteristics := 13;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_BT2020_10BIT : constant SDL_TransferCharacteristics := 14;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_BT2020_12BIT : constant SDL_TransferCharacteristics := 15;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_PQ : constant SDL_TransferCharacteristics := 16;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_SMPTE428 : constant SDL_TransferCharacteristics := 17;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_HLG : constant SDL_TransferCharacteristics := 18;
   SDL_TransferCharacteristics_SDL_TRANSFER_CHARACTERISTICS_CUSTOM : constant SDL_TransferCharacteristics := 31;  -- /usr/local/include/SDL3/SDL_pixels.h:760

  --*< Rec. ITU-R BT.709-6 / ITU-R BT1361  
  --*< ITU-R BT.470-6 System M / ITU-R BT1700 625 PAL & SECAM  
  --*< ITU-R BT.470-6 System B, G  
  --*< SMPTE ST 170M / ITU-R BT.601-7 525 or 625  
  --*< SMPTE ST 240M  
  --*< IEC 61966-2-4  
  --*< ITU-R BT1361 Extended Colour Gamut  
  --*< IEC 61966-2-1 (sRGB or sYCC)  
  --*< ITU-R BT2020 for 10-bit system  
  --*< ITU-R BT2020 for 12-bit system  
  --*< SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems  
  --*< SMPTE ST 428-1  
  --*< ARIB STD-B67, known as "hybrid log-gamma" (HLG)  
  --*
  -- * Colorspace matrix coefficients.
  -- *
  -- * These are as described by https://www.itu.int/rec/T-REC-H.273-201612-S/en
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_MatrixCoefficients is unsigned;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_IDENTITY : constant SDL_MatrixCoefficients := 0;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_BT709 : constant SDL_MatrixCoefficients := 1;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_UNSPECIFIED : constant SDL_MatrixCoefficients := 2;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_FCC : constant SDL_MatrixCoefficients := 4;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_BT470BG : constant SDL_MatrixCoefficients := 5;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_BT601 : constant SDL_MatrixCoefficients := 6;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_SMPTE240 : constant SDL_MatrixCoefficients := 7;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_YCGCO : constant SDL_MatrixCoefficients := 8;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_BT2020_NCL : constant SDL_MatrixCoefficients := 9;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_BT2020_CL : constant SDL_MatrixCoefficients := 10;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_SMPTE2085 : constant SDL_MatrixCoefficients := 11;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_NCL : constant SDL_MatrixCoefficients := 12;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_CHROMA_DERIVED_CL : constant SDL_MatrixCoefficients := 13;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_ICTCP : constant SDL_MatrixCoefficients := 14;
   SDL_MatrixCoefficients_SDL_MATRIX_COEFFICIENTS_CUSTOM : constant SDL_MatrixCoefficients := 31;  -- /usr/local/include/SDL3/SDL_pixels.h:790

  --*< ITU-R BT.709-6  
  --*< US FCC Title 47  
  --*< ITU-R BT.470-6 System B, G / ITU-R BT.601-7 625, functionally the same as SDL_MATRIX_COEFFICIENTS_BT601  
  --*< ITU-R BT.601-7 525  
  --*< SMPTE 240M  
  --*< ITU-R BT.2020-2 non-constant luminance  
  --*< ITU-R BT.2020-2 constant luminance  
  --*< SMPTE ST 2085  
  --*< ITU-R BT.2100-0 ICTCP  
  --*
  -- * Colorspace chroma sample location.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_ChromaLocation is 
     (SDL_CHROMA_LOCATION_NONE,
      SDL_CHROMA_LOCATION_LEFT,
      SDL_CHROMA_LOCATION_CENTER,
      SDL_CHROMA_LOCATION_TOPLEFT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_pixels.h:814

  --*< RGB, no chroma sampling  
  --*< In MPEG-2, MPEG-4, and AVC, Cb and Cr are taken on midpoint of the left-edge of the 2x2 square. In other words, they have the same horizontal location as the top-left pixel, but is shifted one-half pixel down vertically.  
  --*< In JPEG/JFIF, H.261, and MPEG-1, Cb and Cr are taken at the center of the 2x2 square. In other words, they are offset one-half pixel to the right and one-half pixel down compared to the top-left pixel.  
  --*< In HEVC for BT.2020 and BT.2100 content (in particular on Blu-rays), Cb and Cr are sampled at the same location as the group's top-left Y pixel ("co-sited", "co-located").  
  -- Colorspace definition  
  --*
  -- * A macro for defining custom SDL_Colorspace formats.
  -- *
  -- * For example, defining SDL_COLORSPACE_SRGB looks like this:
  -- *
  -- * ```c
  -- * SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
  -- *                       SDL_COLOR_RANGE_FULL,
  -- *                       SDL_COLOR_PRIMARIES_BT709,
  -- *                       SDL_TRANSFER_CHARACTERISTICS_SRGB,
  -- *                       SDL_MATRIX_COEFFICIENTS_IDENTITY,
  -- *                       SDL_CHROMA_LOCATION_NONE)
  -- * ```
  -- *
  -- * \param type the type of the new format, probably an SDL_ColorType value.
  -- * \param range the range of the new format, probably a SDL_ColorRange value.
  -- * \param primaries the primaries of the new format, probably an
  -- *                  SDL_ColorPrimaries value.
  -- * \param transfer the transfer characteristics of the new format, probably an
  -- *                 SDL_TransferCharacteristics value.
  -- * \param matrix the matrix coefficients of the new format, probably an
  -- *               SDL_MatrixCoefficients value.
  -- * \param chroma the chroma sample location of the new format, probably an
  -- *               SDL_ChromaLocation value.
  -- * \returns a format value in the style of SDL_Colorspace.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the type of an SDL_Colorspace.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns the SDL_ColorType for `cspace`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the range of an SDL_Colorspace.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns the SDL_ColorRange of `cspace`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the chroma sample location of an SDL_Colorspace.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns the SDL_ChromaLocation of `cspace`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the primaries of an SDL_Colorspace.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns the SDL_ColorPrimaries of `cspace`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the transfer characteristics of an SDL_Colorspace.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns the SDL_TransferCharacteristics of `cspace`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to retrieve the matrix coefficients of an SDL_Colorspace.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns the SDL_MatrixCoefficients of `cspace`.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_Colorspace uses BT601 (or BT470BG) matrix
  -- * coefficients.
  -- *
  -- * Note that this macro double-evaluates its parameter, so do not use
  -- * expressions with side-effects here.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns true if BT601 or BT470BG, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_Colorspace uses BT709 matrix coefficients.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns true if BT709, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_Colorspace uses BT2020_NCL matrix
  -- * coefficients.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns true if BT2020_NCL, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_Colorspace has a limited range.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns true if limited range, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro to determine if an SDL_Colorspace has a full range.
  -- *
  -- * \param cspace an SDL_Colorspace to check.
  -- * \returns true if full range, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Colorspace definitions.
  -- *
  -- * Since similar colorspaces may vary in their details (matrix, transfer
  -- * function, etc.), this is not an exhaustive list, but rather a
  -- * representative sample of the kinds of colorspaces supported in SDL.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ColorPrimaries
  -- * \sa SDL_ColorRange
  -- * \sa SDL_ColorType
  -- * \sa SDL_MatrixCoefficients
  -- * \sa SDL_TransferCharacteristics
  --  

   subtype SDL_Colorspace is unsigned;
   SDL_Colorspace_SDL_COLORSPACE_UNKNOWN : constant SDL_Colorspace := 0;
   SDL_Colorspace_SDL_COLORSPACE_SRGB : constant SDL_Colorspace := 301991328;
   SDL_Colorspace_SDL_COLORSPACE_SRGB_LINEAR : constant SDL_Colorspace := 301991168;
   SDL_Colorspace_SDL_COLORSPACE_HDR10 : constant SDL_Colorspace := 301999616;
   SDL_Colorspace_SDL_COLORSPACE_JPEG : constant SDL_Colorspace := 570426566;
   SDL_Colorspace_SDL_COLORSPACE_BT601_LIMITED : constant SDL_Colorspace := 554703046;
   SDL_Colorspace_SDL_COLORSPACE_BT601_FULL : constant SDL_Colorspace := 571480262;
   SDL_Colorspace_SDL_COLORSPACE_BT709_LIMITED : constant SDL_Colorspace := 554697761;
   SDL_Colorspace_SDL_COLORSPACE_BT709_FULL : constant SDL_Colorspace := 571474977;
   SDL_Colorspace_SDL_COLORSPACE_BT2020_LIMITED : constant SDL_Colorspace := 554706441;
   SDL_Colorspace_SDL_COLORSPACE_BT2020_FULL : constant SDL_Colorspace := 571483657;
   SDL_Colorspace_SDL_COLORSPACE_RGB_DEFAULT : constant SDL_Colorspace := 301991328;
   SDL_Colorspace_SDL_COLORSPACE_YUV_DEFAULT : constant SDL_Colorspace := 554703046;  -- /usr/local/include/SDL3/SDL_pixels.h:1011

  -- sRGB is a gamma corrected colorspace, and the default colorspace for SDL rendering and 8-bit RGB surfaces  
  --*< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT709,
  --                                 SDL_TRANSFER_CHARACTERISTICS_SRGB,
  --                                 SDL_MATRIX_COEFFICIENTS_IDENTITY,
  --                                 SDL_CHROMA_LOCATION_NONE),  

  -- This is a linear colorspace and the default colorspace for floating point surfaces. On Windows this is the scRGB colorspace, and on Apple platforms this is kCGColorSpaceExtendedLinearSRGB for EDR content  
  --*< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G10_NONE_P709   
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT709,
  --                                 SDL_TRANSFER_CHARACTERISTICS_LINEAR,
  --                                 SDL_MATRIX_COEFFICIENTS_IDENTITY,
  --                                 SDL_CHROMA_LOCATION_NONE),  

  -- HDR10 is a non-linear HDR colorspace and the default colorspace for 10-bit surfaces  
  --*< Equivalent to DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020   
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_RGB,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT2020,
  --                                 SDL_TRANSFER_CHARACTERISTICS_PQ,
  --                                 SDL_MATRIX_COEFFICIENTS_IDENTITY,
  --                                 SDL_CHROMA_LOCATION_NONE),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_NONE_P709_X601  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT709,
  --                                 SDL_TRANSFER_CHARACTERISTICS_BT601,
  --                                 SDL_MATRIX_COEFFICIENTS_BT601,
  --                                 SDL_CHROMA_LOCATION_NONE),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_LIMITED,
  --                                 SDL_COLOR_PRIMARIES_BT601,
  --                                 SDL_TRANSFER_CHARACTERISTICS_BT601,
  --                                 SDL_MATRIX_COEFFICIENTS_BT601,
  --                                 SDL_CHROMA_LOCATION_LEFT),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P601  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT601,
  --                                 SDL_TRANSFER_CHARACTERISTICS_BT601,
  --                                 SDL_MATRIX_COEFFICIENTS_BT601,
  --                                 SDL_CHROMA_LOCATION_LEFT),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_LIMITED,
  --                                 SDL_COLOR_PRIMARIES_BT709,
  --                                 SDL_TRANSFER_CHARACTERISTICS_BT709,
  --                                 SDL_MATRIX_COEFFICIENTS_BT709,
  --                                 SDL_CHROMA_LOCATION_LEFT),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT709,
  --                                 SDL_TRANSFER_CHARACTERISTICS_BT709,
  --                                 SDL_MATRIX_COEFFICIENTS_BT709,
  --                                 SDL_CHROMA_LOCATION_LEFT),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P2020  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_LIMITED,
  --                                 SDL_COLOR_PRIMARIES_BT2020,
  --                                 SDL_TRANSFER_CHARACTERISTICS_PQ,
  --                                 SDL_MATRIX_COEFFICIENTS_BT2020_NCL,
  --                                 SDL_CHROMA_LOCATION_LEFT),  

  --*< Equivalent to DXGI_COLOR_SPACE_YCBCR_FULL_G22_LEFT_P2020  
  -- SDL_DEFINE_COLORSPACE(SDL_COLOR_TYPE_YCBCR,
  --                                 SDL_COLOR_RANGE_FULL,
  --                                 SDL_COLOR_PRIMARIES_BT2020,
  --                                 SDL_TRANSFER_CHARACTERISTICS_PQ,
  --                                 SDL_MATRIX_COEFFICIENTS_BT2020_NCL,
  --                                 SDL_CHROMA_LOCATION_LEFT),  

  --*< The default colorspace for RGB surfaces if no colorspace is specified  
  --*< The default colorspace for YUV surfaces if no colorspace is specified  
  --*
  -- * A structure that represents a color as RGBA components.
  -- *
  -- * The bits of this structure can be directly reinterpreted as an
  -- * integer-packed color which uses the SDL_PIXELFORMAT_RGBA32 format
  -- * (SDL_PIXELFORMAT_ABGR8888 on little-endian systems and
  -- * SDL_PIXELFORMAT_RGBA8888 on big-endian systems).
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Color is record
      r : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1114
      g : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1115
      b : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1116
      a : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1117
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_pixels.h:1112

  --*
  -- * The bits of this structure can be directly reinterpreted as a float-packed
  -- * color which uses the SDL_PIXELFORMAT_RGBA128_FLOAT format
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_FColor is record
      r : aliased float;  -- /usr/local/include/SDL3/SDL_pixels.h:1128
      g : aliased float;  -- /usr/local/include/SDL3/SDL_pixels.h:1129
      b : aliased float;  -- /usr/local/include/SDL3/SDL_pixels.h:1130
      a : aliased float;  -- /usr/local/include/SDL3/SDL_pixels.h:1131
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_pixels.h:1126

  --*
  -- * A set of indexed colors representing a palette.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetPaletteColors
  --  

  --*< number of elements in `colors`.  
   type SDL_Palette is record
      ncolors : aliased int;  -- /usr/local/include/SDL3/SDL_pixels.h:1143
      colors : access SDL_Color;  -- /usr/local/include/SDL3/SDL_pixels.h:1144
      version : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_pixels.h:1145
      refcount : aliased int;  -- /usr/local/include/SDL3/SDL_pixels.h:1146
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_pixels.h:1141

  --*< an array of colors, `ncolors` long.  
  --*< internal use only, do not touch.  
  --*< internal use only, do not touch.  
  --*
  -- * Details about the format of a pixel.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type anon_array2057 is array (0 .. 1) of aliased SDL3_SDL_stdinc_h.Uint8;
   type SDL_PixelFormatDetails is record
      format : aliased SDL_PixelFormat;  -- /usr/local/include/SDL3/SDL_pixels.h:1156
      bits_per_pixel : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1157
      bytes_per_pixel : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1158
      padding : aliased anon_array2057;  -- /usr/local/include/SDL3/SDL_pixels.h:1159
      Rmask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_pixels.h:1160
      Gmask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_pixels.h:1161
      Bmask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_pixels.h:1162
      Amask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_pixels.h:1163
      Rbits : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1164
      Gbits : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1165
      Bbits : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1166
      Abits : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1167
      Rshift : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1168
      Gshift : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1169
      Bshift : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1170
      Ashift : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_pixels.h:1171
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_pixels.h:1154

  --*
  -- * Get the human readable name of a pixel format.
  -- *
  -- * \param format the pixel format to query.
  -- * \returns the human readable name of the specified pixel format or
  -- *          "SDL_PIXELFORMAT_UNKNOWN" if the format isn't recognized.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetPixelFormatName (format : SDL_PixelFormat) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_pixels.h:1185
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPixelFormatName";

  --*
  -- * Convert one of the enumerated pixel formats to a bpp value and RGBA masks.
  -- *
  -- * \param format one of the SDL_PixelFormat values.
  -- * \param bpp a bits per pixel value; usually 15, 16, or 32.
  -- * \param Rmask a pointer filled in with the red mask for the format.
  -- * \param Gmask a pointer filled in with the green mask for the format.
  -- * \param Bmask a pointer filled in with the blue mask for the format.
  -- * \param Amask a pointer filled in with the alpha mask for the format.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPixelFormatForMasks
  --  

   function SDL_GetMasksForPixelFormat
     (format : SDL_PixelFormat;
      bpp : access int;
      Rmask : access SDL3_SDL_stdinc_h.Uint32;
      Gmask : access SDL3_SDL_stdinc_h.Uint32;
      Bmask : access SDL3_SDL_stdinc_h.Uint32;
      Amask : access SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_pixels.h:1205
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetMasksForPixelFormat";

  --*
  -- * Convert a bpp value and RGBA masks to an enumerated pixel format.
  -- *
  -- * This will return `SDL_PIXELFORMAT_UNKNOWN` if the conversion wasn't
  -- * possible.
  -- *
  -- * \param bpp a bits per pixel value; usually 15, 16, or 32.
  -- * \param Rmask the red mask for the format.
  -- * \param Gmask the green mask for the format.
  -- * \param Bmask the blue mask for the format.
  -- * \param Amask the alpha mask for the format.
  -- * \returns the SDL_PixelFormat value corresponding to the format masks, or
  -- *          SDL_PIXELFORMAT_UNKNOWN if there isn't a match.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetMasksForPixelFormat
  --  

   function SDL_GetPixelFormatForMasks
     (bpp : int;
      Rmask : SDL3_SDL_stdinc_h.Uint32;
      Gmask : SDL3_SDL_stdinc_h.Uint32;
      Bmask : SDL3_SDL_stdinc_h.Uint32;
      Amask : SDL3_SDL_stdinc_h.Uint32) return SDL_PixelFormat  -- /usr/local/include/SDL3/SDL_pixels.h:1227
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPixelFormatForMasks";

  --*
  -- * Create an SDL_PixelFormatDetails structure corresponding to a pixel format.
  -- *
  -- * Returned structure may come from a shared global cache (i.e. not newly
  -- * allocated), and hence should not be modified, especially the palette. Weird
  -- * errors such as `Blit combination not supported` may occur.
  -- *
  -- * \param format one of the SDL_PixelFormat values.
  -- * \returns a pointer to a SDL_PixelFormatDetails structure or NULL on
  -- *          failure; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetPixelFormatDetails (format : SDL_PixelFormat) return access constant SDL_PixelFormatDetails  -- /usr/local/include/SDL3/SDL_pixels.h:1244
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPixelFormatDetails";

  --*
  -- * Create a palette structure with the specified number of color entries.
  -- *
  -- * The palette entries are initialized to white.
  -- *
  -- * \param ncolors represents the number of color entries in the color palette.
  -- * \returns a new SDL_Palette structure on success or NULL on failure (e.g. if
  -- *          there wasn't enough memory); call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroyPalette
  -- * \sa SDL_SetPaletteColors
  -- * \sa SDL_SetSurfacePalette
  --  

   function SDL_CreatePalette (ncolors : int) return access SDL_Palette  -- /usr/local/include/SDL3/SDL_pixels.h:1264
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreatePalette";

  --*
  -- * Set a range of colors in a palette.
  -- *
  -- * \param palette the SDL_Palette structure to modify.
  -- * \param colors an array of SDL_Color structures to copy into the palette.
  -- * \param firstcolor the index of the first palette entry to modify.
  -- * \param ncolors the number of entries to modify.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the palette is not modified or destroyed in another thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SetPaletteColors
     (palette : access SDL_Palette;
      colors : access constant SDL_Color;
      firstcolor : int;
      ncolors : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_pixels.h:1281
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetPaletteColors";

  --*
  -- * Free a palette created with SDL_CreatePalette().
  -- *
  -- * \param palette the SDL_Palette structure to be freed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the palette is not modified or destroyed in another thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreatePalette
  --  

   procedure SDL_DestroyPalette (palette : access SDL_Palette)  -- /usr/local/include/SDL3/SDL_pixels.h:1295
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyPalette";

  --*
  -- * Map an RGB triple to an opaque pixel value for a given pixel format.
  -- *
  -- * This function maps the RGB color value to the specified pixel format and
  -- * returns the pixel value best approximating the given RGB color value for
  -- * the given pixel format.
  -- *
  -- * If the format has a palette (8-bit) the index of the closest matching color
  -- * in the palette will be returned.
  -- *
  -- * If the specified pixel format has an alpha component it will be returned as
  -- * all 1 bits (fully opaque).
  -- *
  -- * If the pixel format bpp (color depth) is less than 32-bpp then the unused
  -- * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
  -- * format the return value can be assigned to a Uint16, and similarly a Uint8
  -- * for an 8-bpp format).
  -- *
  -- * \param format a pointer to SDL_PixelFormatDetails describing the pixel
  -- *               format.
  -- * \param palette an optional palette for indexed formats, may be NULL.
  -- * \param r the red component of the pixel in the range 0-255.
  -- * \param g the green component of the pixel in the range 0-255.
  -- * \param b the blue component of the pixel in the range 0-255.
  -- * \returns a pixel value.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the palette is not modified.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPixelFormatDetails
  -- * \sa SDL_GetRGB
  -- * \sa SDL_MapRGBA
  -- * \sa SDL_MapSurfaceRGB
  --  

   function SDL_MapRGB
     (format : access constant SDL_PixelFormatDetails;
      palette : access constant SDL_Palette;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_pixels.h:1333
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MapRGB";

  --*
  -- * Map an RGBA quadruple to a pixel value for a given pixel format.
  -- *
  -- * This function maps the RGBA color value to the specified pixel format and
  -- * returns the pixel value best approximating the given RGBA color value for
  -- * the given pixel format.
  -- *
  -- * If the specified pixel format has no alpha component the alpha value will
  -- * be ignored (as it will be in formats with a palette).
  -- *
  -- * If the format has a palette (8-bit) the index of the closest matching color
  -- * in the palette will be returned.
  -- *
  -- * If the pixel format bpp (color depth) is less than 32-bpp then the unused
  -- * upper bits of the return value can safely be ignored (e.g., with a 16-bpp
  -- * format the return value can be assigned to a Uint16, and similarly a Uint8
  -- * for an 8-bpp format).
  -- *
  -- * \param format a pointer to SDL_PixelFormatDetails describing the pixel
  -- *               format.
  -- * \param palette an optional palette for indexed formats, may be NULL.
  -- * \param r the red component of the pixel in the range 0-255.
  -- * \param g the green component of the pixel in the range 0-255.
  -- * \param b the blue component of the pixel in the range 0-255.
  -- * \param a the alpha component of the pixel in the range 0-255.
  -- * \returns a pixel value.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the palette is not modified.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPixelFormatDetails
  -- * \sa SDL_GetRGBA
  -- * \sa SDL_MapRGB
  -- * \sa SDL_MapSurfaceRGBA
  --  

   function SDL_MapRGBA
     (format : access constant SDL_PixelFormatDetails;
      palette : access constant SDL_Palette;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8;
      a : SDL3_SDL_stdinc_h.Uint8) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_pixels.h:1372
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MapRGBA";

  --*
  -- * Get RGB values from a pixel in the specified format.
  -- *
  -- * This function uses the entire 8-bit [0..255] range when converting color
  -- * components from pixel formats with less than 8-bits per RGB component
  -- * (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
  -- * 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
  -- *
  -- * \param pixelvalue a pixel value.
  -- * \param format a pointer to SDL_PixelFormatDetails describing the pixel
  -- *               format.
  -- * \param palette an optional palette for indexed formats, may be NULL.
  -- * \param r a pointer filled in with the red component, may be NULL.
  -- * \param g a pointer filled in with the green component, may be NULL.
  -- * \param b a pointer filled in with the blue component, may be NULL.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the palette is not modified.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPixelFormatDetails
  -- * \sa SDL_GetRGBA
  -- * \sa SDL_MapRGB
  -- * \sa SDL_MapRGBA
  --  

   procedure SDL_GetRGB
     (pixelvalue : SDL3_SDL_stdinc_h.Uint32;
      format : access constant SDL_PixelFormatDetails;
      palette : access constant SDL_Palette;
      r : access SDL3_SDL_stdinc_h.Uint8;
      g : access SDL3_SDL_stdinc_h.Uint8;
      b : access SDL3_SDL_stdinc_h.Uint8)  -- /usr/local/include/SDL3/SDL_pixels.h:1400
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRGB";

  --*
  -- * Get RGBA values from a pixel in the specified format.
  -- *
  -- * This function uses the entire 8-bit [0..255] range when converting color
  -- * components from pixel formats with less than 8-bits per RGB component
  -- * (e.g., a completely white pixel in 16-bit RGB565 format would return [0xff,
  -- * 0xff, 0xff] not [0xf8, 0xfc, 0xf8]).
  -- *
  -- * If the surface has no alpha component, the alpha will be returned as 0xff
  -- * (100% opaque).
  -- *
  -- * \param pixelvalue a pixel value.
  -- * \param format a pointer to SDL_PixelFormatDetails describing the pixel
  -- *               format.
  -- * \param palette an optional palette for indexed formats, may be NULL.
  -- * \param r a pointer filled in with the red component, may be NULL.
  -- * \param g a pointer filled in with the green component, may be NULL.
  -- * \param b a pointer filled in with the blue component, may be NULL.
  -- * \param a a pointer filled in with the alpha component, may be NULL.
  -- *
  -- * \threadsafety It is safe to call this function from any thread, as long as
  -- *               the palette is not modified.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetPixelFormatDetails
  -- * \sa SDL_GetRGB
  -- * \sa SDL_MapRGB
  -- * \sa SDL_MapRGBA
  --  

   procedure SDL_GetRGBA
     (pixelvalue : SDL3_SDL_stdinc_h.Uint32;
      format : access constant SDL_PixelFormatDetails;
      palette : access constant SDL_Palette;
      r : access SDL3_SDL_stdinc_h.Uint8;
      g : access SDL3_SDL_stdinc_h.Uint8;
      b : access SDL3_SDL_stdinc_h.Uint8;
      a : access SDL3_SDL_stdinc_h.Uint8)  -- /usr/local/include/SDL3/SDL_pixels.h:1432
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRGBA";

  -- Ends C function definitions when using C++  
end SDL3_SDL_pixels_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
