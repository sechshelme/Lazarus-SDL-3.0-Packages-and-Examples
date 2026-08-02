unit SDL3_shadercross;

interface

uses
  SDL3;

const
  {$IFDEF Linux}
  libSDL3_shadercross = 'SDL3_shadercross';
  {$ENDIF}

  {$IFDEF msWindows}
  libSDL3_shadercross = 'SDL3_shadercross.dll';
  {$ENDIF}

  {$IFDEF Darwin}
  libSDL3_shadercross = 'SDL3_shadercross.dylib';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SDL_SHADERCROSS_MAJOR_VERSION = 3;
  SDL_SHADERCROSS_MINOR_VERSION = 0;
  SDL_SHADERCROSS_MICRO_VERSION = 0;

type
  PSDL_ShaderCross_IOVarType = ^TSDL_ShaderCross_IOVarType;
  TSDL_ShaderCross_IOVarType = longint;
const
  SDL_SHADERCROSS_IOVAR_TYPE_UNKNOWN = 0;
  SDL_SHADERCROSS_IOVAR_TYPE_INT8 = 1;
  SDL_SHADERCROSS_IOVAR_TYPE_UINT8 = 2;
  SDL_SHADERCROSS_IOVAR_TYPE_INT16 = 3;
  SDL_SHADERCROSS_IOVAR_TYPE_UINT16 = 4;
  SDL_SHADERCROSS_IOVAR_TYPE_INT32 = 5;
  SDL_SHADERCROSS_IOVAR_TYPE_UINT32 = 6;
  SDL_SHADERCROSS_IOVAR_TYPE_INT64 = 7;
  SDL_SHADERCROSS_IOVAR_TYPE_UINT64 = 8;
  SDL_SHADERCROSS_IOVAR_TYPE_FLOAT16 = 9;
  SDL_SHADERCROSS_IOVAR_TYPE_FLOAT32 = 10;
  SDL_SHADERCROSS_IOVAR_TYPE_FLOAT64 = 11;

type
  PSDL_ShaderCross_ShaderStage = ^TSDL_ShaderCross_ShaderStage;
  TSDL_ShaderCross_ShaderStage = longint;
const
  SDL_SHADERCROSS_SHADERSTAGE_VERTEX = 0;
  SDL_SHADERCROSS_SHADERSTAGE_FRAGMENT = 1;
  SDL_SHADERCROSS_SHADERSTAGE_COMPUTE = 2;

type
  PSDL_ShaderCross_IOVarMetadata = ^TSDL_ShaderCross_IOVarMetadata;
  TSDL_ShaderCross_IOVarMetadata = record
    name: pchar;
    location: TUint32;
    vector_type: TSDL_ShaderCross_IOVarType;
    vector_size: TUint32;
  end;

  PSDL_ShaderCross_GraphicsShaderResourceInfo = ^TSDL_ShaderCross_GraphicsShaderResourceInfo;
  TSDL_ShaderCross_GraphicsShaderResourceInfo = record
    num_samplers: TUint32;
    num_storage_textures: TUint32;
    num_storage_buffers: TUint32;
    num_uniform_buffers: TUint32;
  end;

  PSDL_ShaderCross_GraphicsShaderMetadata = ^TSDL_ShaderCross_GraphicsShaderMetadata;
  TSDL_ShaderCross_GraphicsShaderMetadata = record
    resource_info: TSDL_ShaderCross_GraphicsShaderResourceInfo;
    num_inputs: TUint32;
    inputs: PSDL_ShaderCross_IOVarMetadata;
    num_outputs: TUint32;
    outputs: PSDL_ShaderCross_IOVarMetadata;
  end;

  PSDL_ShaderCross_ComputePipelineMetadata = ^TSDL_ShaderCross_ComputePipelineMetadata;
  TSDL_ShaderCross_ComputePipelineMetadata = record
    num_samplers: TUint32;
    num_readonly_storage_textures: TUint32;
    num_readonly_storage_buffers: TUint32;
    num_readwrite_storage_textures: TUint32;
    num_readwrite_storage_buffers: TUint32;
    num_uniform_buffers: TUint32;
    threadcount_x: TUint32;
    threadcount_y: TUint32;
    threadcount_z: TUint32;
  end;

  PSDL_ShaderCross_SPIRV_Info = ^TSDL_ShaderCross_SPIRV_Info;
  TSDL_ShaderCross_SPIRV_Info = record
    bytecode: PUint8;
    bytecode_size: Tsize_t;
    entrypoint: pchar;
    shader_stage: TSDL_ShaderCross_ShaderStage;
    props: TSDL_PropertiesID;
  end;

