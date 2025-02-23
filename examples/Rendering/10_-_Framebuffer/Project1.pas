program Project1;

uses
  SDL3;

const
  FRAME_W = 256;
  FRAME_H = 256;

  SQUARE_CENTER_X = FRAME_W div 2;
  SQUARE_CENTER_Y = FRAME_H div 2;
  SQUARE_SIZE = 32;
  SQUARE_RADIUS = FRAME_H - SQUARE_CENTER_X - SQUARE_SIZE - 8;

  procedure Render(FrameBuffer: PSDL_Color; pitch: integer);
  var
    x, y: integer;
    posx, posy: LongInt;
  const
    SquareAngle: single = 0.0;
  begin
    posx := SDL_lround(SQUARE_CENTER_X + Cos(SquareAngle) * SQUARE_RADIUS);
    posy := SDL_lround(SQUARE_CENTER_Y + Sin(SquareAngle) * SQUARE_RADIUS);
    SquareAngle += (2 * Pi) / (60 * 2) / 100;

    for y := 0 to FRAME_H - 1 do begin
      for x := 0 to FRAME_W - 1 do begin
        FrameBuffer[y * pitch + x].A := $FF;
        FrameBuffer[y * pitch + x].R := y xor x;
        FrameBuffer[y * pitch + x].G := y xor x;
        FrameBuffer[y * pitch + x].B := y xor x;
      end;

      if (y > posy - SQUARE_SIZE) and (y < posy + SQUARE_SIZE) then begin
        for x := posx - SQUARE_SIZE + 1 to posx + SQUARE_SIZE - 1 do begin
          FrameBuffer[y * pitch + x].R := not FrameBuffer[y * pitch + x].R;
          FrameBuffer[y * pitch + x].G := not FrameBuffer[y * pitch + x].G;
          FrameBuffer[y * pitch + x].B := not FrameBuffer[y * pitch + x].B;
        end;
      end;
    end;
  end;

var
  Window: PSDL_Window;
  Renderer: PSDL_Renderer;
  Texture: PSDL_Texture;
  Event: TSDL_Event;
  Quit: boolean = False;
  TextureData: Pointer;
  TexturePitch: longint;

begin
  SDL_Init(SDL_INIT_VIDEO);

  Window := SDL_CreateWindow('Hello Quad', 320, 200, SDL_WINDOW_RESIZABLE);
  Renderer := SDL_CreateRenderer(Window, nil);
  Texture := SDL_CreateTexture(Renderer, SDL_PIXELFORMAT_BGRA32, SDL_TEXTUREACCESS_STREAMING, FRAME_W, FRAME_H);

  while not Quit do begin
    while SDL_PollEvent(@Event) do begin
      case Event._Type of
        SDL_EVENT_KEY_DOWN: begin
          case Event.Key.Scancode of
            SDL_SCANCODE_ESCAPE: begin
              Quit := True;
            end;
          end;
        end;
        SDL_EVENT_QUIT: begin
          Quit := True;
        end;
      end;
    end;

    SDL_LockTexture(Texture, nil, @TextureData, @TexturePitch);
    Render(TextureData, TexturePitch div 4);
    SDL_UnlockTexture(Texture);
    SDL_RenderTexture(Renderer, Texture, nil, nil);

    SDL_RenderPresent(Renderer);
  end;

  SDL_DestroyRenderer(Renderer);
  SDL_DestroyWindow(Window);
  SDL_DestroyTexture(Texture);
  SDL_Quit();
end.
