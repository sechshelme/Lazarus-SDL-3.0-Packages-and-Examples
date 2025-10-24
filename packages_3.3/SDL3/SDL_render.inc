  {$IFDEF read_interface}

const
  SDL_SOFTWARE_RENDERER = 'software';
  SDL_GPU_RENDERER = 'gpu';

type
  TSDL_Vertex = record
    position: TSDL_FPoint;
    color: TSDL_FColor;
    tex_coord: TSDL_FPoint;
  end;
  PSDL_Vertex = ^TSDL_Vertex;

type
  PSDL_TextureAccess = ^TSDL_TextureAccess;
  TSDL_TextureAccess = longint;

const
  SDL_TEXTUREACCESS_STATIC = 0;
  SDL_TEXTUREACCESS_STREAMING = 1;
  SDL_TEXTUREACCESS_TARGET = 2;

type
  PSDL_TextureAddressMode = ^TSDL_TextureAddressMode;
  TSDL_TextureAddressMode = longint;

const
  SDL_TEXTURE_ADDRESS_INVALID = -(1);
  SDL_TEXTURE_ADDRESS_AUTO = (-(1)) + 1;
  SDL_TEXTURE_ADDRESS_CLAMP = (-(1)) + 2;
  SDL_TEXTURE_ADDRESS_WRAP = (-(1)) + 3;

type
  PSDL_RendererLogicalPresentation = ^TSDL_RendererLogicalPresentation;
  TSDL_RendererLogicalPresentation = longint;

const
  SDL_LOGICAL_PRESENTATION_DISABLED = 0;
  SDL_LOGICAL_PRESENTATION_STRETCH = 1;
  SDL_LOGICAL_PRESENTATION_LETTERBOX = 2;
  SDL_LOGICAL_PRESENTATION_OVERSCAN = 3;
  SDL_LOGICAL_PRESENTATION_INTEGER_SCALE = 4;

type
  PSDL_Renderer = type Pointer;
  PPSDL_Renderer = ^PSDL_Renderer;

type
  TSDL_Texture = record
    format: TSDL_PixelFormat;
    w: longint;
    h: longint;
    refcount: longint;
  end;
  PSDL_Texture = ^TSDL_Texture;

function SDL_GetNumRenderDrivers: longint; cdecl; external libSDL3;
function SDL_GetRenderDriver(index: longint): pchar; cdecl; external libSDL3;
function SDL_CreateWindowAndRenderer(title: pchar; width: longint; height: longint; window_flags: TSDL_WindowFlags; window: PPSDL_Window;
  renderer: PPSDL_Renderer): Tbool; cdecl; external libSDL3;
function SDL_CreateRenderer(window: PSDL_Window; name: pchar): PSDL_Renderer; cdecl; external libSDL3;
function SDL_CreateRendererWithProperties(props: TSDL_PropertiesID): PSDL_Renderer; cdecl; external libSDL3;

