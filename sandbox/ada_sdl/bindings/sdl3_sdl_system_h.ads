pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Extensions;
with SDL3_SDL_stdinc_h;

package SDL3_SDL_system_h is

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
  -- * # CategorySystem
  -- *
  -- * Platform-specific SDL API functions. These are functions that deal with
  -- * needs of specific operating systems, that didn't make sense to offer as
  -- * platform-independent, generic APIs.
  -- *
  -- * Most apps can make do without these functions, but they can be useful for
  -- * integrating with other parts of a specific system, adding platform-specific
  -- * polish to an app, or solving problems that only affect one target.
  --  

  -- Set up for C function definitions, even when using C++  
  -- * Platform specific functions for Windows
  --  

  --*
  -- * A callback to be used with SDL_SetWindowsMessageHook.
  -- *
  -- * This callback may modify the message, and should return true if the message
  -- * should continue to be processed, or false to prevent further processing.
  -- *
  -- * As this is processing a message directly from the Windows event loop, this
  -- * callback should do the minimum required work and return quickly.
  -- *
  -- * \param userdata the app-defined pointer provided to
  -- *                 SDL_SetWindowsMessageHook.
  -- * \param msg a pointer to a Win32 event structure to process.
  -- * \returns true to let event continue on, false to drop it.
  -- *
  -- * \threadsafety This may only be called (by SDL) from the thread handling the
  -- *               Windows event loop.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetWindowsMessageHook
  -- * \sa SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP
  --  

  --*
  -- * Set a callback for every Windows message, run before TranslateMessage().
  -- *
  -- * The callback may modify the message, and should return true if the message
  -- * should continue to be processed, or false to prevent further processing.
  -- *
  -- * \param callback the SDL_WindowsMessageHook function to call.
  -- * \param userdata a pointer to pass to every iteration of `callback`.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_WindowsMessageHook
  -- * \sa SDL_HINT_WINDOWS_ENABLE_MESSAGELOOP
  --  

  --*
  -- * Get the D3D9 adapter index that matches the specified display.
  -- *
  -- * The returned adapter index can be passed to `IDirect3D9::CreateDevice` and
  -- * controls on which monitor a full screen application will appear.
  -- *
  -- * \param displayID the instance of the display to query.
  -- * \returns the D3D9 adapter index on success or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Get the DXGI Adapter and Output indices for the specified display.
  -- *
  -- * The DXGI Adapter and Output indices can be passed to `EnumAdapters` and
  -- * `EnumOutputs` respectively to get the objects required to create a DX10 or
  -- * DX11 device and swap chain.
  -- *
  -- * \param displayID the instance of the display to query.
  -- * \param adapterIndex a pointer to be filled in with the adapter index.
  -- * \param outputIndex a pointer to be filled in with the output index.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  -- * Platform specific functions for UNIX
  --  

  -- this is defined in Xlib's headers, just need a simple declaration here.  
   type u_XEvent is null record;   -- incomplete struct

   subtype XEvent is u_XEvent;  -- /usr/local/include/SDL3/SDL_system.h:139

  --*
  -- * A callback to be used with SDL_SetX11EventHook.
  -- *
  -- * This callback may modify the event, and should return true if the event
  -- * should continue to be processed, or false to prevent further processing.
  -- *
  -- * As this is processing an event directly from the X11 event loop, this
  -- * callback should do the minimum required work and return quickly.
  -- *
  -- * \param userdata the app-defined pointer provided to SDL_SetX11EventHook.
  -- * \param xevent a pointer to an Xlib XEvent union to process.
  -- * \returns true to let event continue on, false to drop it.
  -- *
  -- * \threadsafety This may only be called (by SDL) from the thread handling the
  -- *               X11 event loop.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetX11EventHook
  --  

   type SDL_X11EventHook is access function (arg1 : System.Address; arg2 : access XEvent) return Extensions.bool
   with Convention => C;  -- /usr/local/include/SDL3/SDL_system.h:161

  --*
  -- * Set a callback for every X11 event.
  -- *
  -- * The callback may modify the event, and should return true if the event
  -- * should continue to be processed, or false to prevent further processing.
  -- *
  -- * \param callback the SDL_X11EventHook function to call.
  -- * \param userdata a pointer to pass to every iteration of `callback`.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_SetX11EventHook (callback : SDL_X11EventHook; userdata : System.Address)  -- /usr/local/include/SDL3/SDL_system.h:174
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetX11EventHook";

  -- Platform specific functions for Linux 
  --*
  -- * Sets the UNIX nice value for a thread.
  -- *
  -- * This uses setpriority() if possible, and RealtimeKit if available.
  -- *
  -- * \param threadID the Unix thread ID to change priority of.
  -- * \param priority the new, Unix-specific, priority value.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SetLinuxThreadPriority (threadID : SDL3_SDL_stdinc_h.Sint64; priority : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_system.h:191
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetLinuxThreadPriority";

  --*
  -- * Sets the priority (not nice level) and scheduling policy for a thread.
  -- *
  -- * This uses setpriority() if possible, and RealtimeKit if available.
  -- *
  -- * \param threadID the Unix thread ID to change priority of.
  -- * \param sdlPriority the new SDL_ThreadPriority value.
  -- * \param schedPolicy the new scheduling policy (SCHED_FIFO, SCHED_RR,
  -- *                    SCHED_OTHER, etc...).
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_SetLinuxThreadPriorityAndPolicy
     (threadID : SDL3_SDL_stdinc_h.Sint64;
      sdlPriority : int;
      schedPolicy : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_system.h:207
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetLinuxThreadPriorityAndPolicy";

  -- * Platform specific functions for iOS
  --  

  --*
  -- * The prototype for an Apple iOS animation callback.
  -- *
  -- * This datatype is only useful on Apple iOS.
  -- *
  -- * After passing a function pointer of this type to
  -- * SDL_SetiOSAnimationCallback, the system will call that function pointer at
  -- * a regular interval.
  -- *
  -- * \param userdata what was passed as `callbackParam` to
  -- *                 SDL_SetiOSAnimationCallback as `callbackParam`.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetiOSAnimationCallback
  --  

  --*
  -- * Use this function to set the animation callback on Apple iOS.
  -- *
  -- * The function prototype for `callback` is:
  -- *
  -- * ```c
  -- * void callback(void *callbackParam);
  -- * ```
  -- *
  -- * Where its parameter, `callbackParam`, is what was passed as `callbackParam`
  -- * to SDL_SetiOSAnimationCallback().
  -- *
  -- * This function is only available on Apple iOS.
  -- *
  -- * For more information see:
  -- *
  -- * https://wiki.libsdl.org/SDL3/README-ios
  -- *
  -- * Note that if you use the "main callbacks" instead of a standard C `main`
  -- * function, you don't have to use this API, as SDL will manage this for you.
  -- *
  -- * Details on main callbacks are here:
  -- *
  -- * https://wiki.libsdl.org/SDL3/README-main-functions
  -- *
  -- * \param window the window for which the animation callback should be set.
  -- * \param interval the number of frames after which **callback** will be
  -- *                 called.
  -- * \param callback the function to call for every frame.
  -- * \param callbackParam a pointer that is passed to `callback`.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetiOSEventPump
  --  

  --*
  -- * Use this function to enable or disable the SDL event pump on Apple iOS.
  -- *
  -- * This function is only available on Apple iOS.
  -- *
  -- * \param enabled true to enable the event pump, false to disable it.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetiOSAnimationCallback
  --  

  -- * Platform specific functions for Android
  --  

  --*
  -- * Get the Android Java Native Interface Environment of the current thread.
  -- *
  -- * This is the JNIEnv one needs to access the Java virtual machine from native
  -- * code, and is needed for many Android APIs to be usable from C.
  -- *
  -- * The prototype of the function in SDL's code actually declare a void* return
  -- * type, even if the implementation returns a pointer to a JNIEnv. The
  -- * rationale being that the SDL headers can avoid including jni.h.
  -- *
  -- * \returns a pointer to Java native interface object (JNIEnv) to which the
  -- *          current thread is attached, or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAndroidActivity
  --  

  --*
  -- * Retrieve the Java instance of the Android activity class.
  -- *
  -- * The prototype of the function in SDL's code actually declares a void*
  -- * return type, even if the implementation returns a jobject. The rationale
  -- * being that the SDL headers can avoid including jni.h.
  -- *
  -- * The jobject returned by the function is a local reference and must be
  -- * released by the caller. See the PushLocalFrame() and PopLocalFrame() or
  -- * DeleteLocalRef() functions of the Java native interface:
  -- *
  -- * https://docs.oracle.com/javase/1.5.0/docs/guide/jni/spec/functions.html
  -- *
  -- * \returns the jobject representing the instance of the Activity class of the
  -- *          Android application, or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAndroidJNIEnv
  --  

  --*
  -- * Query Android API level of the current device.
  -- *
  -- * - API level 35: Android 15 (VANILLA_ICE_CREAM)
  -- * - API level 34: Android 14 (UPSIDE_DOWN_CAKE)
  -- * - API level 33: Android 13 (TIRAMISU)
  -- * - API level 32: Android 12L (S_V2)
  -- * - API level 31: Android 12 (S)
  -- * - API level 30: Android 11 (R)
  -- * - API level 29: Android 10 (Q)
  -- * - API level 28: Android 9 (P)
  -- * - API level 27: Android 8.1 (O_MR1)
  -- * - API level 26: Android 8.0 (O)
  -- * - API level 25: Android 7.1 (N_MR1)
  -- * - API level 24: Android 7.0 (N)
  -- * - API level 23: Android 6.0 (M)
  -- * - API level 22: Android 5.1 (LOLLIPOP_MR1)
  -- * - API level 21: Android 5.0 (LOLLIPOP, L)
  -- * - API level 20: Android 4.4W (KITKAT_WATCH)
  -- * - API level 19: Android 4.4 (KITKAT)
  -- * - API level 18: Android 4.3 (JELLY_BEAN_MR2)
  -- * - API level 17: Android 4.2 (JELLY_BEAN_MR1)
  -- * - API level 16: Android 4.1 (JELLY_BEAN)
  -- * - API level 15: Android 4.0.3 (ICE_CREAM_SANDWICH_MR1)
  -- * - API level 14: Android 4.0 (ICE_CREAM_SANDWICH)
  -- * - API level 13: Android 3.2 (HONEYCOMB_MR2)
  -- * - API level 12: Android 3.1 (HONEYCOMB_MR1)
  -- * - API level 11: Android 3.0 (HONEYCOMB)
  -- * - API level 10: Android 2.3.3 (GINGERBREAD_MR1)
  -- *
  -- * \returns the Android API level.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Query if the application is running on a Chromebook.
  -- *
  -- * \returns true if this is a Chromebook, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Query if the application is running on a Samsung DeX docking station.
  -- *
  -- * \returns true if this is a DeX docking station, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Trigger the Android system back button behavior.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * See the official Android developer guide for more information:
  -- * http://developer.android.com/guide/topics/data/data-storage.html
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * See the official Android developer guide for more information:
  -- * http://developer.android.com/guide/topics/data/data-storage.html
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Get the path used for internal storage for this Android application.
  -- *
  -- * This path is unique to your application and cannot be written to by other
  -- * applications.
  -- *
  -- * Your internal storage path is typically:
  -- * `/data/data/your.app.package/files`.
  -- *
  -- * This is a C wrapper over `android.content.Context.getFilesDir()`:
  -- *
  -- * https://developer.android.com/reference/android/content/Context#getFilesDir()
  -- *
  -- * \returns the path used for internal storage or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAndroidExternalStoragePath
  -- * \sa SDL_GetAndroidCachePath
  --  

  --*
  -- * Get the current state of external storage for this Android application.
  -- *
  -- * The current state of external storage, a bitmask of these values:
  -- * `SDL_ANDROID_EXTERNAL_STORAGE_READ`, `SDL_ANDROID_EXTERNAL_STORAGE_WRITE`.
  -- *
  -- * If external storage is currently unavailable, this will return 0.
  -- *
  -- * \returns the current state of external storage, or 0 if external storage is
  -- *          currently unavailable.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAndroidExternalStoragePath
  --  

  --*
  -- * Get the path used for external storage for this Android application.
  -- *
  -- * This path is unique to your application, but is public and can be written
  -- * to by other applications.
  -- *
  -- * Your external storage path is typically:
  -- * `/storage/sdcard0/Android/data/your.app.package/files`.
  -- *
  -- * This is a C wrapper over `android.content.Context.getExternalFilesDir()`:
  -- *
  -- * https://developer.android.com/reference/android/content/Context#getExternalFilesDir()
  -- *
  -- * \returns the path used for external storage for this application on success
  -- *          or NULL on failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAndroidExternalStorageState
  -- * \sa SDL_GetAndroidInternalStoragePath
  -- * \sa SDL_GetAndroidCachePath
  --  

  --*
  -- * Get the path used for caching data for this Android application.
  -- *
  -- * This path is unique to your application, but is public and can be written
  -- * to by other applications.
  -- *
  -- * Your cache path is typically: `/data/data/your.app.package/cache/`.
  -- *
  -- * This is a C wrapper over `android.content.Context.getCacheDir()`:
  -- *
  -- * https://developer.android.com/reference/android/content/Context#getCacheDir()
  -- *
  -- * \returns the path used for caches for this application on success or NULL
  -- *          on failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAndroidInternalStoragePath
  -- * \sa SDL_GetAndroidExternalStoragePath
  --  

  --*
  -- * Callback that presents a response from a SDL_RequestAndroidPermission call.
  -- *
  -- * \param userdata an app-controlled pointer that is passed to the callback.
  -- * \param permission the Android-specific permission name that was requested.
  -- * \param granted true if permission is granted, false if denied.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RequestAndroidPermission
  --  

  --*
  -- * Request permissions at runtime, asynchronously.
  -- *
  -- * You do not need to call this for built-in functionality of SDL; recording
  -- * from a microphone or reading images from a camera, using standard SDL APIs,
  -- * will manage permission requests for you.
  -- *
  -- * This function never blocks. Instead, the app-supplied callback will be
  -- * called when a decision has been made. This callback may happen on a
  -- * different thread, and possibly much later, as it might wait on a user to
  -- * respond to a system dialog. If permission has already been granted for a
  -- * specific entitlement, the callback will still fire, probably on the current
  -- * thread and before this function returns.
  -- *
  -- * If the request submission fails, this function returns -1 and the callback
  -- * will NOT be called, but this should only happen in catastrophic conditions,
  -- * like memory running out. Normally there will be a yes or no to the request
  -- * through the callback.
  -- *
  -- * For the `permission` parameter, choose a value from here:
  -- *
  -- * https://developer.android.com/reference/android/Manifest.permission
  -- *
  -- * \param permission the permission to request.
  -- * \param cb the callback to trigger when the request has a response.
  -- * \param userdata an app-controlled pointer that is passed to the callback.
  -- * \returns true if the request was submitted, false if there was an error
  -- *          submitting. The result of the request is only ever reported
  -- *          through the callback, not this return value.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Shows an Android toast notification.
  -- *
  -- * Toasts are a sort of lightweight notification that are unique to Android.
  -- *
  -- * https://developer.android.com/guide/topics/ui/notifiers/toasts
  -- *
  -- * Shows toast in UI thread.
  -- *
  -- * For the `gravity` parameter, choose a value from here, or -1 if you don't
  -- * have a preference:
  -- *
  -- * https://developer.android.com/reference/android/view/Gravity
  -- *
  -- * \param message text message to be shown.
  -- * \param duration 0=short, 1=long.
  -- * \param gravity where the notification should appear on the screen.
  -- * \param xoffset set this parameter only when gravity >=0.
  -- * \param yoffset set this parameter only when gravity >=0.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Send a user command to SDLActivity.
  -- *
  -- * Override "boolean onUnhandledMessage(Message msg)" to handle the message.
  -- *
  -- * \param command user command that must be greater or equal to 0x8000.
  -- * \param param user parameter.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Query if the current device is a tablet.
  -- *
  -- * If SDL can't determine this, it will return false.
  -- *
  -- * \returns true if the device is a tablet, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_IsTablet return Extensions.bool  -- /usr/local/include/SDL3/SDL_system.h:610
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsTablet";

  --*
  -- * Query if the current device is a TV.
  -- *
  -- * If SDL can't determine this, it will return false.
  -- *
  -- * \returns true if the device is a TV, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_IsTV return Extensions.bool  -- /usr/local/include/SDL3/SDL_system.h:621
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsTV";

  --*
  -- * Application sandbox environment.
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_Sandbox is 
     (SDL_SANDBOX_NONE,
      SDL_SANDBOX_UNKNOWN_CONTAINER,
      SDL_SANDBOX_FLATPAK,
      SDL_SANDBOX_SNAP,
      SDL_SANDBOX_MACOS)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_system.h:628

  --*
  -- * Get the application sandbox environment, if any.
  -- *
  -- * \returns the application sandbox environment or SDL_SANDBOX_NONE if the
  -- *          application is not running in a sandbox environment.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetSandbox return SDL_Sandbox  -- /usr/local/include/SDL3/SDL_system.h:645
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetSandbox";

  -- Functions used by iOS app delegates to notify SDL about state changes.  
  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationWillTerminate.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_OnApplicationWillTerminate  -- /usr/local/include/SDL3/SDL_system.h:665
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OnApplicationWillTerminate";

  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationDidReceiveMemoryWarning.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_OnApplicationDidReceiveMemoryWarning  -- /usr/local/include/SDL3/SDL_system.h:682
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OnApplicationDidReceiveMemoryWarning";

  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationWillResignActive.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_OnApplicationWillEnterBackground  -- /usr/local/include/SDL3/SDL_system.h:699
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OnApplicationWillEnterBackground";

  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationDidEnterBackground.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_OnApplicationDidEnterBackground  -- /usr/local/include/SDL3/SDL_system.h:716
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OnApplicationDidEnterBackground";

  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationWillEnterForeground.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_OnApplicationWillEnterForeground  -- /usr/local/include/SDL3/SDL_system.h:733
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OnApplicationWillEnterForeground";

  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationDidBecomeActive.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_OnApplicationDidEnterForeground  -- /usr/local/include/SDL3/SDL_system.h:750
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OnApplicationDidEnterForeground";

  --*
  -- * Let iOS apps with external event handling report
  -- * onApplicationDidChangeStatusBarOrientation.
  -- *
  -- * This functions allows iOS apps that have their own event handling to hook
  -- * into SDL to generate SDL events. This maps directly to an iOS-specific
  -- * event, but since it doesn't do anything iOS-specific internally, it is
  -- * available on all platforms, in case it might be useful for some specific
  -- * paradigm. Most apps do not need to use this directly; SDL's internal event
  -- * code will handle all this for windows created by SDL_CreateWindow!
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  -- * Functions used only by GDK
  --  

  --*
  -- * Gets a reference to the global async task queue handle for GDK,
  -- * initializing if needed.
  -- *
  -- * Once you are done with the task queue, you should call
  -- * XTaskQueueCloseHandle to reduce the reference count to avoid a resource
  -- * leak.
  -- *
  -- * \param outTaskQueue a pointer to be filled in with task queue handle.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  --*
  -- * Gets a reference to the default user handle for GDK.
  -- *
  -- * This is effectively a synchronous version of XUserAddAsync, which always
  -- * prefers the default user and allows a sign-in UI.
  -- *
  -- * \param outUserHandle a pointer to be filled in with the default user
  -- *                      handle.
  -- * \returns true if success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

  -- Ends C function definitions when using C++  
end SDL3_SDL_system_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
