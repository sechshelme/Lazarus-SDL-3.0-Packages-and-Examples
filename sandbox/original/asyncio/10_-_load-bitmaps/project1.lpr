program project1;

uses
  SDL3;

const
  TOTAL_TEXTURES = 4;
var
  bmps: array [0..TOTAL_TEXTURES - 1] of pchar = ('sample.bmp', 'gamepad_front.bmp', 'speaker.bmp', 'icon2x.bmp');
  textures: array[0..TOTAL_TEXTURES - 1] of PSDL_Texture;
  texture_rects: array[0..TOTAL_TEXTURES - 1] of TSDL_FRect = (
    (items: (116, 156, 408, 167)),
    (items: (20, 200, 96, 60)),
    (items: (525, 180, 96, 96)),
    (items: (288, 375, 64, 64)));

type
  TAppState = record
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    queue: PSDL_AsyncIOQueue;
  end;
  PAppState = ^TAppState;


  function AppInit(appstate: Ppointer; argc: longint; argv: PPansichar): TSDL_AppResult; cdecl;
  var
    app: PAppstate = nil;
  var
    path: pansichar;
    i: integer;
  begin
    app := SDL_malloc(SizeOf(TAppstate));
    app^ := Default(TAppstate);
    appstate^ := app;

    if not SDL_Init(SDL_INIT_VIDEO) then begin
      SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Couldn''t initialize SDL!', SDL_GetError, nil);
      Exit(SDL_APP_FAILURE);
    end;

    if not SDL_CreateWindowAndRenderer('examples/asyncio/load-bitmaps', 640, 480, 0, @app^.window, @app^.renderer) then begin
      SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Couldn''t create window/renderer!', SDL_GetError, nil);
      Exit(SDL_APP_FAILURE);
    end;

    app^.queue := SDL_CreateAsyncIOQueue;
    if app^.queue = nil then begin
      SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Couldn''t create async i/o queue!', SDL_GetError, nil);
      Exit(SDL_APP_FAILURE);
    end;

    for i := 0 to TOTAL_TEXTURES - 1 do begin
      path := nil;
      SDL_asprintf(@path, '%s%s', SDL_GetBasePath, bmps[i]);
      if not SDL_LoadFileAsync(path, app^.queue, @bmps[i]) then  begin
        SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'File load error!', SDL_GetError, nil);
        Exit(SDL_APP_FAILURE);
      end;
      SDL_free(path);
    end;

    Exit(SDL_APP_CONTINUE);
  end;

  function AppIterate(appstate: pointer): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
    outcome: TSDL_AsyncIOOutcome;
    surface: PSDL_Surface;
    i: integer;
  begin
    FillChar(outcome, SizeOf(outcome), 0);
    if SDL_GetAsyncIOResult(app^.queue, @outcome) then begin
      if outcome.Result = SDL_ASYNCIO_COMPLETE then begin
        for i := 0 to TOTAL_TEXTURES - 1 do begin
          if outcome.userdata = @bmps[i] then begin
            WriteLn('break');
            break;
          end;
        end;

        if i < TOTAL_TEXTURES then begin
          surface := SDL_LoadBMP_IO(SDL_IOFromConstMem(outcome.buffer, outcome.bytes_transferred), True);
          if surface = nil then begin
            WriteLn('surface = nil');
          end;
          if surface <> nil then begin

            textures[i] := SDL_CreateTextureFromSurface(app^.renderer, surface);
            if textures[i] <> nil then begin
              WriteLn('texture = io');
            end;
            if textures[i] = nil then begin
              SDL_ShowSimpleMessageBox(SDL_MESSAGEBOX_ERROR, 'Couldn''t create texture!', SDL_GetError, nil);
              Exit(SDL_APP_FAILURE);
            end;
            SDL_DestroySurface(surface);
          end;
        end;
      end;
      SDL_free(outcome.buffer);
    end;

    SDL_SetRenderDrawColor(app^.renderer, 0, 0, 0, 255);
    SDL_RenderClear(app^.renderer);

    for i := 0 to TOTAL_TEXTURES - 1 do begin
      SDL_RenderTexture(app^.renderer, textures[i], nil, @texture_rects[i]);
    end;

    SDL_RenderPresent(app^.renderer);
    Exit(SDL_APP_CONTINUE);
  end;

  function AppEvent(appstate: pointer; event: PSDL_Event): TSDL_AppResult; cdecl;
  var
    app: PAppstate absolute appstate;
  begin
    if event^._type = SDL_EVENT_QUIT then begin
      Exit(SDL_APP_SUCCESS);
    end;
    Exit(SDL_APP_CONTINUE);
  end;

  procedure AppQuit(appstate: pointer; Result: TSDL_AppResult); cdecl;
  var
    app: PAppstate absolute appstate;
    i: integer;
  begin
    SDL_DestroyAsyncIOQueue(app^.queue);

    for i := 0 to TOTAL_TEXTURES - 1 do begin
      SDL_DestroyTexture(textures[i]);
    end;

    SDL_DestroyRenderer(app^.renderer);
    SDL_DestroyWindow(app^.window);
    SDL_free(app);
  end;

begin
  SDL_EnterAppMainCallbacks(argc, argv, @AppInit, @AppIterate, @AppEvent, @AppQuit);
end.