const
  SDL_PROP_RENDERER_CREATE_NAME_STRING = 'SDL.renderer.create.name';
  SDL_PROP_RENDERER_CREATE_WINDOW_POINTER = 'SDL.renderer.create.window';
  SDL_PROP_RENDERER_CREATE_SURFACE_POINTER = 'SDL.renderer.create.surface';
  SDL_PROP_RENDERER_CREATE_OUTPUT_COLORSPACE_NUMBER = 'SDL.renderer.create.output_colorspace';
  SDL_PROP_RENDERER_CREATE_PRESENT_VSYNC_NUMBER = 'SDL.renderer.create.present_vsync';
  SDL_PROP_RENDERER_CREATE_GPU_DEVICE_POINTER = 'SDL.renderer.create.gpu.device';
  SDL_PROP_RENDERER_CREATE_GPU_SHADERS_SPIRV_BOOLEAN = 'SDL.renderer.create.gpu.shaders_spirv';
  SDL_PROP_RENDERER_CREATE_GPU_SHADERS_DXIL_BOOLEAN = 'SDL.renderer.create.gpu.shaders_dxil';
  SDL_PROP_RENDERER_CREATE_GPU_SHADERS_MSL_BOOLEAN = 'SDL.renderer.create.gpu.shaders_msl';
  SDL_PROP_RENDERER_CREATE_VULKAN_INSTANCE_POINTER = 'SDL.renderer.create.vulkan.instance';
  SDL_PROP_RENDERER_CREATE_VULKAN_SURFACE_NUMBER = 'SDL.renderer.create.vulkan.surface';
  SDL_PROP_RENDERER_CREATE_VULKAN_PHYSICAL_DEVICE_POINTER = 'SDL.renderer.create.vulkan.physical_device';
  SDL_PROP_RENDERER_CREATE_VULKAN_DEVICE_POINTER = 'SDL.renderer.create.vulkan.device';
  SDL_PROP_RENDERER_CREATE_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = 'SDL.renderer.create.vulkan.graphics_queue_family_index';
  SDL_PROP_RENDERER_CREATE_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = 'SDL.renderer.create.vulkan.present_queue_family_index';

function SDL_CreateGPURenderer(device: PSDL_GPUDevice; window: PSDL_Window): PSDL_Renderer; cdecl; external libSDL3;
function SDL_GetGPURendererDevice(renderer: PSDL_Renderer): PSDL_GPUDevice; cdecl; external libSDL3;
function SDL_CreateSoftwareRenderer(surface: PSDL_Surface): PSDL_Renderer; cdecl; external libSDL3;
function SDL_GetRenderer(window: PSDL_Window): PSDL_Renderer; cdecl; external libSDL3;
function SDL_GetRenderWindow(renderer: PSDL_Renderer): PSDL_Window; cdecl; external libSDL3;
function SDL_GetRendererName(renderer: PSDL_Renderer): pchar; cdecl; external libSDL3;
function SDL_GetRendererProperties(renderer: PSDL_Renderer): TSDL_PropertiesID; cdecl; external libSDL3;

const
  SDL_PROP_RENDERER_NAME_STRING = 'SDL.renderer.name';
  SDL_PROP_RENDERER_WINDOW_POINTER = 'SDL.renderer.window';
  SDL_PROP_RENDERER_SURFACE_POINTER = 'SDL.renderer.surface';
  SDL_PROP_RENDERER_VSYNC_NUMBER = 'SDL.renderer.vsync';
  SDL_PROP_RENDERER_MAX_TEXTURE_SIZE_NUMBER = 'SDL.renderer.max_texture_size';
  SDL_PROP_RENDERER_TEXTURE_FORMATS_POINTER = 'SDL.renderer.texture_formats';
  SDL_PROP_RENDERER_TEXTURE_WRAPPING_BOOLEAN = 'SDL.renderer.texture_wrapping';
  SDL_PROP_RENDERER_OUTPUT_COLORSPACE_NUMBER = 'SDL.renderer.output_colorspace';
  SDL_PROP_RENDERER_HDR_ENABLED_BOOLEAN = 'SDL.renderer.HDR_enabled';
  SDL_PROP_RENDERER_SDR_WHITE_POINT_FLOAT = 'SDL.renderer.SDR_white_point';
  SDL_PROP_RENDERER_HDR_HEADROOM_FLOAT = 'SDL.renderer.HDR_headroom';
  SDL_PROP_RENDERER_D3D9_DEVICE_POINTER = 'SDL.renderer.d3d9.device';
  SDL_PROP_RENDERER_D3D11_DEVICE_POINTER = 'SDL.renderer.d3d11.device';
  SDL_PROP_RENDERER_D3D11_SWAPCHAIN_POINTER = 'SDL.renderer.d3d11.swap_chain';
  SDL_PROP_RENDERER_D3D12_DEVICE_POINTER = 'SDL.renderer.d3d12.device';
  SDL_PROP_RENDERER_D3D12_SWAPCHAIN_POINTER = 'SDL.renderer.d3d12.swap_chain';
  SDL_PROP_RENDERER_D3D12_COMMAND_QUEUE_POINTER = 'SDL.renderer.d3d12.command_queue';
  SDL_PROP_RENDERER_VULKAN_INSTANCE_POINTER = 'SDL.renderer.vulkan.instance';
  SDL_PROP_RENDERER_VULKAN_SURFACE_NUMBER = 'SDL.renderer.vulkan.surface';
  SDL_PROP_RENDERER_VULKAN_PHYSICAL_DEVICE_POINTER = 'SDL.renderer.vulkan.physical_device';
  SDL_PROP_RENDERER_VULKAN_DEVICE_POINTER = 'SDL.renderer.vulkan.device';
  SDL_PROP_RENDERER_VULKAN_GRAPHICS_QUEUE_FAMILY_INDEX_NUMBER = 'SDL.renderer.vulkan.graphics_queue_family_index';
  SDL_PROP_RENDERER_VULKAN_PRESENT_QUEUE_FAMILY_INDEX_NUMBER = 'SDL.renderer.vulkan.present_queue_family_index';
  SDL_PROP_RENDERER_VULKAN_SWAPCHAIN_IMAGE_COUNT_NUMBER = 'SDL.renderer.vulkan.swapchain_image_count';
  SDL_PROP_RENDERER_GPU_DEVICE_POINTER = 'SDL.renderer.gpu.device';

