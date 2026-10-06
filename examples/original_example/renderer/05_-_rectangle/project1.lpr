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
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Rectangles', '1.0', 'com.example.renderer-rectangles');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    rects: array[0..15] of TSDL_FRect;
    i: integer;
    now: uint64;
    size, direction, scale, w, h: single;
  begin
    now := SDL_GetTicks;

    if (now mod 2000) >= 1000 then begin
      direction := 1.0;
    end else begin
      direction := -1.0;
    end;
    scale := (((integer(now mod 1000)) - 500) / 500.0) * direction;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    rects[0].x := 100;
    rects[0].y := 100;
    rects[0].w := 100 + (100 * scale);
    rects[0].h := 100 + (100 * scale);
    SDL_SetRenderDrawColor(app^.renderer, 255, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderRect(app^.renderer, @rects[0]);

    for i := 0 to 2 do begin
      size := (i + 1) * 50.0;
      rects[i].w := size + (size * scale);
      rects[i].h := size + (size * scale);
      rects[i].x := (WINDOW_WIDTH - rects[i].w) / 2;
      rects[i].y := (WINDOW_HEIGHT - rects[i].h) / 2;
    end;
    SDL_SetRenderDrawColor(app^.renderer, 0, 255, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderRects(app^.renderer, rects, 3);

    rects[0].x := 400;
    rects[0].y := 50;
    rects[0].w := 100 + (100 * scale);
    rects[0].h := 50 + (50 * scale);
    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRect(app^.renderer, @rects[0]);

    for i := 0 to Length(rects) - 1 do begin
      w := (WINDOW_WIDTH / Length(rects));
      h := i * 8.0;
      rects[i].x := i * w;
      rects[i].y := WINDOW_HEIGHT - h;
      rects[i].w := w;
      rects[i].h := h;
    end;
    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderFillRects(app^.renderer, rects, Length(rects));

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
    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
