program Project1;

uses
  SDL3;

type
  TBuf = array[0..127] of char;

  function BoolToYesNo(b: boolean): TBuf;
  begin
    if b then begin
      Result := '[X]';
    end else begin
      Result := '[ ]';
    end;
  end;

  procedure ShowSysInfo;
  begin
    SDL_Log('CPU Info:');
    SDL_Log('---------');

    SDL_Log('Anzahl logischer CPU-Kerne: %d', SDL_GetNumLogicalCPUCores);
    SDL_Log('Cache-Line-Größe: %d Bytes', SDL_GetCPUCacheLineSize);
    SDL_Log('System-RAM: %d MB', SDL_GetSystemRAM);
    SDL_Log('SIMD-Ausrichtung: %d Bytes', SDL_GetSIMDAlignment);

    SDL_Log('SIMD-Unterstützung:');
    SDL_Log('  AltiVec: %s', BoolToYesNo(SDL_HasAltiVec));
    SDL_Log('  MMX:      %s', BoolToYesNo(SDL_HasMMX));
    SDL_Log('  SSE:      %s', BoolToYesNo(SDL_HasSSE));
    SDL_Log('  SSE2:     %s', BoolToYesNo(SDL_HasSSE2));
    SDL_Log('  SSE3:     %s', BoolToYesNo(SDL_HasSSE3));
    SDL_Log('  SSE4.1:   %s', BoolToYesNo(SDL_HasSSE41));
    SDL_Log('  SSE4.2:   %s', BoolToYesNo(SDL_HasSSE42));
    SDL_Log('  AVX:      %s', BoolToYesNo(SDL_HasAVX));
    SDL_Log('  AVX2:     %s', BoolToYesNo(SDL_HasAVX2));
    SDL_Log('  AVX512F:  %s', BoolToYesNo(SDL_HasAVX512F));
    SDL_Log('  ARM SIMD: %s', BoolToYesNo(SDL_HasARMSIMD));
    SDL_Log('  NEON:     %s', BoolToYesNo(SDL_HasNEON));
    SDL_Log('  LSX:      %s', BoolToYesNo(SDL_HasLSX));
    SDL_Log('  LASX:     %s', BoolToYesNo(SDL_HasLASX));
  end;

  procedure ShowVideo;
  var
    display: TSDL_DisplayID;
    Count: longint;
    modes: PPSDL_DisplayMode;
    mode: PSDL_DisplayMode;
    i: integer;
    s: string;
  begin
    display := SDL_GetPrimaryDisplay;
    modes := SDL_GetFullscreenDisplayModes(display, @Count);
    SDL_Log('Display Count: %i', Count);
    if modes <> nil then begin
      for i := 0 to Count - 1 do begin
        mode := modes[i];
        WriteStr(s, '  Display: ', display: 3, ' mode: ', i: 4, '     ', mode^.w: 4, ' x ', mode^.h: 4, '   ', mode^.refresh_rate: 5: 1);
        SDL_Log(PChar(s));
      end;
      SDL_free(modes);
    end;
    Count := SDL_GetNumRenderDrivers;
    SDL_Log(nil);
    SDL_Log('Renderer  Count: %i', Count);
    for i := 0 to Count - 1 do begin
      SDL_Log('  %s', SDL_GetRenderDriver(i));
    end;
  end;

  procedure ShowAudio;
  var
    devices: PSDL_AudioDeviceID;
    num_devices: longint;
    i: integer;
    instance_id: TSDL_AudioDeviceID;
    Name: PAnsiChar;
  begin
    num_devices := SDL_GetNumAudioDrivers;

    devices := SDL_GetAudioPlaybackDevices(@num_devices);
    if devices <> nil then begin
      SDL_Log('AudioDevice Count: %i', num_devices);
      for i := 0 to num_devices - 1 do begin
        instance_id := devices[i];
        Name := SDL_GetAudioDeviceName(instance_id);
        SDL_Log('  AudioDevice %i: %s', instance_id, Name);
        SDL_free(Name);
      end;
      SDL_free(devices);
    end;
  end;

  procedure ShowEnvironment;
  var
    ev: PSDL_Environment;
    ev_items, p: PPAnsiChar;
  begin
    ev := SDL_GetEnvironment;
    ev_items := SDL_GetEnvironmentVariables(ev);
    if ev_items <> nil then begin
      SDL_Log('Environment:');
      p := ev_items;
      while p^ <> nil do begin
        SDL_Log('  %s', p^);
        Inc(p);
      end;
      SDL_free(ev_items);
    end;
    SDL_DestroyEnvironment(ev);
  end;

  procedure ShowDir;
  var
    list, p: PPAnsiChar;
    Count: longint;
  begin
    list := SDL_GlobDirectory('.', nil, SDL_GLOB_CASEINSENSITIVE, @Count);
    p := list;
    SDL_Log('Directory: (%i)', Count);
    if list <> nil then  begin
      while p^ <> nil do begin
        SDL_Log('  %s', p^);
        Inc(p);
      end;
      SDL_free(list);
    end;
  end;

begin
  SDL_Init(SDL_INIT_VIDEO or SDL_INIT_AUDIO);

  SDL_Log('Plattform: %s', SDL_GetPlatform);
  SDL_Log(nil);
  ShowSysInfo;
  SDL_Log(nil);
  ShowVideo;
  SDL_Log(nil);
  ShowAudio;
  SDL_Log(nil);
  ShowEnvironment;
  SDL_Log(nil);
  ShowDir;

  SDL_Quit;
end.
