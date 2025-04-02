/*
  Linux:
  gcc main.c -o main -lSDL3

  Windows:
  x86_64-w64-mingw32-gcc main.c -o main.exe -lSDL3 -I/usr/local/include -L/usr/local/bin
*/

#include <SDL3/SDL.h>

int main(int argc, char* argv[]) {
    SDL_Window* window = NULL;
    SDL_Renderer* renderer = NULL;

    SDL_Init(SDL_INIT_VIDEO);

    SDL_CreateWindowAndRenderer("test", 640, 480, 0, &window, &renderer);

    SDL_Delay(3000);
}

