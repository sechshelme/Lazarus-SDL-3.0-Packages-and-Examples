
unit SDL_assert;
interface

{
  Automatically converted by H2Pas 0.99.16 from SDL_assert.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL_assert.h
}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Simple DirectMedia Layer
  Copyright (C) 1997-2024 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:

  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
 }
{*
 * # CategoryAssert
 *
 * A helpful assertion macro!
 *
 * SDL assertions operate like your usual `assert` macro, but with some added
 * features:
 *
 * - It uses a trick with the `sizeof` operator, so disabled assertions
 *   vaporize out of the compiled code, but variables only referenced in the
 *   assertion won't trigger compiler warnings about being unused.
 * - It is safe to use with a dangling-else: `if (x) SDL_assert(y); else
 *   do_something();`
 * - It works the same everywhere, instead of counting on various platforms'
 *   compiler and C runtime to behave.
 * - It provides multiple levels of assertion (SDL_assert, SDL_assert_release,
 *   SDL_assert_paranoid) instead of a single all-or-nothing option.
 * - It offers a variety of responses when an assertion fails (retry, trigger
 *   the debugger, abort the program, ignore the failure once, ignore it for
 *   the rest of the program's run).
 * - It tries to show the user a dialog by default, if possible, but the app
 *   can provide a callback to handle assertion failures however they like.
 * - It lets failed assertions be retried. Perhaps you had a network failure
 *   and just want to retry the test after plugging your network cable back
 *   in? You can.
 * - It lets the user ignore an assertion failure, if there's a harmless
 *   problem that one can continue past.
 * - It lets the user mark an assertion as ignored for the rest of the
 *   program's run; if there's a harmless problem that keeps popping up.
 * - It provides statistics and data on all failed assertions to the app.
 * - It allows the default assertion handler to be controlled with environment
 *   variables, in case an automated script needs to control it.
 *
 * To use it: do a debug build and just sprinkle around tests to check your
 * code!
  }
{$ifndef SDL_assert_h_}
{$define SDL_assert_h_}
{$include <SDL3/SDL_stdinc.h>}
{$include <SDL3/SDL_begin_code.h>}
{ Set up for C function definitions, even when using C++  }
{ C++ extern C conditionnal removed }
{$ifdef SDL_WIKI_DOCUMENTATION_SECTION}
{*
 * The level of assertion aggressiveness.
 *
 * This value changes depending on compiler options and other preprocessor
 * defines.
 *
 * It is currently one of the following values, but future SDL releases might
 * add more:
 *
 * - 0: All SDL assertion macros are disabled.
 * - 1: Release settings: SDL_assert disabled, SDL_assert_release enabled.
 * - 2: Debug settings: SDL_assert and SDL_assert_release enabled.
 * - 3: Paranoid settings: All SDL assertion macros enabled, including
 *   SDL_assert_paranoid.
 *
 * \since This macro is available since SDL 3.0.0.
  }

const
  SDL_ASSERT_LEVEL = SomeNumberBasedOnVariousFactors;  
(*** was #elif ****){$else !defined(SDL_ASSERT_LEVEL)}
{$ifdef SDL_DEFAULT_ASSERT_LEVEL}
  SDL_ASSERT_LEVEL = SDL_DEFAULT_ASSERT_LEVEL;  
{#elif defined(_DEBUG) || defined(DEBUG) || \ }
{      (defined(__GNUC__) && !defined(__OPTIMIZE__)) }
  SDL_ASSERT_LEVEL = 2;  
{$else}
  SDL_ASSERT_LEVEL = 1;  
{$endif}
{$endif}
{$ifdef SDL_WIKI_DOCUMENTATION_SECTION}
{*
 * Attempt to tell an attached debugger to pause.
 *
 * This allows an app to programmatically halt ("break") the debugger as if it
 * had hit a breakpoint, allowing the developer to examine program state, etc.
 *
 * This is a macro--not a function--so that the debugger breaks on the source
 * code line that used SDL_TriggerBreakpoint and not in some random guts of
 * SDL. SDL_assert uses this macro for the same reason.
 *
 * If the program is not running under a debugger, SDL_TriggerBreakpoint will
 * likely terminate the app, possibly without warning. If the current platform
 * isn't supported (SDL doesn't know how to trigger a breakpoint), this macro
 * does nothing.
 *
 * \threadsafety It is safe to call this function from any thread.
 *
 * \since This macro is available since SDL 3.0.0.
  }
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   

function SDL_TriggerBreakpoint : longint;

{$if defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 199901L) /* C99 supports __func__ as a standard. */}
const
  SDL_FUNCTION = __func__;  
(*** was #elif ****){$else ((defined(__GNUC__) && (__GNUC__ >= 2)) || defined(_MSC_VER) || defined (__WATCOMC__))}
  SDL_FUNCTION = __FUNCTION__;  
{$else}
  SDL_FUNCTION = '???';  
{$endif}
  SDL_FILE = __FILE__;  
  SDL_LINE = __LINE__;  
{
sizeof (x) makes the compiler still parse the expression even without
assertions enabled, so the code is always checked at compile time, but
doesn't actually generate code for it, so there are no side effects or
expensive checks at run time, just the constant size of what x WOULD be,
which presumably gets optimized out as unused.
This also solves the problem of...

    int somevalue = blah();
    SDL_assert(somevalue == 1);

...which would cause compiles to complain that somevalue is unused if we
disable assertions.
 }
{ "while (0,0)" fools Microsoft's compiler's /W4 warning level into thinking
    this condition isn't constant. And looks like an owl's face!  }
{*
 * Possible outcomes from a triggered assertion.
 *
 * When an enabled assertion triggers, it may call the assertion handler
 * (possibly one provided by the app via SDL_SetAssertionHandler), which will
 * return one of these values, possibly after asking the user.
 *
 * Then SDL will respond based on this outcome (loop around to retry the
 * condition, try to break in a debugger, kill the program, or ignore the
 * problem).
 *
 * \since This enum is available since SDL 3.0.0.
  }
{*< Retry the assert immediately.  }
{*< Make the debugger trigger a breakpoint.  }
{*< Terminate the program.  }
{*< Ignore the assert.  }
{*< Ignore the assert from now on.  }
type
  PSDL_AssertState = ^TSDL_AssertState;
  TSDL_AssertState =  Longint;
  Const
    SDL_ASSERTION_RETRY = 0;
    SDL_ASSERTION_BREAK = 1;
    SDL_ASSERTION_ABORT = 2;
    SDL_ASSERTION_IGNORE = 3;
    SDL_ASSERTION_ALWAYS_IGNORE = 4;
;
{*
 * Information about an assertion failure.
 *
 * This structure is filled in with information about a triggered assertion,
 * used by the assertion handler, then added to the assertion report. This is
 * returned as a linked list from SDL_GetAssertionReport().
 *
 * \since This struct is available since SDL 3.0.0.
  }
{*< true if app should always continue when assertion is triggered.  }
{*< Number of times this assertion has been triggered.  }
(* Const before declarator ignored *)
{*< A string of this assert's test code.  }
(* Const before declarator ignored *)
{*< The source file where this assert lives.  }
{*< The line in `filename` where this assert lives.  }
(* Const before declarator ignored *)
{*< The name of the function where this assert lives.  }
(* Const before declarator ignored *)
{*< next item in the linked list.  }
type
  PSDL_AssertData = ^TSDL_AssertData;
  TSDL_AssertData = record
      always_ignore : Tbool;
      trigger_count : dword;
      condition : Pansichar;
      filename : Pansichar;
      linenum : longint;
      _function : Pansichar;
      next : PSDL_AssertData;
    end;
{*
 * Never call this directly.
 *
 * Use the SDL_assert* macros instead.
 *
 * \param data assert data structure.
 * \param func function name.
 * \param file file name.
 * \param line line number.
 * \returns assert state.
 *
 * \since This function is available since SDL 3.0.0.
  }
(* Const before declarator ignored *)
(* Const before declarator ignored *)

function SDL_ReportAssertion(data:PSDL_AssertData; func:Pansichar; file:Pansichar; line:longint):TSDL_AssertState;cdecl;external;
{ Define the trigger breakpoint call used in asserts  }
{ the do  while(0) avoids dangling else problems:
    if (x) SDL_assert(y); else blah();
       ... without the do/while, the "else" could attach to this macro's "if".
   We try to handle just the minimum we need here in a macro...the loop,
   the static vars, and break points. The heavy lifting is handled in
   SDL_ReportAssertion(), in SDL_assert.c.
 }
{*
 * An assertion test that is normally performed only in debug builds.
 *
 * This macro is enabled when the SDL_ASSERT_LEVEL is >= 2, otherwise it is
 * disabled. This is meant to only do these tests in debug builds, so they can
 * tend to be more expensive, and they are meant to bring everything to a halt
 * when they fail, with the programmer there to assess the problem.
 *
 * In short: you can sprinkle these around liberally and assume they will
 * evaporate out of the build when building for end-users.
 *
 * When assertions are disabled, this wraps `condition` in a `sizeof`
 * operator, which means any function calls and side effects will not run, but
 * the compiler will not complain about any otherwise-unused variables that
 * are only referenced in the assertion.
 *
 * One can set the environment variable "SDL_ASSERT" to one of several strings
 * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
 * behavior, which may be desirable for automation purposes. If your platform
 * requires GUI interfaces to happen on the main thread but you're debugging
 * an assertion in a background thread, it might be desirable to set this to
 * "break" so that your debugger takes control as soon as assert is triggered,
 * instead of risking a bad UI interaction (deadlock, etc) in the application.
 *
 * \param condition boolean value to test.
 *
 * \since This macro is available since SDL 3.0.0.
  }
{#define SDL_assert(condition) if (assertion_enabled && (condition))  trigger_assertion;  }
{*
 * An assertion test that is performed even in release builds.
 *
 * This macro is enabled when the SDL_ASSERT_LEVEL is >= 1, otherwise it is
 * disabled. This is meant to be for tests that are cheap to make and
 * extremely unlikely to fail; generally it is frowned upon to have an
 * assertion failure in a release build, so these assertions generally need to
 * be of more than life-and-death importance if there's a chance they might
 * trigger. You should almost always consider handling these cases more
 * gracefully than an assert allows.
 *
 * When assertions are disabled, this wraps `condition` in a `sizeof`
 * operator, which means any function calls and side effects will not run, but
 * the compiler will not complain about any otherwise-unused variables that
 * are only referenced in the assertion.
 *
 * One can set the environment variable "SDL_ASSERT" to one of several strings
 * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
 * behavior, which may be desirable for automation purposes. If your platform
 * requires GUI interfaces to happen on the main thread but you're debugging
 * an assertion in a background thread, it might be desirable to set this to
 * "break" so that your debugger takes control as soon as assert is triggered,
 * instead of risking a bad UI interaction (deadlock, etc) in the application.
 * *
 *
 * \param condition boolean value to test.
 *
 * \since This macro is available since SDL 3.0.0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;

{*
 * An assertion test that is performed only when built with paranoid settings.
 *
 * This macro is enabled when the SDL_ASSERT_LEVEL is >= 3, otherwise it is
 * disabled. This is a higher level than both release and debug, so these
 * tests are meant to be expensive and only run when specifically looking for
 * extremely unexpected failure cases in a special build.
 *
 * When assertions are disabled, this wraps `condition` in a `sizeof`
 * operator, which means any function calls and side effects will not run, but
 * the compiler will not complain about any otherwise-unused variables that
 * are only referenced in the assertion.
 *
 * One can set the environment variable "SDL_ASSERT" to one of several strings
 * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
 * behavior, which may be desirable for automation purposes. If your platform
 * requires GUI interfaces to happen on the main thread but you're debugging
 * an assertion in a background thread, it might be desirable to set this to
 * "break" so that your debugger takes control as soon as assert is triggered,
 * instead of risking a bad UI interaction (deadlock, etc) in the application.
 *
 * \param condition boolean value to test.
 *
 * \since This macro is available since SDL 3.0.0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;

{ Enable various levels of assertions.  }
(*** was #elif ****){$else SDL_ASSERT_LEVEL == 0   /* assertions disabled */}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;

(*** was #elif ****){$else SDL_ASSERT_LEVEL == 1  /* release settings. */}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;

(*** was #elif ****){$else SDL_ASSERT_LEVEL == 2  /* debug settings. */}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;

(*** was #elif ****){$else SDL_ASSERT_LEVEL == 3  /* paranoid settings. */}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;

{$else}
{$error Unknown assertion level.}
{$endif}
{*
 * An assertion test that always performed.
 *
 * This macro is always enabled no matter what SDL_ASSERT_LEVEL is set to. You
 * almost never want to use this, as it could trigger on an end-user's system,
 * crashing your program.
 *
 * One can set the environment variable "SDL_ASSERT" to one of several strings
 * ("abort", "break", "retry", "ignore", "always_ignore") to force a default
 * behavior, which may be desirable for automation purposes. If your platform
 * requires GUI interfaces to happen on the main thread but you're debugging
 * an assertion in a background thread, it might be desirable to set this to
 * "break" so that your debugger takes control as soon as assert is triggered,
 * instead of risking a bad UI interaction (deadlock, etc) in the application.
 *
 * \param condition boolean value to test.
 *
 * \since This macro is available since SDL 3.0.0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_always(condition : longint) : longint;

{*
 * A callback that fires when an SDL assertion fails.
 *
 * \param data a pointer to the SDL_AssertData structure corresponding to the
 *             current assertion.
 * \param userdata what was passed as `userdata` to SDL_SetAssertionHandler().
 * \returns an SDL_AssertState value indicating how to handle the failure.
 *
 * \since This datatype is available since SDL 3.0.0.
  }
(* Const before declarator ignored *)
type

  TSDL_AssertionHandler = function (data:PSDL_AssertData; userdata:pointer):TSDL_AssertState;cdecl;
{*
 * Set an application-defined assertion handler.
 *
 * This function allows an application to show its own assertion UI and/or
 * force the response to an assertion failure. If the application doesn't
 * provide this, SDL will try to do the right thing, popping up a
 * system-specific GUI dialog, and probably minimizing any fullscreen windows.
 *
 * This callback may fire from any thread, but it runs wrapped in a mutex, so
 * it will only fire from one thread at a time.
 *
 * This callback is NOT reset to SDL's internal handler upon SDL_Quit()!
 *
 * \param handler the SDL_AssertionHandler function to call when an assertion
 *                fails or NULL for the default handler.
 * \param userdata a pointer that is passed to `handler`.
 *
 * \since This function is available since SDL 3.0.0.
 *
 * \sa SDL_GetAssertionHandler
  }

procedure SDL_SetAssertionHandler(handler:TSDL_AssertionHandler; userdata:pointer);cdecl;external;
{*
 * Get the default assertion handler.
 *
 * This returns the function pointer that is called by default when an
 * assertion is triggered. This is an internal function provided by SDL, that
 * is used for assertions when SDL_SetAssertionHandler() hasn't been used to
 * provide a different function.
 *
 * \returns the default SDL_AssertionHandler that is called when an assert
 *          triggers.
 *
 * \since This function is available since SDL 3.0.0.
 *
 * \sa SDL_GetAssertionHandler
  }
function SDL_GetDefaultAssertionHandler:TSDL_AssertionHandler;cdecl;external;
{*
 * Get the current assertion handler.
 *
 * This returns the function pointer that is called when an assertion is
 * triggered. This is either the value last passed to
 * SDL_SetAssertionHandler(), or if no application-specified function is set,
 * is equivalent to calling SDL_GetDefaultAssertionHandler().
 *
 * The parameter `puserdata` is a pointer to a void*, which will store the
 * "userdata" pointer that was passed to SDL_SetAssertionHandler(). This value
 * will always be NULL for the default handler. If you don't care about this
 * data, it is safe to pass a NULL pointer to this function to ignore it.
 *
 * \param puserdata pointer which is filled with the "userdata" pointer that
 *                  was passed to SDL_SetAssertionHandler().
 * \returns the SDL_AssertionHandler that is called when an assert triggers.
 *
 * \since This function is available since SDL 3.0.0.
 *
 * \sa SDL_SetAssertionHandler
  }
function SDL_GetAssertionHandler(puserdata:Ppointer):TSDL_AssertionHandler;cdecl;external;
{*
 * Get a list of all assertion failures.
 *
 * This function gets all assertions triggered since the last call to
 * SDL_ResetAssertionReport(), or the start of the program.
 *
 * The proper way to examine this data looks something like this:
 *
 * ```c
 * const SDL_AssertData *item = SDL_GetAssertionReport();
 * while (item) 
 *    printf("'%s', %s (%s:%d), triggered %u times, always ignore: %s.\\n",
 *           item->condition, item->function, item->filename,
 *           item->linenum, item->trigger_count,
 *           item->always_ignore ? "yes" : "no");
 *    item = item->next;
 * 
 * ```
 *
 * \returns a list of all failed assertions or NULL if the list is empty. This
 *          memory should not be modified or freed by the application.
 *
 * \since This function is available since SDL 3.0.0.
 *
 * \sa SDL_ResetAssertionReport
  }
(* Const before declarator ignored *)
function SDL_GetAssertionReport:PSDL_AssertData;cdecl;external;
{*
 * Clear the list of all assertion failures.
 *
 * This function will clear the list of all assertions triggered up to that
 * point. Immediately following this call, SDL_GetAssertionReport will return
 * no items. In addition, any previously-triggered assertions will be reset to
 * a trigger_count of zero, and their always_ignore state will be false.
 *
 * \since This function is available since SDL 3.0.0.
 *
 * \sa SDL_GetAssertionReport
  }
procedure SDL_ResetAssertionReport;cdecl;external;
{ Ends C function definitions when using C++  }
{ C++ end of extern C conditionnal removed }
{$include <SDL3/SDL_close_code.h>}
{$endif}
{ SDL_assert_h_  }

implementation

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function SDL_TriggerBreakpoint : longint;
begin
  SDL_TriggerBreakpoint:=TriggerABreakpointInAPlatformSpecificManner;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;
begin
  SDL_assert_release:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;
begin
  SDL_assert_paranoid:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;
begin
  SDL_assert:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;
begin
  SDL_assert_release:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;
begin
  SDL_assert_paranoid:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;
begin
  SDL_assert:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;
begin
  SDL_assert_release:=SDL_enabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;
begin
  SDL_assert_paranoid:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;
begin
  SDL_assert:=SDL_enabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;
begin
  SDL_assert_release:=SDL_enabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;
begin
  SDL_assert_paranoid:=SDL_disabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert(condition : longint) : longint;
begin
  SDL_assert:=SDL_enabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_release(condition : longint) : longint;
begin
  SDL_assert_release:=SDL_enabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_paranoid(condition : longint) : longint;
begin
  SDL_assert_paranoid:=SDL_enabled_assert(condition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SDL_assert_always(condition : longint) : longint;
begin
  SDL_assert_always:=SDL_enabled_assert(condition);
end;


end.
