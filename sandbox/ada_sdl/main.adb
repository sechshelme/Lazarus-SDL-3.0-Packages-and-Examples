-- Zuerst einen Ornder "bindings" ind "obj" erstellen.

-- Binding im Ordner bindings erstellen:
-- gcc -c -fdump-ada-spec -C /usr/local/include/SDL3/SDL.h

-- Das Programm bauen
-- gnatmake-13 main.adb -Ibindings/ -D obj/ -o bin/main -cargs -ffunction-sections -fdata-sections -largs -Wl,--gc-sections -s -L/usr/local/lib -lSDL3




with System; -- Für Vergleiche mit null falls nötig
with Ada.Text_IO;             use Ada.Text_IO;
with Interfaces.C;            use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions; use Interfaces.C.Extensions; -- Wichtig für C_bool

with sdl3_sdl_init_h;    use sdl3_sdl_init_h;
with sdl3_sdl_video_h;   use sdl3_sdl_video_h;
with sdl3_sdl_events_h;  use sdl3_sdl_events_h;
with sdl3_sdl_error_h;   use sdl3_sdl_error_h;
with sdl3_sdl_keycode_h; use sdl3_sdl_keycode_h; 


procedure main is
   -- Wir definieren uns den Pointer-Typ passend zur generierten Struct:
   type SDL_Window_Ptr is access all sdl3_sdl_video_h.SDL_Window;
   pragma Convention (C, SDL_Window_Ptr); -- Wichtig für C-Kompatibilität

   Window  : SDL_Window_Ptr := null;
   Title   : Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.New_String("Ada SDL3 Fenster");
   Event   : aliased sdl3_sdl_events_h.SDL_Event;
   Running : Boolean := True;
begin
   -- SDL_Init gibt C_bool zurück (True/False aus Interfaces.C.Extensions)
   if SDL_Init (SDL_INIT_VIDEO) = False then
      Put_Line ("Fehler beim Initialisieren.");
      return;
   end if;

   -- Wir müssen den Rückgabewert eventuell casten, falls gnatmake meckert
   Window := SDL_Window_Ptr(SDL_CreateWindow (Title, 800, 600, 0));

   if Window = null then
      Put_Line ("Fenster konnte nicht erstellt werden.");
   else
      Put_Line ("Fenster offen! Drücke ESC oder Schließen zum Beenden.");
      while Running loop
         while SDL_PollEvent (Event'Access) = True loop
            -- Wir nutzen die Konstante aus dem generierten Binding
            if Event.c_type = SDL_EventType_SDL_EVENT_QUIT then 
               Running := False;
            end if;
            
            -- Optional: Auch auf ESC-Taste prüfen
            if Event.c_type = SDL_EventType_SDL_EVENT_KEY_DOWN then
              if Event.key.key = SDLK_ESCAPE then -- 16#1B# ist der Hex-Wert für ESC (ASCII 27)
                Running := False;
              end if;            
            end if;
         end loop;
         
         -- CPU-Last senken! Wichtig, damit der Lüfter nicht hochdreht:
         delay 0.01; -- 10ms warten (Ada Standard) oder SDL_Delay(10)
      end loop;
      
      -- Hier müssen wir den Pointer wieder zurückgeben
      SDL_DestroyWindow (Window);
   end if;

   SDL_Quit;
end main;
