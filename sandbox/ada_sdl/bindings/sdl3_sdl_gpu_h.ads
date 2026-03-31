pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Extensions;
with SDL3_SDL_properties_h;
with stddef_h;
with Interfaces.C.Strings;
with SDL3_SDL_pixels_h;
with SDL3_SDL_surface_h;
with System;
limited with SDL3_SDL_rect_h;
limited with SDL3_SDL_video_h;

package SDL3_SDL_gpu_h is

   SDL_GPU_TEXTUREUSAGE_SAMPLER : constant := (2 ** 0);  --  /usr/local/include/SDL3/SDL_gpu.h:906
   SDL_GPU_TEXTUREUSAGE_COLOR_TARGET : constant := (2 ** 1);  --  /usr/local/include/SDL3/SDL_gpu.h:907
   SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET : constant := (2 ** 2);  --  /usr/local/include/SDL3/SDL_gpu.h:908
   SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ : constant := (2 ** 3);  --  /usr/local/include/SDL3/SDL_gpu.h:909
   SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ : constant := (2 ** 4);  --  /usr/local/include/SDL3/SDL_gpu.h:910
   SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE : constant := (2 ** 5);  --  /usr/local/include/SDL3/SDL_gpu.h:911
   SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE : constant := (2 ** 6);  --  /usr/local/include/SDL3/SDL_gpu.h:912

   SDL_GPU_BUFFERUSAGE_VERTEX : constant := (2 ** 0);  --  /usr/local/include/SDL3/SDL_gpu.h:986
   SDL_GPU_BUFFERUSAGE_INDEX : constant := (2 ** 1);  --  /usr/local/include/SDL3/SDL_gpu.h:987
   SDL_GPU_BUFFERUSAGE_INDIRECT : constant := (2 ** 2);  --  /usr/local/include/SDL3/SDL_gpu.h:988
   SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ : constant := (2 ** 3);  --  /usr/local/include/SDL3/SDL_gpu.h:989
   SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ : constant := (2 ** 4);  --  /usr/local/include/SDL3/SDL_gpu.h:990
   SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE : constant := (2 ** 5);  --  /usr/local/include/SDL3/SDL_gpu.h:991

   SDL_GPU_SHADERFORMAT_INVALID : constant := 0;  --  /usr/local/include/SDL3/SDL_gpu.h:1033
   SDL_GPU_SHADERFORMAT_PRIVATE : constant := (2 ** 0);  --  /usr/local/include/SDL3/SDL_gpu.h:1034
   SDL_GPU_SHADERFORMAT_SPIRV : constant := (2 ** 1);  --  /usr/local/include/SDL3/SDL_gpu.h:1035
   SDL_GPU_SHADERFORMAT_DXBC : constant := (2 ** 2);  --  /usr/local/include/SDL3/SDL_gpu.h:1036
   SDL_GPU_SHADERFORMAT_DXIL : constant := (2 ** 3);  --  /usr/local/include/SDL3/SDL_gpu.h:1037
   SDL_GPU_SHADERFORMAT_MSL : constant := (2 ** 4);  --  /usr/local/include/SDL3/SDL_gpu.h:1038
   SDL_GPU_SHADERFORMAT_METALLIB : constant := (2 ** 5);  --  /usr/local/include/SDL3/SDL_gpu.h:1039

   SDL_GPU_COLORCOMPONENT_R : constant := (2 ** 0);  --  /usr/local/include/SDL3/SDL_gpu.h:1261
   SDL_GPU_COLORCOMPONENT_G : constant := (2 ** 1);  --  /usr/local/include/SDL3/SDL_gpu.h:1262
   SDL_GPU_COLORCOMPONENT_B : constant := (2 ** 2);  --  /usr/local/include/SDL3/SDL_gpu.h:1263
   SDL_GPU_COLORCOMPONENT_A : constant := (2 ** 3);  --  /usr/local/include/SDL3/SDL_gpu.h:1264

   SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN : aliased constant String := "SDL.gpu.device.create.debugmode" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2338
   SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN : aliased constant String := "SDL.gpu.device.create.preferlowpower" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2339
   SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN : aliased constant String := "SDL.gpu.device.create.verbose" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2340
   SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.device.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2341
   SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN : aliased constant String := "SDL.gpu.device.create.feature.clip_distance" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2342
   SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN : aliased constant String := "SDL.gpu.device.create.feature.depth_clamping" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2343
   SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN : aliased constant String := "SDL.gpu.device.create.feature.indirect_draw_first_instance" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2344
   SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN : aliased constant String := "SDL.gpu.device.create.feature.anisotropy" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2345
   SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN : aliased constant String := "SDL.gpu.device.create.shaders.private" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2346
   SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN : aliased constant String := "SDL.gpu.device.create.shaders.spirv" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2347
   SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN : aliased constant String := "SDL.gpu.device.create.shaders.dxbc" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2348
   SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN : aliased constant String := "SDL.gpu.device.create.shaders.dxil" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2349
   SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN : aliased constant String := "SDL.gpu.device.create.shaders.msl" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2350
   SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN : aliased constant String := "SDL.gpu.device.create.shaders.metallib" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2351
   SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN : aliased constant String := "SDL.gpu.device.create.d3d12.allowtier1resourcebinding" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2352
   SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING : aliased constant String := "SDL.gpu.device.create.d3d12.semantic" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2353
   SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN : aliased constant String := "SDL.gpu.device.create.vulkan.requirehardwareacceleration" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2354
   SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER : aliased constant String := "SDL.gpu.device.create.vulkan.options" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2355

   SDL_PROP_GPU_DEVICE_NAME_STRING : aliased constant String := "SDL.gpu.device.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2551
   SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING : aliased constant String := "SDL.gpu.device.driver_name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2552
   SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING : aliased constant String := "SDL.gpu.device.driver_version" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2553
   SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING : aliased constant String := "SDL.gpu.device.driver_info" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2554

   SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.computepipeline.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2608

   SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.graphicspipeline.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2635

   SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.sampler.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2662

   SDL_PROP_GPU_SHADER_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.shader.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2741

   SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT : aliased constant String := "SDL.gpu.texture.create.d3d12.clear.r" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2805
   SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT : aliased constant String := "SDL.gpu.texture.create.d3d12.clear.g" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2806
   SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT : aliased constant String := "SDL.gpu.texture.create.d3d12.clear.b" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2807
   SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT : aliased constant String := "SDL.gpu.texture.create.d3d12.clear.a" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2808
   SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT : aliased constant String := "SDL.gpu.texture.create.d3d12.clear.depth" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2809
   SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER : aliased constant String := "SDL.gpu.texture.create.d3d12.clear.stencil" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2810
   SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.texture.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2811

   SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.buffer.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2861

   SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING : aliased constant String := "SDL.gpu.transferbuffer.create.name" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_gpu.h:2894

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

  -- WIKI CATEGORY: GPU  
  --*
  -- * # CategoryGPU
  -- *
  -- * The GPU API offers a cross-platform way for apps to talk to modern graphics
  -- * hardware. It offers both 3D graphics and compute support, in the style of
  -- * Metal, Vulkan, and Direct3D 12.
  -- *
  -- * A basic workflow might be something like this:
  -- *
  -- * The app creates a GPU device with SDL_CreateGPUDevice(), and assigns it to
  -- * a window with SDL_ClaimWindowForGPUDevice()--although strictly speaking you
  -- * can render offscreen entirely, perhaps for image processing, and not use a
  -- * window at all.
  -- *
  -- * Next, the app prepares static data (things that are created once and used
  -- * over and over). For example:
  -- *
  -- * - Shaders (programs that run on the GPU): use SDL_CreateGPUShader().
  -- * - Vertex buffers (arrays of geometry data) and other rendering data: use
  -- *   SDL_CreateGPUBuffer() and SDL_UploadToGPUBuffer().
  -- * - Textures (images): use SDL_CreateGPUTexture() and
  -- *   SDL_UploadToGPUTexture().
  -- * - Samplers (how textures should be read from): use SDL_CreateGPUSampler().
  -- * - Render pipelines (precalculated rendering state): use
  -- *   SDL_CreateGPUGraphicsPipeline()
  -- *
  -- * To render, the app creates one or more command buffers, with
  -- * SDL_AcquireGPUCommandBuffer(). Command buffers collect rendering
  -- * instructions that will be submitted to the GPU in batch. Complex scenes can
  -- * use multiple command buffers, maybe configured across multiple threads in
  -- * parallel, as long as they are submitted in the correct order, but many apps
  -- * will just need one command buffer per frame.
  -- *
  -- * Rendering can happen to a texture (what other APIs call a "render target")
  -- * or it can happen to the swapchain texture (which is just a special texture
  -- * that represents a window's contents). The app can use
  -- * SDL_WaitAndAcquireGPUSwapchainTexture() to render to the window.
  -- *
  -- * Rendering actually happens in a Render Pass, which is encoded into a
  -- * command buffer. One can encode multiple render passes (or alternate between
  -- * render and compute passes) in a single command buffer, but many apps might
  -- * simply need a single render pass in a single command buffer. Render Passes
  -- * can render to up to four color textures and one depth texture
  -- * simultaneously. If the set of textures being rendered to needs to change,
  -- * the Render Pass must be ended and a new one must be begun.
  -- *
  -- * The app calls SDL_BeginGPURenderPass(). Then it sets states it needs for
  -- * each draw:
  -- *
  -- * - SDL_BindGPUGraphicsPipeline()
  -- * - SDL_SetGPUViewport()
  -- * - SDL_BindGPUVertexBuffers()
  -- * - SDL_BindGPUVertexSamplers()
  -- * - etc
  -- *
  -- * Then, make the actual draw commands with these states:
  -- *
  -- * - SDL_DrawGPUPrimitives()
  -- * - SDL_DrawGPUPrimitivesIndirect()
  -- * - SDL_DrawGPUIndexedPrimitivesIndirect()
  -- * - etc
  -- *
  -- * After all the drawing commands for a pass are complete, the app should call
  -- * SDL_EndGPURenderPass(). Once a render pass ends all render-related state is
  -- * reset.
  -- *
  -- * The app can begin new Render Passes and make new draws in the same command
  -- * buffer until the entire scene is rendered.
  -- *
  -- * Once all of the render commands for the scene are complete, the app calls
  -- * SDL_SubmitGPUCommandBuffer() to send it to the GPU for processing.
  -- *
  -- * If the app needs to read back data from texture or buffers, the API has an
  -- * efficient way of doing this, provided that the app is willing to tolerate
  -- * some latency. When the app uses SDL_DownloadFromGPUTexture() or
  -- * SDL_DownloadFromGPUBuffer(), submitting the command buffer with
  -- * SDL_SubmitGPUCommandBufferAndAcquireFence() will return a fence handle that
  -- * the app can poll or wait on in a thread. Once the fence indicates that the
  -- * command buffer is done processing, it is safe to read the downloaded data.
  -- * Make sure to call SDL_ReleaseGPUFence() when done with the fence.
  -- *
  -- * The API also has "compute" support. The app calls SDL_BeginGPUComputePass()
  -- * with compute-writeable textures and/or buffers, which can be written to in
  -- * a compute shader. Then it sets states it needs for the compute dispatches:
  -- *
  -- * - SDL_BindGPUComputePipeline()
  -- * - SDL_BindGPUComputeStorageBuffers()
  -- * - SDL_BindGPUComputeStorageTextures()
  -- *
  -- * Then, dispatch compute work:
  -- *
  -- * - SDL_DispatchGPUCompute()
  -- *
  -- * For advanced users, this opens up powerful GPU-driven workflows.
  -- *
  -- * Graphics and compute pipelines require the use of shaders, which as
  -- * mentioned above are small programs executed on the GPU. Each backend
  -- * (Vulkan, Metal, D3D12) requires a different shader format. When the app
  -- * creates the GPU device, the app lets the device know which shader formats
  -- * the app can provide. It will then select the appropriate backend depending
  -- * on the available shader formats and the backends available on the platform.
  -- * When creating shaders, the app must provide the correct shader format for
  -- * the selected backend. If you would like to learn more about why the API
  -- * works this way, there is a detailed
  -- * [blog post](https://moonside.games/posts/layers-all-the-way-down/)
  -- * explaining this situation.
  -- *
  -- * It is optimal for apps to pre-compile the shader formats they might use,
  -- * but for ease of use SDL provides a separate project,
  -- * [SDL_shadercross](https://github.com/libsdl-org/SDL_shadercross)
  -- * , for performing runtime shader cross-compilation. It also has a CLI
  -- * interface for offline precompilation as well.
  -- *
  -- * This is an extremely quick overview that leaves out several important
  -- * details. Already, though, one can see that GPU programming can be quite
  -- * complex! If you just need simple 2D graphics, the
  -- * [Render API](https://wiki.libsdl.org/SDL3/CategoryRender)
  -- * is much easier to use but still hardware-accelerated. That said, even for
  -- * 2D applications the performance benefits and expressiveness of the GPU API
  -- * are significant.
  -- *
  -- * The GPU API targets a feature set with a wide range of hardware support and
  -- * ease of portability. It is designed so that the app won't have to branch
  -- * itself by querying feature support. If you need cutting-edge features with
  -- * limited hardware support, this API is probably not for you.
  -- *
  -- * Examples demonstrating proper usage of this API can be found
  -- * [here](https://github.com/TheSpydog/SDL_gpu_examples)
  -- * .
  -- *
  -- * ## Performance considerations
  -- *
  -- * Here are some basic tips for maximizing your rendering performance.
  -- *
  -- * - Beginning a new render pass is relatively expensive. Use as few render
  -- *   passes as you can.
  -- * - Minimize the amount of state changes. For example, binding a pipeline is
  -- *   relatively cheap, but doing it hundreds of times when you don't need to
  -- *   will slow the performance significantly.
  -- * - Perform your data uploads as early as possible in the frame.
  -- * - Don't churn resources. Creating and releasing resources is expensive.
  -- *   It's better to create what you need up front and cache it.
  -- * - Don't use uniform buffers for large amounts of data (more than a matrix
  -- *   or so). Use a storage buffer instead.
  -- * - Use cycling correctly. There is a detailed explanation of cycling further
  -- *   below.
  -- * - Use culling techniques to minimize pixel writes. The less writing the GPU
  -- *   has to do the better. Culling can be a very advanced topic but even
  -- *   simple culling techniques can boost performance significantly.
  -- *
  -- * In general try to remember the golden rule of performance: doing things is
  -- * more expensive than not doing things. Don't Touch The Driver!
  -- *
  -- * ## FAQ
  -- *
  -- * **Question: When are you adding more advanced features, like ray tracing or
  -- * mesh shaders?**
  -- *
  -- * Answer: We don't have immediate plans to add more bleeding-edge features,
  -- * but we certainly might in the future, when these features prove worthwhile,
  -- * and reasonable to implement across several platforms and underlying APIs.
  -- * So while these things are not in the "never" category, they are definitely
  -- * not "near future" items either.
  -- *
  -- * **Question: Why is my shader not working?**
  -- *
  -- * Answer: A common oversight when using shaders is not properly laying out
  -- * the shader resources/registers correctly. The GPU API is very strict with
  -- * how it wants resources to be laid out and it's difficult for the API to
  -- * automatically validate shaders to see if they have a compatible layout. See
  -- * the documentation for SDL_CreateGPUShader() and
  -- * SDL_CreateGPUComputePipeline() for information on the expected layout.
  -- *
  -- * Another common issue is not setting the correct number of samplers,
  -- * textures, and buffers in SDL_GPUShaderCreateInfo. If possible use shader
  -- * reflection to extract the required information from the shader
  -- * automatically instead of manually filling in the struct's values.
  -- *
  -- * **Question: My application isn't performing very well. Is this the GPU
  -- * API's fault?**
  -- *
  -- * Answer: No. Long answer: The GPU API is a relatively thin layer over the
  -- * underlying graphics API. While it's possible that we have done something
  -- * inefficiently, it's very unlikely especially if you are relatively
  -- * inexperienced with GPU rendering. Please see the performance tips above and
  -- * make sure you are following them. Additionally, tools like
  -- * [RenderDoc](https://renderdoc.org/)
  -- * can be very helpful for diagnosing incorrect behavior and performance
  -- * issues.
  -- *
  -- * ## System Requirements
  -- *
  -- * ### Vulkan
  -- *
  -- * SDL driver name: "vulkan" (for use in SDL_CreateGPUDevice() and
  -- * SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING)
  -- *
  -- * Supported on Windows, Linux, Nintendo Switch, and certain Android devices.
  -- * Requires Vulkan 1.0 with the following extensions and device features:
  -- *
  -- * - `VK_KHR_swapchain`
  -- * - `VK_KHR_maintenance1`
  -- * - `independentBlend`
  -- * - `imageCubeArray`
  -- * - `depthClamp`
  -- * - `shaderClipDistance`
  -- * - `drawIndirectFirstInstance`
  -- * - `sampleRateShading`
  -- *
  -- * You can remove some of these requirements to increase compatibility with
  -- * Android devices by using these properties when creating the GPU device with
  -- * SDL_CreateGPUDeviceWithProperties():
  -- *
  -- * - SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN
  -- * - SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN
  -- * - SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN
  -- * - SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN
  -- *
  -- * ### D3D12
  -- *
  -- * SDL driver name: "direct3d12"
  -- *
  -- * Supported on Windows 10 or newer, Xbox One (GDK), and Xbox Series X|S
  -- * (GDK). Requires a GPU that supports DirectX 12 Feature Level 11_0 and
  -- * Resource Binding Tier 2 or above.
  -- *
  -- * You can remove the Tier 2 resource binding requirement to support Intel
  -- * Haswell and Broadwell GPUs by using this property when creating the GPU
  -- * device with SDL_CreateGPUDeviceWithProperties():
  -- *
  -- * - SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN
  -- *
  -- * ### Metal
  -- *
  -- * SDL driver name: "metal"
  -- *
  -- * Supported on macOS 10.14+ and iOS/tvOS 13.0+. Hardware requirements vary by
  -- * operating system:
  -- *
  -- * - macOS requires an Apple Silicon or
  -- *   [Intel Mac2 family](https://developer.apple.com/documentation/metal/mtlfeatureset/mtlfeatureset_macos_gpufamily2_v1?language=objc)
  -- *   GPU
  -- * - iOS/tvOS requires an A9 GPU or newer
  -- * - iOS Simulator and tvOS Simulator are unsupported
  -- *
  -- * ## Coordinate System
  -- *
  -- * The GPU API uses a left-handed coordinate system, following the convention
  -- * of D3D12 and Metal. Specifically:
  -- *
  -- * - **Normalized Device Coordinates:** The lower-left corner has an x,y
  -- *   coordinate of `(-1.0, -1.0)`. The upper-right corner is `(1.0, 1.0)`. Z
  -- *   values range from `[0.0, 1.0]` where 0 is the near plane.
  -- * - **Viewport Coordinates:** The top-left corner has an x,y coordinate of
  -- *   `(0, 0)` and extends to the bottom-right corner at `(viewportWidth,
  -- *   viewportHeight)`. +Y is down.
  -- * - **Texture Coordinates:** The top-left corner has an x,y coordinate of
  -- *   `(0, 0)` and extends to the bottom-right corner at `(1.0, 1.0)`. +Y is
  -- *   down.
  -- *
  -- * If the backend driver differs from this convention (e.g. Vulkan, which has
  -- * an NDC that assumes +Y is down), SDL will automatically convert the
  -- * coordinate system behind the scenes, so you don't need to perform any
  -- * coordinate flipping logic in your shaders.
  -- *
  -- * ## Uniform Data
  -- *
  -- * Uniforms are for passing data to shaders. The uniform data will be constant
  -- * across all executions of the shader.
  -- *
  -- * There are 4 available uniform slots per shader stage (where the stages are
  -- * vertex, fragment, and compute). Uniform data pushed to a slot on a stage
  -- * keeps its value throughout the command buffer until you call the relevant
  -- * Push function on that slot again.
  -- *
  -- * For example, you could write your vertex shaders to read a camera matrix
  -- * from uniform binding slot 0, push the camera matrix at the start of the
  -- * command buffer, and that data will be used for every subsequent draw call.
  -- *
  -- * It is valid to push uniform data during a render or compute pass.
  -- *
  -- * Uniforms are best for pushing small amounts of data. If you are pushing
  -- * more than a matrix or two per call you should consider using a storage
  -- * buffer instead.
  -- *
  -- * ## A Note On Cycling
  -- *
  -- * When using a command buffer, operations do not occur immediately - they
  -- * occur some time after the command buffer is submitted.
  -- *
  -- * When a resource is used in a pending or active command buffer, it is
  -- * considered to be "bound". When a resource is no longer used in any pending
  -- * or active command buffers, it is considered to be "unbound".
  -- *
  -- * If data resources are bound, it is unspecified when that data will be
  -- * unbound unless you acquire a fence when submitting the command buffer and
  -- * wait on it. However, this doesn't mean you need to track resource usage
  -- * manually.
  -- *
  -- * All of the functions and structs that involve writing to a resource have a
  -- * "cycle" bool. SDL_GPUTransferBuffer, SDL_GPUBuffer, and SDL_GPUTexture all
  -- * effectively function as ring buffers on internal resources. When cycle is
  -- * true, if the resource is bound, the cycle rotates to the next unbound
  -- * internal resource, or if none are available, a new one is created. This
  -- * means you don't have to worry about complex state tracking and
  -- * synchronization as long as cycling is correctly employed.
  -- *
  -- * For example: you can call SDL_MapGPUTransferBuffer(), write texture data,
  -- * SDL_UnmapGPUTransferBuffer(), and then SDL_UploadToGPUTexture(). The next
  -- * time you write texture data to the transfer buffer, if you set the cycle
  -- * param to true, you don't have to worry about overwriting any data that is
  -- * not yet uploaded.
  -- *
  -- * Another example: If you are using a texture in a render pass every frame,
  -- * this can cause a data dependency between frames. If you set cycle to true
  -- * in the SDL_GPUColorTargetInfo struct, you can prevent this data dependency.
  -- *
  -- * Cycling will never undefine already bound data. When cycling, all data in
  -- * the resource is considered to be undefined for subsequent commands until
  -- * that data is written again. You must take care not to read undefined data.
  -- *
  -- * Note that when cycling a texture, the entire texture will be cycled, even
  -- * if only part of the texture is used in the call, so you must consider the
  -- * entire texture to contain undefined data after cycling.
  -- *
  -- * You must also take care not to overwrite a section of data that has been
  -- * referenced in a command without cycling first. It is OK to overwrite
  -- * unreferenced data in a bound resource without cycling, but overwriting a
  -- * section of data that has already been referenced will produce unexpected
  -- * results.
  -- *
  -- * ## Debugging
  -- *
  -- * At some point of your GPU journey, you will probably encounter issues that
  -- * are not traceable with regular debugger - for example, your code compiles
  -- * but you get an empty screen, or your shader fails in runtime.
  -- *
  -- * For debugging such cases, there are tools that allow visually inspecting
  -- * the whole GPU frame, every drawcall, every bound resource, memory buffers,
  -- * etc. They are the following, per platform:
  -- *
  -- * * For Windows/Linux, use
  -- *   [RenderDoc](https://renderdoc.org/)
  -- * * For MacOS (Metal), use Xcode built-in debugger (Open XCode, go to Debug >
  -- *   Debug Executable..., select your application, set "GPU Frame Capture" to
  -- *   "Metal" in scheme "Options" window, run your app, and click the small
  -- *   Metal icon on the bottom to capture a frame)
  -- *
  -- * Aside from that, you may want to enable additional debug layers to receive
  -- * more detailed error messages, based on your GPU backend:
  -- *
  -- * * For D3D12, the debug layer is an optional feature that can be installed
  -- *   via "Windows Settings -> System -> Optional features" and adding the
  -- *   "Graphics Tools" optional feature.
  -- * * For Vulkan, you will need to install Vulkan SDK on Windows, and on Linux,
  -- *   you usually have some sort of `vulkan-validation-layers` system package
  -- *   that should be installed.
  -- * * For Metal, it should be enough just to run the application from XCode to
  -- *   receive detailed errors or warnings in the output.
  -- *
  -- * Don't hesitate to use tools as RenderDoc when encountering runtime issues
  -- * or unexpected output on screen, quick GPU frame inspection can usually help
  -- * you fix the majority of such problems.
  --  

  -- Type Declarations  
  --*
  -- * An opaque handle representing the SDL_GPU context.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_GPUDevice is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a buffer.
  -- *
  -- * Used for vertices, indices, indirect draw commands, and general compute
  -- * data.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUBuffer
  -- * \sa SDL_UploadToGPUBuffer
  -- * \sa SDL_DownloadFromGPUBuffer
  -- * \sa SDL_CopyGPUBufferToBuffer
  -- * \sa SDL_BindGPUVertexBuffers
  -- * \sa SDL_BindGPUIndexBuffer
  -- * \sa SDL_BindGPUVertexStorageBuffers
  -- * \sa SDL_BindGPUFragmentStorageBuffers
  -- * \sa SDL_DrawGPUPrimitivesIndirect
  -- * \sa SDL_DrawGPUIndexedPrimitivesIndirect
  -- * \sa SDL_BindGPUComputeStorageBuffers
  -- * \sa SDL_DispatchGPUComputeIndirect
  -- * \sa SDL_ReleaseGPUBuffer
  --  

   type SDL_GPUBuffer is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a transfer buffer.
  -- *
  -- * Used for transferring data to and from the device.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTransferBuffer
  -- * \sa SDL_MapGPUTransferBuffer
  -- * \sa SDL_UnmapGPUTransferBuffer
  -- * \sa SDL_UploadToGPUBuffer
  -- * \sa SDL_UploadToGPUTexture
  -- * \sa SDL_DownloadFromGPUBuffer
  -- * \sa SDL_DownloadFromGPUTexture
  -- * \sa SDL_ReleaseGPUTransferBuffer
  --  

   type SDL_GPUTransferBuffer is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a texture.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  -- * \sa SDL_UploadToGPUTexture
  -- * \sa SDL_DownloadFromGPUTexture
  -- * \sa SDL_CopyGPUTextureToTexture
  -- * \sa SDL_BindGPUVertexSamplers
  -- * \sa SDL_BindGPUVertexStorageTextures
  -- * \sa SDL_BindGPUFragmentSamplers
  -- * \sa SDL_BindGPUFragmentStorageTextures
  -- * \sa SDL_BindGPUComputeStorageTextures
  -- * \sa SDL_GenerateMipmapsForGPUTexture
  -- * \sa SDL_BlitGPUTexture
  -- * \sa SDL_ReleaseGPUTexture
  --  

   type SDL_GPUTexture is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a sampler.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUSampler
  -- * \sa SDL_BindGPUVertexSamplers
  -- * \sa SDL_BindGPUFragmentSamplers
  -- * \sa SDL_ReleaseGPUSampler
  --  

   type SDL_GPUSampler is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a compiled shader object.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  -- * \sa SDL_CreateGPUGraphicsPipeline
  -- * \sa SDL_ReleaseGPUShader
  --  

   type SDL_GPUShader is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a compute pipeline.
  -- *
  -- * Used during compute passes.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUComputePipeline
  -- * \sa SDL_BindGPUComputePipeline
  -- * \sa SDL_ReleaseGPUComputePipeline
  --  

   type SDL_GPUComputePipeline is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a graphics pipeline.
  -- *
  -- * Used during render passes.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  -- * \sa SDL_BindGPUGraphicsPipeline
  -- * \sa SDL_ReleaseGPUGraphicsPipeline
  --  

   type SDL_GPUGraphicsPipeline is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a command buffer.
  -- *
  -- * Most state is managed via command buffers. When setting state using a
  -- * command buffer, that state is local to the command buffer.
  -- *
  -- * Commands only begin execution on the GPU once SDL_SubmitGPUCommandBuffer is
  -- * called. Once the command buffer is submitted, it is no longer valid to use
  -- * it.
  -- *
  -- * Command buffers are executed in submission order. If you submit command
  -- * buffer A and then command buffer B all commands in A will begin executing
  -- * before any command in B begins executing.
  -- *
  -- * In multi-threading scenarios, you should only access a command buffer on
  -- * the thread you acquired it from.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AcquireGPUCommandBuffer
  -- * \sa SDL_SubmitGPUCommandBuffer
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  --  

   type SDL_GPUCommandBuffer is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a render pass.
  -- *
  -- * This handle is transient and should not be held or referenced after
  -- * SDL_EndGPURenderPass is called.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPURenderPass
  -- * \sa SDL_EndGPURenderPass
  --  

   type SDL_GPURenderPass is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a compute pass.
  -- *
  -- * This handle is transient and should not be held or referenced after
  -- * SDL_EndGPUComputePass is called.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPUComputePass
  -- * \sa SDL_EndGPUComputePass
  --  

   type SDL_GPUComputePass is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a copy pass.
  -- *
  -- * This handle is transient and should not be held or referenced after
  -- * SDL_EndGPUCopyPass is called.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPUCopyPass
  -- * \sa SDL_EndGPUCopyPass
  --  

   type SDL_GPUCopyPass is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a fence.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  -- * \sa SDL_QueryGPUFence
  -- * \sa SDL_WaitForGPUFences
  -- * \sa SDL_ReleaseGPUFence
  --  

   type SDL_GPUFence is null record;   -- incomplete struct

  --*
  -- * Specifies the primitive topology of a graphics pipeline.
  -- *
  -- * If you are using POINTLIST you must include a point size output in the
  -- * vertex shader.
  -- *
  -- * - For HLSL compiling to SPIRV you must decorate a float output with
  -- *   [[vk::builtin("PointSize")]].
  -- * - For GLSL you must set the gl_PointSize builtin.
  -- * - For MSL you must include a float output with the [[point_size]]
  -- *   decorator.
  -- *
  -- * Note that sized point topology is totally unsupported on D3D12. Any size
  -- * other than 1 will be ignored. In general, you should avoid using point
  -- * topology for both compatibility and performance reasons. You WILL regret
  -- * using it.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUPrimitiveType is 
     (SDL_GPU_PRIMITIVETYPE_TRIANGLELIST,
      SDL_GPU_PRIMITIVETYPE_TRIANGLESTRIP,
      SDL_GPU_PRIMITIVETYPE_LINELIST,
      SDL_GPU_PRIMITIVETYPE_LINESTRIP,
      SDL_GPU_PRIMITIVETYPE_POINTLIST)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:621

  --*< A series of separate triangles.  
  --*< A series of connected triangles.  
  --*< A series of separate lines.  
  --*< A series of connected lines.  
  --*< A series of separate points.  
  --*
  -- * Specifies how the contents of a texture attached to a render pass are
  -- * treated at the beginning of the render pass.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPURenderPass
  --  

   type SDL_GPULoadOp is 
     (SDL_GPU_LOADOP_LOAD,
      SDL_GPU_LOADOP_CLEAR,
      SDL_GPU_LOADOP_DONT_CARE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:638

  --*< The previous contents of the texture will be preserved.  
  --*< The contents of the texture will be cleared to a color.  
  --*< The previous contents of the texture need not be preserved. The contents will be undefined.  
  --*
  -- * Specifies how the contents of a texture attached to a render pass are
  -- * treated at the end of the render pass.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPURenderPass
  --  

   type SDL_GPUStoreOp is 
     (SDL_GPU_STOREOP_STORE,
      SDL_GPU_STOREOP_DONT_CARE,
      SDL_GPU_STOREOP_RESOLVE,
      SDL_GPU_STOREOP_RESOLVE_AND_STORE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:653

  --*< The contents generated during the render pass will be written to memory.  
  --*< The contents generated during the render pass are not needed and may be discarded. The contents will be undefined.  
  --*< The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture may then be discarded and will be undefined.  
  --*< The multisample contents generated during the render pass will be resolved to a non-multisample texture. The contents in the multisample texture will be written to memory.  
  --*
  -- * Specifies the size of elements in an index buffer.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUIndexElementSize is 
     (SDL_GPU_INDEXELEMENTSIZE_16BIT,
      SDL_GPU_INDEXELEMENTSIZE_32BIT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:668

  --*< The index elements are 16-bit.  
  --*< The index elements are 32-bit.  
  --*
  -- * Specifies the pixel format of a texture.
  -- *
  -- * Texture format support varies depending on driver, hardware, and usage
  -- * flags. In general, you should use SDL_GPUTextureSupportsFormat to query if
  -- * a format is supported before using it. However, there are a few guaranteed
  -- * formats.
  -- *
  -- * FIXME: Check universal support for 32-bit component formats FIXME: Check
  -- * universal support for SIMULTANEOUS_READ_WRITE
  -- *
  -- * For SAMPLER usage, the following formats are universally supported:
  -- *
  -- * - R8G8B8A8_UNORM
  -- * - B8G8R8A8_UNORM
  -- * - R8_UNORM
  -- * - R8_SNORM
  -- * - R8G8_UNORM
  -- * - R8G8_SNORM
  -- * - R8G8B8A8_SNORM
  -- * - R16_FLOAT
  -- * - R16G16_FLOAT
  -- * - R16G16B16A16_FLOAT
  -- * - R32_FLOAT
  -- * - R32G32_FLOAT
  -- * - R32G32B32A32_FLOAT
  -- * - R11G11B10_UFLOAT
  -- * - R8G8B8A8_UNORM_SRGB
  -- * - B8G8R8A8_UNORM_SRGB
  -- * - D16_UNORM
  -- *
  -- * For COLOR_TARGET usage, the following formats are universally supported:
  -- *
  -- * - R8G8B8A8_UNORM
  -- * - B8G8R8A8_UNORM
  -- * - R8_UNORM
  -- * - R16_FLOAT
  -- * - R16G16_FLOAT
  -- * - R16G16B16A16_FLOAT
  -- * - R32_FLOAT
  -- * - R32G32_FLOAT
  -- * - R32G32B32A32_FLOAT
  -- * - R8_UINT
  -- * - R8G8_UINT
  -- * - R8G8B8A8_UINT
  -- * - R16_UINT
  -- * - R16G16_UINT
  -- * - R16G16B16A16_UINT
  -- * - R8_INT
  -- * - R8G8_INT
  -- * - R8G8B8A8_INT
  -- * - R16_INT
  -- * - R16G16_INT
  -- * - R16G16B16A16_INT
  -- * - R8G8B8A8_UNORM_SRGB
  -- * - B8G8R8A8_UNORM_SRGB
  -- *
  -- * For STORAGE usages, the following formats are universally supported:
  -- *
  -- * - R8G8B8A8_UNORM
  -- * - R8G8B8A8_SNORM
  -- * - R16G16B16A16_FLOAT
  -- * - R32_FLOAT
  -- * - R32G32_FLOAT
  -- * - R32G32B32A32_FLOAT
  -- * - R8G8B8A8_UINT
  -- * - R16G16B16A16_UINT
  -- * - R8G8B8A8_INT
  -- * - R16G16B16A16_INT
  -- *
  -- * For DEPTH_STENCIL_TARGET usage, the following formats are universally
  -- * supported:
  -- *
  -- * - D16_UNORM
  -- * - Either (but not necessarily both!) D24_UNORM or D32_FLOAT
  -- * - Either (but not necessarily both!) D24_UNORM_S8_UINT or D32_FLOAT_S8_UINT
  -- *
  -- * Unless D16_UNORM is sufficient for your purposes, always check which of
  -- * D24/D32 is supported before creating a depth-stencil texture!
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  -- * \sa SDL_GPUTextureSupportsFormat
  --  

   type SDL_GPUTextureFormat is 
     (SDL_GPU_TEXTUREFORMAT_INVALID,
      SDL_GPU_TEXTUREFORMAT_A8_UNORM,
      SDL_GPU_TEXTUREFORMAT_R8_UNORM,
      SDL_GPU_TEXTUREFORMAT_R8G8_UNORM,
      SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM,
      SDL_GPU_TEXTUREFORMAT_R16_UNORM,
      SDL_GPU_TEXTUREFORMAT_R16G16_UNORM,
      SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UNORM,
      SDL_GPU_TEXTUREFORMAT_R10G10B10A2_UNORM,
      SDL_GPU_TEXTUREFORMAT_B5G6R5_UNORM,
      SDL_GPU_TEXTUREFORMAT_B5G5R5A1_UNORM,
      SDL_GPU_TEXTUREFORMAT_B4G4R4A4_UNORM,
      SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC4_R_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC5_RG_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM,
      SDL_GPU_TEXTUREFORMAT_BC6H_RGB_FLOAT,
      SDL_GPU_TEXTUREFORMAT_BC6H_RGB_UFLOAT,
      SDL_GPU_TEXTUREFORMAT_R8_SNORM,
      SDL_GPU_TEXTUREFORMAT_R8G8_SNORM,
      SDL_GPU_TEXTUREFORMAT_R8G8B8A8_SNORM,
      SDL_GPU_TEXTUREFORMAT_R16_SNORM,
      SDL_GPU_TEXTUREFORMAT_R16G16_SNORM,
      SDL_GPU_TEXTUREFORMAT_R16G16B16A16_SNORM,
      SDL_GPU_TEXTUREFORMAT_R16_FLOAT,
      SDL_GPU_TEXTUREFORMAT_R16G16_FLOAT,
      SDL_GPU_TEXTUREFORMAT_R16G16B16A16_FLOAT,
      SDL_GPU_TEXTUREFORMAT_R32_FLOAT,
      SDL_GPU_TEXTUREFORMAT_R32G32_FLOAT,
      SDL_GPU_TEXTUREFORMAT_R32G32B32A32_FLOAT,
      SDL_GPU_TEXTUREFORMAT_R11G11B10_UFLOAT,
      SDL_GPU_TEXTUREFORMAT_R8_UINT,
      SDL_GPU_TEXTUREFORMAT_R8G8_UINT,
      SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UINT,
      SDL_GPU_TEXTUREFORMAT_R16_UINT,
      SDL_GPU_TEXTUREFORMAT_R16G16_UINT,
      SDL_GPU_TEXTUREFORMAT_R16G16B16A16_UINT,
      SDL_GPU_TEXTUREFORMAT_R32_UINT,
      SDL_GPU_TEXTUREFORMAT_R32G32_UINT,
      SDL_GPU_TEXTUREFORMAT_R32G32B32A32_UINT,
      SDL_GPU_TEXTUREFORMAT_R8_INT,
      SDL_GPU_TEXTUREFORMAT_R8G8_INT,
      SDL_GPU_TEXTUREFORMAT_R8G8B8A8_INT,
      SDL_GPU_TEXTUREFORMAT_R16_INT,
      SDL_GPU_TEXTUREFORMAT_R16G16_INT,
      SDL_GPU_TEXTUREFORMAT_R16G16B16A16_INT,
      SDL_GPU_TEXTUREFORMAT_R32_INT,
      SDL_GPU_TEXTUREFORMAT_R32G32_INT,
      SDL_GPU_TEXTUREFORMAT_R32G32B32A32_INT,
      SDL_GPU_TEXTUREFORMAT_R8G8B8A8_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_B8G8R8A8_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_BC1_RGBA_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_BC2_RGBA_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_BC3_RGBA_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_BC7_RGBA_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_D16_UNORM,
      SDL_GPU_TEXTUREFORMAT_D24_UNORM,
      SDL_GPU_TEXTUREFORMAT_D32_FLOAT,
      SDL_GPU_TEXTUREFORMAT_D24_UNORM_S8_UINT,
      SDL_GPU_TEXTUREFORMAT_D32_FLOAT_S8_UINT,
      SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM,
      SDL_GPU_TEXTUREFORMAT_ASTC_4x4_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_5x4_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_5x5_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_6x5_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_6x6_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x5_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x6_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x8_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x5_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x6_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x8_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x10_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_12x10_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_12x12_UNORM_SRGB,
      SDL_GPU_TEXTUREFORMAT_ASTC_4x4_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_5x4_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_5x5_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_6x5_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_6x6_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x5_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x6_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_8x8_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x5_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x6_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x8_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_10x10_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_12x10_FLOAT,
      SDL_GPU_TEXTUREFORMAT_ASTC_12x12_FLOAT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:759

  -- Unsigned Normalized Float Color Formats  
  -- Compressed Unsigned Normalized Float Color Formats  
  -- Compressed Signed Float Color Formats  
  -- Compressed Unsigned Float Color Formats  
  -- Signed Normalized Float Color Formats   
  -- Signed Float Color Formats  
  -- Unsigned Float Color Formats  
  -- Unsigned Integer Color Formats  
  -- Signed Integer Color Formats  
  -- SRGB Unsigned Normalized Color Formats  
  -- Compressed SRGB Unsigned Normalized Color Formats  
  -- Depth Formats  
  -- Compressed ASTC Normalized Float Color Formats 
  -- Compressed SRGB ASTC Normalized Float Color Formats 
  -- Compressed ASTC Signed Float Color Formats 
  --*
  -- * Specifies how a texture is intended to be used by the client.
  -- *
  -- * A texture must have at least one usage flag. Note that some usage flag
  -- * combinations are invalid.
  -- *
  -- * With regards to compute storage usage, READ | WRITE means that you can have
  -- * shader A that only writes into the texture and shader B that only reads
  -- * from the texture and bind the same texture to either shader respectively.
  -- * SIMULTANEOUS means that you can do reads and writes within the same shader
  -- * or compute pass. It also implies that atomic ops can be used, since those
  -- * are read-modify-write operations. If you use SIMULTANEOUS, you are
  -- * responsible for avoiding data races, as there is no data synchronization
  -- * within a compute pass. Note that SIMULTANEOUS usage is only supported by a
  -- * limited number of texture formats.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  --  

   subtype SDL_GPUTextureUsageFlags is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:904

  --*
  -- * Specifies the type of a texture.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  --  

   type SDL_GPUTextureType is 
     (SDL_GPU_TEXTURETYPE_2D,
      SDL_GPU_TEXTURETYPE_2D_ARRAY,
      SDL_GPU_TEXTURETYPE_3D,
      SDL_GPU_TEXTURETYPE_CUBE,
      SDL_GPU_TEXTURETYPE_CUBE_ARRAY)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:921

  --*< The texture is a 2-dimensional image.  
  --*< The texture is a 2-dimensional array image.  
  --*< The texture is a 3-dimensional image.  
  --*< The texture is a cube image.  
  --*< The texture is a cube array image.  
  --*
  -- * Specifies the sample count of a texture.
  -- *
  -- * Used in multisampling. Note that this value only applies when the texture
  -- * is used as a render target.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  -- * \sa SDL_GPUTextureSupportsSampleCount
  --  

   type SDL_GPUSampleCount is 
     (SDL_GPU_SAMPLECOUNT_1,
      SDL_GPU_SAMPLECOUNT_2,
      SDL_GPU_SAMPLECOUNT_4,
      SDL_GPU_SAMPLECOUNT_8)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:941

  --*< No multisampling.  
  --*< MSAA 2x  
  --*< MSAA 4x  
  --*< MSAA 8x  
  --*
  -- * Specifies the face of a cube map.
  -- *
  -- * Can be passed in as the layer field in texture-related structs.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_GPUCubeMapFace is 
     (SDL_GPU_CUBEMAPFACE_POSITIVEX,
      SDL_GPU_CUBEMAPFACE_NEGATIVEX,
      SDL_GPU_CUBEMAPFACE_POSITIVEY,
      SDL_GPU_CUBEMAPFACE_NEGATIVEY,
      SDL_GPU_CUBEMAPFACE_POSITIVEZ,
      SDL_GPU_CUBEMAPFACE_NEGATIVEZ)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:957

  --*
  -- * Specifies how a buffer is intended to be used by the client.
  -- *
  -- * A buffer must have at least one usage flag. Note that some usage flag
  -- * combinations are invalid.
  -- *
  -- * Unlike textures, READ | WRITE can be used for simultaneous read-write
  -- * usage. The same data synchronization concerns as textures apply.
  -- *
  -- * If you use a STORAGE flag, the data in the buffer must respect std140
  -- * layout conventions. In practical terms this means you must ensure that vec3
  -- * and vec4 fields are 16-byte aligned.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUBuffer
  --  

   subtype SDL_GPUBufferUsageFlags is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:984

  --*
  -- * Specifies how a transfer buffer is intended to be used by the client.
  -- *
  -- * Note that mapping and copying FROM an upload transfer buffer or TO a
  -- * download transfer buffer is undefined behavior.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTransferBuffer
  --  

   type SDL_GPUTransferBufferUsage is 
     (SDL_GPU_TRANSFERBUFFERUSAGE_UPLOAD,
      SDL_GPU_TRANSFERBUFFERUSAGE_DOWNLOAD)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1003

  --*
  -- * Specifies which stage a shader program corresponds to.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   type SDL_GPUShaderStage is 
     (SDL_GPU_SHADERSTAGE_VERTEX,
      SDL_GPU_SHADERSTAGE_FRAGMENT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1016

  --*
  -- * Specifies the format of shader code.
  -- *
  -- * Each format corresponds to a specific backend that accepts it.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   subtype SDL_GPUShaderFormat is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1031

  --*
  -- * Specifies the format of a vertex attribute.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUVertexElementFormat is 
     (SDL_GPU_VERTEXELEMENTFORMAT_INVALID,
      SDL_GPU_VERTEXELEMENTFORMAT_INT,
      SDL_GPU_VERTEXELEMENTFORMAT_INT2,
      SDL_GPU_VERTEXELEMENTFORMAT_INT3,
      SDL_GPU_VERTEXELEMENTFORMAT_INT4,
      SDL_GPU_VERTEXELEMENTFORMAT_UINT,
      SDL_GPU_VERTEXELEMENTFORMAT_UINT2,
      SDL_GPU_VERTEXELEMENTFORMAT_UINT3,
      SDL_GPU_VERTEXELEMENTFORMAT_UINT4,
      SDL_GPU_VERTEXELEMENTFORMAT_FLOAT,
      SDL_GPU_VERTEXELEMENTFORMAT_FLOAT2,
      SDL_GPU_VERTEXELEMENTFORMAT_FLOAT3,
      SDL_GPU_VERTEXELEMENTFORMAT_FLOAT4,
      SDL_GPU_VERTEXELEMENTFORMAT_BYTE2,
      SDL_GPU_VERTEXELEMENTFORMAT_BYTE4,
      SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2,
      SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4,
      SDL_GPU_VERTEXELEMENTFORMAT_BYTE2_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_BYTE4_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_UBYTE2_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_UBYTE4_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_SHORT2,
      SDL_GPU_VERTEXELEMENTFORMAT_SHORT4,
      SDL_GPU_VERTEXELEMENTFORMAT_USHORT2,
      SDL_GPU_VERTEXELEMENTFORMAT_USHORT4,
      SDL_GPU_VERTEXELEMENTFORMAT_SHORT2_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_SHORT4_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_USHORT2_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_USHORT4_NORM,
      SDL_GPU_VERTEXELEMENTFORMAT_HALF2,
      SDL_GPU_VERTEXELEMENTFORMAT_HALF4)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1048

  -- 32-bit Signed Integers  
  -- 32-bit Unsigned Integers  
  -- 32-bit Floats  
  -- 8-bit Signed Integers  
  -- 8-bit Unsigned Integers  
  -- 8-bit Signed Normalized  
  -- 8-bit Unsigned Normalized  
  -- 16-bit Signed Integers  
  -- 16-bit Unsigned Integers  
  -- 16-bit Signed Normalized  
  -- 16-bit Unsigned Normalized  
  -- 16-bit Floats  
  --*
  -- * Specifies the rate at which vertex attributes are pulled from buffers.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUVertexInputRate is 
     (SDL_GPU_VERTEXINPUTRATE_VERTEX,
      SDL_GPU_VERTEXINPUTRATE_INSTANCE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1114

  --*< Attribute addressing is a function of the vertex index.  
  --*< Attribute addressing is a function of the instance index.  
  --*
  -- * Specifies the fill mode of the graphics pipeline.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUFillMode is 
     (SDL_GPU_FILLMODE_FILL,
      SDL_GPU_FILLMODE_LINE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1127

  --*< Polygons will be rendered via rasterization.  
  --*< Polygon edges will be drawn as line segments.  
  --*
  -- * Specifies the facing direction in which triangle faces will be culled.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUCullMode is 
     (SDL_GPU_CULLMODE_NONE,
      SDL_GPU_CULLMODE_FRONT,
      SDL_GPU_CULLMODE_BACK)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1140

  --*< No triangles are culled.  
  --*< Front-facing triangles are culled.  
  --*< Back-facing triangles are culled.  
  --*
  -- * Specifies the vertex winding that will cause a triangle to be determined to
  -- * be front-facing.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUFrontFace is 
     (SDL_GPU_FRONTFACE_COUNTER_CLOCKWISE,
      SDL_GPU_FRONTFACE_CLOCKWISE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1155

  --*< A triangle with counter-clockwise vertex winding will be considered front-facing.  
  --*< A triangle with clockwise vertex winding will be considered front-facing.  
  --*
  -- * Specifies a comparison operator for depth, stencil and sampler operations.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUCompareOp is 
     (SDL_GPU_COMPAREOP_INVALID,
      SDL_GPU_COMPAREOP_NEVER,
      SDL_GPU_COMPAREOP_LESS,
      SDL_GPU_COMPAREOP_EQUAL,
      SDL_GPU_COMPAREOP_LESS_OR_EQUAL,
      SDL_GPU_COMPAREOP_GREATER,
      SDL_GPU_COMPAREOP_NOT_EQUAL,
      SDL_GPU_COMPAREOP_GREATER_OR_EQUAL,
      SDL_GPU_COMPAREOP_ALWAYS)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1168

  --*< The comparison always evaluates false.  
  --*< The comparison evaluates reference < test.  
  --*< The comparison evaluates reference == test.  
  --*< The comparison evaluates reference <= test.  
  --*< The comparison evaluates reference > test.  
  --*< The comparison evaluates reference != test.  
  --*< The comparison evaluates reference >= test.  
  --*< The comparison always evaluates true.  
  --*
  -- * Specifies what happens to a stored stencil value if stencil tests fail or
  -- * pass.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUStencilOp is 
     (SDL_GPU_STENCILOP_INVALID,
      SDL_GPU_STENCILOP_KEEP,
      SDL_GPU_STENCILOP_ZERO,
      SDL_GPU_STENCILOP_REPLACE,
      SDL_GPU_STENCILOP_INCREMENT_AND_CLAMP,
      SDL_GPU_STENCILOP_DECREMENT_AND_CLAMP,
      SDL_GPU_STENCILOP_INVERT,
      SDL_GPU_STENCILOP_INCREMENT_AND_WRAP,
      SDL_GPU_STENCILOP_DECREMENT_AND_WRAP)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1189

  --*< Keeps the current value.  
  --*< Sets the value to 0.  
  --*< Sets the value to reference.  
  --*< Increments the current value and clamps to the maximum value.  
  --*< Decrements the current value and clamps to 0.  
  --*< Bitwise-inverts the current value.  
  --*< Increments the current value and wraps back to 0.  
  --*< Decrements the current value and wraps to the maximum value.  
  --*
  -- * Specifies the operator to be used when pixels in a render target are
  -- * blended with existing pixels in the texture.
  -- *
  -- * The source color is the value written by the fragment shader. The
  -- * destination color is the value currently existing in the texture.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUBlendOp is 
     (SDL_GPU_BLENDOP_INVALID,
      SDL_GPU_BLENDOP_ADD,
      SDL_GPU_BLENDOP_SUBTRACT,
      SDL_GPU_BLENDOP_REVERSE_SUBTRACT,
      SDL_GPU_BLENDOP_MIN,
      SDL_GPU_BLENDOP_MAX)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1213

  --*< (source * source_factor) + (destination * destination_factor)  
  --*< (source * source_factor) - (destination * destination_factor)  
  --*< (destination * destination_factor) - (source * source_factor)  
  --*< min(source, destination)  
  --*< max(source, destination)  
  --*
  -- * Specifies a blending factor to be used when pixels in a render target are
  -- * blended with existing pixels in the texture.
  -- *
  -- * The source color is the value written by the fragment shader. The
  -- * destination color is the value currently existing in the texture.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   type SDL_GPUBlendFactor is 
     (SDL_GPU_BLENDFACTOR_INVALID,
      SDL_GPU_BLENDFACTOR_ZERO,
      SDL_GPU_BLENDFACTOR_ONE,
      SDL_GPU_BLENDFACTOR_SRC_COLOR,
      SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
      SDL_GPU_BLENDFACTOR_DST_COLOR,
      SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_COLOR,
      SDL_GPU_BLENDFACTOR_SRC_ALPHA,
      SDL_GPU_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
      SDL_GPU_BLENDFACTOR_DST_ALPHA,
      SDL_GPU_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
      SDL_GPU_BLENDFACTOR_CONSTANT_COLOR,
      SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR,
      SDL_GPU_BLENDFACTOR_SRC_ALPHA_SATURATE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1234

  --*< 0  
  --*< 1  
  --*< source color  
  --*< 1 - source color  
  --*< destination color  
  --*< 1 - destination color  
  --*< source alpha  
  --*< 1 - source alpha  
  --*< destination alpha  
  --*< 1 - destination alpha  
  --*< blend constant  
  --*< 1 - blend constant  
  --*< min(source alpha, 1 - destination alpha)  
  --*
  -- * Specifies which color components are written in a graphics pipeline.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  --  

   subtype SDL_GPUColorComponentFlags is SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1259

  --*
  -- * Specifies a filter operation used by a sampler.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUSampler
  --  

   type SDL_GPUFilter is 
     (SDL_GPU_FILTER_NEAREST,
      SDL_GPU_FILTER_LINEAR)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1273

  --*< Point filtering.  
  --*< Linear filtering.  
  --*
  -- * Specifies a mipmap mode used by a sampler.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUSampler
  --  

   type SDL_GPUSamplerMipmapMode is 
     (SDL_GPU_SAMPLERMIPMAPMODE_NEAREST,
      SDL_GPU_SAMPLERMIPMAPMODE_LINEAR)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1286

  --*< Point filtering.  
  --*< Linear filtering.  
  --*
  -- * Specifies behavior of texture sampling when the coordinates exceed the 0-1
  -- * range.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUSampler
  --  

   type SDL_GPUSamplerAddressMode is 
     (SDL_GPU_SAMPLERADDRESSMODE_REPEAT,
      SDL_GPU_SAMPLERADDRESSMODE_MIRRORED_REPEAT,
      SDL_GPU_SAMPLERADDRESSMODE_CLAMP_TO_EDGE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1300

  --*< Specifies that the coordinates will wrap around.  
  --*< Specifies that the coordinates will wrap around mirrored.  
  --*< Specifies that the coordinates will clamp to the 0-1 range.  
  --*
  -- * Specifies the timing that will be used to present swapchain textures to the
  -- * OS.
  -- *
  -- * VSYNC mode will always be supported. IMMEDIATE and MAILBOX modes may not be
  -- * supported on certain systems.
  -- *
  -- * It is recommended to query SDL_WindowSupportsGPUPresentMode after claiming
  -- * the window if you wish to change the present mode to IMMEDIATE or MAILBOX.
  -- *
  -- * - VSYNC: Waits for vblank before presenting. No tearing is possible. If
  -- *   there is a pending image to present, the new image is enqueued for
  -- *   presentation. Disallows tearing at the cost of visual latency.
  -- * - IMMEDIATE: Immediately presents. Lowest latency option, but tearing may
  -- *   occur.
  -- * - MAILBOX: Waits for vblank before presenting. No tearing is possible. If
  -- *   there is a pending image to present, the pending image is replaced by the
  -- *   new image. Similar to VSYNC, but with reduced visual latency.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetGPUSwapchainParameters
  -- * \sa SDL_WindowSupportsGPUPresentMode
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  --  

   type SDL_GPUPresentMode is 
     (SDL_GPU_PRESENTMODE_VSYNC,
      SDL_GPU_PRESENTMODE_IMMEDIATE,
      SDL_GPU_PRESENTMODE_MAILBOX)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1332

  --*
  -- * Specifies the texture format and colorspace of the swapchain textures.
  -- *
  -- * SDR will always be supported. Other compositions may not be supported on
  -- * certain systems.
  -- *
  -- * It is recommended to query SDL_WindowSupportsGPUSwapchainComposition after
  -- * claiming the window if you wish to change the swapchain composition from
  -- * SDR.
  -- *
  -- * - SDR: B8G8R8A8 or R8G8B8A8 swapchain. Pixel values are in sRGB encoding.
  -- * - SDR_LINEAR: B8G8R8A8_SRGB or R8G8B8A8_SRGB swapchain. Pixel values are
  -- *   stored in memory in sRGB encoding but accessed in shaders in "linear
  -- *   sRGB" encoding which is sRGB but with a linear transfer function.
  -- * - HDR_EXTENDED_LINEAR: R16G16B16A16_FLOAT swapchain. Pixel values are in
  -- *   extended linear sRGB encoding and permits values outside of the [0, 1]
  -- *   range.
  -- * - HDR10_ST2084: A2R10G10B10 or A2B10G10R10 swapchain. Pixel values are in
  -- *   BT.2020 ST2084 (PQ) encoding.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetGPUSwapchainParameters
  -- * \sa SDL_WindowSupportsGPUSwapchainComposition
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  --  

   type SDL_GPUSwapchainComposition is 
     (SDL_GPU_SWAPCHAINCOMPOSITION_SDR,
      SDL_GPU_SWAPCHAINCOMPOSITION_SDR_LINEAR,
      SDL_GPU_SWAPCHAINCOMPOSITION_HDR_EXTENDED_LINEAR,
      SDL_GPU_SWAPCHAINCOMPOSITION_HDR10_ST2084)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_gpu.h:1365

  -- Structures  
  --*
  -- * A structure specifying a viewport.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetGPUViewport
  --  

  --*< The left offset of the viewport.  
   type SDL_GPUViewport is record
      x : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1384
      y : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1385
      w : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1386
      h : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1387
      min_depth : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1388
      max_depth : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1389
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1382

  --*< The top offset of the viewport.  
  --*< The width of the viewport.  
  --*< The height of the viewport.  
  --*< The minimum depth of the viewport.  
  --*< The maximum depth of the viewport.  
  --*
  -- * A structure specifying parameters related to transferring data to or from a
  -- * texture.
  -- *
  -- * If either of `pixels_per_row` or `rows_per_layer` is zero, then width and
  -- * height of passed SDL_GPUTextureRegion to SDL_UploadToGPUTexture or
  -- * SDL_DownloadFromGPUTexture are used as default values respectively and data
  -- * is considered to be tightly packed.
  -- *
  -- * **WARNING**: Direct3D 12 requires texture data row pitch to be 256 byte
  -- * aligned, and offsets to be aligned to 512 bytes. If they are not, SDL will
  -- * make a temporary copy of the data that is properly aligned, but this adds
  -- * overhead to the transfer process. Apps can avoid this by aligning their
  -- * data appropriately, or using a different GPU backend than Direct3D 12.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUTexture
  -- * \sa SDL_DownloadFromGPUTexture
  --  

  --*< The transfer buffer used in the transfer operation.  
   type SDL_GPUTextureTransferInfo is record
      transfer_buffer : access SDL_GPUTransferBuffer;  -- /usr/local/include/SDL3/SDL_gpu.h:1414
      offset : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1415
      pixels_per_row : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1416
      rows_per_layer : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1417
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1412

  --*< The starting byte of the image data in the transfer buffer.  
  --*< The number of pixels from one row to the next.  
  --*< The number of rows from one layer/depth-slice to the next.  
  --*
  -- * A structure specifying a location in a transfer buffer.
  -- *
  -- * Used when transferring buffer data to or from a transfer buffer.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUBuffer
  -- * \sa SDL_DownloadFromGPUBuffer
  --  

  --*< The transfer buffer used in the transfer operation.  
   type SDL_GPUTransferBufferLocation is record
      transfer_buffer : access SDL_GPUTransferBuffer;  -- /usr/local/include/SDL3/SDL_gpu.h:1432
      offset : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1433
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1430

  --*< The starting byte of the buffer data in the transfer buffer.  
  --*
  -- * A structure specifying a location in a texture.
  -- *
  -- * Used when copying data from one texture to another.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CopyGPUTextureToTexture
  --  

  --*< The texture used in the copy operation.  
   type SDL_GPUTextureLocation is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:1447
      mip_level : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1448
      layer : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1449
      x : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1450
      y : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1451
      z : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1452
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1445

  --*< The mip level index of the location.  
  --*< The layer index of the location.  
  --*< The left offset of the location.  
  --*< The top offset of the location.  
  --*< The front offset of the location.  
  --*
  -- * A structure specifying a region of a texture.
  -- *
  -- * Used when transferring data to or from a texture.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUTexture
  -- * \sa SDL_DownloadFromGPUTexture
  -- * \sa SDL_CreateGPUTexture
  --  

  --*< The texture used in the copy operation.  
   type SDL_GPUTextureRegion is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:1468
      mip_level : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1469
      layer : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1470
      x : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1471
      y : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1472
      z : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1473
      w : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1474
      h : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1475
      d : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1476
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1466

  --*< The mip level index to transfer.  
  --*< The layer index to transfer.  
  --*< The left offset of the region.  
  --*< The top offset of the region.  
  --*< The front offset of the region.  
  --*< The width of the region.  
  --*< The height of the region.  
  --*< The depth of the region.  
  --*
  -- * A structure specifying a region of a texture used in the blit operation.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitGPUTexture
  --  

  --*< The texture.  
   type SDL_GPUBlitRegion is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:1488
      mip_level : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1489
      layer_or_depth_plane : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1490
      x : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1491
      y : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1492
      w : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1493
      h : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1494
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1486

  --*< The mip level index of the region.  
  --*< The layer index or depth plane of the region. This value is treated as a layer index on 2D array and cube textures, and as a depth plane on 3D textures.  
  --*< The left offset of the region.  
  --*< The top offset of the region.   
  --*< The width of the region.  
  --*< The height of the region.  
  --*
  -- * A structure specifying a location in a buffer.
  -- *
  -- * Used when copying data between buffers.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CopyGPUBufferToBuffer
  --  

  --*< The buffer.  
   type SDL_GPUBufferLocation is record
      buffer : access SDL_GPUBuffer;  -- /usr/local/include/SDL3/SDL_gpu.h:1508
      offset : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1509
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1506

  --*< The starting byte within the buffer.  
  --*
  -- * A structure specifying a region of a buffer.
  -- *
  -- * Used when transferring data to or from buffers.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUBuffer
  -- * \sa SDL_DownloadFromGPUBuffer
  --  

  --*< The buffer.  
   type SDL_GPUBufferRegion is record
      buffer : access SDL_GPUBuffer;  -- /usr/local/include/SDL3/SDL_gpu.h:1524
      offset : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1525
      size : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1526
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1522

  --*< The starting byte within the buffer.  
  --*< The size in bytes of the region.  
  --*
  -- * A structure specifying the parameters of an indirect draw command.
  -- *
  -- * Note that the `first_vertex` and `first_instance` parameters are NOT
  -- * compatible with built-in vertex/instance ID variables in shaders (for
  -- * example, SV_VertexID); GPU APIs and shader languages do not define these
  -- * built-in variables consistently, so if your shader depends on them, the
  -- * only way to keep behavior consistent and portable is to always pass 0 for
  -- * the correlating parameter in the draw calls.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DrawGPUPrimitivesIndirect
  --  

  --*< The number of vertices to draw.  
   type SDL_GPUIndirectDrawCommand is record
      num_vertices : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1545
      num_instances : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1546
      first_vertex : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1547
      first_instance : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1548
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1543

  --*< The number of instances to draw.  
  --*< The index of the first vertex to draw.  
  --*< The ID of the first instance to draw.  
  --*
  -- * A structure specifying the parameters of an indexed indirect draw command.
  -- *
  -- * Note that the `first_vertex` and `first_instance` parameters are NOT
  -- * compatible with built-in vertex/instance ID variables in shaders (for
  -- * example, SV_VertexID); GPU APIs and shader languages do not define these
  -- * built-in variables consistently, so if your shader depends on them, the
  -- * only way to keep behavior consistent and portable is to always pass 0 for
  -- * the correlating parameter in the draw calls.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DrawGPUIndexedPrimitivesIndirect
  --  

  --*< The number of indices to draw per instance.  
   type SDL_GPUIndexedIndirectDrawCommand is record
      num_indices : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1567
      num_instances : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1568
      first_index : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1569
      vertex_offset : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1570
      first_instance : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1571
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1565

  --*< The number of instances to draw.  
  --*< The base index within the index buffer.  
  --*< The value added to the vertex index before indexing into the vertex buffer.  
  --*< The ID of the first instance to draw.  
  --*
  -- * A structure specifying the parameters of an indexed dispatch command.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DispatchGPUComputeIndirect
  --  

  --*< The number of local workgroups to dispatch in the X dimension.  
   type SDL_GPUIndirectDispatchCommand is record
      groupcount_x : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1583
      groupcount_y : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1584
      groupcount_z : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1585
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1581

  --*< The number of local workgroups to dispatch in the Y dimension.  
  --*< The number of local workgroups to dispatch in the Z dimension.  
  -- State structures  
  --*
  -- * A structure specifying the parameters of a sampler.
  -- *
  -- * Note that mip_lod_bias is a no-op for the Metal driver. For Metal, LOD bias
  -- * must be applied via shader instead.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUSampler
  -- * \sa SDL_GPUFilter
  -- * \sa SDL_GPUSamplerMipmapMode
  -- * \sa SDL_GPUSamplerAddressMode
  -- * \sa SDL_GPUCompareOp
  --  

  --*< The minification filter to apply to lookups.  
   type SDL_GPUSamplerCreateInfo is record
      min_filter : aliased SDL_GPUFilter;  -- /usr/local/include/SDL3/SDL_gpu.h:1606
      mag_filter : aliased SDL_GPUFilter;  -- /usr/local/include/SDL3/SDL_gpu.h:1607
      mipmap_mode : aliased SDL_GPUSamplerMipmapMode;  -- /usr/local/include/SDL3/SDL_gpu.h:1608
      address_mode_u : aliased SDL_GPUSamplerAddressMode;  -- /usr/local/include/SDL3/SDL_gpu.h:1609
      address_mode_v : aliased SDL_GPUSamplerAddressMode;  -- /usr/local/include/SDL3/SDL_gpu.h:1610
      address_mode_w : aliased SDL_GPUSamplerAddressMode;  -- /usr/local/include/SDL3/SDL_gpu.h:1611
      mip_lod_bias : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1612
      max_anisotropy : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1613
      compare_op : aliased SDL_GPUCompareOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1614
      min_lod : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1615
      max_lod : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1616
      enable_anisotropy : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1617
      enable_compare : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1618
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1619
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1620
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1622
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1604

  --*< The magnification filter to apply to lookups.  
  --*< The mipmap filter to apply to lookups.  
  --*< The addressing mode for U coordinates outside [0, 1).  
  --*< The addressing mode for V coordinates outside [0, 1).  
  --*< The addressing mode for W coordinates outside [0, 1).  
  --*< The bias to be added to mipmap LOD calculation.  
  --*< The anisotropy value clamp used by the sampler. If enable_anisotropy is false, this is ignored.  
  --*< The comparison operator to apply to fetched data before filtering.  
  --*< Clamps the minimum of the computed LOD value.  
  --*< Clamps the maximum of the computed LOD value.  
  --*< true to enable anisotropic filtering.  
  --*< true to enable comparison against a reference value during lookups.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A structure specifying the parameters of vertex buffers used in a graphics
  -- * pipeline.
  -- *
  -- * When you call SDL_BindGPUVertexBuffers, you specify the binding slots of
  -- * the vertex buffers. For example if you called SDL_BindGPUVertexBuffers with
  -- * a first_slot of 2 and num_bindings of 3, the binding slots 2, 3, 4 would be
  -- * used by the vertex buffers you pass in.
  -- *
  -- * Vertex attributes are linked to buffers via the buffer_slot field of
  -- * SDL_GPUVertexAttribute. For example, if an attribute has a buffer_slot of
  -- * 0, then that attribute belongs to the vertex buffer bound at slot 0.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUVertexAttribute
  -- * \sa SDL_GPUVertexInputRate
  --  

  --*< The binding slot of the vertex buffer.  
   type SDL_GPUVertexBufferDescription is record
      slot : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1645
      pitch : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1646
      input_rate : aliased SDL_GPUVertexInputRate;  -- /usr/local/include/SDL3/SDL_gpu.h:1647
      instance_step_rate : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1648
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1643

  --*< The size of a single element + the offset between elements.  
  --*< Whether attribute addressing is a function of the vertex index or instance index.  
  --*< Reserved for future use. Must be set to 0.  
  --*
  -- * A structure specifying a vertex attribute.
  -- *
  -- * All vertex attribute locations provided to an SDL_GPUVertexInputState must
  -- * be unique.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUVertexBufferDescription
  -- * \sa SDL_GPUVertexInputState
  -- * \sa SDL_GPUVertexElementFormat
  --  

  --*< The shader input location index.  
   type SDL_GPUVertexAttribute is record
      location : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1665
      buffer_slot : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1666
      format : aliased SDL_GPUVertexElementFormat;  -- /usr/local/include/SDL3/SDL_gpu.h:1667
      offset : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1668
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1663

  --*< The binding slot of the associated vertex buffer.  
  --*< The size and type of the attribute data.  
  --*< The byte offset of this attribute relative to the start of the vertex element.  
  --*
  -- * A structure specifying the parameters of a graphics pipeline vertex input
  -- * state.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUGraphicsPipelineCreateInfo
  -- * \sa SDL_GPUVertexBufferDescription
  -- * \sa SDL_GPUVertexAttribute
  --  

  --*< A pointer to an array of vertex buffer descriptions.  
   type SDL_GPUVertexInputState is record
      vertex_buffer_descriptions : access constant SDL_GPUVertexBufferDescription;  -- /usr/local/include/SDL3/SDL_gpu.h:1683
      num_vertex_buffers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1684
      vertex_attributes : access constant SDL_GPUVertexAttribute;  -- /usr/local/include/SDL3/SDL_gpu.h:1685
      num_vertex_attributes : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1686
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1681

  --*< The number of vertex buffer descriptions in the above array.  
  --*< A pointer to an array of vertex attribute descriptions.  
  --*< The number of vertex attribute descriptions in the above array.  
  --*
  -- * A structure specifying the stencil operation state of a graphics pipeline.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUDepthStencilState
  --  

  --*< The action performed on samples that fail the stencil test.  
   type SDL_GPUStencilOpState is record
      fail_op : aliased SDL_GPUStencilOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1698
      pass_op : aliased SDL_GPUStencilOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1699
      depth_fail_op : aliased SDL_GPUStencilOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1700
      compare_op : aliased SDL_GPUCompareOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1701
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1696

  --*< The action performed on samples that pass the depth and stencil tests.  
  --*< The action performed on samples that pass the stencil test and fail the depth test.  
  --*< The comparison operator used in the stencil test.  
  --*
  -- * A structure specifying the blend state of a color target.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUColorTargetDescription
  -- * \sa SDL_GPUBlendFactor
  -- * \sa SDL_GPUBlendOp
  -- * \sa SDL_GPUColorComponentFlags
  --  

  --*< The value to be multiplied by the source RGB value.  
   type SDL_GPUColorTargetBlendState is record
      src_color_blendfactor : aliased SDL_GPUBlendFactor;  -- /usr/local/include/SDL3/SDL_gpu.h:1716
      dst_color_blendfactor : aliased SDL_GPUBlendFactor;  -- /usr/local/include/SDL3/SDL_gpu.h:1717
      color_blend_op : aliased SDL_GPUBlendOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1718
      src_alpha_blendfactor : aliased SDL_GPUBlendFactor;  -- /usr/local/include/SDL3/SDL_gpu.h:1719
      dst_alpha_blendfactor : aliased SDL_GPUBlendFactor;  -- /usr/local/include/SDL3/SDL_gpu.h:1720
      alpha_blend_op : aliased SDL_GPUBlendOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1721
      color_write_mask : aliased SDL_GPUColorComponentFlags;  -- /usr/local/include/SDL3/SDL_gpu.h:1722
      enable_blend : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1723
      enable_color_write_mask : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1724
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1725
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1726
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1714

  --*< The value to be multiplied by the destination RGB value.  
  --*< The blend operation for the RGB components.  
  --*< The value to be multiplied by the source alpha.  
  --*< The value to be multiplied by the destination alpha.  
  --*< The blend operation for the alpha component.  
  --*< A bitmask specifying which of the RGBA components are enabled for writing. Writes to all channels if enable_color_write_mask is false.  
  --*< Whether blending is enabled for the color target.  
  --*< Whether the color write mask is enabled.  
  --*
  -- * A structure specifying code and metadata for creating a shader object.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  -- * \sa SDL_GPUShaderFormat
  -- * \sa SDL_GPUShaderStage
  --  

  --*< The size in bytes of the code pointed to.  
   type SDL_GPUShaderCreateInfo is record
      code_size : aliased stddef_h.size_t;  -- /usr/local/include/SDL3/SDL_gpu.h:1741
      code : access SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1742
      entrypoint : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_gpu.h:1743
      format : aliased SDL_GPUShaderFormat;  -- /usr/local/include/SDL3/SDL_gpu.h:1744
      stage : aliased SDL_GPUShaderStage;  -- /usr/local/include/SDL3/SDL_gpu.h:1745
      num_samplers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1746
      num_storage_textures : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1747
      num_storage_buffers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1748
      num_uniform_buffers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1749
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1751
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1739

  --*< A pointer to shader code.  
  --*< A pointer to a null-terminated UTF-8 string specifying the entry point function name for the shader.  
  --*< The format of the shader code.  
  --*< The stage the shader program corresponds to.  
  --*< The number of samplers defined in the shader.  
  --*< The number of storage textures defined in the shader.  
  --*< The number of storage buffers defined in the shader.  
  --*< The number of uniform buffers defined in the shader.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A structure specifying the parameters of a texture.
  -- *
  -- * Usage flags can be bitwise OR'd together for combinations of usages. Note
  -- * that certain usage combinations are invalid, for example SAMPLER and
  -- * GRAPHICS_STORAGE.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  -- * \sa SDL_GPUTextureType
  -- * \sa SDL_GPUTextureFormat
  -- * \sa SDL_GPUTextureUsageFlags
  -- * \sa SDL_GPUSampleCount
  --  

  --*< The base dimensionality of the texture.  
   type SDL_GPUTextureCreateInfo is record
      c_type : aliased SDL_GPUTextureType;  -- /usr/local/include/SDL3/SDL_gpu.h:1771
      format : aliased SDL_GPUTextureFormat;  -- /usr/local/include/SDL3/SDL_gpu.h:1772
      usage : aliased SDL_GPUTextureUsageFlags;  -- /usr/local/include/SDL3/SDL_gpu.h:1773
      width : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1774
      height : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1775
      layer_count_or_depth : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1776
      num_levels : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1777
      sample_count : aliased SDL_GPUSampleCount;  -- /usr/local/include/SDL3/SDL_gpu.h:1778
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1780
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1769

  --*< The pixel format of the texture.  
  --*< How the texture is intended to be used by the client.  
  --*< The width of the texture.  
  --*< The height of the texture.  
  --*< The layer count or depth of the texture. This value is treated as a layer count on 2D array textures, and as a depth value on 3D textures.  
  --*< The number of mip levels in the texture.  
  --*< The number of samples per texel. Only applies if the texture is used as a render target.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A structure specifying the parameters of a buffer.
  -- *
  -- * Usage flags can be bitwise OR'd together for combinations of usages. Note
  -- * that certain combinations are invalid, for example VERTEX and INDEX.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUBuffer
  -- * \sa SDL_GPUBufferUsageFlags
  --  

  --*< How the buffer is intended to be used by the client.  
   type SDL_GPUBufferCreateInfo is record
      usage : aliased SDL_GPUBufferUsageFlags;  -- /usr/local/include/SDL3/SDL_gpu.h:1796
      size : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1797
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1799
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1794

  --*< The size in bytes of the buffer.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A structure specifying the parameters of a transfer buffer.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTransferBuffer
  --  

  --*< How the transfer buffer is intended to be used by the client.  
   type SDL_GPUTransferBufferCreateInfo is record
      usage : aliased SDL_GPUTransferBufferUsage;  -- /usr/local/include/SDL3/SDL_gpu.h:1811
      size : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1812
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1814
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1809

  --*< The size in bytes of the transfer buffer.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  -- Pipeline state structures  
  --*
  -- * A structure specifying the parameters of the graphics pipeline rasterizer
  -- * state.
  -- *
  -- * Note that SDL_GPU_FILLMODE_LINE is not supported on many Android devices.
  -- * For those devices, the fill mode will automatically fall back to FILL.
  -- *
  -- * Also note that the D3D12 driver will enable depth clamping even if
  -- * enable_depth_clip is true. If you need this clamp+clip behavior, consider
  -- * enabling depth clip and then manually clamping depth in your fragment
  -- * shaders on Metal and Vulkan.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUGraphicsPipelineCreateInfo
  --  

  --*< Whether polygons will be filled in or drawn as lines.  
   type SDL_GPURasterizerState is record
      fill_mode : aliased SDL_GPUFillMode;  -- /usr/local/include/SDL3/SDL_gpu.h:1837
      cull_mode : aliased SDL_GPUCullMode;  -- /usr/local/include/SDL3/SDL_gpu.h:1838
      front_face : aliased SDL_GPUFrontFace;  -- /usr/local/include/SDL3/SDL_gpu.h:1839
      depth_bias_constant_factor : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1840
      depth_bias_clamp : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1841
      depth_bias_slope_factor : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:1842
      enable_depth_bias : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1843
      enable_depth_clip : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1844
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1845
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1846
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1835

  --*< The facing direction in which triangles will be culled.  
  --*< The vertex winding that will cause a triangle to be determined as front-facing.  
  --*< A scalar factor controlling the depth value added to each fragment.  
  --*< The maximum depth bias of a fragment.  
  --*< A scalar factor applied to a fragment's slope in depth calculations.  
  --*< true to bias fragment depth values.  
  --*< true to enable depth clip, false to enable depth clamp.  
  --*
  -- * A structure specifying the parameters of the graphics pipeline multisample
  -- * state.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUGraphicsPipelineCreateInfo
  --  

  --*< The number of samples to be used in rasterization.  
   type SDL_GPUMultisampleState is record
      sample_count : aliased SDL_GPUSampleCount;  -- /usr/local/include/SDL3/SDL_gpu.h:1859
      sample_mask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1860
      enable_mask : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1861
      enable_alpha_to_coverage : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1862
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1863
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1864
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1857

  --*< Reserved for future use. Must be set to 0.  
  --*< Reserved for future use. Must be set to false.  
  --*< true enables the alpha-to-coverage feature.  
  --*
  -- * A structure specifying the parameters of the graphics pipeline depth
  -- * stencil state.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUGraphicsPipelineCreateInfo
  --  

  --*< The comparison operator used for depth testing.  
   type SDL_GPUDepthStencilState is record
      compare_op : aliased SDL_GPUCompareOp;  -- /usr/local/include/SDL3/SDL_gpu.h:1877
      back_stencil_state : aliased SDL_GPUStencilOpState;  -- /usr/local/include/SDL3/SDL_gpu.h:1878
      front_stencil_state : aliased SDL_GPUStencilOpState;  -- /usr/local/include/SDL3/SDL_gpu.h:1879
      compare_mask : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1880
      write_mask : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1881
      enable_depth_test : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1882
      enable_depth_write : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1883
      enable_stencil_test : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1884
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1885
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1886
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1887
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1875

  --*< The stencil op state for back-facing triangles.  
  --*< The stencil op state for front-facing triangles.  
  --*< Selects the bits of the stencil values participating in the stencil test.  
  --*< Selects the bits of the stencil values updated by the stencil test.  
  --*< true enables the depth test.  
  --*< true enables depth writes. Depth writes are always disabled when enable_depth_test is false.  
  --*< true enables the stencil test.  
  --*
  -- * A structure specifying the parameters of color targets used in a graphics
  -- * pipeline.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUGraphicsPipelineTargetInfo
  --  

  --*< The pixel format of the texture to be used as a color target.  
   type SDL_GPUColorTargetDescription is record
      format : aliased SDL_GPUTextureFormat;  -- /usr/local/include/SDL3/SDL_gpu.h:1900
      blend_state : aliased SDL_GPUColorTargetBlendState;  -- /usr/local/include/SDL3/SDL_gpu.h:1901
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1898

  --*< The blend state to be used for the color target.  
  --*
  -- * A structure specifying the descriptions of render targets used in a
  -- * graphics pipeline.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPUGraphicsPipelineCreateInfo
  -- * \sa SDL_GPUColorTargetDescription
  -- * \sa SDL_GPUTextureFormat
  --  

  --*< A pointer to an array of color target descriptions.  
   type SDL_GPUGraphicsPipelineTargetInfo is record
      color_target_descriptions : access constant SDL_GPUColorTargetDescription;  -- /usr/local/include/SDL3/SDL_gpu.h:1916
      num_color_targets : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1917
      depth_stencil_format : aliased SDL_GPUTextureFormat;  -- /usr/local/include/SDL3/SDL_gpu.h:1918
      has_depth_stencil_target : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:1919
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1920
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1921
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1922
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1914

  --*< The number of color target descriptions in the above array.  
  --*< The pixel format of the depth-stencil target. Ignored if has_depth_stencil_target is false.  
  --*< true specifies that the pipeline uses a depth-stencil target.  
  --*
  -- * A structure specifying the parameters of a graphics pipeline state.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  -- * \sa SDL_GPUShader
  -- * \sa SDL_GPUVertexInputState
  -- * \sa SDL_GPUPrimitiveType
  -- * \sa SDL_GPURasterizerState
  -- * \sa SDL_GPUMultisampleState
  -- * \sa SDL_GPUDepthStencilState
  -- * \sa SDL_GPUGraphicsPipelineTargetInfo
  --  

  --*< The vertex shader used by the graphics pipeline.  
   type SDL_GPUGraphicsPipelineCreateInfo is record
      vertex_shader : access SDL_GPUShader;  -- /usr/local/include/SDL3/SDL_gpu.h:1941
      fragment_shader : access SDL_GPUShader;  -- /usr/local/include/SDL3/SDL_gpu.h:1942
      vertex_input_state : aliased SDL_GPUVertexInputState;  -- /usr/local/include/SDL3/SDL_gpu.h:1943
      primitive_type : aliased SDL_GPUPrimitiveType;  -- /usr/local/include/SDL3/SDL_gpu.h:1944
      rasterizer_state : aliased SDL_GPURasterizerState;  -- /usr/local/include/SDL3/SDL_gpu.h:1945
      multisample_state : aliased SDL_GPUMultisampleState;  -- /usr/local/include/SDL3/SDL_gpu.h:1946
      depth_stencil_state : aliased SDL_GPUDepthStencilState;  -- /usr/local/include/SDL3/SDL_gpu.h:1947
      target_info : aliased SDL_GPUGraphicsPipelineTargetInfo;  -- /usr/local/include/SDL3/SDL_gpu.h:1948
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1950
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1939

  --*< The fragment shader used by the graphics pipeline.  
  --*< The vertex layout of the graphics pipeline.  
  --*< The primitive topology of the graphics pipeline.  
  --*< The rasterizer state of the graphics pipeline.  
  --*< The multisample state of the graphics pipeline.  
  --*< The depth-stencil state of the graphics pipeline.  
  --*< Formats and blend modes for the render targets of the graphics pipeline.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A structure specifying the parameters of a compute pipeline state.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUComputePipeline
  -- * \sa SDL_GPUShaderFormat
  --  

  --*< The size in bytes of the compute shader code pointed to.  
   type SDL_GPUComputePipelineCreateInfo is record
      code_size : aliased stddef_h.size_t;  -- /usr/local/include/SDL3/SDL_gpu.h:1963
      code : access SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:1964
      entrypoint : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_gpu.h:1965
      format : aliased SDL_GPUShaderFormat;  -- /usr/local/include/SDL3/SDL_gpu.h:1966
      num_samplers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1967
      num_readonly_storage_textures : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1968
      num_readonly_storage_buffers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1969
      num_readwrite_storage_textures : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1970
      num_readwrite_storage_buffers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1971
      num_uniform_buffers : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1972
      threadcount_x : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1973
      threadcount_y : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1974
      threadcount_z : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:1975
      props : aliased SDL3_SDL_properties_h.SDL_PropertiesID;  -- /usr/local/include/SDL3/SDL_gpu.h:1977
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:1961

  --*< A pointer to compute shader code.  
  --*< A pointer to a null-terminated UTF-8 string specifying the entry point function name for the shader.  
  --*< The format of the compute shader code.  
  --*< The number of samplers defined in the shader.  
  --*< The number of readonly storage textures defined in the shader.  
  --*< The number of readonly storage buffers defined in the shader.  
  --*< The number of read-write storage textures defined in the shader.  
  --*< The number of read-write storage buffers defined in the shader.  
  --*< The number of uniform buffers defined in the shader.  
  --*< The number of threads in the X dimension. This should match the value in the shader.  
  --*< The number of threads in the Y dimension. This should match the value in the shader.  
  --*< The number of threads in the Z dimension. This should match the value in the shader.  
  --*< A properties ID for extensions. Should be 0 if no extensions are needed.  
  --*
  -- * A structure specifying the parameters of a color target used by a render
  -- * pass.
  -- *
  -- * The load_op field determines what is done with the texture at the beginning
  -- * of the render pass.
  -- *
  -- * - LOAD: Loads the data currently in the texture. Not recommended for
  -- *   multisample textures as it requires significant memory bandwidth.
  -- * - CLEAR: Clears the texture to a single color.
  -- * - DONT_CARE: The driver will do whatever it wants with the texture memory.
  -- *   This is a good option if you know that every single pixel will be touched
  -- *   in the render pass.
  -- *
  -- * The store_op field determines what is done with the color results of the
  -- * render pass.
  -- *
  -- * - STORE: Stores the results of the render pass in the texture. Not
  -- *   recommended for multisample textures as it requires significant memory
  -- *   bandwidth.
  -- * - DONT_CARE: The driver will do whatever it wants with the texture memory.
  -- *   This is often a good option for depth/stencil textures.
  -- * - RESOLVE: Resolves a multisample texture into resolve_texture, which must
  -- *   have a sample count of 1. Then the driver may discard the multisample
  -- *   texture memory. This is the most performant method of resolving a
  -- *   multisample target.
  -- * - RESOLVE_AND_STORE: Resolves a multisample texture into the
  -- *   resolve_texture, which must have a sample count of 1. Then the driver
  -- *   stores the multisample texture's contents. Not recommended as it requires
  -- *   significant memory bandwidth.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPURenderPass
  -- * \sa SDL_FColor
  --  

  --*< The texture that will be used as a color target by a render pass.  
   type SDL_GPUColorTargetInfo is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:2018
      mip_level : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2019
      layer_or_depth_plane : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2020
      clear_color : aliased SDL3_SDL_pixels_h.SDL_FColor;  -- /usr/local/include/SDL3/SDL_gpu.h:2021
      load_op : aliased SDL_GPULoadOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2022
      store_op : aliased SDL_GPUStoreOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2023
      resolve_texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:2024
      resolve_mip_level : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2025
      resolve_layer : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2026
      cycle : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:2027
      cycle_resolve_texture : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:2028
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2029
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2030
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2016

  --*< The mip level to use as a color target.  
  --*< The layer index or depth plane to use as a color target. This value is treated as a layer index on 2D array and cube textures, and as a depth plane on 3D textures.  
  --*< The color to clear the color target to at the start of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used.  
  --*< What is done with the contents of the color target at the beginning of the render pass.  
  --*< What is done with the results of the render pass.  
  --*< The texture that will receive the results of a multisample resolve operation. Ignored if a RESOLVE* store_op is not used.  
  --*< The mip level of the resolve texture to use for the resolve operation. Ignored if a RESOLVE* store_op is not used.  
  --*< The layer index of the resolve texture to use for the resolve operation. Ignored if a RESOLVE* store_op is not used.  
  --*< true cycles the texture if the texture is bound and load_op is not LOAD  
  --*< true cycles the resolve texture if the resolve texture is bound. Ignored if a RESOLVE* store_op is not used.  
  --*
  -- * A structure specifying the parameters of a depth-stencil target used by a
  -- * render pass.
  -- *
  -- * The load_op field determines what is done with the depth contents of the
  -- * texture at the beginning of the render pass.
  -- *
  -- * - LOAD: Loads the depth values currently in the texture.
  -- * - CLEAR: Clears the texture to a single depth.
  -- * - DONT_CARE: The driver will do whatever it wants with the memory. This is
  -- *   a good option if you know that every single pixel will be touched in the
  -- *   render pass.
  -- *
  -- * The store_op field determines what is done with the depth results of the
  -- * render pass.
  -- *
  -- * - STORE: Stores the depth results in the texture.
  -- * - DONT_CARE: The driver will do whatever it wants with the depth results.
  -- *   This is often a good option for depth/stencil textures that don't need to
  -- *   be reused again.
  -- *
  -- * The stencil_load_op field determines what is done with the stencil contents
  -- * of the texture at the beginning of the render pass.
  -- *
  -- * - LOAD: Loads the stencil values currently in the texture.
  -- * - CLEAR: Clears the stencil values to a single value.
  -- * - DONT_CARE: The driver will do whatever it wants with the memory. This is
  -- *   a good option if you know that every single pixel will be touched in the
  -- *   render pass.
  -- *
  -- * The stencil_store_op field determines what is done with the stencil results
  -- * of the render pass.
  -- *
  -- * - STORE: Stores the stencil results in the texture.
  -- * - DONT_CARE: The driver will do whatever it wants with the stencil results.
  -- *   This is often a good option for depth/stencil textures that don't need to
  -- *   be reused again.
  -- *
  -- * Note that depth/stencil targets do not support multisample resolves.
  -- *
  -- * Due to ABI limitations, depth textures with more than 255 layers are not
  -- * supported.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPURenderPass
  --  

  --*< The texture that will be used as the depth stencil target by the render pass.  
   type SDL_GPUDepthStencilTargetInfo is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:2082
      clear_depth : aliased float;  -- /usr/local/include/SDL3/SDL_gpu.h:2083
      load_op : aliased SDL_GPULoadOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2084
      store_op : aliased SDL_GPUStoreOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2085
      stencil_load_op : aliased SDL_GPULoadOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2086
      stencil_store_op : aliased SDL_GPUStoreOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2087
      cycle : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:2088
      clear_stencil : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2089
      mip_level : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2090
      layer : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2091
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2080

  --*< The value to clear the depth component to at the beginning of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used.  
  --*< What is done with the depth contents at the beginning of the render pass.  
  --*< What is done with the depth results of the render pass.  
  --*< What is done with the stencil contents at the beginning of the render pass.  
  --*< What is done with the stencil results of the render pass.  
  --*< true cycles the texture if the texture is bound and any load ops are not LOAD  
  --*< The value to clear the stencil component to at the beginning of the render pass. Ignored if SDL_GPU_LOADOP_CLEAR is not used.  
  --*< The mip level to use as the depth stencil target.  
  --*< The layer index to use as the depth stencil target.  
  --*
  -- * A structure containing parameters for a blit command.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BlitGPUTexture
  --  

  --*< The source region for the blit.  
   type SDL_GPUBlitInfo is record
      source : aliased SDL_GPUBlitRegion;  -- /usr/local/include/SDL3/SDL_gpu.h:2102
      destination : aliased SDL_GPUBlitRegion;  -- /usr/local/include/SDL3/SDL_gpu.h:2103
      load_op : aliased SDL_GPULoadOp;  -- /usr/local/include/SDL3/SDL_gpu.h:2104
      clear_color : aliased SDL3_SDL_pixels_h.SDL_FColor;  -- /usr/local/include/SDL3/SDL_gpu.h:2105
      flip_mode : aliased SDL3_SDL_surface_h.SDL_FlipMode;  -- /usr/local/include/SDL3/SDL_gpu.h:2106
      filter : aliased SDL_GPUFilter;  -- /usr/local/include/SDL3/SDL_gpu.h:2107
      cycle : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:2108
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2109
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2110
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2111
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2101

  --*< The destination region for the blit.  
  --*< What is done with the contents of the destination before the blit.  
  --*< The color to clear the destination region to before the blit. Ignored if load_op is not SDL_GPU_LOADOP_CLEAR.  
  --*< The flip mode for the source region.  
  --*< The filter mode used when blitting.  
  --*< true cycles the destination texture if it is already bound.  
  -- Binding structs  
  --*
  -- * A structure specifying parameters in a buffer binding call.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BindGPUVertexBuffers
  -- * \sa SDL_BindGPUIndexBuffer
  --  

  --*< The buffer to bind. Must have been created with SDL_GPU_BUFFERUSAGE_VERTEX for SDL_BindGPUVertexBuffers, or SDL_GPU_BUFFERUSAGE_INDEX for SDL_BindGPUIndexBuffer.  
   type SDL_GPUBufferBinding is record
      buffer : access SDL_GPUBuffer;  -- /usr/local/include/SDL3/SDL_gpu.h:2126
      offset : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2127
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2124

  --*< The starting byte of the data to bind in the buffer.  
  --*
  -- * A structure specifying parameters in a sampler binding call.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BindGPUVertexSamplers
  -- * \sa SDL_BindGPUFragmentSamplers
  -- * \sa SDL_GPUTexture
  -- * \sa SDL_GPUSampler
  --  

  --*< The texture to bind. Must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.  
   type SDL_GPUTextureSamplerBinding is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:2142
      sampler : access SDL_GPUSampler;  -- /usr/local/include/SDL3/SDL_gpu.h:2143
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2140

  --*< The sampler to bind.  
  --*
  -- * A structure specifying parameters related to binding buffers in a compute
  -- * pass.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPUComputePass
  --  

  --*< The buffer to bind. Must have been created with SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_WRITE.  
   type SDL_GPUStorageBufferReadWriteBinding is record
      buffer : access SDL_GPUBuffer;  -- /usr/local/include/SDL3/SDL_gpu.h:2156
      cycle : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:2157
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2158
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2159
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2160
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2154

  --*< true cycles the buffer if it is already bound.  
  --*
  -- * A structure specifying parameters related to binding textures in a compute
  -- * pass.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BeginGPUComputePass
  --  

  --*< The texture to bind. Must have been created with SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_WRITE or SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE.  
   type SDL_GPUStorageTextureReadWriteBinding is record
      texture : access SDL_GPUTexture;  -- /usr/local/include/SDL3/SDL_gpu.h:2173
      mip_level : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2174
      layer : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2175
      cycle : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_gpu.h:2176
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2177
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2178
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_gpu.h:2179
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2171

  --*< The mip level index to bind.  
  --*< The layer index to bind.  
  --*< true cycles the texture if it is already bound.  
  -- Functions  
  -- Device  
  --*
  -- * Checks for GPU runtime support.
  -- *
  -- * \param format_flags a bitflag indicating which shader formats the app is
  -- *                     able to provide.
  -- * \param name the preferred GPU driver, or NULL to let SDL pick the optimal
  -- *             driver.
  -- * \returns true if supported, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUDevice
  --  

   function SDL_GPUSupportsShaderFormats (format_flags : SDL_GPUShaderFormat; name : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:2199
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GPUSupportsShaderFormats";

  --*
  -- * Checks for GPU runtime support.
  -- *
  -- * \param props the properties to use.
  -- * \returns true if supported, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUDeviceWithProperties
  --  

   function SDL_GPUSupportsProperties (props : SDL3_SDL_properties_h.SDL_PropertiesID) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:2213
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GPUSupportsProperties";

  --*
  -- * Creates a GPU context.
  -- *
  -- * The GPU driver name can be one of the following:
  -- *
  -- * - "vulkan": [Vulkan](CategoryGPU#vulkan)
  -- * - "direct3d12": [D3D12](CategoryGPU#d3d12)
  -- * - "metal": [Metal](CategoryGPU#metal)
  -- * - NULL: let SDL pick the optimal driver
  -- *
  -- * \param format_flags a bitflag indicating which shader formats the app is
  -- *                     able to provide.
  -- * \param debug_mode enable debug mode properties and validations.
  -- * \param name the preferred GPU driver, or NULL to let SDL pick the optimal
  -- *             driver.
  -- * \returns a GPU context on success or NULL on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUDeviceWithProperties
  -- * \sa SDL_GetGPUShaderFormats
  -- * \sa SDL_GetGPUDeviceDriver
  -- * \sa SDL_DestroyGPUDevice
  -- * \sa SDL_GPUSupportsShaderFormats
  --  

   function SDL_CreateGPUDevice
     (format_flags : SDL_GPUShaderFormat;
      debug_mode : Extensions.bool;
      name : Interfaces.C.Strings.chars_ptr) return access SDL_GPUDevice  -- /usr/local/include/SDL3/SDL_gpu.h:2242
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUDevice";

  --*
  -- * Creates a GPU context.
  -- *
  -- * These are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_DEBUGMODE_BOOLEAN`: enable debug mode
  -- *   properties and validations, defaults to true.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_PREFERLOWPOWER_BOOLEAN`: enable to prefer
  -- *   energy efficiency over maximum GPU performance, defaults to false.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_VERBOSE_BOOLEAN`: enable to automatically log
  -- *   useful debug information on device creation, defaults to true.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_NAME_STRING`: the name of the GPU driver to
  -- *   use, if a specific one is desired.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_CLIP_DISTANCE_BOOLEAN`: Enable Vulkan
  -- *   device feature shaderClipDistance. If disabled, clip distances are not
  -- *   supported in shader code: gl_ClipDistance[] built-ins of GLSL,
  -- *   SV_ClipDistance0/1 semantics of HLSL and [[clip_distance]] attribute of
  -- *   Metal. Disabling optional features allows the application to run on some
  -- *   older Android devices. Defaults to true.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_DEPTH_CLAMPING_BOOLEAN`: Enable
  -- *   Vulkan device feature depthClamp. If disabled, there is no depth clamp
  -- *   support and enable_depth_clip in SDL_GPURasterizerState must always be
  -- *   set to true. Disabling optional features allows the application to run on
  -- *   some older Android devices. Defaults to true.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_INDIRECT_DRAW_FIRST_INSTANCE_BOOLEAN`:
  -- *   Enable Vulkan device feature drawIndirectFirstInstance. If disabled, the
  -- *   argument first_instance of SDL_GPUIndirectDrawCommand must be set to
  -- *   zero. Disabling optional features allows the application to run on some
  -- *   older Android devices. Defaults to true.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_FEATURE_ANISOTROPY_BOOLEAN`: Enable Vulkan
  -- *   device feature samplerAnisotropy. If disabled, enable_anisotropy of
  -- *   SDL_GPUSamplerCreateInfo must be set to false. Disabling optional
  -- *   features allows the application to run on some older Android devices.
  -- *   Defaults to true.
  -- *
  -- * These are the current shader format properties:
  -- *
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_PRIVATE_BOOLEAN`: The app is able to
  -- *   provide shaders for an NDA platform.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_SPIRV_BOOLEAN`: The app is able to
  -- *   provide SPIR-V shaders if applicable.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXBC_BOOLEAN`: The app is able to
  -- *   provide DXBC shaders if applicable
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_DXIL_BOOLEAN`: The app is able to
  -- *   provide DXIL shaders if applicable.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_MSL_BOOLEAN`: The app is able to
  -- *   provide MSL shaders if applicable.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_SHADERS_METALLIB_BOOLEAN`: The app is able to
  -- *   provide Metal shader libraries if applicable.
  -- *
  -- * With the D3D12 backend:
  -- *
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING`: the prefix to
  -- *   use for all vertex semantics, default is "TEXCOORD".
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_D3D12_ALLOW_FEWER_RESOURCE_SLOTS_BOOLEAN`: By
  -- *   default, Resourcing Binding Tier 2 is required for D3D12 support.
  -- *   However, an application can set this property to true to enable Tier 1
  -- *   support, if (and only if) the application uses 8 or fewer storage
  -- *   resources across all shader stages. As of writing, this property is
  -- *   useful for targeting Intel Haswell and Broadwell GPUs; other hardware
  -- *   either supports Tier 2 Resource Binding or does not support D3D12 in any
  -- *   capacity. Defaults to false.
  -- *
  -- * With the Vulkan backend:
  -- *
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_VULKAN_REQUIRE_HARDWARE_ACCELERATION_BOOLEAN`:
  -- *   By default, Vulkan device enumeration includes drivers of all types,
  -- *   including software renderers (for example, the Lavapipe Mesa driver).
  -- *   This can be useful if your application _requires_ SDL_GPU, but if you can
  -- *   provide your own fallback renderer (for example, an OpenGL renderer) this
  -- *   property can be set to true. Defaults to false.
  -- * - `SDL_PROP_GPU_DEVICE_CREATE_VULKAN_OPTIONS_POINTER`: a pointer to an
  -- *   SDL_GPUVulkanOptions structure to be processed during device creation.
  -- *   This allows configuring a variety of Vulkan-specific options such as
  -- *   increasing the API version and opting into extensions aside from the
  -- *   minimal set SDL requires.
  -- *
  -- * \param props the properties to use.
  -- * \returns a GPU context on success or NULL on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetGPUShaderFormats
  -- * \sa SDL_GetGPUDeviceDriver
  -- * \sa SDL_DestroyGPUDevice
  -- * \sa SDL_GPUSupportsProperties
  --  

   function SDL_CreateGPUDeviceWithProperties (props : SDL3_SDL_properties_h.SDL_PropertiesID) return access SDL_GPUDevice  -- /usr/local/include/SDL3/SDL_gpu.h:2335
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUDeviceWithProperties";

  --*
  -- * A structure specifying additional options when using Vulkan.
  -- *
  -- * When no such structure is provided, SDL will use Vulkan API version 1.0 and
  -- * a minimal set of features. The requested API version influences how the
  -- * feature_list is processed by SDL. When requesting API version 1.0, the
  -- * feature_list is ignored. Only the vulkan_10_physical_device_features and
  -- * the extension lists are used. When requesting API version 1.1, the
  -- * feature_list is scanned for feature structures introduced in Vulkan 1.1.
  -- * When requesting Vulkan 1.2 or higher, the feature_list is additionally
  -- * scanned for compound feature structs such as
  -- * VkPhysicalDeviceVulkan11Features. The device and instance extension lists,
  -- * as well as vulkan_10_physical_device_features, are always processed.
  -- *
  -- * \since This struct is available since SDL 3.4.0.
  --  

  --*< The Vulkan API version to request for the instance. Use Vulkan's VK_MAKE_VERSION or VK_MAKE_API_VERSION.  
   type SDL_GPUVulkanOptions is record
      vulkan_api_version : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2376
      feature_list : System.Address;  -- /usr/local/include/SDL3/SDL_gpu.h:2377
      vulkan_10_physical_device_features : System.Address;  -- /usr/local/include/SDL3/SDL_gpu.h:2378
      device_extension_count : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2379
      device_extension_names : System.Address;  -- /usr/local/include/SDL3/SDL_gpu.h:2380
      instance_extension_count : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_gpu.h:2381
      instance_extension_names : System.Address;  -- /usr/local/include/SDL3/SDL_gpu.h:2382
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_gpu.h:2374

  --*< Pointer to the first element of a chain of Vulkan feature structs. (Requires API version 1.1 or higher.) 
  --*< Pointer to a VkPhysicalDeviceFeatures struct to enable additional Vulkan 1.0 features.  
  --*< Number of additional device extensions to require.  
  --*< Pointer to a list of additional device extensions to require.  
  --*< Number of additional instance extensions to require.  
  --*< Pointer to a list of additional instance extensions to require.  
  --*
  -- * Destroys a GPU context previously returned by SDL_CreateGPUDevice.
  -- *
  -- * \param device a GPU Context to destroy.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUDevice
  --  

   procedure SDL_DestroyGPUDevice (device : access SDL_GPUDevice)  -- /usr/local/include/SDL3/SDL_gpu.h:2394
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyGPUDevice";

  --*
  -- * Get the number of GPU drivers compiled into SDL.
  -- *
  -- * \returns the number of built in GPU drivers.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetGPUDriver
  --  

   function SDL_GetNumGPUDrivers return int  -- /usr/local/include/SDL3/SDL_gpu.h:2405
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumGPUDrivers";

  --*
  -- * Get the name of a built in GPU driver.
  -- *
  -- * The GPU drivers are presented in the order in which they are normally
  -- * checked during initialization.
  -- *
  -- * The names of drivers are all simple, low-ASCII identifiers, like "vulkan",
  -- * "metal" or "direct3d12". These never have Unicode characters, and are not
  -- * meant to be proper names.
  -- *
  -- * \param index the index of a GPU driver.
  -- * \returns the name of the GPU driver with the given **index**.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetNumGPUDrivers
  --  

   function SDL_GetGPUDriver (index : int) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_gpu.h:2424
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPUDriver";

  --*
  -- * Returns the name of the backend used to create this GPU context.
  -- *
  -- * \param device a GPU context to query.
  -- * \returns the name of the device's driver, or NULL on error.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetGPUDeviceDriver (device : access SDL_GPUDevice) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_gpu.h:2434
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPUDeviceDriver";

  --*
  -- * Returns the supported shader formats for this GPU context.
  -- *
  -- * \param device a GPU context to query.
  -- * \returns a bitflag indicating which shader formats the driver is able to
  -- *          consume.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetGPUShaderFormats (device : access SDL_GPUDevice) return SDL_GPUShaderFormat  -- /usr/local/include/SDL3/SDL_gpu.h:2445
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPUShaderFormats";

  --*
  -- * Get the properties associated with a GPU device.
  -- *
  -- * All properties are optional and may differ between GPU backends and SDL
  -- * versions.
  -- *
  -- * The following properties are provided by SDL:
  -- *
  -- * `SDL_PROP_GPU_DEVICE_NAME_STRING`: Contains the name of the underlying
  -- * device as reported by the system driver. This string has no standardized
  -- * format, is highly inconsistent between hardware devices and drivers, and is
  -- * able to change at any time. Do not attempt to parse this string as it is
  -- * bound to fail at some point in the future when system drivers are updated,
  -- * new hardware devices are introduced, or when SDL adds new GPU backends or
  -- * modifies existing ones.
  -- *
  -- * Strings that have been found in the wild include:
  -- *
  -- * - GTX 970
  -- * - GeForce GTX 970
  -- * - NVIDIA GeForce GTX 970
  -- * - Microsoft Direct3D12 (NVIDIA GeForce GTX 970)
  -- * - NVIDIA Graphics Device
  -- * - GeForce GPU
  -- * - P106-100
  -- * - AMD 15D8:C9
  -- * - AMD Custom GPU 0405
  -- * - AMD Radeon (TM) Graphics
  -- * - ASUS Radeon RX 470 Series
  -- * - Intel(R) Arc(tm) A380 Graphics (DG2)
  -- * - Virtio-GPU Venus (NVIDIA TITAN V)
  -- * - SwiftShader Device (LLVM 16.0.0)
  -- * - llvmpipe (LLVM 15.0.4, 256 bits)
  -- * - Microsoft Basic Render Driver
  -- * - unknown device
  -- *
  -- * The above list shows that the same device can have different formats, the
  -- * vendor name may or may not appear in the string, the included vendor name
  -- * may not be the vendor of the chipset on the device, some manufacturers
  -- * include pseudo-legal marks while others don't, some devices may not use a
  -- * marketing name in the string, the device string may be wrapped by the name
  -- * of a translation interface, the device may be emulated in software, or the
  -- * string may contain generic text that does not identify the device at all.
  -- *
  -- * `SDL_PROP_GPU_DEVICE_DRIVER_NAME_STRING`: Contains the self-reported name
  -- * of the underlying system driver.
  -- *
  -- * Strings that have been found in the wild include:
  -- *
  -- * - Intel Corporation
  -- * - Intel open-source Mesa driver
  -- * - Qualcomm Technologies Inc. Adreno Vulkan Driver
  -- * - MoltenVK
  -- * - Mali-G715
  -- * - venus
  -- *
  -- * `SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING`: Contains the self-reported
  -- * version of the underlying system driver. This is a relatively short version
  -- * string in an unspecified format. If SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING
  -- * is available then that property should be preferred over this one as it may
  -- * contain additional information that is useful for identifying the exact
  -- * driver version used.
  -- *
  -- * Strings that have been found in the wild include:
  -- *
  -- * - 53.0.0
  -- * - 0.405.2463
  -- * - 32.0.15.6614
  -- *
  -- * `SDL_PROP_GPU_DEVICE_DRIVER_INFO_STRING`: Contains the detailed version
  -- * information of the underlying system driver as reported by the driver. This
  -- * is an arbitrary string with no standardized format and it may contain
  -- * newlines. This property should be preferred over
  -- * SDL_PROP_GPU_DEVICE_DRIVER_VERSION_STRING if it is available as it usually
  -- * contains the same information but in a format that is easier to read.
  -- *
  -- * Strings that have been found in the wild include:
  -- *
  -- * - 101.6559
  -- * - 1.2.11
  -- * - Mesa 21.2.2 (LLVM 12.0.1)
  -- * - Mesa 22.2.0-devel (git-f226222 2022-04-14 impish-oibaf-ppa)
  -- * - v1.r53p0-00eac0.824c4f31403fb1fbf8ee1042422c2129
  -- *
  -- * This string has also been observed to be a multiline string (which has a
  -- * trailing newline):
  -- *
  -- * ```
  -- * Driver Build: 85da404, I46ff5fc46f, 1606794520
  -- * Date: 11/30/20
  -- * Compiler Version: EV031.31.04.01
  -- * Driver Branch: promo490_3_Google
  -- * ```
  -- *
  -- * \param device a GPU context to query.
  -- * \returns a valid property ID on success or 0 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_GetGPUDeviceProperties (device : access SDL_GPUDevice) return SDL3_SDL_properties_h.SDL_PropertiesID  -- /usr/local/include/SDL3/SDL_gpu.h:2549
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPUDeviceProperties";

  -- State Creation  
  --*
  -- * Creates a pipeline object to be used in a compute workflow.
  -- *
  -- * Shader resource bindings must be authored to follow a particular order
  -- * depending on the shader format.
  -- *
  -- * For SPIR-V shaders, use the following resource sets:
  -- *
  -- * - 0: Sampled textures, followed by read-only storage textures, followed by
  -- *   read-only storage buffers
  -- * - 1: Read-write storage textures, followed by read-write storage buffers
  -- * - 2: Uniform buffers
  -- *
  -- * For DXBC and DXIL shaders, use the following register order:
  -- *
  -- * - (t[n], space0): Sampled textures, followed by read-only storage textures,
  -- *   followed by read-only storage buffers
  -- * - (u[n], space1): Read-write storage textures, followed by read-write
  -- *   storage buffers
  -- * - (b[n], space2): Uniform buffers
  -- *
  -- * For MSL/metallib, use the following order:
  -- *
  -- * - [[buffer]]: Uniform buffers, followed by read-only storage buffers,
  -- *   followed by read-write storage buffers
  -- * - [[texture]]: Sampled textures, followed by read-only storage textures,
  -- *   followed by read-write storage textures
  -- *
  -- * There are optional properties that can be provided through `props`. These
  -- * are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_COMPUTEPIPELINE_CREATE_NAME_STRING`: a name that can be
  -- *   displayed in debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the compute pipeline to
  -- *                   create.
  -- * \returns a compute pipeline object on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BindGPUComputePipeline
  -- * \sa SDL_ReleaseGPUComputePipeline
  --  

   function SDL_CreateGPUComputePipeline (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUComputePipelineCreateInfo) return access SDL_GPUComputePipeline  -- /usr/local/include/SDL3/SDL_gpu.h:2604
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUComputePipeline";

  --*
  -- * Creates a pipeline object to be used in a graphics workflow.
  -- *
  -- * There are optional properties that can be provided through `props`. These
  -- * are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_GRAPHICSPIPELINE_CREATE_NAME_STRING`: a name that can be
  -- *   displayed in debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the graphics pipeline to
  -- *                   create.
  -- * \returns a graphics pipeline object on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  -- * \sa SDL_BindGPUGraphicsPipeline
  -- * \sa SDL_ReleaseGPUGraphicsPipeline
  --  

   function SDL_CreateGPUGraphicsPipeline (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUGraphicsPipelineCreateInfo) return access SDL_GPUGraphicsPipeline  -- /usr/local/include/SDL3/SDL_gpu.h:2631
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUGraphicsPipeline";

  --*
  -- * Creates a sampler object to be used when binding textures in a graphics
  -- * workflow.
  -- *
  -- * There are optional properties that can be provided through `props`. These
  -- * are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_SAMPLER_CREATE_NAME_STRING`: a name that can be displayed
  -- *   in debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the sampler to create.
  -- * \returns a sampler object on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_BindGPUVertexSamplers
  -- * \sa SDL_BindGPUFragmentSamplers
  -- * \sa SDL_ReleaseGPUSampler
  --  

   function SDL_CreateGPUSampler (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUSamplerCreateInfo) return access SDL_GPUSampler  -- /usr/local/include/SDL3/SDL_gpu.h:2658
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUSampler";

  --*
  -- * Creates a shader to be used when creating a graphics pipeline.
  -- *
  -- * Shader resource bindings must be authored to follow a particular order
  -- * depending on the shader format.
  -- *
  -- * For SPIR-V shaders, use the following resource sets:
  -- *
  -- * For vertex shaders:
  -- *
  -- * - 0: Sampled textures, followed by storage textures, followed by storage
  -- *   buffers
  -- * - 1: Uniform buffers
  -- *
  -- * For fragment shaders:
  -- *
  -- * - 2: Sampled textures, followed by storage textures, followed by storage
  -- *   buffers
  -- * - 3: Uniform buffers
  -- *
  -- * For DXBC and DXIL shaders, use the following register order:
  -- *
  -- * For vertex shaders:
  -- *
  -- * - (t[n], space0): Sampled textures, followed by storage textures, followed
  -- *   by storage buffers
  -- * - (s[n], space0): Samplers with indices corresponding to the sampled
  -- *   textures
  -- * - (b[n], space1): Uniform buffers
  -- *
  -- * For pixel shaders:
  -- *
  -- * - (t[n], space2): Sampled textures, followed by storage textures, followed
  -- *   by storage buffers
  -- * - (s[n], space2): Samplers with indices corresponding to the sampled
  -- *   textures
  -- * - (b[n], space3): Uniform buffers
  -- *
  -- * For MSL/metallib, use the following order:
  -- *
  -- * - [[texture]]: Sampled textures, followed by storage textures
  -- * - [[sampler]]: Samplers with indices corresponding to the sampled textures
  -- * - [[buffer]]: Uniform buffers, followed by storage buffers. Vertex buffer 0
  -- *   is bound at [[buffer(14)]], vertex buffer 1 at [[buffer(15)]], and so on.
  -- *   Rather than manually authoring vertex buffer indices, use the
  -- *   [[stage_in]] attribute which will automatically use the vertex input
  -- *   information from the SDL_GPUGraphicsPipeline.
  -- *
  -- * Shader semantics other than system-value semantics do not matter in D3D12
  -- * and for ease of use the SDL implementation assumes that non system-value
  -- * semantics will all be TEXCOORD. If you are using HLSL as the shader source
  -- * language, your vertex semantics should start at TEXCOORD0 and increment
  -- * like so: TEXCOORD1, TEXCOORD2, etc. If you wish to change the semantic
  -- * prefix to something other than TEXCOORD you can use
  -- * SDL_PROP_GPU_DEVICE_CREATE_D3D12_SEMANTIC_NAME_STRING with
  -- * SDL_CreateGPUDeviceWithProperties().
  -- *
  -- * There are optional properties that can be provided through `props`. These
  -- * are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_SHADER_CREATE_NAME_STRING`: a name that can be displayed in
  -- *   debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the shader to create.
  -- * \returns a shader object on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUGraphicsPipeline
  -- * \sa SDL_ReleaseGPUShader
  --  

   function SDL_CreateGPUShader (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUShaderCreateInfo) return access SDL_GPUShader  -- /usr/local/include/SDL3/SDL_gpu.h:2737
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUShader";

  --*
  -- * Creates a texture object to be used in graphics or compute workflows.
  -- *
  -- * The contents of this texture are undefined until data is written to the
  -- * texture, either via SDL_UploadToGPUTexture or by performing a render or
  -- * compute pass with this texture as a target.
  -- *
  -- * Note that certain combinations of usage flags are invalid. For example, a
  -- * texture cannot have both the SAMPLER and GRAPHICS_STORAGE_READ flags.
  -- *
  -- * If you request a sample count higher than the hardware supports, the
  -- * implementation will automatically fall back to the highest available sample
  -- * count.
  -- *
  -- * There are optional properties that can be provided through
  -- * SDL_GPUTextureCreateInfo's `props`. These are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_R_FLOAT`: (Direct3D 12 only) if
  -- *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  -- *   to a color with this red intensity. Defaults to zero.
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_G_FLOAT`: (Direct3D 12 only) if
  -- *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  -- *   to a color with this green intensity. Defaults to zero.
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_B_FLOAT`: (Direct3D 12 only) if
  -- *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  -- *   to a color with this blue intensity. Defaults to zero.
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_A_FLOAT`: (Direct3D 12 only) if
  -- *   the texture usage is SDL_GPU_TEXTUREUSAGE_COLOR_TARGET, clear the texture
  -- *   to a color with this alpha intensity. Defaults to zero.
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_DEPTH_FLOAT`: (Direct3D 12 only)
  -- *   if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET, clear
  -- *   the texture to a depth of this value. Defaults to zero.
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_D3D12_CLEAR_STENCIL_NUMBER`: (Direct3D 12
  -- *   only) if the texture usage is SDL_GPU_TEXTUREUSAGE_DEPTH_STENCIL_TARGET,
  -- *   clear the texture to a stencil of this Uint8 value. Defaults to zero.
  -- * - `SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING`: a name that can be displayed
  -- *   in debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the texture to create.
  -- * \returns a texture object on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUTexture
  -- * \sa SDL_DownloadFromGPUTexture
  -- * \sa SDL_BeginGPURenderPass
  -- * \sa SDL_BeginGPUComputePass
  -- * \sa SDL_BindGPUVertexSamplers
  -- * \sa SDL_BindGPUVertexStorageTextures
  -- * \sa SDL_BindGPUFragmentSamplers
  -- * \sa SDL_BindGPUFragmentStorageTextures
  -- * \sa SDL_BindGPUComputeStorageTextures
  -- * \sa SDL_BlitGPUTexture
  -- * \sa SDL_ReleaseGPUTexture
  -- * \sa SDL_GPUTextureSupportsFormat
  --  

   function SDL_CreateGPUTexture (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUTextureCreateInfo) return access SDL_GPUTexture  -- /usr/local/include/SDL3/SDL_gpu.h:2801
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUTexture";

  --*
  -- * Creates a buffer object to be used in graphics or compute workflows.
  -- *
  -- * The contents of this buffer are undefined until data is written to the
  -- * buffer.
  -- *
  -- * Note that certain combinations of usage flags are invalid. For example, a
  -- * buffer cannot have both the VERTEX and INDEX flags.
  -- *
  -- * If you use a STORAGE flag, the data in the buffer must respect std140
  -- * layout conventions. In practical terms this means you must ensure that vec3
  -- * and vec4 fields are 16-byte aligned.
  -- *
  -- * For better understanding of underlying concepts and memory management with
  -- * SDL GPU API, you may refer
  -- * [this blog post](https://moonside.games/posts/sdl-gpu-concepts-cycling/)
  -- * .
  -- *
  -- * There are optional properties that can be provided through `props`. These
  -- * are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING`: a name that can be displayed in
  -- *   debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the buffer to create.
  -- * \returns a buffer object on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUBuffer
  -- * \sa SDL_DownloadFromGPUBuffer
  -- * \sa SDL_CopyGPUBufferToBuffer
  -- * \sa SDL_BindGPUVertexBuffers
  -- * \sa SDL_BindGPUIndexBuffer
  -- * \sa SDL_BindGPUVertexStorageBuffers
  -- * \sa SDL_BindGPUFragmentStorageBuffers
  -- * \sa SDL_DrawGPUPrimitivesIndirect
  -- * \sa SDL_DrawGPUIndexedPrimitivesIndirect
  -- * \sa SDL_BindGPUComputeStorageBuffers
  -- * \sa SDL_DispatchGPUComputeIndirect
  -- * \sa SDL_ReleaseGPUBuffer
  --  

   function SDL_CreateGPUBuffer (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUBufferCreateInfo) return access SDL_GPUBuffer  -- /usr/local/include/SDL3/SDL_gpu.h:2857
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUBuffer";

  --*
  -- * Creates a transfer buffer to be used when uploading to or downloading from
  -- * graphics resources.
  -- *
  -- * Download buffers can be particularly expensive to create, so it is good
  -- * practice to reuse them if data will be downloaded regularly.
  -- *
  -- * There are optional properties that can be provided through `props`. These
  -- * are the supported properties:
  -- *
  -- * - `SDL_PROP_GPU_TRANSFERBUFFER_CREATE_NAME_STRING`: a name that can be
  -- *   displayed in debugging tools.
  -- *
  -- * \param device a GPU Context.
  -- * \param createinfo a struct describing the state of the transfer buffer to
  -- *                   create.
  -- * \returns a transfer buffer on success, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUBuffer
  -- * \sa SDL_DownloadFromGPUBuffer
  -- * \sa SDL_UploadToGPUTexture
  -- * \sa SDL_DownloadFromGPUTexture
  -- * \sa SDL_ReleaseGPUTransferBuffer
  --  

   function SDL_CreateGPUTransferBuffer (device : access SDL_GPUDevice; createinfo : access constant SDL_GPUTransferBufferCreateInfo) return access SDL_GPUTransferBuffer  -- /usr/local/include/SDL3/SDL_gpu.h:2890
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateGPUTransferBuffer";

  -- Debug Naming  
  --*
  -- * Sets an arbitrary string constant to label a buffer.
  -- *
  -- * You should use SDL_PROP_GPU_BUFFER_CREATE_NAME_STRING with
  -- * SDL_CreateGPUBuffer instead of this function to avoid thread safety issues.
  -- *
  -- * \param device a GPU Context.
  -- * \param buffer a buffer to attach the name to.
  -- * \param text a UTF-8 string constant to mark as the name of the buffer.
  -- *
  -- * \threadsafety This function is not thread safe, you must make sure the
  -- *               buffer is not simultaneously used by any other thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUBuffer
  --  

   procedure SDL_SetGPUBufferName
     (device : access SDL_GPUDevice;
      buffer : access SDL_GPUBuffer;
      text : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_gpu.h:2915
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUBufferName";

  --*
  -- * Sets an arbitrary string constant to label a texture.
  -- *
  -- * You should use SDL_PROP_GPU_TEXTURE_CREATE_NAME_STRING with
  -- * SDL_CreateGPUTexture instead of this function to avoid thread safety
  -- * issues.
  -- *
  -- * \param device a GPU Context.
  -- * \param texture a texture to attach the name to.
  -- * \param text a UTF-8 string constant to mark as the name of the texture.
  -- *
  -- * \threadsafety This function is not thread safe, you must make sure the
  -- *               texture is not simultaneously used by any other thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUTexture
  --  

   procedure SDL_SetGPUTextureName
     (device : access SDL_GPUDevice;
      texture : access SDL_GPUTexture;
      text : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_gpu.h:2938
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUTextureName";

  --*
  -- * Inserts an arbitrary string label into the command buffer callstream.
  -- *
  -- * Useful for debugging.
  -- *
  -- * On Direct3D 12, using SDL_InsertGPUDebugLabel requires
  -- * WinPixEventRuntime.dll to be in your PATH or in the same directory as your
  -- * executable. See
  -- * [here](https://devblogs.microsoft.com/pix/winpixeventruntime/)
  -- * for instructions on how to obtain it.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param text a UTF-8 string constant to insert as the label.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_InsertGPUDebugLabel (command_buffer : access SDL_GPUCommandBuffer; text : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_gpu.h:2959
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_InsertGPUDebugLabel";

  --*
  -- * Begins a debug group with an arbitrary name.
  -- *
  -- * Used for denoting groups of calls when viewing the command buffer
  -- * callstream in a graphics debugging tool.
  -- *
  -- * Each call to SDL_PushGPUDebugGroup must have a corresponding call to
  -- * SDL_PopGPUDebugGroup.
  -- *
  -- * On Direct3D 12, using SDL_PushGPUDebugGroup requires WinPixEventRuntime.dll
  -- * to be in your PATH or in the same directory as your executable. See
  -- * [here](https://devblogs.microsoft.com/pix/winpixeventruntime/)
  -- * for instructions on how to obtain it.
  -- *
  -- * On some backends (e.g. Metal), pushing a debug group during a
  -- * render/blit/compute pass will create a group that is scoped to the native
  -- * pass rather than the command buffer. For best results, if you push a debug
  -- * group during a pass, always pop it in the same pass.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param name a UTF-8 string constant that names the group.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PopGPUDebugGroup
  --  

   procedure SDL_PushGPUDebugGroup (command_buffer : access SDL_GPUCommandBuffer; name : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_gpu.h:2989
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PushGPUDebugGroup";

  --*
  -- * Ends the most-recently pushed debug group.
  -- *
  -- * On Direct3D 12, using SDL_PopGPUDebugGroup requires WinPixEventRuntime.dll
  -- * to be in your PATH or in the same directory as your executable. See
  -- * [here](https://devblogs.microsoft.com/pix/winpixeventruntime/)
  -- * for instructions on how to obtain it.
  -- *
  -- * \param command_buffer a command buffer.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PushGPUDebugGroup
  --  

   procedure SDL_PopGPUDebugGroup (command_buffer : access SDL_GPUCommandBuffer)  -- /usr/local/include/SDL3/SDL_gpu.h:3007
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PopGPUDebugGroup";

  -- Disposal  
  --*
  -- * Frees the given texture as soon as it is safe to do so.
  -- *
  -- * You must not reference the texture after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param texture a texture to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUTexture (device : access SDL_GPUDevice; texture : access SDL_GPUTexture)  -- /usr/local/include/SDL3/SDL_gpu.h:3022
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUTexture";

  --*
  -- * Frees the given sampler as soon as it is safe to do so.
  -- *
  -- * You must not reference the sampler after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param sampler a sampler to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUSampler (device : access SDL_GPUDevice; sampler : access SDL_GPUSampler)  -- /usr/local/include/SDL3/SDL_gpu.h:3036
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUSampler";

  --*
  -- * Frees the given buffer as soon as it is safe to do so.
  -- *
  -- * You must not reference the buffer after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param buffer a buffer to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUBuffer (device : access SDL_GPUDevice; buffer : access SDL_GPUBuffer)  -- /usr/local/include/SDL3/SDL_gpu.h:3050
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUBuffer";

  --*
  -- * Frees the given transfer buffer as soon as it is safe to do so.
  -- *
  -- * You must not reference the transfer buffer after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param transfer_buffer a transfer buffer to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUTransferBuffer (device : access SDL_GPUDevice; transfer_buffer : access SDL_GPUTransferBuffer)  -- /usr/local/include/SDL3/SDL_gpu.h:3064
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUTransferBuffer";

  --*
  -- * Frees the given compute pipeline as soon as it is safe to do so.
  -- *
  -- * You must not reference the compute pipeline after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param compute_pipeline a compute pipeline to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUComputePipeline (device : access SDL_GPUDevice; compute_pipeline : access SDL_GPUComputePipeline)  -- /usr/local/include/SDL3/SDL_gpu.h:3078
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUComputePipeline";

  --*
  -- * Frees the given shader as soon as it is safe to do so.
  -- *
  -- * You must not reference the shader after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param shader a shader to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUShader (device : access SDL_GPUDevice; shader : access SDL_GPUShader)  -- /usr/local/include/SDL3/SDL_gpu.h:3092
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUShader";

  --*
  -- * Frees the given graphics pipeline as soon as it is safe to do so.
  -- *
  -- * You must not reference the graphics pipeline after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param graphics_pipeline a graphics pipeline to be destroyed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ReleaseGPUGraphicsPipeline (device : access SDL_GPUDevice; graphics_pipeline : access SDL_GPUGraphicsPipeline)  -- /usr/local/include/SDL3/SDL_gpu.h:3106
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUGraphicsPipeline";

  --*
  -- * Acquire a command buffer.
  -- *
  -- * This command buffer is managed by the implementation and should not be
  -- * freed by the user. The command buffer may only be used on the thread it was
  -- * acquired on. The command buffer should be submitted on the thread it was
  -- * acquired on.
  -- *
  -- * It is valid to acquire multiple command buffers on the same thread at once.
  -- * In fact a common design pattern is to acquire two command buffers per frame
  -- * where one is dedicated to render and compute passes and the other is
  -- * dedicated to copy passes and other preparatory work such as generating
  -- * mipmaps. Interleaving commands between the two command buffers reduces the
  -- * total amount of passes overall which improves rendering performance.
  -- *
  -- * \param device a GPU context.
  -- * \returns a command buffer, or NULL on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SubmitGPUCommandBuffer
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  --  

   function SDL_AcquireGPUCommandBuffer (device : access SDL_GPUDevice) return access SDL_GPUCommandBuffer  -- /usr/local/include/SDL3/SDL_gpu.h:3134
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AcquireGPUCommandBuffer";

  -- Uniform Data  
  --*
  -- * Pushes data to a vertex uniform slot on the command buffer.
  -- *
  -- * Subsequent draw calls in this command buffer will use this uniform data.
  -- *
  -- * The data being pushed must respect std140 layout conventions. In practical
  -- * terms this means you must ensure that vec3 and vec4 fields are 16-byte
  -- * aligned.
  -- *
  -- * For detailed information about accessing uniform data from a shader, please
  -- * refer to SDL_CreateGPUShader.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param slot_index the vertex uniform slot to push data to.
  -- * \param data client data to write.
  -- * \param length the length of the data to write.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_PushGPUVertexUniformData
     (command_buffer : access SDL_GPUCommandBuffer;
      slot_index : SDL3_SDL_stdinc_h.Uint32;
      data : System.Address;
      length : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3158
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PushGPUVertexUniformData";

  --*
  -- * Pushes data to a fragment uniform slot on the command buffer.
  -- *
  -- * Subsequent draw calls in this command buffer will use this uniform data.
  -- *
  -- * The data being pushed must respect std140 layout conventions. In practical
  -- * terms this means you must ensure that vec3 and vec4 fields are 16-byte
  -- * aligned.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param slot_index the fragment uniform slot to push data to.
  -- * \param data client data to write.
  -- * \param length the length of the data to write.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_PushGPUFragmentUniformData
     (command_buffer : access SDL_GPUCommandBuffer;
      slot_index : SDL3_SDL_stdinc_h.Uint32;
      data : System.Address;
      length : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3180
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PushGPUFragmentUniformData";

  --*
  -- * Pushes data to a uniform slot on the command buffer.
  -- *
  -- * Subsequent draw calls in this command buffer will use this uniform data.
  -- *
  -- * The data being pushed must respect std140 layout conventions. In practical
  -- * terms this means you must ensure that vec3 and vec4 fields are 16-byte
  -- * aligned.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param slot_index the uniform slot to push data to.
  -- * \param data client data to write.
  -- * \param length the length of the data to write.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_PushGPUComputeUniformData
     (command_buffer : access SDL_GPUCommandBuffer;
      slot_index : SDL3_SDL_stdinc_h.Uint32;
      data : System.Address;
      length : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3202
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PushGPUComputeUniformData";

  -- Graphics State  
  --*
  -- * Begins a render pass on a command buffer.
  -- *
  -- * A render pass consists of a set of texture subresources (or depth slices in
  -- * the 3D texture case) which will be rendered to during the render pass,
  -- * along with corresponding clear values and load/store operations. All
  -- * operations related to graphics pipelines must take place inside of a render
  -- * pass. A default viewport and scissor state are automatically set when this
  -- * is called. You cannot begin another render pass, or begin a compute pass or
  -- * copy pass until you have ended the render pass.
  -- *
  -- * Using SDL_GPU_LOADOP_LOAD before any contents have been written to the
  -- * texture subresource will result in undefined behavior. SDL_GPU_LOADOP_CLEAR
  -- * will set the contents of the texture subresource to a single value before
  -- * any rendering is performed. It's fine to do an empty render pass using
  -- * SDL_GPU_STOREOP_STORE to clear a texture, but in general it's better to
  -- * think of clearing not as an independent operation but as something that's
  -- * done as the beginning of a render pass.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param color_target_infos an array of texture subresources with
  -- *                           corresponding clear values and load/store ops.
  -- * \param num_color_targets the number of color targets in the
  -- *                          color_target_infos array.
  -- * \param depth_stencil_target_info a texture subresource with corresponding
  -- *                                  clear value and load/store ops, may be
  -- *                                  NULL.
  -- * \returns a render pass handle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_EndGPURenderPass
  --  

   function SDL_BeginGPURenderPass
     (command_buffer : access SDL_GPUCommandBuffer;
      color_target_infos : access constant SDL_GPUColorTargetInfo;
      num_color_targets : SDL3_SDL_stdinc_h.Uint32;
      depth_stencil_target_info : access constant SDL_GPUDepthStencilTargetInfo) return access SDL_GPURenderPass  -- /usr/local/include/SDL3/SDL_gpu.h:3243
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BeginGPURenderPass";

  --*
  -- * Binds a graphics pipeline on a render pass to be used in rendering.
  -- *
  -- * A graphics pipeline must be bound before making any draw calls.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param graphics_pipeline the graphics pipeline to bind.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_BindGPUGraphicsPipeline (render_pass : access SDL_GPURenderPass; graphics_pipeline : access SDL_GPUGraphicsPipeline)  -- /usr/local/include/SDL3/SDL_gpu.h:3259
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUGraphicsPipeline";

  --*
  -- * Sets the current viewport state on a command buffer.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param viewport the viewport to set.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_SetGPUViewport (render_pass : access SDL_GPURenderPass; viewport : access constant SDL_GPUViewport)  -- /usr/local/include/SDL3/SDL_gpu.h:3271
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUViewport";

  --*
  -- * Sets the current scissor state on a command buffer.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param scissor the scissor area to set.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_SetGPUScissor (render_pass : access SDL_GPURenderPass; scissor : access constant SDL3_SDL_rect_h.SDL_Rect)  -- /usr/local/include/SDL3/SDL_gpu.h:3283
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUScissor";

  --*
  -- * Sets the current blend constants on a command buffer.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param blend_constants the blend constant color.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GPU_BLENDFACTOR_CONSTANT_COLOR
  -- * \sa SDL_GPU_BLENDFACTOR_ONE_MINUS_CONSTANT_COLOR
  --  

   procedure SDL_SetGPUBlendConstants (render_pass : access SDL_GPURenderPass; blend_constants : SDL3_SDL_pixels_h.SDL_FColor)  -- /usr/local/include/SDL3/SDL_gpu.h:3298
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUBlendConstants";

  --*
  -- * Sets the current stencil reference value on a command buffer.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param reference the stencil reference value to set.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_SetGPUStencilReference (render_pass : access SDL_GPURenderPass; reference : SDL3_SDL_stdinc_h.Uint8)  -- /usr/local/include/SDL3/SDL_gpu.h:3310
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUStencilReference";

  --*
  -- * Binds vertex buffers on a command buffer for use with subsequent draw
  -- * calls.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the vertex buffer slot to begin binding from.
  -- * \param bindings an array of SDL_GPUBufferBinding structs containing vertex
  -- *                 buffers and offset values.
  -- * \param num_bindings the number of bindings in the bindings array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_BindGPUVertexBuffers
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      bindings : access constant SDL_GPUBufferBinding;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3326
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUVertexBuffers";

  --*
  -- * Binds an index buffer on a command buffer for use with subsequent draw
  -- * calls.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param binding a pointer to a struct containing an index buffer and offset.
  -- * \param index_element_size whether the index values in the buffer are 16- or
  -- *                           32-bit.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_BindGPUIndexBuffer
     (render_pass : access SDL_GPURenderPass;
      binding : access constant SDL_GPUBufferBinding;
      index_element_size : SDL_GPUIndexElementSize)  -- /usr/local/include/SDL3/SDL_gpu.h:3343
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUIndexBuffer";

  --*
  -- * Binds texture-sampler pairs for use on the vertex shader.
  -- *
  -- * The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUShader().
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the vertex sampler slot to begin binding from.
  -- * \param texture_sampler_bindings an array of texture-sampler binding
  -- *                                 structs.
  -- * \param num_bindings the number of texture-sampler pairs to bind from the
  -- *                     array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   procedure SDL_BindGPUVertexSamplers
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      texture_sampler_bindings : access constant SDL_GPUTextureSamplerBinding;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3367
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUVertexSamplers";

  --*
  -- * Binds storage textures for use on the vertex shader.
  -- *
  -- * These textures must have been created with
  -- * SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUShader().
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the vertex storage texture slot to begin binding from.
  -- * \param storage_textures an array of storage textures.
  -- * \param num_bindings the number of storage texture to bind from the array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   procedure SDL_BindGPUVertexStorageTextures
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      storage_textures : System.Address;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3391
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUVertexStorageTextures";

  --*
  -- * Binds storage buffers for use on the vertex shader.
  -- *
  -- * These buffers must have been created with
  -- * SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUShader().
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the vertex storage buffer slot to begin binding from.
  -- * \param storage_buffers an array of buffers.
  -- * \param num_bindings the number of buffers to bind from the array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   procedure SDL_BindGPUVertexStorageBuffers
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      storage_buffers : System.Address;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3415
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUVertexStorageBuffers";

  --*
  -- * Binds texture-sampler pairs for use on the fragment shader.
  -- *
  -- * The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUShader().
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the fragment sampler slot to begin binding from.
  -- * \param texture_sampler_bindings an array of texture-sampler binding
  -- *                                 structs.
  -- * \param num_bindings the number of texture-sampler pairs to bind from the
  -- *                     array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   procedure SDL_BindGPUFragmentSamplers
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      texture_sampler_bindings : access constant SDL_GPUTextureSamplerBinding;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3440
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUFragmentSamplers";

  --*
  -- * Binds storage textures for use on the fragment shader.
  -- *
  -- * These textures must have been created with
  -- * SDL_GPU_TEXTUREUSAGE_GRAPHICS_STORAGE_READ.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUShader().
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the fragment storage texture slot to begin binding from.
  -- * \param storage_textures an array of storage textures.
  -- * \param num_bindings the number of storage textures to bind from the array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   procedure SDL_BindGPUFragmentStorageTextures
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      storage_textures : System.Address;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3464
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUFragmentStorageTextures";

  --*
  -- * Binds storage buffers for use on the fragment shader.
  -- *
  -- * These buffers must have been created with
  -- * SDL_GPU_BUFFERUSAGE_GRAPHICS_STORAGE_READ.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUShader().
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param first_slot the fragment storage buffer slot to begin binding from.
  -- * \param storage_buffers an array of storage buffers.
  -- * \param num_bindings the number of storage buffers to bind from the array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUShader
  --  

   procedure SDL_BindGPUFragmentStorageBuffers
     (render_pass : access SDL_GPURenderPass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      storage_buffers : System.Address;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3488
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUFragmentStorageBuffers";

  -- Drawing  
  --*
  -- * Draws data using bound graphics state with an index buffer and instancing
  -- * enabled.
  -- *
  -- * You must not call this function before binding a graphics pipeline.
  -- *
  -- * Note that the `first_vertex` and `first_instance` parameters are NOT
  -- * compatible with built-in vertex/instance ID variables in shaders (for
  -- * example, SV_VertexID); GPU APIs and shader languages do not define these
  -- * built-in variables consistently, so if your shader depends on them, the
  -- * only way to keep behavior consistent and portable is to always pass 0 for
  -- * the correlating parameter in the draw calls.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param num_indices the number of indices to draw per instance.
  -- * \param num_instances the number of instances to draw.
  -- * \param first_index the starting index within the index buffer.
  -- * \param vertex_offset value added to vertex index before indexing into the
  -- *                      vertex buffer.
  -- * \param first_instance the ID of the first instance to draw.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DrawGPUIndexedPrimitives
     (render_pass : access SDL_GPURenderPass;
      num_indices : SDL3_SDL_stdinc_h.Uint32;
      num_instances : SDL3_SDL_stdinc_h.Uint32;
      first_index : SDL3_SDL_stdinc_h.Uint32;
      vertex_offset : SDL3_SDL_stdinc_h.Sint32;
      first_instance : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3519
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DrawGPUIndexedPrimitives";

  --*
  -- * Draws data using bound graphics state.
  -- *
  -- * You must not call this function before binding a graphics pipeline.
  -- *
  -- * Note that the `first_vertex` and `first_instance` parameters are NOT
  -- * compatible with built-in vertex/instance ID variables in shaders (for
  -- * example, SV_VertexID); GPU APIs and shader languages do not define these
  -- * built-in variables consistently, so if your shader depends on them, the
  -- * only way to keep behavior consistent and portable is to always pass 0 for
  -- * the correlating parameter in the draw calls.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param num_vertices the number of vertices to draw.
  -- * \param num_instances the number of instances that will be drawn.
  -- * \param first_vertex the index of the first vertex to draw.
  -- * \param first_instance the ID of the first instance to draw.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DrawGPUPrimitives
     (render_pass : access SDL_GPURenderPass;
      num_vertices : SDL3_SDL_stdinc_h.Uint32;
      num_instances : SDL3_SDL_stdinc_h.Uint32;
      first_vertex : SDL3_SDL_stdinc_h.Uint32;
      first_instance : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3547
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DrawGPUPrimitives";

  --*
  -- * Draws data using bound graphics state and with draw parameters set from a
  -- * buffer.
  -- *
  -- * The buffer must consist of tightly-packed draw parameter sets that each
  -- * match the layout of SDL_GPUIndirectDrawCommand. You must not call this
  -- * function before binding a graphics pipeline.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param buffer a buffer containing draw parameters.
  -- * \param offset the offset to start reading from the draw buffer.
  -- * \param draw_count the number of draw parameter sets that should be read
  -- *                   from the draw buffer.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DrawGPUPrimitivesIndirect
     (render_pass : access SDL_GPURenderPass;
      buffer : access SDL_GPUBuffer;
      offset : SDL3_SDL_stdinc_h.Uint32;
      draw_count : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3570
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DrawGPUPrimitivesIndirect";

  --*
  -- * Draws data using bound graphics state with an index buffer enabled and with
  -- * draw parameters set from a buffer.
  -- *
  -- * The buffer must consist of tightly-packed draw parameter sets that each
  -- * match the layout of SDL_GPUIndexedIndirectDrawCommand. You must not call
  -- * this function before binding a graphics pipeline.
  -- *
  -- * \param render_pass a render pass handle.
  -- * \param buffer a buffer containing draw parameters.
  -- * \param offset the offset to start reading from the draw buffer.
  -- * \param draw_count the number of draw parameter sets that should be read
  -- *                   from the draw buffer.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DrawGPUIndexedPrimitivesIndirect
     (render_pass : access SDL_GPURenderPass;
      buffer : access SDL_GPUBuffer;
      offset : SDL3_SDL_stdinc_h.Uint32;
      draw_count : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3592
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DrawGPUIndexedPrimitivesIndirect";

  --*
  -- * Ends the given render pass.
  -- *
  -- * All bound graphics state on the render pass command buffer is unset. The
  -- * render pass handle is now invalid.
  -- *
  -- * \param render_pass a render pass handle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_EndGPURenderPass (render_pass : access SDL_GPURenderPass)  -- /usr/local/include/SDL3/SDL_gpu.h:3608
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_EndGPURenderPass";

  -- Compute Pass  
  --*
  -- * Begins a compute pass on a command buffer.
  -- *
  -- * A compute pass is defined by a set of texture subresources and buffers that
  -- * may be written to by compute pipelines. These textures and buffers must
  -- * have been created with the COMPUTE_STORAGE_WRITE bit or the
  -- * COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE bit. If you do not create a texture
  -- * with COMPUTE_STORAGE_SIMULTANEOUS_READ_WRITE, you must not read from the
  -- * texture in the compute pass. All operations related to compute pipelines
  -- * must take place inside of a compute pass. You must not begin another
  -- * compute pass, or a render pass or copy pass before ending the compute pass.
  -- *
  -- * A VERY IMPORTANT NOTE - Reads and writes in compute passes are NOT
  -- * implicitly synchronized. This means you may cause data races by both
  -- * reading and writing a resource region in a compute pass, or by writing
  -- * multiple times to a resource region. If your compute work depends on
  -- * reading the completed output from a previous dispatch, you MUST end the
  -- * current compute pass and begin a new one before you can safely access the
  -- * data. Otherwise you will receive unexpected results. Reading and writing a
  -- * texture in the same compute pass is only supported by specific texture
  -- * formats. Make sure you check the format support!
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param storage_texture_bindings an array of writeable storage texture
  -- *                                 binding structs.
  -- * \param num_storage_texture_bindings the number of storage textures to bind
  -- *                                     from the array.
  -- * \param storage_buffer_bindings an array of writeable storage buffer binding
  -- *                                structs.
  -- * \param num_storage_buffer_bindings the number of storage buffers to bind
  -- *                                    from the array.
  -- * \returns a compute pass handle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_EndGPUComputePass
  --  

   function SDL_BeginGPUComputePass
     (command_buffer : access SDL_GPUCommandBuffer;
      storage_texture_bindings : access constant SDL_GPUStorageTextureReadWriteBinding;
      num_storage_texture_bindings : SDL3_SDL_stdinc_h.Uint32;
      storage_buffer_bindings : access constant SDL_GPUStorageBufferReadWriteBinding;
      num_storage_buffer_bindings : SDL3_SDL_stdinc_h.Uint32) return access SDL_GPUComputePass  -- /usr/local/include/SDL3/SDL_gpu.h:3650
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BeginGPUComputePass";

  --*
  -- * Binds a compute pipeline on a command buffer for use in compute dispatch.
  -- *
  -- * \param compute_pass a compute pass handle.
  -- * \param compute_pipeline a compute pipeline to bind.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_BindGPUComputePipeline (compute_pass : access SDL_GPUComputePass; compute_pipeline : access SDL_GPUComputePipeline)  -- /usr/local/include/SDL3/SDL_gpu.h:3665
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUComputePipeline";

  --*
  -- * Binds texture-sampler pairs for use on the compute shader.
  -- *
  -- * The textures must have been created with SDL_GPU_TEXTUREUSAGE_SAMPLER.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUComputePipeline().
  -- *
  -- * \param compute_pass a compute pass handle.
  -- * \param first_slot the compute sampler slot to begin binding from.
  -- * \param texture_sampler_bindings an array of texture-sampler binding
  -- *                                 structs.
  -- * \param num_bindings the number of texture-sampler bindings to bind from the
  -- *                     array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUComputePipeline
  --  

   procedure SDL_BindGPUComputeSamplers
     (compute_pass : access SDL_GPUComputePass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      texture_sampler_bindings : access constant SDL_GPUTextureSamplerBinding;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3688
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUComputeSamplers";

  --*
  -- * Binds storage textures as readonly for use on the compute pipeline.
  -- *
  -- * These textures must have been created with
  -- * SDL_GPU_TEXTUREUSAGE_COMPUTE_STORAGE_READ.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUComputePipeline().
  -- *
  -- * \param compute_pass a compute pass handle.
  -- * \param first_slot the compute storage texture slot to begin binding from.
  -- * \param storage_textures an array of storage textures.
  -- * \param num_bindings the number of storage textures to bind from the array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUComputePipeline
  --  

   procedure SDL_BindGPUComputeStorageTextures
     (compute_pass : access SDL_GPUComputePass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      storage_textures : System.Address;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3712
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUComputeStorageTextures";

  --*
  -- * Binds storage buffers as readonly for use on the compute pipeline.
  -- *
  -- * These buffers must have been created with
  -- * SDL_GPU_BUFFERUSAGE_COMPUTE_STORAGE_READ.
  -- *
  -- * Be sure your shader is set up according to the requirements documented in
  -- * SDL_CreateGPUComputePipeline().
  -- *
  -- * \param compute_pass a compute pass handle.
  -- * \param first_slot the compute storage buffer slot to begin binding from.
  -- * \param storage_buffers an array of storage buffer binding structs.
  -- * \param num_bindings the number of storage buffers to bind from the array.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateGPUComputePipeline
  --  

   procedure SDL_BindGPUComputeStorageBuffers
     (compute_pass : access SDL_GPUComputePass;
      first_slot : SDL3_SDL_stdinc_h.Uint32;
      storage_buffers : System.Address;
      num_bindings : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3736
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BindGPUComputeStorageBuffers";

  --*
  -- * Dispatches compute work.
  -- *
  -- * You must not call this function before binding a compute pipeline.
  -- *
  -- * A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
  -- * the dispatches write to the same resource region as each other, there is no
  -- * guarantee of which order the writes will occur. If the write order matters,
  -- * you MUST end the compute pass and begin another one.
  -- *
  -- * \param compute_pass a compute pass handle.
  -- * \param groupcount_x number of local workgroups to dispatch in the X
  -- *                     dimension.
  -- * \param groupcount_y number of local workgroups to dispatch in the Y
  -- *                     dimension.
  -- * \param groupcount_z number of local workgroups to dispatch in the Z
  -- *                     dimension.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DispatchGPUCompute
     (compute_pass : access SDL_GPUComputePass;
      groupcount_x : SDL3_SDL_stdinc_h.Uint32;
      groupcount_y : SDL3_SDL_stdinc_h.Uint32;
      groupcount_z : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3762
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DispatchGPUCompute";

  --*
  -- * Dispatches compute work with parameters set from a buffer.
  -- *
  -- * The buffer layout should match the layout of
  -- * SDL_GPUIndirectDispatchCommand. You must not call this function before
  -- * binding a compute pipeline.
  -- *
  -- * A VERY IMPORTANT NOTE If you dispatch multiple times in a compute pass, and
  -- * the dispatches write to the same resource region as each other, there is no
  -- * guarantee of which order the writes will occur. If the write order matters,
  -- * you MUST end the compute pass and begin another one.
  -- *
  -- * \param compute_pass a compute pass handle.
  -- * \param buffer a buffer containing dispatch parameters.
  -- * \param offset the offset to start reading from the dispatch buffer.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DispatchGPUComputeIndirect
     (compute_pass : access SDL_GPUComputePass;
      buffer : access SDL_GPUBuffer;
      offset : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_gpu.h:3786
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DispatchGPUComputeIndirect";

  --*
  -- * Ends the current compute pass.
  -- *
  -- * All bound compute state on the command buffer is unset. The compute pass
  -- * handle is now invalid.
  -- *
  -- * \param compute_pass a compute pass handle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_EndGPUComputePass (compute_pass : access SDL_GPUComputePass)  -- /usr/local/include/SDL3/SDL_gpu.h:3801
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_EndGPUComputePass";

  -- TransferBuffer Data  
  --*
  -- * Maps a transfer buffer into application address space.
  -- *
  -- * You must unmap the transfer buffer before encoding upload commands. The
  -- * memory is owned by the graphics driver - do NOT call SDL_free() on the
  -- * returned pointer.
  -- *
  -- * \param device a GPU context.
  -- * \param transfer_buffer a transfer buffer.
  -- * \param cycle if true, cycles the transfer buffer if it is already bound.
  -- * \returns the address of the mapped transfer buffer memory, or NULL on
  -- *          failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_MapGPUTransferBuffer
     (device : access SDL_GPUDevice;
      transfer_buffer : access SDL_GPUTransferBuffer;
      cycle : Extensions.bool) return System.Address  -- /usr/local/include/SDL3/SDL_gpu.h:3821
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_MapGPUTransferBuffer";

  --*
  -- * Unmaps a previously mapped transfer buffer.
  -- *
  -- * \param device a GPU context.
  -- * \param transfer_buffer a previously mapped transfer buffer.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_UnmapGPUTransferBuffer (device : access SDL_GPUDevice; transfer_buffer : access SDL_GPUTransferBuffer)  -- /usr/local/include/SDL3/SDL_gpu.h:3834
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnmapGPUTransferBuffer";

  -- Copy Pass  
  --*
  -- * Begins a copy pass on a command buffer.
  -- *
  -- * All operations related to copying to or from buffers or textures take place
  -- * inside a copy pass. You must not begin another copy pass, or a render pass
  -- * or compute pass before ending the copy pass.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \returns a copy pass handle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_EndGPUCopyPass
  --  

   function SDL_BeginGPUCopyPass (command_buffer : access SDL_GPUCommandBuffer) return access SDL_GPUCopyPass  -- /usr/local/include/SDL3/SDL_gpu.h:3854
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BeginGPUCopyPass";

  --*
  -- * Uploads data from a transfer buffer to a texture.
  -- *
  -- * The upload occurs on the GPU timeline. You may assume that the upload has
  -- * finished in subsequent commands.
  -- *
  -- * You must align the data in the transfer buffer to a multiple of the texel
  -- * size of the texture format.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- * \param source the source transfer buffer with image layout information.
  -- * \param destination the destination texture region.
  -- * \param cycle if true, cycles the texture if the texture is bound, otherwise
  -- *              overwrites the data.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_UploadToGPUTexture
     (copy_pass : access SDL_GPUCopyPass;
      source : access constant SDL_GPUTextureTransferInfo;
      destination : access constant SDL_GPUTextureRegion;
      cycle : Extensions.bool)  -- /usr/local/include/SDL3/SDL_gpu.h:3874
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UploadToGPUTexture";

  --*
  -- * Uploads data from a transfer buffer to a buffer.
  -- *
  -- * The upload occurs on the GPU timeline. You may assume that the upload has
  -- * finished in subsequent commands.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- * \param source the source transfer buffer with offset.
  -- * \param destination the destination buffer with offset and size.
  -- * \param cycle if true, cycles the buffer if it is already bound, otherwise
  -- *              overwrites the data.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_UploadToGPUBuffer
     (copy_pass : access SDL_GPUCopyPass;
      source : access constant SDL_GPUTransferBufferLocation;
      destination : access constant SDL_GPUBufferRegion;
      cycle : Extensions.bool)  -- /usr/local/include/SDL3/SDL_gpu.h:3894
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UploadToGPUBuffer";

  --*
  -- * Performs a texture-to-texture copy.
  -- *
  -- * This copy occurs on the GPU timeline. You may assume the copy has finished
  -- * in subsequent commands.
  -- *
  -- * This function does not support copying between depth and color textures.
  -- * For those, copy the texture to a buffer and then to the destination
  -- * texture.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- * \param source a source texture region.
  -- * \param destination a destination texture region.
  -- * \param w the width of the region to copy.
  -- * \param h the height of the region to copy.
  -- * \param d the depth of the region to copy.
  -- * \param cycle if true, cycles the destination texture if the destination
  -- *              texture is bound, otherwise overwrites the data.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_CopyGPUTextureToTexture
     (copy_pass : access SDL_GPUCopyPass;
      source : access constant SDL_GPUTextureLocation;
      destination : access constant SDL_GPUTextureLocation;
      w : SDL3_SDL_stdinc_h.Uint32;
      h : SDL3_SDL_stdinc_h.Uint32;
      d : SDL3_SDL_stdinc_h.Uint32;
      cycle : Extensions.bool)  -- /usr/local/include/SDL3/SDL_gpu.h:3921
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CopyGPUTextureToTexture";

  --*
  -- * Performs a buffer-to-buffer copy.
  -- *
  -- * This copy occurs on the GPU timeline. You may assume the copy has finished
  -- * in subsequent commands.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- * \param source the buffer and offset to copy from.
  -- * \param destination the buffer and offset to copy to.
  -- * \param size the length of the buffer to copy.
  -- * \param cycle if true, cycles the destination buffer if it is already bound,
  -- *              otherwise overwrites the data.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_CopyGPUBufferToBuffer
     (copy_pass : access SDL_GPUCopyPass;
      source : access constant SDL_GPUBufferLocation;
      destination : access constant SDL_GPUBufferLocation;
      size : SDL3_SDL_stdinc_h.Uint32;
      cycle : Extensions.bool)  -- /usr/local/include/SDL3/SDL_gpu.h:3945
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CopyGPUBufferToBuffer";

  --*
  -- * Copies data from a texture to a transfer buffer on the GPU timeline.
  -- *
  -- * This data is not guaranteed to be copied until the command buffer fence is
  -- * signaled.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- * \param source the source texture region.
  -- * \param destination the destination transfer buffer with image layout
  -- *                    information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DownloadFromGPUTexture
     (copy_pass : access SDL_GPUCopyPass;
      source : access constant SDL_GPUTextureRegion;
      destination : access constant SDL_GPUTextureTransferInfo)  -- /usr/local/include/SDL3/SDL_gpu.h:3965
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DownloadFromGPUTexture";

  --*
  -- * Copies data from a buffer to a transfer buffer on the GPU timeline.
  -- *
  -- * This data is not guaranteed to be copied until the command buffer fence is
  -- * signaled.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- * \param source the source buffer with offset and size.
  -- * \param destination the destination transfer buffer with offset.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_DownloadFromGPUBuffer
     (copy_pass : access SDL_GPUCopyPass;
      source : access constant SDL_GPUBufferRegion;
      destination : access constant SDL_GPUTransferBufferLocation)  -- /usr/local/include/SDL3/SDL_gpu.h:3982
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DownloadFromGPUBuffer";

  --*
  -- * Ends the current copy pass.
  -- *
  -- * \param copy_pass a copy pass handle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_EndGPUCopyPass (copy_pass : access SDL_GPUCopyPass)  -- /usr/local/include/SDL3/SDL_gpu.h:3994
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_EndGPUCopyPass";

  --*
  -- * Generates mipmaps for the given texture.
  -- *
  -- * This function must not be called inside of any pass.
  -- *
  -- * \param command_buffer a command_buffer.
  -- * \param texture a texture with more than 1 mip level.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_GenerateMipmapsForGPUTexture (command_buffer : access SDL_GPUCommandBuffer; texture : access SDL_GPUTexture)  -- /usr/local/include/SDL3/SDL_gpu.h:4007
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GenerateMipmapsForGPUTexture";

  --*
  -- * Blits from a source texture region to a destination texture region.
  -- *
  -- * This function must not be called inside of any pass.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param info the blit info struct containing the blit parameters.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_BlitGPUTexture (command_buffer : access SDL_GPUCommandBuffer; info : access constant SDL_GPUBlitInfo)  -- /usr/local/include/SDL3/SDL_gpu.h:4021
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_BlitGPUTexture";

  -- Submission/Presentation  
  --*
  -- * Determines whether a swapchain composition is supported by the window.
  -- *
  -- * The window must be claimed before calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param window an SDL_Window.
  -- * \param swapchain_composition the swapchain composition to check.
  -- * \returns true if supported, false if unsupported.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ClaimWindowForGPUDevice
  --  

   function SDL_WindowSupportsGPUSwapchainComposition
     (device : access SDL_GPUDevice;
      window : access SDL3_SDL_video_h.SDL_Window;
      swapchain_composition : SDL_GPUSwapchainComposition) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4041
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WindowSupportsGPUSwapchainComposition";

  --*
  -- * Determines whether a presentation mode is supported by the window.
  -- *
  -- * The window must be claimed before calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param window an SDL_Window.
  -- * \param present_mode the presentation mode to check.
  -- * \returns true if supported, false if unsupported.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ClaimWindowForGPUDevice
  --  

   function SDL_WindowSupportsGPUPresentMode
     (device : access SDL_GPUDevice;
      window : access SDL3_SDL_video_h.SDL_Window;
      present_mode : SDL_GPUPresentMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4060
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WindowSupportsGPUPresentMode";

  --*
  -- * Claims a window, creating a swapchain structure for it.
  -- *
  -- * This must be called before SDL_AcquireGPUSwapchainTexture is called using
  -- * the window. You should only call this function from the thread that created
  -- * the window.
  -- *
  -- * The swapchain will be created with SDL_GPU_SWAPCHAINCOMPOSITION_SDR and
  -- * SDL_GPU_PRESENTMODE_VSYNC. If you want to have different swapchain
  -- * parameters, you must call SDL_SetGPUSwapchainParameters after claiming the
  -- * window.
  -- *
  -- * \param device a GPU context.
  -- * \param window an SDL_Window.
  -- * \returns true on success, or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called from the thread that
  -- *               created the window.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  -- * \sa SDL_ReleaseWindowFromGPUDevice
  -- * \sa SDL_WindowSupportsGPUPresentMode
  -- * \sa SDL_WindowSupportsGPUSwapchainComposition
  --  

   function SDL_ClaimWindowForGPUDevice (device : access SDL_GPUDevice; window : access SDL3_SDL_video_h.SDL_Window) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4092
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ClaimWindowForGPUDevice";

  --*
  -- * Unclaims a window, destroying its swapchain structure.
  -- *
  -- * \param device a GPU context.
  -- * \param window an SDL_Window that has been claimed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ClaimWindowForGPUDevice
  --  

   procedure SDL_ReleaseWindowFromGPUDevice (device : access SDL_GPUDevice; window : access SDL3_SDL_video_h.SDL_Window)  -- /usr/local/include/SDL3/SDL_gpu.h:4106
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseWindowFromGPUDevice";

  --*
  -- * Changes the swapchain parameters for the given claimed window.
  -- *
  -- * This function will fail if the requested present mode or swapchain
  -- * composition are unsupported by the device. Check if the parameters are
  -- * supported via SDL_WindowSupportsGPUPresentMode /
  -- * SDL_WindowSupportsGPUSwapchainComposition prior to calling this function.
  -- *
  -- * SDL_GPU_PRESENTMODE_VSYNC with SDL_GPU_SWAPCHAINCOMPOSITION_SDR is always
  -- * supported.
  -- *
  -- * \param device a GPU context.
  -- * \param window an SDL_Window that has been claimed.
  -- * \param swapchain_composition the desired composition of the swapchain.
  -- * \param present_mode the desired present mode for the swapchain.
  -- * \returns true if successful, false on error; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_WindowSupportsGPUPresentMode
  -- * \sa SDL_WindowSupportsGPUSwapchainComposition
  --  

   function SDL_SetGPUSwapchainParameters
     (device : access SDL_GPUDevice;
      window : access SDL3_SDL_video_h.SDL_Window;
      swapchain_composition : SDL_GPUSwapchainComposition;
      present_mode : SDL_GPUPresentMode) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4133
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUSwapchainParameters";

  --*
  -- * Configures the maximum allowed number of frames in flight.
  -- *
  -- * The default value when the device is created is 2. This means that after
  -- * you have submitted 2 frames for presentation, if the GPU has not finished
  -- * working on the first frame, SDL_AcquireGPUSwapchainTexture() will fill the
  -- * swapchain texture pointer with NULL, and
  -- * SDL_WaitAndAcquireGPUSwapchainTexture() will block.
  -- *
  -- * Higher values increase throughput at the expense of visual latency. Lower
  -- * values decrease visual latency at the expense of throughput.
  -- *
  -- * Note that calling this function will stall and flush the command queue to
  -- * prevent synchronization issues.
  -- *
  -- * The minimum value of allowed frames in flight is 1, and the maximum is 3.
  -- *
  -- * \param device a GPU context.
  -- * \param allowed_frames_in_flight the maximum number of frames that can be
  -- *                                 pending on the GPU.
  -- * \returns true if successful, false on error; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SetGPUAllowedFramesInFlight (device : access SDL_GPUDevice; allowed_frames_in_flight : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4164
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetGPUAllowedFramesInFlight";

  --*
  -- * Obtains the texture format of the swapchain for the given window.
  -- *
  -- * Note that this format can change if the swapchain parameters change.
  -- *
  -- * \param device a GPU context.
  -- * \param window an SDL_Window that has been claimed.
  -- * \returns the texture format of the swapchain.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetGPUSwapchainTextureFormat (device : access SDL_GPUDevice; window : access SDL3_SDL_video_h.SDL_Window) return SDL_GPUTextureFormat  -- /usr/local/include/SDL3/SDL_gpu.h:4179
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPUSwapchainTextureFormat";

  --*
  -- * Acquire a texture to use in presentation.
  -- *
  -- * When a swapchain texture is acquired on a command buffer, it will
  -- * automatically be submitted for presentation when the command buffer is
  -- * submitted. The swapchain texture should only be referenced by the command
  -- * buffer used to acquire it.
  -- *
  -- * This function will fill the swapchain texture handle with NULL if too many
  -- * frames are in flight. This is not an error. This NULL pointer should not be
  -- * passed back into SDL. Instead, it should be considered as an indication to
  -- * wait until the swapchain is available.
  -- *
  -- * If you use this function, it is possible to create a situation where many
  -- * command buffers are allocated while the rendering context waits for the GPU
  -- * to catch up, which will cause memory usage to grow. You should use
  -- * SDL_WaitAndAcquireGPUSwapchainTexture() unless you know what you are doing
  -- * with timing.
  -- *
  -- * The swapchain texture is managed by the implementation and must not be
  -- * freed by the user. You MUST NOT call this function from any thread other
  -- * than the one that created the window.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param window a window that has been claimed.
  -- * \param swapchain_texture a pointer filled in with a swapchain texture
  -- *                          handle.
  -- * \param swapchain_texture_width a pointer filled in with the swapchain
  -- *                                texture width, may be NULL.
  -- * \param swapchain_texture_height a pointer filled in with the swapchain
  -- *                                 texture height, may be NULL.
  -- * \returns true on success, false on error; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called from the thread that
  -- *               created the window.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ClaimWindowForGPUDevice
  -- * \sa SDL_SubmitGPUCommandBuffer
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  -- * \sa SDL_CancelGPUCommandBuffer
  -- * \sa SDL_GetWindowSizeInPixels
  -- * \sa SDL_WaitForGPUSwapchain
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  -- * \sa SDL_SetGPUAllowedFramesInFlight
  --  

   function SDL_AcquireGPUSwapchainTexture
     (command_buffer : access SDL_GPUCommandBuffer;
      window : access SDL3_SDL_video_h.SDL_Window;
      swapchain_texture : System.Address;
      swapchain_texture_width : access SDL3_SDL_stdinc_h.Uint32;
      swapchain_texture_height : access SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4231
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AcquireGPUSwapchainTexture";

  --*
  -- * Blocks the thread until a swapchain texture is available to be acquired.
  -- *
  -- * \param device a GPU context.
  -- * \param window a window that has been claimed.
  -- * \returns true on success, false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called from the thread that
  -- *               created the window.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AcquireGPUSwapchainTexture
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  -- * \sa SDL_SetGPUAllowedFramesInFlight
  --  

   function SDL_WaitForGPUSwapchain (device : access SDL_GPUDevice; window : access SDL3_SDL_video_h.SDL_Window) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4255
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitForGPUSwapchain";

  --*
  -- * Blocks the thread until a swapchain texture is available to be acquired,
  -- * and then acquires it.
  -- *
  -- * When a swapchain texture is acquired on a command buffer, it will
  -- * automatically be submitted for presentation when the command buffer is
  -- * submitted. The swapchain texture should only be referenced by the command
  -- * buffer used to acquire it. It is an error to call
  -- * SDL_CancelGPUCommandBuffer() after a swapchain texture is acquired.
  -- *
  -- * This function can fill the swapchain texture handle with NULL in certain
  -- * cases, for example if the window is minimized. This is not an error. You
  -- * should always make sure to check whether the pointer is NULL before
  -- * actually using it.
  -- *
  -- * The swapchain texture is managed by the implementation and must not be
  -- * freed by the user. You MUST NOT call this function from any thread other
  -- * than the one that created the window.
  -- *
  -- * The swapchain texture is write-only and cannot be used as a sampler or for
  -- * another reading operation.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \param window a window that has been claimed.
  -- * \param swapchain_texture a pointer filled in with a swapchain texture
  -- *                          handle.
  -- * \param swapchain_texture_width a pointer filled in with the swapchain
  -- *                                texture width, may be NULL.
  -- * \param swapchain_texture_height a pointer filled in with the swapchain
  -- *                                 texture height, may be NULL.
  -- * \returns true on success, false on error; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety This function should only be called from the thread that
  -- *               created the window.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SubmitGPUCommandBuffer
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  -- * \sa SDL_AcquireGPUSwapchainTexture
  --  

   function SDL_WaitAndAcquireGPUSwapchainTexture
     (command_buffer : access SDL_GPUCommandBuffer;
      window : access SDL3_SDL_video_h.SDL_Window;
      swapchain_texture : System.Address;
      swapchain_texture_width : access SDL3_SDL_stdinc_h.Uint32;
      swapchain_texture_height : access SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4301
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitAndAcquireGPUSwapchainTexture";

  --*
  -- * Submits a command buffer so its commands can be processed on the GPU.
  -- *
  -- * It is invalid to use the command buffer after this is called.
  -- *
  -- * This must be called from the thread the command buffer was acquired on.
  -- *
  -- * All commands in the submission are guaranteed to begin executing before any
  -- * command in a subsequent submission begins executing.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \returns true on success, false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AcquireGPUCommandBuffer
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  -- * \sa SDL_AcquireGPUSwapchainTexture
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  --  

   function SDL_SubmitGPUCommandBuffer (command_buffer : access SDL_GPUCommandBuffer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4329
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SubmitGPUCommandBuffer";

  --*
  -- * Submits a command buffer so its commands can be processed on the GPU, and
  -- * acquires a fence associated with the command buffer.
  -- *
  -- * You must release this fence when it is no longer needed or it will cause a
  -- * leak. It is invalid to use the command buffer after this is called.
  -- *
  -- * This must be called from the thread the command buffer was acquired on.
  -- *
  -- * All commands in the submission are guaranteed to begin executing before any
  -- * command in a subsequent submission begins executing.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \returns a fence associated with the command buffer, or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AcquireGPUCommandBuffer
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  -- * \sa SDL_AcquireGPUSwapchainTexture
  -- * \sa SDL_SubmitGPUCommandBuffer
  -- * \sa SDL_ReleaseGPUFence
  --  

   function SDL_SubmitGPUCommandBufferAndAcquireFence (command_buffer : access SDL_GPUCommandBuffer) return access SDL_GPUFence  -- /usr/local/include/SDL3/SDL_gpu.h:4356
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SubmitGPUCommandBufferAndAcquireFence";

  --*
  -- * Cancels a command buffer.
  -- *
  -- * None of the enqueued commands are executed.
  -- *
  -- * It is an error to call this function after a swapchain texture has been
  -- * acquired.
  -- *
  -- * This must be called from the thread the command buffer was acquired on.
  -- *
  -- * You must not reference the command buffer after calling this function.
  -- *
  -- * \param command_buffer a command buffer.
  -- * \returns true on success, false on error; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_WaitAndAcquireGPUSwapchainTexture
  -- * \sa SDL_AcquireGPUCommandBuffer
  -- * \sa SDL_AcquireGPUSwapchainTexture
  --  

   function SDL_CancelGPUCommandBuffer (command_buffer : access SDL_GPUCommandBuffer) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4381
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CancelGPUCommandBuffer";

  --*
  -- * Blocks the thread until the GPU is completely idle.
  -- *
  -- * \param device a GPU context.
  -- * \returns true on success, false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_WaitForGPUFences
  --  

   function SDL_WaitForGPUIdle (device : access SDL_GPUDevice) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4395
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitForGPUIdle";

  --*
  -- * Blocks the thread until the given fences are signaled.
  -- *
  -- * \param device a GPU context.
  -- * \param wait_all if 0, wait for any fence to be signaled, if 1, wait for all
  -- *                 fences to be signaled.
  -- * \param fences an array of fences to wait on.
  -- * \param num_fences the number of fences in the fences array.
  -- * \returns true on success, false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  -- * \sa SDL_WaitForGPUIdle
  --  

   function SDL_WaitForGPUFences
     (device : access SDL_GPUDevice;
      wait_all : Extensions.bool;
      fences : System.Address;
      num_fences : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4414
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitForGPUFences";

  --*
  -- * Checks the status of a fence.
  -- *
  -- * \param device a GPU context.
  -- * \param fence a fence.
  -- * \returns true if the fence is signaled, false if it is not.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  --  

   function SDL_QueryGPUFence (device : access SDL_GPUDevice; fence : access SDL_GPUFence) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4431
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_QueryGPUFence";

  --*
  -- * Releases a fence obtained from SDL_SubmitGPUCommandBufferAndAcquireFence.
  -- *
  -- * You must not reference the fence after calling this function.
  -- *
  -- * \param device a GPU context.
  -- * \param fence a fence.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SubmitGPUCommandBufferAndAcquireFence
  --  

   procedure SDL_ReleaseGPUFence (device : access SDL_GPUDevice; fence : access SDL_GPUFence)  -- /usr/local/include/SDL3/SDL_gpu.h:4447
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReleaseGPUFence";

  -- Format Info  
  --*
  -- * Obtains the texel block size for a texture format.
  -- *
  -- * \param format the texture format you want to know the texel size of.
  -- * \returns the texel block size of the texture format.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_UploadToGPUTexture
  --  

   function SDL_GPUTextureFormatTexelBlockSize (format : SDL_GPUTextureFormat) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_gpu.h:4463
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GPUTextureFormatTexelBlockSize";

  --*
  -- * Determines whether a texture format is supported for a given type and
  -- * usage.
  -- *
  -- * \param device a GPU context.
  -- * \param format the texture format to check.
  -- * \param type the type of texture (2D, 3D, Cube).
  -- * \param usage a bitmask of all usage scenarios to check.
  -- * \returns whether the texture format is supported for this type and usage.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GPUTextureSupportsFormat
     (device : access SDL_GPUDevice;
      format : SDL_GPUTextureFormat;
      c_type : SDL_GPUTextureType;
      usage : SDL_GPUTextureUsageFlags) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4478
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GPUTextureSupportsFormat";

  --*
  -- * Determines if a sample count for a texture format is supported.
  -- *
  -- * \param device a GPU context.
  -- * \param format the texture format to check.
  -- * \param sample_count the sample count to check.
  -- * \returns whether the sample count is supported for this texture format.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GPUTextureSupportsSampleCount
     (device : access SDL_GPUDevice;
      format : SDL_GPUTextureFormat;
      sample_count : SDL_GPUSampleCount) return Extensions.bool  -- /usr/local/include/SDL3/SDL_gpu.h:4494
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GPUTextureSupportsSampleCount";

  --*
  -- * Calculate the size in bytes of a texture format with dimensions.
  -- *
  -- * \param format a texture format.
  -- * \param width width in pixels.
  -- * \param height height in pixels.
  -- * \param depth_or_layer_count depth for 3D textures or layer count otherwise.
  -- * \returns the size of a texture with this format and dimensions.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_CalculateGPUTextureFormatSize
     (format : SDL_GPUTextureFormat;
      width : SDL3_SDL_stdinc_h.Uint32;
      height : SDL3_SDL_stdinc_h.Uint32;
      depth_or_layer_count : SDL3_SDL_stdinc_h.Uint32) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_gpu.h:4510
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CalculateGPUTextureFormatSize";

  --*
  -- * Get the SDL pixel format corresponding to a GPU texture format.
  -- *
  -- * \param format a texture format.
  -- * \returns the corresponding pixel format, or SDL_PIXELFORMAT_UNKNOWN if
  -- *          there is no corresponding pixel format.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_GetPixelFormatFromGPUTextureFormat (format : SDL_GPUTextureFormat) return SDL3_SDL_pixels_h.SDL_PixelFormat  -- /usr/local/include/SDL3/SDL_gpu.h:4525
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetPixelFormatFromGPUTextureFormat";

  --*
  -- * Get the GPU texture format corresponding to an SDL pixel format.
  -- *
  -- * \param format a pixel format.
  -- * \returns the corresponding GPU texture format, or
  -- *          SDL_GPU_TEXTUREFORMAT_INVALID if there is no corresponding GPU
  -- *          texture format.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_GetGPUTextureFormatFromPixelFormat (format : SDL3_SDL_pixels_h.SDL_PixelFormat) return SDL_GPUTextureFormat  -- /usr/local/include/SDL3/SDL_gpu.h:4537
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetGPUTextureFormatFromPixelFormat";

  --*
  -- * Call this to suspend GPU operation on Xbox when you receive the
  -- * SDL_EVENT_DID_ENTER_BACKGROUND event.
  -- *
  -- * Do NOT call any SDL_GPU functions after calling this function! This must
  -- * also be called before calling SDL_GDKSuspendComplete.
  -- *
  -- * \param device a GPU context.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddEventWatch
  --  

  --*
  -- * Call this to resume GPU operation on Xbox when you receive the
  -- * SDL_EVENT_WILL_ENTER_FOREGROUND event.
  -- *
  -- * When resuming, this function MUST be called before calling any other
  -- * SDL_GPU functions.
  -- *
  -- * \param device a GPU context.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddEventWatch
  --  

end SDL3_SDL_gpu_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
