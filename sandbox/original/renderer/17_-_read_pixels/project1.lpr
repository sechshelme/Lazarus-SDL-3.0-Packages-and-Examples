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
    converted_texture: PSDL_Texture;
    converted_texture_width, converted_texture_height: integer;
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

    SDL_SetAppMetadata('Example Renderer Read Pixels', '1.0', 'com.example.renderer-read-pixels');

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
    now: uint64;
    average, rotation: single;
    dst_rect: TSDL_FRect;
    center: TSDL_FPoint;
    surface, converted: PSDL_Surface;
    y, x: integer;
    pixels: PUInt32;
    p: PUInt8;
  begin
    now := SDL_GetTicks;

    rotation := (((now mod 2000)) / 2000.0) * 360.0;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    dst_rect.x := (WINDOW_WIDTH - app^.texture_width) / 2.0;
    dst_rect.y := (WINDOW_HEIGHT - app^.texture_height) / 2.0;
    dst_rect.w := app^.texture_width;
    dst_rect.h := app^.texture_height;
    center.x := app^.texture_width / 2.0;
    center.y := app^.texture_height / 2.0;
    SDL_RenderTextureRotated(app^.renderer, app^.texture, nil, @dst_rect, rotation, @center, SDL_FLIP_NONE);

    surface := SDL_RenderReadPixels(app^.renderer, nil);

    if (surface <> nil) and ((surface^.format <> SDL_PIXELFORMAT_RGBA8888) and (surface^.format <> SDL_PIXELFORMAT_BGRA8888)) then begin
      converted := SDL_ConvertSurface(surface, SDL_PIXELFORMAT_RGBA8888);
      SDL_DestroySurface(surface);
      surface := converted;
    end;

    if surface <> nil then begin
      if (surface^.w <> app^.converted_texture_width) or (surface^.h <> app^.converted_texture_height) then begin
        SDL_DestroyTexture(app^.converted_texture);
        app^.converted_texture := SDL_CreateTexture(app^.renderer, SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_STREAMING, surface^.w, surface^.h);
        if app^.converted_texture = nil then begin
          SDL_Log('Couldn''t (re)create conversion texture: %s', SDL_GetError);
          Exit(SDL_APP_FAILURE);
        end;

        app^.converted_texture_width := surface^.w;
        app^.converted_texture_height := surface^.h;
      end;

      for y := 0 to surface^.h - 1 do begin
        pixels := PUInt32((surface^.pixels) + (y * surface^.pitch));
        for x := 0 to surface^.w - 1 do begin
          p := PUInt8(@pixels[x]);
          average := ((uint32(p[1])) + (uint32(p[2])) + (uint32(p[3]))) / 3;
          if average = 0 then  begin
            p[0] := $FF;
            p[3] := $FF;
            p[1] := $00;
            p[2] := $00;
          end else begin
            if average > 50 then begin
              p[1] := $FF;
              p[2] := $FF;
              p[3] := $FF;
            end else begin
              p[1] := $00;
              p[2] := $00;
              p[3] := $00;
            end;
          end;
        end;
      end;

      SDL_UpdateTexture(app^.converted_texture, nil, surface^.pixels, surface^.pitch);
      SDL_DestroySurface(surface);

      dst_rect.x := 0.0;
      dst_rect.y := 0.0;
      dst_rect.w := (WINDOW_WIDTH) / 4.0;
      dst_rect.h := (WINDOW_HEIGHT) / 4.0;
      SDL_RenderTexture(app^.renderer, app^.converted_texture, nil, @dst_rect);
    end;

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
