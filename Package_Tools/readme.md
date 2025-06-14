# Übersetzen der C-Header
```bash
h2pas -p -T -d -c -e xxx.h
```

# diff
## SDL3
`diff SDL-release-3.2.4/include/SDL3/ SDL-release-3.2.6/include/SDL3/ -r > sdl.diff`

## SDL3_image
`diff SDL_image-release-3.2.0/include/ SDL_image-release-3.2.2/include/ -r > sdl_image.diff`

## SDL3_ttf
`diff SDL_ttf-prerelease-3.1.2/include/ SDL_ttf-release-3.2.0/include/ -r > sdl_ttf.diff`


# Spezielle Behandlungen:

### .../pas_units/sdl3_stdinc.pas
Folgendes ergänzen:
```pascal
type
  TUint8  = uint8;
  TUint16 = uint16;
  TUint32 = uint32;
  TUint64 = uint64;

  Tint8  = uint8;
  Tint16 = uint16;
  Tint32 = uint32;
  Tint64 = uint64;

  TSUint8  = uint8;
  TSUint16 = uint16;
  TSUint32 = uint32;
  TSUint64 = uint64;

  TSint8  = uint8;
  TSint16 = uint16;
  TSint32 = uint32;
  TSint64 = uint64;

  PSUint8  = ^uint8;
  PSUint16 = ^uint16;
  PSUint32 = ^uint32;
  PSUint64 = ^uint64;

  PSint8  = ^uint8;
  PSint16 = ^uint16;
  PSint32 = ^uint32;
  PSint64 = ^uint64;

  Tsize_t = SizeInt;
//  Tsize_t = SizeUInt;
  Tuintptr_t = PtrUInt;
                               

  Psize_t=^Tsize_t;

  Twchar_t = word;
  Pwchar_t = ^Twchar_t;
  PPwchar_t = ^Pwchar_t;

  PSDL_iconv_data_t = Pointer;
  Tintptr_t = Pointer;

  PPUint8 = ^PUint8;

// modifizieren
function SDL_log(x: cdouble): cdouble; cdecl; external name 'SDL_log';
```

### Makros
```pascal
function SDL_min(x, y: Longint): Longint; inline;
begin
  if x < y then begin
    Result := x;
  end else begin
    Result := y;
  end;
end;

function SDL_min(x, y: Single): Single; inline;
begin
  if x < y then begin
    Result := x;
  end else begin
    Result := y;
  end;
end;

function SDL_max(x, y: Longint): Longint; inline;
begin
  if x > y then begin
    Result := x;
  end else begin
    Result := y;
  end;
end;

function SDL_max(x, y: Single): Single; inline;
begin
  if x > y then begin
    Result := x;
  end else begin
    Result := y;
  end;
end;

function SDL_clamp(x, a, b: Longint): Longint; inline;
var
  if_local1: Longint;
begin
  if x > b then begin
    if_local1 := b;
  end else begin
    if_local1 := x;
  end;
  if x < a then begin
    Result := a;
  end else begin
    Result := if_local1;
  end;
end;

function SDL_clamp(x, a, b: Single): Single; inline;
var
  if_local1: Single;
begin
  if x > b then begin
    if_local1 := b;
  end else begin
    if_local1 := x;
  end;
  if x < a then begin
    Result := a;
  end else begin
    Result := if_local1;
  end;
end;
```

### .../pas_units/sdl3_pixels.pas
Folgendes ersetzen:
```pascal
type
  PSDL_Color = ^TSDL_Color;
  TSDL_Color = record
    case byte of
      1: (r, g, b, a: uint8);
      2: (items: array[0..3] of uint8);
  end;   

  PSDL_FColor = ^TSDL_FColor;
  TSDL_FColor = record
    case byte of
      1: (r, g, b, a: single);
      2: (items: array[0..3] of single);
    end;
```

### .../pas_units/sdl3_rect.pas
Folgendes ersetzen:
```pascal
type
  PSDL_Point = ^TSDL_Point;
  TSDL_Point = record
    case byte of
      1: (x, y: longint);
      2: (items: array[0..1] of longint);
  end;

  PSDL_FPoint = ^TSDL_FPoint;
  TSDL_FPoint = record
    case byte of
      1: (x, y: single);
      2: (items: array[0..1] of single);
  end;

  PSDL_Rect = ^TSDL_Rect;
  TSDL_Rect = record
    case byte of
      1: (x, y, w, h: longint);
      2: (items: array[0..3] of longint);
  end;

  PSDL_FRect = ^TSDL_FRect;
  TSDL_FRect = record
    case byte of
      1: (x, y, w, h: single);
      2: (items: array[0..3] of single);
  end;
```

### .../pas_units/sdl3_log.pas
Folgendes ergänzen:
```pascal
procedure SDL_Log(fmt: PAnsiChar); varargs; cdecl; external libSDL3 name 'SDL_Log';
```
# Unit Abhängigkeiten

Unit            | Abhängigkeit
---------       | ---------
SDL_stdinc      |
SDL_guid        |
SDL_properties  |
SDL_log         |
SDL_endian      |
SDL_bits        |
SDL_atomic      |
SDL_timer       |
SDL_time        |
SDL_cpuinfo     |
SDL_error       |
SDL_loadso      |
SDL_version     |
SDL_clipboard   |
SDL_power       |
SDL_filesystem  |
SDL_storage     |   SDL_properties, SDL_filesystem
SDL_hidapi      |
SDL_assert      |
SDL_hints       |
SDL_thread      |   SDL_atomic, SDL_properties
SDL_mutex       |   SDL_atomic, SDL_thread
SDL_blendmode   |
SDL_rect        |
SDL_pixels      |
SDL_iostream    |   SDL_properties
SDL_process     |   SDL_properties, SDL_iostream
SDL_sensor      |   SDL_properties
SDL_surface     |   SDL_properties, SDL_pixels, SDL_iostream, SDL_blendmode, SDL_rect
SDL_video       |   SDL_properties, SDL_pixels, SDL_rect, SDL_surface
SDL_system      |   SDL_video
SDL_dialog      |   SDL_video
SDL_messagebox  |   SDL_video
SDL_vulkan      |   SDL_video
SDL_scancode    |
SDL_keycode     |
SDL_keyboard    |   SDL_properties, SDL_video, SDL_keycode, SDL_scancode, SDL_rect
SDL_joystick    |   SDL_properties, SDL_mutex, SDL_guid, SDL_sensor, SDL_power
SDL_gamepad     |   SDL_properties, SDL_iostream, SDL_guid, SDL_power, SDL_joystick, SDL_sensor
SDL_haptic      |   SDL_joystick
SDL_audio       |   SDL_properties, SDL_iostream
SDL_camera      |   SDL_properties, SDL_pixels, SDL_surface
SDL_mouse       |   SDL_video, SDL_surface
SDL_touch       |   SDL_mouse
SDL_pen         |
SDL_events      |   SDL_video, SDL_keyboard, SDL_keycode, SDL_mouse, SDL_pen, SDL_sensor, SDL_touch, SDL_scancode, SDL_joystick, SDL_power, SDL_audio, SDL_camera
SDL_init        |   SDL_events
SDL_render      |   SDL_rect, SDL_pixels, SDL_video, SDL_properties, SDL_surface, SDL_blendmode, SDL_events
SDL_metal       |
SDL_locale      |
SDL_misc        |
SDL_platform    |
SDL_revision    |
SDL_main        |   SDL_init, SDL_events
SDL_gpu         |   SDL_properties, SDL_pixels, SDL_surface, SDL_rect, SDL_video


 
