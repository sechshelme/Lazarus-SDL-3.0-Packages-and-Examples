program project1;

uses
  SDL3;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    render_target: PSDL_Texture;
    pressure, previous_touch_x, previous_touch_y, tilt_x, tilt_y: single;
  end;
  PAppState = ^TAppState;

  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    w, h: longint;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;
    app^.previous_touch_x := -1.0;
    app^.previous_touch_y := -1.0;

    SDL_SetAppMetadata('Example Pen Drawing Lines', '1.0', 'com.example.pen-drawing-lines');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    SDL_GetRenderOutputSize(app^.renderer, @w, @h);
    app^.render_target := SDL_CreateTexture(app^.renderer, SDL_PIXELFORMAT_RGBA8888, SDL_TEXTUREACCESS_TARGET, w, h);
    if app^.render_target = nil then begin
      SDL_Log('Couldn''t create render target: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;
    SDL_SetRenderTarget(app^.renderer, app^.render_target);
    SDL_SetRenderDrawColor(app^.renderer, 100, 100, 100, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);
    SDL_SetRenderTarget(app^.renderer, nil);
    SDL_SetRenderDrawBlendMode(app^.renderer, SDL_BLENDMODE_BLEND);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    debug_text: array [0..1023] of ansichar;
  begin
    SDL_SetRenderTarget(app^.renderer, nil);
    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);
    SDL_RenderTexture(app^.renderer, app^.render_target, nil, nil);
    SDL_snprintf(debug_text, sizeof(debug_text), 'Tilt: %f %f', app^.tilt_x, app^.tilt_y);
    SDL_RenderDebugText(app^.renderer, 0, 8, debug_text);
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
      SDL_EVENT_PEN_MOTION: begin
        if app^.pressure > 0.0 then begin
          if app^.previous_touch_x >= 0.0 then begin
            SDL_SetRenderTarget(app^.renderer, app^.render_target);
            SDL_SetRenderDrawColorFloat(app^.renderer, 0, 0, 0, app^.pressure);
            SDL_RenderLine(app^.renderer, app^.previous_touch_x, app^.previous_touch_y, event^.pmotion.x, event^.pmotion.y);
          end;
          app^.previous_touch_x := event^.pmotion.x;
          app^.previous_touch_y := event^.pmotion.y;
        end else begin
          ;
          app^.previous_touch_x := -1.0;
          app^.previous_touch_y := -1.0;
        end;
      end;
      SDL_EVENT_PEN_AXIS: begin
        if event^.paxis.axis = SDL_PEN_AXIS_PRESSURE then begin
          app^.pressure := event^.paxis.Value;
        end else if event^.paxis.axis = SDL_PEN_AXIS_XTILT then begin
          app^.tilt_x := event^.paxis.Value;
        end else if event^.paxis.axis = SDL_PEN_AXIS_YTILT then begin
          app^.tilt_y := event^.paxis.Value;
        end;
      end;
    end;
    Exit(SDL_APP_CONTINUE);
  end;

  procedure AppQuit(appstate: pointer; Result: TSDL_AppResult); cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    SDL_DestroyTexture(app^.render_target);
    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
