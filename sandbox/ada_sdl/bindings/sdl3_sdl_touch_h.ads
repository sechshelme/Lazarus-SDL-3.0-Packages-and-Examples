pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Strings;
with System;

package SDL3_SDL_touch_h is

   --  unsupported macro: SDL_TOUCH_MOUSEID ((SDL_MouseID)-1)
   --  unsupported macro: SDL_MOUSE_TOUCHID ((SDL_TouchID)-1)
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
  -- * # CategoryTouch
  -- *
  -- * SDL offers touch input, on platforms that support it. It can manage
  -- * multiple touch devices and track multiple fingers on those devices.
  -- *
  -- * Touches are mostly dealt with through the event system, in the
  -- * SDL_EVENT_FINGER_DOWN, SDL_EVENT_FINGER_MOTION, and SDL_EVENT_FINGER_UP
  -- * events, but there are also functions to query for hardware details, etc.
  -- *
  -- * The touch system, by default, will also send virtual mouse events; this can
  -- * be useful for making a some desktop apps work on a phone without
  -- * significant changes. For apps that care about mouse and touch input
  -- * separately, they should ignore mouse events that have a `which` field of
  -- * SDL_TOUCH_MOUSEID.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * A unique ID for a touch device.
  -- *
  -- * This ID is valid for the time the device is connected to the system, and is
  -- * never reused for the lifetime of the application.
  -- *
  -- * The value 0 is an invalid ID.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_TouchID is SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_touch.h:62

  --*
  -- * A unique ID for a single finger on a touch device.
  -- *
  -- * This ID is valid for the time the finger (stylus, etc) is touching and will
  -- * be unique for all fingers currently in contact, so this ID tracks the
  -- * lifetime of a single continuous touch. This value may represent an index, a
  -- * pointer, or some other unique ID, depending on the platform.
  -- *
  -- * The value 0 is an invalid ID.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_FingerID is SDL3_SDL_stdinc_h.Uint64;  -- /usr/local/include/SDL3/SDL_touch.h:76

  --*
  -- * An enum that describes the type of a touch device.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   subtype SDL_TouchDeviceType is int;
   SDL_TouchDeviceType_SDL_TOUCH_DEVICE_INVALID : constant SDL_TouchDeviceType := -1;
   SDL_TouchDeviceType_SDL_TOUCH_DEVICE_DIRECT : constant SDL_TouchDeviceType := 0;
   SDL_TouchDeviceType_SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE : constant SDL_TouchDeviceType := 1;
   SDL_TouchDeviceType_SDL_TOUCH_DEVICE_INDIRECT_RELATIVE : constant SDL_TouchDeviceType := 2;  -- /usr/local/include/SDL3/SDL_touch.h:83

  --*< touch screen with window-relative coordinates  
  --*< trackpad with absolute device coordinates  
  --*< trackpad with screen cursor-relative coordinates  
  --*
  -- * Data about a single finger in a multitouch event.
  -- *
  -- * Each touch event is a collection of fingers that are simultaneously in
  -- * contact with the touch device (so a "touch" can be a "multitouch," in
  -- * reality), and this struct reports details of the specific fingers.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetTouchFingers
  --  

  --*< the finger ID  
   type SDL_Finger is record
      id : aliased SDL_FingerID;  -- /usr/local/include/SDL3/SDL_touch.h:104
      x : aliased float;  -- /usr/local/include/SDL3/SDL_touch.h:105
      y : aliased float;  -- /usr/local/include/SDL3/SDL_touch.h:106
      pressure : aliased float;  -- /usr/local/include/SDL3/SDL_touch.h:107
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_touch.h:102

  --*< the x-axis location of the touch event, normalized (0...1)  
  --*< the y-axis location of the touch event, normalized (0...1)  
  --*< the quantity of pressure applied, normalized (0...1)  
  --*
  -- * The SDL_MouseID for mouse events simulated with touch input.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * The SDL_TouchID for touch events simulated with mouse input.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Get a list of registered touch devices.
  -- *
  -- * On some platforms SDL first sees the touch device if it was actually used.
  -- * Therefore the returned list might be empty, although devices are available.
  -- * After using all devices at least once the number will be correct.
  -- *
  -- * \param count a pointer filled in with the number of devices returned, may
  -- *              be NULL.
  -- * \returns a 0 terminated array of touch device IDs or NULL on failure; call
  -- *          SDL_GetError() for more information. This should be freed with
  -- *          SDL_free() when it is no longer needed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTouchDevices (count : access int) return access SDL_TouchID  -- /usr/local/include/SDL3/SDL_touch.h:140
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTouchDevices";

  --*
  -- * Get the touch device name as reported from the driver.
  -- *
  -- * \param touchID the touch device instance ID.
  -- * \returns touch device name, or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTouchDeviceName (touchID : SDL_TouchID) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_touch.h:151
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTouchDeviceName";

  --*
  -- * Get the type of the given touch device.
  -- *
  -- * \param touchID the ID of a touch device.
  -- * \returns touch device type.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTouchDeviceType (touchID : SDL_TouchID) return SDL_TouchDeviceType  -- /usr/local/include/SDL3/SDL_touch.h:161
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTouchDeviceType";

  --*
  -- * Get a list of active fingers for a given touch device.
  -- *
  -- * \param touchID the ID of a touch device.
  -- * \param count a pointer filled in with the number of fingers returned, can
  -- *              be NULL.
  -- * \returns a NULL terminated array of SDL_Finger pointers or NULL on failure;
  -- *          call SDL_GetError() for more information. This is a single
  -- *          allocation that should be freed with SDL_free() when it is no
  -- *          longer needed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetTouchFingers (touchID : SDL_TouchID; count : access int) return System.Address  -- /usr/local/include/SDL3/SDL_touch.h:176
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetTouchFingers";

  -- Ends C function definitions when using C++  
end SDL3_SDL_touch_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
