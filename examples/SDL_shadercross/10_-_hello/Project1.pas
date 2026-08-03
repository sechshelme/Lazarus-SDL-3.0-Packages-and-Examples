program project1;

uses
  SDL3,
  SDL3_shadercross;

  procedure main;
  var
    f: TSDL_GPUShaderFormat;
  begin
    SDL_ShaderCross_Init;

    f := SDL_ShaderCross_GetSPIRVShaderFormats;

    if (f and SDL_GPU_SHADERFORMAT_PRIVATE) = SDL_GPU_SHADERFORMAT_PRIVATE then begin
      WriteLn('SDL_GPU_SHADERFORMAT_PRIVATE');
    end;
    if (f and SDL_GPU_SHADERFORMAT_SPIRV) = SDL_GPU_SHADERFORMAT_SPIRV then begin
      WriteLn('SDL_GPU_SHADERFORMAT_SPIRV');
    end;
    if (f and SDL_GPU_SHADERFORMAT_DXBC) = SDL_GPU_SHADERFORMAT_DXBC then begin
      WriteLn('SDL_GPU_SHADERFORMAT_DXBC');
    end;
    if (f and SDL_GPU_SHADERFORMAT_DXIL) = SDL_GPU_SHADERFORMAT_DXIL then begin
      WriteLn('SDL_GPU_SHADERFORMAT_DXIL');
    end;
    if (f and SDL_GPU_SHADERFORMAT_MSL) = SDL_GPU_SHADERFORMAT_MSL then begin
      WriteLn('SDL_GPU_SHADERFORMAT_MSL');
    end;
    if (f and SDL_GPU_SHADERFORMAT_METALLIB) = SDL_GPU_SHADERFORMAT_METALLIB then begin
      WriteLn('SDL_GPU_SHADERFORMAT_METALLIB');
    end;

    SDL_ShaderCross_Quit;
  end;


begin
  main;
end.
