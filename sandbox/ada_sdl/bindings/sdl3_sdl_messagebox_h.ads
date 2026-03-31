pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Strings;
limited with SDL3_SDL_video_h;
with Interfaces.C.Extensions;

package SDL3_SDL_messagebox_h is

   SDL_MESSAGEBOX_ERROR : constant := 16#00000010#;  --  /usr/local/include/SDL3/SDL_messagebox.h:61
   SDL_MESSAGEBOX_WARNING : constant := 16#00000020#;  --  /usr/local/include/SDL3/SDL_messagebox.h:62
   SDL_MESSAGEBOX_INFORMATION : constant := 16#00000040#;  --  /usr/local/include/SDL3/SDL_messagebox.h:63
   SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT : constant := 16#00000080#;  --  /usr/local/include/SDL3/SDL_messagebox.h:64
   SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT : constant := 16#00000100#;  --  /usr/local/include/SDL3/SDL_messagebox.h:65

   SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT : constant := 16#00000001#;  --  /usr/local/include/SDL3/SDL_messagebox.h:74
   SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT : constant := 16#00000002#;  --  /usr/local/include/SDL3/SDL_messagebox.h:75

  --  Simple DirectMedia Layer
  --  Copyright (C) 1997-2026 Sam Lantinga <slouken@libsdl.org>
  --  This software is provided 'as-is', without any express or implied
  --  warranty.  In no event will the authors be held liable for any damages
  --  arising from the use of this software.
  --  Permission is granted to anyone to use this software for any purpose,
  --  including commercial applications, and to alter it and redistribute it
  --  freely, subject to the following restrictions:
  --  1. The origin of this software must not be misrepresented; you must not
  --     claim that you wrote the original software. If you use this software
  --     in a product, an acknowledgment in the product documentation would be
  --     appreciated but is not required.
  --  2. Altered source versions must be plainly marked as such, and must not be
  --     misrepresented as being the original software.
  --  3. This notice may not be removed or altered from any source distribution.
  -- 

  --*
  -- * # CategoryMessagebox
  -- *
  -- * SDL offers a simple message box API, which is useful for simple alerts,
  -- * such as informing the user when something fatal happens at startup without
  -- * the need to build a UI for it (or informing the user _before_ your UI is
  -- * ready).
  -- *
  -- * These message boxes are native system dialogs where possible.
  -- *
  -- * There is both a customizable function (SDL_ShowMessageBox()) that offers
  -- * lots of options for what to display and reports on what choice the user
  -- * made, and also a much-simplified version (SDL_ShowSimpleMessageBox()),
  -- * merely takes a text message and title, and waits until the user presses a
  -- * single "OK" UI button. Often, this is all that is necessary.
  --  

  -- For SDL_Window  
  -- Set up for C function definitions, even when using C++  
  --*
  -- * Message box flags.
  -- *
  -- * If supported will display warning icon, etc.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_MessageBoxFlags is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_messagebox.h:59

  --*
  -- * SDL_MessageBoxButtonData flags.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_MessageBoxButtonFlags is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_messagebox.h:72

  --*
  -- * Individual button data.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_MessageBoxButtonData is record
      flags : aliased SDL_MessageBoxButtonFlags;  -- /usr/local/include/SDL3/SDL_messagebox.h:84
      buttonID : aliased int;  -- /usr/local/include/SDL3/SDL_messagebox.h:85
      text : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_messagebox.h:86
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_messagebox.h:82

  --*< User defined button id (value returned via SDL_ShowMessageBox)  
  --*< The UTF-8 button text  
  --*
  -- * RGB value used in a message box color scheme
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_MessageBoxColor is record
      r : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_messagebox.h:96
      g : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_messagebox.h:96
      b : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_messagebox.h:96
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_messagebox.h:94

  --*
  -- * An enumeration of indices inside the colors array of
  -- * SDL_MessageBoxColorScheme.
  --  

   type SDL_MessageBoxColorType is 
     (SDL_MESSAGEBOX_COLOR_BACKGROUND,
      SDL_MESSAGEBOX_COLOR_TEXT,
      SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
      SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
      SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
      SDL_MESSAGEBOX_COLOR_COUNT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_messagebox.h:103

  --*< Size of the colors array of SDL_MessageBoxColorScheme.  
  --*
  -- * A set of colors to use for message box dialogs
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type anon_array3698 is array (0 .. 4) of aliased SDL_MessageBoxColor;
   type SDL_MessageBoxColorScheme is record
      colors : aliased anon_array3698;  -- /usr/local/include/SDL3/SDL_messagebox.h:120
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_messagebox.h:118

  --*
  -- * MessageBox structure containing title, text, window, etc.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_MessageBoxData is record
      flags : aliased SDL_MessageBoxFlags;  -- /usr/local/include/SDL3/SDL_messagebox.h:130
      window : access SDL3_SDL_video_h.SDL_Window;  -- /usr/local/include/SDL3/SDL_messagebox.h:131
      title : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_messagebox.h:132
      message : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_messagebox.h:133
      numbuttons : aliased int;  -- /usr/local/include/SDL3/SDL_messagebox.h:135
      buttons : access constant SDL_MessageBoxButtonData;  -- /usr/local/include/SDL3/SDL_messagebox.h:136
      colorScheme : access constant SDL_MessageBoxColorScheme;  -- /usr/local/include/SDL3/SDL_messagebox.h:138
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_messagebox.h:128

  --*< Parent window, can be NULL  
  --*< UTF-8 title  
  --*< UTF-8 message text  
  --*< SDL_MessageBoxColorScheme, can be NULL to use system settings  
  --*
  -- * Create a modal message box.
  -- *
  -- * If your needs aren't complex, it might be easier to use
  -- * SDL_ShowSimpleMessageBox.
  -- *
  -- * This function should be called on the thread that created the parent
  -- * window, or on the main thread if the messagebox has no parent. It will
  -- * block execution of that thread until the user clicks a button or closes the
  -- * messagebox.
  -- *
  -- * This function may be called at any time, even before SDL_Init(). This makes
  -- * it useful for reporting errors like a failure to create a renderer or
  -- * OpenGL context.
  -- *
  -- * On X11, SDL rolls its own dialog box with X11 primitives instead of a
  -- * formal toolkit like GTK+ or Qt.
  -- *
  -- * Note that if SDL_Init() would fail because there isn't any available video
  -- * target, this function is likely to fail for the same reasons. If this is a
  -- * concern, check the return value from this function and fall back to writing
  -- * to stderr if you can.
  -- *
  -- * \param messageboxdata the SDL_MessageBoxData structure with title, text and
  -- *                       other options.
  -- * \param buttonid the pointer to which user id of hit button should be
  -- *                 copied.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ShowSimpleMessageBox
  --  

   function SDL_ShowMessageBox (messageboxdata : access constant SDL_MessageBoxData; buttonid : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_messagebox.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShowMessageBox";

  --*
  -- * Display a simple modal message box.
  -- *
  -- * If your needs aren't complex, this function is preferred over
  -- * SDL_ShowMessageBox.
  -- *
  -- * `flags` may be any of the following:
  -- *
  -- * - `SDL_MESSAGEBOX_ERROR`: error dialog
  -- * - `SDL_MESSAGEBOX_WARNING`: warning dialog
  -- * - `SDL_MESSAGEBOX_INFORMATION`: informational dialog
  -- *
  -- * This function should be called on the thread that created the parent
  -- * window, or on the main thread if the messagebox has no parent. It will
  -- * block execution of that thread until the user clicks a button or closes the
  -- * messagebox.
  -- *
  -- * This function may be called at any time, even before SDL_Init(). This makes
  -- * it useful for reporting errors like a failure to create a renderer or
  -- * OpenGL context.
  -- *
  -- * On X11, SDL rolls its own dialog box with X11 primitives instead of a
  -- * formal toolkit like GTK+ or Qt.
  -- *
  -- * Note that if SDL_Init() would fail because there isn't any available video
  -- * target, this function is likely to fail for the same reasons. If this is a
  -- * concern, check the return value from this function and fall back to writing
  -- * to stderr if you can.
  -- *
  -- * \param flags an SDL_MessageBoxFlags value.
  -- * \param title UTF-8 title text.
  -- * \param message UTF-8 message text.
  -- * \param window the parent window, or NULL for no parent.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ShowMessageBox
  --  

   function SDL_ShowSimpleMessageBox
     (flags : SDL_MessageBoxFlags;
      title : Interfaces.C.Strings.chars_ptr;
      message : Interfaces.C.Strings.chars_ptr;
      window : access SDL3_SDL_video_h.SDL_Window) return Extensions.bool  -- /usr/local/include/SDL3/SDL_messagebox.h:217
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShowSimpleMessageBox";

  -- Ends C function definitions when using C++  
end SDL3_SDL_messagebox_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
