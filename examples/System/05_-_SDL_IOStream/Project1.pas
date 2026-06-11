program Project1;

uses
  SDL3;

  procedure WriteStream;
  var
    stream: PSDL_IOStream;
  begin
    stream := SDL_IOFromFile('test.bin', 'wb');
    SDL_WriteS32LE(stream, 1234);
    SDL_WriteS32LE(stream, 4321);
    SDL_CloseIO(stream);

    SDL_Log('Daten gespeichert');
  end;

  procedure ReadStream;
  var
    stream: PSDL_IOStream;
    i1, i2: int32;
  begin
    stream := SDL_IOFromFile('test.bin', 'rb');
    SDL_ReadS32LE(stream, @i1);
    SDL_ReadS32LE(stream, @i2);
    SDL_CloseIO(stream);

    SDL_Log('i1: %d    i2: %d', i1, i2);
  end;

  procedure main;
  begin
    WriteStream;
    ReadStream;
  end;

begin
  main;
end.