function SDL_GetRenderOutputSize(renderer: PSDL_Renderer; w: Plongint; h: Plongint): Tbool; cdecl; external libSDL3;
function SDL_GetCurrentRenderOutputSize(renderer: PSDL_Renderer; w: Plongint; h: Plongint): Tbool; cdecl; external libSDL3;
function SDL_CreateTexture(renderer: PSDL_Renderer; format: TSDL_PixelFormat; access: TSDL_TextureAccess; w: longint; h: longint): PSDL_Texture; cdecl; external libSDL3;
function SDL_CreateTextureFromSurface(renderer: PSDL_Renderer; surface: PSDL_Surface): PSDL_Texture; cdecl; external libSDL3;
function SDL_CreateTextureWithProperties(renderer: PSDL_Renderer; props: TSDL_PropertiesID): PSDL_Texture; cdecl; external libSDL3;

const
  SDL_PROP_TEXTURE_CREATE_COLORSPACE_NUMBER = 'SDL.texture.create.colorspace';
  SDL_PROP_TEXTURE_CREATE_FORMAT_NUMBER = 'SDL.texture.create.format';
  SDL_PROP_TEXTURE_CREATE_ACCESS_NUMBER = 'SDL.texture.create.access';
  SDL_PROP_TEXTURE_CREATE_WIDTH_NUMBER = 'SDL.texture.create.width';
  SDL_PROP_TEXTURE_CREATE_HEIGHT_NUMBER = 'SDL.texture.create.height';
  SDL_PROP_TEXTURE_CREATE_PALETTE_POINTER = 'SDL.texture.create.palette';
  SDL_PROP_TEXTURE_CREATE_SDR_WHITE_POINT_FLOAT = 'SDL.texture.create.SDR_white_point';
  SDL_PROP_TEXTURE_CREATE_HDR_HEADROOM_FLOAT = 'SDL.texture.create.HDR_headroom';
  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_POINTER = 'SDL.texture.create.d3d11.texture';
  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_U_POINTER = 'SDL.texture.create.d3d11.texture_u';
  SDL_PROP_TEXTURE_CREATE_D3D11_TEXTURE_V_POINTER = 'SDL.texture.create.d3d11.texture_v';
  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_POINTER = 'SDL.texture.create.d3d12.texture';
  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_U_POINTER = 'SDL.texture.create.d3d12.texture_u';
  SDL_PROP_TEXTURE_CREATE_D3D12_TEXTURE_V_POINTER = 'SDL.texture.create.d3d12.texture_v';
  SDL_PROP_TEXTURE_CREATE_METAL_PIXELBUFFER_POINTER = 'SDL.texture.create.metal.pixelbuffer';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_NUMBER = 'SDL.texture.create.opengl.texture';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_UV_NUMBER = 'SDL.texture.create.opengl.texture_uv';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_U_NUMBER = 'SDL.texture.create.opengl.texture_u';
  SDL_PROP_TEXTURE_CREATE_OPENGL_TEXTURE_V_NUMBER = 'SDL.texture.create.opengl.texture_v';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_NUMBER = 'SDL.texture.create.opengles2.texture';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_UV_NUMBER = 'SDL.texture.create.opengles2.texture_uv';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_U_NUMBER = 'SDL.texture.create.opengles2.texture_u';
  SDL_PROP_TEXTURE_CREATE_OPENGLES2_TEXTURE_V_NUMBER = 'SDL.texture.create.opengles2.texture_v';
  SDL_PROP_TEXTURE_CREATE_VULKAN_TEXTURE_NUMBER = 'SDL.texture.create.vulkan.texture';
  SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_POINTER = 'SDL.texture.create.gpu.texture';
  SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_UV_POINTER = 'SDL.texture.create.gpu.texture_uv';
  SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_U_POINTER = 'SDL.texture.create.gpu.texture_u';
  SDL_PROP_TEXTURE_CREATE_GPU_TEXTURE_V_POINTER = 'SDL.texture.create.gpu.texture_v';

