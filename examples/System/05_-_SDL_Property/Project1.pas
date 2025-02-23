program Project1;

uses
  SDL3;

var
  props: TSDL_PropertiesID;
  number: TSint64;
  hello: PAnsiChar;
begin
  SDL_Init(SDL_INIT_VIDEO or SDL_INIT_AUDIO);

  props := SDL_CreateProperties;

  SDL_SetNumberProperty(props, 'number', 1234);
  SDL_SetStringProperty(props, 'hello', 'Hello World!');

  number := SDL_GetNumberProperty(props, 'number', 0);
  hello := SDL_GetStringProperty(props, 'hello', 'hallo');
  SDL_Log('Number: %d', number);  // -> 1234
  SDL_Log('String:: %s', hello);  // -> HelloWorld!

  hello := SDL_GetStringProperty(props, 'xxx', 'hello');
  SDL_Log('String:: %s', hello);  // -> hello
end.
