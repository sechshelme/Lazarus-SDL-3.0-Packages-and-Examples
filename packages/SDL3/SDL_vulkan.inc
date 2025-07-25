
{$IFDEF read_interface}

type
  PVkAllocationCallbacks = type Pointer;

  TVkInstance = Pointer;          // ??????
  TVkSurfaceKHR = Pointer;        // ??????
  PVkSurfaceKHR = ^TVkSurfaceKHR; // ??????
  TVkPhysicalDevice = Pointer;

function SDL_Vulkan_LoadLibrary(path: pansichar): Tbool; cdecl; external libSDL3;
function SDL_Vulkan_GetVkGetInstanceProcAddr: TSDL_FunctionPointer; cdecl; external libSDL3;
procedure SDL_Vulkan_UnloadLibrary; cdecl; external libSDL3;
function SDL_Vulkan_GetInstanceExtensions(Count: PUint32): PPAnsiChar; cdecl; external libSDL3;
function SDL_Vulkan_CreateSurface(window: PSDL_Window; instance: TVkInstance; allocator: PVkAllocationCallbacks; surface: PVkSurfaceKHR): Tbool; cdecl; external libSDL3;
procedure SDL_Vulkan_DestroySurface(instance: TVkInstance; surface: TVkSurfaceKHR; allocator: PVkAllocationCallbacks); cdecl; external libSDL3;
function SDL_Vulkan_GetPresentationSupport(instance: TVkInstance; physicalDevice: TVkPhysicalDevice; queueFamilyIndex: TUint32): Tbool; cdecl; external libSDL3;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