function SDL_GetTextureProperties(texture: PSDL_Texture): TSDL_PropertiesID; cdecl; external libSDL3;

const
  SDL_PROP_TEXTURE_COLORSPACE_NUMBER = 'SDL.texture.colorspace';
  SDL_PROP_TEXTURE_FORMAT_NUMBER = 'SDL.texture.format';
  SDL_PROP_TEXTURE_ACCESS_NUMBER = 'SDL.texture.access';
  SDL_PROP_TEXTURE_WIDTH_NUMBER = 'SDL.texture.width';
  SDL_PROP_TEXTURE_HEIGHT_NUMBER = 'SDL.texture.height';
  SDL_PROP_TEXTURE_SDR_WHITE_POINT_FLOAT = 'SDL.texture.SDR_white_point';
  SDL_PROP_TEXTURE_HDR_HEADROOM_FLOAT = 'SDL.texture.HDR_headroom';
  SDL_PROP_TEXTURE_D3D11_TEXTURE_POINTER = 'SDL.texture.d3d11.texture';
  SDL_PROP_TEXTURE_D3D11_TEXTURE_U_POINTER = 'SDL.texture.d3d11.texture_u';
  SDL_PROP_TEXTURE_D3D11_TEXTURE_V_POINTER = 'SDL.texture.d3d11.texture_v';
  SDL_PROP_TEXTURE_D3D12_TEXTURE_POINTER = 'SDL.texture.d3d12.texture';
  SDL_PROP_TEXTURE_D3D12_TEXTURE_U_POINTER = 'SDL.texture.d3d12.texture_u';
  SDL_PROP_TEXTURE_D3D12_TEXTURE_V_POINTER = 'SDL.texture.d3d12.texture_v';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_NUMBER = 'SDL.texture.opengl.texture';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_UV_NUMBER = 'SDL.texture.opengl.texture_uv';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_U_NUMBER = 'SDL.texture.opengl.texture_u';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_V_NUMBER = 'SDL.texture.opengl.texture_v';
  SDL_PROP_TEXTURE_OPENGL_TEXTURE_TARGET_NUMBER = 'SDL.texture.opengl.target';
  SDL_PROP_TEXTURE_OPENGL_TEX_W_FLOAT = 'SDL.texture.opengl.tex_w';
  SDL_PROP_TEXTURE_OPENGL_TEX_H_FLOAT = 'SDL.texture.opengl.tex_h';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_NUMBER = 'SDL.texture.opengles2.texture';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_UV_NUMBER = 'SDL.texture.opengles2.texture_uv';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_U_NUMBER = 'SDL.texture.opengles2.texture_u';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_V_NUMBER = 'SDL.texture.opengles2.texture_v';
  SDL_PROP_TEXTURE_OPENGLES2_TEXTURE_TARGET_NUMBER = 'SDL.texture.opengles2.target';
  SDL_PROP_TEXTURE_VULKAN_TEXTURE_NUMBER = 'SDL.texture.vulkan.texture';
  SDL_PROP_TEXTURE_GPU_TEXTURE_POINTER = 'SDL.texture.gpu.texture';
  SDL_PROP_TEXTURE_GPU_TEXTURE_UV_POINTER = 'SDL.texture.gpu.texture_uv';
  SDL_PROP_TEXTURE_GPU_TEXTURE_U_POINTER = 'SDL.texture.gpu.texture_u';
  SDL_PROP_TEXTURE_GPU_TEXTURE_V_POINTER = 'SDL.texture.gpu.texture_v';

