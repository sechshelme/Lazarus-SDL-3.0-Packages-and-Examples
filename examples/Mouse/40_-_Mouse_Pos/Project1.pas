program Project1;

// https://github.com/Ravbug/sdl3-sample/blob/main/src/main.cpp

uses
  ctypes,
  SDL3;

var
  window: PSDL_Window;
  renderer: PSDL_Renderer;
  Width, Height, bbwidth, bbheight: longint;

  procedure SDLFail(const err: string);
  begin
    SDL_LogError(SDL_LOG_CATEGORY_CUSTOM, PChar('Fehler: ' + err));
    Halt(1);
  end;

  procedure SDLMain;
  var
    e: TSDL_Event;
    quit: boolean = False;
    time: single;
    red, green, blue: byte;
    Buttons: uint32;
    x, y: single;
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

      Buttons := SDL_GetMouseState(@x, @y);
      if Buttons and SDL_BUTTON_LMASK <> 0 then  begin
        SDL_Log('Mouse Button 1 (left) is pressed.');
      end;

      SDL_Log('Mouse cursor is at %f, %f', x, y);

      time := SDL_GetTicks / 1000;
      red := Trunc((SDL_sinf(time) + 1) / 2.0 * 255);
      green := Trunc((SDL_sinf(time / 2) + 1) / 2.0 * 255);
      blue := Trunc((SDL_sinf(time / 3) + 1) / 2.0 * 255);

      SDL_SetRenderDrawColor(renderer, red, green, blue, SDL_ALPHA_OPAQUE);

      SDL_RenderClear(renderer);
      SDL_RenderPresent(renderer);
    end;
  end;

begin
  SDL_init(SDL_INIT_VIDEO);

  window := SDL_CreateWindow('SDL3 Window', 320, 200, SDL_WINDOW_RESIZABLE);
  if window = nil then begin
    SDLFail('Cannot create SDL window !');
  end;

  renderer := SDL_CreateRenderer(window, nil);
  if renderer = nil then begin
    SDLFail('Cannot create SDL renderer !');
  end;

  SDL_ShowWindow(window);

  SDL_GetWindowSize(window, @Width, @Height);
  SDL_GetWindowSizeInPixels(window, @bbwidth, @bbheight);
  SDL_Log('Window size: %ix%i', bbwidth, bbheight);

  if Width <> bbwidth then  begin
    SDL_Log('This is a highdpi environment.');
  end;

  SDLMain;

  SDL_DestroyRenderer(renderer);
  SDL_DestroyWindow(window);

  SDL_Quit;
end.
