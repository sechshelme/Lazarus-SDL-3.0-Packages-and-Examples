pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with System;
limited with SDL3_SDL_surface_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;

package SDL3_SDL_tray_h is

   SDL_TRAYENTRY_BUTTON : constant := 16#00000001#;  --  /usr/local/include/SDL3/SDL_tray.h:80
   SDL_TRAYENTRY_CHECKBOX : constant := 16#00000002#;  --  /usr/local/include/SDL3/SDL_tray.h:81
   SDL_TRAYENTRY_SUBMENU : constant := 16#00000004#;  --  /usr/local/include/SDL3/SDL_tray.h:82
   SDL_TRAYENTRY_DISABLED : constant := 16#80000000#;  --  /usr/local/include/SDL3/SDL_tray.h:83
   SDL_TRAYENTRY_CHECKED : constant := 16#40000000#;  --  /usr/local/include/SDL3/SDL_tray.h:84

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
  -- * # CategoryTray
  -- *
  -- * SDL offers a way to add items to the "system tray" (more correctly called
  -- * the "notification area" on Windows). On platforms that offer this concept,
  -- * an SDL app can add a tray icon, submenus, checkboxes, and clickable
  -- * entries, and register a callback that is fired when the user clicks on
  -- * these pieces.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * An opaque handle representing a toplevel system tray object.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Tray is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing a menu/submenu on a system tray object.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_TrayMenu is null record;   -- incomplete struct

  --*
  -- * An opaque handle representing an entry on a system tray object.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_TrayEntry is null record;   -- incomplete struct

  --*
  -- * Flags that control the creation of system tray entries.
  -- *
  -- * Some of these flags are required; exactly one of them must be specified at
  -- * the time a tray entry is created. Other flags are optional; zero or more of
  -- * those can be OR'ed together with the required flag.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_InsertTrayEntryAt
  --  

   subtype SDL_TrayEntryFlags is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_tray.h:78

  --*
  -- * A callback that is invoked when a tray entry is selected.
  -- *
  -- * \param userdata an optional pointer to pass extra data to the callback when
  -- *                 it will be invoked.
  -- * \param entry the tray entry that was selected.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetTrayEntryCallback
  --  

   type SDL_TrayCallback is access procedure (arg1 : System.Address; arg2 : access SDL_TrayEntry)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_tray.h:97

  --*
  -- * Create an icon to be placed in the operating system's tray, or equivalent.
  -- *
  -- * Many platforms advise not using a system tray unless persistence is a
  -- * necessary feature. Avoid needlessly creating a tray icon, as the user may
  -- * feel like it clutters their interface.
  -- *
  -- * Using tray icons require the video subsystem.
  -- *
  -- * \param icon a surface to be used as icon. May be NULL.
  -- * \param tooltip a tooltip to be displayed when the mouse hovers the icon in
  -- *                UTF-8 encoding. Not supported on all platforms. May be NULL.
  -- * \returns The newly created system tray icon.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTrayMenu
  -- * \sa SDL_GetTrayMenu
  -- * \sa SDL_DestroyTray
  --  

   function SDL_CreateTray (icon : access SDL3_SDL_surface_h.SDL_Surface; tooltip : Interfaces.C.Strings.chars_ptr) return access SDL_Tray  -- /usr/local/include/SDL3/SDL_tray.h:121
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTray";

  --*
  -- * Updates the system tray icon's icon.
  -- *
  -- * \param tray the tray icon to be updated.
  -- * \param icon the new icon. May be NULL.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTray
  --  

   procedure SDL_SetTrayIcon (tray : access SDL_Tray; icon : access SDL3_SDL_surface_h.SDL_Surface)  -- /usr/local/include/SDL3/SDL_tray.h:136
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTrayIcon";

  --*
  -- * Updates the system tray icon's tooltip.
  -- *
  -- * \param tray the tray icon to be updated.
  -- * \param tooltip the new tooltip in UTF-8 encoding. May be NULL.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTray
  --  

   procedure SDL_SetTrayTooltip (tray : access SDL_Tray; tooltip : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_tray.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTrayTooltip";

  --*
  -- * Create a menu for a system tray.
  -- *
  -- * This should be called at most once per tray icon.
  -- *
  -- * This function does the same thing as SDL_CreateTraySubmenu(), except that
  -- * it takes a SDL_Tray instead of a SDL_TrayEntry.
  -- *
  -- * A menu does not need to be destroyed; it will be destroyed with the tray.
  -- *
  -- * \param tray the tray to bind the menu to.
  -- * \returns the newly created menu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTray
  -- * \sa SDL_GetTrayMenu
  -- * \sa SDL_GetTrayMenuParentTray
  --  

   function SDL_CreateTrayMenu (tray : access SDL_Tray) return access SDL_TrayMenu  -- /usr/local/include/SDL3/SDL_tray.h:175
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTrayMenu";

  --*
  -- * Create a submenu for a system tray entry.
  -- *
  -- * This should be called at most once per tray entry.
  -- *
  -- * This function does the same thing as SDL_CreateTrayMenu, except that it
  -- * takes a SDL_TrayEntry instead of a SDL_Tray.
  -- *
  -- * A menu does not need to be destroyed; it will be destroyed with the tray.
  -- *
  -- * \param entry the tray entry to bind the menu to.
  -- * \returns the newly created menu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_GetTraySubmenu
  -- * \sa SDL_GetTrayMenuParentEntry
  --  

   function SDL_CreateTraySubmenu (c_entry : access SDL_TrayEntry) return access SDL_TrayMenu  -- /usr/local/include/SDL3/SDL_tray.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateTraySubmenu";

  --*
  -- * Gets a previously created tray menu.
  -- *
  -- * You should have called SDL_CreateTrayMenu() on the tray object. This
  -- * function allows you to fetch it again later.
  -- *
  -- * This function does the same thing as SDL_GetTraySubmenu(), except that it
  -- * takes a SDL_Tray instead of a SDL_TrayEntry.
  -- *
  -- * A menu does not need to be destroyed; it will be destroyed with the tray.
  -- *
  -- * \param tray the tray entry to bind the menu to.
  -- * \returns the newly created menu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTray
  -- * \sa SDL_CreateTrayMenu
  --  

   function SDL_GetTrayMenu (tray : access SDL_Tray) return access SDL_TrayMenu  -- /usr/local/include/SDL3/SDL_tray.h:223
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayMenu";

  --*
  -- * Gets a previously created tray entry submenu.
  -- *
  -- * You should have called SDL_CreateTraySubmenu() on the entry object. This
  -- * function allows you to fetch it again later.
  -- *
  -- * This function does the same thing as SDL_GetTrayMenu(), except that it
  -- * takes a SDL_TrayEntry instead of a SDL_Tray.
  -- *
  -- * A menu does not need to be destroyed; it will be destroyed with the tray.
  -- *
  -- * \param entry the tray entry to bind the menu to.
  -- * \returns the newly created menu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_CreateTraySubmenu
  --  

   function SDL_GetTraySubmenu (c_entry : access SDL_TrayEntry) return access SDL_TrayMenu  -- /usr/local/include/SDL3/SDL_tray.h:247
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTraySubmenu";

  --*
  -- * Returns a list of entries in the menu, in order.
  -- *
  -- * \param menu The menu to get entries from.
  -- * \param count An optional pointer to obtain the number of entries in the
  -- *              menu.
  -- * \returns a NULL-terminated list of entries within the given menu. The
  -- *          pointer becomes invalid when any function that inserts or deletes
  -- *          entries in the menu is called.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RemoveTrayEntry
  -- * \sa SDL_InsertTrayEntryAt
  --  

   function SDL_GetTrayEntries (menu : access SDL_TrayMenu; count : access int) return System.Address  -- /usr/local/include/SDL3/SDL_tray.h:267
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayEntries";

  --*
  -- * Removes a tray entry.
  -- *
  -- * \param entry The entry to be deleted.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  --  

   procedure SDL_RemoveTrayEntry (c_entry : access SDL_TrayEntry)  -- /usr/local/include/SDL3/SDL_tray.h:282
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RemoveTrayEntry";

  --*
  -- * Insert a tray entry at a given position.
  -- *
  -- * If label is NULL, the entry will be a separator. Many functions won't work
  -- * for an entry that is a separator.
  -- *
  -- * An entry does not need to be destroyed; it will be destroyed with the tray.
  -- *
  -- * \param menu the menu to append the entry to.
  -- * \param pos the desired position for the new entry. Entries at or following
  -- *            this place will be moved. If pos is -1, the entry is appended.
  -- * \param label the text to be displayed on the entry, in UTF-8 encoding, or
  -- *              NULL for a separator.
  -- * \param flags a combination of flags, some of which are mandatory.
  -- * \returns the newly created entry, or NULL if pos is out of bounds.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_TrayEntryFlags
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_RemoveTrayEntry
  -- * \sa SDL_GetTrayEntryParent
  --  

   function SDL_InsertTrayEntryAt
     (menu : access SDL_TrayMenu;
      pos : int;
      label : Interfaces.C.Strings.chars_ptr;
      flags : SDL_TrayEntryFlags) return access SDL_TrayEntry  -- /usr/local/include/SDL3/SDL_tray.h:310
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_InsertTrayEntryAt";

  --*
  -- * Sets the label of an entry.
  -- *
  -- * An entry cannot change between a separator and an ordinary entry; that is,
  -- * it is not possible to set a non-NULL label on an entry that has a NULL
  -- * label (separators), or to set a NULL label to an entry that has a non-NULL
  -- * label. The function will silently fail if that happens.
  -- *
  -- * \param entry the entry to be updated.
  -- * \param label the new label for the entry in UTF-8 encoding.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_GetTrayEntryLabel
  --  

   procedure SDL_SetTrayEntryLabel (c_entry : access SDL_TrayEntry; label : Interfaces.C.Strings.chars_ptr)  -- /usr/local/include/SDL3/SDL_tray.h:332
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTrayEntryLabel";

  --*
  -- * Gets the label of an entry.
  -- *
  -- * If the returned value is NULL, the entry is a separator.
  -- *
  -- * \param entry the entry to be read.
  -- * \returns the label of the entry in UTF-8 encoding.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_SetTrayEntryLabel
  --  

   function SDL_GetTrayEntryLabel (c_entry : access SDL_TrayEntry) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_tray.h:351
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayEntryLabel";

  --*
  -- * Sets whether or not an entry is checked.
  -- *
  -- * The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
  -- *
  -- * \param entry the entry to be updated.
  -- * \param checked true if the entry should be checked; false otherwise.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_GetTrayEntryChecked
  --  

   procedure SDL_SetTrayEntryChecked (c_entry : access SDL_TrayEntry; checked : Extensions.bool)  -- /usr/local/include/SDL3/SDL_tray.h:370
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTrayEntryChecked";

  --*
  -- * Gets whether or not an entry is checked.
  -- *
  -- * The entry must have been created with the SDL_TRAYENTRY_CHECKBOX flag.
  -- *
  -- * \param entry the entry to be read.
  -- * \returns true if the entry is checked; false otherwise.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_SetTrayEntryChecked
  --  

   function SDL_GetTrayEntryChecked (c_entry : access SDL_TrayEntry) return Extensions.bool  -- /usr/local/include/SDL3/SDL_tray.h:389
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayEntryChecked";

  --*
  -- * Sets whether or not an entry is enabled.
  -- *
  -- * \param entry the entry to be updated.
  -- * \param enabled true if the entry should be enabled; false otherwise.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_GetTrayEntryEnabled
  --  

   procedure SDL_SetTrayEntryEnabled (c_entry : access SDL_TrayEntry; enabled : Extensions.bool)  -- /usr/local/include/SDL3/SDL_tray.h:406
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTrayEntryEnabled";

  --*
  -- * Gets whether or not an entry is enabled.
  -- *
  -- * \param entry the entry to be read.
  -- * \returns true if the entry is enabled; false otherwise.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  -- * \sa SDL_SetTrayEntryEnabled
  --  

   function SDL_GetTrayEntryEnabled (c_entry : access SDL_TrayEntry) return Extensions.bool  -- /usr/local/include/SDL3/SDL_tray.h:423
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayEntryEnabled";

  --*
  -- * Sets a callback to be invoked when the entry is selected.
  -- *
  -- * \param entry the entry to be updated.
  -- * \param callback a callback to be invoked when the entry is selected.
  -- * \param userdata an optional pointer to pass extra data to the callback when
  -- *                 it will be invoked.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTrayEntries
  -- * \sa SDL_InsertTrayEntryAt
  --  

   procedure SDL_SetTrayEntryCallback
     (c_entry : access SDL_TrayEntry;
      callback : SDL_TrayCallback;
      userdata : System.Address)  -- /usr/local/include/SDL3/SDL_tray.h:441
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetTrayEntryCallback";

  --*
  -- * Simulate a click on a tray entry.
  -- *
  -- * \param entry The entry to activate.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_ClickTrayEntry (c_entry : access SDL_TrayEntry)  -- /usr/local/include/SDL3/SDL_tray.h:453
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ClickTrayEntry";

  --*
  -- * Destroys a tray object.
  -- *
  -- * This also destroys all associated menus and entries.
  -- *
  -- * \param tray the tray icon to be destroyed.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTray
  --  

   procedure SDL_DestroyTray (tray : access SDL_Tray)  -- /usr/local/include/SDL3/SDL_tray.h:469
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyTray";

  --*
  -- * Gets the menu containing a certain tray entry.
  -- *
  -- * \param entry the entry for which to get the parent menu.
  -- * \returns the parent menu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_InsertTrayEntryAt
  --  

   function SDL_GetTrayEntryParent (c_entry : access SDL_TrayEntry) return access SDL_TrayMenu  -- /usr/local/include/SDL3/SDL_tray.h:484
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayEntryParent";

  --*
  -- * Gets the entry for which the menu is a submenu, if the current menu is a
  -- * submenu.
  -- *
  -- * Either this function or SDL_GetTrayMenuParentTray() will return non-NULL
  -- * for any given menu.
  -- *
  -- * \param menu the menu for which to get the parent entry.
  -- * \returns the parent entry, or NULL if this menu is not a submenu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTraySubmenu
  -- * \sa SDL_GetTrayMenuParentTray
  --  

   function SDL_GetTrayMenuParentEntry (menu : access SDL_TrayMenu) return access SDL_TrayEntry  -- /usr/local/include/SDL3/SDL_tray.h:504
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayMenuParentEntry";

  --*
  -- * Gets the tray for which this menu is the first-level menu, if the current
  -- * menu isn't a submenu.
  -- *
  -- * Either this function or SDL_GetTrayMenuParentEntry() will return non-NULL
  -- * for any given menu.
  -- *
  -- * \param menu the menu for which to get the parent enttrayry.
  -- * \returns the parent tray, or NULL if this menu is a submenu.
  -- *
  -- * \threadsafety This function should be called on the thread that created the
  -- *               tray.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateTrayMenu
  -- * \sa SDL_GetTrayMenuParentEntry
  --  

   function SDL_GetTrayMenuParentTray (menu : access SDL_TrayMenu) return access SDL_Tray  -- /usr/local/include/SDL3/SDL_tray.h:524
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTrayMenuParentTray";

  --*
  -- * Update the trays.
  -- *
  -- * This is called automatically by the event loop and is only needed if you're
  -- * using trays but aren't handling SDL events.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_UpdateTrays  -- /usr/local/include/SDL3/SDL_tray.h:536
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateTrays";

  -- Ends C function definitions when using C++  
end SDL3_SDL_tray_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
