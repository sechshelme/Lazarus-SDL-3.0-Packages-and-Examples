uses
  SDL3;

var
  Condition:  PSDL_Condition = nil;
  Mutex:      PSDL_Mutex     = nil;
  Thread:     PSDL_Thread    = nil;
  Flag:       Boolean        = False;
  Terminated: Boolean        = False;

  function ThreadWorker (AData: Pointer): Integer; cdecl;
  var
    Signaled: Boolean;
  begin
    repeat
      SDL_Log('Nr: %d',AData);
      SDL_LockMutex(Mutex);

      // This loop seems to do waiting in the right way.
      while not Flag do
        if not SDL_WaitConditionTimeout(Condition, Mutex, 500) then
          break;

      Signaled := Flag;
      Flag     := False;
      SDL_UnlockMutex(Mutex);

      if not Terminated then
      begin
        if Signaled then
          SDL_Log('  %5d Extra work.', SDL_GetTicks);

        SDL_Log('%5d Periodic work.',  SDL_GetTicks);
      end;
    until Terminated;

    Result := 0;
  end;

label
  CleanUp;
var
  Window: PSDL_Window;
  Event:  TSDL_Event;
begin
  SDL_Init(SDL_INIT_EVENTS);

  Window    := SDL_CreateWindow('', 320, 240, 0);
  Thread    := SDL_CreateThreadRuntime(@ThreadWorker, nil, Pointer(111), nil, nil);
  Thread    := SDL_CreateThreadRuntime(@ThreadWorker, nil, Pointer(222), nil, nil);
  Condition := SDL_CreateCondition();
  Mutex     := SDL_CreateMutex();
  Flag      := False;

  while True do
  begin
    while SDL_PollEvent(@Event) do
    case Event._Type of

      SDL_EVENT_KEY_DOWN:
      case Event.Key.Scancode of
        SDL_SCANCODE_SPACE:
        begin
          SDL_LockMutex(Mutex);
          Flag := True;
          SDL_SignalCondition(Condition);
          SDL_UnlockMutex(Mutex);
        end;

        SDL_SCANCODE_ESCAPE: goto CleanUp;
      end;

      SDL_EVENT_QUIT: goto CleanUp;
    end;

    SDL_Delay(10);
  end;

CleanUp:
  Terminated := True;

  SDL_LockMutex(Mutex);
  Flag := True;
  SDL_SignalCondition(Condition);
  SDL_UnlockMutex(Mutex);
  SDL_WaitThread(Thread, nil);

  SDL_DestroyCondition (Condition);
  SDL_DestroyMutex     (Mutex);
  SDL_DestroyWindow    (Window);
  SDL_Quit();
end.
