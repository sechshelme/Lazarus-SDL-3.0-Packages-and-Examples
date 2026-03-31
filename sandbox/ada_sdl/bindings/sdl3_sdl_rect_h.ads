pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

package SDL3_SDL_rect_h is

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
  -- * # CategoryRect
  -- *
  -- * Some helper functions for managing rectangles and 2D points, in both
  -- * integer and floating point versions.
  --  

  -- Set up for C function definitions, even when using C++  
  --*
  -- * The structure that defines a point (using integers).
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRectEnclosingPoints
  -- * \sa SDL_PointInRect
  --  

   type SDL_Point is record
      x : aliased int;  -- /usr/local/include/SDL3/SDL_rect.h:51
      y : aliased int;  -- /usr/local/include/SDL3/SDL_rect.h:52
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_rect.h:49

  --*
  -- * The structure that defines a point (using floating point values).
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRectEnclosingPointsFloat
  -- * \sa SDL_PointInRectFloat
  --  

   type SDL_FPoint is record
      x : aliased float;  -- /usr/local/include/SDL3/SDL_rect.h:65
      y : aliased float;  -- /usr/local/include/SDL3/SDL_rect.h:66
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_rect.h:63

  --*
  -- * A rectangle, with the origin at the upper left (using integers).
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RectEmpty
  -- * \sa SDL_RectsEqual
  -- * \sa SDL_HasRectIntersection
  -- * \sa SDL_GetRectIntersection
  -- * \sa SDL_GetRectAndLineIntersection
  -- * \sa SDL_GetRectUnion
  -- * \sa SDL_GetRectEnclosingPoints
  --  

   type SDL_Rect is record
      x : aliased int;  -- /usr/local/include/SDL3/SDL_rect.h:85
      y : aliased int;  -- /usr/local/include/SDL3/SDL_rect.h:85
      w : aliased int;  -- /usr/local/include/SDL3/SDL_rect.h:86
      h : aliased int;  -- /usr/local/include/SDL3/SDL_rect.h:86
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_rect.h:83

  --*
  -- * A rectangle stored using floating point values.
  -- *
  -- * The origin of the coordinate space is in the top-left, with increasing
  -- * values moving down and right. The properties `x` and `y` represent the
  -- * coordinates of the top-left corner of the rectangle.
  -- *
  -- * \since This struct is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RectEmptyFloat
  -- * \sa SDL_RectsEqualFloat
  -- * \sa SDL_RectsEqualEpsilon
  -- * \sa SDL_HasRectIntersectionFloat
  -- * \sa SDL_GetRectIntersectionFloat
  -- * \sa SDL_GetRectAndLineIntersectionFloat
  -- * \sa SDL_GetRectUnionFloat
  -- * \sa SDL_GetRectEnclosingPointsFloat
  -- * \sa SDL_PointInRectFloat
  --  

   type SDL_FRect is record
      x : aliased float;  -- /usr/local/include/SDL3/SDL_rect.h:111
      y : aliased float;  -- /usr/local/include/SDL3/SDL_rect.h:112
      w : aliased float;  -- /usr/local/include/SDL3/SDL_rect.h:113
      h : aliased float;  -- /usr/local/include/SDL3/SDL_rect.h:114
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/local/include/SDL3/SDL_rect.h:109

  --*
  -- * Convert an SDL_Rect to SDL_FRect
  -- *
  -- * \param rect a pointer to an SDL_Rect.
  -- * \param frect a pointer filled in with the floating point representation of
  -- *              `rect`.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   procedure SDL_RectToFRect (rect : access constant SDL_Rect; frect : access SDL_FRect)  -- /usr/local/include/SDL3/SDL_rect.h:129
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RectToFRect";

  --*
  -- * Determine whether a point resides inside a rectangle.
  -- *
  -- * A point is considered part of a rectangle if both `p` and `r` are not NULL,
  -- * and `p`'s x and y coordinates are >= to the rectangle's top left corner,
  -- * and < the rectangle's x+w and y+h. So a 1x1 rectangle considers point (0,0)
  -- * as "inside" and (0,1) as not.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param p the point to test.
  -- * \param r the rectangle to test.
  -- * \returns true if `p` is contained by `r`, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_PointInRect (p : access constant SDL_Point; r : access constant SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:158
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PointInRect";

  --*
  -- * Determine whether a rectangle has no area.
  -- *
  -- * A rectangle is considered "empty" for this function if `r` is NULL, or if
  -- * `r`'s width and/or height are <= 0.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param r the rectangle to test.
  -- * \returns true if the rectangle is "empty", false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_RectEmpty (r : access constant SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:182
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RectEmpty";

  --*
  -- * Determine whether two rectangles are equal.
  -- *
  -- * Rectangles are considered equal if both are not NULL and each of their x,
  -- * y, width and height match.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param a the first rectangle to test.
  -- * \param b the second rectangle to test.
  -- * \returns true if the rectangles are equal, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_RectsEqual (a : access constant SDL_Rect; b : access constant SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:206
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RectsEqual";

  --*
  -- * Determine whether two rectangles intersect.
  -- *
  -- * If either pointer is NULL the function will return false.
  -- *
  -- * \param A an SDL_Rect structure representing the first rectangle.
  -- * \param B an SDL_Rect structure representing the second rectangle.
  -- * \returns true if there is an intersection, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRectIntersection
  --  

   function SDL_HasRectIntersection (A : access constant SDL_Rect; B : access constant SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:227
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasRectIntersection";

  --*
  -- * Calculate the intersection of two rectangles.
  -- *
  -- * If `result` is NULL then this function will return false.
  -- *
  -- * \param A an SDL_Rect structure representing the first rectangle.
  -- * \param B an SDL_Rect structure representing the second rectangle.
  -- * \param result an SDL_Rect structure filled in with the intersection of
  -- *               rectangles `A` and `B`.
  -- * \returns true if there is an intersection, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasRectIntersection
  --  

   function SDL_GetRectIntersection
     (A : access constant SDL_Rect;
      B : access constant SDL_Rect;
      result : access SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:244
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectIntersection";

  --*
  -- * Calculate the union of two rectangles.
  -- *
  -- * \param A an SDL_Rect structure representing the first rectangle.
  -- * \param B an SDL_Rect structure representing the second rectangle.
  -- * \param result an SDL_Rect structure filled in with the union of rectangles
  -- *               `A` and `B`.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRectUnion
     (A : access constant SDL_Rect;
      B : access constant SDL_Rect;
      result : access SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:258
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectUnion";

  --*
  -- * Calculate a minimal rectangle enclosing a set of points.
  -- *
  -- * If `clip` is not NULL then only points inside of the clipping rectangle are
  -- * considered.
  -- *
  -- * \param points an array of SDL_Point structures representing points to be
  -- *               enclosed.
  -- * \param count the number of structures in the `points` array.
  -- * \param clip an SDL_Rect used for clipping or NULL to enclose all points.
  -- * \param result an SDL_Rect structure filled in with the minimal enclosing
  -- *               rectangle.
  -- * \returns true if any points were enclosed or false if all the points were
  -- *          outside of the clipping rectangle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRectEnclosingPoints
     (points : access constant SDL_Point;
      count : int;
      clip : access constant SDL_Rect;
      result : access SDL_Rect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:277
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectEnclosingPoints";

  --*
  -- * Calculate the intersection of a rectangle and line segment.
  -- *
  -- * This function is used to clip a line segment to a rectangle. A line segment
  -- * contained entirely within the rectangle or that does not intersect will
  -- * remain unchanged. A line segment that crosses the rectangle at either or
  -- * both ends will be clipped to the boundary of the rectangle and the new
  -- * coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
  -- *
  -- * \param rect an SDL_Rect structure representing the rectangle to intersect.
  -- * \param X1 a pointer to the starting X-coordinate of the line.
  -- * \param Y1 a pointer to the starting Y-coordinate of the line.
  -- * \param X2 a pointer to the ending X-coordinate of the line.
  -- * \param Y2 a pointer to the ending Y-coordinate of the line.
  -- * \returns true if there is an intersection, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRectAndLineIntersection
     (rect : access constant SDL_Rect;
      X1 : access int;
      Y1 : access int;
      X2 : access int;
      Y2 : access int) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:297
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectAndLineIntersection";

  -- SDL_FRect versions...  
  --*
  -- * Determine whether a point resides inside a floating point rectangle.
  -- *
  -- * A point is considered part of a rectangle if both `p` and `r` are not NULL,
  -- * and `p`'s x and y coordinates are >= to the rectangle's top left corner,
  -- * and <= the rectangle's x+w and y+h. So a 1x1 rectangle considers point
  -- * (0,0) and (0,1) as "inside" and (0,2) as not.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param p the point to test.
  -- * \param r the rectangle to test.
  -- * \returns true if `p` is contained by `r`, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_PointInRectFloat (p : access constant SDL_FPoint; r : access constant SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:323
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_PointInRectFloat";

  --*
  -- * Determine whether a floating point rectangle takes no space.
  -- *
  -- * A rectangle is considered "empty" for this function if `r` is NULL, or if
  -- * `r`'s width and/or height are < 0.0f.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param r the rectangle to test.
  -- * \returns true if the rectangle is "empty", false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_RectEmptyFloat (r : access constant SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:347
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RectEmptyFloat";

  --*
  -- * Determine whether two floating point rectangles are equal, within some
  -- * given epsilon.
  -- *
  -- * Rectangles are considered equal if both are not NULL and each of their x,
  -- * y, width and height are within `epsilon` of each other. If you don't know
  -- * what value to use for `epsilon`, you should call the SDL_RectsEqualFloat
  -- * function instead.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param a the first rectangle to test.
  -- * \param b the second rectangle to test.
  -- * \param epsilon the epsilon value for comparison.
  -- * \returns true if the rectangles are equal, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RectsEqualFloat
  --  

   function SDL_RectsEqualEpsilon
     (a : access constant SDL_FRect;
      b : access constant SDL_FRect;
      epsilon : float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:377
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RectsEqualEpsilon";

  --*
  -- * Determine whether two floating point rectangles are equal, within a default
  -- * epsilon.
  -- *
  -- * Rectangles are considered equal if both are not NULL and each of their x,
  -- * y, width and height are within SDL_FLT_EPSILON of each other. This is often
  -- * a reasonable way to compare two floating point rectangles and deal with the
  -- * slight precision variations in floating point calculations that tend to pop
  -- * up.
  -- *
  -- * Note that this is a forced-inline function in a header, and not a public
  -- * API function available in the SDL library (which is to say, the code is
  -- * embedded in the calling program and the linker and dynamic loader will not
  -- * be able to find this function inside SDL itself).
  -- *
  -- * \param a the first rectangle to test.
  -- * \param b the second rectangle to test.
  -- * \returns true if the rectangles are equal, false otherwise.
  -- *
  -- * \threadsafety It is safe to call this function from any thread.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_RectsEqualEpsilon
  --  

   function SDL_RectsEqualFloat (a : access constant SDL_FRect; b : access constant SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:412
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_RectsEqualFloat";

  --*
  -- * Determine whether two rectangles intersect with float precision.
  -- *
  -- * If either pointer is NULL the function will return false.
  -- *
  -- * \param A an SDL_FRect structure representing the first rectangle.
  -- * \param B an SDL_FRect structure representing the second rectangle.
  -- * \returns true if there is an intersection, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_GetRectIntersection
  --  

   function SDL_HasRectIntersectionFloat (A : access constant SDL_FRect; B : access constant SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:430
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_HasRectIntersectionFloat";

  --*
  -- * Calculate the intersection of two rectangles with float precision.
  -- *
  -- * If `result` is NULL then this function will return false.
  -- *
  -- * \param A an SDL_FRect structure representing the first rectangle.
  -- * \param B an SDL_FRect structure representing the second rectangle.
  -- * \param result an SDL_FRect structure filled in with the intersection of
  -- *               rectangles `A` and `B`.
  -- * \returns true if there is an intersection, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HasRectIntersectionFloat
  --  

   function SDL_GetRectIntersectionFloat
     (A : access constant SDL_FRect;
      B : access constant SDL_FRect;
      result : access SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:447
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectIntersectionFloat";

  --*
  -- * Calculate the union of two rectangles with float precision.
  -- *
  -- * \param A an SDL_FRect structure representing the first rectangle.
  -- * \param B an SDL_FRect structure representing the second rectangle.
  -- * \param result an SDL_FRect structure filled in with the union of rectangles
  -- *               `A` and `B`.
  -- * \returns true on success or false on failure; call SDL_GetError() for more
  -- *          information.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRectUnionFloat
     (A : access constant SDL_FRect;
      B : access constant SDL_FRect;
      result : access SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:461
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectUnionFloat";

  --*
  -- * Calculate a minimal rectangle enclosing a set of points with float
  -- * precision.
  -- *
  -- * If `clip` is not NULL then only points inside of the clipping rectangle are
  -- * considered.
  -- *
  -- * \param points an array of SDL_FPoint structures representing points to be
  -- *               enclosed.
  -- * \param count the number of structures in the `points` array.
  -- * \param clip an SDL_FRect used for clipping or NULL to enclose all points.
  -- * \param result an SDL_FRect structure filled in with the minimal enclosing
  -- *               rectangle.
  -- * \returns true if any points were enclosed or false if all the points were
  -- *          outside of the clipping rectangle.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRectEnclosingPointsFloat
     (points : access constant SDL_FPoint;
      count : int;
      clip : access constant SDL_FRect;
      result : access SDL_FRect) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:481
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectEnclosingPointsFloat";

  --*
  -- * Calculate the intersection of a rectangle and line segment with float
  -- * precision.
  -- *
  -- * This function is used to clip a line segment to a rectangle. A line segment
  -- * contained entirely within the rectangle or that does not intersect will
  -- * remain unchanged. A line segment that crosses the rectangle at either or
  -- * both ends will be clipped to the boundary of the rectangle and the new
  -- * coordinates saved in `X1`, `Y1`, `X2`, and/or `Y2` as necessary.
  -- *
  -- * \param rect an SDL_FRect structure representing the rectangle to intersect.
  -- * \param X1 a pointer to the starting X-coordinate of the line.
  -- * \param Y1 a pointer to the starting Y-coordinate of the line.
  -- * \param X2 a pointer to the ending X-coordinate of the line.
  -- * \param Y2 a pointer to the ending Y-coordinate of the line.
  -- * \returns true if there is an intersection, false otherwise.
  -- *
  -- * \since This function is available since SDL 3.2.0.
  --  

   function SDL_GetRectAndLineIntersectionFloat
     (rect : access constant SDL_FRect;
      X1 : access float;
      Y1 : access float;
      X2 : access float;
      Y2 : access float) return Extensions.bool  -- /usr/local/include/SDL3/SDL_rect.h:502
   with Import => True, 
        Convention => C, 
        External_Name => "SDL_GetRectAndLineIntersectionFloat";

  -- Ends C function definitions when using C++  
end SDL3_SDL_rect_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
