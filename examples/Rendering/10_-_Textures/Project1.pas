program Project1;

// https://github.com/libsdl-org/SDL/issues/9876

uses
  SDL3;

const
  Width = 640;
  Height = 480;
  texWidth = 320;
  texHeight = 240;
  bytesPerPixel = sizeof(uint32);
  pitch = Width * bytesPerPixel;

  procedure main;
  var
    window: PSDL_Window;
    renderer: PSDL_Renderer;
    quit: boolean = False;
    event: TSDL_Event;
    pixelFormatDetails: PSDL_PixelFormatDetails;
    RED_TRANSPARENT, GREEN_TRANSPARENT: TUint32;
    texture1, texture2: PSDL_Texture;
    pixelData: PUInt32 = nil;
    nonConstPitchCopy: longint = pitch;
    Value: uint8 = 255;
    left, right, bleft, bright: TSDL_FRect;
  begin
    pixelFormatDetails := SDL_GetPixelFormatDetails(SDL_PIXELFORMAT_RGBA32);
    RED_TRANSPARENT := SDL_MapRGBA(pixelFormatDetails, nil, $FF, $00, $00, $80);
    GREEN_TRANSPARENT := SDL_MapRGBA(pixelFormatDetails, nil, $00, $FF, $00, $80);

    SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, '0');
    SDL_Init(SDL_INIT_VIDEO);
    SDL_CreateWindowAndRenderer('SDL3 Tutorial: Hello SDL3!!!', Width, Height, 0, @window, @renderer);
    SDL_SetRenderVSync(renderer, 1);

    if window = nil then begin
      SDL_Log('Cannot create SDL window !');
    end;

    if renderer = nil then begin
      SDL_Log('Cannot create SDL renderer !');
    end;

    texture1 := SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA32, SDL_TEXTUREACCESS_STREAMING, texWidth, texHeight);
    texture2 := SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGBA32, SDL_TEXTUREACCESS_STREAMING, texWidth, texHeight);

    SDL_LockTexture(texture1, nil, @pixelData, @nonConstPitchCopy);
    SDL_memset4(pixelData, RED_TRANSPARENT, texHeight * (nonConstPitchCopy div sizeof(uint32)));
    SDL_UnlockTexture(texture1);

    SDL_LockTexture(texture2, nil, @pixelData, @nonConstPitchCopy);
    SDL_memset4(pixelData, GREEN_TRANSPARENT, texHeight * (nonConstPitchCopy div sizeof(uint32)));
    SDL_UnlockTexture(texture2);

    while not quit do begin
      while SDL_PollEvent(@event) do begin
        case event._type of
          SDL_EVENT_KEY_DOWN: begin
            case event.key.key of
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

      SDL_SetRenderDrawColor(renderer, Value, Value, Value, 255);
      SDL_RenderClear(renderer);

      left.items := [0.0, 0.0, texWidth, texHeight];
      right.items := [texWidth, 0.0, texWidth, texHeight];
      bleft.items := [texWidth / 3.0, texHeight + 10.0, texWidth, texHeight];
      bright.items := [bleft.x + texWidth / 3.0, texHeight + 10.0, texWidth, texHeight];

      SDL_RenderTexture(renderer, texture1, nil, @left);
      SDL_RenderTexture(renderer, texture2, nil, @right);
      SDL_RenderTexture(renderer, texture1, nil, @bleft);
      SDL_RenderTexture(renderer, texture2, nil, @bright);

      SDL_RenderPresent(renderer);

      Dec(Value);
    end;

    SDL_DestroyTexture(texture1);
    SDL_DestroyTexture(texture2);
    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit;
  end;

begin
  main;
end.