function SDL_GetRendererFromTexture(texture: PSDL_Texture): PSDL_Renderer; cdecl; external libSDL3;
function SDL_GetTextureSize(texture: PSDL_Texture; w: Psingle; h: Psingle): Tbool; cdecl; external libSDL3;
function SDL_SetTexturePalette(texture: PSDL_Texture; palette: PSDL_Palette): Tbool; cdecl; external libSDL3;
function SDL_GetTexturePalette(texture: PSDL_Texture): PSDL_Palette; cdecl; external libSDL3;
function SDL_SetTextureColorMod(texture: PSDL_Texture; r: TUint8; g: TUint8; b: TUint8): Tbool; cdecl; external libSDL3;
function SDL_SetTextureColorModFloat(texture: PSDL_Texture; r: single; g: single; b: single): Tbool; cdecl; external libSDL3;
function SDL_GetTextureColorMod(texture: PSDL_Texture; r: PUint8; g: PUint8; b: PUint8): Tbool; cdecl; external libSDL3;
function SDL_GetTextureColorModFloat(texture: PSDL_Texture; r: Psingle; g: Psingle; b: Psingle): Tbool; cdecl; external libSDL3;
function SDL_SetTextureAlphaMod(texture: PSDL_Texture; alpha: TUint8): Tbool; cdecl; external libSDL3;
function SDL_SetTextureAlphaModFloat(texture: PSDL_Texture; alpha: single): Tbool; cdecl; external libSDL3;
function SDL_GetTextureAlphaMod(texture: PSDL_Texture; alpha: PUint8): Tbool; cdecl; external libSDL3;
function SDL_GetTextureAlphaModFloat(texture: PSDL_Texture; alpha: Psingle): Tbool; cdecl; external libSDL3;
function SDL_SetTextureBlendMode(texture: PSDL_Texture; blendMode: TSDL_BlendMode): Tbool; cdecl; external libSDL3;
function SDL_GetTextureBlendMode(texture: PSDL_Texture; blendMode: PSDL_BlendMode): Tbool; cdecl; external libSDL3;
function SDL_SetTextureScaleMode(texture: PSDL_Texture; scaleMode: TSDL_ScaleMode): Tbool; cdecl; external libSDL3;
function SDL_GetTextureScaleMode(texture: PSDL_Texture; scaleMode: PSDL_ScaleMode): Tbool; cdecl; external libSDL3;
function SDL_UpdateTexture(texture: PSDL_Texture; rect: PSDL_Rect; pixels: pointer; pitch: longint): Tbool; cdecl; external libSDL3;
function SDL_UpdateYUVTexture(texture: PSDL_Texture; rect: PSDL_Rect; Yplane: PUint8; Ypitch: longint; Uplane: PUint8;
  Upitch: longint; Vplane: PUint8; Vpitch: longint): Tbool; cdecl; external libSDL3;
