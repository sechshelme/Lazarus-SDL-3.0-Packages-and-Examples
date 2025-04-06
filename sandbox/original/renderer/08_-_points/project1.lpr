program project1;

uses
  SDL3;

const
  WINDOW_WIDTH = 640;
  WINDOW_HEIGHT = 480;
  NUM_POINTS = 500;
  MIN_PIXELS_PER_SECOND = 30;
  MAX_PIXELS_PER_SECOND = 60;

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    last_time: uint64;
    points: array[0..NUM_POINTS - 1] of TSDL_FPoint;
    point_speeds: array[0..NUM_POINTS - 1] of single;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    i: integer;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Renderer Points', '1.0', 'com.example.renderer-points');

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_CAMERA) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', WINDOW_WIDTH, WINDOW_HEIGHT, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    for i := 0 to NUM_POINTS - 1 do begin
      app^.points[i].x := SDL_randf * WINDOW_WIDTH;
      app^.points[i].y := SDL_randf * WINDOW_HEIGHT;
      app^.point_speeds[i] := MIN_PIXELS_PER_SECOND + (SDL_randf * (MAX_PIXELS_PER_SECOND - MIN_PIXELS_PER_SECOND));
    end;
    app^.last_time := SDL_GetTicks;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    i: integer;
    now: uint64;
    elapsed, distance: single;
  begin
    now := SDL_GetTicks;
    elapsed := ((now - app^.last_time)) / 1000.0;

    for i := 0 to NUM_POINTS - 1 do begin
      distance := elapsed * app^.point_speeds[i];
      app^.points[i].x += distance;
      app^.points[i].y += distance;
      if (app^.points[i].x >= WINDOW_WIDTH) or (app^.points[i].y >= WINDOW_HEIGHT) then begin
        if SDL_rand(2) <> 0 then begin
          app^.points[i].x := SDL_randf * WINDOW_WIDTH;
          app^.points[i].y := 0.0;
        end else begin
          app^.points[i].x := 0.0;
          app^.points[i].y := SDL_randf * WINDOW_HEIGHT;
        end;
        app^.point_speeds[i] := MIN_PIXELS_PER_SECOND + (SDL_randf() * (MAX_PIXELS_PER_SECOND - MIN_PIXELS_PER_SECOND));
      end;
    end;

    app^.last_time := now;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);

    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, SDL_ALPHA_OPAQUE);
    SDL_RenderPoints(app^.renderer, app^.points, NUM_POINTS);

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
