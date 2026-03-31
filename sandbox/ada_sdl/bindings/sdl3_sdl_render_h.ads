pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_rect_h;
with SDL3_SDL_pixels_h;
with Interfaces.C.Strings;
with SDL3_SDL_video_h;
with System;
with Interfaces.C.Extensions;
with SDL3_SDL_properties_h;
limited with SDL3_SDL_gpu_h;
with SDL3_SDL_surface_h;
with SDL3_SDL_stdinc_h;
with SDL3_SDL_blendmode_h;
limited with SDL3_SDL_events_h;

package SDL3_SDL_render_h is

   SDL_SOFTWARE_RENDERER : aliased constant String := "software" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:75

   SDL_GPU_RENDERER : aliased constant String := "gpu" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:82

   SDL_PROP_RENDERER_CREATE_NAME_STRING : aliased constant String := "SDL.renderer.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:339
   SDL_PROP_RENDERER_CREATE_WINDOW_POINTER : aliased constant String := "SDL.renderer.create.window" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:340
   SDL_PROP_RENDERER_CREATE_SURFACE_POINTER : aliased constant String := "SDL.renderer.create.surface" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:341
   SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER : aliased constant String := "SDL.renderer.create.output_colorspace" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:342
   SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER : aliased constant String := "SDL.renderer.create.present_vsync" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:343
   SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER : aliased constant String := "SDL.renderer.create.gpu.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:344
   SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN : aliased constant String := "SDL.renderer.create.gpu.shaders_spirv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:345
   SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN : aliased constant String := "SDL.renderer.create.gpu.shaders_dxil" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:346
   SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN : aliased constant String := "SDL.renderer.create.gpu.shaders_msl" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:347
   SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER : aliased constant String := "SDL.renderer.create.vulkan.instance" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:348
   SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER : aliased constant String := "SDL.renderer.create.vulkan.surface" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:349
   SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER : aliased constant String := "SDL.renderer.create.vulkan.physical_device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:350
   SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER : aliased constant String := "SDL.renderer.create.vulkan.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:351
   SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER : aliased constant String := "SDL.renderer.create.vulkan.graphics_queue_family_index" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:352
   SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER : aliased constant String := "SDL.renderer.create.vulkan.present_queue_family_index" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:353

   SDL_PROP_RENDERER_NAME_STRING : aliased constant String := "SDL.renderer.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:553
   SDL_PROP_RENDERER_WINDOW_POINTER : aliased constant String := "SDL.renderer.window" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:554
   SDL_PROP_RENDERER_SURFACE_POINTER : aliased constant String := "SDL.renderer.surface" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:555
   SDL_PROP_RENDERER_VSYNC_NUMBER : aliased constant String := "SDL.renderer.vsync" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:556
   SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER : aliased constant String := "SDL.renderer.max_texture_size" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:557
   SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER : aliased constant String := "SDL.renderer.texture_formats" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:558
   SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN : aliased constant String := "SDL.renderer.texture_wrapping" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:559
   SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER : aliased constant String := "SDL.renderer.output_colorspace" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:560
   SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN : aliased constant String := "SDL.renderer.HDR_enabled" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:561
   SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT : aliased constant String := "SDL.renderer.SDR_white_point" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:562
   SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT : aliased constant String := "SDL.renderer.HDR_headroom" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:563
   SDL_PROP_RENDERER_D3D9_DEVICE_POINTER : aliased constant String := "SDL.renderer.d3d9.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:564
   SDL_PROP_RENDERER_D3D11_DEVICE_POINTER : aliased constant String := "SDL.renderer.d3d11.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:565
   SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER : aliased constant String := "SDL.renderer.d3d11.swap_chain" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:566
   SDL_PROP_RENDERER_D3D12_DEVICE_POINTER : aliased constant String := "SDL.renderer.d3d12.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:567
   SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER : aliased constant String := "SDL.renderer.d3d12.swap_chain" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:568
   SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER : aliased constant String := "SDL.renderer.d3d12.command_queue" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:569
   SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER : aliased constant String := "SDL.renderer.vulkan.instance" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:570
   SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER : aliased constant String := "SDL.renderer.vulkan.surface" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:571
   SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER : aliased constant String := "SDL.renderer.vulkan.physical_device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:572
   SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER : aliased constant String := "SDL.renderer.vulkan.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:573
   SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER : aliased constant String := "SDL.renderer.vulkan.graphics_queue_family_index" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:574
   SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER : aliased constant String := "SDL.renderer.vulkan.present_queue_family_index" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:575
   SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER : aliased constant String := "SDL.renderer.vulkan.swapchain_image_count" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:576
   SDL_PROP_RENDERER_GPU_DEVICE_POINTER : aliased constant String := "SDL.renderer.gpu.device" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:577

   SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER : aliased constant String := "SDL.texture.create.colorspace" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:808
   SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER : aliased constant String := "SDL.texture.create.format" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:809
   SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER : aliased constant String := "SDL.texture.create.access" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:810
   SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER : aliased constant String := "SDL.texture.create.width" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:811
   SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER : aliased constant String := "SDL.texture.create.height" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:812
   SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER : aliased constant String := "SDL.texture.create.palette" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:813
   SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT : aliased constant String := "SDL.texture.create.SDR_white_point" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:814
   SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT : aliased constant String := "SDL.texture.create.HDR_headroom" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:815
   SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER : aliased constant String := "SDL.texture.create.d3d11.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:816
   SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER : aliased constant String := "SDL.texture.create.d3d11.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:817
   SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER : aliased constant String := "SDL.texture.create.d3d11.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:818
   SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER : aliased constant String := "SDL.texture.create.d3d12.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:819
   SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER : aliased constant String := "SDL.texture.create.d3d12.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:820
   SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER : aliased constant String := "SDL.texture.create.d3d12.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:821
   SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER : aliased constant String := "SDL.texture.create.metal.pixelbuffer" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:822
   SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER : aliased constant String := "SDL.texture.create.opengl.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:823
   SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER : aliased constant String := "SDL.texture.create.opengl.texture_uv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:824
   SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER : aliased constant String := "SDL.texture.create.opengl.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:825
   SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER : aliased constant String := "SDL.texture.create.opengl.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:826
   SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER : aliased constant String := "SDL.texture.create.opengles2.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:827
   SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER : aliased constant String := "SDL.texture.create.opengles2.texture_uv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:828
   SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER : aliased constant String := "SDL.texture.create.opengles2.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:829
   SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER : aliased constant String := "SDL.texture.create.opengles2.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:830
   SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER : aliased constant String := "SDL.texture.create.vulkan.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:831
   SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER : aliased constant String := "SDL.texture.create.vulkan.layout" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:832
   SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER : aliased constant String := "SDL.texture.create.gpu.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:833
   SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER : aliased constant String := "SDL.texture.create.gpu.texture_uv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:834
   SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER : aliased constant String := "SDL.texture.create.gpu.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:835
   SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER : aliased constant String := "SDL.texture.create.gpu.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:836

   SDL_PROP_TEXTURE_COLORSPACE_NUMBER : aliased constant String := "SDL.texture.colorspace" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:937
   SDL_PROP_TEXTURE_FORMAT_NUMBER : aliased constant String := "SDL.texture.format" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:938
   SDL_PROP_TEXTURE_ACCESS_NUMBER : aliased constant String := "SDL.texture.access" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:939
   SDL_PROP_TEXTURE_WIDTH_NUMBER : aliased constant String := "SDL.texture.width" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:940
   SDL_PROP_TEXTURE_HEIGHT_NUMBER : aliased constant String := "SDL.texture.height" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:941
   SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT : aliased constant String := "SDL.texture.SDR_white_point" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:942
   SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT : aliased constant String := "SDL.texture.HDR_headroom" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:943
   SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER : aliased constant String := "SDL.texture.d3d11.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:944
   SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER : aliased constant String := "SDL.texture.d3d11.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:945
   SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER : aliased constant String := "SDL.texture.d3d11.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:946
   SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER : aliased constant String := "SDL.texture.d3d12.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:947
   SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER : aliased constant String := "SDL.texture.d3d12.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:948
   SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER : aliased constant String := "SDL.texture.d3d12.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:949
   SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER : aliased constant String := "SDL.texture.opengl.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:950
   SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER : aliased constant String := "SDL.texture.opengl.texture_uv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:951
   SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER : aliased constant String := "SDL.texture.opengl.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:952
   SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER : aliased constant String := "SDL.texture.opengl.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:953
   SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER : aliased constant String := "SDL.texture.opengl.target" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:954
   SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT : aliased constant String := "SDL.texture.opengl.tex_w" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:955
   SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT : aliased constant String := "SDL.texture.opengl.tex_h" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:956
   SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER : aliased constant String := "SDL.texture.opengles2.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:957
   SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER : aliased constant String := "SDL.texture.opengles2.texture_uv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:958
   SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER : aliased constant String := "SDL.texture.opengles2.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:959
   SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER : aliased constant String := "SDL.texture.opengles2.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:960
   SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER : aliased constant String := "SDL.texture.opengles2.target" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:961
   SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER : aliased constant String := "SDL.texture.vulkan.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:962
   SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER : aliased constant String := "SDL.texture.gpu.texture" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:963
   SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER : aliased constant String := "SDL.texture.gpu.texture_uv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:964
   SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER : aliased constant String := "SDL.texture.gpu.texture_u" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:965
   SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER : aliased constant String := "SDL.texture.gpu.texture_v" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_render.h:966

   SDL_RENDERER_VSYNC_DISABLED : constant := 0;  --  /usr/local/include/SDL3/SDL_render.h:2778
   SDL_RENDERER_VSYNC_ADAPTIVE : constant := (-1);  --  /usr/local/include/SDL3/SDL_render.h:2779

   SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE : constant := 8;  --  /usr/local/include/SDL3/SDL_render.h:2807

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
  -- * # CategoryRender
  -- *
  -- * Header file for SDL 2D rendering functions.
  -- *
  -- * This API supports the following features:
  -- *
  -- * - single pixel points
  -- * - single pixel lines
  -- * - filled rectangles
  -- * - texture images
  -- * - 2D polygons
  -- *
  -- * The primitives may be drawn in opaque, blended, or additive modes.
  -- *
  -- * The texture images may be drawn in opaque, blended, or additive modes. They
  -- * can have an additional color tint or alpha modulation applied to them, and
  -- * may also be stretched with linear interpolation.
  -- *
  -- * This API is designed to accelerate simple 2D operations. You may want more
  -- * functionality such as 3D polygons and particle effects, and in that case
  -- * you should use SDL's OpenGL/Direct3D support, the SDL3 GPU API, or one of
  -- * the many good 3D engines.
  -- *
  -- * These functions must be called from the main thread. See this bug for
  -- * details: https://github.com/libsdl-org/SDL/issues/986
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * The name of the software renderer.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * The name of the GPU renderer.
  -- *
  -- * \since This macro is available since SDL 3.4.0.
  --  

  --*
  -- * Vertex structure.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< Vertex position, in SDL_Renderer coordinates   
   type SDL_Vertex is record
      position : aliased SDL3_SDL_rect_h.SDL_FPoint;  -- /usr/local/include/SDL3/SDL_render.h:91
      color : aliased SDL3_SDL_pixels_h.SDL_FColor;  -- /usr/local/include/SDL3/SDL_render.h:92
      tex_coord : aliased SDL3_SDL_rect_h.SDL_FPoint;  -- /usr/local/include/SDL3/SDL_render.h:93
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_render.h:89

  --*< Vertex color  
  --*< Normalized texture coordinates, if needed  
  --*
  -- * The access pattern allowed for a texture.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_TextureAccess is 
     (SDL_TEXTUREACCESS_STATIC,
      SDL_TEXTUREACCESS_STREAMING,
      SDL_TEXTUREACCESS_TARGET)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_render.h:101

  --*< Changes rarely, not lockable  
  --*< Changes frequently, lockable  
  --*< Texture can be used as a render target  
  --*
  -- * The addressing mode for a texture when used in SDL_RenderGeometry().
  -- *
  -- * This affects how texture coordinates are interpreted outside of [0, 1]
  -- *
  -- * Texture wrapping is always supported for power of two texture sizes, and is
  -- * supported for other texture sizes if
  -- * SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN is set to true.
  -- *
  -- * \since This enum is available since SDL 3.4.0.
  --  

   subtype SDL_TextureAddressMode is int;
   SDL_TextureAddressMode_SDL_TEXTURE_ADDRESS_INVALID : constant SDL_TextureAddressMode := -1;
   SDL_TextureAddressMode_SDL_TEXTURE_ADDRESS_AUTO : constant SDL_TextureAddressMode := 0;
   SDL_TextureAddressMode_SDL_TEXTURE_ADDRESS_CLAMP : constant SDL_TextureAddressMode := 1;
   SDL_TextureAddressMode_SDL_TEXTURE_ADDRESS_WRAP : constant SDL_TextureAddressMode := 2;  -- /usr/local/include/SDL3/SDL_render.h:119

  --*< Wrapping is enabled if texture coordinates are outside [0, 1], this is the default  
  --*< Texture coordinates are clamped to the [0, 1] range  
  --*< The texture is repeated (tiled)  
  --*
  -- * How the logical size is mapped to the output.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_RendererLogicalPresentation is 
     (SDL_LOGICAL_PRESENTATION_DISABLED,
      SDL_LOGICAL_PRESENTATION_STRETCH,
      SDL_LOGICAL_PRESENTATION_LETTERBOX,
      SDL_LOGICAL_PRESENTATION_OVERSCAN,
      SDL_LOGICAL_PRESENTATION_INTEGER_SCALE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_render.h:132

  --*< There is no logical size in effect  
  --*< The rendered content is stretched to the output resolution  
  --*< The rendered content is fit to the largest dimension and the other dimension is letterboxed with the clear color  
  --*< The rendered content is fit to the smallest dimension and the other dimension extends beyond the output bounds  
  --*< The rendered content is scaled up by integer multiples to fit the output resolution  
  --*
  -- * A structure representing rendering state
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Renderer is null record;   -- incomplete struct

  --*
  -- * An efficient driver-specific representation of pixel data
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTexture
  -- * \sa SDL_CreateTextureFromSurface
  -- * \sa SDL_CreateTextureWithProperties
  -- * \sa SDL_DestroyTexture
  --  

  --*< The format of the texture, read-only  
   type SDL_Texture is record
      format : aliased SDL3_SDL_pixels_h.SDL_PixelFormat;  -- /usr/local/include/SDL3/SDL_render.h:162
      w : aliased int;  -- /usr/local/include/SDL3/SDL_render.h:163
      h : aliased int;  -- /usr/local/include/SDL3/SDL_render.h:164
      refcount : aliased int;  -- /usr/local/include/SDL3/SDL_render.h:166
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_render.h:160

  --*< The width of the texture, read-only.  
  --*< The height of the texture, read-only.  
  --*< Application reference count, used when freeing texture  
  -- Function prototypes  
  --*
  -- * Get the number of 2D rendering drivers available for the current display.
  -- *
  -- * A render driver is a set of code that handles rendering and texture
  -- * management on a particular display. Normally there is only one, but some
  -- * drivers may have several available with different capabilities.
  -- *
  -- * There may be none if SDL was compiled without render support.
  -- *
  -- * \returns the number of built in render drivers.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRenderer
  -- * \sa SDL_GetRenderDriver
  --  

   function SDL_GetNumRenderDrivers return int  -- /usr/local/include/SDL3/SDL_render.h:192
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumRenderDrivers";

  --*
  -- * Use this function to get the name of a built in 2D rendering driver.
  -- *
  -- * The list of rendering drivers is given in the order that they are normally
  -- * initialized by default; the drivers that seem more reasonable to choose
  -- * first (as far as the SDL developers believe) are earlier in the list.
  -- *
  -- * The names of drivers are all simple, low-ASCII identifiers, like "opengl",
  -- * "direct3d12" or "metal". These never have Unicode characters, and are not
  -- * meant to be proper names.
  -- *
  -- * \param index the index of the rendering driver; the value ranges from 0 to
  -- *              SDL_GetNumRenderDrivers() - 1.
  -- * \returns the name of the rendering driver at the requested index, or NULL
  -- *          if an invalid index was specified.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetNumRenderDrivers
  --  

   function SDL_GetRenderDriver (index : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_render.h:216
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDriver";

  --*
  -- * Create a window and default renderer.
  -- *
  -- * \param title the title of the window, in UTF-8 encoding.
  -- * \param width the width of the window.
  -- * \param height the height of the window.
  -- * \param window_flags the flags used to create the window (see
  -- *                     SDL_CreateWindow()).
  -- * \param window a pointer filled with the window, or NULL on error.
  -- * \param renderer a pointer filled with the renderer, or NULL on error.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRenderer
  -- * \sa SDL_CreateWindow
  --  

   function SDL_CreateWindowAndRenderer
     (title : Interfaces.C.Strings.chars_ptr;
      width : int;
      height : int;
      window_flags : SDL3_SDL_video_h.SDL_WindowFlags;
      window : System.Address;
      renderer : System.Address) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:238
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateWindowAndRenderer";

  --*
  -- * Create a 2D rendering context for a window.
  -- *
  -- * If you want a specific renderer, you can specify its name here. A list of
  -- * available renderers can be obtained by calling SDL_GetRenderDriver()
  -- * multiple times, with indices from 0 to SDL_GetNumRenderDrivers()-1. If you
  -- * don't need a specific renderer, specify NULL and SDL will attempt to choose
  -- * the best option for you, based on what is available on the user's system.
  -- *
  -- * If `name` is a comma-separated list, SDL will try each name, in the order
  -- * listed, until one succeeds or all of them fail.
  -- *
  -- * By default the rendering size matches the window size in pixels, but you
  -- * can call SDL_SetRenderLogicalPresentation() to change the content size and
  -- * scaling options.
  -- *
  -- * \param window the window where rendering is displayed.
  -- * \param name the name of the rendering driver to initialize, or NULL to let
  -- *             SDL choose one.
  -- * \returns a valid rendering context or NULL if there was an error; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRendererWithProperties
  -- * \sa SDL_CreateSoftwareRenderer
  -- * \sa SDL_DestroyRenderer
  -- * \sa SDL_GetNumRenderDrivers
  -- * \sa SDL_GetRenderDriver
  -- * \sa SDL_GetRendererName
  --  

   function SDL_CreateRenderer (window : access SDL3_SDL_video_h.SDL_Window; name : Interfaces.C.Strings.chars_ptr) return access SDL_Renderer  -- /usr/local/include/SDL3/SDL_render.h:273
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateRenderer";

  --*
  -- * Create a 2D rendering context for a window, with the specified properties.
  -- *
  -- * These are the supported properties:
  -- *
  -- * - `SDL_PROP_RENDERER_CREATE_NAME_STRING`: the name of the rendering driver
  -- *   to use, if a specific one is desired
  -- * - `SDL_PROP_RENDERER_CREATE_WINDOW_POINTER`: the window where rendering is
  -- *   displayed, required if this isn't a software renderer using a surface
  -- * - `SDL_PROP_RENDERER_CREATE_SURFACE_POINTER`: the surface where rendering
  -- *   is displayed, if you want a software renderer without a window
  -- * - `SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER`: an SDL_Colorspace
  -- *   value describing the colorspace for output to the display, defaults to
  -- *   SDL_COLORSPACE_SRGB. The direct3d11, direct3d12, and metal renderers
  -- *   support SDL_COLORSPACE_SRGB_LINEAR, which is a linear color space and
  -- *   supports HDR output. If you select SDL_COLORSPACE_SRGB_LINEAR, drawing
  -- *   still uses the sRGB colorspace, but values can go beyond 1.0 and float
  -- *   (linear) format textures can be used for HDR content.
  -- * - `SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER`: non-zero if you want
  -- *   present synchronized with the refresh rate. This property can take any
  -- *   value that is supported by SDL_SetRenderVSync() for the renderer.
  -- *
  -- * With the SDL GPU renderer (since SDL 3.4.0):
  -- *
  -- * - `SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER`: the device to use with the
  -- *   renderer, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN`: the app is able to
  -- *   provide SPIR-V shaders to SDL_GPURenderState, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN`: the app is able to
  -- *   provide DXIL shaders to SDL_GPURenderState, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN`: the app is able to
  -- *   provide MSL shaders to SDL_GPURenderState, optional.
  -- *
  -- * With the vulkan renderer:
  -- *
  -- * - `SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER`: the VkInstance to use
  -- *   with the renderer, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER`: the VkSurfaceKHR to use
  -- *   with the renderer, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER`: the
  -- *   VkPhysicalDevice to use with the renderer, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER`: the VkDevice to use
  -- *   with the renderer, optional.
  -- * - `SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER`: the
  -- *   queue family index used for rendering.
  -- * - `SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER`: the
  -- *   queue family index used for presentation.
  -- *
  -- * \param props the properties to use.
  -- * \returns a valid rendering context or NULL if there was an error; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateProperties
  -- * \sa SDL_CreateRenderer
  -- * \sa SDL_CreateSoftwareRenderer
  -- * \sa SDL_DestroyRenderer
  -- * \sa SDL_GetRendererName
  --  

   function SDL_CreateRendererWithProperties (props : SDL3_SDL_properties_h.SDL_PropertiesID) return access SDL_Renderer  -- /usr/local/include/SDL3/SDL_render.h:337
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateRendererWithProperties";

  --*
  -- * Create a 2D GPU rendering context.
  -- *
  -- * The GPU device to use is passed in as a parameter. If this is NULL, then a
  -- * device will be created normally and can be retrieved using
  -- * SDL_GetGPURendererDevice().
  -- *
  -- * The window to use is passed in as a parameter. If this is NULL, then this
  -- * will become an offscreen renderer. In that case, you should call
  -- * SDL_SetRenderTarget() to setup rendering to a texture, and then call
  -- * SDL_RenderPresent() normally to complete drawing a frame.
  -- *
  -- * \param device the GPU device to use with the renderer, or NULL to create a
  -- *               device.
  -- * \param window the window where rendering is displayed, or NULL to create an
  -- *               offscreen renderer.
  -- * \returns a valid rendering context or NULL if there was an error; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety If this function is called with a valid GPU device, it should
  -- *               be called on the thread that created the device. If this
  -- *               function is called with a valid window, it should be called
  -- *               on the thread that created the window.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_CreateRendererWithProperties
  -- * \sa SDL_GetGPURendererDevice
  -- * \sa SDL_CreateGPUShader
  -- * \sa SDL_CreateGPURenderState
  -- * \sa SDL_SetGPURenderState
  --  

   function SDL_CreateGPURenderer (device : access SDL3_SDL_gpu_h.SDL_GPUDevice; window : access SDL3_SDL_video_h.SDL_Window) return access SDL_Renderer  -- /usr/local/include/SDL3/SDL_render.h:387
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPURenderer";

  --*
  -- * Return the GPU device used by a renderer.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns the GPU device used by the renderer, or NULL if the renderer is
  -- *          not a GPU renderer; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_GetGPURendererDevice (renderer : access SDL_Renderer) return access SDL3_SDL_gpu_h.SDL_GPUDevice  -- /usr/local/include/SDL3/SDL_render.h:400
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPURendererDevice";

  --*
  -- * Create a 2D software rendering context for a surface.
  -- *
  -- * Two other API which can be used to create SDL_Renderer:
  -- * SDL_CreateRenderer() and SDL_CreateWindowAndRenderer(). These can _also_
  -- * create a software renderer, but they are intended to be used with an
  -- * SDL_Window as the final destination and not an SDL_Surface.
  -- *
  -- * \param surface the SDL_Surface structure representing the surface where
  -- *                rendering is done.
  -- * \returns a valid rendering context or NULL if there was an error; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroyRenderer
  --  

   function SDL_CreateSoftwareRenderer (surface : access SDL3_SDL_surface_h.SDL_Surface) return access SDL_Renderer  -- /usr/local/include/SDL3/SDL_render.h:421
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateSoftwareRenderer";

  --*
  -- * Get the renderer associated with a window.
  -- *
  -- * \param window the window to query.
  -- * \returns the rendering context on success or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRenderer (window : access SDL3_SDL_video_h.SDL_Window) return access SDL_Renderer  -- /usr/local/include/SDL3/SDL_render.h:434
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderer";

  --*
  -- * Get the window associated with a renderer.
  -- *
  -- * \param renderer the renderer to query.
  -- * \returns the window on success or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRenderWindow (renderer : access SDL_Renderer) return access SDL3_SDL_video_h.SDL_Window  -- /usr/local/include/SDL3/SDL_render.h:447
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderWindow";

  --*
  -- * Get the name of a renderer.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns the name of the selected renderer, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRenderer
  -- * \sa SDL_CreateRendererWithProperties
  --  

   function SDL_GetRendererName (renderer : access SDL_Renderer) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_render.h:463
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRendererName";

  --*
  -- * Get the properties associated with a renderer.
  -- *
  -- * The following read-only properties are provided by SDL:
  -- *
  -- * - `SDL_PROP_RENDERER_NAME_STRING`: the name of the rendering driver
  -- * - `SDL_PROP_RENDERER_WINDOW_POINTER`: the window where rendering is
  -- *   displayed, if any
  -- * - `SDL_PROP_RENDERER_SURFACE_POINTER`: the surface where rendering is
  -- *   displayed, if this is a software renderer without a window
  -- * - `SDL_PROP_RENDERER_VSYNC_NUMBER`: the current vsync setting
  -- * - `SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER`: the maximum texture width
  -- *   and height
  -- * - `SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER`: a (const SDL_PixelFormat *)
  -- *   array of pixel formats, terminated with SDL_PIXELFORMAT_UNKNOWN,
  -- *   representing the available texture formats for this renderer.
  -- * - `SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN`: true if the renderer
  -- *   supports SDL_TEXTURE_ADDRESS_WRAP on non-power-of-two textures.
  -- * - `SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER`: an SDL_Colorspace value
  -- *   describing the colorspace for output to the display, defaults to
  -- *   SDL_COLORSPACE_SRGB.
  -- * - `SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN`: true if the output colorspace is
  -- *   SDL_COLORSPACE_SRGB_LINEAR and the renderer is showing on a display with
  -- *   HDR enabled. This property can change dynamically when
  -- *   SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
  -- * - `SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT`: the value of SDR white in the
  -- *   SDL_COLORSPACE_SRGB_LINEAR colorspace. When HDR is enabled, this value is
  -- *   automatically multiplied into the color scale. This property can change
  -- *   dynamically when SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
  -- * - `SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT`: the additional high dynamic range
  -- *   that can be displayed, in terms of the SDR white point. When HDR is not
  -- *   enabled, this will be 1.0. This property can change dynamically when
  -- *   SDL_EVENT_WINDOW_HDR_STATE_CHANGED is sent.
  -- *
  -- * With the direct3d renderer:
  -- *
  -- * - `SDL_PROP_RENDERER_D3D9_DEVICE_POINTER`: the IDirect3DDevice9 associated
  -- *   with the renderer
  -- *
  -- * With the direct3d11 renderer:
  -- *
  -- * - `SDL_PROP_RENDERER_D3D11_DEVICE_POINTER`: the ID3D11Device associated
  -- *   with the renderer
  -- * - `SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER`: the IDXGISwapChain1
  -- *   associated with the renderer. This may change when the window is resized.
  -- *
  -- * With the direct3d12 renderer:
  -- *
  -- * - `SDL_PROP_RENDERER_D3D12_DEVICE_POINTER`: the ID3D12Device associated
  -- *   with the renderer
  -- * - `SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER`: the IDXGISwapChain4
  -- *   associated with the renderer.
  -- * - `SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER`: the ID3D12CommandQueue
  -- *   associated with the renderer
  -- *
  -- * With the vulkan renderer:
  -- *
  -- * - `SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER`: the VkInstance associated
  -- *   with the renderer
  -- * - `SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER`: the VkSurfaceKHR associated
  -- *   with the renderer
  -- * - `SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER`: the VkPhysicalDevice
  -- *   associated with the renderer
  -- * - `SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER`: the VkDevice associated with
  -- *   the renderer
  -- * - `SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER`: the queue
  -- *   family index used for rendering
  -- * - `SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER`: the queue
  -- *   family index used for presentation
  -- * - `SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER`: the number of
  -- *   swapchain images, or potential frames in flight, used by the Vulkan
  -- *   renderer
  -- *
  -- * With the gpu renderer:
  -- *
  -- * - `SDL_PROP_RENDERER_GPU_DEVICE_POINTER`: the SDL_GPUDevice associated with
  -- *   the renderer
  -- *
  -- * \param renderer the rendering context.
  -- * \returns a valid property ID on success or 0 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRendererProperties (renderer : access SDL_Renderer) return SDL3_SDL_properties_h.SDL_PropertiesID  -- /usr/local/include/SDL3/SDL_render.h:551
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRendererProperties";

  --*
  -- * Get the output size in pixels of a rendering context.
  -- *
  -- * This returns the true output size in pixels, ignoring any render targets or
  -- * logical size and presentation.
  -- *
  -- * For the output size of the current rendering target, with logical size
  -- * adjustments, use SDL_GetCurrentRenderOutputSize() instead.
  -- *
  -- * \param renderer the rendering context.
  -- * \param w a pointer filled in with the width in pixels.
  -- * \param h a pointer filled in with the height in pixels.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetCurrentRenderOutputSize
  --  

   function SDL_GetRenderOutputSize
     (renderer : access SDL_Renderer;
      w : access int;
      h : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:600
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderOutputSize";

  --*
  -- * Get the current output size in pixels of a rendering context.
  -- *
  -- * If a rendering target is active, this will return the size of the rendering
  -- * target in pixels, otherwise return the value of SDL_GetRenderOutputSize().
  -- *
  -- * Rendering target or not, the output will be adjusted by the current logical
  -- * presentation state, dictated by SDL_SetRenderLogicalPresentation().
  -- *
  -- * \param renderer the rendering context.
  -- * \param w a pointer filled in with the current width.
  -- * \param h a pointer filled in with the current height.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderOutputSize
  --  

   function SDL_GetCurrentRenderOutputSize
     (renderer : access SDL_Renderer;
      w : access int;
      h : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:623
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetCurrentRenderOutputSize";

  --*
  -- * Create a texture for a rendering context.
  -- *
  -- * The contents of a texture when first created are not defined.
  -- *
  -- * \param renderer the rendering context.
  -- * \param format one of the enumerated values in SDL_PixelFormat.
  -- * \param access one of the enumerated values in SDL_TextureAccess.
  -- * \param w the width of the texture in pixels.
  -- * \param h the height of the texture in pixels.
  -- * \returns the created texture or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTextureFromSurface
  -- * \sa SDL_CreateTextureWithProperties
  -- * \sa SDL_DestroyTexture
  -- * \sa SDL_GetTextureSize
  -- * \sa SDL_UpdateTexture
  --  

   function SDL_CreateTexture
     (renderer : access SDL_Renderer;
      format : SDL3_SDL_pixels_h.SDL_PixelFormat;
      c_access : SDL_TextureAccess;
      w : int;
      h : int) return access SDL_Texture  -- /usr/local/include/SDL3/SDL_render.h:648
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTexture";

  --*
  -- * Create a texture from an existing surface.
  -- *
  -- * The surface is not modified or freed by this function.
  -- *
  -- * The SDL_TextureAccess hint for the created texture is
  -- * `SDL_TEXTUREACCESS_STATIC`.
  -- *
  -- * The pixel format of the created texture may be different from the pixel
  -- * format of the surface, and can be queried using the
  -- * SDL_PROP_TEXTURE_FORMAT_NUMBER property.
  -- *
  -- * \param renderer the rendering context.
  -- * \param surface the SDL_Surface structure containing pixel data used to fill
  -- *                the texture.
  -- * \returns the created texture or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTexture
  -- * \sa SDL_CreateTextureWithProperties
  -- * \sa SDL_DestroyTexture
  --  

   function SDL_CreateTextureFromSurface (renderer : access SDL_Renderer; surface : access SDL3_SDL_surface_h.SDL_Surface) return access SDL_Texture  -- /usr/local/include/SDL3/SDL_render.h:676
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTextureFromSurface";

  --*
  -- * Create a texture for a rendering context with the specified properties.
  -- *
  -- * These are the supported properties:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER`: an SDL_Colorspace value
  -- *   describing the texture colorspace, defaults to SDL_COLORSPACE_SRGB_LINEAR
  -- *   for floating point textures, SDL_COLORSPACE_HDR10 for 10-bit textures,
  -- *   SDL_COLORSPACE_SRGB for other RGB textures and SDL_COLORSPACE_JPEG for
  -- *   YUV textures.
  -- * - `SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER`: one of the enumerated values in
  -- *   SDL_PixelFormat, defaults to the best RGBA format for the renderer
  -- * - `SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER`: one of the enumerated values in
  -- *   SDL_TextureAccess, defaults to SDL_TEXTUREACCESS_STATIC
  -- * - `SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER`: the width of the texture in
  -- *   pixels, required
  -- * - `SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER`: the height of the texture in
  -- *   pixels, required
  -- * - `SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER`: an SDL_Palette to use with
  -- *   palettized texture formats. This can be set later with
  -- *   SDL_SetTexturePalette()
  -- * - `SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating
  -- *   point textures, this defines the value of 100% diffuse white, with higher
  -- *   values being displayed in the High Dynamic Range headroom. This defaults
  -- *   to 100 for HDR10 textures and 1.0 for floating point textures.
  -- * - `SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT`: for HDR10 and floating
  -- *   point textures, this defines the maximum dynamic range used by the
  -- *   content, in terms of the SDR white point. This would be equivalent to
  -- *   maxCLL / SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT for HDR10 content.
  -- *   If this is defined, any values outside the range supported by the display
  -- *   will be scaled into the available HDR headroom, otherwise they are
  -- *   clipped.
  -- *
  -- * With the direct3d11 renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER`: the ID3D11Texture2D
  -- *   associated with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER`: the ID3D11Texture2D
  -- *   associated with the U plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER`: the ID3D11Texture2D
  -- *   associated with the V plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- *
  -- * With the direct3d12 renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER`: the ID3D12Resource
  -- *   associated with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER`: the ID3D12Resource
  -- *   associated with the U plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER`: the ID3D12Resource
  -- *   associated with the V plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- *
  -- * With the metal renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER`: the CVPixelBufferRef
  -- *   associated with the texture, if you want to create a texture from an
  -- *   existing pixel buffer.
  -- *
  -- * With the opengl renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER`: the GLuint texture
  -- *   associated with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER`: the GLuint texture
  -- *   associated with the UV plane of an NV12 texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER`: the GLuint texture
  -- *   associated with the U plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER`: the GLuint texture
  -- *   associated with the V plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- *
  -- * With the opengles2 renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  -- *   associated with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  -- *   associated with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER`: the GLuint texture
  -- *   associated with the UV plane of an NV12 texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER`: the GLuint texture
  -- *   associated with the U plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER`: the GLuint texture
  -- *   associated with the V plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- *
  -- * With the vulkan renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER`: the VkImage associated
  -- *   with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_VULKAN_LAYOUT_NUMBER`: the VkImageLayout for the
  -- *   VkImage, defaults to VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL.
  -- *
  -- * With the GPU renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER`: the SDL_GPUTexture
  -- *   associated with the texture, if you want to wrap an existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_NUMBER`: the SDL_GPUTexture
  -- *   associated with the UV plane of an NV12 texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_NUMBER`: the SDL_GPUTexture
  -- *   associated with the U plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- * - `SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_NUMBER`: the SDL_GPUTexture
  -- *   associated with the V plane of a YUV texture, if you want to wrap an
  -- *   existing texture.
  -- *
  -- * \param renderer the rendering context.
  -- * \param props the properties to use.
  -- * \returns the created texture or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateProperties
  -- * \sa SDL_CreateTexture
  -- * \sa SDL_CreateTextureFromSurface
  -- * \sa SDL_DestroyTexture
  -- * \sa SDL_GetTextureSize
  -- * \sa SDL_UpdateTexture
  --  

   function SDL_CreateTextureWithProperties (renderer : access SDL_Renderer; props : SDL3_SDL_properties_h.SDL_PropertiesID) return access SDL_Texture  -- /usr/local/include/SDL3/SDL_render.h:806
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTextureWithProperties";

  --*
  -- * Get the properties associated with a texture.
  -- *
  -- * The following read-only properties are provided by SDL:
  -- *
  -- * - `SDL_PROP_TEXTURE_COLORSPACE_NUMBER`: an SDL_Colorspace value describing
  -- *   the texture colorspace.
  -- * - `SDL_PROP_TEXTURE_FORMAT_NUMBER`: one of the enumerated values in
  -- *   SDL_PixelFormat.
  -- * - `SDL_PROP_TEXTURE_ACCESS_NUMBER`: one of the enumerated values in
  -- *   SDL_TextureAccess.
  -- * - `SDL_PROP_TEXTURE_WIDTH_NUMBER`: the width of the texture in pixels.
  -- * - `SDL_PROP_TEXTURE_HEIGHT_NUMBER`: the height of the texture in pixels.
  -- * - `SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT`: for HDR10 and floating point
  -- *   textures, this defines the value of 100% diffuse white, with higher
  -- *   values being displayed in the High Dynamic Range headroom. This defaults
  -- *   to 100 for HDR10 textures and 1.0 for other textures.
  -- * - `SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT`: for HDR10 and floating point
  -- *   textures, this defines the maximum dynamic range used by the content, in
  -- *   terms of the SDR white point. If this is defined, any values outside the
  -- *   range supported by the display will be scaled into the available HDR
  -- *   headroom, otherwise they are clipped. This defaults to 1.0 for SDR
  -- *   textures, 4.0 for HDR10 textures, and no default for floating point
  -- *   textures.
  -- *
  -- * With the direct3d11 renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER`: the ID3D11Texture2D associated
  -- *   with the texture
  -- * - `SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER`: the ID3D11Texture2D
  -- *   associated with the U plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER`: the ID3D11Texture2D
  -- *   associated with the V plane of a YUV texture
  -- *
  -- * With the direct3d12 renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER`: the ID3D12Resource associated
  -- *   with the texture
  -- * - `SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER`: the ID3D12Resource associated
  -- *   with the U plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER`: the ID3D12Resource associated
  -- *   with the V plane of a YUV texture
  -- *
  -- * With the vulkan renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER`: the VkImage associated with the
  -- *   texture
  -- *
  -- * With the opengl renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER`: the GLuint texture associated
  -- *   with the texture
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER`: the GLuint texture
  -- *   associated with the UV plane of an NV12 texture
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER`: the GLuint texture associated
  -- *   with the U plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER`: the GLuint texture associated
  -- *   with the V plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER`: the GLenum for the
  -- *   texture target (`GL_TEXTURE_2D`, `GL_TEXTURE_RECTANGLE_ARB`, etc)
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT`: the texture coordinate width of
  -- *   the texture (0.0 - 1.0)
  -- * - `SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT`: the texture coordinate height of
  -- *   the texture (0.0 - 1.0)
  -- *
  -- * With the opengles2 renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER`: the GLuint texture
  -- *   associated with the texture
  -- * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER`: the GLuint texture
  -- *   associated with the UV plane of an NV12 texture
  -- * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER`: the GLuint texture
  -- *   associated with the U plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER`: the GLuint texture
  -- *   associated with the V plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER`: the GLenum for the
  -- *   texture target (`GL_TEXTURE_2D`, `GL_TEXTURE_EXTERNAL_OES`, etc)
  -- *
  -- * With the gpu renderer:
  -- *
  -- * - `SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER`: the SDL_GPUTexture associated
  -- *   with the texture
  -- * - `SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER`: the SDL_GPUTexture associated
  -- *   with the UV plane of an NV12 texture
  -- * - `SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER`: the SDL_GPUTexture associated
  -- *   with the U plane of a YUV texture
  -- * - `SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER`: the SDL_GPUTexture associated
  -- *   with the V plane of a YUV texture
  -- *
  -- * \param texture the texture to query.
  -- * \returns a valid property ID on success or 0 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTextureProperties (texture : access SDL_Texture) return SDL3_SDL_properties_h.SDL_PropertiesID  -- /usr/local/include/SDL3/SDL_render.h:935
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureProperties";

  --*
  -- * Get the renderer that created an SDL_Texture.
  -- *
  -- * \param texture the texture to query.
  -- * \returns a pointer to the SDL_Renderer that created the texture, or NULL on
  -- *          failure; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRendererFromTexture (texture : access SDL_Texture) return access SDL_Renderer  -- /usr/local/include/SDL3/SDL_render.h:979
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRendererFromTexture";

  --*
  -- * Get the size of a texture, as floating point values.
  -- *
  -- * \param texture the texture to query.
  -- * \param w a pointer filled in with the width of the texture in pixels. This
  -- *          argument can be NULL if you don't need this information.
  -- * \param h a pointer filled in with the height of the texture in pixels. This
  -- *          argument can be NULL if you don't need this information.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTextureSize
     (texture : access SDL_Texture;
      w : access float;
      h : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:996
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureSize";

  --*
  -- * Set the palette used by a texture.
  -- *
  -- * Setting the palette keeps an internal reference to the palette, which can
  -- * be safely destroyed afterwards.
  -- *
  -- * A single palette can be shared with many textures.
  -- *
  -- * \param texture the texture to update.
  -- * \param palette the SDL_Palette structure to use.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_CreatePalette
  -- * \sa SDL_GetTexturePalette
  --  

   function SDL_SetTexturePalette (texture : access SDL_Texture; palette : access SDL3_SDL_pixels_h.SDL_Palette) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1018
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTexturePalette";

  --*
  -- * Get the palette used by a texture.
  -- *
  -- * \param texture the texture to query.
  -- * \returns a pointer to the palette used by the texture, or NULL if there is
  -- *          no palette used.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_SetTexturePalette
  --  

   function SDL_GetTexturePalette (texture : access SDL_Texture) return access SDL3_SDL_pixels_h.SDL_Palette  -- /usr/local/include/SDL3/SDL_render.h:1033
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTexturePalette";

  --*
  -- * Set an additional color value multiplied into render copy operations.
  -- *
  -- * When this texture is rendered, during the copy operation each source color
  -- * channel is modulated by the appropriate color value according to the
  -- * following formula:
  -- *
  -- * `srcC = srcC * (color / 255)`
  -- *
  -- * Color modulation is not always supported by the renderer; it will return
  -- * false if color modulation is not supported.
  -- *
  -- * \param texture the texture to update.
  -- * \param r the red color value multiplied into copy operations.
  -- * \param g the green color value multiplied into copy operations.
  -- * \param b the blue color value multiplied into copy operations.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureColorMod
  -- * \sa SDL_SetTextureAlphaMod
  -- * \sa SDL_SetTextureColorModFloat
  --  

   function SDL_SetTextureColorMod
     (texture : access SDL_Texture;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1062
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureColorMod";

  --*
  -- * Set an additional color value multiplied into render copy operations.
  -- *
  -- * When this texture is rendered, during the copy operation each source color
  -- * channel is modulated by the appropriate color value according to the
  -- * following formula:
  -- *
  -- * `srcC = srcC * color`
  -- *
  -- * Color modulation is not always supported by the renderer; it will return
  -- * false if color modulation is not supported.
  -- *
  -- * \param texture the texture to update.
  -- * \param r the red color value multiplied into copy operations.
  -- * \param g the green color value multiplied into copy operations.
  -- * \param b the blue color value multiplied into copy operations.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureColorModFloat
  -- * \sa SDL_SetTextureAlphaModFloat
  -- * \sa SDL_SetTextureColorMod
  --  

   function SDL_SetTextureColorModFloat
     (texture : access SDL_Texture;
      r : float;
      g : float;
      b : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1092
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureColorModFloat";

  --*
  -- * Get the additional color value multiplied into render copy operations.
  -- *
  -- * \param texture the texture to query.
  -- * \param r a pointer filled in with the current red color value.
  -- * \param g a pointer filled in with the current green color value.
  -- * \param b a pointer filled in with the current blue color value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureAlphaMod
  -- * \sa SDL_GetTextureColorModFloat
  -- * \sa SDL_SetTextureColorMod
  --  

   function SDL_GetTextureColorMod
     (texture : access SDL_Texture;
      r : access SDL3_SDL_stdinc_h.Uint8;
      g : access SDL3_SDL_stdinc_h.Uint8;
      b : access SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1113
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureColorMod";

  --*
  -- * Get the additional color value multiplied into render copy operations.
  -- *
  -- * \param texture the texture to query.
  -- * \param r a pointer filled in with the current red color value.
  -- * \param g a pointer filled in with the current green color value.
  -- * \param b a pointer filled in with the current blue color value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureAlphaModFloat
  -- * \sa SDL_GetTextureColorMod
  -- * \sa SDL_SetTextureColorModFloat
  --  

   function SDL_GetTextureColorModFloat
     (texture : access SDL_Texture;
      r : access float;
      g : access float;
      b : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1133
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureColorModFloat";

  --*
  -- * Set an additional alpha value multiplied into render copy operations.
  -- *
  -- * When this texture is rendered, during the copy operation the source alpha
  -- * value is modulated by this alpha value according to the following formula:
  -- *
  -- * `srcA = srcA * (alpha / 255)`
  -- *
  -- * Alpha modulation is not always supported by the renderer; it will return
  -- * false if alpha modulation is not supported.
  -- *
  -- * \param texture the texture to update.
  -- * \param alpha the source alpha value multiplied into copy operations.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureAlphaMod
  -- * \sa SDL_SetTextureAlphaModFloat
  -- * \sa SDL_SetTextureColorMod
  --  

   function SDL_SetTextureAlphaMod (texture : access SDL_Texture; alpha : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1159
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureAlphaMod";

  --*
  -- * Set an additional alpha value multiplied into render copy operations.
  -- *
  -- * When this texture is rendered, during the copy operation the source alpha
  -- * value is modulated by this alpha value according to the following formula:
  -- *
  -- * `srcA = srcA * alpha`
  -- *
  -- * Alpha modulation is not always supported by the renderer; it will return
  -- * false if alpha modulation is not supported.
  -- *
  -- * \param texture the texture to update.
  -- * \param alpha the source alpha value multiplied into copy operations.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureAlphaModFloat
  -- * \sa SDL_SetTextureAlphaMod
  -- * \sa SDL_SetTextureColorModFloat
  --  

   function SDL_SetTextureAlphaModFloat (texture : access SDL_Texture; alpha : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1185
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureAlphaModFloat";

  --*
  -- * Get the additional alpha value multiplied into render copy operations.
  -- *
  -- * \param texture the texture to query.
  -- * \param alpha a pointer filled in with the current alpha value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureAlphaModFloat
  -- * \sa SDL_GetTextureColorMod
  -- * \sa SDL_SetTextureAlphaMod
  --  

   function SDL_GetTextureAlphaMod (texture : access SDL_Texture; alpha : access SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1203
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureAlphaMod";

  --*
  -- * Get the additional alpha value multiplied into render copy operations.
  -- *
  -- * \param texture the texture to query.
  -- * \param alpha a pointer filled in with the current alpha value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureAlphaMod
  -- * \sa SDL_GetTextureColorModFloat
  -- * \sa SDL_SetTextureAlphaModFloat
  --  

   function SDL_GetTextureAlphaModFloat (texture : access SDL_Texture; alpha : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1221
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureAlphaModFloat";

  --*
  -- * Set the blend mode for a texture, used by SDL_RenderTexture().
  -- *
  -- * If the blend mode is not supported, the closest supported mode is chosen
  -- * and this function returns false.
  -- *
  -- * \param texture the texture to update.
  -- * \param blendMode the SDL_BlendMode to use for texture blending.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureBlendMode
  --  

   function SDL_SetTextureBlendMode (texture : access SDL_Texture; blendMode : SDL3_SDL_blendmode_h.SDL_BlendMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1240
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureBlendMode";

  --*
  -- * Get the blend mode used for texture copy operations.
  -- *
  -- * \param texture the texture to query.
  -- * \param blendMode a pointer filled in with the current SDL_BlendMode.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetTextureBlendMode
  --  

   function SDL_GetTextureBlendMode (texture : access SDL_Texture; blendMode : access SDL3_SDL_blendmode_h.SDL_BlendMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1256
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureBlendMode";

  --*
  -- * Set the scale mode used for texture scale operations.
  -- *
  -- * The default texture scale mode is SDL_SCALEMODE_LINEAR.
  -- *
  -- * If the scale mode is not supported, the closest supported mode is chosen.
  -- *
  -- * \param texture the texture to update.
  -- * \param scaleMode the SDL_ScaleMode to use for texture scaling.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTextureScaleMode
  --  

   function SDL_SetTextureScaleMode (texture : access SDL_Texture; scaleMode : SDL3_SDL_surface_h.SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1276
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTextureScaleMode";

  --*
  -- * Get the scale mode used for texture scale operations.
  -- *
  -- * \param texture the texture to query.
  -- * \param scaleMode a pointer filled in with the current scale mode.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetTextureScaleMode
  --  

   function SDL_GetTextureScaleMode (texture : access SDL_Texture; scaleMode : access SDL3_SDL_surface_h.SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1292
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTextureScaleMode";

  --*
  -- * Update the given texture rectangle with new pixel data.
  -- *
  -- * The pixel data must be in the pixel format of the texture, which can be
  -- * queried using the SDL_PROP_TEXTURE_FORMAT_NUMBER property.
  -- *
  -- * This is a fairly slow function, intended for use with static textures that
  -- * do not change often.
  -- *
  -- * If the texture is intended to be updated often, it is preferred to create
  -- * the texture as streaming and use the locking functions referenced below.
  -- * While this function will work with streaming textures, for optimization
  -- * reasons you may not get the pixels back if you lock the texture afterward.
  -- *
  -- * \param texture the texture to update.
  -- * \param rect an SDL_Rect structure representing the area to update, or NULL
  -- *             to update the entire texture.
  -- * \param pixels the raw pixel data in the format of the texture.
  -- * \param pitch the number of bytes in a row of pixel data, including padding
  -- *              between lines.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockTexture
  -- * \sa SDL_UnlockTexture
  -- * \sa SDL_UpdateNVTexture
  -- * \sa SDL_UpdateYUVTexture
  --  

   function SDL_UpdateTexture
     (texture : access SDL_Texture;
      rect : access constant SDL3_SDL_rect_h.SDL_Rect;
      pixels : System.Address;
      pitch : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1326
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateTexture";

  --*
  -- * Update a rectangle within a planar YV12 or IYUV texture with new pixel
  -- * data.
  -- *
  -- * You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
  -- * block of Y and U/V planes in the proper order, but this function is
  -- * available if your pixel data is not contiguous.
  -- *
  -- * \param texture the texture to update.
  -- * \param rect a pointer to the rectangle of pixels to update, or NULL to
  -- *             update the entire texture.
  -- * \param Yplane the raw pixel data for the Y plane.
  -- * \param Ypitch the number of bytes between rows of pixel data for the Y
  -- *               plane.
  -- * \param Uplane the raw pixel data for the U plane.
  -- * \param Upitch the number of bytes between rows of pixel data for the U
  -- *               plane.
  -- * \param Vplane the raw pixel data for the V plane.
  -- * \param Vpitch the number of bytes between rows of pixel data for the V
  -- *               plane.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UpdateNVTexture
  -- * \sa SDL_UpdateTexture
  --  

   function SDL_UpdateYUVTexture
     (texture : access SDL_Texture;
      rect : access constant SDL3_SDL_rect_h.SDL_Rect;
      Yplane : access SDL3_SDL_stdinc_h.Uint8;
      Ypitch : int;
      Uplane : access SDL3_SDL_stdinc_h.Uint8;
      Upitch : int;
      Vplane : access SDL3_SDL_stdinc_h.Uint8;
      Vpitch : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1358
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateYUVTexture";

  --*
  -- * Update a rectangle within a planar NV12 or NV21 texture with new pixels.
  -- *
  -- * You can use SDL_UpdateTexture() as long as your pixel data is a contiguous
  -- * block of NV12/21 planes in the proper order, but this function is available
  -- * if your pixel data is not contiguous.
  -- *
  -- * \param texture the texture to update.
  -- * \param rect a pointer to the rectangle of pixels to update, or NULL to
  -- *             update the entire texture.
  -- * \param Yplane the raw pixel data for the Y plane.
  -- * \param Ypitch the number of bytes between rows of pixel data for the Y
  -- *               plane.
  -- * \param UVplane the raw pixel data for the UV plane.
  -- * \param UVpitch the number of bytes between rows of pixel data for the UV
  -- *                plane.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UpdateTexture
  -- * \sa SDL_UpdateYUVTexture
  --  

   function SDL_UpdateNVTexture
     (texture : access SDL_Texture;
      rect : access constant SDL3_SDL_rect_h.SDL_Rect;
      Yplane : access SDL3_SDL_stdinc_h.Uint8;
      Ypitch : int;
      UVplane : access SDL3_SDL_stdinc_h.Uint8;
      UVpitch : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1390
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateNVTexture";

  --*
  -- * Lock a portion of the texture for **write-only** pixel access.
  -- *
  -- * As an optimization, the pixels made available for editing don't necessarily
  -- * contain the old texture data. This is a write-only operation, and if you
  -- * need to keep a copy of the texture data you should do that at the
  -- * application level.
  -- *
  -- * You must use SDL_UnlockTexture() to unlock the pixels and apply any
  -- * changes.
  -- *
  -- * \param texture the texture to lock for access, which was created with
  -- *                `SDL_TEXTUREACCESS_STREAMING`.
  -- * \param rect an SDL_Rect structure representing the area to lock for access;
  -- *             NULL to lock the entire texture.
  -- * \param pixels this is filled in with a pointer to the locked pixels,
  -- *               appropriately offset by the locked area.
  -- * \param pitch this is filled in with the pitch of the locked pixels; the
  -- *              pitch is the length of one row in bytes.
  -- * \returns true on success or false if the texture is not valid or was not
  -- *          created with `SDL_TEXTUREACCESS_STREAMING`; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockTextureToSurface
  -- * \sa SDL_UnlockTexture
  --  

   function SDL_LockTexture
     (texture : access SDL_Texture;
      rect : access constant SDL3_SDL_rect_h.SDL_Rect;
      pixels : System.Address;
      pitch : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1425
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockTexture";

  --*
  -- * Lock a portion of the texture for **write-only** pixel access, and expose
  -- * it as a SDL surface.
  -- *
  -- * Besides providing an SDL_Surface instead of raw pixel data, this function
  -- * operates like SDL_LockTexture.
  -- *
  -- * As an optimization, the pixels made available for editing don't necessarily
  -- * contain the old texture data. This is a write-only operation, and if you
  -- * need to keep a copy of the texture data you should do that at the
  -- * application level.
  -- *
  -- * You must use SDL_UnlockTexture() to unlock the pixels and apply any
  -- * changes.
  -- *
  -- * The returned surface is freed internally after calling SDL_UnlockTexture()
  -- * or SDL_DestroyTexture(). The caller should not free it.
  -- *
  -- * \param texture the texture to lock for access, which must be created with
  -- *                `SDL_TEXTUREACCESS_STREAMING`.
  -- * \param rect a pointer to the rectangle to lock for access. If the rect is
  -- *             NULL, the entire texture will be locked.
  -- * \param surface a pointer to an SDL surface of size **rect**. Don't assume
  -- *                any specific pixel content.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockTexture
  -- * \sa SDL_UnlockTexture
  --  

   function SDL_LockTextureToSurface
     (texture : access SDL_Texture;
      rect : access constant SDL3_SDL_rect_h.SDL_Rect;
      surface : System.Address) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1463
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockTextureToSurface";

  --*
  -- * Unlock a texture, uploading the changes to video memory, if needed.
  -- *
  -- * **Warning**: Please note that SDL_LockTexture() is intended to be
  -- * write-only; it will not guarantee the previous contents of the texture will
  -- * be provided. You must fully initialize any area of a texture that you lock
  -- * before unlocking it, as the pixels might otherwise be uninitialized memory.
  -- *
  -- * Which is to say: locking and immediately unlocking a texture can result in
  -- * corrupted textures, depending on the renderer in use.
  -- *
  -- * \param texture a texture locked by SDL_LockTexture().
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_LockTexture
  --  

   procedure SDL_UnlockTexture (texture : access SDL_Texture)  -- /usr/local/include/SDL3/SDL_render.h:1484
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockTexture";

  --*
  -- * Set a texture as the current rendering target.
  -- *
  -- * The default render target is the window for which the renderer was created.
  -- * To stop rendering to a texture and render to the window again, call this
  -- * function with a NULL `texture`.
  -- *
  -- * Viewport, cliprect, scale, and logical presentation are unique to each
  -- * render target. Get and set functions for these states apply to the current
  -- * render target set by this function, and those states persist on each target
  -- * when the current render target changes.
  -- *
  -- * \param renderer the rendering context.
  -- * \param texture the targeted texture, which must be created with the
  -- *                `SDL_TEXTUREACCESS_TARGET` flag, or NULL to render to the
  -- *                window instead of a texture.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderTarget
  --  

   function SDL_SetRenderTarget (renderer : access SDL_Renderer; texture : access SDL_Texture) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1511
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderTarget";

  --*
  -- * Get the current render target.
  -- *
  -- * The default render target is the window for which the renderer was created,
  -- * and is reported a NULL here.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns the current render target or NULL for the default render target.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderTarget
  --  

   function SDL_GetRenderTarget (renderer : access SDL_Renderer) return access SDL_Texture  -- /usr/local/include/SDL3/SDL_render.h:1528
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderTarget";

  --*
  -- * Set a device-independent resolution and presentation mode for rendering.
  -- *
  -- * This function sets the width and height of the logical rendering output.
  -- * The renderer will act as if the current render target is always the
  -- * requested dimensions, scaling to the actual resolution as necessary.
  -- *
  -- * This can be useful for games that expect a fixed size, but would like to
  -- * scale the output to whatever is available, regardless of how a user resizes
  -- * a window, or if the display is high DPI.
  -- *
  -- * Logical presentation can be used with both render target textures and the
  -- * renderer's window; the state is unique to each render target, and this
  -- * function sets the state for the current render target. It might be useful
  -- * to draw to a texture that matches the window dimensions with logical
  -- * presentation enabled, and then draw that texture across the entire window
  -- * with logical presentation disabled. Be careful not to render both with
  -- * logical presentation enabled, however, as this could produce
  -- * double-letterboxing, etc.
  -- *
  -- * You can disable logical coordinates by setting the mode to
  -- * SDL_LOGICAL_PRESENTATION_DISABLED, and in that case you get the full pixel
  -- * resolution of the render target; it is safe to toggle logical presentation
  -- * during the rendering of a frame: perhaps most of the rendering is done to
  -- * specific dimensions but to make fonts look sharp, the app turns off logical
  -- * presentation while drawing text, for example.
  -- *
  -- * You can convert coordinates in an event into rendering coordinates using
  -- * SDL_ConvertEventToRenderCoordinates().
  -- *
  -- * \param renderer the rendering context.
  -- * \param w the width of the logical resolution.
  -- * \param h the height of the logical resolution.
  -- * \param mode the presentation mode used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ConvertEventToRenderCoordinates
  -- * \sa SDL_GetRenderLogicalPresentation
  -- * \sa SDL_GetRenderLogicalPresentationRect
  --  

   function SDL_SetRenderLogicalPresentation
     (renderer : access SDL_Renderer;
      w : int;
      h : int;
      mode : SDL_RendererLogicalPresentation) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1575
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderLogicalPresentation";

  --*
  -- * Get device independent resolution and presentation mode for rendering.
  -- *
  -- * This function gets the width and height of the logical rendering output, or
  -- * 0 if a logical resolution is not enabled.
  -- *
  -- * Each render target has its own logical presentation state. This function
  -- * gets the state for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param w an int filled with the logical presentation width.
  -- * \param h an int filled with the logical presentation height.
  -- * \param mode a variable filled with the logical presentation mode being
  -- *             used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderLogicalPresentation
  --  

   function SDL_GetRenderLogicalPresentation
     (renderer : access SDL_Renderer;
      w : access int;
      h : access int;
      mode : access SDL_RendererLogicalPresentation) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1600
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderLogicalPresentation";

  --*
  -- * Get the final presentation rectangle for rendering.
  -- *
  -- * This function returns the calculated rectangle used for logical
  -- * presentation, based on the presentation mode and output size. If logical
  -- * presentation is disabled, it will fill the rectangle with the output size,
  -- * in pixels.
  -- *
  -- * Each render target has its own logical presentation state. This function
  -- * gets the rectangle for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect a pointer filled in with the final presentation rectangle, may
  -- *             be NULL.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderLogicalPresentation
  --  

   function SDL_GetRenderLogicalPresentationRect (renderer : access SDL_Renderer; rect : access SDL3_SDL_rect_h.SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1625
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderLogicalPresentationRect";

  --*
  -- * Get a point in render coordinates when given a point in window coordinates.
  -- *
  -- * This takes into account several states:
  -- *
  -- * - The window dimensions.
  -- * - The logical presentation settings (SDL_SetRenderLogicalPresentation)
  -- * - The scale (SDL_SetRenderScale)
  -- * - The viewport (SDL_SetRenderViewport)
  -- *
  -- * \param renderer the rendering context.
  -- * \param window_x the x coordinate in window coordinates.
  -- * \param window_y the y coordinate in window coordinates.
  -- * \param x a pointer filled with the x coordinate in render coordinates.
  -- * \param y a pointer filled with the y coordinate in render coordinates.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderLogicalPresentation
  -- * \sa SDL_SetRenderScale
  --  

   function SDL_RenderCoordinatesFromWindow
     (renderer : access SDL_Renderer;
      window_x : float;
      window_y : float;
      x : access float;
      y : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1652
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderCoordinatesFromWindow";

  --*
  -- * Get a point in window coordinates when given a point in render coordinates.
  -- *
  -- * This takes into account several states:
  -- *
  -- * - The window dimensions.
  -- * - The logical presentation settings (SDL_SetRenderLogicalPresentation)
  -- * - The scale (SDL_SetRenderScale)
  -- * - The viewport (SDL_SetRenderViewport)
  -- *
  -- * \param renderer the rendering context.
  -- * \param x the x coordinate in render coordinates.
  -- * \param y the y coordinate in render coordinates.
  -- * \param window_x a pointer filled with the x coordinate in window
  -- *                 coordinates.
  -- * \param window_y a pointer filled with the y coordinate in window
  -- *                 coordinates.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderLogicalPresentation
  -- * \sa SDL_SetRenderScale
  -- * \sa SDL_SetRenderViewport
  --  

   function SDL_RenderCoordinatesToWindow
     (renderer : access SDL_Renderer;
      x : float;
      y : float;
      window_x : access float;
      window_y : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1682
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderCoordinatesToWindow";

  --*
  -- * Convert the coordinates in an event to render coordinates.
  -- *
  -- * This takes into account several states:
  -- *
  -- * - The window dimensions.
  -- * - The logical presentation settings (SDL_SetRenderLogicalPresentation)
  -- * - The scale (SDL_SetRenderScale)
  -- * - The viewport (SDL_SetRenderViewport)
  -- *
  -- * Various event types are converted with this function: mouse, touch, pen,
  -- * etc.
  -- *
  -- * Touch coordinates are converted from normalized coordinates in the window
  -- * to non-normalized rendering coordinates.
  -- *
  -- * Relative mouse coordinates (xrel and yrel event fields) are _also_
  -- * converted. Applications that do not want these fields converted should use
  -- * SDL_RenderCoordinatesFromWindow() on the specific event fields instead of
  -- * converting the entire event structure.
  -- *
  -- * Once converted, coordinates may be outside the rendering area.
  -- *
  -- * \param renderer the rendering context.
  -- * \param event the event to modify.
  -- * \returns true if the event is converted or doesn't need conversion, or
  -- *          false on failure; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderCoordinatesFromWindow
  --  

   function SDL_ConvertEventToRenderCoordinates (renderer : access SDL_Renderer; event : access SDL3_SDL_events_h.SDL_Event) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1718
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ConvertEventToRenderCoordinates";

  --*
  -- * Set the drawing area for rendering on the current target.
  -- *
  -- * Drawing will clip to this area (separately from any clipping done with
  -- * SDL_SetRenderClipRect), and the top left of the area will become coordinate
  -- * (0, 0) for future drawing commands.
  -- *
  -- * The area's width and height must be >= 0.
  -- *
  -- * Each render target has its own viewport. This function sets the viewport
  -- * for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect the SDL_Rect structure representing the drawing area, or NULL
  -- *             to set the viewport to the entire target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderViewport
  -- * \sa SDL_RenderViewportSet
  --  

   function SDL_SetRenderViewport (renderer : access SDL_Renderer; rect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1745
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderViewport";

  --*
  -- * Get the drawing area for the current target.
  -- *
  -- * Each render target has its own viewport. This function gets the viewport
  -- * for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect an SDL_Rect structure filled in with the current drawing area.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderViewportSet
  -- * \sa SDL_SetRenderViewport
  --  

   function SDL_GetRenderViewport (renderer : access SDL_Renderer; rect : access SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1765
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderViewport";

  --*
  -- * Return whether an explicit rectangle was set as the viewport.
  -- *
  -- * This is useful if you're saving and restoring the viewport and want to know
  -- * whether you should restore a specific rectangle or NULL.
  -- *
  -- * Each render target has its own viewport. This function checks the viewport
  -- * for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns true if the viewport was set to a specific rectangle, or false if
  -- *          it was set to NULL (the entire target).
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderViewport
  -- * \sa SDL_SetRenderViewport
  --  

   function SDL_RenderViewportSet (renderer : access SDL_Renderer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1787
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderViewportSet";

  --*
  -- * Get the safe area for rendering within the current viewport.
  -- *
  -- * Some devices have portions of the screen which are partially obscured or
  -- * not interactive, possibly due to on-screen controls, curved edges, camera
  -- * notches, TV overscan, etc. This function provides the area of the current
  -- * viewport which is safe to have interactible content. You should continue
  -- * rendering into the rest of the render target, but it should not contain
  -- * visually important or interactible content.
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect a pointer filled in with the area that is safe for interactive
  -- *             content.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRenderSafeArea (renderer : access SDL_Renderer; rect : access SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1809
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderSafeArea";

  --*
  -- * Set the clip rectangle for rendering on the specified target.
  -- *
  -- * Each render target has its own clip rectangle. This function sets the
  -- * cliprect for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect an SDL_Rect structure representing the clip area, relative to
  -- *             the viewport, or NULL to disable clipping.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderClipRect
  -- * \sa SDL_RenderClipEnabled
  --  

   function SDL_SetRenderClipRect (renderer : access SDL_Renderer; rect : access constant SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1830
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderClipRect";

  --*
  -- * Get the clip rectangle for the current target.
  -- *
  -- * Each render target has its own clip rectangle. This function gets the
  -- * cliprect for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect an SDL_Rect structure filled in with the current clipping area
  -- *             or an empty rectangle if clipping is disabled.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderClipEnabled
  -- * \sa SDL_SetRenderClipRect
  --  

   function SDL_GetRenderClipRect (renderer : access SDL_Renderer; rect : access SDL3_SDL_rect_h.SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1851
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderClipRect";

  --*
  -- * Get whether clipping is enabled on the given render target.
  -- *
  -- * Each render target has its own clip rectangle. This function checks the
  -- * cliprect for the current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns true if clipping is enabled or false if not; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderClipRect
  -- * \sa SDL_SetRenderClipRect
  --  

   function SDL_RenderClipEnabled (renderer : access SDL_Renderer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1870
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderClipEnabled";

  --*
  -- * Set the drawing scale for rendering on the current target.
  -- *
  -- * The drawing coordinates are scaled by the x/y scaling factors before they
  -- * are used by the renderer. This allows resolution independent drawing with a
  -- * single coordinate system.
  -- *
  -- * If this results in scaling or subpixel drawing by the rendering backend, it
  -- * will be handled using the appropriate quality hints. For best results use
  -- * integer scaling factors.
  -- *
  -- * Each render target has its own scale. This function sets the scale for the
  -- * current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param scaleX the horizontal scaling factor.
  -- * \param scaleY the vertical scaling factor.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderScale
  --  

   function SDL_SetRenderScale
     (renderer : access SDL_Renderer;
      scaleX : float;
      scaleY : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1898
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderScale";

  --*
  -- * Get the drawing scale for the current target.
  -- *
  -- * Each render target has its own scale. This function gets the scale for the
  -- * current render target.
  -- *
  -- * \param renderer the rendering context.
  -- * \param scaleX a pointer filled in with the horizontal scaling factor.
  -- * \param scaleY a pointer filled in with the vertical scaling factor.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderScale
  --  

   function SDL_GetRenderScale
     (renderer : access SDL_Renderer;
      scaleX : access float;
      scaleY : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1918
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderScale";

  --*
  -- * Set the color used for drawing operations.
  -- *
  -- * Set the color for drawing or filling rectangles, lines, and points, and for
  -- * SDL_RenderClear().
  -- *
  -- * \param renderer the rendering context.
  -- * \param r the red value used to draw on the rendering target.
  -- * \param g the green value used to draw on the rendering target.
  -- * \param b the blue value used to draw on the rendering target.
  -- * \param a the alpha value used to draw on the rendering target; usually
  -- *          `SDL_ALPHA_OPAQUE` (255). Use SDL_SetRenderDrawBlendMode to
  -- *          specify how the alpha channel is used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderDrawColor
  -- * \sa SDL_SetRenderDrawColorFloat
  --  

   function SDL_SetRenderDrawColor
     (renderer : access SDL_Renderer;
      r : SDL3_SDL_stdinc_h.Uint8;
      g : SDL3_SDL_stdinc_h.Uint8;
      b : SDL3_SDL_stdinc_h.Uint8;
      a : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1943
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderDrawColor";

  --*
  -- * Set the color used for drawing operations (Rect, Line and Clear).
  -- *
  -- * Set the color for drawing or filling rectangles, lines, and points, and for
  -- * SDL_RenderClear().
  -- *
  -- * \param renderer the rendering context.
  -- * \param r the red value used to draw on the rendering target.
  -- * \param g the green value used to draw on the rendering target.
  -- * \param b the blue value used to draw on the rendering target.
  -- * \param a the alpha value used to draw on the rendering target. Use
  -- *          SDL_SetRenderDrawBlendMode to specify how the alpha channel is
  -- *          used.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderDrawColorFloat
  -- * \sa SDL_SetRenderDrawColor
  --  

   function SDL_SetRenderDrawColorFloat
     (renderer : access SDL_Renderer;
      r : float;
      g : float;
      b : float;
      a : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1968
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderDrawColorFloat";

  --*
  -- * Get the color used for drawing operations (Rect, Line and Clear).
  -- *
  -- * \param renderer the rendering context.
  -- * \param r a pointer filled in with the red value used to draw on the
  -- *          rendering target.
  -- * \param g a pointer filled in with the green value used to draw on the
  -- *          rendering target.
  -- * \param b a pointer filled in with the blue value used to draw on the
  -- *          rendering target.
  -- * \param a a pointer filled in with the alpha value used to draw on the
  -- *          rendering target; usually `SDL_ALPHA_OPAQUE` (255).
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderDrawColorFloat
  -- * \sa SDL_SetRenderDrawColor
  --  

   function SDL_GetRenderDrawColor
     (renderer : access SDL_Renderer;
      r : access SDL3_SDL_stdinc_h.Uint8;
      g : access SDL3_SDL_stdinc_h.Uint8;
      b : access SDL3_SDL_stdinc_h.Uint8;
      a : access SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:1992
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDrawColor";

  --*
  -- * Get the color used for drawing operations (Rect, Line and Clear).
  -- *
  -- * \param renderer the rendering context.
  -- * \param r a pointer filled in with the red value used to draw on the
  -- *          rendering target.
  -- * \param g a pointer filled in with the green value used to draw on the
  -- *          rendering target.
  -- * \param b a pointer filled in with the blue value used to draw on the
  -- *          rendering target.
  -- * \param a a pointer filled in with the alpha value used to draw on the
  -- *          rendering target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderDrawColorFloat
  -- * \sa SDL_GetRenderDrawColor
  --  

   function SDL_GetRenderDrawColorFloat
     (renderer : access SDL_Renderer;
      r : access float;
      g : access float;
      b : access float;
      a : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2016
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDrawColorFloat";

  --*
  -- * Set the color scale used for render operations.
  -- *
  -- * The color scale is an additional scale multiplied into the pixel color
  -- * value while rendering. This can be used to adjust the brightness of colors
  -- * during HDR rendering, or changing HDR video brightness when playing on an
  -- * SDR display.
  -- *
  -- * The color scale does not affect the alpha channel, only the color
  -- * brightness.
  -- *
  -- * \param renderer the rendering context.
  -- * \param scale the color scale value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderColorScale
  --  

   function SDL_SetRenderColorScale (renderer : access SDL_Renderer; scale : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2040
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderColorScale";

  --*
  -- * Get the color scale used for render operations.
  -- *
  -- * \param renderer the rendering context.
  -- * \param scale a pointer filled in with the current color scale value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderColorScale
  --  

   function SDL_GetRenderColorScale (renderer : access SDL_Renderer; scale : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2056
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderColorScale";

  --*
  -- * Set the blend mode used for drawing operations (Fill and Line).
  -- *
  -- * If the blend mode is not supported, the closest supported mode is chosen.
  -- *
  -- * \param renderer the rendering context.
  -- * \param blendMode the SDL_BlendMode to use for blending.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderDrawBlendMode
  --  

   function SDL_SetRenderDrawBlendMode (renderer : access SDL_Renderer; blendMode : SDL3_SDL_blendmode_h.SDL_BlendMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2074
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderDrawBlendMode";

  --*
  -- * Get the blend mode used for drawing operations.
  -- *
  -- * \param renderer the rendering context.
  -- * \param blendMode a pointer filled in with the current SDL_BlendMode.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderDrawBlendMode
  --  

   function SDL_GetRenderDrawBlendMode (renderer : access SDL_Renderer; blendMode : access SDL3_SDL_blendmode_h.SDL_BlendMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2090
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderDrawBlendMode";

  --*
  -- * Clear the current rendering target with the drawing color.
  -- *
  -- * This function clears the entire rendering target, ignoring the viewport and
  -- * the clip rectangle. Note, that clearing will also set/fill all pixels of
  -- * the rendering target to current renderer draw color, so make sure to invoke
  -- * SDL_SetRenderDrawColor() when needed.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderDrawColor
  --  

   function SDL_RenderClear (renderer : access SDL_Renderer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2110
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderClear";

  --*
  -- * Draw a point on the current rendering target at subpixel precision.
  -- *
  -- * \param renderer the renderer which should draw a point.
  -- * \param x the x coordinate of the point.
  -- * \param y the y coordinate of the point.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderPoints
  --  

   function SDL_RenderPoint
     (renderer : access SDL_Renderer;
      x : float;
      y : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2127
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderPoint";

  --*
  -- * Draw multiple points on the current rendering target at subpixel precision.
  -- *
  -- * \param renderer the renderer which should draw multiple points.
  -- * \param points the points to draw.
  -- * \param count the number of points to draw.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderPoint
  --  

   function SDL_RenderPoints
     (renderer : access SDL_Renderer;
      points : access constant SDL3_SDL_rect_h.SDL_FPoint;
      count : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2144
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderPoints";

  --*
  -- * Draw a line on the current rendering target at subpixel precision.
  -- *
  -- * \param renderer the renderer which should draw a line.
  -- * \param x1 the x coordinate of the start point.
  -- * \param y1 the y coordinate of the start point.
  -- * \param x2 the x coordinate of the end point.
  -- * \param y2 the y coordinate of the end point.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderLines
  --  

   function SDL_RenderLine
     (renderer : access SDL_Renderer;
      x1 : float;
      y1 : float;
      x2 : float;
      y2 : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2163
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderLine";

  --*
  -- * Draw a series of connected lines on the current rendering target at
  -- * subpixel precision.
  -- *
  -- * \param renderer the renderer which should draw multiple lines.
  -- * \param points the points along the lines.
  -- * \param count the number of points, drawing count-1 lines.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderLine
  --  

   function SDL_RenderLines
     (renderer : access SDL_Renderer;
      points : access constant SDL3_SDL_rect_h.SDL_FPoint;
      count : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2181
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderLines";

  --*
  -- * Draw a rectangle on the current rendering target at subpixel precision.
  -- *
  -- * \param renderer the renderer which should draw a rectangle.
  -- * \param rect a pointer to the destination rectangle, or NULL to outline the
  -- *             entire rendering target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderRects
  --  

   function SDL_RenderRect (renderer : access SDL_Renderer; rect : access constant SDL3_SDL_rect_h.SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2198
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderRect";

  --*
  -- * Draw some number of rectangles on the current rendering target at subpixel
  -- * precision.
  -- *
  -- * \param renderer the renderer which should draw multiple rectangles.
  -- * \param rects a pointer to an array of destination rectangles.
  -- * \param count the number of rectangles.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderRect
  --  

   function SDL_RenderRects
     (renderer : access SDL_Renderer;
      rects : access constant SDL3_SDL_rect_h.SDL_FRect;
      count : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2216
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderRects";

  --*
  -- * Fill a rectangle on the current rendering target with the drawing color at
  -- * subpixel precision.
  -- *
  -- * \param renderer the renderer which should fill a rectangle.
  -- * \param rect a pointer to the destination rectangle, or NULL for the entire
  -- *             rendering target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderFillRects
  --  

   function SDL_RenderFillRect (renderer : access SDL_Renderer; rect : access constant SDL3_SDL_rect_h.SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2234
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFillRect";

  --*
  -- * Fill some number of rectangles on the current rendering target with the
  -- * drawing color at subpixel precision.
  -- *
  -- * \param renderer the renderer which should fill multiple rectangles.
  -- * \param rects a pointer to an array of destination rectangles.
  -- * \param count the number of rectangles.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderFillRect
  --  

   function SDL_RenderFillRects
     (renderer : access SDL_Renderer;
      rects : access constant SDL3_SDL_rect_h.SDL_FRect;
      count : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2252
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderFillRects";

  --*
  -- * Copy a portion of the texture to the current rendering target at subpixel
  -- * precision.
  -- *
  -- * \param renderer the renderer which should copy parts of a texture.
  -- * \param texture the source texture.
  -- * \param srcrect a pointer to the source rectangle, or NULL for the entire
  -- *                texture.
  -- * \param dstrect a pointer to the destination rectangle, or NULL for the
  -- *                entire rendering target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderTextureRotated
  -- * \sa SDL_RenderTextureTiled
  --  

   function SDL_RenderTexture
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      dstrect : access constant SDL3_SDL_rect_h.SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2274
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTexture";

  --*
  -- * Copy a portion of the source texture to the current rendering target, with
  -- * rotation and flipping, at subpixel precision.
  -- *
  -- * \param renderer the renderer which should copy parts of a texture.
  -- * \param texture the source texture.
  -- * \param srcrect a pointer to the source rectangle, or NULL for the entire
  -- *                texture.
  -- * \param dstrect a pointer to the destination rectangle, or NULL for the
  -- *                entire rendering target.
  -- * \param angle an angle in degrees that indicates the rotation that will be
  -- *              applied to dstrect, rotating it in a clockwise direction.
  -- * \param center a pointer to a point indicating the point around which
  -- *               dstrect will be rotated (if NULL, rotation will be done
  -- *               around dstrect.w/2, dstrect.h/2).
  -- * \param flip an SDL_FlipMode value stating which flipping actions should be
  -- *             performed on the texture.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderTexture
  --  

   function SDL_RenderTextureRotated
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      dstrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      angle : double;
      center : access constant SDL3_SDL_rect_h.SDL_FPoint;
      flip : SDL3_SDL_surface_h.SDL_FlipMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2302
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTextureRotated";

  --*
  -- * Copy a portion of the source texture to the current rendering target, with
  -- * affine transform, at subpixel precision.
  -- *
  -- * \param renderer the renderer which should copy parts of a texture.
  -- * \param texture the source texture.
  -- * \param srcrect a pointer to the source rectangle, or NULL for the entire
  -- *                texture.
  -- * \param origin a pointer to a point indicating where the top-left corner of
  -- *               srcrect should be mapped to, or NULL for the rendering
  -- *               target's origin.
  -- * \param right a pointer to a point indicating where the top-right corner of
  -- *              srcrect should be mapped to, or NULL for the rendering
  -- *              target's top-right corner.
  -- * \param down a pointer to a point indicating where the bottom-left corner of
  -- *             srcrect should be mapped to, or NULL for the rendering target's
  -- *             bottom-left corner.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety You may only call this function from the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderTexture
  --  

   function SDL_RenderTextureAffine
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      origin : access constant SDL3_SDL_rect_h.SDL_FPoint;
      right : access constant SDL3_SDL_rect_h.SDL_FPoint;
      down : access constant SDL3_SDL_rect_h.SDL_FPoint) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2333
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTextureAffine";

  --*
  -- * Tile a portion of the texture to the current rendering target at subpixel
  -- * precision.
  -- *
  -- * The pixels in `srcrect` will be repeated as many times as needed to
  -- * completely fill `dstrect`.
  -- *
  -- * \param renderer the renderer which should copy parts of a texture.
  -- * \param texture the source texture.
  -- * \param srcrect a pointer to the source rectangle, or NULL for the entire
  -- *                texture.
  -- * \param scale the scale used to transform srcrect into the destination
  -- *              rectangle, e.g. a 32x32 texture with a scale of 2 would fill
  -- *              64x64 tiles.
  -- * \param dstrect a pointer to the destination rectangle, or NULL for the
  -- *                entire rendering target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderTexture
  --  

   function SDL_RenderTextureTiled
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      scale : float;
      dstrect : access constant SDL3_SDL_rect_h.SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2362
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTextureTiled";

  --*
  -- * Perform a scaled copy using the 9-grid algorithm to the current rendering
  -- * target at subpixel precision.
  -- *
  -- * The pixels in the texture are split into a 3x3 grid, using the different
  -- * corner sizes for each corner, and the sides and center making up the
  -- * remaining pixels. The corners are then scaled using `scale` and fit into
  -- * the corners of the destination rectangle. The sides and center are then
  -- * stretched into place to cover the remaining destination rectangle.
  -- *
  -- * \param renderer the renderer which should copy parts of a texture.
  -- * \param texture the source texture.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be used
  -- *                for the 9-grid, or NULL to use the entire texture.
  -- * \param left_width the width, in pixels, of the left corners in `srcrect`.
  -- * \param right_width the width, in pixels, of the right corners in `srcrect`.
  -- * \param top_height the height, in pixels, of the top corners in `srcrect`.
  -- * \param bottom_height the height, in pixels, of the bottom corners in
  -- *                      `srcrect`.
  -- * \param scale the scale used to transform the corner of `srcrect` into the
  -- *              corner of `dstrect`, or 0.0f for an unscaled copy.
  -- * \param dstrect a pointer to the destination rectangle, or NULL for the
  -- *                entire rendering target.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderTexture
  -- * \sa SDL_RenderTexture9GridTiled
  --  

   function SDL_RenderTexture9Grid
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      left_width : float;
      right_width : float;
      top_height : float;
      bottom_height : float;
      scale : float;
      dstrect : access constant SDL3_SDL_rect_h.SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2397
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTexture9Grid";

  --*
  -- * Perform a scaled copy using the 9-grid algorithm to the current rendering
  -- * target at subpixel precision.
  -- *
  -- * The pixels in the texture are split into a 3x3 grid, using the different
  -- * corner sizes for each corner, and the sides and center making up the
  -- * remaining pixels. The corners are then scaled using `scale` and fit into
  -- * the corners of the destination rectangle. The sides and center are then
  -- * tiled into place to cover the remaining destination rectangle.
  -- *
  -- * \param renderer the renderer which should copy parts of a texture.
  -- * \param texture the source texture.
  -- * \param srcrect the SDL_Rect structure representing the rectangle to be used
  -- *                for the 9-grid, or NULL to use the entire texture.
  -- * \param left_width the width, in pixels, of the left corners in `srcrect`.
  -- * \param right_width the width, in pixels, of the right corners in `srcrect`.
  -- * \param top_height the height, in pixels, of the top corners in `srcrect`.
  -- * \param bottom_height the height, in pixels, of the bottom corners in
  -- *                      `srcrect`.
  -- * \param scale the scale used to transform the corner of `srcrect` into the
  -- *              corner of `dstrect`, or 0.0f for an unscaled copy.
  -- * \param dstrect a pointer to the destination rectangle, or NULL for the
  -- *                entire rendering target.
  -- * \param tileScale the scale used to transform the borders and center of
  -- *                  `srcrect` into the borders and middle of `dstrect`, or
  -- *                  1.0f for an unscaled copy.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_RenderTexture
  -- * \sa SDL_RenderTexture9Grid
  --  

   function SDL_RenderTexture9GridTiled
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      srcrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      left_width : float;
      right_width : float;
      top_height : float;
      bottom_height : float;
      scale : float;
      dstrect : access constant SDL3_SDL_rect_h.SDL_FRect;
      tileScale : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2435
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderTexture9GridTiled";

  --*
  -- * Render a list of triangles, optionally using a texture and indices into the
  -- * vertex array Color and alpha modulation is done per vertex
  -- * (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  -- *
  -- * \param renderer the rendering context.
  -- * \param texture (optional) The SDL texture to use.
  -- * \param vertices vertices.
  -- * \param num_vertices number of vertices.
  -- * \param indices (optional) An array of integer indices into the 'vertices'
  -- *                array, if NULL all vertices will be rendered in sequential
  -- *                order.
  -- * \param num_indices number of indices.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderGeometryRaw
  -- * \sa SDL_SetRenderTextureAddressMode
  --  

   function SDL_RenderGeometry
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      vertices : access constant SDL_Vertex;
      num_vertices : int;
      indices : access int;
      num_indices : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2460
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGeometry";

  --*
  -- * Render a list of triangles, optionally using a texture and indices into the
  -- * vertex arrays Color and alpha modulation is done per vertex
  -- * (SDL_SetTextureColorMod and SDL_SetTextureAlphaMod are ignored).
  -- *
  -- * \param renderer the rendering context.
  -- * \param texture (optional) The SDL texture to use.
  -- * \param xy vertex positions.
  -- * \param xy_stride byte size to move from one element to the next element.
  -- * \param color vertex colors (as SDL_FColor).
  -- * \param color_stride byte size to move from one element to the next element.
  -- * \param uv vertex normalized texture coordinates.
  -- * \param uv_stride byte size to move from one element to the next element.
  -- * \param num_vertices number of vertices.
  -- * \param indices (optional) An array of indices into the 'vertices' arrays,
  -- *                if NULL all vertices will be rendered in sequential order.
  -- * \param num_indices number of indices.
  -- * \param size_indices index size: 1 (byte), 2 (short), 4 (int).
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderGeometry
  -- * \sa SDL_SetRenderTextureAddressMode
  --  

   function SDL_RenderGeometryRaw
     (renderer : access SDL_Renderer;
      texture : access SDL_Texture;
      xy : access float;
      xy_stride : int;
      color : access constant SDL3_SDL_pixels_h.SDL_FColor;
      color_stride : int;
      uv : access float;
      uv_stride : int;
      num_vertices : int;
      indices : System.Address;
      num_indices : int;
      size_indices : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2493
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderGeometryRaw";

  --*
  -- * Set the texture addressing mode used in SDL_RenderGeometry().
  -- *
  -- * \param renderer the rendering context.
  -- * \param u_mode the SDL_TextureAddressMode to use for horizontal texture
  -- *               coordinates in SDL_RenderGeometry().
  -- * \param v_mode the SDL_TextureAddressMode to use for vertical texture
  -- *               coordinates in SDL_RenderGeometry().
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_RenderGeometry
  -- * \sa SDL_RenderGeometryRaw
  -- * \sa SDL_GetRenderTextureAddressMode
  --  

   function SDL_SetRenderTextureAddressMode
     (renderer : access SDL_Renderer;
      u_mode : SDL_TextureAddressMode;
      v_mode : SDL_TextureAddressMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2518
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderTextureAddressMode";

  --*
  -- * Get the texture addressing mode used in SDL_RenderGeometry().
  -- *
  -- * \param renderer the rendering context.
  -- * \param u_mode a pointer filled in with the SDL_TextureAddressMode to use
  -- *               for horizontal texture coordinates in SDL_RenderGeometry(),
  -- *               may be NULL.
  -- * \param v_mode a pointer filled in with the SDL_TextureAddressMode to use
  -- *               for vertical texture coordinates in SDL_RenderGeometry(), may
  -- *               be NULL.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_SetRenderTextureAddressMode
  --  

   function SDL_GetRenderTextureAddressMode
     (renderer : access SDL_Renderer;
      u_mode : access SDL_TextureAddressMode;
      v_mode : access SDL_TextureAddressMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2537
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderTextureAddressMode";

  --*
  -- * Read pixels from the current rendering target.
  -- *
  -- * The returned surface contains pixels inside the desired area clipped to the
  -- * current viewport, and should be freed with SDL_DestroySurface().
  -- *
  -- * Note that this returns the actual pixels on the screen, so if you are using
  -- * logical presentation you should use SDL_GetRenderLogicalPresentationRect()
  -- * to get the area containing your content.
  -- *
  -- * **WARNING**: This is a very slow operation, and should not be used
  -- * frequently. If you're using this on the main rendering target, it should be
  -- * called after rendering and before SDL_RenderPresent().
  -- *
  -- * \param renderer the rendering context.
  -- * \param rect an SDL_Rect structure representing the area to read, which will
  -- *             be clipped to the current viewport, or NULL for the entire
  -- *             viewport.
  -- * \returns a new SDL_Surface on success or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_RenderReadPixels (renderer : access SDL_Renderer; rect : access constant SDL3_SDL_rect_h.SDL_Rect) return access SDL3_SDL_surface_h.SDL_Surface  -- /usr/local/include/SDL3/SDL_render.h:2564
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderReadPixels";

  --*
  -- * Update the screen with any rendering performed since the previous call.
  -- *
  -- * SDL's rendering functions operate on a backbuffer; that is, calling a
  -- * rendering function such as SDL_RenderLine() does not directly put a line on
  -- * the screen, but rather updates the backbuffer. As such, you compose your
  -- * entire scene and *present* the composed backbuffer to the screen as a
  -- * complete picture.
  -- *
  -- * Therefore, when using SDL's rendering API, one does all drawing intended
  -- * for the frame, and then calls this function once per frame to present the
  -- * final drawing to the user.
  -- *
  -- * The backbuffer should be considered invalidated after each present; do not
  -- * assume that previous contents will exist between frames. You are strongly
  -- * encouraged to call SDL_RenderClear() to initialize the backbuffer before
  -- * starting each new frame's drawing, even if you plan to overwrite every
  -- * pixel.
  -- *
  -- * Please note, that in case of rendering to a texture - there is **no need**
  -- * to call `SDL_RenderPresent` after drawing needed objects to a texture, and
  -- * should not be done; you are only required to change back the rendering
  -- * target to default via `SDL_SetRenderTarget(renderer, NULL)` afterwards, as
  -- * textures by themselves do not have a concept of backbuffers. Calling
  -- * SDL_RenderPresent while rendering to a texture will fail.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRenderer
  -- * \sa SDL_RenderClear
  -- * \sa SDL_RenderFillRect
  -- * \sa SDL_RenderFillRects
  -- * \sa SDL_RenderLine
  -- * \sa SDL_RenderLines
  -- * \sa SDL_RenderPoint
  -- * \sa SDL_RenderPoints
  -- * \sa SDL_RenderRect
  -- * \sa SDL_RenderRects
  -- * \sa SDL_SetRenderDrawBlendMode
  -- * \sa SDL_SetRenderDrawColor
  --  

   function SDL_RenderPresent (renderer : access SDL_Renderer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2613
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderPresent";

  --*
  -- * Destroy the specified texture.
  -- *
  -- * Passing NULL or an otherwise invalid texture will set the SDL error message
  -- * to "Invalid texture".
  -- *
  -- * \param texture the texture to destroy.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTexture
  -- * \sa SDL_CreateTextureFromSurface
  --  

   procedure SDL_DestroyTexture (texture : access SDL_Texture)  -- /usr/local/include/SDL3/SDL_render.h:2630
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyTexture";

  --*
  -- * Destroy the rendering context for a window and free all associated
  -- * textures.
  -- *
  -- * This should be called before destroying the associated window.
  -- *
  -- * \param renderer the rendering context.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateRenderer
  --  

   procedure SDL_DestroyRenderer (renderer : access SDL_Renderer)  -- /usr/local/include/SDL3/SDL_render.h:2646
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyRenderer";

  --*
  -- * Force the rendering context to flush any pending commands and state.
  -- *
  -- * You do not need to (and in fact, shouldn't) call this function unless you
  -- * are planning to call into OpenGL/Direct3D/Metal/whatever directly, in
  -- * addition to using an SDL_Renderer.
  -- *
  -- * This is for a very-specific case: if you are using SDL's render API, and
  -- * you plan to make OpenGL/D3D/whatever calls in addition to SDL render API
  -- * calls. If this applies, you should call this function between calls to
  -- * SDL's render API and the low-level API you're using in cooperation.
  -- *
  -- * In all other cases, you can ignore this function.
  -- *
  -- * This call makes SDL flush any pending rendering work it was queueing up to
  -- * do later in a single batch, and marks any internal cached state as invalid,
  -- * so it'll prepare all its state again later, from scratch.
  -- *
  -- * This means you do not need to save state in your rendering code to protect
  -- * the SDL renderer. However, there lots of arbitrary pieces of Direct3D and
  -- * OpenGL state that can confuse things; you should use your best judgment and
  -- * be prepared to make changes if specific state needs to be protected.
  -- *
  -- * \param renderer the rendering context.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_FlushRenderer (renderer : access SDL_Renderer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2679
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FlushRenderer";

  --*
  -- * Get the CAMetalLayer associated with the given Metal renderer.
  -- *
  -- * This function returns `void *`, so SDL doesn't have to include Metal's
  -- * headers, but it can be safely cast to a `CAMetalLayer *`.
  -- *
  -- * \param renderer the renderer to query.
  -- * \returns a `CAMetalLayer *` on success, or NULL if the renderer isn't a
  -- *          Metal renderer.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderMetalCommandEncoder
  --  

   function SDL_GetRenderMetalLayer (renderer : access SDL_Renderer) return System.Address  -- /usr/local/include/SDL3/SDL_render.h:2697
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderMetalLayer";

  --*
  -- * Get the Metal command encoder for the current frame.
  -- *
  -- * This function returns `void *`, so SDL doesn't have to include Metal's
  -- * headers, but it can be safely cast to an `id<MTLRenderCommandEncoder>`.
  -- *
  -- * This will return NULL if Metal refuses to give SDL a drawable to render to,
  -- * which might happen if the window is hidden/minimized/offscreen. This
  -- * doesn't apply to command encoders for render targets, just the window's
  -- * backbuffer. Check your return values!
  -- *
  -- * \param renderer the renderer to query.
  -- * \returns an `id<MTLRenderCommandEncoder>` on success, or NULL if the
  -- *          renderer isn't a Metal renderer or there was an error.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderMetalLayer
  --  

   function SDL_GetRenderMetalCommandEncoder (renderer : access SDL_Renderer) return System.Address  -- /usr/local/include/SDL3/SDL_render.h:2720
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderMetalCommandEncoder";

  --*
  -- * Add a set of synchronization semaphores for the current frame.
  -- *
  -- * The Vulkan renderer will wait for `wait_semaphore` before submitting
  -- * rendering commands and signal `signal_semaphore` after rendering commands
  -- * are complete for this frame.
  -- *
  -- * This should be called each frame that you want semaphore synchronization.
  -- * The Vulkan renderer may have multiple frames in flight on the GPU, so you
  -- * should have multiple semaphores that are used for synchronization. Querying
  -- * SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER will give you the
  -- * maximum number of semaphores you'll need.
  -- *
  -- * \param renderer the rendering context.
  -- * \param wait_stage_mask the VkPipelineStageFlags for the wait.
  -- * \param wait_semaphore a VkSempahore to wait on before rendering the current
  -- *                       frame, or 0 if not needed.
  -- * \param signal_semaphore a VkSempahore that SDL will signal when rendering
  -- *                         for the current frame is complete, or 0 if not
  -- *                         needed.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is **NOT** safe to call this function from two threads at
  -- *               once.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_AddVulkanRenderSemaphores
     (renderer : access SDL_Renderer;
      wait_stage_mask : SDL3_SDL_stdinc_h.Uint32;
      wait_semaphore : SDL3_SDL_stdinc_h.Sint64;
      signal_semaphore : SDL3_SDL_stdinc_h.Sint64) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2751
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddVulkanRenderSemaphores";

  --*
  -- * Toggle VSync of the given renderer.
  -- *
  -- * When a renderer is created, vsync defaults to SDL_RENDERER_VSYNC_DISABLED.
  -- *
  -- * The `vsync` parameter can be 1 to synchronize present with every vertical
  -- * refresh, 2 to synchronize present with every second vertical refresh, etc.,
  -- * SDL_RENDERER_VSYNC_ADAPTIVE for late swap tearing (adaptive vsync), or
  -- * SDL_RENDERER_VSYNC_DISABLED to disable. Not every value is supported by
  -- * every driver, so you should check the return value to see whether the
  -- * requested setting is supported.
  -- *
  -- * \param renderer the renderer to toggle.
  -- * \param vsync the vertical refresh sync interval.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRenderVSync
  --  

   function SDL_SetRenderVSync (renderer : access SDL_Renderer; vsync : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2776
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetRenderVSync";

  --*
  -- * Get VSync of the given renderer.
  -- *
  -- * \param renderer the renderer to toggle.
  -- * \param vsync an int filled with the current vertical refresh sync interval.
  -- *              See SDL_SetRenderVSync() for the meaning of the value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetRenderVSync
  --  

   function SDL_GetRenderVSync (renderer : access SDL_Renderer; vsync : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2796
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRenderVSync";

  --*
  -- * The size, in pixels, of a single SDL_RenderDebugText() character.
  -- *
  -- * The font is monospaced and square, so this applies to all characters.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderDebugText
  --  

  --*
  -- * Draw debug text to an SDL_Renderer.
  -- *
  -- * This function will render a string of text to an SDL_Renderer. Note that
  -- * this is a convenience function for debugging, with severe limitations, and
  -- * not intended to be used for production apps and games.
  -- *
  -- * Among these limitations:
  -- *
  -- * - It accepts UTF-8 strings, but will only renders ASCII characters.
  -- * - It has a single, tiny size (8x8 pixels). You can use logical presentation
  -- *   or SDL_SetRenderScale() to adjust it.
  -- * - It uses a simple, hardcoded bitmap font. It does not allow different font
  -- *   selections and it does not support truetype, for proper scaling.
  -- * - It does no word-wrapping and does not treat newline characters as a line
  -- *   break. If the text goes out of the window, it's gone.
  -- *
  -- * For serious text rendering, there are several good options, such as
  -- * SDL_ttf, stb_truetype, or other external libraries.
  -- *
  -- * On first use, this will create an internal texture for rendering glyphs.
  -- * This texture will live until the renderer is destroyed.
  -- *
  -- * The text is drawn in the color specified by SDL_SetRenderDrawColor().
  -- *
  -- * \param renderer the renderer which should draw a line of text.
  -- * \param x the x coordinate where the top-left corner of the text will draw.
  -- * \param y the y coordinate where the top-left corner of the text will draw.
  -- * \param str the string to render.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderDebugTextFormat
  -- * \sa SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE
  --  

   function SDL_RenderDebugText
     (renderer : access SDL_Renderer;
      x : float;
      y : float;
      str : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2848
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDebugText";

  --*
  -- * Draw debug text to an SDL_Renderer.
  -- *
  -- * This function will render a printf()-style format string to a renderer.
  -- * Note that this is a convenience function for debugging, with severe
  -- * limitations, and is not intended to be used for production apps and games.
  -- *
  -- * For the full list of limitations and other useful information, see
  -- * SDL_RenderDebugText.
  -- *
  -- * \param renderer the renderer which should draw the text.
  -- * \param x the x coordinate where the top-left corner of the text will draw.
  -- * \param y the y coordinate where the top-left corner of the text will draw.
  -- * \param fmt the format string to draw.
  -- * \param ... additional parameters matching % tokens in the `fmt` string, if
  -- *            any.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RenderDebugText
  -- * \sa SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE
  --  

   function SDL_RenderDebugTextFormat
     (renderer : access SDL_Renderer;
      x : float;
      y : float;
      fmt : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2876
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RenderDebugTextFormat";

  --*
  -- * Set default scale mode for new textures for given renderer.
  -- *
  -- * When a renderer is created, scale_mode defaults to SDL_SCALEMODE_LINEAR.
  -- *
  -- * \param renderer the renderer to update.
  -- * \param scale_mode the scale mode to change to for new textures.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_GetDefaultTextureScaleMode
  --  

   function SDL_SetDefaultTextureScaleMode (renderer : access SDL_Renderer; scale_mode : SDL3_SDL_surface_h.SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2894
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetDefaultTextureScaleMode";

  --*
  -- * Get default texture scale mode of the given renderer.
  -- *
  -- * \param renderer the renderer to get data from.
  -- * \param scale_mode a SDL_ScaleMode filled with current default scale mode.
  -- *                   See SDL_SetDefaultTextureScaleMode() for the meaning of
  -- *                   the value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_SetDefaultTextureScaleMode
  --  

   function SDL_GetDefaultTextureScaleMode (renderer : access SDL_Renderer; scale_mode : access SDL3_SDL_surface_h.SDL_ScaleMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2912
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetDefaultTextureScaleMode";

  --*
  -- * A structure specifying the parameters of a GPU render state.
  -- *
  -- * \since This struct is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_CreateGPURenderState
  --  

  --*< The fragment shader to use when this render state is active  
   type SDL_GPURenderStateCreateInfo is record
      fragment_shader : access SDL3_SDL_gpu_h.SDL_GPUShader;  -- /usr/local/include/SDL3/SDL_render.h:2923
      num_sampler_bindings : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_render.h:2925
      sampler_bindings : access constant SDL3_SDL_gpu_h.SDL_GPUTextureSamplerBinding;  -- /usr/local/include/SDL3/SDL_render.h:2926
      num_storage_textures : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_render.h:2928
      storage_textures : System.Address;  -- /usr/local/include/SDL3/SDL_render.h:2929
      num_storage_buffers : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_render.h:2931
      storage_buffers : System.Address;  -- /usr/local/include/SDL3/SDL_render.h:2932
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_render.h:2934
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_render.h:2921

  --*< The number of additional fragment samplers to bind when this render state is active  
  --*< Additional fragment samplers to bind when this render state is active  
  --*< The number of storage textures to bind when this render state is active  
  --*< Storage textures to bind when this render state is active  
  --*< The number of storage buffers to bind when this render state is active  
  --*< Storage buffers to bind when this render state is active  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A custom GPU render state.
  -- *
  -- * \since This struct is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_CreateGPURenderState
  -- * \sa SDL_SetGPURenderStateFragmentUniforms
  -- * \sa SDL_SetGPURenderState
  -- * \sa SDL_DestroyGPURenderState
  --  

   type SDL_GPURenderState is null record;   -- incomplete struct

  --*
  -- * Create custom GPU render state.
  -- *
  -- * \param renderer the renderer to use.
  -- * \param createinfo a struct describing the GPU render state to create.
  -- * \returns a custom GPU render state or NULL on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               renderer.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_SetGPURenderStateFragmentUniforms
  -- * \sa SDL_SetGPURenderState
  -- * \sa SDL_DestroyGPURenderState
  --  

   function SDL_CreateGPURenderState (renderer : access SDL_Renderer; createinfo : access constant SDL_GPURenderStateCreateInfo) return access SDL_GPURenderState  -- /usr/local/include/SDL3/SDL_render.h:2966
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPURenderState";

  --*
  -- * Set fragment shader uniform variables in a custom GPU render state.
  -- *
  -- * The data is copied and will be pushed using
  -- * SDL_PushGPUFragmentUniformData() during draw call execution.
  -- *
  -- * \param state the state to modify.
  -- * \param slot_index the fragment uniform slot to push data to.
  -- * \param data client data to write.
  -- * \param length the length of the data to write.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               renderer.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_SetGPURenderStateFragmentUniforms
     (state : access SDL_GPURenderState;
      slot_index : SDL3_SDL_stdinc_h.Uint32;
      data : System.Address;
      length : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:2986
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPURenderStateFragmentUniforms";

  --*
  -- * Set custom GPU render state.
  -- *
  -- * This function sets custom GPU render state for subsequent draw calls. This
  -- * allows using custom shaders with the GPU renderer.
  -- *
  -- * \param renderer the renderer to use.
  -- * \param state the state to to use, or NULL to clear custom GPU render state.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               renderer.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_SetGPURenderState (renderer : access SDL_Renderer; state : access SDL_GPURenderState) return Extensions.bool  -- /usr/local/include/SDL3/SDL_render.h:3004
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPURenderState";

  --*
  -- * Destroy custom GPU render state.
  -- *
  -- * \param state the state to destroy.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               renderer.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  -- *
  -- * \sa SDL_CreateGPURenderState
  --  

   procedure SDL_DestroyGPURenderState (state : access SDL_GPURenderState)  -- /usr/local/include/SDL3/SDL_render.h:3018
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyGPURenderState";

  -- Ends C function definitions when using C++  
end SDL3_SDL_render_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
