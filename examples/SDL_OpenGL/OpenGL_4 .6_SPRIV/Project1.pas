program Project1;

uses
  SDL3,
  fp_shaderc,
  oglglad_gl,
  oglVector;
  //  oglShader;

const
  Screen_Widht = 320;
  Screen_Height = 240;

type
  TAnsiCharArray = array of ansichar;

var
  // SDL
  glcontext: TSDL_GLContext;
  window: PSDL_Window;

  quit: boolean = False;
  e: TSDL_Event;

  // OpenGL

  prog: TGLuint;

  VAOs: array [(vaTriangle)] of TGLuint;
  Mesh_Buffers: array [(mbTriangle)] of TGLuint;

const
  vertices: array of TVector2f = (
    (-0.90, -0.90), (0.85, -0.90), (-0.90, 0.85),
    (0.90, -0.85), (0.90, 0.90), (-0.85, 0.90));

  vertex_shader_text =
    '#version 460 core' + #10 +
    '' + #10 +
    'layout (location = 0) in vec2 vPosition;' + #10 +
    '' + #10 +
    'void main()' + #10 +
    '{' + #10 +
    '  gl_Position =  vec4(vPosition, 0.0, 1.0);' + #10 +
    '}';

  fragment_shader_text =
    '#version 460 core' + #10 +
    '' + #10 +
    'layout (location = 0) out vec4 fColor;' + #10 +
    '' + #10 +
    'void main()' + #10 +
    '{' + #10 +
    '  fColor = vec4(1.0, 0.5, 0.0, 1.0);' + #10 +
    '}';


  procedure Init_SDL_and_OpenGL;
  begin
    // --- SDL inizialisieren
    if not SDL_Init(SDL_INIT_VIDEO) then begin
      WriteLn('SDL could not initialize! SDL_Error: ', SDL_GetError);
      Halt(1);
    end;

    // --- Context für OpenGL erzeugen
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 4);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 6);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);

    window := SDL_CreateWindow('SDL3 Window', Screen_Widht, Screen_Height, SDL_WINDOW_OPENGL);
    glcontext := SDL_GL_CreateContext(window);
    if glcontext = nil then begin
      Writeln('OpenGL context could not be created! SDL Error: ', SDL_GetError);
      Halt(1);
    end;

    Load_GLADE;
  end;

  function StrToSpriV(kind: Tshaderc_shader_kind; src: pchar): TAnsiCharArray;
  var
    compiler: Pshaderc_compiler;
    res: Pshaderc_compilation_result;
    spirv_size: Tsize_t;
    spirv_data: pansichar;
  begin
    compiler := shaderc_compiler_initialize;
    res := shaderc_compile_into_spv(compiler, src, Length(src), kind, 'shader.glsl', 'main', nil);
    if shaderc_result_get_compilation_status(res) <> shaderc_compilation_status_success then begin
      SDL_Log('Shaderc error: %s'#10, shaderc_result_get_error_message(res));
      shaderc_result_release(res);
      shaderc_compiler_release(compiler);
      exit(nil);
    end;

    spirv_size := shaderc_result_get_length(res);
    spirv_data := shaderc_result_get_bytes(res);

    SetLength(Result, spirv_size);
    Move(spirv_data[0], Result[0], spirv_size);

    shaderc_result_release(res);
    shaderc_compiler_release(compiler);
  end;

  procedure LoadShader(kind: TGLenum; data: TAnsiCharArray);
  var
    so: TGLuint;
  begin
    so := glCreateShader(kind);

    glShaderBinary(1, @so, GL_SHADER_BINARY_FORMAT_SPIR_V, pansichar(data), Length(data));
    glSpecializeShader(so, 'main', 0, nil, nil);
    glAttachShader(prog, so);
    glDeleteShader(so);
  end;

  procedure CreateScene;
  var
    a: TAnsiCharArray = nil;
  begin
    glCreateBuffers(Length(Mesh_Buffers), Mesh_Buffers);
    glNamedBufferStorage(Mesh_Buffers[mbTriangle], Length(vertices) * SizeOf(TVector2f), PVector2f(vertices), 0);

    glGenVertexArrays(Length(VAOs), VAOs);
    glBindVertexArray(VAOs[vaTriangle]);
    glBindBuffer(GL_ARRAY_BUFFER, Mesh_Buffers[mbTriangle]);
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, 0, nil);
    glEnableVertexAttribArray(0);

    prog := glCreateProgram();

    a := StrToSpriV(shaderc_vertex_shader, vertex_shader_text);
    LoadShader(GL_VERTEX_SHADER, a);

    a := StrToSpriV(shaderc_fragment_shader, fragment_shader_text);
    LoadShader(GL_FRAGMENT_SHADER, a);

    glLinkProgram(prog);
  end;


  procedure DrawScene;
  const
    black: TVector4f = (0.3, 0.0, 0.2, 1.0);
    //  var
    //    col_id: TGLint;
    //    col:TVector3f=(0.5, 0.4, 0.8);
  begin
    glClearBufferfv(GL_COLOR, 0, black);

    glUseProgram(prog);

    //    col_id:=MyShader.UniformLocation('col');
    //    glUniform3fv(col_id,1,@col);

    glBindVertexArray(VAOs[vaTriangle]);
    glDrawArrays(GL_TRIANGLES, 0, Length(vertices));

    SDL_GL_SwapWindow(window);
  end;

  procedure Destroy_SDL_and_OpenGL;
  begin
    glDeleteVertexArrays(Length(VAOs), VAOs);
    glDeleteBuffers(Length(Mesh_Buffers), Mesh_Buffers);

    //    MyShader.Free;

    SDL_GL_DestroyContext(glcontext);
    SDL_DestroyWindow(window);
    SDL_Quit();
  end;

  procedure RunScene;
  begin
    while not quit do begin
      while SDL_PollEvent(@e) do begin
        case e._type of
          SDL_EVENT_KEY_DOWN: begin
            case e.key.key of
              SDLK_ESCAPE: begin
                quit := True;
              end;
            end;
          end;
          SDL_EVENT_QUIT: begin
            quit := True;
          end;
        end;
      end;
      DrawScene;
    end;
  end;

begin
  Init_SDL_and_OpenGL;
  CreateScene;
  RunScene;
  Destroy_SDL_and_OpenGL;
end.