const
  SDL_SHADERCROSS_PROP_SHADER_DEBUG_ENABLE_BOOLEAN = 'SDL_shadercross.spirv.debug.enable';
  SDL_SHADERCROSS_PROP_SHADER_DEBUG_NAME_STRING = 'SDL_shadercross.spirv.debug.name';
  SDL_SHADERCROSS_PROP_SHADER_CULL_UNUSED_BINDINGS_BOOLEAN = 'SDL_shadercross.spirv.cull_unused_bindings';
  SDL_SHADERCROSS_PROP_SPIRV_PSSL_COMPATIBILITY_BOOLEAN = 'SDL_shadercross.spirv.pssl.compatibility';
  SDL_SHADERCROSS_PROP_SPIRV_MSL_VERSION_STRING = 'SDL_shadercross.spirv.msl.version';
  SDL_SHADERCROSS_PROP_HLSL_SKIP_SPIRV_ROUNDTRIP_BOOLEAN = 'SDL_shadercross.hlsl.skip_spirv_roundtrip';

type
  PSDL_ShaderCross_HLSL_Define = ^TSDL_ShaderCross_HLSL_Define;
  TSDL_ShaderCross_HLSL_Define = record
    name: pchar;
    value: pchar;
  end;

  PSDL_ShaderCross_HLSL_Info = ^TSDL_ShaderCross_HLSL_Info;
  TSDL_ShaderCross_HLSL_Info = record
    source: pchar;
    entrypoint: pchar;
    include_dir: pchar;
    defines: PSDL_ShaderCross_HLSL_Define;
    shader_stage: TSDL_ShaderCross_ShaderStage;
    props: TSDL_PropertiesID;
  end;

function SDL_ShaderCross_Init: Tbool; cdecl; external libSDL3_shadercross;
procedure SDL_ShaderCross_Quit; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_GetSPIRVShaderFormats: TSDL_GPUShaderFormat; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_TranspileMSLFromSPIRV(info: PSDL_ShaderCross_SPIRV_Info): pointer; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_TranspileHLSLFromSPIRV(info: PSDL_ShaderCross_SPIRV_Info): pointer; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileDXBCFromSPIRV(info: PSDL_ShaderCross_SPIRV_Info; size: Psize_t): pointer; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileDXILFromSPIRV(info: PSDL_ShaderCross_SPIRV_Info; size: Psize_t): pointer; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileGraphicsShaderFromSPIRV(device: PSDL_GPUDevice; info: PSDL_ShaderCross_SPIRV_Info; resource_info: PSDL_ShaderCross_GraphicsShaderResourceInfo; props: TSDL_PropertiesID): PSDL_GPUShader; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileComputePipelineFromSPIRV(device: PSDL_GPUDevice; info: PSDL_ShaderCross_SPIRV_Info; metadata: PSDL_ShaderCross_ComputePipelineMetadata; props: TSDL_PropertiesID): PSDL_GPUComputePipeline; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_ReflectGraphicsSPIRV(bytecode: PUint8; bytecode_size: Tsize_t; props: TSDL_PropertiesID): PSDL_ShaderCross_GraphicsShaderMetadata; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_ReflectComputeSPIRV(bytecode: PUint8; bytecode_size: Tsize_t; props: TSDL_PropertiesID): PSDL_ShaderCross_ComputePipelineMetadata; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_GetHLSLShaderFormats: TSDL_GPUShaderFormat; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileDXBCFromHLSL(info: PSDL_ShaderCross_HLSL_Info; size: Psize_t): pointer; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileDXILFromHLSL(info: PSDL_ShaderCross_HLSL_Info; size: Psize_t): pointer; cdecl; external libSDL3_shadercross;
function SDL_ShaderCross_CompileSPIRVFromHLSL(info: PSDL_ShaderCross_HLSL_Info; size: Psize_t): pointer; cdecl; external libSDL3_shadercross;

implementation


end.
