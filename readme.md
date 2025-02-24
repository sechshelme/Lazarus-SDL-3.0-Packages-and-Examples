# Englisch

## Introduction
- This is an SDL3.2.x binding for FPC/Lazarus (Delphi not tested)

## Platforms
- Linux 32 and 64 bit
- Windows 64bit (32bit not tested)
- Rasberry Pi
- Mac (not tested)

## Note
The packages/units should all run with FPC 3.2.
There are some examples that require FPC 3.3

If you replace the following in the examples, it should also work with FPC 3.2.
```pascal
// old:
Dest.items := [100, 100, 200, 200];

// new
Dest.x := 100;
Dest.y := 100;
Dest.w := 200;
Dest.h := 200;
```

### Mutex and Thread
If you use `SDL_mutex` and `SDL_thread`, it can, at least under Linux, trigger a
`runtime error 202`.
To fix this, all debugging stuff has to be turned off.## Installation
In order for SDL3 to run with Lazarus, the C-Libs must be installed.
The following links contain the sources of the latest stable version and DLLs ready for Windows.

- [SDL 3.2.x](https://github.com/libsdl-org/SDL/releases)
- [SDL_image 3.2.x](https://github.com/libsdl-org/SDL_image/releases)
- [SDL_ttf 3.1.x](https://github.com/libsdl-org/SDL_ttf/releases)
- SDL_mixer ( in progress )
- SDL_net ( in progress )
- SDL_rtf ( in progress )

### Linux
- Follow the instructions: [Readme](https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.md)

The following script downloads, builds and installs the latest SDL3.

You should then find the *.so in `/usr/local/lib`.
```sh
echo ======================= SDL3 Basic ==============================
mkdir SDL3
cd SDL3
git clone https://github.com/libsdl-org/SDL.git

# Linux
mkdir build
cd build
cmake ../SDL
make -j16
sudo make install
cd ../..
```
A similar procedure is required for the SDL additional packages.

### Windows
- The DLLs are included in the release links. They must be copied to `C:\windows\system32`.

## Updates:
| Date       | Changes 
| ---        | ---
| 23.02.2025 | Replaced forgotten `array of const` with `varargs`.
| 21.02.2025 | Adapted to SDL_ttf-prerelease-3.1.2
| 07.02.2025 | Adapted to SDL-release-3.2.4
| 02.02.2025 | Adapted to SDL-ttf-preview-3.1.0
| 02.02.2025 | Adapted to SDL-release-3.2.2
| 02.02.2025 | Adapted to SDL_image-release-3.2.0
| 24.01.2025 | Adapted to SDL_image-prerelease-3.1.1
| 22.01.2025 | Adapted to SDL-release-3.2.0
| 17.01.2025 | Adapted to SDL-prerelease-3.1.10
| 08.01.2025 | Adapted to SDL-preview-3.1.8
| 08.12.2024 | Adapted to SDL_image-preview-3.1.0
| 03.11.2024 | Adapted to SDL-preview-3.1.6
| 22.10.2024 | Adapted to SDL-preview-3.1.3
| 19.03.2024 | Repository opened

## Examples
- [Examples](examples)

## Miscellaneous
### Problems with SDL_mixer
The following may need to be installed for `SDL_mixer` under Linux:
- `sudo apt install fluidsynth`

### Memory leak
If the following indicates a memory leak `valgrind --leak-check=full ./main`, the following must be inserted into the code.
```c
SDL_SetHint(SDL_HINT_SHUTDOWN_DBUS_ON_QUIT, '1');
```
Test more precisely `valgrind --leak-check=full --trace-children=yes ./main`

***
# Deutsch 

## Einleitung
- Dies ist eine SDL3.2.x - Bindung für FPC/Lazarus ( Delphi nicht getestet )

## Plattformen
- Linux 32 und 64 bit
- Windows 64bit ( 32bit nicht getestet)
- Rasberry Pi
- Mac ( nicht getestet )

## Hinweis
Die Package / Units sollten alle mit FPC 3.2 laufen.
Bei den Beispielen gibt es einige, welche FPC 3.3 verlangen

Wen man folgendes in den Beispielen ersetzt, sollte es auch mit FPC 3.2 gehen.
```pascal
// old:
Dest.items := [100, 100, 200, 200]; 

// new
Dest.x := 100;
Dest.y := 100;
Dest.w := 200;
Dest.h := 200;
```

### Mutex und Thread
Wen man `SDL_mutex` und `SDL_thread` verwendet, kann es sein, zumindest unter Linux, das es einen 
`runtime error 202` auslöst.
Um das zu beheben, müssen sämtliche Debugging Sachen ausgeschalten werden.


## Installation
Das SDL3 überhaupt mit Lazarus läuft, müssen die C-Libs installiert werden.
Bei folgenden Links findet man die Sourcen der letzten stable, und für Windows fertige DLLs.

- [SDL 3.2.x](https://github.com/libsdl-org/SDL/releases)
- [SDL_image 3.2.x](https://github.com/libsdl-org/SDL_image/releases)
- [SDL_ttf 3.1.x](https://github.com/libsdl-org/SDL_ttf/releases)
- SDL_mixer ( in Arbeit )
- SDL_net ( in Arbeit )
- SDL_rtf ( in Arbeit )

### Linux
- Folgende Anleitung beachten: [Readme](https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.md)

Folgendes Script ladet das neuste SDL3 herunter, baut und installiert es.
Anschliessen sollte man die *.so in `/usr/local/lib` finden.
```sh
echo ======================= SDL3 Basic ==============================
mkdir SDL3
cd SDL3
git clone https://github.com/libsdl-org/SDL.git

# Linux
mkdir build
cd build
cmake ../SDL
make -j16
sudo make install
cd ../..
```
Für die SDL Zusatzpackete in ein ähnliches vorgehen nötig.

### Windows
- Die DLLs sind bei den Release-Links dabei. Sie müssen nach `C:\windows\system32` kopiert werden.

## Neuerungen:
| Datum      | Änderungen 
| ---        | ---
| 23.02.2025 | Vergessene `array of const` durch `varargs` ersetzt.
| 21.02.2025 | Angepasst an SDL_ttf-prerelease-3.1.2
| 07.02.2025 | Angepasst an SDL-release-3.2.4
| 02.02.2025 | Angepasst an SDL-ttf-preview-3.1.0
| 02.02.2025 | Angepasst an SDL-release-3.2.2
| 02.02.2025 | Angepasst an SDL_image-release-3.2.0
| 24.01.2025 | Angepasst an SDL_image-prerelease-3.1.1
| 22.01.2025 | Angepasst an SDL-release-3.2.0
| 17.01.2025 | Angepasst an SDL-prerelease-3.1.10
| 08.01.2025 | Angepasst an SDL-preview-3.1.8
| 08.12.2024 | Angepasst an SDL_image-preview-3.1.0
| 03.11.2024 | Angepasst an SDL-preview-3.1.6
| 22.10.2024 | Angepasst an SDL-preview-3.1.3
| 19.03.2024 | Eröfffnung des Repository

## Examples
- [Examples](examples)

## Diverses
### Probleme mit SDL_mixer
Eventuell muss unter linux folgends für `SDL_mixer` installiert werden:
- `sudo apt install fluidsynth`


### Speicherleek
Wen folgendes ein Speicherleek anzeigt `valgrind --leak-check=full ./main`, muss folgendes im Code eingefügt werden.
```c
SDL_SetHint(SDL_HINT_SHUTDOWN_DBUS_ON_QUIT, '1');
```
Genauer testen `valgrind --leak-check=full --trace-children=yes ./main`





