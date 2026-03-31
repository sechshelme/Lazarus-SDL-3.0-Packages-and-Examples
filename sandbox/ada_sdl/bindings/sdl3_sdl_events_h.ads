pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with SDL3_SDL_video_h;
with SDL3_SDL_keyboard_h;
with SDL3_SDL_scancode_h;
with SDL3_SDL_keycode_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with System;
with SDL3_SDL_mouse_h;
with SDL3_SDL_joystick_h;
with SDL3_SDL_power_h;
with SDL3_SDL_audio_h;
with SDL3_SDL_camera_h;
with SDL3_SDL_touch_h;
with SDL3_SDL_pen_h;
with SDL3_SDL_sensor_h;

package SDL3_SDL_events_h is

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
  -- * # CategoryEvents
  -- *
  -- * Event queue management.
  -- *
  -- * It's extremely common--often required--that an app deal with SDL's event
  -- * queue. Almost all useful information about interactions with the real world
  -- * flow through here: the user interacting with the computer and app, hardware
  -- * coming and going, the system changing in some way, etc.
  -- *
  -- * An app generally takes a moment, perhaps at the start of a new frame, to
  -- * examine any events that have occurred since the last time and process or
  -- * ignore them. This is generally done by calling SDL_PollEvent() in a loop
  -- * until it returns false (or, if using the main callbacks, events are
  -- * provided one at a time in calls to SDL_AppEvent() before the next call to
  -- * SDL_AppIterate(); in this scenario, the app does not call SDL_PollEvent()
  -- * at all).
  -- *
  -- * There is other forms of control, too: SDL_PeepEvents() has more
  -- * functionality at the cost of more complexity, and SDL_WaitEvent() can block
  -- * the process until something interesting happens, which might be beneficial
  -- * for certain types of programs on low-power hardware. One may also call
  -- * SDL_AddEventWatch() to set a callback when new events arrive.
  -- *
  -- * The app is free to generate their own events, too: SDL_PushEvent allows the
  -- * app to put events onto the queue for later retrieval; SDL_RegisterEvents
  -- * can guarantee that these events have a type that isn't in use by other
  -- * parts of the system.
  --  

  -- Set up for C function definitions, even when using C++  
  -- General keyboard/mouse/pen state definitions  
  --*
  -- * The types of events that can be delivered.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_EventType is unsigned;
   SDL_EventType_SDL_EVENT_FIRST : constant SDL_EventType := 0;
   SDL_EventType_SDL_EVENT_QUIT : constant SDL_EventType := 256;
   SDL_EventType_SDL_EVENT_TERMINATING : constant SDL_EventType := 257;
   SDL_EventType_SDL_EVENT_LOW_MEMORY : constant SDL_EventType := 258;
   SDL_EventType_SDL_EVENT_WILL_ENTER_BACKGROUND : constant SDL_EventType := 259;
   SDL_EventType_SDL_EVENT_DID_ENTER_BACKGROUND : constant SDL_EventType := 260;
   SDL_EventType_SDL_EVENT_WILL_ENTER_FOREGROUND : constant SDL_EventType := 261;
   SDL_EventType_SDL_EVENT_DID_ENTER_FOREGROUND : constant SDL_EventType := 262;
   SDL_EventType_SDL_EVENT_LOCALE_CHANGED : constant SDL_EventType := 263;
   SDL_EventType_SDL_EVENT_SYSTEM_THEME_CHANGED : constant SDL_EventType := 264;
   SDL_EventType_SDL_EVENT_DISPLAY_ORIENTATION : constant SDL_EventType := 337;
   SDL_EventType_SDL_EVENT_DISPLAY_ADDED : constant SDL_EventType := 338;
   SDL_EventType_SDL_EVENT_DISPLAY_REMOVED : constant SDL_EventType := 339;
   SDL_EventType_SDL_EVENT_DISPLAY_MOVED : constant SDL_EventType := 340;
   SDL_EventType_SDL_EVENT_DISPLAY_DESKTOP_MODE_CHANGED : constant SDL_EventType := 341;
   SDL_EventType_SDL_EVENT_DISPLAY_CURRENT_MODE_CHANGED : constant SDL_EventType := 342;
   SDL_EventType_SDL_EVENT_DISPLAY_CONTENT_SCALE_CHANGED : constant SDL_EventType := 343;
   SDL_EventType_SDL_EVENT_DISPLAY_USABLE_BOUNDS_CHANGED : constant SDL_EventType := 344;
   SDL_EventType_SDL_EVENT_DISPLAY_FIRST : constant SDL_EventType := 337;
   SDL_EventType_SDL_EVENT_DISPLAY_LAST : constant SDL_EventType := 344;
   SDL_EventType_SDL_EVENT_WINDOW_SHOWN : constant SDL_EventType := 514;
   SDL_EventType_SDL_EVENT_WINDOW_HIDDEN : constant SDL_EventType := 515;
   SDL_EventType_SDL_EVENT_WINDOW_EXPOSED : constant SDL_EventType := 516;
   SDL_EventType_SDL_EVENT_WINDOW_MOVED : constant SDL_EventType := 517;
   SDL_EventType_SDL_EVENT_WINDOW_RESIZED : constant SDL_EventType := 518;
   SDL_EventType_SDL_EVENT_WINDOW_PIXEL_SIZE_CHANGED : constant SDL_EventType := 519;
   SDL_EventType_SDL_EVENT_WINDOW_METAL_VIEW_RESIZED : constant SDL_EventType := 520;
   SDL_EventType_SDL_EVENT_WINDOW_MINIMIZED : constant SDL_EventType := 521;
   SDL_EventType_SDL_EVENT_WINDOW_MAXIMIZED : constant SDL_EventType := 522;
   SDL_EventType_SDL_EVENT_WINDOW_RESTORED : constant SDL_EventType := 523;
   SDL_EventType_SDL_EVENT_WINDOW_MOUSE_ENTER : constant SDL_EventType := 524;
   SDL_EventType_SDL_EVENT_WINDOW_MOUSE_LEAVE : constant SDL_EventType := 525;
   SDL_EventType_SDL_EVENT_WINDOW_FOCUS_GAINED : constant SDL_EventType := 526;
   SDL_EventType_SDL_EVENT_WINDOW_FOCUS_LOST : constant SDL_EventType := 527;
   SDL_EventType_SDL_EVENT_WINDOW_CLOSE_REQUESTED : constant SDL_EventType := 528;
   SDL_EventType_SDL_EVENT_WINDOW_HIT_TEST : constant SDL_EventType := 529;
   SDL_EventType_SDL_EVENT_WINDOW_ICCPROF_CHANGED : constant SDL_EventType := 530;
   SDL_EventType_SDL_EVENT_WINDOW_DISPLAY_CHANGED : constant SDL_EventType := 531;
   SDL_EventType_SDL_EVENT_WINDOW_DISPLAY_SCALE_CHANGED : constant SDL_EventType := 532;
   SDL_EventType_SDL_EVENT_WINDOW_SAFE_AREA_CHANGED : constant SDL_EventType := 533;
   SDL_EventType_SDL_EVENT_WINDOW_OCCLUDED : constant SDL_EventType := 534;
   SDL_EventType_SDL_EVENT_WINDOW_ENTER_FULLSCREEN : constant SDL_EventType := 535;
   SDL_EventType_SDL_EVENT_WINDOW_LEAVE_FULLSCREEN : constant SDL_EventType := 536;
   SDL_EventType_SDL_EVENT_WINDOW_DESTROYED : constant SDL_EventType := 537;
   SDL_EventType_SDL_EVENT_WINDOW_HDR_STATE_CHANGED : constant SDL_EventType := 538;
   SDL_EventType_SDL_EVENT_WINDOW_FIRST : constant SDL_EventType := 514;
   SDL_EventType_SDL_EVENT_WINDOW_LAST : constant SDL_EventType := 538;
   SDL_EventType_SDL_EVENT_KEY_DOWN : constant SDL_EventType := 768;
   SDL_EventType_SDL_EVENT_KEY_UP : constant SDL_EventType := 769;
   SDL_EventType_SDL_EVENT_TEXT_EDITING : constant SDL_EventType := 770;
   SDL_EventType_SDL_EVENT_TEXT_INPUT : constant SDL_EventType := 771;
   SDL_EventType_SDL_EVENT_KEYMAP_CHANGED : constant SDL_EventType := 772;
   SDL_EventType_SDL_EVENT_KEYBOARD_ADDED : constant SDL_EventType := 773;
   SDL_EventType_SDL_EVENT_KEYBOARD_REMOVED : constant SDL_EventType := 774;
   SDL_EventType_SDL_EVENT_TEXT_EDITING_CANDIDATES : constant SDL_EventType := 775;
   SDL_EventType_SDL_EVENT_SCREEN_KEYBOARD_SHOWN : constant SDL_EventType := 776;
   SDL_EventType_SDL_EVENT_SCREEN_KEYBOARD_HIDDEN : constant SDL_EventType := 777;
   SDL_EventType_SDL_EVENT_MOUSE_MOTION : constant SDL_EventType := 1024;
   SDL_EventType_SDL_EVENT_MOUSE_BUTTON_DOWN : constant SDL_EventType := 1025;
   SDL_EventType_SDL_EVENT_MOUSE_BUTTON_UP : constant SDL_EventType := 1026;
   SDL_EventType_SDL_EVENT_MOUSE_WHEEL : constant SDL_EventType := 1027;
   SDL_EventType_SDL_EVENT_MOUSE_ADDED : constant SDL_EventType := 1028;
   SDL_EventType_SDL_EVENT_MOUSE_REMOVED : constant SDL_EventType := 1029;
   SDL_EventType_SDL_EVENT_JOYSTICK_AXIS_MOTION : constant SDL_EventType := 1536;
   SDL_EventType_SDL_EVENT_JOYSTICK_BALL_MOTION : constant SDL_EventType := 1537;
   SDL_EventType_SDL_EVENT_JOYSTICK_HAT_MOTION : constant SDL_EventType := 1538;
   SDL_EventType_SDL_EVENT_JOYSTICK_BUTTON_DOWN : constant SDL_EventType := 1539;
   SDL_EventType_SDL_EVENT_JOYSTICK_BUTTON_UP : constant SDL_EventType := 1540;
   SDL_EventType_SDL_EVENT_JOYSTICK_ADDED : constant SDL_EventType := 1541;
   SDL_EventType_SDL_EVENT_JOYSTICK_REMOVED : constant SDL_EventType := 1542;
   SDL_EventType_SDL_EVENT_JOYSTICK_BATTERY_UPDATED : constant SDL_EventType := 1543;
   SDL_EventType_SDL_EVENT_JOYSTICK_UPDATE_COMPLETE : constant SDL_EventType := 1544;
   SDL_EventType_SDL_EVENT_GAMEPAD_AXIS_MOTION : constant SDL_EventType := 1616;
   SDL_EventType_SDL_EVENT_GAMEPAD_BUTTON_DOWN : constant SDL_EventType := 1617;
   SDL_EventType_SDL_EVENT_GAMEPAD_BUTTON_UP : constant SDL_EventType := 1618;
   SDL_EventType_SDL_EVENT_GAMEPAD_ADDED : constant SDL_EventType := 1619;
   SDL_EventType_SDL_EVENT_GAMEPAD_REMOVED : constant SDL_EventType := 1620;
   SDL_EventType_SDL_EVENT_GAMEPAD_REMAPPED : constant SDL_EventType := 1621;
   SDL_EventType_SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN : constant SDL_EventType := 1622;
   SDL_EventType_SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION : constant SDL_EventType := 1623;
   SDL_EventType_SDL_EVENT_GAMEPAD_TOUCHPAD_UP : constant SDL_EventType := 1624;
   SDL_EventType_SDL_EVENT_GAMEPAD_SENSOR_UPDATE : constant SDL_EventType := 1625;
   SDL_EventType_SDL_EVENT_GAMEPAD_UPDATE_COMPLETE : constant SDL_EventType := 1626;
   SDL_EventType_SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED : constant SDL_EventType := 1627;
   SDL_EventType_SDL_EVENT_FINGER_DOWN : constant SDL_EventType := 1792;
   SDL_EventType_SDL_EVENT_FINGER_UP : constant SDL_EventType := 1793;
   SDL_EventType_SDL_EVENT_FINGER_MOTION : constant SDL_EventType := 1794;
   SDL_EventType_SDL_EVENT_FINGER_CANCELED : constant SDL_EventType := 1795;
   SDL_EventType_SDL_EVENT_PINCH_BEGIN : constant SDL_EventType := 1808;
   SDL_EventType_SDL_EVENT_PINCH_UPDATE : constant SDL_EventType := 1809;
   SDL_EventType_SDL_EVENT_PINCH_END : constant SDL_EventType := 1810;
   SDL_EventType_SDL_EVENT_CLIPBOARD_UPDATE : constant SDL_EventType := 2304;
   SDL_EventType_SDL_EVENT_DROP_FILE : constant SDL_EventType := 4096;
   SDL_EventType_SDL_EVENT_DROP_TEXT : constant SDL_EventType := 4097;
   SDL_EventType_SDL_EVENT_DROP_BEGIN : constant SDL_EventType := 4098;
   SDL_EventType_SDL_EVENT_DROP_COMPLETE : constant SDL_EventType := 4099;
   SDL_EventType_SDL_EVENT_DROP_POSITION : constant SDL_EventType := 4100;
   SDL_EventType_SDL_EVENT_AUDIO_DEVICE_ADDED : constant SDL_EventType := 4352;
   SDL_EventType_SDL_EVENT_AUDIO_DEVICE_REMOVED : constant SDL_EventType := 4353;
   SDL_EventType_SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED : constant SDL_EventType := 4354;
   SDL_EventType_SDL_EVENT_SENSOR_UPDATE : constant SDL_EventType := 4608;
   SDL_EventType_SDL_EVENT_PEN_PROXIMITY_IN : constant SDL_EventType := 4864;
   SDL_EventType_SDL_EVENT_PEN_PROXIMITY_OUT : constant SDL_EventType := 4865;
   SDL_EventType_SDL_EVENT_PEN_DOWN : constant SDL_EventType := 4866;
   SDL_EventType_SDL_EVENT_PEN_UP : constant SDL_EventType := 4867;
   SDL_EventType_SDL_EVENT_PEN_BUTTON_DOWN : constant SDL_EventType := 4868;
   SDL_EventType_SDL_EVENT_PEN_BUTTON_UP : constant SDL_EventType := 4869;
   SDL_EventType_SDL_EVENT_PEN_MOTION : constant SDL_EventType := 4870;
   SDL_EventType_SDL_EVENT_PEN_AXIS : constant SDL_EventType := 4871;
   SDL_EventType_SDL_EVENT_CAMERA_DEVICE_ADDED : constant SDL_EventType := 5120;
   SDL_EventType_SDL_EVENT_CAMERA_DEVICE_REMOVED : constant SDL_EventType := 5121;
   SDL_EventType_SDL_EVENT_CAMERA_DEVICE_APPROVED : constant SDL_EventType := 5122;
   SDL_EventType_SDL_EVENT_CAMERA_DEVICE_DENIED : constant SDL_EventType := 5123;
   SDL_EventType_SDL_EVENT_RENDER_TARGETS_RESET : constant SDL_EventType := 8192;
   SDL_EventType_SDL_EVENT_RENDER_DEVICE_RESET : constant SDL_EventType := 8193;
   SDL_EventType_SDL_EVENT_RENDER_DEVICE_LOST : constant SDL_EventType := 8194;
   SDL_EventType_SDL_EVENT_PRIVATE0 : constant SDL_EventType := 16384;
   SDL_EventType_SDL_EVENT_PRIVATE1 : constant SDL_EventType := 16385;
   SDL_EventType_SDL_EVENT_PRIVATE2 : constant SDL_EventType := 16386;
   SDL_EventType_SDL_EVENT_PRIVATE3 : constant SDL_EventType := 16387;
   SDL_EventType_SDL_EVENT_POLL_SENTINEL : constant SDL_EventType := 32512;
   SDL_EventType_SDL_EVENT_USER : constant SDL_EventType := 32768;
   SDL_EventType_SDL_EVENT_LAST : constant SDL_EventType := 65535;
   SDL_EventType_SDL_EVENT_ENUM_PADDING : constant SDL_EventType := 2147483647;  -- /usr/local/include/SDL3/SDL_events.h:84

  --*< Unused (do not remove)  
  -- Application events  
  --*< User-requested quit  
  -- These application events have special meaning on iOS and Android, see README-ios.md and README-android.md for details  
  --*< The application is being terminated by the OS. This event must be handled in a callback set with SDL_AddEventWatch().
  --                                     Called on iOS in applicationWillTerminate()
  --                                     Called on Android in onDestroy()
  --                                 

  --*< The application is low on memory, free memory if possible. This event must be handled in a callback set with SDL_AddEventWatch().
  --                                     Called on iOS in applicationDidReceiveMemoryWarning()
  --                                     Called on Android in onTrimMemory()
  --                                 

  --*< The application is about to enter the background. This event must be handled in a callback set with SDL_AddEventWatch().
  --                                     Called on iOS in applicationWillResignActive()
  --                                     Called on Android in onPause()
  --                                 

  --*< The application did enter the background and may not get CPU for some time. This event must be handled in a callback set with SDL_AddEventWatch().
  --                                     Called on iOS in applicationDidEnterBackground()
  --                                     Called on Android in onPause()
  --                                 

  --*< The application is about to enter the foreground. This event must be handled in a callback set with SDL_AddEventWatch().
  --                                     Called on iOS in applicationWillEnterForeground()
  --                                     Called on Android in onResume()
  --                                 

  --*< The application is now interactive. This event must be handled in a callback set with SDL_AddEventWatch().
  --                                     Called on iOS in applicationDidBecomeActive()
  --                                     Called on Android in onResume()
  --                                 

  --*< The user's locale preferences have changed.  
  --*< The system theme changed  
  -- Display events  
  -- 0x150 was SDL_DISPLAYEVENT, reserve the number for sdl2-compat  
  --*< Display orientation has changed to data1  
  --*< Display has been added to the system  
  --*< Display has been removed from the system  
  --*< Display has changed position  
  --*< Display has changed desktop mode  
  --*< Display has changed current mode  
  --*< Display has changed content scale  
  --*< Display has changed usable bounds  
  -- Window events  
  -- 0x200 was SDL_WINDOWEVENT, reserve the number for sdl2-compat  
  -- 0x201 was SDL_SYSWMEVENT, reserve the number for sdl2-compat  
  --*< Window has been shown  
  --*< Window has been hidden  
  --*< Window has been exposed and should be redrawn, and can be redrawn directly from event watchers for this event.
  --                                             data1 is 1 for live-resize expose events, 0 otherwise.  

  --*< Window has been moved to data1, data2  
  --*< Window has been resized to data1xdata2  
  --*< The pixel size of the window has changed to data1xdata2  
  --*< The pixel size of a Metal view associated with the window has changed  
  --*< Window has been minimized  
  --*< Window has been maximized  
  --*< Window has been restored to normal size and position  
  --*< Window has gained mouse focus  
  --*< Window has lost mouse focus  
  --*< Window has gained keyboard focus  
  --*< Window has lost keyboard focus  
  --*< The window manager requests that the window be closed  
  --*< Window had a hit test that wasn't SDL_HITTEST_NORMAL  
  --*< The ICC profile of the window's display has changed  
  --*< Window has been moved to display data1  
  --*< Window display scale has been changed  
  --*< The window safe area has been changed  
  --*< The window has been occluded  
  --*< The window has entered fullscreen mode  
  --*< The window has left fullscreen mode  
  --*< The window with the associated ID is being or has been destroyed. If this message is being handled
  --                                             in an event watcher, the window handle is still valid and can still be used to retrieve any properties
  --                                             associated with the window. Otherwise, the handle has already been destroyed and all resources
  --                                             associated with it are invalid  

  --*< Window HDR properties have changed  
  -- Keyboard events  
  --*< Key pressed  
  --*< Key released  
  --*< Keyboard text editing (composition)  
  --*< Keyboard text input  
  --*< Keymap changed due to a system event such as an
  --                                            input language or keyboard layout change.  

  --*< A new keyboard has been inserted into the system  
  --*< A keyboard has been removed  
  --*< Keyboard text editing candidates  
  --*< The on-screen keyboard has been shown  
  --*< The on-screen keyboard has been hidden  
  -- Mouse events  
  --*< Mouse moved  
  --*< Mouse button pressed  
  --*< Mouse button released  
  --*< Mouse wheel motion  
  --*< A new mouse has been inserted into the system  
  --*< A mouse has been removed  
  -- Joystick events  
  --*< Joystick axis motion  
  --*< Joystick trackball motion  
  --*< Joystick hat position change  
  --*< Joystick button pressed  
  --*< Joystick button released  
  --*< A new joystick has been inserted into the system  
  --*< An opened joystick has been removed  
  --*< Joystick battery level change  
  --*< Joystick update is complete  
  -- Gamepad events  
  --*< Gamepad axis motion  
  --*< Gamepad button pressed  
  --*< Gamepad button released  
  --*< A new gamepad has been inserted into the system  
  --*< A gamepad has been removed  
  --*< The gamepad mapping was updated  
  --*< Gamepad touchpad was touched  
  --*< Gamepad touchpad finger was moved  
  --*< Gamepad touchpad finger was lifted  
  --*< Gamepad sensor was updated  
  --*< Gamepad update is complete  
  --*< Gamepad Steam handle has changed  
  -- Touch events  
  -- Pinch events  
  --*< Pinch gesture started  
  --*< Pinch gesture updated  
  --*< Pinch gesture ended  
  -- 0x800, 0x801, and 0x802 were the Gesture events from SDL2. Do not reuse these values! sdl2-compat needs them!  
  -- Clipboard events  
  --*< The clipboard changed  
  -- Drag and drop events  
  --*< The system requests a file open  
  --*< text/plain drag-and-drop event  
  --*< A new set of drops is beginning (NULL filename)  
  --*< Current set of drops is now complete (NULL filename)  
  --*< Position while moving over the window  
  -- Audio hotplug events  
  --*< A new audio device is available  
  --*< An audio device has been removed.  
  --*< An audio device's format has been changed by the system.  
  -- Sensor events  
  --*< A sensor was updated  
  -- Pressure-sensitive pen events  
  --*< Pressure-sensitive pen has become available  
  --*< Pressure-sensitive pen has become unavailable  
  --*< Pressure-sensitive pen touched drawing surface  
  --*< Pressure-sensitive pen stopped touching drawing surface  
  --*< Pressure-sensitive pen button pressed  
  --*< Pressure-sensitive pen button released  
  --*< Pressure-sensitive pen is moving on the tablet  
  --*< Pressure-sensitive pen angle/pressure/etc changed  
  -- Camera hotplug events  
  --*< A new camera device is available  
  --*< A camera device has been removed.  
  --*< A camera device has been approved for use by the user.  
  --*< A camera device has been denied for use by the user.  
  -- Render events  
  --*< The render targets have been reset and their contents need to be updated  
  --*< The device has been reset and all textures need to be recreated  
  --*< The device has been lost and can't be recovered.  
  -- Reserved events for private platforms  
  -- Internal events  
  --*< Signals the end of an event poll cycle  
  --* Events SDL_EVENT_USER through SDL_EVENT_LAST are for your use,
  --     *  and should be allocated with SDL_RegisterEvents()
  --      

  --*
  --     *  This last event is only for bounding internal arrays
  --      

  -- This just makes sure the enum is the size of Uint32  
  --*
  -- * Fields shared by every event
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< Event type, shared with all events, Uint32 to cover user events which are not in the SDL_EventType enumeration  
   type SDL_CommonEvent is record
      c_type : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:298
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:299
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:300
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:296

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*
  -- * Display state change event data (event.display.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_DISPLAY_*  
   type SDL_DisplayEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:310
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:311
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:312
      displayID : aliased SDL3_SDL_video_h.SDL_DisplayID;  -- /usr/local/include/SDL3/SDL_events.h:313
      data1 : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:314
      data2 : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:315
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:308

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The associated display  
  --*< event dependent data  
  --*< event dependent data  
  --*
  -- * Window state change event data (event.window.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_WINDOW_*  
   type SDL_WindowEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:325
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:326
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:327
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:328
      data1 : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:329
      data2 : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:330
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:323

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The associated window  
  --*< event dependent data  
  --*< event dependent data  
  --*
  -- * Keyboard device event structure (event.kdevice.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_KEYBOARD_ADDED or SDL_EVENT_KEYBOARD_REMOVED  
   type SDL_KeyboardDeviceEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:340
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:341
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:342
      which : aliased SDL3_SDL_keyboard_h.SDL_KeyboardID;  -- /usr/local/include/SDL3/SDL_events.h:343
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:338

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The keyboard instance id  
  --*
  -- * Keyboard button event structure (event.key.*)
  -- *
  -- * The `key` is the base SDL_Keycode generated by pressing the `scancode`
  -- * using the current keyboard layout, applying any options specified in
  -- * SDL_HINT_KEYCODE_OPTIONS. You can get the SDL_Keycode corresponding to the
  -- * event scancode and modifiers directly from the keyboard layout, bypassing
  -- * SDL_HINT_KEYCODE_OPTIONS, by calling SDL_GetKeyFromScancode().
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetKeyFromScancode
  -- * \sa SDL_HINT_KEYCODE_OPTIONS
  --  

  --*< SDL_EVENT_KEY_DOWN or SDL_EVENT_KEY_UP  
   type SDL_KeyboardEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:362
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:363
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:364
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:365
      which : aliased SDL3_SDL_keyboard_h.SDL_KeyboardID;  -- /usr/local/include/SDL3/SDL_events.h:366
      scancode : aliased SDL3_SDL_scancode_h.SDL_Scancode;  -- /usr/local/include/SDL3/SDL_events.h:367
      key : aliased SDL3_SDL_keycode_h.SDL_Keycode;  -- /usr/local/include/SDL3/SDL_events.h:368
      c_mod : aliased SDL3_SDL_keycode_h.SDL_Keymod;  -- /usr/local/include/SDL3/SDL_events.h:369
      raw : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_events.h:370
      down : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:371
      repeat : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:372
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:360

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with keyboard focus, if any  
  --*< The keyboard instance id, or 0 if unknown or virtual  
  --*< SDL physical key code  
  --*< SDL virtual key code  
  --*< current key modifiers  
  --*< The platform dependent scancode for this event  
  --*< true if the key is pressed  
  --*< true if this is a key repeat  
  --*
  -- * Keyboard text editing event structure (event.edit.*)
  -- *
  -- * The start cursor is the position, in UTF-8 characters, where new typing
  -- * will be inserted into the editing text. The length is the number of UTF-8
  -- * characters that will be replaced by new typing.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_TEXT_EDITING  
   type SDL_TextEditingEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:386
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:387
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:388
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:389
      text : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_events.h:390
      start : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:391
      length : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:392
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:384

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with keyboard focus, if any  
  --*< The editing text  
  --*< The start cursor of selected editing text, or -1 if not set  
  --*< The length of selected editing text, or -1 if not set  
  --*
  -- * Keyboard IME candidates event structure (event.edit_candidates.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_TEXT_EDITING_CANDIDATES  
   type SDL_TextEditingCandidatesEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:402
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:403
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:404
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:405
      candidates : System.Address;  -- /usr/local/include/SDL3/SDL_events.h:406
      num_candidates : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:407
      selected_candidate : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:408
      horizontal : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:409
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:410
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:411
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:412
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:400

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with keyboard focus, if any  
  --*< The list of candidates, or NULL if there are no candidates available  
  --*< The number of strings in `candidates`  
  --*< The index of the selected candidate, or -1 if no candidate is selected  
  --*< true if the list is horizontal, false if it's vertical  
  --*
  -- * Keyboard text input event structure (event.text.*)
  -- *
  -- * This event will never be delivered unless text input is enabled by calling
  -- * SDL_StartTextInput(). Text input is disabled by default!
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_StartTextInput
  -- * \sa SDL_StopTextInput
  --  

  --*< SDL_EVENT_TEXT_INPUT  
   type SDL_TextInputEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:428
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:429
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:430
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:431
      text : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_events.h:432
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:426

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with keyboard focus, if any  
  --*< The input text, UTF-8 encoded  
  --*
  -- * Mouse device event structure (event.mdevice.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_MOUSE_ADDED or SDL_EVENT_MOUSE_REMOVED  
   type SDL_MouseDeviceEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:442
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:443
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:444
      which : aliased SDL3_SDL_mouse_h.SDL_MouseID;  -- /usr/local/include/SDL3/SDL_events.h:445
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:440

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The mouse instance id  
  --*
  -- * Mouse motion event structure (event.motion.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_MOUSE_MOTION  
   type SDL_MouseMotionEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:455
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:456
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:457
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:458
      which : aliased SDL3_SDL_mouse_h.SDL_MouseID;  -- /usr/local/include/SDL3/SDL_events.h:459
      state : aliased SDL3_SDL_mouse_h.SDL_MouseButtonFlags;  -- /usr/local/include/SDL3/SDL_events.h:460
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:461
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:462
      xrel : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:463
      yrel : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:464
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:453

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with mouse focus, if any  
  --*< The mouse instance id in relative mode, SDL_TOUCH_MOUSEID for touch events, or 0  
  --*< The current button state  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*< The relative motion in the X direction  
  --*< The relative motion in the Y direction  
  --*
  -- * Mouse button event structure (event.button.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_MOUSE_BUTTON_DOWN or SDL_EVENT_MOUSE_BUTTON_UP  
   type SDL_MouseButtonEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:474
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:475
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:476
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:477
      which : aliased SDL3_SDL_mouse_h.SDL_MouseID;  -- /usr/local/include/SDL3/SDL_events.h:478
      button : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:479
      down : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:480
      clicks : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:481
      padding : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:482
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:483
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:484
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:472

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with mouse focus, if any  
  --*< The mouse instance id in relative mode, SDL_TOUCH_MOUSEID for touch events, or 0  
  --*< The mouse button index  
  --*< true if the button is pressed  
  --*< 1 for single-click, 2 for double-click, etc.  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*
  -- * Mouse wheel event structure (event.wheel.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_MOUSE_WHEEL  
   type SDL_MouseWheelEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:494
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:495
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:496
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:497
      which : aliased SDL3_SDL_mouse_h.SDL_MouseID;  -- /usr/local/include/SDL3/SDL_events.h:498
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:499
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:500
      direction : aliased SDL3_SDL_mouse_h.SDL_MouseWheelDirection;  -- /usr/local/include/SDL3/SDL_events.h:501
      mouse_x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:502
      mouse_y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:503
      integer_x : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:504
      integer_y : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:505
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:492

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with mouse focus, if any  
  --*< The mouse instance id in relative mode or 0  
  --*< The amount scrolled horizontally, positive to the right and negative to the left  
  --*< The amount scrolled vertically, positive away from the user and negative toward the user  
  --*< Set to one of the SDL_MOUSEWHEEL_* defines. When FLIPPED the values in X and Y will be opposite. Multiply by -1 to change them back  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*< The amount scrolled horizontally, accumulated to whole scroll "ticks" (added in 3.2.12)  
  --*< The amount scrolled vertically, accumulated to whole scroll "ticks" (added in 3.2.12)  
  --*
  -- * Joystick axis motion event structure (event.jaxis.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_JOYSTICK_AXIS_MOTION  
   type SDL_JoyAxisEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:515
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:516
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:517
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:518
      axis : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:519
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:520
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:521
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:522
      value : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_events.h:523
      padding4 : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_events.h:524
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:513

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The joystick axis index  
  --*< The axis value (range: -32768 to 32767)  
  --*
  -- * Joystick trackball motion event structure (event.jball.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_JOYSTICK_BALL_MOTION  
   type SDL_JoyBallEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:534
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:535
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:536
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:537
      ball : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:538
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:539
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:540
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:541
      xrel : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_events.h:542
      yrel : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_events.h:543
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:532

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The joystick trackball index  
  --*< The relative motion in the X direction  
  --*< The relative motion in the Y direction  
  --*
  -- * Joystick hat position change event structure (event.jhat.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_JOYSTICK_HAT_MOTION  
   type SDL_JoyHatEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:553
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:554
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:555
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:556
      hat : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:557
      value : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:558
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:565
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:566
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:551

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The joystick hat index  
  --*< The hat position value.
  --                         *   \sa SDL_HAT_LEFTUP SDL_HAT_UP SDL_HAT_RIGHTUP
  --                         *   \sa SDL_HAT_LEFT SDL_HAT_CENTERED SDL_HAT_RIGHT
  --                         *   \sa SDL_HAT_LEFTDOWN SDL_HAT_DOWN SDL_HAT_RIGHTDOWN
  --                         *
  --                         *   Note that zero means the POV is centered.
  --                          

  --*
  -- * Joystick button event structure (event.jbutton.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_JOYSTICK_BUTTON_DOWN or SDL_EVENT_JOYSTICK_BUTTON_UP  
   type SDL_JoyButtonEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:576
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:577
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:578
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:579
      button : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:580
      down : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:581
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:582
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:583
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:574

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The joystick button index  
  --*< true if the button is pressed  
  --*
  -- * Joystick device event structure (event.jdevice.*)
  -- *
  -- * SDL will send JOYSTICK_ADDED events for devices that are already plugged in
  -- * during SDL_Init.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GamepadDeviceEvent
  --  

  --*< SDL_EVENT_JOYSTICK_ADDED or SDL_EVENT_JOYSTICK_REMOVED or SDL_EVENT_JOYSTICK_UPDATE_COMPLETE  
   type SDL_JoyDeviceEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:598
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:599
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:600
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:601
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:596

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*
  -- * Joystick battery level change event structure (event.jbattery.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_JOYSTICK_BATTERY_UPDATED  
   type SDL_JoyBatteryEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:611
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:612
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:613
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:614
      state : aliased SDL3_SDL_power_h.SDL_PowerState;  -- /usr/local/include/SDL3/SDL_events.h:615
      percent : aliased int;  -- /usr/local/include/SDL3/SDL_events.h:616
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:609

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The joystick battery state  
  --*< The joystick battery percent charge remaining  
  --*
  -- * Gamepad axis motion event structure (event.gaxis.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_GAMEPAD_AXIS_MOTION  
   type SDL_GamepadAxisEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:626
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:627
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:628
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:629
      axis : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:630
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:631
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:632
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:633
      value : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_events.h:634
      padding4 : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_events.h:635
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:624

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The gamepad axis (SDL_GamepadAxis)  
  --*< The axis value (range: -32768 to 32767)  
  --*
  -- * Gamepad button event structure (event.gbutton.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_GAMEPAD_BUTTON_DOWN or SDL_EVENT_GAMEPAD_BUTTON_UP  
   type SDL_GamepadButtonEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:646
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:647
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:648
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:649
      button : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:650
      down : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:651
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:652
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:653
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:644

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The gamepad button (SDL_GamepadButton)  
  --*< true if the button is pressed  
  --*
  -- * Gamepad device event structure (event.gdevice.*)
  -- *
  -- * Joysticks that are supported gamepads receive both an SDL_JoyDeviceEvent
  -- * and an SDL_GamepadDeviceEvent.
  -- *
  -- * SDL will send GAMEPAD_ADDED events for joysticks that are already plugged
  -- * in during SDL_Init() and are recognized as gamepads. It will also send
  -- * events for joysticks that get gamepad mappings at runtime.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_JoyDeviceEvent
  --  

  --*< SDL_EVENT_GAMEPAD_ADDED, SDL_EVENT_GAMEPAD_REMOVED, or SDL_EVENT_GAMEPAD_REMAPPED, SDL_EVENT_GAMEPAD_UPDATE_COMPLETE or SDL_EVENT_GAMEPAD_STEAM_HANDLE_UPDATED  
   type SDL_GamepadDeviceEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:673
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:674
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:675
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:676
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:671

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*
  -- * Gamepad touchpad event structure (event.gtouchpad.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_GAMEPAD_TOUCHPAD_DOWN or SDL_EVENT_GAMEPAD_TOUCHPAD_MOTION or SDL_EVENT_GAMEPAD_TOUCHPAD_UP  
   type SDL_GamepadTouchpadEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:686
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:687
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:688
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:689
      touchpad : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:690
      finger : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:691
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:692
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:693
      pressure : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:694
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:684

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The index of the touchpad  
  --*< The index of the finger on the touchpad  
  --*< Normalized in the range 0...1 with 0 being on the left  
  --*< Normalized in the range 0...1 with 0 being at the top  
  --*< Normalized in the range 0...1  
  --*
  -- * Gamepad sensor event structure (event.gsensor.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_GAMEPAD_SENSOR_UPDATE  
   type anon_array2941 is array (0 .. 2) of aliased float;
   type SDL_GamepadSensorEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:704
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:705
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:706
      which : aliased SDL3_SDL_joystick_h.SDL_JoystickID;  -- /usr/local/include/SDL3/SDL_events.h:707
      sensor : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:708
      data : aliased anon_array2941;  -- /usr/local/include/SDL3/SDL_events.h:709
      sensor_timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:710
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:702

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The joystick instance id  
  --*< The type of the sensor, one of the values of SDL_SensorType  
  --*< Up to 3 values from the sensor, as defined in SDL_sensor.h  
  --*< The timestamp of the sensor reading in nanoseconds, not necessarily synchronized with the system clock  
  --*
  -- * Audio device event structure (event.adevice.*)
  -- *
  -- * Note that SDL will send a SDL_EVENT_AUDIO_DEVICE_ADDED event for every
  -- * device it discovers during initialization. After that, this event will only
  -- * arrive when a device is hotplugged during the program's run.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_AUDIO_DEVICE_ADDED, or SDL_EVENT_AUDIO_DEVICE_REMOVED, or SDL_EVENT_AUDIO_DEVICE_FORMAT_CHANGED  
   type SDL_AudioDeviceEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:724
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:725
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:726
      which : aliased SDL3_SDL_audio_h.SDL_AudioDeviceID;  -- /usr/local/include/SDL3/SDL_events.h:727
      recording : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:728
      padding1 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:729
      padding2 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:730
      padding3 : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:731
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:722

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< SDL_AudioDeviceID for the device being added or removed or changing  
  --*< false if a playback device, true if a recording device.  
  --*
  -- * Camera device event structure (event.cdevice.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_CAMERA_DEVICE_ADDED, SDL_EVENT_CAMERA_DEVICE_REMOVED, SDL_EVENT_CAMERA_DEVICE_APPROVED, SDL_EVENT_CAMERA_DEVICE_DENIED  
   type SDL_CameraDeviceEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:741
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:742
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:743
      which : aliased SDL3_SDL_camera_h.SDL_CameraID;  -- /usr/local/include/SDL3/SDL_events.h:744
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:739

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< SDL_CameraID for the device being added or removed or changing  
  --*
  -- * Renderer event structure (event.render.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_RENDER_TARGETS_RESET, SDL_EVENT_RENDER_DEVICE_RESET, SDL_EVENT_RENDER_DEVICE_LOST  
   type SDL_RenderEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:755
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:756
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:757
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:758
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:753

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window containing the renderer in question.  
  --*
  -- * Touch finger event structure (event.tfinger.*)
  -- *
  -- * Coordinates in this event are normalized. `x` and `y` are normalized to a
  -- * range between 0.0f and 1.0f, relative to the window, so (0,0) is the top
  -- * left and (1,1) is the bottom right. Delta coordinates `dx` and `dy` are
  -- * normalized in the ranges of -1.0f (traversed all the way from the bottom or
  -- * right to all the way up or left) to 1.0f (traversed all the way from the
  -- * top or left to all the way down or right).
  -- *
  -- * Note that while the coordinates are _normalized_, they are not _clamped_,
  -- * which means in some circumstances you can get a value outside of this
  -- * range. For example, a renderer using logical presentation might give a
  -- * negative value when the touch is in the letterboxing. Some platforms might
  -- * report a touch outside of the window, which will also be outside of the
  -- * range.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_FINGER_DOWN, SDL_EVENT_FINGER_UP, SDL_EVENT_FINGER_MOTION, or SDL_EVENT_FINGER_CANCELED  
   type SDL_TouchFingerEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:783
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:784
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:785
      touchID : aliased SDL3_SDL_touch_h.SDL_TouchID;  -- /usr/local/include/SDL3/SDL_events.h:786
      fingerID : aliased SDL3_SDL_touch_h.SDL_FingerID;  -- /usr/local/include/SDL3/SDL_events.h:787
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:788
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:789
      dx : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:790
      dy : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:791
      pressure : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:792
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:793
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:781

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The touch device id  
  --*< Normalized in the range 0...1  
  --*< Normalized in the range 0...1  
  --*< Normalized in the range -1...1  
  --*< Normalized in the range -1...1  
  --*< Normalized in the range 0...1  
  --*< The window underneath the finger, if any  
  --*
  -- * Pinch event structure (event.pinch.*)
  --  

  --*< ::SDL_EVENT_PINCH_BEGIN or ::SDL_EVENT_PINCH_UPDATE or ::SDL_EVENT_PINCH_END  
   type SDL_PinchFingerEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:801
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:802
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:803
      scale : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:804
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:805
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:799

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The scale change since the last SDL_EVENT_PINCH_UPDATE. Scale < 1 is "zoom out". Scale > 1 is "zoom in".  
  --*< The window underneath the finger, if any  
  --*
  -- * Pressure-sensitive pen proximity event structure (event.pproximity.*)
  -- *
  -- * When a pen becomes visible to the system (it is close enough to a tablet,
  -- * etc), SDL will send an SDL_EVENT_PEN_PROXIMITY_IN event with the new pen's
  -- * ID. This ID is valid until the pen leaves proximity again (has been removed
  -- * from the tablet's area, the tablet has been unplugged, etc). If the same
  -- * pen reenters proximity again, it will be given a new ID.
  -- *
  -- * Note that "proximity" means "close enough for the tablet to know the tool
  -- * is there." The pen touching and lifting off from the tablet while not
  -- * leaving the area are handled by SDL_EVENT_PEN_DOWN and SDL_EVENT_PEN_UP.
  -- *
  -- * Not all platforms have a window associated with the pen during proximity
  -- * events. Some wait until motion/button/etc events to offer this info.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_PEN_PROXIMITY_IN or SDL_EVENT_PEN_PROXIMITY_OUT  
   type SDL_PenProximityEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:828
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:829
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:830
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:831
      which : aliased SDL3_SDL_pen_h.SDL_PenID;  -- /usr/local/include/SDL3/SDL_events.h:832
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:826

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with pen focus, if any  
  --*< The pen instance id  
  --*
  -- * Pressure-sensitive pen motion event structure (event.pmotion.*)
  -- *
  -- * Depending on the hardware, you may get motion events when the pen is not
  -- * touching a tablet, for tracking a pen even when it isn't drawing. You
  -- * should listen for SDL_EVENT_PEN_DOWN and SDL_EVENT_PEN_UP events, or check
  -- * `pen_state & SDL_PEN_INPUT_DOWN` to decide if a pen is "drawing" when
  -- * dealing with pen motion.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_PEN_MOTION  
   type SDL_PenMotionEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:848
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:849
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:850
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:851
      which : aliased SDL3_SDL_pen_h.SDL_PenID;  -- /usr/local/include/SDL3/SDL_events.h:852
      pen_state : aliased SDL3_SDL_pen_h.SDL_PenInputFlags;  -- /usr/local/include/SDL3/SDL_events.h:853
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:854
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:855
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:846

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with pen focus, if any  
  --*< The pen instance id  
  --*< Complete pen input state at time of event  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*
  -- * Pressure-sensitive pen touched event structure (event.ptouch.*)
  -- *
  -- * These events come when a pen touches a surface (a tablet, etc), or lifts
  -- * off from one.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_PEN_DOWN or SDL_EVENT_PEN_UP  
   type SDL_PenTouchEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:868
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:869
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:870
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:871
      which : aliased SDL3_SDL_pen_h.SDL_PenID;  -- /usr/local/include/SDL3/SDL_events.h:872
      pen_state : aliased SDL3_SDL_pen_h.SDL_PenInputFlags;  -- /usr/local/include/SDL3/SDL_events.h:873
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:874
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:875
      eraser : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:876
      down : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:877
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:866

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with pen focus, if any  
  --*< The pen instance id  
  --*< Complete pen input state at time of event  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*< true if eraser end is used (not all pens support this).  
  --*< true if the pen is touching or false if the pen is lifted off  
  --*
  -- * Pressure-sensitive pen button event structure (event.pbutton.*)
  -- *
  -- * This is for buttons on the pen itself that the user might click. The pen
  -- * itself pressing down to draw triggers a SDL_EVENT_PEN_DOWN event instead.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_PEN_BUTTON_DOWN or SDL_EVENT_PEN_BUTTON_UP  
   type SDL_PenButtonEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:890
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:891
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:892
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:893
      which : aliased SDL3_SDL_pen_h.SDL_PenID;  -- /usr/local/include/SDL3/SDL_events.h:894
      pen_state : aliased SDL3_SDL_pen_h.SDL_PenInputFlags;  -- /usr/local/include/SDL3/SDL_events.h:895
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:896
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:897
      button : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_events.h:898
      down : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:899
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:888

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with mouse focus, if any  
  --*< The pen instance id  
  --*< Complete pen input state at time of event  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*< The pen button index (first button is 1).  
  --*< true if the button is pressed  
  --*
  -- * Pressure-sensitive pen pressure / angle event structure (event.paxis.*)
  -- *
  -- * You might get some of these events even if the pen isn't touching the
  -- * tablet.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_PEN_AXIS  
   type SDL_PenAxisEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:912
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:913
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:914
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:915
      which : aliased SDL3_SDL_pen_h.SDL_PenID;  -- /usr/local/include/SDL3/SDL_events.h:916
      pen_state : aliased SDL3_SDL_pen_h.SDL_PenInputFlags;  -- /usr/local/include/SDL3/SDL_events.h:917
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:918
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:919
      axis : aliased SDL3_SDL_pen_h.SDL_PenAxis;  -- /usr/local/include/SDL3/SDL_events.h:920
      value : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:921
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:910

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window with pen focus, if any  
  --*< The pen instance id  
  --*< Complete pen input state at time of event  
  --*< X coordinate, relative to window  
  --*< Y coordinate, relative to window  
  --*< Axis that has changed  
  --*< New value of axis  
  --*
  -- * An event used to drop text or request a file open by the system
  -- * (event.drop.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_DROP_BEGIN or SDL_EVENT_DROP_FILE or SDL_EVENT_DROP_TEXT or SDL_EVENT_DROP_COMPLETE or SDL_EVENT_DROP_POSITION  
   type SDL_DropEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:932
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:933
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:934
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:935
      x : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:936
      y : aliased float;  -- /usr/local/include/SDL3/SDL_events.h:937
      source : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_events.h:938
      data : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_events.h:939
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:930

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The window that was dropped on, if any  
  --*< X coordinate, relative to window (not on begin)  
  --*< Y coordinate, relative to window (not on begin)  
  --*< The source app that sent this drop event, or NULL if that isn't available  
  --*< The text for SDL_EVENT_DROP_TEXT and the file name for SDL_EVENT_DROP_FILE, NULL for other events  
  --*
  -- * An event triggered when the clipboard contents have changed
  -- * (event.clipboard.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_CLIPBOARD_UPDATE  
   type SDL_ClipboardEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:950
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:951
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:952
      owner : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_events.h:953
      num_mime_types : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:954
      mime_types : System.Address;  -- /usr/local/include/SDL3/SDL_events.h:955
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:948

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< are we owning the clipboard (internal update)  
  --*< number of mime types  
  --*< current mime types  
  --*
  -- * Sensor event structure (event.sensor.*)
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_SENSOR_UPDATE  
   type anon_array2969 is array (0 .. 5) of aliased float;
   type SDL_SensorEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:965
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:966
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:967
      which : aliased SDL3_SDL_sensor_h.SDL_SensorID;  -- /usr/local/include/SDL3/SDL_events.h:968
      data : aliased anon_array2969;  -- /usr/local/include/SDL3/SDL_events.h:969
      sensor_timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:970
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:963

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The instance ID of the sensor  
  --*< Up to 6 values from the sensor - additional values can be queried using SDL_GetSensorData()  
  --*< The timestamp of the sensor reading in nanoseconds, not necessarily synchronized with the system clock  
  --*
  -- * The "quit requested" event
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_QUIT  
   type SDL_QuitEvent is record
      c_type : aliased SDL_EventType;  -- /usr/local/include/SDL3/SDL_events.h:980
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:981
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:982
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:978

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*
  -- * A user-defined event type (event.user.*)
  -- *
  -- * This event is unique; it is never created by SDL, but only by the
  -- * application. The event can be pushed onto the event queue using
  -- * SDL_PushEvent(). The contents of the structure members are completely up to
  -- * the programmer; the only requirement is that '''type''' is a value obtained
  -- * from SDL_RegisterEvents().
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< SDL_EVENT_USER through SDL_EVENT_LAST, Uint32 because these are not in the SDL_EventType enumeration  
   type SDL_UserEvent is record
      c_type : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:998
      reserved : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:999
      timestamp : aliased SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_events.h:1000
      windowID : aliased SDL3_SDL_video_h.SDL_WindowID;  -- /usr/local/include/SDL3/SDL_events.h:1001
      code : aliased SDL3_SDL_stdinc_h.Sint32;  -- /usr/local/include/SDL3/SDL_events.h:1002
      data1 : System.Address;  -- /usr/local/include/SDL3/SDL_events.h:1003
      data2 : System.Address;  -- /usr/local/include/SDL3/SDL_events.h:1004
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_events.h:996

  --*< In nanoseconds, populated using SDL_GetTicksNS()  
  --*< The associated window if any  
  --*< User defined event code  
  --*< User defined data pointer  
  --*< User defined data pointer  
  --*
  -- * The structure for all events in SDL.
  -- *
  -- * The SDL_Event structure is the core of all event handling in SDL. SDL_Event
  -- * is a union of all event structures used in SDL.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< Event type, shared with all events, Uint32 to cover user events which are not in the SDL_EventType enumeration  
   type anon_array2977 is array (0 .. 127) of aliased SDL3_SDL_stdinc_h.Uint8;
   type SDL_Event (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_events.h:1018
         when 1 =>
            common : aliased SDL_CommonEvent;  -- /usr/local/include/SDL3/SDL_events.h:1019
         when 2 =>
            display : aliased SDL_DisplayEvent;  -- /usr/local/include/SDL3/SDL_events.h:1020
         when 3 =>
            window : aliased SDL_WindowEvent;  -- /usr/local/include/SDL3/SDL_events.h:1021
         when 4 =>
            kdevice : aliased SDL_KeyboardDeviceEvent;  -- /usr/local/include/SDL3/SDL_events.h:1022
         when 5 =>
            key : aliased SDL_KeyboardEvent;  -- /usr/local/include/SDL3/SDL_events.h:1023
         when 6 =>
            edit : aliased SDL_TextEditingEvent;  -- /usr/local/include/SDL3/SDL_events.h:1024
         when 7 =>
            edit_candidates : aliased SDL_TextEditingCandidatesEvent;  -- /usr/local/include/SDL3/SDL_events.h:1025
         when 8 =>
            text : aliased SDL_TextInputEvent;  -- /usr/local/include/SDL3/SDL_events.h:1026
         when 9 =>
            mdevice : aliased SDL_MouseDeviceEvent;  -- /usr/local/include/SDL3/SDL_events.h:1027
         when 10 =>
            motion : aliased SDL_MouseMotionEvent;  -- /usr/local/include/SDL3/SDL_events.h:1028
         when 11 =>
            button : aliased SDL_MouseButtonEvent;  -- /usr/local/include/SDL3/SDL_events.h:1029
         when 12 =>
            wheel : aliased SDL_MouseWheelEvent;  -- /usr/local/include/SDL3/SDL_events.h:1030
         when 13 =>
            jdevice : aliased SDL_JoyDeviceEvent;  -- /usr/local/include/SDL3/SDL_events.h:1031
         when 14 =>
            jaxis : aliased SDL_JoyAxisEvent;  -- /usr/local/include/SDL3/SDL_events.h:1032
         when 15 =>
            jball : aliased SDL_JoyBallEvent;  -- /usr/local/include/SDL3/SDL_events.h:1033
         when 16 =>
            jhat : aliased SDL_JoyHatEvent;  -- /usr/local/include/SDL3/SDL_events.h:1034
         when 17 =>
            jbutton : aliased SDL_JoyButtonEvent;  -- /usr/local/include/SDL3/SDL_events.h:1035
         when 18 =>
            jbattery : aliased SDL_JoyBatteryEvent;  -- /usr/local/include/SDL3/SDL_events.h:1036
         when 19 =>
            gdevice : aliased SDL_GamepadDeviceEvent;  -- /usr/local/include/SDL3/SDL_events.h:1037
         when 20 =>
            gaxis : aliased SDL_GamepadAxisEvent;  -- /usr/local/include/SDL3/SDL_events.h:1038
         when 21 =>
            gbutton : aliased SDL_GamepadButtonEvent;  -- /usr/local/include/SDL3/SDL_events.h:1039
         when 22 =>
            gtouchpad : aliased SDL_GamepadTouchpadEvent;  -- /usr/local/include/SDL3/SDL_events.h:1040
         when 23 =>
            gsensor : aliased SDL_GamepadSensorEvent;  -- /usr/local/include/SDL3/SDL_events.h:1041
         when 24 =>
            adevice : aliased SDL_AudioDeviceEvent;  -- /usr/local/include/SDL3/SDL_events.h:1042
         when 25 =>
            cdevice : aliased SDL_CameraDeviceEvent;  -- /usr/local/include/SDL3/SDL_events.h:1043
         when 26 =>
            sensor : aliased SDL_SensorEvent;  -- /usr/local/include/SDL3/SDL_events.h:1044
         when 27 =>
            quit : aliased SDL_QuitEvent;  -- /usr/local/include/SDL3/SDL_events.h:1045
         when 28 =>
            user : aliased SDL_UserEvent;  -- /usr/local/include/SDL3/SDL_events.h:1046
         when 29 =>
            tfinger : aliased SDL_TouchFingerEvent;  -- /usr/local/include/SDL3/SDL_events.h:1047
         when 30 =>
            pinch : aliased SDL_PinchFingerEvent;  -- /usr/local/include/SDL3/SDL_events.h:1048
         when 31 =>
            pproximity : aliased SDL_PenProximityEvent;  -- /usr/local/include/SDL3/SDL_events.h:1049
         when 32 =>
            ptouch : aliased SDL_PenTouchEvent;  -- /usr/local/include/SDL3/SDL_events.h:1050
         when 33 =>
            pmotion : aliased SDL_PenMotionEvent;  -- /usr/local/include/SDL3/SDL_events.h:1051
         when 34 =>
            pbutton : aliased SDL_PenButtonEvent;  -- /usr/local/include/SDL3/SDL_events.h:1052
         when 35 =>
            paxis : aliased SDL_PenAxisEvent;  -- /usr/local/include/SDL3/SDL_events.h:1053
         when 36 =>
            render : aliased SDL_RenderEvent;  -- /usr/local/include/SDL3/SDL_events.h:1054
         when 37 =>
            drop : aliased SDL_DropEvent;  -- /usr/local/include/SDL3/SDL_events.h:1055
         when 38 =>
            clipboard : aliased SDL_ClipboardEvent;  -- /usr/local/include/SDL3/SDL_events.h:1056
         when others =>
            padding : aliased anon_array2977;  -- /usr/local/include/SDL3/SDL_events.h:1071
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/local/include/SDL3/SDL_events.h:1016

  --*< Common event data  
  --*< Display event data  
  --*< Window event data  
  --*< Keyboard device change event data  
  --*< Keyboard event data  
  --*< Text editing event data  
  --*< Text editing candidates event data  
  --*< Text input event data  
  --*< Mouse device change event data  
  --*< Mouse motion event data  
  --*< Mouse button event data  
  --*< Mouse wheel event data  
  --*< Joystick device change event data  
  --*< Joystick axis event data  
  --*< Joystick ball event data  
  --*< Joystick hat event data  
  --*< Joystick button event data  
  --*< Joystick battery event data  
  --*< Gamepad device event data  
  --*< Gamepad axis event data  
  --*< Gamepad button event data  
  --*< Gamepad touchpad event data  
  --*< Gamepad sensor event data  
  --*< Audio device event data  
  --*< Camera device event data  
  --*< Sensor event data  
  --*< Quit request event data  
  --*< Custom event data  
  --*< Touch finger event data  
  --*< Pinch event data  
  --*< Pen proximity event data  
  --*< Pen tip touching event data  
  --*< Pen motion event data  
  --*< Pen button event data  
  --*< Pen axis event data  
  --*< Render event data  
  --*< Drag and drop event data  
  --*< Clipboard event data  
  -- This is necessary for ABI compatibility between Visual C++ and GCC.
  --       Visual C++ will respect the push pack pragma and use 52 bytes (size of
  --       SDL_TextEditingEvent, the largest structure for 32-bit and 64-bit
  --       architectures) for this union, and GCC will use the alignment of the
  --       largest datatype within the union, which is 8 bytes on 64-bit
  --       architectures.
  --       So... we'll add padding to force the size to be the same for both.
  --       On architectures where pointers are 16 bytes, this needs rounding up to
  --       the next multiple of 16, 64, and on architectures where pointers are
  --       even larger the size of SDL_UserEvent will dominate as being 3 pointers.
  --     

  -- Make sure we haven't broken binary compatibility  
  -- Function prototypes  
  --*
  -- * Pump the event loop, gathering events from the input devices.
  -- *
  -- * This function updates the event queue and internal input device state.
  -- *
  -- * SDL_PumpEvents() gathers all the pending input information from devices and
  -- * places it in the event queue. Without calls to SDL_PumpEvents() no events
  -- * would ever be placed on the queue. Often the need for calls to
  -- * SDL_PumpEvents() is hidden from the user since SDL_PollEvent() and
  -- * SDL_WaitEvent() implicitly call SDL_PumpEvents(). However, if you are not
  -- * polling or waiting for events (e.g. you are filtering them), then you must
  -- * call SDL_PumpEvents() to force an event queue update.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PollEvent
  -- * \sa SDL_WaitEvent
  --  

   procedure SDL_PumpEvents  -- /usr/local/include/SDL3/SDL_events.h:1100
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PumpEvents";

  -- @{  
  --*
  -- * The type of action to request from SDL_PeepEvents().
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_EventAction is 
     (SDL_ADDEVENT,
      SDL_PEEKEVENT,
      SDL_GETEVENT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_events.h:1109

  --*< Add events to the back of the queue.  
  --*< Check but don't remove events from the queue front.  
  --*< Retrieve/remove events from the front of the queue.  
  --*
  -- * Check the event queue for messages and optionally return them.
  -- *
  -- * `action` may be any of the following:
  -- *
  -- * - `SDL_ADDEVENT`: up to `numevents` events will be added to the back of the
  -- *   event queue.
  -- * - `SDL_PEEKEVENT`: `numevents` events at the front of the event queue,
  -- *   within the specified minimum and maximum type, will be returned to the
  -- *   caller and will _not_ be removed from the queue. If you pass NULL for
  -- *   `events`, then `numevents` is ignored and the total number of matching
  -- *   events will be returned.
  -- * - `SDL_GETEVENT`: up to `numevents` events at the front of the event queue,
  -- *   within the specified minimum and maximum type, will be returned to the
  -- *   caller and will be removed from the queue.
  -- *
  -- * You may have to call SDL_PumpEvents() before calling this function.
  -- * Otherwise, the events may not be ready to be filtered when you call
  -- * SDL_PeepEvents().
  -- *
  -- * \param events destination buffer for the retrieved events, may be NULL to
  -- *               leave the events in the queue and return the number of events
  -- *               that would have been stored.
  -- * \param numevents if action is SDL_ADDEVENT, the number of events to add
  -- *                  back to the event queue; if action is SDL_PEEKEVENT or
  -- *                  SDL_GETEVENT, the maximum number of events to retrieve.
  -- * \param action action to take; see [Remarks](#remarks) for details.
  -- * \param minType minimum value of the event type to be considered;
  -- *                SDL_EVENT_FIRST is a safe choice.
  -- * \param maxType maximum value of the event type to be considered;
  -- *                SDL_EVENT_LAST is a safe choice.
  -- * \returns the number of events actually stored or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PollEvent
  -- * \sa SDL_PumpEvents
  -- * \sa SDL_PushEvent
  --  

   function SDL_PeepEvents
     (events : access SDL_Event;
      numevents : int;
      action : SDL_EventAction;
      minType : SDL3_SDL_stdinc_h.Uint32;
      maxType : SDL3_SDL_stdinc_h.Uint32) return int  -- /usr/local/include/SDL3/SDL_events.h:1158
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PeepEvents";

  -- @}  
  --*
  -- * Check for the existence of a certain event type in the event queue.
  -- *
  -- * If you need to check for a range of event types, use SDL_HasEvents()
  -- * instead.
  -- *
  -- * \param type the type of event to be queried; see SDL_EventType for details.
  -- * \returns true if events matching `type` are present, or false if events
  -- *          matching `type` are not present.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasEvents
  --  

   function SDL_HasEvent (c_type : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1177
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasEvent";

  --*
  -- * Check for the existence of certain event types in the event queue.
  -- *
  -- * If you need to check for a single event type, use SDL_HasEvent() instead.
  -- *
  -- * \param minType the low end of event type to be queried, inclusive; see
  -- *                SDL_EventType for details.
  -- * \param maxType the high end of event type to be queried, inclusive; see
  -- *                SDL_EventType for details.
  -- * \returns true if events with type >= `minType` and <= `maxType` are
  -- *          present, or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasEvents
  --  

   function SDL_HasEvents (minType : SDL3_SDL_stdinc_h.Uint32; maxType : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1198
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasEvents";

  --*
  -- * Clear events of a specific type from the event queue.
  -- *
  -- * This will unconditionally remove any events from the queue that match
  -- * `type`. If you need to remove a range of event types, use SDL_FlushEvents()
  -- * instead.
  -- *
  -- * It's also normal to just ignore events you don't care about in your event
  -- * loop without calling this function.
  -- *
  -- * This function only affects currently queued events. If you want to make
  -- * sure that all pending OS events are flushed, you can call SDL_PumpEvents()
  -- * on the main thread immediately before the flush call.
  -- *
  -- * If you have user events with custom data that needs to be freed, you should
  -- * use SDL_PeepEvents() to remove and clean up those events before calling
  -- * this function.
  -- *
  -- * \param type the type of event to be cleared; see SDL_EventType for details.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_FlushEvents
  --  

   procedure SDL_FlushEvent (c_type : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_events.h:1226
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FlushEvent";

  --*
  -- * Clear events of a range of types from the event queue.
  -- *
  -- * This will unconditionally remove any events from the queue that are in the
  -- * range of `minType` to `maxType`, inclusive. If you need to remove a single
  -- * event type, use SDL_FlushEvent() instead.
  -- *
  -- * It's also normal to just ignore events you don't care about in your event
  -- * loop without calling this function.
  -- *
  -- * This function only affects currently queued events. If you want to make
  -- * sure that all pending OS events are flushed, you can call SDL_PumpEvents()
  -- * on the main thread immediately before the flush call.
  -- *
  -- * \param minType the low end of event type to be cleared, inclusive; see
  -- *                SDL_EventType for details.
  -- * \param maxType the high end of event type to be cleared, inclusive; see
  -- *                SDL_EventType for details.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_FlushEvent
  --  

   procedure SDL_FlushEvents (minType : SDL3_SDL_stdinc_h.Uint32; maxType : SDL3_SDL_stdinc_h.Uint32)  -- /usr/local/include/SDL3/SDL_events.h:1253
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FlushEvents";

  --*
  -- * Poll for currently pending events.
  -- *
  -- * If `event` is not NULL, the next event is removed from the queue and stored
  -- * in the SDL_Event structure pointed to by `event`. The 1 returned refers to
  -- * this event, immediately stored in the SDL Event structure -- not an event
  -- * to follow.
  -- *
  -- * If `event` is NULL, it simply returns 1 if there is an event in the queue,
  -- * but will not remove it from the queue.
  -- *
  -- * As this function may implicitly call SDL_PumpEvents(), you can only call
  -- * this function in the thread that set the video mode.
  -- *
  -- * SDL_PollEvent() is the favored way of receiving system events since it can
  -- * be done from the main loop and does not suspend the main loop while waiting
  -- * on an event to be posted.
  -- *
  -- * The common practice is to fully process the event queue once every frame,
  -- * usually as a first step before updating the game's state:
  -- *
  -- * ```c
  -- * while (game_is_still_running) {
  -- *     SDL_Event event;
  -- *     while (SDL_PollEvent(&event)) {  // poll until all events are handled!
  -- *         // decide what to do with this event.
  -- *     }
  -- *
  -- *     // update game state, draw the current frame
  -- * }
  -- * ```
  -- *
  -- * Note that Windows (and possibly other platforms) has a quirk about how it
  -- * handles events while dragging/resizing a window, which can cause this
  -- * function to block for significant amounts of time. Technical explanations
  -- * and solutions are discussed on the wiki:
  -- *
  -- * https://wiki.libsdl.org/SDL3/AppFreezeDuringDrag
  -- *
  -- * \param event the SDL_Event structure to be filled with the next event from
  -- *              the queue, or NULL.
  -- * \returns true if this got an event or false if there are none available.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PushEvent
  -- * \sa SDL_WaitEvent
  -- * \sa SDL_WaitEventTimeout
  --  

   function SDL_PollEvent (event : access SDL_Event) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1306
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PollEvent";

  --*
  -- * Wait indefinitely for the next available event.
  -- *
  -- * If `event` is not NULL, the next event is removed from the queue and stored
  -- * in the SDL_Event structure pointed to by `event`.
  -- *
  -- * As this function may implicitly call SDL_PumpEvents(), you can only call
  -- * this function in the thread that initialized the video subsystem.
  -- *
  -- * \param event the SDL_Event structure to be filled in with the next event
  -- *              from the queue, or NULL.
  -- * \returns true on success or false if there was an error while waiting for
  -- *          events; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PollEvent
  -- * \sa SDL_PushEvent
  -- * \sa SDL_WaitEventTimeout
  --  

   function SDL_WaitEvent (event : access SDL_Event) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1330
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitEvent";

  --*
  -- * Wait until the specified timeout (in milliseconds) for the next available
  -- * event.
  -- *
  -- * If `event` is not NULL, the next event is removed from the queue and stored
  -- * in the SDL_Event structure pointed to by `event`.
  -- *
  -- * As this function may implicitly call SDL_PumpEvents(), you can only call
  -- * this function in the thread that initialized the video subsystem.
  -- *
  -- * The timeout is not guaranteed, the actual wait time could be longer due to
  -- * system scheduling.
  -- *
  -- * \param event the SDL_Event structure to be filled in with the next event
  -- *              from the queue, or NULL.
  -- * \param timeoutMS the maximum number of milliseconds to wait for the next
  -- *                  available event.
  -- * \returns true if this got an event or false if the timeout elapsed without
  -- *          any events available.
  -- *
  -- * \threadsafety This function should only be called on the main thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PollEvent
  -- * \sa SDL_PushEvent
  -- * \sa SDL_WaitEvent
  --  

   function SDL_WaitEventTimeout (event : access SDL_Event; timeoutMS : SDL3_SDL_stdinc_h.Sint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1360
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_WaitEventTimeout";

  --*
  -- * Add an event to the event queue.
  -- *
  -- * The event queue can actually be used as a two way communication channel.
  -- * Not only can events be read from the queue, but the user can also push
  -- * their own events onto it. `event` is a pointer to the event structure you
  -- * wish to push onto the queue. The event is copied into the queue, and the
  -- * caller may dispose of the memory pointed to after SDL_PushEvent() returns.
  -- *
  -- * Note: Pushing device input events onto the queue doesn't modify the state
  -- * of the device within SDL.
  -- *
  -- * Note: Events pushed onto the queue with SDL_PushEvent() get passed through
  -- * the event filter but events added with SDL_PeepEvents() do not.
  -- *
  -- * For pushing application-specific events, please use SDL_RegisterEvents() to
  -- * get an event type that does not conflict with other code that also wants
  -- * its own custom event types.
  -- *
  -- * \param event the SDL_Event to be added to the queue.
  -- * \returns true on success, false if the event was filtered or on failure;
  -- *          call SDL_GetError() for more information. A common reason for
  -- *          error is the event queue being full.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PeepEvents
  -- * \sa SDL_PollEvent
  -- * \sa SDL_RegisterEvents
  --  

   function SDL_PushEvent (event : access SDL_Event) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1394
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PushEvent";

  --*
  -- * A function pointer used for callbacks that watch the event queue.
  -- *
  -- * \param userdata what was passed as `userdata` to SDL_SetEventFilter() or
  -- *                 SDL_AddEventWatch, etc.
  -- * \param event the event that triggered the callback.
  -- * \returns true to permit event to be added to the queue, and false to
  -- *          disallow it. When used with SDL_AddEventWatch, the return value is
  -- *          ignored.
  -- *
  -- * \threadsafety SDL may call this callback at any time from any thread; the
  -- *               application is responsible for locking resources the callback
  -- *               touches that need to be protected.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetEventFilter
  -- * \sa SDL_AddEventWatch
  --  

   type SDL_EventFilter is access function (arg1 : System.Address; arg2 : access SDL_Event) return Extensions.bool
   with Convention => C;  -- /usr/local/include/SDL3/SDL_events.h:1415

  --*
  -- * Set up a filter to process all events before they are added to the internal
  -- * event queue.
  -- *
  -- * If you just want to see events without modifying them or preventing them
  -- * from being queued, you should use SDL_AddEventWatch() instead.
  -- *
  -- * If the filter function returns true when called, then the event will be
  -- * added to the internal queue. If it returns false, then the event will be
  -- * dropped from the queue, but the internal state will still be updated. This
  -- * allows selective filtering of dynamically arriving events.
  -- *
  -- * **WARNING**: Be very careful of what you do in the event filter function,
  -- * as it may run in a different thread! The exception is handling of
  -- * SDL_EVENT_WINDOW_EXPOSED, which is guaranteed to be sent from the OS on the
  -- * main thread and you are expected to redraw your window in response to this
  -- * event.
  -- *
  -- * On platforms that support it, if the quit event is generated by an
  -- * interrupt signal (e.g. pressing Ctrl-C), it will be delivered to the
  -- * application at the next event poll.
  -- *
  -- * Note: Disabled events never make it to the event filter function; see
  -- * SDL_SetEventEnabled().
  -- *
  -- * Note: Events pushed onto the queue with SDL_PushEvent() get passed through
  -- * the event filter, but events pushed onto the queue with SDL_PeepEvents() do
  -- * not.
  -- *
  -- * \param filter a function to call when an event happens.
  -- * \param userdata a pointer that is passed to `filter`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddEventWatch
  -- * \sa SDL_SetEventEnabled
  -- * \sa SDL_GetEventFilter
  -- * \sa SDL_PeepEvents
  -- * \sa SDL_PushEvent
  --  

   procedure SDL_SetEventFilter (filter : SDL_EventFilter; userdata : System.Address)  -- /usr/local/include/SDL3/SDL_events.h:1459
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetEventFilter";

  --*
  -- * Query the current event filter.
  -- *
  -- * This function can be used to "chain" filters, by saving the existing filter
  -- * before replacing it with a function that will call that saved filter.
  -- *
  -- * \param filter the current callback function will be stored here.
  -- * \param userdata the pointer that is passed to the current event filter will
  -- *                 be stored here.
  -- * \returns true on success or false if there is no event filter set.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetEventFilter
  --  

   function SDL_GetEventFilter (filter : System.Address; userdata : System.Address) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1478
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetEventFilter";

  --*
  -- * Add a callback to be triggered when an event is added to the event queue.
  -- *
  -- * `filter` will be called when an event happens, and its return value is
  -- * ignored.
  -- *
  -- * **WARNING**: Be very careful of what you do in the event filter function,
  -- * as it may run in a different thread!
  -- *
  -- * If the quit event is generated by a signal (e.g. SIGINT), it will bypass
  -- * the internal queue and be delivered to the watch callback immediately, and
  -- * arrive at the next event poll.
  -- *
  -- * Note: the callback is called for events posted by the user through
  -- * SDL_PushEvent(), but not for disabled events, nor for events by a filter
  -- * callback set with SDL_SetEventFilter(), nor for events posted by the user
  -- * through SDL_PeepEvents().
  -- *
  -- * \param filter an SDL_EventFilter function to call when an event happens.
  -- * \param userdata a pointer that is passed to `filter`.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RemoveEventWatch
  -- * \sa SDL_SetEventFilter
  --  

   function SDL_AddEventWatch (filter : SDL_EventFilter; userdata : System.Address) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1510
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AddEventWatch";

  --*
  -- * Remove an event watch callback added with SDL_AddEventWatch().
  -- *
  -- * This function takes the same input as SDL_AddEventWatch() to identify and
  -- * delete the corresponding callback.
  -- *
  -- * \param filter the function originally passed to SDL_AddEventWatch().
  -- * \param userdata the pointer originally passed to SDL_AddEventWatch().
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AddEventWatch
  --  

   procedure SDL_RemoveEventWatch (filter : SDL_EventFilter; userdata : System.Address)  -- /usr/local/include/SDL3/SDL_events.h:1527
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RemoveEventWatch";

  --*
  -- * Run a specific filter function on the current event queue, removing any
  -- * events for which the filter returns false.
  -- *
  -- * See SDL_SetEventFilter() for more information. Unlike SDL_SetEventFilter(),
  -- * this function does not change the filter permanently, it only uses the
  -- * supplied filter until this function returns.
  -- *
  -- * \param filter the SDL_EventFilter function to call when an event happens.
  -- * \param userdata a pointer that is passed to `filter`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetEventFilter
  -- * \sa SDL_SetEventFilter
  --  

   procedure SDL_FilterEvents (filter : SDL_EventFilter; userdata : System.Address)  -- /usr/local/include/SDL3/SDL_events.h:1547
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_FilterEvents";

  --*
  -- * Set the state of processing events by type.
  -- *
  -- * \param type the type of event; see SDL_EventType for details.
  -- * \param enabled whether to process the event or not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_EventEnabled
  --  

   procedure SDL_SetEventEnabled (c_type : SDL3_SDL_stdinc_h.Uint32; enabled : Extensions.bool)  -- /usr/local/include/SDL3/SDL_events.h:1561
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetEventEnabled";

  --*
  -- * Query the state of processing events by type.
  -- *
  -- * \param type the type of event; see SDL_EventType for details.
  -- * \returns true if the event is being processed, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetEventEnabled
  --  

   function SDL_EventEnabled (c_type : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_events.h:1575
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_EventEnabled";

  --*
  -- * Allocate a set of user-defined events, and return the beginning event
  -- * number for that set of events.
  -- *
  -- * \param numevents the number of events to be allocated.
  -- * \returns the beginning event number, or 0 if numevents is invalid or if
  -- *          there are not enough user-defined events left.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PushEvent
  --  

   function SDL_RegisterEvents (numevents : int) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_events.h:1591
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RegisterEvents";

  --*
  -- * Get window associated with an event.
  -- *
  -- * \param event an event containing a `windowID`.
  -- * \returns the associated window on success or NULL if there is none.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PollEvent
  -- * \sa SDL_WaitEvent
  -- * \sa SDL_WaitEventTimeout
  --  

   function SDL_GetWindowFromEvent (event : access constant SDL_Event) return access SDL3_SDL_video_h.SDL_Window  -- /usr/local/include/SDL3/SDL_events.h:1607
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetWindowFromEvent";

  --*
  -- * Generate an English description of an event.
  -- *
  -- * This will fill `buf` with a null-terminated string that might look
  -- * something like this:
  -- *
  -- * ```
  -- * SDL_EVENT_MOUSE_MOTION (timestamp=1140256324 windowid=2 which=0 state=0 x=492.99 y=139.09 xrel=52 yrel=6)
  -- * ```
  -- *
  -- * The exact format of the string is not guaranteed; it is intended for
  -- * logging purposes, to be read by a human, and not parsed by a computer.
  -- *
  -- * The returned value follows the same rules as SDL_snprintf(): `buf` will
  -- * always be NULL-terminated (unless `buflen` is zero), and will be truncated
  -- * if `buflen` is too small. The return code is the number of bytes needed for
  -- * the complete string, not counting the NULL-terminator, whether the string
  -- * was truncated or not. Unlike SDL_snprintf(), though, this function never
  -- * returns -1.
  -- *
  -- * \param event an event to describe. May be NULL.
  -- * \param buf the buffer to fill with the description string. May be NULL.
  -- * \param buflen the maximum bytes that can be written to `buf`.
  -- * \returns number of bytes needed for the full string, not counting the
  -- *          null-terminator byte.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.4.0.
  --  

   function SDL_GetEventDescription
     (event : access constant SDL_Event;
      buf : Interfaces.C.Strings.chars_ptr;
      buflen : int) return int  -- /usr/local/include/SDL3/SDL_events.h:1639
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetEventDescription";

  -- Ends C function definitions when using C++  
end SDL3_SDL_events_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
