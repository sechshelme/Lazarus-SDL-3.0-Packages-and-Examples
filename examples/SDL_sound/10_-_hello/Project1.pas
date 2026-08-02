program project1;

uses
  SDL3,
  SDL3_sound;

  procedure main;
  var
    sample: PSound_Sample;
    dev: TSDL_AudioDeviceID;
    stream: PSDL_AudioStream;
    decoded_bytes, bytes: TUint32;
  begin
    if Sound_Init = 0 then begin
      SDL_Log('SDL_sound konnte nicht initialisiert werden: %s'#10, Sound_GetError);
      Exit;
    end;

    sample := Sound_NewSampleFromFile('/home/tux/Schreibtisch/sound/test.flac', nil, 65536);
    if sample = nil then begin
      SDL_Log('Fehler beim Laden: %s'#10, Sound_GetError);
      Sound_Quit;
      Exit;;
    end;

    dev := SDL_OpenAudioDevice(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, @sample^.actual);
    if dev = 0 then begin
      SDL_Log('Audiogerät konnte nicht geöffnet werden: %s'#10, SDL_GetError);
      Sound_FreeSample(sample);
      Sound_Quit;
      Exit;
    end;

    stream := SDL_CreateAudioStream(@sample^.actual, nil);
    if stream = nil then begin
      SDL_Log('SDL3 AudioStream Fehler: %s'#10, SDL_GetError);
      SDL_CloseAudioDevice(dev);
      Sound_FreeSample(sample);
      Sound_Quit;
      Exit;
    end;

    if not SDL_BindAudioStream(dev, stream) then begin
      SDL_Log('Fehler beim Binden des Streams: %s'#10, SDL_GetError);
      SDL_DestroyAudioStream(stream);
      SDL_CloseAudioDevice(dev);
      Sound_FreeSample(sample);
      Sound_Quit;
      Exit;
    end;

    SDL_ResumeAudioDevice(dev);

    decoded_bytes := Sound_Decode(sample);
    if decoded_bytes > 0 then begin
      SDL_PutAudioStreamData(stream, sample^.buffer, decoded_bytes);
    end;

    // 8. Musik abspielen und im Loop weitere Daten dekodieren (Streaming)
    SDL_Log('Musik wird abgespielt...'#10);
    while True do begin
      if SDL_GetAudioStreamAvailable(stream) < 32768 then begin
        if (sample^.flags and SOUND_SAMPLEFLAG_EOF) <> 0 or (sample^.flags and SOUND_SAMPLEFLAG_ERROR) then begin
          if SDL_GetAudioStreamAvailable(stream) = 0 then begin
            break;
          end;
        end else begin
          bytes := Sound_Decode(sample);
          if bytes > 0 then begin
            SDL_PutAudioStreamData(stream, sample^.buffer, bytes);
          end;
        end;
      end;
      SDL_Delay(10);
    end;
    SDL_Log('Wiedergabe beendet.'#10);

    Sound_FreeSample(sample);
    SDL_DestroyAudioStream(stream);
    SDL_CloseAudioDevice(dev);
    Sound_Quit;
    SDL_Quit;
  end;


begin
  main;
end.
