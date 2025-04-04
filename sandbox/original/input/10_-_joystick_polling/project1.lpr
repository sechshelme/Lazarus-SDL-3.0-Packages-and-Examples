program project1;

uses
  SDL3;


type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    joystick: PSDL_Joystick;
    colors: array [0..64 - 1] of TSDL_Color;
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

    if not SDL_Init(SDL_INIT_VIDEO or SDL_INIT_JOYSTICK) then begin
      SDL_Log('Couldn''t initialize SDL: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_Log('Couldn''t create window/renderer: %s', SDL_GetError);
      Exit(SDL_APP_FAILURE);
    end;

    for i := 0 to Length(app^.colors) - 1 do begin
      app^.colors[i].r := SDL_rand(255);
      app^.colors[i].g := SDL_rand(255);
      app^.colors[i].b := SDL_rand(255);
      app^.colors[i].a := 255;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    Text: pansichar = 'Plug in a joystick, please.';
    i, winw, winh, total: longint;
    val, x, y, dx, thirdsize: single;
    color: PSDL_Color;
    dst: TSDL_FRect;
    cross: array[0..1] of TSDL_FRect;
    hat: TUint8;
  const
    size: single = 30.0;
  begin
    if app^.joystick <> nil then begin
      Text := SDL_GetJoystickName(app^.joystick);
    end;

    SDL_SetRenderDrawColor(app^.renderer, $00, $00, $00, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);
    SDL_GetWindowSize(app^.window, @winw, @winh);

    if app^.joystick <> nil then begin
      total := SDL_GetNumJoystickAxes(app^.joystick);
      y := (winh - (total * size)) / 2;
      x := winw / 2.0;
      for i := 0 to total - 1 do begin
        color := @app^.colors[i mod Length(app^.colors)];
        val := ((SDL_GetJoystickAxis(app^.joystick, i)) / 32767.0);
        dx := x + (val * x);
        dst.items := [dx, y, x - SDL_fabsf(dx), size];
        SDL_SetRenderDrawColor(app^.renderer, color^.r, color^.g, color^.b, color^.a);
        SDL_RenderFillRect(app^.renderer, @dst);
        y += size;
      end;

      total := SDL_GetNumJoystickButtons(app^.joystick);
      x := (winw - (total * size)) / 2;
      for i := 0 to total - 1 do begin
        color := @app^.colors[i mod Length(app^.colors)];
        dst.items := [x, 0.0, size, size];
        if SDL_GetJoystickButton(app^.joystick, i) then begin
          SDL_SetRenderDrawColor(app^.renderer, color^.r, color^.g, color^.b, color^.a);
        end else begin
          SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, 255);
        end;

        SDL_RenderFillRect(app^.renderer, @dst);
        SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, color^.a);
        SDL_RenderRect(app^.renderer, @dst);
        x += size;
      end;

      total := SDL_GetNumJoystickHats(app^.joystick);
      x := ((winw - (total * (size * 2.0))) / 2.0) + (size / 2.0);
      y := winh - size;
      for i := 0 to total - 1 do begin
        color := @app^.colors[i mod Length(app^.colors)];
        thirdsize := size / 3.0;
        cross[0].items := [x, y + thirdsize, size, thirdsize];
        cross[1].items := [x + thirdsize, y, thirdsize, size];
        hat := SDL_GetJoystickHat(app^.joystick, i);

        SDL_SetRenderDrawColor(app^.renderer, 90, 90, 90, 255);
        SDL_RenderFillRects(app^.renderer, cross, Length(cross));

        SDL_SetRenderDrawColor(app^.renderer, color^.r, color^.g, color^.b, color^.a);

        if (hat and SDL_HAT_UP) <> 0 then begin
          dst.items := [x + thirdsize, y, thirdsize, thirdsize];
          SDL_RenderFillRect(app^.renderer, @dst);
        end;

        if (hat and SDL_HAT_RIGHT) <> 0 then begin
          dst.items := [x + (thirdsize * 2), y + thirdsize, thirdsize, thirdsize];
          SDL_RenderFillRect(app^.renderer, @dst);
        end;

        if (hat and SDL_HAT_DOWN) <> 0 then begin
          dst.items := [x + thirdsize, y + (thirdsize * 2), thirdsize, thirdsize];
          SDL_RenderFillRect(app^.renderer, @dst);
        end;

        if (hat and SDL_HAT_LEFT) <> 0 then begin
          dst.items := [x, y + thirdsize, thirdsize, thirdsize];
          SDL_RenderFillRect(app^.renderer, @dst);
        end;

        x += size * 2;
      end;
    end;

    x := (winw - (SDL_strlen(Text) * SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE)) / 2.0;
    y := (winh - SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE) / 2.0;
    SDL_SetRenderDrawColor(app^.renderer, 255, 255, 255, 255);
    SDL_RenderDebugText(app^.renderer, x, y, Text);
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
      SDL_EVENT_JOYSTICK_ADDED: begin
        if app^.joystick = nil then begin
          app^.joystick := SDL_OpenJoystick(event^.jdevice.which);
          if app^.joystick = nil then begin
            SDL_Log('Failed to open joystick ID %u: %s', event^.jdevice.which, SDL_GetError);
          end;
        end;
      end;
      SDL_EVENT_JOYSTICK_REMOVED: begin
        if (app^.joystick <> nil) and (SDL_GetJoystickID(app^.joystick) = event^.jdevice.which) then begin
          SDL_CloseJoystick(app^.joystick);
          app^.joystick := nil;
        end;
      end;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  procedure AppQuit(appstate: pointer; Result: TSDL_AppResult); cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    if app^.joystick <> nil then  begin
      SDL_CloseJoystick(app^.joystick);
    end;

    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
