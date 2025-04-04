program project1;

uses
  SysUtils,
  SDL3;

type
  PEventMessage = ^TEventMessage;

  TEventMessage = record
    str: pchar;
    color: TSDL_Color;
    start_ticks: uint64;
    Next: PEventMessage;
  end;

var
  Messages: TEventMessage;
  messages_tail: PEventMessage = @Messages;

const
  MOTION_EVENT_COOLDOWN = 40;


type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    colors: array [0..64 - 1] of TSDL_Color;
  end;
  PAppState = ^TAppState;

  function hat_state_string(state: byte): pchar;
  begin
    case state of
      SDL_HAT_CENTERED: begin
        Result := 'CENTERED';
      end;
      SDL_HAT_UP: begin
        Result := 'UP';
      end;
      SDL_HAT_RIGHT: begin
        Result := 'RIGHT';
      end;
      SDL_HAT_DOWN: begin
        Result := 'DOWN';
      end;
      SDL_HAT_LEFT: begin
        Result := 'LEFT';
      end;
      SDL_HAT_RIGHTUP: begin
        Result := 'RIGHT+UP';
      end;
      SDL_HAT_RIGHTDOWN: begin
        Result := 'RIGHT+DOWN';
      end;
      SDL_HAT_LEFTUP: begin
        Result := 'LEFT+UP';
      end;
      SDL_HAT_LEFTDOWN: begin
        Result := 'LEFT+DOWN';
      end;
      else begin
        Result := 'UNKNOWN';
      end;
    end;
  end;

  function battery_state_string(state: TSDL_PowerState): pchar;
  begin
    case state of
      SDL_POWERSTATE_ERROR: begin
        Result := 'ERROR';
      end;
      SDL_POWERSTATE_UNKNOWN: begin
        Result := 'UNKNOWN';
      end;
      SDL_POWERSTATE_ON_BATTERY: begin
        Result := 'ON BATTERY';
      end;
      SDL_POWERSTATE_NO_BATTERY: begin
        Result := 'NO BATTERY';
      end;
      SDL_POWERSTATE_CHARGING: begin
        Result := 'CHARGING';
      end;
      SDL_POWERSTATE_CHARGED: begin
        Result := 'CHARGED';
      end;
      else begin
        Result := 'UNKNOWN';
      end;
    end;
  end;

  procedure add_message(app: PAppState; jid: TSDL_JoystickID; fmt: pchar; args: array of const);
  var
    color: PSDL_Color;
    msg: PEventMessage;
    str: pchar;
  begin
    color := @app^.colors[jid mod Length(app^.colors)];
    msg := PEventMessage(SDL_calloc(1, SizeOf(TEventMessage)));
    if msg = nil then begin
      Exit;
    end;

    str := PChar(Format(fmt, args));
    if str = nil then begin
      SDL_free(msg);
      Exit;
    end;

    msg^.str := str;
    //  SDL_copyp(@msg.color, color);
    SDL_memcpy(@msg^.color, color, SizeOf(TSDL_Color));
    msg^.start_ticks := SDL_GetTicks();
    msg^.Next := nil;

    messages_tail^.Next := msg;
    messages_tail := msg;
  end;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
    i: integer;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    SDL_SetAppMetadata('Example Input Joystick Events', '1.0', 'com.example.input-joystick-events');

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

    add_message(app, 0, 'Please plug in a joystick.', []);

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    winw: longint = 640;
    winh: longint = 480;
    msg: PEventMessage;
    now: uint64;
    life_percent, x, y: single;
    prev_y: single = 0.0;
  const
    msg_lifetime = 3500.0;
  begin
    SDL_SetRenderDrawColor(app^.renderer, $00, $00, $00, SDL_ALPHA_OPAQUE);
    SDL_RenderClear(app^.renderer);
    SDL_GetWindowSize(app^.window, @winw, @winh);

    msg := Messages.Next;
    now := SDL_GetTicks;

    while msg <> nil do begin
      life_percent := ((now - msg^.start_ticks)) / msg_lifetime;
      if life_percent >= 1.0 then begin
        Messages.Next := msg^.Next;
        if messages_tail = msg then  begin
          messages_tail := @Messages;
        end;
        SDL_free(msg^.str);
        SDL_free(msg);
        msg := Messages.Next;
        continue;
      end;
      x := (winw - (SDL_strlen(msg^.str) * SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE)) / 2.0;
      y := winh * life_percent;
      if ((prev_y <> 0.0) and ((prev_y - y) < (SDL_DEBUG_TEXT_FONT_CHARACTER_SIZE))) then begin
        msg^.start_ticks := now;
        break;
      end;

      SDL_SetRenderDrawColor(app^.renderer, msg^.color.r, msg^.color.g, msg^.color.b, round((msg^.color.a) * (1.0 - life_percent)));
      SDL_RenderDebugText(app^.renderer, x, y, msg^.str);

      prev_y := y;
      msg := msg^.Next;
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    now: uint64;
    which: TSDL_JoystickID;
    joystick: PSDL_Joystick;
    axis_motion_cooldown_time, ball_motion_cooldown_time: uint64;
  begin
    case event^._type of
      SDL_EVENT_QUIT: begin
        Exit(SDL_APP_SUCCESS);
      end;
      SDL_EVENT_JOYSTICK_ADDED: begin
        which := event^.jdevice.which;
        joystick := SDL_OpenJoystick(which);
        if joystick = nil then begin
          add_message(app, which, 'Joystick #%u add, but not opened: %s', [which, SDL_GetError]);
        end else begin
          add_message(app, which, 'Joystick #%u (''%s'') added', [which, SDL_GetJoystickName(joystick)]);
        end;
      end;
      SDL_EVENT_JOYSTICK_REMOVED: begin
        which := event^.jdevice.which;
        joystick := SDL_GetJoystickFromID(which);
        if joystick = nil then begin
          SDL_CloseJoystick(joystick);
        end else begin
          add_message(app, which, 'Joystick #%u removed', [which]);
        end;
      end;
      SDL_EVENT_JOYSTICK_AXIS_MOTION: begin
        axis_motion_cooldown_time := 0;
        now := SDL_GetTicks();
        if now >= axis_motion_cooldown_time then begin
          which := event^.jaxis.which;
          axis_motion_cooldown_time := now + MOTION_EVENT_COOLDOWN;
          add_message(app, which, 'Joystick #%u axis %d -> %d', [which, event^.jaxis.axis, event^.jaxis.Value]);
        end;
      end;
      SDL_EVENT_JOYSTICK_BALL_MOTION: begin
        ball_motion_cooldown_time := 0;
        now := SDL_GetTicks();
        if now >= ball_motion_cooldown_time then begin
          which := event^.jball.which;
          ball_motion_cooldown_time := now + MOTION_EVENT_COOLDOWN;
          add_message(app, which, 'Joystick #%u ball %d -> %d, %d', [which, event^.jball.ball, event^.jball.xrel, event^.jball.yrel]);
        end;
      end;
      SDL_EVENT_JOYSTICK_HAT_MOTION: begin
        which := event^.jhat.which;
        add_message(app, which, 'Joystick #%u hat %d -> %s', [which, event^.jhat.hat, hat_state_string(event^.jhat.Value)]);
      end;
      SDL_EVENT_JOYSTICK_BUTTON_UP: begin
        which := event^.jbutton.which;
        //        add_message(app,which, 'Joystick #%u button %d -> %s',  which,  event^.jbutton.button, event^.jbutton.down ? "PRESSED" : "RELEASED");
      end;
      SDL_EVENT_JOYSTICK_BATTERY_UPDATED: begin
        which := event^.jbattery.which;
        add_message(app, which, 'Joystick #%u battery -> %s - %d%%', [which, battery_state_string(event^.jbattery.state), event^.jbattery.percent]);
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
