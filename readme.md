# Einleitung
- Dies ist eine SDL3.2.x - Bindung für FPC/Lazarus

# Installation
Das SDL3 überhaupt mit Lazarus läuft, müssen die C-Libs installiert werden.
Bei folgenden Links findet man die Sourcen der letzten stable, und für Windows fertige DLLs.

- [SDL 3.2.x](https://github.com/libsdl-org/SDL/releases)
- [SDL_image 3.2.x](https://github.com/libsdl-org/SDL_image/releases)
- [SDL_ttf 3.1.x](https://github.com/libsdl-org/SDL_ttf/releases)
- SDL_mixer ( in Arbeit )
- SDL_net ( in Arbeit )
- SDL_rtf ( in Arbeit )

## Linux
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

## Windows
- Die DLLs sind bei den Release-Links dabei. Sie müssen nach `C:\windows\system32` kopiert werden.

# Neuerungen:
| Datum      | Änderungen 
| ---        | ---
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

# Examples
- [Examples](examples)

# Diverses
## Probleme mit SDL_mixer
Eventuell muss unter linux folgends für `SDL_mixer` installiert werden:
- `sudo apt install fluidsynth`


## Speicherleek
Wen folgendes ein Speicherleek anzeigt `valgrind --leak-check=full ./main`, muss folgendes im Code eingefügt werden.
```c
SDL_SetHint(SDL_HINT_SHUTDOWN_DBUS_ON_QUIT, '1');
```
Genauer testen `valgrind --leak-check=full --trace-children=yes ./main`





