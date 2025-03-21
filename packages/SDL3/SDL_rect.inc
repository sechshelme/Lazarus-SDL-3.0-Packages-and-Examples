
{$IFDEF read_interface}


type
  TSDL_Point = record
    case byte of
      1: (x, y: longint);
      2: (items: array[0..1] of longint);
  end;
  PSDL_Point = ^TSDL_Point;

  TSDL_FPoint = record
    case byte of
      1: (x, y: single);
      2: (items: array[0..1] of single);
  end;
  PSDL_FPoint = ^TSDL_FPoint;

  TSDL_Rect = record
    case byte of
      1: (x, y, w, h: longint);
      2: (items: array[0..3] of longint);
  end;
  PSDL_Rect = ^TSDL_Rect;

  TSDL_FRect = record
    case byte of
      1: (x, y, w, h: single);
      2: (items: array[0..3] of single);
  end;
  PSDL_FRect = ^TSDL_FRect;


function SDL_HasRectIntersection(A: PSDL_Rect; B: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_GetRectIntersection(A: PSDL_Rect; B: PSDL_Rect; Result: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_GetRectUnion(A: PSDL_Rect; B: PSDL_Rect; Result: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_GetRectEnclosingPoints(points: PSDL_Point; Count: longint; clip: PSDL_Rect; Result: PSDL_Rect): Tbool; cdecl; external libSDL3;
function SDL_GetRectAndLineIntersection(rect: PSDL_Rect; X1: Plongint; Y1: Plongint; X2: Plongint; Y2: Plongint): Tbool; cdecl; external libSDL3;

function SDL_HasRectIntersectionFloat(A: PSDL_FRect; B: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_GetRectIntersectionFloat(A: PSDL_FRect; B: PSDL_FRect; Result: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_GetRectUnionFloat(A: PSDL_FRect; B: PSDL_FRect; Result: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_GetRectEnclosingPointsFloat(points: PSDL_FPoint; Count: longint; clip: PSDL_FRect; Result: PSDL_FRect): Tbool; cdecl; external libSDL3;
function SDL_GetRectAndLineIntersectionFloat(rect: PSDL_FRect; X1: Psingle; Y1: Psingle; X2: Psingle; Y2: Psingle): Tbool; cdecl; external libSDL3;

procedure SDL_RectToFRect(const rect: PSDL_Rect; frect: PSDL_FRect); inline;
function SDL_PointInRect(p: PSDL_Point; r: PSDL_Rect): boolean; inline;
function SDL_RectEmpty(r: PSDL_Rect): Boolean; inline;
function SDL_RectsEqual(a: PSDL_Rect; b: PSDL_Rect): boolean; inline;

function SDL_PointInRectFloat(p: PSDL_FPoint; r: PSDL_FRect): boolean; inline;
function SDL_RectEmptyFloat(r: PSDL_FRect): boolean; inline;
function SDL_RectsEqualEpsilon(const a: PSDL_FRect; const b: PSDL_FRect; const Epsilon: single): boolean; inline;
function SDL_RectsEqualFloat(const a: PSDL_FRect; const b: PSDL_FRect): boolean; inline;

{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure SDL_RectToFRect(const rect: PSDL_Rect; frect: PSDL_FRect);
begin
  frect^.x := rect^.x;
  frect^.y := rect^.y;
  frect^.w := rect^.w;
  frect^.h := rect^.h;
end;

function SDL_PointInRect(p: PSDL_Point; r: PSDL_Rect): boolean;
begin
  Result := (p <> nil) and (r <> nil) and
    (p^.x >= r^.x) and (p^.x < (r^.x + r^.w)) and
    (p^.y >= r^.y) and (p^.y < (r^.y + r^.h));
end;

function SDL_RectEmpty(r: PSDL_Rect): Boolean;
begin
  if (r = nil) or (r^.w <= 0) or (r^.h <= 0) then begin
    Result := True;
  end else begin
    Result := False;
  end;
end;

function SDL_RectsEqual(a: PSDL_Rect; b: PSDL_Rect): boolean;
begin
  Result := (a <> nil) and (b <> nil) and
    (a^.x = b^.x) and (a^.y = b^.y) and
    (a^.w = b^.w) and (a^.h = b^.h);
end;

// ====

function SDL_PointInRectFloat(p: PSDL_FPoint; r: PSDL_FRect): boolean;
begin
  Result := (p <> nil) and (r <> nil) and
    (p^.x >= r^.x) and (p^.x <= (r^.x + r^.w)) and
    (p^.y >= r^.y) and (p^.y <= (r^.y + r^.h));
end;

function SDL_RectEmptyFloat(r: PSDL_FRect): boolean;
begin
  Result := (r = nil) or (r^.w < 0.0) or (r^.h < 0.0);
end;

function SDL_RectsEqualEpsilon(const a: PSDL_FRect; const b: PSDL_FRect; const Epsilon: single): boolean;
begin
  Result := (a <> nil) and (b <> nil) and ((a = b) or
    ((SDL_fabsf(a^.x - b^.x) <= Epsilon) and
    (SDL_fabsf(a^.y - b^.y) <= Epsilon) and
    (SDL_fabsf(a^.w - b^.w) <= Epsilon) and
    (SDL_fabsf(a^.h - b^.h) <= Epsilon)));
end;

function SDL_RectsEqualFloat(const a: PSDL_FRect; const b: PSDL_FRect): boolean;
begin
  Result := SDL_RectsEqualEpsilon(a, b, SDL_FLT_EPSILON);
end;

{$ENDIF read_implementation}