function SDL_UpdateNVTexture(texture: PSDL_Texture; rect: PSDL_Rect; Yplane: PUint8; Ypitch: longint; UVplane: PUint8;
  UVpitch: longint): Tbool; cdecl; external libSDL3;
function SDL_LockTexture(texture: PSDL_Texture; rect: PSDL_Rect; pixels: Ppointer; pitch: Plongint): Tbool; cdecl; external libSDL3;
function SDL_LockTextureToSurface(texture: PSDL_Texture; rect: PSDL_Rect; surface: PPSDL_Surface): Tbool; cdecl; external libSDL3;
procedure SDL_UnlockTexture(texture: PSDL_Texture); cdecl; external libSDL3;
function SDL_SetRenderTarget(renderer: PSDL_Renderer; texture: PSDL_Texture): Tbool; cdecl; external libSDL3;
function SDL_GetRenderTarget(renderer: PSDL_Renderer): PSDL_Texture; cdecl; external libSDL3;
function SDL_SetRenderLogicalPresentation(renderer: PSDL_Renderer; w: longint; h: longint; mode: TSDL_RendererLogicalPresentation): Tbool; cdecl; external libSDL3;
function SDL_GetRenderLogicalPresentation(renderer: PSDL_Renderer; w: Plongint; h: Plongint; mode: PSDL_RendererLogicalPresentation): Tbool; cdecl; external libSDL3;
function SDL_GetRenderLogicalPresentationRect(renderer: PSDL_Renderer; rect: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_RenderCoordinatesFromWindow(renderer: PSDL_Renderer; window_x: single; window_y: single; x: Psingle; y: Psingle): Tbool; cdecl; external libSDL3;
function SDL_RenderCoordinatesToWindow(renderer: PSDL_Renderer; x: single; y: single; window_x: Psingle; window_y: Psingle): Tbool; cdecl; external libSDL3;
function SDL_ConvertEventToRenderCoordinates(renderer: PSDL_Renderer; event: PSDL_Event): Tbool; cdecl; external libSDL3;
function SDL_SetRenderViewport(renderer: PSDL_Renderer; rect: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_GetRenderViewport(renderer: PSDL_Renderer; rect: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_RenderViewportSet(renderer: PSDL_Renderer): Tbool; cdecl; external libSDL3;
function SDL_GetRenderSafeArea(renderer: PSDL_Renderer; rect: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_SetRenderClipRect(renderer: PSDL_Renderer; rect: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_GetRenderClipRect(renderer: PSDL_Renderer; rect: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_RenderClipEnabled(renderer: PSDL_Renderer): Tbool; cdecl; external libSDL3;
function SDL_SetRenderScale(renderer: PSDL_Renderer; scaleX: single; scaleY: single): Tbool; cdecl; external libSDL3;
function SDL_GetRenderScale(renderer: PSDL_Renderer; scaleX: Psingle; scaleY: Psingle): Tbool; cdecl; external libSDL3;
function SDL_SetRenderDrawColor(renderer: PSDL_Renderer; r: TUint8; g: TUint8; b: TUint8; a: TUint8): Tbool; cdecl; external libSDL3;
function SDL_SetRenderDrawColorFloat(renderer: PSDL_Renderer; r: single; g: single; b: single; a: single): Tbool; cdecl; external libSDL3;
function SDL_GetRenderDrawColor(renderer: PSDL_Renderer; r: PUint8; g: PUint8; b: PUint8; a: PUint8): Tbool; cdecl; external libSDL3;
function SDL_GetRenderDrawColorFloat(renderer: PSDL_Renderer; r: Psingle; g: Psingle; b: Psingle; a: Psingle): Tbool; cdecl; external libSDL3;
function SDL_SetRenderColorScale(renderer: PSDL_Renderer; scale: single): Tbool; cdecl; external libSDL3;
function SDL_GetRenderColorScale(renderer: PSDL_Renderer; scale: Psingle): Tbool; cdecl; external libSDL3;
function SDL_SetRenderDrawBlendMode(renderer: PSDL_Renderer; blendMode: TSDL_BlendMode): Tbool; cdecl; external libSDL3;
function SDL_GetRenderDrawBlendMode(renderer: PSDL_Renderer; blendMode: PSDL_BlendMode): Tbool; cdecl; external libSDL3;
function SDL_RenderClear(renderer: PSDL_Renderer): Tbool; cdecl; external libSDL3;
function SDL_RenderPoint(renderer: PSDL_Renderer; x: single; y: single): Tbool; cdecl; external libSDL3;
function SDL_RenderPoints(renderer: PSDL_Renderer; points: PSDL_FPoint; count: longint): Tbool; cdecl; external libSDL3;
function SDL_RenderLine(renderer: PSDL_Renderer; x1: single; y1: single; x2: single; y2: single): Tbool; cdecl; external libSDL3;
function SDL_RenderLines(renderer: PSDL_Renderer; points: PSDL_FPoint; count: longint): Tbool; cdecl; external libSDL3;
function SDL_RenderRect(renderer: PSDL_Renderer; rect: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_RenderRects(renderer: PSDL_Renderer; rects: PSDL_FRect; count: longint): Tbool; cdecl; external libSDL3;
function SDL_RenderFillRect(renderer: PSDL_Renderer; rect: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_RenderFillRects(renderer: PSDL_Renderer; rects: PSDL_FRect; count: longint): Tbool; cdecl; external libSDL3;
function SDL_RenderTexture(renderer: PSDL_Renderer; texture: PSDL_Texture; srcrect: PSDL_FRect; dstrect: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_RenderTextureRotated(renderer: PSDL_Renderer; texture: PSDL_Texture; srcrect: PSDL_FRect; dstrect: PSDL_FRect; angle: double;
  center: PSDL_FPoint; flip: TSDL_FlipMode): Tbool; cdecl; external libSDL3;
function SDL_RenderTextureAffine(renderer: PSDL_Renderer; texture: PSDL_Texture; srcrect: PSDL_FRect; origin: PSDL_FPoint; right: PSDL_FPoint;
  down: PSDL_FPoint): Tbool; cdecl; external libSDL3;
function SDL_RenderTextureTiled(renderer: PSDL_Renderer; texture: PSDL_Texture; srcrect: PSDL_FRect; scale: single; dstrect: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_RenderTexture9Grid(renderer: PSDL_Renderer; texture: PSDL_Texture; srcrect: PSDL_FRect; left_width: single; right_width: single;
  top_height: single; bottom_height: single; scale: single; dstrect: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_RenderTexture9GridTiled(renderer: PSDL_Renderer; texture: PSDL_Texture; srcrect: PSDL_FRect; left_width: single; right_width: single;
  top_height: single; bottom_height: single; scale: single; dstrect: PSDL_FRect; tileScale: single): Tbool; cdecl; external libSDL3;
function SDL_RenderGeometry(renderer: PSDL_Renderer; texture: PSDL_Texture; vertices: PSDL_Vertex; num_vertices: longint; indices: Plongint;
  num_indices: longint): Tbool; cdecl; external libSDL3;
function SDL_RenderGeometryRaw(renderer: PSDL_Renderer; texture: PSDL_Texture; xy: Psingle; xy_stride: longint; color: PSDL_FColor;
  color_stride: longint; uv: Psingle; uv_stride: longint; num_vertices: longint; indices: pointer;
  num_indices: longint; size_indices: longint): Tbool; cdecl; external libSDL3;
function SDL_SetRenderTextureAddressMode(renderer: PSDL_Renderer; u_mode: TSDL_TextureAddressMode; v_mode: TSDL_TextureAddressMode): Tbool; cdecl; external libSDL3;
function SDL_GetRenderTextureAddressMode(renderer: PSDL_Renderer; u_mode: PSDL_TextureAddressMode; v_mode: PSDL_TextureAddressMode): Tbool; cdecl; external libSDL3;
function SDL_RenderReadPixels(renderer: PSDL_Renderer; rect: PSDL_Rect): PSDL_Surface; cdecl; external libSDL3;
function SDL_RenderPresent(renderer: PSDL_Renderer): Tbool; cdecl; external libSDL3;
procedure SDL_DestroyTexture(texture: PSDL_Texture); cdecl; external libSDL3;
procedure SDL_DestroyRenderer(renderer: PSDL_Renderer); cdecl; external libSDL3;
function SDL_FlushRenderer(renderer: PSDL_Renderer): Tbool; cdecl; external libSDL3;
function SDL_GetRenderMetalLayer(renderer: PSDL_Renderer): pointer; cdecl; external libSDL3;
function SDL_GetRenderMetalCommandEncoder(renderer: PSDL_Renderer): pointer; cdecl; external libSDL3;
function SDL_AddVulkanRenderSemaphores(renderer: PSDL_Renderer; wait_stage_mask: TUint32; wait_semaphore: TSint64; signal_semaphore: TSint64): Tbool; cdecl; external libSDL3;
function SDL_SetRenderVSync(renderer: PSDL_Renderer; vsync: longint): Tbool; cdecl; external libSDL3;

const
  SDL_RENDERER_VSYNC_DISABLED = 0;
  SDL_RENDERER_VSYNC_ADAPTIVE = -(1);

function SDL_GetRenderVSync(renderer: PSDL_Renderer; vsync: Plongint): Tbool; cdecl; external libSDL3;

const
  SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE = 8;

function SDL_RenderDebugText(renderer: PSDL_Renderer; x: single; y: single; str: pchar): Tbool; cdecl; external libSDL3;
function SDL_RenderDebugTextFormat(renderer: PSDL_Renderer; x: single; y: single; fmt: pchar): Tbool; cdecl; varargs; external libSDL3;
function SDL_SetDefaultTextureScaleMode(renderer: PSDL_Renderer; scale_mode: TSDL_ScaleMode): Tbool; cdecl; external libSDL3;
function SDL_GetDefaultTextureScaleMode(renderer: PSDL_Renderer; scale_mode: PSDL_ScaleMode): Tbool; cdecl; external libSDL3;

type
  TSDL_GPURenderStateCreateInfo = record
    fragment_shader: PSDL_GPUShader;
    num_sampler_bindings: TSint32;
    sampler_bindings: PSDL_GPUTextureSamplerBinding;
    num_storage_textures: TSint32;
    storage_textures: ^PSDL_GPUTexture;
    num_storage_buffers: TSint32;
    storage_buffers: ^PSDL_GPUBuffer;
    props: TSDL_PropertiesID;
  end;
  PSDL_GPURenderStateCreateInfo = ^TSDL_GPURenderStateCreateInfo;

  PSDL_GPURenderState = type Pointer;

function SDL_CreateGPURenderState(renderer: PSDL_Renderer; createinfo: PSDL_GPURenderStateCreateInfo): PSDL_GPURenderState; cdecl; external libSDL3;
function SDL_SetGPURenderStateFragmentUniforms(state: PSDL_GPURenderState; slot_index: TUint32; data: pointer; length: TUint32): Tbool; cdecl; external libSDL3;
function SDL_SetGPURenderState(renderer: PSDL_Renderer; state: PSDL_GPURenderState): Tbool; cdecl; external libSDL3;
procedure SDL_DestroyGPURenderState(state: PSDL_GPURenderState); cdecl; external libSDL3;


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
