pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with SDL3_SDL_guid_h;
with SDL3_SDL_sensor_h;
with System;
with SDL3_SDL_properties_h;
with SDL3_SDL_power_h;

package SDL3_SDL_joystick_h is

   SDL_JOYSTICK_AXIS_MAX : constant := 32767;  --  /usr/local/include/SDL3/SDL_joystick.h:162

   SDL_JOYSTICK_AXIS_MIN : constant := -32768;  --  /usr/local/include/SDL3/SDL_joystick.h:173

   SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN : aliased constant String := "SDL.joystick.cap.mono_led" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_joystick.h:772
   SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN : aliased constant String := "SDL.joystick.cap.rgb_led" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_joystick.h:773
   SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN : aliased constant String := "SDL.joystick.cap.player_led" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_joystick.h:774
   SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN : aliased constant String := "SDL.joystick.cap.rumble" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_joystick.h:775
   SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN : aliased constant String := "SDL.joystick.cap.trigger_rumble" & ASCII.NUL;  --  /usr/local/include/SDL3/SDL_joystick.h:776

   SDL_HAT_CENTERED : constant := 16#00#;  --  /usr/local/include/SDL3/SDL_joystick.h:1212
   SDL_HAT_UP : constant := 16#01#;  --  /usr/local/include/SDL3/SDL_joystick.h:1213
   SDL_HAT_RIGHT : constant := 16#02#;  --  /usr/local/include/SDL3/SDL_joystick.h:1214
   SDL_HAT_DOWN : constant := 16#04#;  --  /usr/local/include/SDL3/SDL_joystick.h:1215
   SDL_HAT_LEFT : constant := 16#08#;  --  /usr/local/include/SDL3/SDL_joystick.h:1216
   --  unsupported macro: SDL_HAT_RIGHTUP (SDL_HAT_RIGHT|SDL_HAT_UP)
   --  unsupported macro: SDL_HAT_RIGHTDOWN (SDL_HAT_RIGHT|SDL_HAT_DOWN)
   --  unsupported macro: SDL_HAT_LEFTUP (SDL_HAT_LEFT|SDL_HAT_UP)
   --  unsupported macro: SDL_HAT_LEFTDOWN (SDL_HAT_LEFT|SDL_HAT_DOWN)

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
  -- * # CategoryJoystick
  -- *
  -- * SDL joystick support.
  -- *
  -- * This is the lower-level joystick handling. If you want the simpler option,
  -- * where what each button does is well-defined, you should use the gamepad API
  -- * instead.
  -- *
  -- * The term "instance_id" is the current instantiation of a joystick device in
  -- * the system. If the joystick is removed and then re-inserted then it will
  -- * get a new instance_id. instance_id's are monotonically increasing
  -- * identifiers of a joystick plugged in.
  -- *
  -- * The term "player_index" is the number assigned to a player on a specific
  -- * controller. For XInput controllers this returns the XInput user index. Many
  -- * joysticks will not be able to supply this information.
  -- *
  -- * SDL_GUID is used as a stable 128-bit identifier for a joystick device that
  -- * does not change over time. It identifies class of the device (a X360 wired
  -- * controller for example). This identifier is platform dependent.
  -- *
  -- * In order to use these functions, SDL_Init() must have been called with the
  -- * SDL_INIT_JOYSTICK flag. This causes SDL to scan the system for joysticks,
  -- * and load appropriate drivers.
  -- *
  -- * If you would like to receive joystick updates while the application is in
  -- * the background, you should set the following hint before calling
  -- * SDL_Init(): SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS
  -- *
  -- * SDL can provide virtual joysticks as well: the app defines an imaginary
  -- * controller with SDL_AttachVirtualJoystick(), and then can provide inputs
  -- * for it via SDL_SetJoystickVirtualAxis(), SDL_SetJoystickVirtualButton(),
  -- * etc. As this data is supplied, it will look like a normal joystick to SDL,
  -- * just not backed by a hardware driver. This has been used to make unusual
  -- * devices, like VR headset controllers, look like normal joysticks, or
  -- * provide recording/playback of game inputs, etc.
  --  

  -- Set up for C function definitions, even when using C++  
  -- * This is not an exported symbol from SDL, this is only in the headers to
  -- * help Clang's thread safety analysis tools to function. Do not attempt
  -- * to access this symbol from your app, it will not work!
  --  

  --*
  -- * The joystick structure used to identify an SDL joystick.
  -- *
  -- * This is opaque data.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

   type SDL_Joystick is null record;   -- incomplete struct

  --*
  -- * This is a unique ID for a joystick for the time it is connected to the
  -- * system, and is never reused for the lifetime of the application.
  -- *
  -- * If the joystick is disconnected and reconnected, it will get a new ID.
  -- *
  -- * The value 0 is an invalid ID.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_JoystickID is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_joystick.h:106

  --*
  -- * An enum of some common joystick types.
  -- *
  -- * In some cases, SDL can identify a low-level joystick as being a certain
  -- * type of device, and will report it through SDL_GetJoystickType (or
  -- * SDL_GetJoystickTypeForID).
  -- *
  -- * This is by no means a complete list of everything that can be plugged into
  -- * a computer.
  -- *
  -- * You may refer to
  -- * [XInput Controller Types](https://learn.microsoft.com/en-us/windows/win32/xinput/xinput-and-controller-subtypes)
  -- * table for a general understanding of each joystick type.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_JoystickType is 
     (SDL_JOYSTICK_TYPE_UNKNOWN,
      SDL_JOYSTICK_TYPE_GAMEPAD,
      SDL_JOYSTICK_TYPE_WHEEL,
      SDL_JOYSTICK_TYPE_ARCADE_STICK,
      SDL_JOYSTICK_TYPE_FLIGHT_STICK,
      SDL_JOYSTICK_TYPE_DANCE_PAD,
      SDL_JOYSTICK_TYPE_GUITAR,
      SDL_JOYSTICK_TYPE_DRUM_KIT,
      SDL_JOYSTICK_TYPE_ARCADE_PAD,
      SDL_JOYSTICK_TYPE_THROTTLE,
      SDL_JOYSTICK_TYPE_COUNT)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_joystick.h:124

  --*
  -- * Possible connection states for a joystick device.
  -- *
  -- * This is used by SDL_GetJoystickConnectionState to report how a device is
  -- * connected to the system.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_JoystickConnectionState is int;
   SDL_JoystickConnectionState_SDL_JOYSTICK_CONNECTION_INVALID : constant SDL_JoystickConnectionState := -1;
   SDL_JoystickConnectionState_SDL_JOYSTICK_CONNECTION_UNKNOWN : constant SDL_JoystickConnectionState := 0;
   SDL_JoystickConnectionState_SDL_JOYSTICK_CONNECTION_WIRED : constant SDL_JoystickConnectionState := 1;
   SDL_JoystickConnectionState_SDL_JOYSTICK_CONNECTION_WIRELESS : constant SDL_JoystickConnectionState := 2;  -- /usr/local/include/SDL3/SDL_joystick.h:147

  --*
  -- * The largest value an SDL_Joystick's axis can report.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_JOYSTICK_AXIS_MIN
  --  

  --*
  -- * The smallest value an SDL_Joystick's axis can report.
  -- *
  -- * This is a negative number!
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_JOYSTICK_AXIS_MAX
  --  

  -- Function prototypes  
  --*
  -- * Locking for atomic access to the joystick API.
  -- *
  -- * The SDL joystick functions are thread-safe, however you can lock the
  -- * joysticks while processing to guarantee that the joystick list won't change
  -- * and joystick and gamepad events will not be delivered.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_LockJoysticks  -- /usr/local/include/SDL3/SDL_joystick.h:189
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_LockJoysticks";

  --*
  -- * Unlocking for atomic access to the joystick API.
  -- *
  -- * \threadsafety This should be called from the same thread that called
  -- *               SDL_LockJoysticks().
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_UnlockJoysticks  -- /usr/local/include/SDL3/SDL_joystick.h:199
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UnlockJoysticks";

  --*
  -- * Return whether a joystick is currently connected.
  -- *
  -- * \returns true if a joystick is connected, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_HasJoystick return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:212
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasJoystick";

  --*
  -- * Get a list of currently connected joysticks.
  -- *
  -- * \param count a pointer filled in with the number of joysticks returned, may
  -- *              be NULL.
  -- * \returns a 0 terminated array of joystick instance IDs or NULL on failure;
  -- *          call SDL_GetError() for more information. This should be freed
  -- *          with SDL_free() when it is no longer needed.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasJoystick
  -- * \sa SDL_OpenJoystick
  --  

   function SDL_GetJoysticks (count : access int) return access SDL_JoystickID  -- /usr/local/include/SDL3/SDL_joystick.h:230
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoysticks";

  --*
  -- * Get the implementation dependent name of a joystick.
  -- *
  -- * This can be called before any joysticks are opened.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the name of the selected joystick. If no name can be found, this
  -- *          function returns NULL; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickName
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickNameForID (instance_id : SDL_JoystickID) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_joystick.h:248
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickNameForID";

  --*
  -- * Get the implementation dependent path of a joystick.
  -- *
  -- * This can be called before any joysticks are opened.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the path of the selected joystick. If no path can be found, this
  -- *          function returns NULL; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickPath
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickPathForID (instance_id : SDL_JoystickID) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_joystick.h:266
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickPathForID";

  --*
  -- * Get the player index of a joystick.
  -- *
  -- * This can be called before any joysticks are opened.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the player index of a joystick, or -1 if it's not available.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickPlayerIndex
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickPlayerIndexForID (instance_id : SDL_JoystickID) return int  -- /usr/local/include/SDL3/SDL_joystick.h:283
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickPlayerIndexForID";

  --*
  -- * Get the implementation-dependent GUID of a joystick.
  -- *
  -- * This can be called before any joysticks are opened.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the GUID of the selected joystick. If called with an invalid
  -- *          instance_id, this function returns a zero GUID.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickGUID
  -- * \sa SDL_GUIDToString
  --  

   function SDL_GetJoystickGUIDForID (instance_id : SDL_JoystickID) return SDL3_SDL_guid_h.SDL_GUID  -- /usr/local/include/SDL3/SDL_joystick.h:301
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickGUIDForID";

  --*
  -- * Get the USB vendor ID of a joystick, if available.
  -- *
  -- * This can be called before any joysticks are opened. If the vendor ID isn't
  -- * available this function returns 0.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the USB vendor ID of the selected joystick. If called with an
  -- *          invalid instance_id, this function returns 0.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickVendor
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickVendorForID (instance_id : SDL_JoystickID) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:320
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickVendorForID";

  --*
  -- * Get the USB product ID of a joystick, if available.
  -- *
  -- * This can be called before any joysticks are opened. If the product ID isn't
  -- * available this function returns 0.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the USB product ID of the selected joystick. If called with an
  -- *          invalid instance_id, this function returns 0.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickProduct
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickProductForID (instance_id : SDL_JoystickID) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:339
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickProductForID";

  --*
  -- * Get the product version of a joystick, if available.
  -- *
  -- * This can be called before any joysticks are opened. If the product version
  -- * isn't available this function returns 0.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the product version of the selected joystick. If called with an
  -- *          invalid instance_id, this function returns 0.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickProductVersion
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickProductVersionForID (instance_id : SDL_JoystickID) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:358
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickProductVersionForID";

  --*
  -- * Get the type of a joystick, if available.
  -- *
  -- * This can be called before any joysticks are opened.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns the SDL_JoystickType of the selected joystick. If called with an
  -- *          invalid instance_id, this function returns
  -- *          `SDL_JOYSTICK_TYPE_UNKNOWN`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickType
  -- * \sa SDL_GetJoysticks
  --  

   function SDL_GetJoystickTypeForID (instance_id : SDL_JoystickID) return SDL_JoystickType  -- /usr/local/include/SDL3/SDL_joystick.h:377
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickTypeForID";

  --*
  -- * Open a joystick for use.
  -- *
  -- * The joystick subsystem must be initialized before a joystick can be opened
  -- * for use.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns a joystick identifier or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CloseJoystick
  --  

   function SDL_OpenJoystick (instance_id : SDL_JoystickID) return access SDL_Joystick  -- /usr/local/include/SDL3/SDL_joystick.h:395
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OpenJoystick";

  --*
  -- * Get the SDL_Joystick associated with an instance ID, if it has been opened.
  -- *
  -- * \param instance_id the instance ID to get the SDL_Joystick for.
  -- * \returns an SDL_Joystick on success or NULL on failure or if it hasn't been
  -- *          opened yet; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickFromID (instance_id : SDL_JoystickID) return access SDL_Joystick  -- /usr/local/include/SDL3/SDL_joystick.h:408
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickFromID";

  --*
  -- * Get the SDL_Joystick associated with a player index.
  -- *
  -- * \param player_index the player index to get the SDL_Joystick for.
  -- * \returns an SDL_Joystick on success or NULL on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickPlayerIndex
  -- * \sa SDL_SetJoystickPlayerIndex
  --  

   function SDL_GetJoystickFromPlayerIndex (player_index : int) return access SDL_Joystick  -- /usr/local/include/SDL3/SDL_joystick.h:424
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickFromPlayerIndex";

  --*
  -- * The structure that describes a virtual joystick touchpad.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_VirtualJoystickDesc
  --  

  --*< the number of simultaneous fingers on this touchpad  
   type anon_array2584 is array (0 .. 2) of aliased SDL3_SDL_stdinc_h.Uint16;
   type SDL_VirtualJoystickTouchpadDesc is record
      nfingers : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:435
      padding : aliased anon_array2584;  -- /usr/local/include/SDL3/SDL_joystick.h:436
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_joystick.h:433

  --*
  -- * The structure that describes a virtual joystick sensor.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_VirtualJoystickDesc
  --  

  --*< the type of this sensor  
   type SDL_VirtualJoystickSensorDesc is record
      c_type : aliased SDL3_SDL_sensor_h.SDL_SensorType;  -- /usr/local/include/SDL3/SDL_joystick.h:448
      rate : aliased float;  -- /usr/local/include/SDL3/SDL_joystick.h:449
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_joystick.h:446

  --*< the update frequency of this sensor, may be 0.0f  
  --*
  -- * The structure that describes a virtual joystick.
  -- *
  -- * This structure should be initialized using SDL_INIT_INTERFACE(). All
  -- * elements of this structure are optional.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AttachVirtualJoystick
  -- * \sa SDL_INIT_INTERFACE
  -- * \sa SDL_VirtualJoystickSensorDesc
  -- * \sa SDL_VirtualJoystickTouchpadDesc
  --  

  --*< the version of this interface  
   type anon_array2590 is array (0 .. 1) of aliased SDL3_SDL_stdinc_h.Uint16;
   type SDL_VirtualJoystickDesc is record
      version : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_joystick.h:467
      c_type : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:468
      padding : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:469
      vendor_id : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:470
      product_id : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:471
      naxes : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:472
      nbuttons : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:473
      nballs : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:474
      nhats : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:475
      ntouchpads : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:476
      nsensors : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_joystick.h:477
      padding2 : aliased anon_array2590;  -- /usr/local/include/SDL3/SDL_joystick.h:478
      button_mask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_joystick.h:479
      axis_mask : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_joystick.h:481
      name : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_joystick.h:483
      touchpads : access constant SDL_VirtualJoystickTouchpadDesc;  -- /usr/local/include/SDL3/SDL_joystick.h:484
      sensors : access constant SDL_VirtualJoystickSensorDesc;  -- /usr/local/include/SDL3/SDL_joystick.h:485
      userdata : System.Address;  -- /usr/local/include/SDL3/SDL_joystick.h:487
      Update : access procedure (arg1 : System.Address);  -- /usr/local/include/SDL3/SDL_joystick.h:488
      SetPlayerIndex : access procedure (arg1 : System.Address; arg2 : int);  -- /usr/local/include/SDL3/SDL_joystick.h:489
      Rumble : access function
           (arg1 : System.Address;
            arg2 : SDL3_SDL_stdinc_h.Uint16;
            arg3 : SDL3_SDL_stdinc_h.Uint16) return Extensions.bool;  -- /usr/local/include/SDL3/SDL_joystick.h:490
      RumbleTriggers : access function
           (arg1 : System.Address;
            arg2 : SDL3_SDL_stdinc_h.Uint16;
            arg3 : SDL3_SDL_stdinc_h.Uint16) return Extensions.bool;  -- /usr/local/include/SDL3/SDL_joystick.h:491
      SetLED : access function
           (arg1 : System.Address;
            arg2 : SDL3_SDL_stdinc_h.Uint8;
            arg3 : SDL3_SDL_stdinc_h.Uint8;
            arg4 : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool;  -- /usr/local/include/SDL3/SDL_joystick.h:492
      SendEffect : access function
           (arg1 : System.Address;
            arg2 : System.Address;
            arg3 : int) return Extensions.bool;  -- /usr/local/include/SDL3/SDL_joystick.h:493
      SetSensorsEnabled : access function (arg1 : System.Address; arg2 : Extensions.bool) return Extensions.bool;  -- /usr/local/include/SDL3/SDL_joystick.h:494
      Cleanup : access procedure (arg1 : System.Address);  -- /usr/local/include/SDL3/SDL_joystick.h:495
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_joystick.h:465

  --*< `SDL_JoystickType`  
  --*< unused  
  --*< the USB vendor ID of this joystick  
  --*< the USB product ID of this joystick  
  --*< the number of axes on this joystick  
  --*< the number of buttons on this joystick  
  --*< the number of balls on this joystick  
  --*< the number of hats on this joystick  
  --*< the number of touchpads on this joystick, requires `touchpads` to point at valid descriptions  
  --*< the number of sensors on this joystick, requires `sensors` to point at valid descriptions  
  --*< unused  
  --*< A mask of which buttons are valid for this controller
  --                             e.g. (1 << SDL_GAMEPAD_BUTTON_SOUTH)  

  --*< A mask of which axes are valid for this controller
  --                             e.g. (1 << SDL_GAMEPAD_AXIS_LEFTX)  

  --*< the name of the joystick  
  --*< A pointer to an array of touchpad descriptions, required if `ntouchpads` is > 0  
  --*< A pointer to an array of sensor descriptions, required if `nsensors` is > 0  
  --*< User data pointer passed to callbacks  
  --*< Called when the joystick state should be updated  
  --*< Called when the player index is set  
  --*< Implements SDL_RumbleJoystick()  
  --*< Implements SDL_RumbleJoystickTriggers()  
  --*< Implements SDL_SetJoystickLED()  
  --*< Implements SDL_SendJoystickEffect()  
  --*< Implements SDL_SetGamepadSensorEnabled()  
  --*< Cleans up the userdata when the joystick is detached  
  -- Check the size of SDL_VirtualJoystickDesc
  -- *
  -- * If this assert fails, either the compiler is padding to an unexpected size,
  -- * or the interface has been updated and this should be updated to match and
  -- * the code using this interface should be updated to handle the old version.
  --  

  --*
  -- * Attach a new virtual joystick.
  -- *
  -- * Apps can create virtual joysticks, that exist without hardware directly
  -- * backing them, and have program-supplied inputs. Once attached, a virtual
  -- * joystick looks like any other joystick that SDL can access. These can be
  -- * used to make other things look like joysticks, or provide pre-recorded
  -- * input, etc.
  -- *
  -- * Once attached, the app can send joystick inputs to the new virtual joystick
  -- * using SDL_SetJoystickVirtualAxis(), etc.
  -- *
  -- * When no longer needed, the virtual joystick can be removed by calling
  -- * SDL_DetachVirtualJoystick().
  -- *
  -- * \param desc joystick description, initialized using SDL_INIT_INTERFACE().
  -- * \returns the joystick instance ID, or 0 on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DetachVirtualJoystick
  -- * \sa SDL_SetJoystickVirtualAxis
  -- * \sa SDL_SetJoystickVirtualButton
  -- * \sa SDL_SetJoystickVirtualBall
  -- * \sa SDL_SetJoystickVirtualHat
  -- * \sa SDL_SetJoystickVirtualTouchpad
  -- * \sa SDL_SetJoystickVirtualSensorData
  --  

   function SDL_AttachVirtualJoystick (desc : access constant SDL_VirtualJoystickDesc) return SDL_JoystickID  -- /usr/local/include/SDL3/SDL_joystick.h:539
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_AttachVirtualJoystick";

  --*
  -- * Detach a virtual joystick.
  -- *
  -- * \param instance_id the joystick instance ID, previously returned from
  -- *                    SDL_AttachVirtualJoystick().
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_AttachVirtualJoystick
  --  

   function SDL_DetachVirtualJoystick (instance_id : SDL_JoystickID) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:555
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DetachVirtualJoystick";

  --*
  -- * Query whether or not a joystick is virtual.
  -- *
  -- * \param instance_id the joystick instance ID.
  -- * \returns true if the joystick is virtual, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_IsJoystickVirtual (instance_id : SDL_JoystickID) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:567
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsJoystickVirtual";

  --*
  -- * Set the state of an axis on an opened virtual joystick.
  -- *
  -- * Please note that values set here will not be applied until the next call to
  -- * SDL_UpdateJoysticks, which can either be called directly, or can be called
  -- * indirectly through various other SDL APIs, including, but not limited to
  -- * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
  -- * SDL_WaitEvent.
  -- *
  -- * Note that when sending trigger axes, you should scale the value to the full
  -- * range of Sint16. For example, a trigger at rest would have the value of
  -- * `SDL_JOYSTICK_AXIS_MIN`.
  -- *
  -- * \param joystick the virtual joystick on which to set state.
  -- * \param axis the index of the axis on the virtual joystick to update.
  -- * \param value the new value for the specified axis.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickVirtualButton
  -- * \sa SDL_SetJoystickVirtualBall
  -- * \sa SDL_SetJoystickVirtualHat
  -- * \sa SDL_SetJoystickVirtualTouchpad
  -- * \sa SDL_SetJoystickVirtualSensorData
  --  

   function SDL_SetJoystickVirtualAxis
     (joystick : access SDL_Joystick;
      axis : int;
      value : SDL3_SDL_stdinc_h.Sint16) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:598
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickVirtualAxis";

  --*
  -- * Generate ball motion on an opened virtual joystick.
  -- *
  -- * Please note that values set here will not be applied until the next call to
  -- * SDL_UpdateJoysticks, which can either be called directly, or can be called
  -- * indirectly through various other SDL APIs, including, but not limited to
  -- * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
  -- * SDL_WaitEvent.
  -- *
  -- * \param joystick the virtual joystick on which to set state.
  -- * \param ball the index of the ball on the virtual joystick to update.
  -- * \param xrel the relative motion on the X axis.
  -- * \param yrel the relative motion on the Y axis.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickVirtualAxis
  -- * \sa SDL_SetJoystickVirtualButton
  -- * \sa SDL_SetJoystickVirtualHat
  -- * \sa SDL_SetJoystickVirtualTouchpad
  -- * \sa SDL_SetJoystickVirtualSensorData
  --  

   function SDL_SetJoystickVirtualBall
     (joystick : access SDL_Joystick;
      ball : int;
      xrel : SDL3_SDL_stdinc_h.Sint16;
      yrel : SDL3_SDL_stdinc_h.Sint16) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:626
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickVirtualBall";

  --*
  -- * Set the state of a button on an opened virtual joystick.
  -- *
  -- * Please note that values set here will not be applied until the next call to
  -- * SDL_UpdateJoysticks, which can either be called directly, or can be called
  -- * indirectly through various other SDL APIs, including, but not limited to
  -- * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
  -- * SDL_WaitEvent.
  -- *
  -- * \param joystick the virtual joystick on which to set state.
  -- * \param button the index of the button on the virtual joystick to update.
  -- * \param down true if the button is pressed, false otherwise.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickVirtualAxis
  -- * \sa SDL_SetJoystickVirtualBall
  -- * \sa SDL_SetJoystickVirtualHat
  -- * \sa SDL_SetJoystickVirtualTouchpad
  -- * \sa SDL_SetJoystickVirtualSensorData
  --  

   function SDL_SetJoystickVirtualButton
     (joystick : access SDL_Joystick;
      button : int;
      down : Extensions.bool) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:653
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickVirtualButton";

  --*
  -- * Set the state of a hat on an opened virtual joystick.
  -- *
  -- * Please note that values set here will not be applied until the next call to
  -- * SDL_UpdateJoysticks, which can either be called directly, or can be called
  -- * indirectly through various other SDL APIs, including, but not limited to
  -- * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
  -- * SDL_WaitEvent.
  -- *
  -- * \param joystick the virtual joystick on which to set state.
  -- * \param hat the index of the hat on the virtual joystick to update.
  -- * \param value the new value for the specified hat.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickVirtualAxis
  -- * \sa SDL_SetJoystickVirtualButton
  -- * \sa SDL_SetJoystickVirtualBall
  -- * \sa SDL_SetJoystickVirtualTouchpad
  -- * \sa SDL_SetJoystickVirtualSensorData
  --  

   function SDL_SetJoystickVirtualHat
     (joystick : access SDL_Joystick;
      hat : int;
      value : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:680
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickVirtualHat";

  --*
  -- * Set touchpad finger state on an opened virtual joystick.
  -- *
  -- * Please note that values set here will not be applied until the next call to
  -- * SDL_UpdateJoysticks, which can either be called directly, or can be called
  -- * indirectly through various other SDL APIs, including, but not limited to
  -- * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
  -- * SDL_WaitEvent.
  -- *
  -- * \param joystick the virtual joystick on which to set state.
  -- * \param touchpad the index of the touchpad on the virtual joystick to
  -- *                 update.
  -- * \param finger the index of the finger on the touchpad to set.
  -- * \param down true if the finger is pressed, false if the finger is released.
  -- * \param x the x coordinate of the finger on the touchpad, normalized 0 to 1,
  -- *          with the origin in the upper left.
  -- * \param y the y coordinate of the finger on the touchpad, normalized 0 to 1,
  -- *          with the origin in the upper left.
  -- * \param pressure the pressure of the finger.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickVirtualAxis
  -- * \sa SDL_SetJoystickVirtualButton
  -- * \sa SDL_SetJoystickVirtualBall
  -- * \sa SDL_SetJoystickVirtualHat
  -- * \sa SDL_SetJoystickVirtualSensorData
  --  

   function SDL_SetJoystickVirtualTouchpad
     (joystick : access SDL_Joystick;
      touchpad : int;
      finger : int;
      down : Extensions.bool;
      x : float;
      y : float;
      pressure : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:714
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickVirtualTouchpad";

  --*
  -- * Send a sensor update for an opened virtual joystick.
  -- *
  -- * Please note that values set here will not be applied until the next call to
  -- * SDL_UpdateJoysticks, which can either be called directly, or can be called
  -- * indirectly through various other SDL APIs, including, but not limited to
  -- * the following: SDL_PollEvent, SDL_PumpEvents, SDL_WaitEventTimeout,
  -- * SDL_WaitEvent.
  -- *
  -- * \param joystick the virtual joystick on which to set state.
  -- * \param type the type of the sensor on the virtual joystick to update.
  -- * \param sensor_timestamp a 64-bit timestamp in nanoseconds associated with
  -- *                         the sensor reading.
  -- * \param data the data associated with the sensor reading.
  -- * \param num_values the number of values pointed to by `data`.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickVirtualAxis
  -- * \sa SDL_SetJoystickVirtualButton
  -- * \sa SDL_SetJoystickVirtualBall
  -- * \sa SDL_SetJoystickVirtualHat
  -- * \sa SDL_SetJoystickVirtualTouchpad
  --  

   function SDL_SendJoystickVirtualSensorData
     (joystick : access SDL_Joystick;
      c_type : SDL3_SDL_sensor_h.SDL_SensorType;
      sensor_timestamp : SDL3_SDL_stdinc_h.Uint64;
      data : access float;
      num_values : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:744
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SendJoystickVirtualSensorData";

  --*
  -- * Get the properties associated with a joystick.
  -- *
  -- * The following read-only properties are provided by SDL:
  -- *
  -- * - `SDL_PROP_JOYSTICK_CAP_MONO_LED_BOOLEAN`: true if this joystick has an
  -- *   LED that has adjustable brightness
  -- * - `SDL_PROP_JOYSTICK_CAP_RGB_LED_BOOLEAN`: true if this joystick has an LED
  -- *   that has adjustable color
  -- * - `SDL_PROP_JOYSTICK_CAP_PLAYER_LED_BOOLEAN`: true if this joystick has a
  -- *   player LED
  -- * - `SDL_PROP_JOYSTICK_CAP_RUMBLE_BOOLEAN`: true if this joystick has
  -- *   left/right rumble
  -- * - `SDL_PROP_JOYSTICK_CAP_TRIGGER_RUMBLE_BOOLEAN`: true if this joystick has
  -- *   simple trigger rumble
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns a valid property ID on success or 0 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickProperties (joystick : access SDL_Joystick) return SDL3_SDL_properties_h.SDL_PropertiesID  -- /usr/local/include/SDL3/SDL_joystick.h:770
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickProperties";

  --*
  -- * Get the implementation dependent name of a joystick.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the name of the selected joystick. If no name can be found, this
  -- *          function returns NULL; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickNameForID
  --  

   function SDL_GetJoystickName (joystick : access SDL_Joystick) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_joystick.h:791
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickName";

  --*
  -- * Get the implementation dependent path of a joystick.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the path of the selected joystick. If no path can be found, this
  -- *          function returns NULL; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickPathForID
  --  

   function SDL_GetJoystickPath (joystick : access SDL_Joystick) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_joystick.h:806
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickPath";

  --*
  -- * Get the player index of an opened joystick.
  -- *
  -- * For XInput controllers this returns the XInput user index. Many joysticks
  -- * will not be able to supply this information.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the player index, or -1 if it's not available.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickPlayerIndex
  --  

   function SDL_GetJoystickPlayerIndex (joystick : access SDL_Joystick) return int  -- /usr/local/include/SDL3/SDL_joystick.h:823
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickPlayerIndex";

  --*
  -- * Set the player index of an opened joystick.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \param player_index player index to assign to this joystick, or -1 to clear
  -- *                     the player index and turn off player LEDs.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickPlayerIndex
  --  

   function SDL_SetJoystickPlayerIndex (joystick : access SDL_Joystick; player_index : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:840
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickPlayerIndex";

  --*
  -- * Get the implementation-dependent GUID for the joystick.
  -- *
  -- * This function requires an open joystick.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the GUID of the given joystick. If called on an invalid index,
  -- *          this function returns a zero GUID; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickGUIDForID
  -- * \sa SDL_GUIDToString
  --  

   function SDL_GetJoystickGUID (joystick : access SDL_Joystick) return SDL3_SDL_guid_h.SDL_GUID  -- /usr/local/include/SDL3/SDL_joystick.h:859
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickGUID";

  --*
  -- * Get the USB vendor ID of an opened joystick, if available.
  -- *
  -- * If the vendor ID isn't available this function returns 0.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the USB vendor ID of the selected joystick, or 0 if unavailable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickVendorForID
  --  

   function SDL_GetJoystickVendor (joystick : access SDL_Joystick) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:875
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickVendor";

  --*
  -- * Get the USB product ID of an opened joystick, if available.
  -- *
  -- * If the product ID isn't available this function returns 0.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the USB product ID of the selected joystick, or 0 if unavailable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickProductForID
  --  

   function SDL_GetJoystickProduct (joystick : access SDL_Joystick) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:891
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickProduct";

  --*
  -- * Get the product version of an opened joystick, if available.
  -- *
  -- * If the product version isn't available this function returns 0.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the product version of the selected joystick, or 0 if unavailable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickProductVersionForID
  --  

   function SDL_GetJoystickProductVersion (joystick : access SDL_Joystick) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:907
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickProductVersion";

  --*
  -- * Get the firmware version of an opened joystick, if available.
  -- *
  -- * If the firmware version isn't available this function returns 0.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the firmware version of the selected joystick, or 0 if
  -- *          unavailable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickFirmwareVersion (joystick : access SDL_Joystick) return SDL3_SDL_stdinc_h.Uint16  -- /usr/local/include/SDL3/SDL_joystick.h:922
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickFirmwareVersion";

  --*
  -- * Get the serial number of an opened joystick, if available.
  -- *
  -- * Returns the serial number of the joystick, or NULL if it is not available.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the serial number of the selected joystick, or NULL if
  -- *          unavailable.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickSerial (joystick : access SDL_Joystick) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_joystick.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickSerial";

  --*
  -- * Get the type of an opened joystick.
  -- *
  -- * \param joystick the SDL_Joystick obtained from SDL_OpenJoystick().
  -- * \returns the SDL_JoystickType of the selected joystick.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickTypeForID
  --  

   function SDL_GetJoystickType (joystick : access SDL_Joystick) return SDL_JoystickType  -- /usr/local/include/SDL3/SDL_joystick.h:951
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickType";

  --*
  -- * Get the device information encoded in a SDL_GUID structure.
  -- *
  -- * \param guid the SDL_GUID you wish to get info about.
  -- * \param vendor a pointer filled in with the device VID, or 0 if not
  -- *               available.
  -- * \param product a pointer filled in with the device PID, or 0 if not
  -- *                available.
  -- * \param version a pointer filled in with the device version, or 0 if not
  -- *                available.
  -- * \param crc16 a pointer filled in with a CRC used to distinguish different
  -- *              products with the same VID/PID, or 0 if not available.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickGUIDForID
  --  

   procedure SDL_GetJoystickGUIDInfo
     (guid : SDL3_SDL_guid_h.SDL_GUID;
      vendor : access SDL3_SDL_stdinc_h.Uint16;
      product : access SDL3_SDL_stdinc_h.Uint16;
      version : access SDL3_SDL_stdinc_h.Uint16;
      crc16 : access SDL3_SDL_stdinc_h.Uint16)  -- /usr/local/include/SDL3/SDL_joystick.h:972
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickGUIDInfo";

  --*
  -- * Get the status of a specified joystick.
  -- *
  -- * \param joystick the joystick to query.
  -- * \returns true if the joystick has been opened, false if it has not; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_JoystickConnected (joystick : access SDL_Joystick) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:985
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickConnected";

  --*
  -- * Get the instance ID of an opened joystick.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \returns the instance ID of the specified joystick on success or 0 on
  -- *          failure; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickID (joystick : access SDL_Joystick) return SDL_JoystickID  -- /usr/local/include/SDL3/SDL_joystick.h:998
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickID";

  --*
  -- * Get the number of general axis controls on a joystick.
  -- *
  -- * Often, the directional pad on a game controller will either look like 4
  -- * separate buttons or a POV hat, and not axes, but all of this is up to the
  -- * device and platform.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \returns the number of axis controls/number of axes on success or -1 on
  -- *          failure; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickAxis
  -- * \sa SDL_GetNumJoystickBalls
  -- * \sa SDL_GetNumJoystickButtons
  -- * \sa SDL_GetNumJoystickHats
  --  

   function SDL_GetNumJoystickAxes (joystick : access SDL_Joystick) return int  -- /usr/local/include/SDL3/SDL_joystick.h:1020
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumJoystickAxes";

  --*
  -- * Get the number of trackballs on a joystick.
  -- *
  -- * Joystick trackballs have only relative motion events associated with them
  -- * and their state cannot be polled.
  -- *
  -- * Most joysticks do not have trackballs.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \returns the number of trackballs on success or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickBall
  -- * \sa SDL_GetNumJoystickAxes
  -- * \sa SDL_GetNumJoystickButtons
  -- * \sa SDL_GetNumJoystickHats
  --  

   function SDL_GetNumJoystickBalls (joystick : access SDL_Joystick) return int  -- /usr/local/include/SDL3/SDL_joystick.h:1043
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumJoystickBalls";

  --*
  -- * Get the number of POV hats on a joystick.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \returns the number of POV hats on success or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickHat
  -- * \sa SDL_GetNumJoystickAxes
  -- * \sa SDL_GetNumJoystickBalls
  -- * \sa SDL_GetNumJoystickButtons
  --  

   function SDL_GetNumJoystickHats (joystick : access SDL_Joystick) return int  -- /usr/local/include/SDL3/SDL_joystick.h:1061
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumJoystickHats";

  --*
  -- * Get the number of buttons on a joystick.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \returns the number of buttons on success or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetJoystickButton
  -- * \sa SDL_GetNumJoystickAxes
  -- * \sa SDL_GetNumJoystickBalls
  -- * \sa SDL_GetNumJoystickHats
  --  

   function SDL_GetNumJoystickButtons (joystick : access SDL_Joystick) return int  -- /usr/local/include/SDL3/SDL_joystick.h:1079
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumJoystickButtons";

  --*
  -- * Set the state of joystick event processing.
  -- *
  -- * If joystick events are disabled, you must call SDL_UpdateJoysticks()
  -- * yourself and check the state of the joystick when you want joystick
  -- * information.
  -- *
  -- * \param enabled whether to process joystick events or not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_JoystickEventsEnabled
  -- * \sa SDL_UpdateJoysticks
  --  

   procedure SDL_SetJoystickEventsEnabled (enabled : Extensions.bool)  -- /usr/local/include/SDL3/SDL_joystick.h:1097
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickEventsEnabled";

  --*
  -- * Query the state of joystick event processing.
  -- *
  -- * If joystick events are disabled, you must call SDL_UpdateJoysticks()
  -- * yourself and check the state of the joystick when you want joystick
  -- * information.
  -- *
  -- * \returns true if joystick events are being processed, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetJoystickEventsEnabled
  --  

   function SDL_JoystickEventsEnabled return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1114
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_JoystickEventsEnabled";

  --*
  -- * Update the current state of the open joysticks.
  -- *
  -- * This is called automatically by the event loop if any joystick events are
  -- * enabled.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_UpdateJoysticks  -- /usr/local/include/SDL3/SDL_joystick.h:1126
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateJoysticks";

  --*
  -- * Get the current state of an axis control on a joystick.
  -- *
  -- * SDL makes no promises about what part of the joystick any given axis refers
  -- * to. Your game should have some sort of configuration UI to let users
  -- * specify what each axis should be bound to. Alternately, SDL's higher-level
  -- * Game Controller API makes a great effort to apply order to this lower-level
  -- * interface, so you know that a specific axis is the "left thumb stick," etc.
  -- *
  -- * The value returned by SDL_GetJoystickAxis() is a signed integer (-32768 to
  -- * 32767) representing the current position of the axis. It may be necessary
  -- * to impose certain tolerances on these values to account for jitter.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \param axis the axis to query; the axis indices start at index 0.
  -- * \returns a 16-bit signed integer representing the current position of the
  -- *          axis or 0 on failure; call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetNumJoystickAxes
  --  

   function SDL_GetJoystickAxis (joystick : access SDL_Joystick; axis : int) return SDL3_SDL_stdinc_h.Sint16  -- /usr/local/include/SDL3/SDL_joystick.h:1152
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickAxis";

  --*
  -- * Get the initial state of an axis control on a joystick.
  -- *
  -- * The state is a value ranging from -32768 to 32767.
  -- *
  -- * The axis indices start at index 0.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \param axis the axis to query; the axis indices start at index 0.
  -- * \param state upon return, the initial value is supplied here.
  -- * \returns true if this axis has any initial value, or false if not.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickAxisInitialState
     (joystick : access SDL_Joystick;
      axis : int;
      state : access SDL3_SDL_stdinc_h.Sint16) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1170
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickAxisInitialState";

  --*
  -- * Get the ball axis change since the last poll.
  -- *
  -- * Trackballs can only return relative motion since the last call to
  -- * SDL_GetJoystickBall(), these motion deltas are placed into `dx` and `dy`.
  -- *
  -- * Most joysticks do not have trackballs.
  -- *
  -- * \param joystick the SDL_Joystick to query.
  -- * \param ball the ball index to query; ball indices start at index 0.
  -- * \param dx stores the difference in the x axis position since the last poll.
  -- * \param dy stores the difference in the y axis position since the last poll.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetNumJoystickBalls
  --  

   function SDL_GetJoystickBall
     (joystick : access SDL_Joystick;
      ball : int;
      dx : access int;
      dy : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1193
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickBall";

  --*
  -- * Get the current state of a POV hat on a joystick.
  -- *
  -- * The returned value will be one of the `SDL_HAT_*` values.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \param hat the hat index to get the state from; indices start at index 0.
  -- * \returns the current hat position.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetNumJoystickHats
  --  

   function SDL_GetJoystickHat (joystick : access SDL_Joystick; hat : int) return SDL3_SDL_stdinc_h.Uint8  -- /usr/local/include/SDL3/SDL_joystick.h:1210
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickHat";

  --*
  -- * Get the current state of a button on a joystick.
  -- *
  -- * \param joystick an SDL_Joystick structure containing joystick information.
  -- * \param button the button index to get the state from; indices start at
  -- *               index 0.
  -- * \returns true if the button is pressed, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetNumJoystickButtons
  --  

   function SDL_GetJoystickButton (joystick : access SDL_Joystick; button : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1236
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickButton";

  --*
  -- * Start a rumble effect.
  -- *
  -- * Each call to this function cancels any previous rumble effect, and calling
  -- * it with 0 intensity stops any rumbling.
  -- *
  -- * This function requires you to process SDL events or call
  -- * SDL_UpdateJoysticks() to update rumble state.
  -- *
  -- * \param joystick the joystick to vibrate.
  -- * \param low_frequency_rumble the intensity of the low frequency (left)
  -- *                             rumble motor, from 0 to 0xFFFF.
  -- * \param high_frequency_rumble the intensity of the high frequency (right)
  -- *                              rumble motor, from 0 to 0xFFFF.
  -- * \param duration_ms the duration of the rumble effect, in milliseconds.
  -- * \returns true, or false if rumble isn't supported on this joystick.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_RumbleJoystick
     (joystick : access SDL_Joystick;
      low_frequency_rumble : SDL3_SDL_stdinc_h.Uint16;
      high_frequency_rumble : SDL3_SDL_stdinc_h.Uint16;
      duration_ms : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1259
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RumbleJoystick";

  --*
  -- * Start a rumble effect in the joystick's triggers.
  -- *
  -- * Each call to this function cancels any previous trigger rumble effect, and
  -- * calling it with 0 intensity stops any rumbling.
  -- *
  -- * Note that this is rumbling of the _triggers_ and not the game controller as
  -- * a whole. This is currently only supported on Xbox One controllers. If you
  -- * want the (more common) whole-controller rumble, use SDL_RumbleJoystick()
  -- * instead.
  -- *
  -- * This function requires you to process SDL events or call
  -- * SDL_UpdateJoysticks() to update rumble state.
  -- *
  -- * \param joystick the joystick to vibrate.
  -- * \param left_rumble the intensity of the left trigger rumble motor, from 0
  -- *                    to 0xFFFF.
  -- * \param right_rumble the intensity of the right trigger rumble motor, from 0
  -- *                     to 0xFFFF.
  -- * \param duration_ms the duration of the rumble effect, in milliseconds.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RumbleJoystick
  --  

   function SDL_RumbleJoystickTriggers
     (joystick : access SDL_Joystick;
      left_rumble : SDL3_SDL_stdinc_h.Uint16;
      right_rumble : SDL3_SDL_stdinc_h.Uint16;
      duration_ms : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1290
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RumbleJoystickTriggers";

  --*
  -- * Update a joystick's LED color.
  -- *
  -- * An example of a joystick LED is the light on the back of a PlayStation 4's
  -- * DualShock 4 controller.
  -- *
  -- * For joysticks with a single color LED, the maximum of the RGB values will
  -- * be used as the LED brightness.
  -- *
  -- * \param joystick the joystick to update.
  -- * \param red the intensity of the red LED.
  -- * \param green the intensity of the green LED.
  -- * \param blue the intensity of the blue LED.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SetJoystickLED
     (joystick : access SDL_Joystick;
      red : SDL3_SDL_stdinc_h.Uint8;
      green : SDL3_SDL_stdinc_h.Uint8;
      blue : SDL3_SDL_stdinc_h.Uint8) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1312
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetJoystickLED";

  --*
  -- * Send a joystick specific effect packet.
  -- *
  -- * \param joystick the joystick to affect.
  -- * \param data the data to send to the joystick.
  -- * \param size the size of the data to send to the joystick.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SendJoystickEffect
     (joystick : access SDL_Joystick;
      data : System.Address;
      size : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_joystick.h:1327
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SendJoystickEffect";

  --*
  -- * Close a joystick previously opened with SDL_OpenJoystick().
  -- *
  -- * \param joystick the joystick device to close.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_OpenJoystick
  --  

   procedure SDL_CloseJoystick (joystick : access SDL_Joystick)  -- /usr/local/include/SDL3/SDL_joystick.h:1340
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CloseJoystick";

  --*
  -- * Get the connection state of a joystick.
  -- *
  -- * \param joystick the joystick to query.
  -- * \returns the connection state on success or
  -- *          `SDL_JOYSTICK_CONNECTION_INVALID` on failure; call SDL_GetError()
  -- *          for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickConnectionState (joystick : access SDL_Joystick) return SDL_JoystickConnectionState  -- /usr/local/include/SDL3/SDL_joystick.h:1354
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickConnectionState";

  --*
  -- * Get the battery state of a joystick.
  -- *
  -- * You should never take a battery status as absolute truth. Batteries
  -- * (especially failing batteries) are delicate hardware, and the values
  -- * reported here are best estimates based on what that hardware reports. It's
  -- * not uncommon for older batteries to lose stored power much faster than it
  -- * reports, or completely drain when reporting it has 20 percent left, etc.
  -- *
  -- * \param joystick the joystick to query.
  -- * \param percent a pointer filled in with the percentage of battery life
  -- *                left, between 0 and 100, or NULL to ignore. This will be
  -- *                filled in with -1 we can't determine a value or there is no
  -- *                battery.
  -- * \returns the current battery state or `SDL_POWERSTATE_ERROR` on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetJoystickPowerInfo (joystick : access SDL_Joystick; percent : access int) return SDL3_SDL_power_h.SDL_PowerState  -- /usr/local/include/SDL3/SDL_joystick.h:1377
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetJoystickPowerInfo";

  -- Ends C function definitions when using C++  
end SDL3_SDL_joystick_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
