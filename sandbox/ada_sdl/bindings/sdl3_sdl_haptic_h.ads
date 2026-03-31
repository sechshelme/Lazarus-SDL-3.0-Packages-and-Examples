pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with SDL3_SDL_joystick_h;

package SDL3_SDL_haptic_h is

   SDL_HAPTIC_INFINITY : constant := 4294967295;  --  /usr/local/include/SDL3/SDL_haptic.h:163

   SDL_HAPTIC_CONSTANT : constant := (2**0);  --  /usr/local/include/SDL3/SDL_haptic.h:192

   SDL_HAPTIC_SINE : constant := (2**1);  --  /usr/local/include/SDL3/SDL_haptic.h:203

   SDL_HAPTIC_SQUARE : constant := (2**2);  --  /usr/local/include/SDL3/SDL_haptic.h:214

   SDL_HAPTIC_TRIANGLE : constant := (2**3);  --  /usr/local/include/SDL3/SDL_haptic.h:225

   SDL_HAPTIC_SAWTOOTHUP : constant := (2**4);  --  /usr/local/include/SDL3/SDL_haptic.h:236

   SDL_HAPTIC_SAWTOOTHDOWN : constant := (2**5);  --  /usr/local/include/SDL3/SDL_haptic.h:247

   SDL_HAPTIC_RAMP : constant := (2**6);  --  /usr/local/include/SDL3/SDL_haptic.h:258

   SDL_HAPTIC_SPRING : constant := (2**7);  --  /usr/local/include/SDL3/SDL_haptic.h:270

   SDL_HAPTIC_DAMPER : constant := (2**8);  --  /usr/local/include/SDL3/SDL_haptic.h:282

   SDL_HAPTIC_INERTIA : constant := (2**9);  --  /usr/local/include/SDL3/SDL_haptic.h:294

   SDL_HAPTIC_FRICTION : constant := (2**10);  --  /usr/local/include/SDL3/SDL_haptic.h:306

   SDL_HAPTIC_LEFTRIGHT : constant := (2**11);  --  /usr/local/include/SDL3/SDL_haptic.h:317

   SDL_HAPTIC_RESERVED1 : constant := (2**12);  --  /usr/local/include/SDL3/SDL_haptic.h:324

   SDL_HAPTIC_RESERVED2 : constant := (2**13);  --  /usr/local/include/SDL3/SDL_haptic.h:331

   SDL_HAPTIC_RESERVED3 : constant := (2**14);  --  /usr/local/include/SDL3/SDL_haptic.h:338

   SDL_HAPTIC_CUSTOM : constant := (2**15);  --  /usr/local/include/SDL3/SDL_haptic.h:347

   SDL_HAPTIC_GAIN : constant := (2**16);  --  /usr/local/include/SDL3/SDL_haptic.h:362

   SDL_HAPTIC_AUTOCENTER : constant := (2**17);  --  /usr/local/include/SDL3/SDL_haptic.h:373

   SDL_HAPTIC_STATUS : constant := (2**18);  --  /usr/local/include/SDL3/SDL_haptic.h:384

   SDL_HAPTIC_PAUSE : constant := (2**19);  --  /usr/local/include/SDL3/SDL_haptic.h:396

   SDL_HAPTIC_POLAR : constant := 0;  --  /usr/local/include/SDL3/SDL_haptic.h:416

   SDL_HAPTIC_CARTESIAN : constant := 1;  --  /usr/local/include/SDL3/SDL_haptic.h:425

   SDL_HAPTIC_SPHERICAL : constant := 2;  --  /usr/local/include/SDL3/SDL_haptic.h:434

   SDL_HAPTIC_STEERING_AXIS : constant := 3;  --  /usr/local/include/SDL3/SDL_haptic.h:446

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
  -- * # CategoryHaptic
  -- *
  -- * The SDL haptic subsystem manages haptic (force feedback) devices.
  -- *
  -- * The basic usage is as follows:
  -- *
  -- * - Initialize the subsystem (SDL_INIT_HAPTIC).
  -- * - Open a haptic device.
  -- * - SDL_OpenHaptic() to open from index.
  -- * - SDL_OpenHapticFromJoystick() to open from an existing joystick.
  -- * - Create an effect (SDL_HapticEffect).
  -- * - Upload the effect with SDL_CreateHapticEffect().
  -- * - Run the effect with SDL_RunHapticEffect().
  -- * - (optional) Free the effect with SDL_DestroyHapticEffect().
  -- * - Close the haptic device with SDL_CloseHaptic().
  -- *
  -- * Simple rumble example:
  -- *
  -- * ```c
  -- *    SDL_Haptic *haptic = NULL;
  -- *
  -- *    // Open the device
  -- *    SDL_HapticID *haptics = SDL_GetHaptics(NULL);
  -- *    if (haptics) {
  -- *        haptic = SDL_OpenHaptic(haptics[0]);
  -- *        SDL_free(haptics);
  -- *    }
  -- *    if (haptic == NULL)
  -- *       return;
  -- *
  -- *    // Initialize simple rumble
  -- *    if (!SDL_InitHapticRumble(haptic))
  -- *       return;
  -- *
  -- *    // Play effect at 50% strength for 2 seconds
  -- *    if (!SDL_PlayHapticRumble(haptic, 0.5, 2000))
  -- *       return;
  -- *    SDL_Delay(2000);
  -- *
  -- *    // Clean up
  -- *    SDL_CloseHaptic(haptic);
  -- * ```
  -- *
  -- * Complete example:
  -- *
  -- * ```c
  -- * bool test_haptic(SDL_Joystick *joystick)
  -- * {
  -- *    SDL_Haptic *haptic;
  -- *    SDL_HapticEffect effect;
  -- *    SDL_HapticEffectID effect_id;
  -- *
  -- *    // Open the device
  -- *    haptic = SDL_OpenHapticFromJoystick(joystick);
  -- *    if (haptic == NULL) return false; // Most likely joystick isn't haptic
  -- *
  -- *    // See if it can do sine waves
  -- *    if ((SDL_GetHapticFeatures(haptic) & SDL_HAPTIC_SINE)==0) {
  -- *       SDL_CloseHaptic(haptic); // No sine effect
  -- *       return false;
  -- *    }
  -- *
  -- *    // Create the effect
  -- *    SDL_memset(&effect, 0, sizeof(SDL_HapticEffect)); // 0 is safe default
  -- *    effect.type = SDL_HAPTIC_SINE;
  -- *    effect.periodic.direction.type = SDL_HAPTIC_POLAR; // Polar coordinates
  -- *    effect.periodic.direction.dir[0] = 18000; // Force comes from south
  -- *    effect.periodic.period = 1000; // 1000 ms
  -- *    effect.periodic.magnitude = 20000; // 20000/32767 strength
  -- *    effect.periodic.length = 5000; // 5 seconds long
  -- *    effect.periodic.attack_length = 1000; // Takes 1 second to get max strength
  -- *    effect.periodic.fade_length = 1000; // Takes 1 second to fade away
  -- *
  -- *    // Upload the effect
  -- *    effect_id = SDL_CreateHapticEffect(haptic, &effect);
  -- *
  -- *    // Test the effect
  -- *    SDL_RunHapticEffect(haptic, effect_id, 1);
  -- *    SDL_Delay(5000); // Wait for the effect to finish
  -- *
  -- *    // We destroy the effect, although closing the device also does this
  -- *    SDL_DestroyHapticEffect(haptic, effect_id);
  -- *
  -- *    // Close the device
  -- *    SDL_CloseHaptic(haptic);
  -- *
  -- *    return true; // Success
  -- * }
  -- * ```
  -- *
  -- * Note that the SDL haptic subsystem is not thread-safe.
  --  

  -- Set up for C function definitions, even when using C++  
  -- FIXME:
  -- *
  -- * At the moment the magnitude variables are mixed between signed/unsigned, and
  -- * it is also not made clear that ALL of those variables expect a max of 0x7FFF.
  -- *
  -- * Some platforms may have higher precision than that (Linux FF, Windows XInput)
  -- * so we should fix the inconsistency in favor of higher possible precision,
  -- * adjusting for platforms that use different scales.
  -- * -flibit
  --  

  --*
  -- * The haptic structure used to identify an SDL haptic.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_OpenHaptic
  -- * \sa SDL_OpenHapticFromJoystick
  -- * \sa SDL_CloseHaptic
  --  

   type SDL_Haptic is null record;   -- incomplete struct

  -- * Misc defines.
  --  

  --*
  -- * Used to play a device an infinite number of times.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RunHapticEffect
  --  

  --*
  -- *  \name Haptic features
  -- *
  -- *  Different haptic features a device can have.
  --  

  -- @{  
  --*
  -- *  \name Haptic effects
  --  

  -- @{  
  --*
  -- * Type of haptic effect.
  --  

   subtype SDL_HapticEffectType is SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:181

  --*
  -- * Constant effect supported.
  -- *
  -- * Constant haptic effect.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticCondition
  --  

  --*
  -- * Sine wave effect supported.
  -- *
  -- * Periodic haptic effect that simulates sine waves.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticPeriodic
  --  

  --*
  -- * Square wave effect supported.
  -- *
  -- * Periodic haptic effect that simulates square waves.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticPeriodic
  --  

  --*
  -- * Triangle wave effect supported.
  -- *
  -- * Periodic haptic effect that simulates triangular waves.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticPeriodic
  --  

  --*
  -- * Sawtoothup wave effect supported.
  -- *
  -- * Periodic haptic effect that simulates saw tooth up waves.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticPeriodic
  --  

  --*
  -- * Sawtoothdown wave effect supported.
  -- *
  -- * Periodic haptic effect that simulates saw tooth down waves.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticPeriodic
  --  

  --*
  -- * Ramp effect supported.
  -- *
  -- * Ramp haptic effect.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticRamp
  --  

  --*
  -- * Spring effect supported - uses axes position.
  -- *
  -- * Condition haptic effect that simulates a spring. Effect is based on the
  -- * axes position.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticCondition
  --  

  --*
  -- * Damper effect supported - uses axes velocity.
  -- *
  -- * Condition haptic effect that simulates dampening. Effect is based on the
  -- * axes velocity.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticCondition
  --  

  --*
  -- * Inertia effect supported - uses axes acceleration.
  -- *
  -- * Condition haptic effect that simulates inertia. Effect is based on the axes
  -- * acceleration.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticCondition
  --  

  --*
  -- * Friction effect supported - uses axes movement.
  -- *
  -- * Condition haptic effect that simulates friction. Effect is based on the
  -- * axes movement.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticCondition
  --  

  --*
  -- * Left/Right effect supported.
  -- *
  -- * Haptic effect for direct control over high/low frequency motors.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticLeftRight
  --  

  --*
  -- * Reserved for future use.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Reserved for future use.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Reserved for future use.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  --*
  -- * Custom effect is supported.
  -- *
  -- * User defined custom haptic effect.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  --  

  -- @}  
  -- Haptic effects  
  -- These last few are features the device has, not effects  
  --*
  -- * Device can set global gain.
  -- *
  -- * Device supports setting the global gain.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetHapticGain
  --  

  --*
  -- * Device can set autocenter.
  -- *
  -- * Device supports setting autocenter.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_SetHapticAutocenter
  --  

  --*
  -- * Device can be queried for effect status.
  -- *
  -- * Device supports querying effect status.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticEffectStatus
  --  

  --*
  -- * Device can be paused.
  -- *
  -- * Devices supports being paused.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PauseHaptic
  -- * \sa SDL_ResumeHaptic
  --  

  --*
  -- * \name Direction encodings
  --  

  -- @{  
  --*
  -- * Type of coordinates used for haptic direction.
  --  

   subtype SDL_HapticDirectionType is SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_haptic.h:407

  --*
  -- * Uses polar coordinates for the direction.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticDirection
  --  

  --*
  -- * Uses cartesian coordinates for the direction.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticDirection
  --  

  --*
  -- * Uses spherical coordinates for the direction.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticDirection
  --  

  --*
  -- * Use this value to play an effect on the steering wheel axis.
  -- *
  -- * This provides better compatibility across platforms and devices as SDL will
  -- * guess the correct axis.
  -- *
  -- * \since This macro is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticDirection
  --  

  -- @}  
  -- Direction encodings  
  -- @}  
  -- Haptic features  
  --*
  -- * ID for haptic effects.
  -- *
  -- * This is -1 if the ID is invalid.
  -- *
  -- * \sa SDL_CreateHapticEffect
  --  

   subtype SDL_HapticEffectID is int;  -- /usr/local/include/SDL3/SDL_haptic.h:460

  --*
  -- * Structure that represents a haptic direction.
  -- *
  -- * This is the direction where the force comes from, instead of the direction
  -- * in which the force is exerted.
  -- *
  -- * Directions can be specified by:
  -- *
  -- * - SDL_HAPTIC_POLAR : Specified by polar coordinates.
  -- * - SDL_HAPTIC_CARTESIAN : Specified by cartesian coordinates.
  -- * - SDL_HAPTIC_SPHERICAL : Specified by spherical coordinates.
  -- *
  -- * Cardinal directions of the haptic device are relative to the positioning of
  -- * the device. North is considered to be away from the user.
  -- *
  -- * The following diagram represents the cardinal directions:
  -- *
  -- * ```
  -- *                .--.
  -- *                |__| .-------.
  -- *                |=.| |.-----.|
  -- *                |--| ||     ||
  -- *                |  | |'-----'|
  -- *                |__|~')_____('
  -- *                  [ COMPUTER ]
  -- *
  -- *
  -- *                    North (0,-1)
  -- *                        ^
  -- *                        |
  -- *                        |
  -- *  (-1,0)  West <----[ HAPTIC ]----> East (1,0)
  -- *                        |
  -- *                        |
  -- *                        v
  -- *                     South (0,1)
  -- *
  -- *
  -- *                     [ USER ]
  -- *                       \|||/
  -- *                       (o o)
  -- *                 ---ooO-(_)-Ooo---
  -- * ```
  -- *
  -- * If type is SDL_HAPTIC_POLAR, direction is encoded by hundredths of a degree
  -- * starting north and turning clockwise. SDL_HAPTIC_POLAR only uses the first
  -- * `dir` parameter. The cardinal directions would be:
  -- *
  -- * - North: 0 (0 degrees)
  -- * - East: 9000 (90 degrees)
  -- * - South: 18000 (180 degrees)
  -- * - West: 27000 (270 degrees)
  -- *
  -- * If type is SDL_HAPTIC_CARTESIAN, direction is encoded by three positions (X
  -- * axis, Y axis and Z axis (with 3 axes)). SDL_HAPTIC_CARTESIAN uses the first
  -- * three `dir` parameters. The cardinal directions would be:
  -- *
  -- * - North: 0,-1, 0
  -- * - East: 1, 0, 0
  -- * - South: 0, 1, 0
  -- * - West: -1, 0, 0
  -- *
  -- * The Z axis represents the height of the effect if supported, otherwise it's
  -- * unused. In cartesian encoding (1, 2) would be the same as (2, 4), you can
  -- * use any multiple you want, only the direction matters.
  -- *
  -- * If type is SDL_HAPTIC_SPHERICAL, direction is encoded by two rotations. The
  -- * first two `dir` parameters are used. The `dir` parameters are as follows
  -- * (all values are in hundredths of degrees):
  -- *
  -- * - Degrees from (1, 0) rotated towards (0, 1).
  -- * - Degrees towards (0, 0, 1) (device needs at least 3 axes).
  -- *
  -- * Example of force coming from the south with all encodings (force coming
  -- * from the south means the user will have to pull the stick to counteract):
  -- *
  -- * ```c
  -- *  SDL_HapticDirection direction;
  -- *
  -- *  // Cartesian directions
  -- *  direction.type = SDL_HAPTIC_CARTESIAN; // Using cartesian direction encoding.
  -- *  direction.dir[0] = 0; // X position
  -- *  direction.dir[1] = 1; // Y position
  -- *  // Assuming the device has 2 axes, we don't need to specify third parameter.
  -- *
  -- *  // Polar directions
  -- *  direction.type = SDL_HAPTIC_POLAR; // We'll be using polar direction encoding.
  -- *  direction.dir[0] = 18000; // Polar only uses first parameter
  -- *
  -- *  // Spherical coordinates
  -- *  direction.type = SDL_HAPTIC_SPHERICAL; // Spherical encoding
  -- *  direction.dir[0] = 9000; // Since we only have two axes we don't need more parameters.
  -- * ```
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HAPTIC_POLAR
  -- * \sa SDL_HAPTIC_CARTESIAN
  -- * \sa SDL_HAPTIC_SPHERICAL
  -- * \sa SDL_HAPTIC_STEERING_AXIS
  -- * \sa SDL_HapticEffect
  -- * \sa SDL_GetNumHapticAxes
  --  

  --*< The type of encoding.  
   type anon_array3494 is array (0 .. 2) of aliased SDL3_SDL_stdinc_h.Sint32;
   type SDL_HapticDirection is record
      c_type : aliased SDL_HapticDirectionType;  -- /usr/local/include/SDL3/SDL_haptic.h:568
      dir : aliased anon_array3494;  -- /usr/local/include/SDL3/SDL_haptic.h:569
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:566

  --*< The encoded direction.  
  --*
  -- * A structure containing a template for a Constant effect.
  -- *
  -- * This struct is exclusively for the SDL_HAPTIC_CONSTANT effect.
  -- *
  -- * A constant effect applies a constant force in the specified direction to
  -- * the joystick.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HAPTIC_CONSTANT
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< SDL_HAPTIC_CONSTANT  
   type SDL_HapticConstant is record
      c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:589
      direction : aliased SDL_HapticDirection;  -- /usr/local/include/SDL3/SDL_haptic.h:590
      length : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:593
      c_delay : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:594
      button : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:597
      interval : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:598
      level : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_haptic.h:601
      attack_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:604
      attack_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:605
      fade_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:606
      fade_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:607
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:586

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Constant  
  --*< Strength of the constant effect.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- * A structure containing a template for a Periodic effect.
  -- *
  -- * The struct handles the following effects:
  -- *
  -- * - SDL_HAPTIC_SINE
  -- * - SDL_HAPTIC_SQUARE
  -- * - SDL_HAPTIC_TRIANGLE
  -- * - SDL_HAPTIC_SAWTOOTHUP
  -- * - SDL_HAPTIC_SAWTOOTHDOWN
  -- *
  -- * A periodic effect consists in a wave-shaped effect that repeats itself over
  -- * time. The type determines the shape of the wave and the parameters
  -- * determine the dimensions of the wave.
  -- *
  -- * Phase is given by hundredth of a degree meaning that giving the phase a
  -- * value of 9000 will displace it 25% of its period. Here are sample values:
  -- *
  -- * - 0: No phase displacement.
  -- * - 9000: Displaced 25% of its period.
  -- * - 18000: Displaced 50% of its period.
  -- * - 27000: Displaced 75% of its period.
  -- * - 36000: Displaced 100% of its period, same as 0, but 0 is preferred.
  -- *
  -- * Examples:
  -- *
  -- * ```
  -- *   SDL_HAPTIC_SINE
  -- *     __      __      __      __
  -- *    /  \    /  \    /  \    /
  -- *   /    \__/    \__/    \__/
  -- *
  -- *   SDL_HAPTIC_SQUARE
  -- *    __    __    __    __    __
  -- *   |  |  |  |  |  |  |  |  |  |
  -- *   |  |__|  |__|  |__|  |__|  |
  -- *
  -- *   SDL_HAPTIC_TRIANGLE
  -- *     /\    /\    /\    /\    / *    /  \  /  \  /  \  /  \  /
  --/
  -- *   /    \/    \/    \/    \/
  -- *
  -- *   SDL_HAPTIC_SAWTOOTHUP
  -- *     /|  /|  /|  /|  /|  /|  /|
  -- *    / | / | / | / | / | / | / |
  -- *   /  |/  |/  |/  |/  |/  |/  |
  -- *
  -- *   SDL_HAPTIC_SAWTOOTHDOWN
  -- *   \  |\  |\  |\  |\  |\  |\  |
  -- *    \ | \ | \ | \ | \ | \ | \ |
  -- *     \|  \|  \|  \|  \|  \|  \|
  -- * ```
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HAPTIC_SINE
  -- * \sa SDL_HAPTIC_SQUARE
  -- * \sa SDL_HAPTIC_TRIANGLE
  -- * \sa SDL_HAPTIC_SAWTOOTHUP
  -- * \sa SDL_HAPTIC_SAWTOOTHDOWN
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< SDL_HAPTIC_SINE, SDL_HAPTIC_SQUARE
  --                                         SDL_HAPTIC_TRIANGLE, SDL_HAPTIC_SAWTOOTHUP or
  --                                         SDL_HAPTIC_SAWTOOTHDOWN  

   type SDL_HapticPeriodic is record
      c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:675
      direction : aliased SDL_HapticDirection;  -- /usr/local/include/SDL3/SDL_haptic.h:678
      length : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:681
      c_delay : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:682
      button : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:685
      interval : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:686
      period : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:689
      magnitude : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_haptic.h:690
      offset : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_haptic.h:691
      phase : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:692
      attack_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:695
      attack_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:696
      fade_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:697
      fade_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:698
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:672

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Periodic  
  --*< Period of the wave.  
  --*< Peak value; if negative, equivalent to 180 degrees extra phase shift.  
  --*< Mean value of the wave.  
  --*< Positive phase shift given by hundredth of a degree.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- * A structure containing a template for a Condition effect.
  -- *
  -- * The struct handles the following effects:
  -- *
  -- * - SDL_HAPTIC_SPRING: Effect based on axes position.
  -- * - SDL_HAPTIC_DAMPER: Effect based on axes velocity.
  -- * - SDL_HAPTIC_INERTIA: Effect based on axes acceleration.
  -- * - SDL_HAPTIC_FRICTION: Effect based on axes movement.
  -- *
  -- * Direction is handled by condition internals instead of a direction member.
  -- * The condition effect specific members have three parameters. The first
  -- * refers to the X axis, the second refers to the Y axis and the third refers
  -- * to the Z axis. The right terms refer to the positive side of the axis and
  -- * the left terms refer to the negative side of the axis. Please refer to the
  -- * SDL_HapticDirection diagram for which side is positive and which is
  -- * negative.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticDirection
  -- * \sa SDL_HAPTIC_SPRING
  -- * \sa SDL_HAPTIC_DAMPER
  -- * \sa SDL_HAPTIC_INERTIA
  -- * \sa SDL_HAPTIC_FRICTION
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< SDL_HAPTIC_SPRING, SDL_HAPTIC_DAMPER,
  --                                         SDL_HAPTIC_INERTIA or SDL_HAPTIC_FRICTION  

   type anon_array2584 is array (0 .. 2) of aliased SDL3_SDL_stdinc_h.Uint16;
   type anon_array3502 is array (0 .. 2) of aliased SDL3_SDL_stdinc_h.Sint16;
   type SDL_HapticCondition is record
      c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:731
      direction : aliased SDL_HapticDirection;  -- /usr/local/include/SDL3/SDL_haptic.h:733
      length : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:736
      c_delay : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:737
      button : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:740
      interval : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:741
      right_sat : aliased anon_array2584;  -- /usr/local/include/SDL3/SDL_haptic.h:744
      left_sat : aliased anon_array2584;  -- /usr/local/include/SDL3/SDL_haptic.h:745
      right_coeff : aliased anon_array3502;  -- /usr/local/include/SDL3/SDL_haptic.h:746
      left_coeff : aliased anon_array3502;  -- /usr/local/include/SDL3/SDL_haptic.h:747
      deadband : aliased anon_array2584;  -- /usr/local/include/SDL3/SDL_haptic.h:748
      center : aliased anon_array3502;  -- /usr/local/include/SDL3/SDL_haptic.h:749
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:728

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Condition  
  --*< Level when joystick is to the positive side; max 0xFFFF.  
  --*< Level when joystick is to the negative side; max 0xFFFF.  
  --*< How fast to increase the force towards the positive side.  
  --*< How fast to increase the force towards the negative side.  
  --*< Size of the dead zone; max 0xFFFF: whole axis-range when 0-centered.  
  --*< Position of the dead zone.  
  --*
  -- * A structure containing a template for a Ramp effect.
  -- *
  -- * This struct is exclusively for the SDL_HAPTIC_RAMP effect.
  -- *
  -- * The ramp effect starts at start strength and ends at end strength. It
  -- * augments in linear fashion. If you use attack and fade with a ramp the
  -- * effects get added to the ramp effect making the effect become quadratic
  -- * instead of linear.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HAPTIC_RAMP
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< SDL_HAPTIC_RAMP  
   type SDL_HapticRamp is record
      c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:770
      direction : aliased SDL_HapticDirection;  -- /usr/local/include/SDL3/SDL_haptic.h:771
      length : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:774
      c_delay : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:775
      button : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:778
      interval : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:779
      start : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_haptic.h:782
      c_end : aliased SDL3_SDL_stdinc_h.Sint16;  -- /usr/local/include/SDL3/SDL_haptic.h:783
      attack_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:786
      attack_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:787
      fade_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:788
      fade_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:789
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:767

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Ramp  
  --*< Beginning strength level.  
  --*< Ending strength level.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- * A structure containing a template for a Left/Right effect.
  -- *
  -- * This struct is exclusively for the SDL_HAPTIC_LEFTRIGHT effect.
  -- *
  -- * The Left/Right effect is used to explicitly control the large and small
  -- * motors, commonly found in modern game controllers. The small (right) motor
  -- * is high frequency, and the large (left) motor is low frequency.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HAPTIC_LEFTRIGHT
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< SDL_HAPTIC_LEFTRIGHT  
   type SDL_HapticLeftRight is record
      c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:809
      length : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:812
      large_magnitude : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:815
      small_magnitude : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:816
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:806

  -- Replay  
  --*< Duration of the effect in milliseconds.  
  -- Rumble  
  --*< Control of the large controller motor.  
  --*< Control of the small controller motor.  
  --*
  -- * A structure containing a template for the SDL_HAPTIC_CUSTOM effect.
  -- *
  -- * This struct is exclusively for the SDL_HAPTIC_CUSTOM effect.
  -- *
  -- * A custom force feedback effect is much like a periodic effect, where the
  -- * application can define its exact shape. You will have to allocate the data
  -- * yourself. Data should consist of channels * samples Uint16 samples.
  -- *
  -- * If channels is one, the effect is rotated using the defined direction.
  -- * Otherwise it uses the samples in data for the different axes.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HAPTIC_CUSTOM
  -- * \sa SDL_HapticEffect
  --  

  -- Header  
  --*< SDL_HAPTIC_CUSTOM  
   type SDL_HapticCustom is record
      c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:839
      direction : aliased SDL_HapticDirection;  -- /usr/local/include/SDL3/SDL_haptic.h:840
      length : aliased SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:843
      c_delay : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:844
      button : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:847
      interval : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:848
      channels : aliased SDL3_SDL_stdinc_h.Uint8;  -- /usr/local/include/SDL3/SDL_haptic.h:851
      period : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:852
      samples : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:853
      data : access SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:854
      attack_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:857
      attack_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:858
      fade_length : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:859
      fade_level : aliased SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_haptic.h:860
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_haptic.h:836

  --*< Direction of the effect.  
  -- Replay  
  --*< Duration of the effect.  
  --*< Delay before starting the effect.  
  -- Trigger  
  --*< Button that triggers the effect.  
  --*< How soon it can be triggered again after button.  
  -- Custom  
  --*< Axes to use, minimum of one.  
  --*< Sample periods.  
  --*< Amount of samples.  
  --*< Should contain channels*samples items.  
  -- Envelope  
  --*< Duration of the attack.  
  --*< Level at the start of the attack.  
  --*< Duration of the fade.  
  --*< Level at the end of the fade.  
  --*
  -- * The generic template for any haptic effect.
  -- *
  -- * All values max at 32767 (0x7FFF). Signed values also can be negative. Time
  -- * values unless specified otherwise are in milliseconds.
  -- *
  -- * You can also pass SDL_HAPTIC_INFINITY to length instead of a 0-32767 value.
  -- * Neither delay, interval, attack_length nor fade_length support
  -- * SDL_HAPTIC_INFINITY. Fade will also not be used since effect never ends.
  -- *
  -- * Additionally, the SDL_HAPTIC_RAMP effect does not support a duration of
  -- * SDL_HAPTIC_INFINITY.
  -- *
  -- * Button triggers may not be supported on all devices, it is advised to not
  -- * use them if possible. Buttons start at index 1 instead of index 0 like the
  -- * joystick.
  -- *
  -- * If both attack_length and fade_level are 0, the envelope is not used,
  -- * otherwise both values are used.
  -- *
  -- * Common parts:
  -- *
  -- * ```c
  -- *  // Replay - All effects have this
  -- *  Uint32 length;        // Duration of effect (ms).
  -- *  Uint16 delay;         // Delay before starting effect.
  -- *
  -- *  // Trigger - All effects have this
  -- *  Uint16 button;        // Button that triggers effect.
  -- *  Uint16 interval;      // How soon before effect can be triggered again.
  -- *
  -- *  // Envelope - All effects except condition effects have this
  -- *  Uint16 attack_length; // Duration of the attack (ms).
  -- *  Uint16 attack_level;  // Level at the start of the attack.
  -- *  Uint16 fade_length;   // Duration of the fade out (ms).
  -- *  Uint16 fade_level;    // Level at the end of the fade.
  -- * ```
  -- *
  -- * Here we have an example of a constant effect evolution in time:
  -- *
  -- * ```
  -- *  Strength
  -- *  ^
  -- *  |
  -- *  |    effect level -->  _________________
  -- *  |                     /                  *  |                    /                    *  |                   /                      *  |                  /                        *  | attack_level --> |                         *  |                  |                        |  <---  fade_level
  --ade_level
  -- *  |
  -- *  +--------------------------------------------------> Time
  -- *                     [--]                 [---]
  -- *                     attack_length        fade_length
  -- *
  -- *  [------------------][-----------------------]
  -- *  delay               length
  -- * ```
  -- *
  -- * Note either the attack_level or the fade_level may be above the actual
  -- * effect level.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticConstant
  -- * \sa SDL_HapticPeriodic
  -- * \sa SDL_HapticCondition
  -- * \sa SDL_HapticRamp
  -- * \sa SDL_HapticLeftRight
  -- * \sa SDL_HapticCustom
  --  

  -- Common for all force feedback effects  
  --*< Effect type.  
   type SDL_HapticEffect (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_type : aliased SDL_HapticEffectType;  -- /usr/local/include/SDL3/SDL_haptic.h:938
         when 1 =>
            c_constant : aliased SDL_HapticConstant;  -- /usr/local/include/SDL3/SDL_haptic.h:939
         when 2 =>
            periodic : aliased SDL_HapticPeriodic;  -- /usr/local/include/SDL3/SDL_haptic.h:940
         when 3 =>
            condition : aliased SDL_HapticCondition;  -- /usr/local/include/SDL3/SDL_haptic.h:941
         when 4 =>
            ramp : aliased SDL_HapticRamp;  -- /usr/local/include/SDL3/SDL_haptic.h:942
         when 5 =>
            leftright : aliased SDL_HapticLeftRight;  -- /usr/local/include/SDL3/SDL_haptic.h:943
         when others =>
            custom : aliased SDL_HapticCustom;  -- /usr/local/include/SDL3/SDL_haptic.h:944
      end case;
   end record
   with Convention => C_Pass_By_Copy,
        Unchecked_Union => True;  -- /usr/local/include/SDL3/SDL_haptic.h:935

  --*< Constant effect.  
  --*< Periodic effect.  
  --*< Condition effect.  
  --*< Ramp effect.  
  --*< Left/Right effect.  
  --*< Custom effect.  
  --*
  -- * This is a unique ID for a haptic device for the time it is connected to the
  -- * system, and is never reused for the lifetime of the application.
  -- *
  -- * If the haptic device is disconnected and reconnected, it will get a new ID.
  -- *
  -- * The value 0 is an invalid ID.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_HapticID is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_haptic.h:957

  -- Function prototypes  
  --*
  -- * Get a list of currently connected haptic devices.
  -- *
  -- * \param count a pointer filled in with the number of haptic devices
  -- *              returned, may be NULL.
  -- * \returns a 0 terminated array of haptic device instance IDs or NULL on
  -- *          failure; call SDL_GetError() for more information. This should be
  -- *          freed with SDL_free() when it is no longer needed.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_OpenHaptic
  --  

   function SDL_GetHaptics (count : access int) return access SDL_HapticID  -- /usr/local/include/SDL3/SDL_haptic.h:975
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHaptics";

  --*
  -- * Get the implementation dependent name of a haptic device.
  -- *
  -- * This can be called before any haptic devices are opened.
  -- *
  -- * \param instance_id the haptic device instance ID.
  -- * \returns the name of the selected haptic device. If no name can be found,
  -- *          this function returns NULL; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticName
  -- * \sa SDL_OpenHaptic
  --  

   function SDL_GetHapticNameForID (instance_id : SDL_HapticID) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_haptic.h:992
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHapticNameForID";

  --*
  -- * Open a haptic device for use.
  -- *
  -- * The index passed as an argument refers to the N'th haptic device on this
  -- * system.
  -- *
  -- * When opening a haptic device, its gain will be set to maximum and
  -- * autocenter will be disabled. To modify these values use SDL_SetHapticGain()
  -- * and SDL_SetHapticAutocenter().
  -- *
  -- * \param instance_id the haptic device instance ID.
  -- * \returns the device identifier or NULL on failure; call SDL_GetError() for
  -- *          more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CloseHaptic
  -- * \sa SDL_GetHaptics
  -- * \sa SDL_OpenHapticFromJoystick
  -- * \sa SDL_OpenHapticFromMouse
  -- * \sa SDL_SetHapticAutocenter
  -- * \sa SDL_SetHapticGain
  --  

   function SDL_OpenHaptic (instance_id : SDL_HapticID) return access SDL_Haptic  -- /usr/local/include/SDL3/SDL_haptic.h:1017
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OpenHaptic";

  --*
  -- * Get the SDL_Haptic associated with an instance ID, if it has been opened.
  -- *
  -- * \param instance_id the instance ID to get the SDL_Haptic for.
  -- * \returns an SDL_Haptic on success or NULL on failure or if it hasn't been
  -- *          opened yet; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetHapticFromID (instance_id : SDL_HapticID) return access SDL_Haptic  -- /usr/local/include/SDL3/SDL_haptic.h:1029
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHapticFromID";

  --*
  -- * Get the instance ID of an opened haptic device.
  -- *
  -- * \param haptic the SDL_Haptic device to query.
  -- * \returns the instance ID of the specified haptic device on success or 0 on
  -- *          failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetHapticID (haptic : access SDL_Haptic) return SDL_HapticID  -- /usr/local/include/SDL3/SDL_haptic.h:1040
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHapticID";

  --*
  -- * Get the implementation dependent name of a haptic device.
  -- *
  -- * \param haptic the SDL_Haptic obtained from SDL_OpenJoystick().
  -- * \returns the name of the selected haptic device. If no name can be found,
  -- *          this function returns NULL; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticNameForID
  --  

   function SDL_GetHapticName (haptic : access SDL_Haptic) return Interfaces.C.Strings.chars_ptr  -- /usr/local/include/SDL3/SDL_haptic.h:1054
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHapticName";

  --*
  -- * Query whether or not the current mouse has haptic capabilities.
  -- *
  -- * \returns true if the mouse is haptic or false if it isn't.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_OpenHapticFromMouse
  --  

   function SDL_IsMouseHaptic return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1065
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsMouseHaptic";

  --*
  -- * Try to open a haptic device from the current mouse.
  -- *
  -- * \returns the haptic device identifier or NULL on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CloseHaptic
  -- * \sa SDL_IsMouseHaptic
  --  

   function SDL_OpenHapticFromMouse return access SDL_Haptic  -- /usr/local/include/SDL3/SDL_haptic.h:1078
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OpenHapticFromMouse";

  --*
  -- * Query if a joystick has haptic features.
  -- *
  -- * \param joystick the SDL_Joystick to test for haptic capabilities.
  -- * \returns true if the joystick is haptic or false if it isn't.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_OpenHapticFromJoystick
  --  

   function SDL_IsJoystickHaptic (joystick : access SDL3_SDL_joystick_h.SDL_Joystick) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1090
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_IsJoystickHaptic";

  --*
  -- * Open a haptic device for use from a joystick device.
  -- *
  -- * You must still close the haptic device separately. It will not be closed
  -- * with the joystick.
  -- *
  -- * When opened from a joystick you should first close the haptic device before
  -- * closing the joystick device. If not, on some implementations the haptic
  -- * device will also get unallocated and you'll be unable to use force feedback
  -- * on that device.
  -- *
  -- * \param joystick the SDL_Joystick to create a haptic device from.
  -- * \returns a valid haptic device identifier on success or NULL on failure;
  -- *          call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CloseHaptic
  -- * \sa SDL_IsJoystickHaptic
  --  

   function SDL_OpenHapticFromJoystick (joystick : access SDL3_SDL_joystick_h.SDL_Joystick) return access SDL_Haptic  -- /usr/local/include/SDL3/SDL_haptic.h:1112
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_OpenHapticFromJoystick";

  --*
  -- * Close a haptic device previously opened with SDL_OpenHaptic().
  -- *
  -- * \param haptic the SDL_Haptic device to close.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_OpenHaptic
  --  

   procedure SDL_CloseHaptic (haptic : access SDL_Haptic)  -- /usr/local/include/SDL3/SDL_haptic.h:1123
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CloseHaptic";

  --*
  -- * Get the number of effects a haptic device can store.
  -- *
  -- * On some platforms this isn't fully supported, and therefore is an
  -- * approximation. Always check to see if your created effect was actually
  -- * created and do not rely solely on SDL_GetMaxHapticEffects().
  -- *
  -- * \param haptic the SDL_Haptic device to query.
  -- * \returns the number of effects the haptic device can store or a negative
  -- *          error code on failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetMaxHapticEffectsPlaying
  -- * \sa SDL_GetHapticFeatures
  --  

   function SDL_GetMaxHapticEffects (haptic : access SDL_Haptic) return int  -- /usr/local/include/SDL3/SDL_haptic.h:1141
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetMaxHapticEffects";

  --*
  -- * Get the number of effects a haptic device can play at the same time.
  -- *
  -- * This is not supported on all platforms, but will always return a value.
  -- *
  -- * \param haptic the SDL_Haptic device to query maximum playing effects.
  -- * \returns the number of effects the haptic device can play at the same time
  -- *          or -1 on failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetMaxHapticEffects
  -- * \sa SDL_GetHapticFeatures
  --  

   function SDL_GetMaxHapticEffectsPlaying (haptic : access SDL_Haptic) return int  -- /usr/local/include/SDL3/SDL_haptic.h:1157
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetMaxHapticEffectsPlaying";

  --*
  -- * Get the haptic device's supported features in bitwise manner.
  -- *
  -- * \param haptic the SDL_Haptic device to query.
  -- * \returns a list of supported haptic features in bitwise manner (OR'd), or 0
  -- *          on failure; call SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HapticEffectSupported
  -- * \sa SDL_GetMaxHapticEffects
  --  

   function SDL_GetHapticFeatures (haptic : access SDL_Haptic) return SDL3_SDL_stdinc_h.Uint32  -- /usr/local/include/SDL3/SDL_haptic.h:1171
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHapticFeatures";

  --*
  -- * Get the number of haptic axes the device has.
  -- *
  -- * The number of haptic axes might be useful if working with the
  -- * SDL_HapticDirection effect.
  -- *
  -- * \param haptic the SDL_Haptic device to query.
  -- * \returns the number of axes on success or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetNumHapticAxes (haptic : access SDL_Haptic) return int  -- /usr/local/include/SDL3/SDL_haptic.h:1185
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetNumHapticAxes";

  --*
  -- * Check to see if an effect is supported by a haptic device.
  -- *
  -- * \param haptic the SDL_Haptic device to query.
  -- * \param effect the desired effect to query.
  -- * \returns true if the effect is supported or false if it isn't.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateHapticEffect
  -- * \sa SDL_GetHapticFeatures
  --  

   function SDL_HapticEffectSupported (haptic : access SDL_Haptic; effect : access constant SDL_HapticEffect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1199
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HapticEffectSupported";

  --*
  -- * Create a new haptic effect on a specified device.
  -- *
  -- * \param haptic an SDL_Haptic device to create the effect on.
  -- * \param effect an SDL_HapticEffect structure containing the properties of
  -- *               the effect to create.
  -- * \returns the ID of the effect on success or -1 on failure; call
  -- *          SDL_GetError() for more information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_DestroyHapticEffect
  -- * \sa SDL_RunHapticEffect
  -- * \sa SDL_UpdateHapticEffect
  --  

   function SDL_CreateHapticEffect (haptic : access SDL_Haptic; effect : access constant SDL_HapticEffect) return SDL_HapticEffectID  -- /usr/local/include/SDL3/SDL_haptic.h:1216
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_CreateHapticEffect";

  --*
  -- * Update the properties of an effect.
  -- *
  -- * Can be used dynamically, although behavior when dynamically changing
  -- * direction may be strange. Specifically the effect may re-upload itself and
  -- * start playing from the start. You also cannot change the type either when
  -- * running SDL_UpdateHapticEffect().
  -- *
  -- * \param haptic the SDL_Haptic device that has the effect.
  -- * \param effect the identifier of the effect to update.
  -- * \param data an SDL_HapticEffect structure containing the new effect
  -- *             properties to use.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateHapticEffect
  -- * \sa SDL_RunHapticEffect
  --  

   function SDL_UpdateHapticEffect
     (haptic : access SDL_Haptic;
      effect : SDL_HapticEffectID;
      data : access constant SDL_HapticEffect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1238
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_UpdateHapticEffect";

  --*
  -- * Run the haptic effect on its associated haptic device.
  -- *
  -- * To repeat the effect over and over indefinitely, set `iterations` to
  -- * `SDL_HAPTIC_INFINITY`. (Repeats the envelope - attack and fade.) To make
  -- * one instance of the effect last indefinitely (so the effect does not fade),
  -- * set the effect's `length` in its structure/union to `SDL_HAPTIC_INFINITY`
  -- * instead.
  -- *
  -- * \param haptic the SDL_Haptic device to run the effect on.
  -- * \param effect the ID of the haptic effect to run.
  -- * \param iterations the number of iterations to run the effect; use
  -- *                   `SDL_HAPTIC_INFINITY` to repeat forever.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticEffectStatus
  -- * \sa SDL_StopHapticEffect
  -- * \sa SDL_StopHapticEffects
  --  

   function SDL_RunHapticEffect
     (haptic : access SDL_Haptic;
      effect : SDL_HapticEffectID;
      iterations : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1262
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RunHapticEffect";

  --*
  -- * Stop the haptic effect on its associated haptic device.
  -- *
  -- * \param haptic the SDL_Haptic device to stop the effect on.
  -- * \param effect the ID of the haptic effect to stop.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RunHapticEffect
  -- * \sa SDL_StopHapticEffects
  --  

   function SDL_StopHapticEffect (haptic : access SDL_Haptic; effect : SDL_HapticEffectID) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1277
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StopHapticEffect";

  --*
  -- * Destroy a haptic effect on the device.
  -- *
  -- * This will stop the effect if it's running. Effects are automatically
  -- * destroyed when the device is closed.
  -- *
  -- * \param haptic the SDL_Haptic device to destroy the effect on.
  -- * \param effect the ID of the haptic effect to destroy.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_CreateHapticEffect
  --  

   procedure SDL_DestroyHapticEffect (haptic : access SDL_Haptic; effect : SDL_HapticEffectID)  -- /usr/local/include/SDL3/SDL_haptic.h:1292
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_DestroyHapticEffect";

  --*
  -- * Get the status of the current effect on the specified haptic device.
  -- *
  -- * Device must support the SDL_HAPTIC_STATUS feature.
  -- *
  -- * \param haptic the SDL_Haptic device to query for the effect status on.
  -- * \param effect the ID of the haptic effect to query its status.
  -- * \returns true if it is playing, false if it isn't playing or haptic status
  -- *          isn't supported.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticFeatures
  --  

   function SDL_GetHapticEffectStatus (haptic : access SDL_Haptic; effect : SDL_HapticEffectID) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1308
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetHapticEffectStatus";

  --*
  -- * Set the global gain of the specified haptic device.
  -- *
  -- * Device must support the SDL_HAPTIC_GAIN feature.
  -- *
  -- * The user may specify the maximum gain by setting the environment variable
  -- * `SDL_HAPTIC_GAIN_MAX` which should be between 0 and 100. All calls to
  -- * SDL_SetHapticGain() will scale linearly using `SDL_HAPTIC_GAIN_MAX` as the
  -- * maximum.
  -- *
  -- * \param haptic the SDL_Haptic device to set the gain on.
  -- * \param gain value to set the gain to, should be between 0 and 100 (0 -
  -- *             100).
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticFeatures
  --  

   function SDL_SetHapticGain (haptic : access SDL_Haptic; gain : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1330
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetHapticGain";

  --*
  -- * Set the global autocenter of the device.
  -- *
  -- * Autocenter should be between 0 and 100. Setting it to 0 will disable
  -- * autocentering.
  -- *
  -- * Device must support the SDL_HAPTIC_AUTOCENTER feature.
  -- *
  -- * \param haptic the SDL_Haptic device to set autocentering on.
  -- * \param autocenter value to set autocenter to (0-100).
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetHapticFeatures
  --  

   function SDL_SetHapticAutocenter (haptic : access SDL_Haptic; autocenter : int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1349
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_SetHapticAutocenter";

  --*
  -- * Pause a haptic device.
  -- *
  -- * Device must support the `SDL_HAPTIC_PAUSE` feature. Call SDL_ResumeHaptic()
  -- * to resume playback.
  -- *
  -- * Do not modify the effects nor add new ones while the device is paused. That
  -- * can cause all sorts of weird errors.
  -- *
  -- * \param haptic the SDL_Haptic device to pause.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_ResumeHaptic
  --  

   function SDL_PauseHaptic (haptic : access SDL_Haptic) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1368
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PauseHaptic";

  --*
  -- * Resume a haptic device.
  -- *
  -- * Call to unpause after SDL_PauseHaptic().
  -- *
  -- * \param haptic the SDL_Haptic device to unpause.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PauseHaptic
  --  

   function SDL_ResumeHaptic (haptic : access SDL_Haptic) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1383
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_ResumeHaptic";

  --*
  -- * Stop all the currently playing effects on a haptic device.
  -- *
  -- * \param haptic the SDL_Haptic device to stop.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RunHapticEffect
  -- * \sa SDL_StopHapticEffects
  --  

   function SDL_StopHapticEffects (haptic : access SDL_Haptic) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1397
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StopHapticEffects";

  --*
  -- * Check whether rumble is supported on a haptic device.
  -- *
  -- * \param haptic haptic device to check for rumble support.
  -- * \returns true if the effect is supported or false if it isn't.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_InitHapticRumble
  --  

   function SDL_HapticRumbleSupported (haptic : access SDL_Haptic) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1409
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HapticRumbleSupported";

  --*
  -- * Initialize a haptic device for simple rumble playback.
  -- *
  -- * \param haptic the haptic device to initialize for simple rumble playback.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PlayHapticRumble
  -- * \sa SDL_StopHapticRumble
  -- * \sa SDL_HapticRumbleSupported
  --  

   function SDL_InitHapticRumble (haptic : access SDL_Haptic) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1424
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_InitHapticRumble";

  --*
  -- * Run a simple rumble effect on a haptic device.
  -- *
  -- * \param haptic the haptic device to play the rumble effect on.
  -- * \param strength strength of the rumble to play as a 0-1 float value.
  -- * \param length length of the rumble to play in milliseconds.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_InitHapticRumble
  -- * \sa SDL_StopHapticRumble
  --  

   function SDL_PlayHapticRumble
     (haptic : access SDL_Haptic;
      strength : float;
      length : SDL3_SDL_stdinc_h.Uint32) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1440
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PlayHapticRumble";

  --*
  -- * Stop the simple rumble on a haptic device.
  -- *
  -- * \param haptic the haptic device to stop the rumble effect on.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_PlayHapticRumble
  --  

   function SDL_StopHapticRumble (haptic : access SDL_Haptic) return Extensions.bool  -- /usr/local/include/SDL3/SDL_haptic.h:1453
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_StopHapticRumble";

  -- Ends C function definitions when using C++  
end SDL3_SDL_haptic_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
