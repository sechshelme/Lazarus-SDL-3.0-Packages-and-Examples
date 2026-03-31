pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with System;

package SDL3_SDL_assert_h is

   SDL_ASSERT_LEVEL : constant := 2;  --  /usr/local/include/SDL3/SDL_assert.h:101
   --  arg-macro: procedure SDL_TriggerBreakpoint ()
   --    __builtin_trap()
   --  unsupported macro: SDL_FUNCTION __func__
   --  unsupported macro: SDL_FILE __FILE_NAME__
   --  unsupported macro: SDL_ASSERT_FILE SDL_FILE
   --  unsupported macro: SDL_LINE __LINE__

   SDL_NULL_WHILE_LOOP_CONDITION : constant := (0);  --  /usr/local/include/SDL3/SDL_assert.h:271
   --  arg-macro: procedure SDL_disabled_assert (condition)
   --    do { (void) sizeof ((condition)); } while (SDL_NULL_WHILE_LOOP_CONDITION)
   --  arg-macro: procedure SDL_AssertBreakpoint ()
   --    SDL_TriggerBreakpoint()
   --  unsupported macro: SDL_enabled_assert(condition) do { while ( !(condition) ) { static struct SDL_AssertData sdl_assert_data = { false, 0, #condition, NULL, 0, NULL, NULL }; const SDL_AssertState sdl_assert_state = SDL_ReportAssertion(&sdl_assert_data, SDL_FUNCTION, SDL_ASSERT_FILE, SDL_LINE); if (sdl_assert_state == SDL_ASSERTION_RETRY) { continue; } else if (sdl_assert_state == SDL_ASSERTION_BREAK) { SDL_AssertBreakpoint(); } break; } } while (SDL_NULL_WHILE_LOOP_CONDITION)
   --  arg-macro: procedure SDL_assert (condition)
   --    SDL_enabled_assert(condition)
   --  arg-macro: procedure SDL_assert_release (condition)
   --    SDL_enabled_assert(condition)
   --  arg-macro: procedure SDL_assert_paranoid (condition)
   --    SDL_disabled_assert(condition)
   --  arg-macro: procedure SDL_assert_always (condition)
   --    SDL_enabled_assert(condition)

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
  -- * # CategoryAssert
  -- *
  -- * A helpful assertion macro!
  -- *
  -- * SDL assertions operate like your usual `assert` macro, but with some added
  -- * features:
  -- *
  -- * - It uses a trick with the `sizeof` operator, so disabled assertions
  -- *   vaporize out of the compiled code, but variables only referenced in the
  -- *   assertion won't trigger compiler warnings about being unused.
  -- * - It is safe to use with a dangling-else: `if (x) SDL_assert(y); else
  -- *   do_something();`
  -- * - It works the same everywhere, instead of counting on various platforms'
  -- *   compiler and C runtime to behave.
  -- * - It provides multiple levels of assertion (SDL_assert, SDL_assert_release,
  -- *   SDL_assert_paranoid) instead of a single all-or-nothing option.
  -- * - It offers a variety of responses when an assertion fails (retry, trigger
  -- *   the debugger, abort the program, ignore the failure once, ignore it for
  -- *   the rest of the program's run).
  -- * - It tries to show the user a dialog by default, if possible, but the app
  -- *   can provide a callback to handle assertion failures however they like.
  -- * - It lets failed assertions be retried. Perhaps you had a network failure
  -- *   and just want to retry the test after plugging your network cable back
  -- *   in? You can.
  -- * - It lets the user ignore an assertion failure, if there's a harmless
  -- *   problem that one can continue past.
  -- * - It lets the user mark an assertion as ignored for the rest of the
  -- *   program's run; if there's a harmless problem that keeps popping up.
  -- * - It provides statistics and data on all failed assertions to the app.
  -- * - It allows the default assertion handler to be controlled with environment
  -- *   variables, in case an automated script needs to control it.
  -- * - It can be used as an aid to Clang's static analysis; it will treat SDL
  -- *   assertions as universally true (under the assumption that you are serious
  -- *   about the asserted claims and that your debug builds will detect when
  -- *   these claims were wrong). This can help the analyzer avoid false
  -- *   positives.
  -- *
  -- * To use it: compile a debug build and just sprinkle around tests to check
  -- * your code!
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * The level of assertion aggressiveness.
  -- *
  -- * This value changes depending on compiler options and other preprocessor
  -- * defines.
  -- *
  -- * It is currently one of the following values, but future SDL releases might
  -- * add more:
  -- *
  -- * - 0: All SDL assertion macros are disabled.
  -- * - 1: Release settings: SDL_assert disabled, SDL_assert_release enabled.
  -- * - 2: Debug settings: SDL_assert and SDL_assert_release enabled.
  -- * - 3: Paranoid settings: All SDL assertion macros enabled, including
  -- *   SDL_assert_paranoid.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Attempt to tell an attached debugger to pause.
  -- *
  -- * This allows an app to programmatically halt ("break") the debugger as if it
  -- * had hit a breakpoint, allowing the developer to examine program state, etc.
  -- *
  -- * This is a macro--not a function--so that the debugger breaks on the source
  -- * code line that used SDL_TriggerBreakpoint and not in some random guts of
  -- * SDL. SDL_assert uses this macro for the same reason.
  -- *
  -- * If the program is not running under a debugger, SDL_TriggerBreakpoint will
  -- * likely terminate the app, possibly without warning. If the current platform
  -- * isn't supported, this macro is left undefined.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- Don't include intrin.h here because it contains C++ code  
  -- SDL_TriggerBreakpoint is intentionally left undefined on unknown platforms.  
  --*
  -- * A macro that reports the current function being compiled.
  -- *
  -- * If SDL can't figure how the compiler reports this, it will use "???".
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro that reports the current file being compiled.
  -- *
  -- * This macro is only defined if it isn't already defined, so to override it
  -- * (perhaps with something that doesn't provide path information at all, so
  -- * build machine information doesn't leak into public binaries), apps can
  -- * define this macro before including SDL.h or SDL_assert.h.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A macro that reports the current file being compiled, for use in
  -- * assertions.
  -- *
  -- * This macro is only defined if it isn't already defined, so to override it
  -- * (perhaps with something that doesn't provide path information at all, so
  -- * build machine information doesn't leak into public binaries), apps can
  -- * define this macro before including SDL_assert.h. For example, defining this
  -- * to `""` will make sure no source path information is included in asserts.
  -- *
  -- * \since This macro is available since SDL 3.4.0.
  --  

  --*
  -- * A macro that reports the current line number of the file being compiled.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --sizeof (x) makes the compiler still parse the expression even without
  --assertions enabled, so the code is always checked at compile time, but
  --doesn't actually generate code for it, so there are no side effects or
  --expensive checks at run time, just the constant size of what x WOULD be,
  --which presumably gets optimized out as unused.
  --This also solves the problem of...
  --    int somevalue = blah();
  --    SDL_assert(somevalue == 1);
  --...which would cause compiles to complain that somevalue is unused if we
  --disable assertions.
  -- 

  --*
  -- * A macro for wrapping code in `do {} while (0);` without compiler warnings.
  -- *
  -- * Visual Studio with really aggressive warnings enabled needs this to avoid
  -- * compiler complaints.
  -- *
  -- * the `do {} while (0);` trick is useful for wrapping code in a macro that
  -- * may or may not be a single statement, to avoid various C language
  -- * accidents.
  -- *
  -- * To use:
  -- *
  -- * ```c
  -- * do { SomethingOnce(); } while (SDL_NULL_WHILE_LOOP_CONDITION (0));
  -- * ```
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- "while (0,0)" fools Microsoft's compiler's /W4 warning level into thinking
  --    this condition isn't constant. And looks like an owl's face!  

  --*
  -- * The macro used when an assertion is disabled.
  -- *
  -- * This isn't for direct use by apps, but this is the code that is inserted
  -- * when an SDL_assert is disabled (perhaps in a release build).
  -- *
  -- * The code does nothing, but wraps `condition` in a sizeof operator, which
  -- * generates no code and has no side effects, but avoid compiler warnings
  -- * about unused variables.
  -- *
  -- * \param condition the condition to assert (but not actually run here).
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Possible outcomes from a triggered assertion.
  -- *
  -- * When an enabled assertion triggers, it may call the assertion handler
  -- * (possibly one provided by the app via SDL_SetAssertionHandler), which will
  -- * return one of these values, possibly after asking the user.
  -- *
  -- * Then SDL will respond based on this outcome (loop around to retry the
  -- * condition, try to break in a debugger, kill the program, or ignore the
  -- * problem).
  -- *
  -- * \since This enum is available since SDL 3.2.0.
  --  

   type SDL_AssertState is 
     (SDL_ASSERTION_RETRY,
      SDL_ASSERTION_BREAK,
      SDL_ASSERTION_ABORT,
      SDL_ASSERTION_IGNORE,
      SDL_ASSERTION_ALWAYS_IGNORE)
   with Convention => C;  -- /usr/local/include/SDL3/SDL_assert.h:304

  --*< Retry the assert immediately.  
  --*< Make the debugger trigger a breakpoint.  
  --*< Terminate the program.  
  --*< Ignore the assert.  
  --*< Ignore the assert from now on.  
  --*
  -- * Information about an assertion failure.
  -- *
  -- * This structure is filled in with information about a triggered assertion,
  -- * used by the assertion handler, then added to the assertion report. This is
  -- * returned as a linked list from SDL_GetAssertionReport().
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  --  

  --*< true if app should always continue when assertion is triggered.  
   type SDL_AssertData;
   type SDL_AssertData is record
      always_ignore : aliased Extensions.bool;  -- /usr/local/include/SDL3/SDL_assert.h:324
      trigger_count : aliased unsigned;  -- /usr/local/include/SDL3/SDL_assert.h:325
      condition : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_assert.h:326
      filename : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_assert.h:327
      linenum : aliased int;  -- /usr/local/include/SDL3/SDL_assert.h:328
      c_function : Interfaces.C.Strings.chars_ptr;  -- /usr/local/include/SDL3/SDL_assert.h:329
      next : access constant SDL_AssertData;  -- /usr/local/include/SDL3/SDL_assert.h:330
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_assert.h:322

  --*< Number of times this assertion has been triggered.  
  --*< A string of this assert's test code.  
  --*< The source file where this assert lives.  
  --*< The line in `filename` where this assert lives.  
  --*< The name of the function where this assert lives.  
  --*< next item in the linked list.  
  --*
  -- * Never call this directly.
  -- *
  -- * Use the SDL_assert macros instead.
  -- *
  -- * \param data assert data structure.
  -- * \param func function name.
  -- * \param file file name.
  -- * \param line line number.
  -- * \returns assert state.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_ReportAssertion
     (data : access SDL_AssertData;
      func : Interfaces.C.Strings.chars_ptr;
      file : Interfaces.C.Strings.chars_ptr;
      line : int) return SDL_AssertState  -- /usr/local/include/SDL3/SDL_assert.h:348
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ReportAssertion";

  --*
  -- * The macro used when an assertion triggers a breakpoint.
  -- *
  -- * This isn't for direct use by apps; use SDL_assert or SDL_TriggerBreakpoint
  -- * instead.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- Define this as empty in case assert() is defined as SDL_assert  
  --*
  -- * The macro used when an assertion is enabled.
  -- *
  -- * This isn't for direct use by apps, but this is the code that is inserted
  -- * when an SDL_assert is enabled.
  -- *
  -- * The `do {} while(0)` avoids dangling else problems:
  -- *
  -- * ```c
  -- * if (x) SDL_assert(y); else blah();
  -- * ```
  -- *
  -- * ... without the do/while, the "else" could attach to this macro's "if". We
  -- * try to handle just the minimum we need here in a macro...the loop, the
  -- * static vars, and break points. The heavy lifting is handled in
  -- * SDL_ReportAssertion().
  -- *
  -- * \param condition the condition to assert.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * An assertion test that is normally performed only in debug builds.
  -- *
  -- * This macro is enabled when the SDL_ASSERT_LEVEL is >= 2, otherwise it is
  -- * disabled. This is meant to only do these tests in debug builds, so they can
  -- * tend to be more expensive, and they are meant to bring everything to a halt
  -- * when they fail, with the programmer there to assess the problem.
  -- *
  -- * In short: you can sprinkle these around liberally and assume they will
  -- * evaporate out of the build when building for end-users.
  -- *
  -- * When assertions are disabled, this wraps `condition` in a `sizeof`
  -- * operator, which means any function calls and side effects will not run, but
  -- * the compiler will not complain about any otherwise-unused variables that
  -- * are only referenced in the assertion.
  -- *
  -- * One can set the environment variable "SDL_ASSERT" to one of several strings
  -- * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
  -- * behavior, which may be desirable for automation purposes. If your platform
  -- * requires GUI interfaces to happen on the main thread but you're debugging
  -- * an assertion in a background thread, it might be desirable to set this to
  -- * "break" so that your debugger takes control as soon as assert is triggered,
  -- * instead of risking a bad UI interaction (deadlock, etc) in the application.
  -- *
  -- * \param condition boolean value to test.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * An assertion test that is performed even in release builds.
  -- *
  -- * This macro is enabled when the SDL_ASSERT_LEVEL is >= 1, otherwise it is
  -- * disabled. This is meant to be for tests that are cheap to make and
  -- * extremely unlikely to fail; generally it is frowned upon to have an
  -- * assertion failure in a release build, so these assertions generally need to
  -- * be of more than life-and-death importance if there's a chance they might
  -- * trigger. You should almost always consider handling these cases more
  -- * gracefully than an assert allows.
  -- *
  -- * When assertions are disabled, this wraps `condition` in a `sizeof`
  -- * operator, which means any function calls and side effects will not run, but
  -- * the compiler will not complain about any otherwise-unused variables that
  -- * are only referenced in the assertion.
  -- *
  -- * One can set the environment variable "SDL_ASSERT" to one of several strings
  -- * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
  -- * behavior, which may be desirable for automation purposes. If your platform
  -- * requires GUI interfaces to happen on the main thread but you're debugging
  -- * an assertion in a background thread, it might be desirable to set this to
  -- * "break" so that your debugger takes control as soon as assert is triggered,
  -- * instead of risking a bad UI interaction (deadlock, etc) in the application.
  -- * *
  -- *
  -- * \param condition boolean value to test.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * An assertion test that is performed only when built with paranoid settings.
  -- *
  -- * This macro is enabled when the SDL_ASSERT_LEVEL is >= 3, otherwise it is
  -- * disabled. This is a higher level than both release and debug, so these
  -- * tests are meant to be expensive and only run when specifically looking for
  -- * extremely unexpected failure cases in a special build.
  -- *
  -- * When assertions are disabled, this wraps `condition` in a `sizeof`
  -- * operator, which means any function calls and side effects will not run, but
  -- * the compiler will not complain about any otherwise-unused variables that
  -- * are only referenced in the assertion.
  -- *
  -- * One can set the environment variable "SDL_ASSERT" to one of several strings
  -- * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
  -- * behavior, which may be desirable for automation purposes. If your platform
  -- * requires GUI interfaces to happen on the main thread but you're debugging
  -- * an assertion in a background thread, it might be desirable to set this to
  -- * "break" so that your debugger takes control as soon as assert is triggered,
  -- * instead of risking a bad UI interaction (deadlock, etc) in the application.
  -- *
  -- * \param condition boolean value to test.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- Enable various levels of assertions.  
  --*
  -- * An assertion test that is always performed.
  -- *
  -- * This macro is always enabled no matter what SDL_ASSERT_LEVEL is set to. You
  -- * almost never want to use this, as it could trigger on an end-user's system,
  -- * crashing your program.
  -- *
  -- * One can set the environment variable "SDL_ASSERT" to one of several strings
  -- * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
  -- * behavior, which may be desirable for automation purposes. If your platform
  -- * requires GUI interfaces to happen on the main thread but you're debugging
  -- * an assertion in a background thread, it might be desirable to set this to
  -- * "break" so that your debugger takes control as soon as assert is triggered,
  -- * instead of risking a bad UI interaction (deadlock, etc) in the application.
  -- *
  -- * \param condition boolean value to test.
  -- *
  -- * \threadsafety It is safe to call this macro from any thread.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * A callback that fires when an SDL assertion fails.
  -- *
  -- * \param data a pointer to the SDL_AssertData structure corresponding to the
  -- *             current assertion.
  -- * \param userdata what was passed as `userdata` to SDL_SetAssertionHandler().
  -- * \returns an SDL_AssertState value indicating how to handle the failure.
  -- *
  -- * \threadsafety This callback may be called from any thread that triggers an
  -- *               assert at any time.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   type SDL_AssertionHandler is access function (arg1 : access constant SDL_AssertData; arg2 : System.Address) return SDL_AssertState
   with Convention => C;  -- /usr/local/include/SDL3/SDL_assert.h:563

  --*
  -- * Set an application-defined assertion handler.
  -- *
  -- * This function allows an application to show its own assertion UI and/or
  -- * force the response to an assertion failure. If the application doesn't
  -- * provide this, SDL will try to do the right thing, popping up a
  -- * system-specific GUI dialog, and probably minimizing any fullscreen windows.
  -- *
  -- * This callback may fire from any thread, but it runs wrapped in a mutex, so
  -- * it will only fire from one thread at a time.
  -- *
  -- * This callback is NOT reset to SDL's internal handler upon SDL_Quit()!
  -- *
  -- * \param handler the SDL_AssertionHandler function to call when an assertion
  -- *                fails or NULL for the default handler.
  -- * \param userdata a pointer that is passed to `handler`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAssertionHandler
  --  

   procedure SDL_SetAssertionHandler (handler : SDL_AssertionHandler; userdata : System.Address)  -- /usr/local/include/SDL3/SDL_assert.h:589
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetAssertionHandler";

  --*
  -- * Get the default assertion handler.
  -- *
  -- * This returns the function pointer that is called by default when an
  -- * assertion is triggered. This is an internal function provided by SDL, that
  -- * is used for assertions when SDL_SetAssertionHandler() hasn't been used to
  -- * provide a different function.
  -- *
  -- * \returns the default SDL_AssertionHandler that is called when an assert
  -- *          triggers.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAssertionHandler
  --  

   function SDL_GetDefaultAssertionHandler return SDL_AssertionHandler  -- /usr/local/include/SDL3/SDL_assert.h:610
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetDefaultAssertionHandler";

  --*
  -- * Get the current assertion handler.
  -- *
  -- * This returns the function pointer that is called when an assertion is
  -- * triggered. This is either the value last passed to
  -- * SDL_SetAssertionHandler(), or if no application-specified function is set,
  -- * is equivalent to calling SDL_GetDefaultAssertionHandler().
  -- *
  -- * The parameter `puserdata` is a pointer to a void*, which will store the
  -- * "userdata" pointer that was passed to SDL_SetAssertionHandler(). This value
  -- * will always be NULL for the default handler. If you don't care about this
  -- * data, it is safe to pass a NULL pointer to this function to ignore it.
  -- *
  -- * \param puserdata pointer which is filled with the "userdata" pointer that
  -- *                  was passed to SDL_SetAssertionHandler().
  -- * \returns the SDL_AssertionHandler that is called when an assert triggers.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetAssertionHandler
  --  

   function SDL_GetAssertionHandler (puserdata : System.Address) return SDL_AssertionHandler  -- /usr/local/include/SDL3/SDL_assert.h:635
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetAssertionHandler";

  --*
  -- * Get a list of all assertion failures.
  -- *
  -- * This function gets all assertions triggered since the last call to
  -- * SDL_ResetAssertionReport(), or the start of the program.
  -- *
  -- * The proper way to examine this data looks something like this:
  -- *
  -- * ```c
  -- * const SDL_AssertData *item = SDL_GetAssertionReport();
  -- * while (item) {
  -- *    printf("'%s', %s (%s:%d), triggered %u times, always ignore: %s.\\n",
  -- *           item->condition, item->function, item->filename,
  -- *           item->linenum, item->trigger_count,
  -- *           item->always_ignore ? "yes" : "no");
  -- *    item = item->next;
  -- * }
  -- * ```
  -- *
  -- * \returns a list of all failed assertions or NULL if the list is empty. This
  -- *          memory should not be modified or freed by the application. This
  -- *          pointer remains valid until the next call to SDL_Quit() or
  -- *          SDL_ResetAssertionReport().
  -- *
  -- * \threadsafety This function is not thread safe. Other threads calling
  -- *               SDL_ResetAssertionReport() simultaneously, may render the
  -- *               returned pointer invalid.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ResetAssertionReport
  --  

   function SDL_GetAssertionReport return access constant SDL_AssertData  -- /usr/local/include/SDL3/SDL_assert.h:669
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetAssertionReport";

  --*
  -- * Clear the list of all assertion failures.
  -- *
  -- * This function will clear the list of all assertions triggered up to that
  -- * point. Immediately following this call, SDL_GetAssertionReport will return
  -- * no items. In addition, any previously-triggered assertions will be reset to
  -- * a trigger_count of zero, and their always_ignore state will be false.
  -- *
  -- * \threadsafety This function is not thread safe. Other threads triggering an
  -- *               assertion, or simultaneously calling this function may cause
  -- *               memory leaks or crashes.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetAssertionReport
  --  

   procedure SDL_ResetAssertionReport  -- /usr/local/include/SDL3/SDL_assert.h:687
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ResetAssertionReport";

  -- Ends C function definitions when using C++  
end SDL3_SDL_assert_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
