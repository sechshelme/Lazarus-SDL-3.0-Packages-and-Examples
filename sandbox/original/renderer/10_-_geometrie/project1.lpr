program project1;

uses
  SDL3;

const
  WINDOW_WIDTH = 640;
  WINDOW_HEIGHT = 480;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    texture: PSDL_Texture;
    texture_width, texture_height: integer;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    bmp_path: pansichar;
    surface: PSDL_Surface;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Geometry', '1.0', 'com.example.renderer-geometry');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_asprintf(@bmp_path, '%s/../../media/sample.bmp', SDL_GetBasePath);
    surface := SDL_LoadBMP(bmp_path);
    if surface = nil then begin
      SDL_Log('Couldn''t load bitmap: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_free(bmp_path);

    app^.texture_width := surface^.w;
    app^.texture_height := surface^.h;

    app^.texture := SDL_CreateTextureFromSurface(app^.renderer, surface);
    if app^.texture = nil then begin
      SDL_Log('Couldn''t create static texture: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_DestroySurface(surface);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    i: integer;
    now: uint64;
    size, direction, scale: single;
    vertices: array[0..3] of TSDL_Vertex;
    indices: array [0..5] of longint = (0, 1, 2, 1, 2, 3);
  begin
    now := SDL_GetTicks;

    if (now mod 2000) >= 1000 then begin
      direction := 1.0;
    end else begin
      direction := -1.0;
    end;
    scale := (((integer(now mod 1000)) - 500) / 500.0) * direction;
    size := 200.0 + (200.0 * scale);

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    FillChar(vertices, SizeOf(vertices), $00);
    vertices[0].position.x := WINDOW_WIDTH / 2.0;
    vertices[0].position.y := (WINDOW_HEIGHT - size) / 2.0;
    vertices[0].color.r := 1.0;
    vertices[0].color.a := 1.0;
    vertices[1].position.x := (WINDOW_WIDTH + size) / 2.0;
    vertices[1].position.y := (WINDOW_HEIGHT + size) / 2.0;
    vertices[1].color.g := 1.0;
    vertices[1].color.a := 1.0;
    vertices[2].position.x := (WINDOW_WIDTH - size) / 2.0;
    vertices[2].position.y := (WINDOW_HEIGHT + size) / 2.0;
    vertices[2].color.b := 1.0;
    vertices[2].color.a := 1.0;
    SDL_RenderGeometry(app^.renderer, nil, vertices, 3, nil, 0);

    FillChar(vertices, SizeOf(vertices), $00);
    vertices[0].position.x := 10.0;
    vertices[0].position.y := 10.0;
    vertices[0].color.r := 1.0;
    vertices[0].color.g := 1.0;
    vertices[0].color.b := 1.0;
    vertices[0].color.a := 1.0;
    vertices[0].tex_coord.x := 0.0;
    vertices[0].tex_coord.y := 0.0;

    vertices[1].position.x := 150.0;
    vertices[1].position.y := 10.0;
    vertices[1].color.r := 1.0;
    vertices[1].color.g := 1.0;
    vertices[1].color.b := 1.0;
    vertices[1].color.a := 1.0;
    vertices[1].tex_coord.x := 1.0;
    vertices[1].tex_coord.y := 0.0;

    vertices[2].position.x := 10.0;
    vertices[2].position.y := 150.0;
    vertices[2].color.r := 1.0;
    vertices[2].color.g := 1.0;
    vertices[2].color.b := 1.0;
    vertices[2].color.a := 1.0;
    vertices[2].tex_coord.x := 0.0;
    vertices[2].tex_coord.y := 1.0;
    SDL_RenderGeometry(app^.renderer, app^.texture, vertices, 3, nil, 0);

    for i := 0 to 2 do begin
      vertices[i].position.x += 450;
    end;
    vertices[3].position.x := 600.0;
    vertices[3].position.y := 150.0;
    vertices[3].color.r := 1.0;
    vertices[3].color.g := 1.0;
    vertices[3].color.b := 1.0;
    vertices[3].color.a := 1.0;
    vertices[3].tex_coord.x := 1.0;
    vertices[3].tex_coord.y := 1.0;

    SDL_RenderGeometry(app^.renderer, app^.texture, vertices, 4, indices, Length(indices));

    SDL_RenderPresent(app^.renderer);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    case event^._type of
      SDL_EVENT_QUIT: begin
        Exit(SDL_APP_SUCCESS);
      end;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  procedure AppQuit(appstate: pointer; Result: TSDL_AppResult); cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    SDL_DestroyTexture(app^.texture);
    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
