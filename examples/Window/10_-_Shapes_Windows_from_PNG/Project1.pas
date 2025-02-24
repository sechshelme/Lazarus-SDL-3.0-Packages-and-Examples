program Project1;

// https://github.com/Ravbug/sdl3-sample/blob/main/src/main.cpp

uses
  ctypes,
  SDL3,
  SDL3_image;

var
  window: PSDL_Window;
  renderer: PSDL_Renderer;

  procedure Run;
  var
    event: TSDL_Event;
    quit: boolean = False;
    blue, green, red: single;
    time: extended;
    keyStat: PBoolean;

  begin
    while not quit do begin
      keyStat := SDL_GetKeyboardState(nil);
      if keyStat[SDL_SCANCODE_SPACE] then begin
        SDL_Log('Space is pressed');
      end;
      if keyStat[SDL_SCANCODE_LEFT] then begin
        SDL_Log('Left is pressed');
      end;

      while SDL_PollEvent(@event) do begin
        case event._type of
          SDL_EVENT_KEY_DOWN: begin
            SDL_Log('key: %i', event.key.key);

            case event.key.key of
              SDLK_ESCAPE: begin
                quit := True;
              end;
            end;
          end;
          SDL_EVENT_MOUSE_BUTTON_DOWN: begin
            SDL_Log('Mouse down');
          end;
          SDL_EVENT_MOUSE_BUTTON_UP: begin
            SDL_Log('Mouse up');
          end;
          SDL_EVENT_QUIT: begin
            quit := True;
          end;
        end;
      end;

      time := SDL_GetTicks / 1000;
      red := (SDL_sinf(time) + 1) / 2.0;
      green := (SDL_sinf(time / 2) + 1) / 2.0;
      blue := (SDL_sinf(time / 3) + 1) / 2.0;

      SDL_SetRenderDrawColorFloat(renderer, red, green, blue, SDL_ALPHA_OPAQUE);
      SDL_RenderClear(renderer);
      SDL_RenderPresent(renderer);
    end;
  end;

  procedure main;
  var
    windowFlags, initFlags: integer;
    shapeSurface: PSDL_Surface;
  begin
    initFlags := SDL_INIT_VIDEO or SDL_INIT_AUDIO or SDL_INIT_EVENTS;
    SDL_init(initFlags);

    shapeSurface := IMG_Load('sdl.png');
    if shapeSurface = nil then begin
      SDL_LogError(SDL_LOG_CATEGORY_ERROR, 'IMG_Load error: %s', SDL_GetError);
      Exit;
    end;

    windowFlags := SDL_WINDOW_HIDDEN or SDL_WINDOW_TRANSPARENT or SDL_WINDOW_BORDERLESS;
    window := SDL_CreateWindow('SDL3 Window', shapeSurface^.w, shapeSurface^.h, windowFlags);
    if window = nil then begin
      SDL_LogError(SDL_LOG_CATEGORY_ERROR, 'Create eindow error: %s', SDL_GetError);
      Exit;
    end;

    renderer := SDL_CreateRenderer(window, nil);
    if renderer = nil then begin
      SDL_LogError(SDL_LOG_CATEGORY_ERROR, 'Create renderer error: %s', SDL_GetError);
      Exit;
    end;

    SDL_SetWindowShape(window, shapeSurface);
    SDL_ShowWindow(window);

    Run;

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);

    SDL_Quit;
    SDL_Log('Application quit successfully!');
  end;

begin
  main;
end.
