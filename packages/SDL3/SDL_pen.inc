
{$IFDEF read_interface}

type
  TSDL_PenID = TUint32;
  PSDL_PenID = ^TSDL_PenID;

const
  SDL_PEN_MOUSEID = TSDL_MouseID(-2);
  SDL_PEN_TOUCHID = TSDL_TouchID(-2);

type
  PSDL_PenInputFlags = ^TSDL_PenInputFlags;
  TSDL_PenInputFlags = TUint32;

const
  SDL_PEN_INPUT_DOWN = 1 shl 0;
  SDL_PEN_INPUT_BUTTON_1 = 1 shl 1;
  SDL_PEN_INPUT_BUTTON_2 = 1 shl 2;
  SDL_PEN_INPUT_BUTTON_3 = 1 shl 3;
  SDL_PEN_INPUT_BUTTON_4 = 1 shl 4;
  SDL_PEN_INPUT_BUTTON_5 = 1 shl 5;
  SDL_PEN_INPUT_ERASER_TIP = 1 shl 30;

type
  PSDL_PenAxis = ^TSDL_PenAxis;
  TSDL_PenAxis = longint;

const
  SDL_PEN_AXIS_PRESSURE = 0;
  SDL_PEN_AXIS_XTILT = 1;
  SDL_PEN_AXIS_YTILT = 2;
  SDL_PEN_AXIS_DISTANCE = 3;
  SDL_PEN_AXIS_ROTATION = 4;
  SDL_PEN_AXIS_SLIDER = 5;
  SDL_PEN_AXIS_TANGENTIAL_PRESSURE = 6;
  SDL_PEN_AXIS_COUNT = 7;

{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
