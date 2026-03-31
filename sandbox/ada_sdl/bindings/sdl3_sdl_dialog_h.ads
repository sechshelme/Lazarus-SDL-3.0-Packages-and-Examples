pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
limited with SDL3_SDL_video_h;
with Interfaces.C.Extensions;
with SDL3_SDL_properties_h;

package SDL3_SDL_dialog_h is

   SDL_PROP_FILE_DIALOG_FILTERS_POINTER : aliased constant String := "SDL.filedialog.filters" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:328
   SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER : aliased constant String := "SDL.filedialog.nfilters" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:329
   SDL_PROP_FILE_DIALOG_WINDOW_POINTER : aliased constant String := "SDL.filedialog.window" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:330
   SDL_PROP_FILE_DIALOG_LOCATION_STRING : aliased constant String := "SDL.filedialog.location" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:331
   SDL_PROP_FILE_DIALOG_MANY_BOOLEAN : aliased constant String := "SDL.filedialog.many" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:332
   SDL_PROP_FILE_DIALOG_TITLE_STRING : aliased constant String := "SDL.filedialog.title" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:333
   SDL_PROP_FILE_DIALOG_ACCEPT_STRING : aliased constant String := "SDL.filedialog.accept" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:334
   SDL_PROP_FILE_DIALOG_CANCEL_STRING : aliased constant String := "SDL.filedialog.cancel" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_dialog.h:335

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
  -- * # CategoryDialog
  -- *
  -- * File dialog support.
  -- *
  -- * SDL offers file dialogs, to let users select files with native GUI
  -- * interfaces. There are "open" dialogs, "save" dialogs, and folder selection
  -- * dialogs. The app can control some details, such as filtering to specific
  -- * files, or whether multiple files can be selected by the user.
  -- *
  -- * Note that launching a file dialog is a non-blocking operation; control
  -- * returns to the app immediately, and a callback is called later (possibly in
  -- * another thread) when the user makes a choice.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * An entry for filters for file dialogs.
  -- *
  -- * `name` is a user-readable label for the filter (for example, "Office
  -- * document").
  -- *
  -- * `pattern` is a semicolon-separated list of file extensions (for example,
  -- * "doc;docx"). File extensions may only contain alphanumeric characters,
  -- * hyphens, underscores and periods. Alternatively, the whole string can be a
  -- * single asterisk ("*"), which serves as an "All files" filter.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DialogFileCallback
  -- * \sa SDL_ShowOpenFileDialog
  -- * \sa SDL_ShowSaveFileDialog
  -- * \sa SDL_ShowOpenFolderDialog
  -- * \sa SDL_ShowFileDialogWithProperties
  --  

   type SDL_DialogFileFilter is record
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_dialog.h:72
      pattern : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_dialog.h:73
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_dialog.h:70

  --*
  -- * Callback used by file dialog functions.
  -- *
  -- * The specific usage is described in each function.
  -- *
  -- * If `filelist` is:
  -- *
  -- * - NULL, an error occurred. Details can be obtained with SDL_GetError().
  -- * - A pointer to NULL, the user either didn't choose any file or canceled the
  -- *   dialog.
  -- * - A pointer to non-`NULL`, the user chose one or more files. The argument
  -- *   is a null-terminated array of pointers to UTF-8 encoded strings, each
  -- *   containing a path.
  -- *
  -- * The filelist argument should not be freed; it will automatically be freed
  -- * when the callback returns.
  -- *
  -- * The filter argument is the index of the filter that was selected, or -1 if
  -- * no filter was selected or if the platform or method doesn't support
  -- * fetching the selected filter.
  -- *
  -- * In Android, the `filelist` are `content://` URIs. They should be opened
  -- * using SDL_IOFromFile() with appropriate modes. This applies both to open
  -- * and save file dialog.
  -- *
  -- * \param userdata an app-provided pointer, for the callback's use.
  -- * \param filelist the file(s) chosen by the user.
  -- * \param filter index of the selected filter.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DialogFileFilter
  -- * \sa SDL_ShowOpenFileDialog
  -- * \sa SDL_ShowSaveFileDialog
  -- * \sa SDL_ShowOpenFolderDialog
  -- * \sa SDL_ShowFileDialogWithProperties
  --  

   type SDL_DialogFileCallback is access procedure
        (arg1 : System.Address;
         arg2 : System.Address;
         arg3 : int)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_dialog.h:113

  --*
  -- * Displays a dialog that lets the user select a file on their filesystem.
  -- *
  -- * This is an asynchronous function; it will return immediately, and the
  -- * result will be passed to the callback.
  -- *
  -- * The callback will be invoked with a null-terminated list of files the user
  -- * chose. The list will be empty if the user canceled the dialog, and it will
  -- * be NULL if an error occurred.
  -- *
  -- * Note that the callback may be called from a different thread than the one
  -- * the function was invoked on.
  -- *
  -- * Depending on the platform, the user may be allowed to input paths that
  -- * don't yet exist.
  -- *
  -- * On Linux, dialogs may require XDG Portals, which requires DBus, which
  -- * requires an event-handling loop. Apps that do not use SDL to handle events
  -- * should add a call to SDL_PumpEvents in their main loop.
  -- *
  -- * \param callback a function pointer to be invoked when the user selects a
  -- *                 file and accepts, or cancels the dialog, or an error
  -- *                 occurs.
  -- * \param userdata an optional pointer to pass extra data to the callback when
  -- *                 it will be invoked.
  -- * \param window the window that the dialog should be modal for, may be NULL.
  -- *               Not all platforms support this option.
  -- * \param filters a list of filters, may be NULL. See the
  -- *                [`SDL_DialogFileFilter`](SDL_DialogFileFilter#code-examples)
  -- *                documentation for examples]. Not all platforms support this
  -- *                option, and platforms that do support it may allow the user
  -- *                to ignore the filters. If non-NULL, it must remain valid at
  -- *                least until the callback is invoked.
  -- * \param nfilters the number of filters. Ignored if filters is NULL.
  -- * \param default_location the default folder or file to start the dialog at,
  -- *                         may be NULL. Not all platforms support this option.
  -- * \param allow_many if non-zero, the user will be allowed to select multiple
  -- *                   entries. Not all platforms support this option.
  -- *
  -- * \threadsafety This function should be called only from the main thread. The
  -- *               callback may be invoked from the same thread or from a
  -- *               different one, depending on the OS's constraints.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DialogFileCallback
  -- * \sa SDL_DialogFileFilter
  -- * \sa SDL_ShowSaveFileDialog
  -- * \sa SDL_ShowOpenFolderDialog
  -- * \sa SDL_ShowFileDialogWithProperties
  --  

   procedure SDL_ShowOpenFileDialog
     (callback : SDL_DialogFileCallback;
      userdata : System.Address;
      window : access SDL3_SDL_video_h.SDL_Window;
      filters : access constant SDL_DialogFileFilter;
      nfilters : int;
      default_location : Interfaces.C.Strings.chars_ptr;
      allow_many : Extensions.bool)  -- /usr/local/include/SDL3/SDL_dialog.h:166
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShowOpenFileDialog";

  --*
  -- * Displays a dialog that lets the user choose a new or existing file on their
  -- * filesystem.
  -- *
  -- * This is an asynchronous function; it will return immediately, and the
  -- * result will be passed to the callback.
  -- *
  -- * The callback will be invoked with a null-terminated list of files the user
  -- * chose. The list will be empty if the user canceled the dialog, and it will
  -- * be NULL if an error occurred.
  -- *
  -- * Note that the callback may be called from a different thread than the one
  -- * the function was invoked on.
  -- *
  -- * The chosen file may or may not already exist.
  -- *
  -- * On Linux, dialogs may require XDG Portals, which requires DBus, which
  -- * requires an event-handling loop. Apps that do not use SDL to handle events
  -- * should add a call to SDL_PumpEvents in their main loop.
  -- *
  -- * \param callback a function pointer to be invoked when the user selects a
  -- *                 file and accepts, or cancels the dialog, or an error
  -- *                 occurs.
  -- * \param userdata an optional pointer to pass extra data to the callback when
  -- *                 it will be invoked.
  -- * \param window the window that the dialog should be modal for, may be NULL.
  -- *               Not all platforms support this option.
  -- * \param filters a list of filters, may be NULL. Not all platforms support
  -- *                this option, and platforms that do support it may allow the
  -- *                user to ignore the filters. If non-NULL, it must remain
  -- *                valid at least until the callback is invoked.
  -- * \param nfilters the number of filters. Ignored if filters is NULL.
  -- * \param default_location the default folder or file to start the dialog at,
  -- *                         may be NULL. Not all platforms support this option.
  -- *
  -- * \threadsafety This function should be called only from the main thread. The
  -- *               callback may be invoked from the same thread or from a
  -- *               different one, depending on the OS's constraints.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DialogFileCallback
  -- * \sa SDL_DialogFileFilter
  -- * \sa SDL_ShowOpenFileDialog
  -- * \sa SDL_ShowOpenFolderDialog
  -- * \sa SDL_ShowFileDialogWithProperties
  --  

   procedure SDL_ShowSaveFileDialog
     (callback : SDL_DialogFileCallback;
      userdata : System.Address;
      window : access SDL3_SDL_video_h.SDL_Window;
      filters : access constant SDL_DialogFileFilter;
      nfilters : int;
      default_location : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_dialog.h:215
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShowSaveFileDialog";

  --*
  -- * Displays a dialog that lets the user select a folder on their filesystem.
  -- *
  -- * This is an asynchronous function; it will return immediately, and the
  -- * result will be passed to the callback.
  -- *
  -- * The callback will be invoked with a null-terminated list of files the user
  -- * chose. The list will be empty if the user canceled the dialog, and it will
  -- * be NULL if an error occurred.
  -- *
  -- * Note that the callback may be called from a different thread than the one
  -- * the function was invoked on.
  -- *
  -- * Depending on the platform, the user may be allowed to input paths that
  -- * don't yet exist.
  -- *
  -- * On Linux, dialogs may require XDG Portals, which requires DBus, which
  -- * requires an event-handling loop. Apps that do not use SDL to handle events
  -- * should add a call to SDL_PumpEvents in their main loop.
  -- *
  -- * \param callback a function pointer to be invoked when the user selects a
  -- *                 file and accepts, or cancels the dialog, or an error
  -- *                 occurs.
  -- * \param userdata an optional pointer to pass extra data to the callback when
  -- *                 it will be invoked.
  -- * \param window the window that the dialog should be modal for, may be NULL.
  -- *               Not all platforms support this option.
  -- * \param default_location the default folder or file to start the dialog at,
  -- *                         may be NULL. Not all platforms support this option.
  -- * \param allow_many if non-zero, the user will be allowed to select multiple
  -- *                   entries. Not all platforms support this option.
  -- *
  -- * \threadsafety This function should be called only from the main thread. The
  -- *               callback may be invoked from the same thread or from a
  -- *               different one, depending on the OS's constraints.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DialogFileCallback
  -- * \sa SDL_ShowOpenFileDialog
  -- * \sa SDL_ShowSaveFileDialog
  -- * \sa SDL_ShowFileDialogWithProperties
  --  

   procedure SDL_ShowOpenFolderDialog
     (callback : SDL_DialogFileCallback;
      userdata : System.Address;
      window : access SDL3_SDL_video_h.SDL_Window;
      default_location : Interfaces.C.Strings.chars_ptr;
      allow_many : Extensions.bool)  -- /usr/local/include/SDL3/SDL_dialog.h:260
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShowOpenFolderDialog";

  --*
  -- * Various types of file dialogs.
  -- *
  -- * This is used by SDL_ShowFileDialogWithProperties() to decide what kind of
  -- * dialog to present to the user.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ShowFileDialogWithProperties
  --  

   type SDL_FileDialogType is 
     (SDL_FILEDIALOG_OPENFILE,
      SDL_FILEDIALOG_SAVEFILE,
      SDL_FILEDIALOG_OPENFOLDER)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_dialog.h:272

  --*
  -- * Create and launch a file dialog with the specified properties.
  -- *
  -- * These are the supported properties:
  -- *
  -- * - `SDL_PROP_FILE_DIALOG_FILTERS_POINTER`: a pointer to a list of
  -- *   SDL_DialogFileFilter structs, which will be used as filters for
  -- *   file-based selections. Ignored if the dialog is an "Open Folder" dialog.
  -- *   If non-NULL, the array of filters must remain valid at least until the
  -- *   callback is invoked.
  -- * - `SDL_PROP_FILE_DIALOG_NFILTERS_NUMBER`: the number of filters in the
  -- *   array of filters, if it exists.
  -- * - `SDL_PROP_FILE_DIALOG_WINDOW_POINTER`: the window that the dialog should
  -- *   be modal for.
  -- * - `SDL_PROP_FILE_DIALOG_LOCATION_STRING`: the default folder or file to
  -- *   start the dialog at.
  -- * - `SDL_PROP_FILE_DIALOG_MANY_BOOLEAN`: true to allow the user to select
  -- *   more than one entry.
  -- * - `SDL_PROP_FILE_DIALOG_TITLE_STRING`: the title for the dialog.
  -- * - `SDL_PROP_FILE_DIALOG_ACCEPT_STRING`: the label that the accept button
  -- *   should have.
  -- * - `SDL_PROP_FILE_DIALOG_CANCEL_STRING`: the label that the cancel button
  -- *   should have.
  -- *
  -- * Note that each platform may or may not support any of the properties.
  -- *
  -- * \param type the type of file dialog.
  -- * \param callback a function pointer to be invoked when the user selects a
  -- *                 file and accepts, or cancels the dialog, or an error
  -- *                 occurs.
  -- * \param userdata an optional pointer to pass extra data to the callback when
  -- *                 it will be invoked.
  -- * \param props the properties to use.
  -- *
  -- * \threadsafety This function should be called only from the main thread. The
  -- *               callback may be invoked from the same thread or from a
  -- *               different one, depending on the OS's constraints.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_FileDialogType
  -- * \sa SDL_DialogFileCallback
  -- * \sa SDL_DialogFileFilter
  -- * \sa SDL_ShowOpenFileDialog
  -- * \sa SDL_ShowSaveFileDialog
  -- * \sa SDL_ShowOpenFolderDialog
  --  

   procedure SDL_ShowFileDialogWithProperties
     (c_type : SDL_FileDialogType;
      callback : SDL_DialogFileCallback;
      userdata : System.Address;
      props : SDL3_SDL_properties_h.SDL_PropertiesID)  -- /usr/local/include/SDL3/SDL_dialog.h:326
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ShowFileDialogWithProperties";

  -- Ends C function definitions when using C++  
end SDL3_SDL_dialog_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
