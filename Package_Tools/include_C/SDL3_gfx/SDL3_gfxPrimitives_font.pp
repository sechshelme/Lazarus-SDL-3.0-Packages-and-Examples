
unit SDL3_gfxPrimitives_font;
interface

{
  Automatically converted by H2Pas 1.0.0 from SDL3_gfxPrimitives_font.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SDL3_gfxPrimitives_font.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{

SDL3_gfxPrimitives_font.h: 8x8 font definition

Copyright (C) 2012-2014  Andreas Schiffler

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
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

3. This notice may not be removed or altered from any source
distribution.

Andreas Schiffler -- aschiffler at ferzkopp dot net

 }

const
  GFX_FONTDATAMAX = 8*256;  
(* error 
static unsigned char gfxPrimitivesFontdata[GFX_FONTDATAMAX] = {
{
	* 0 0x00 '^@' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 1 0x01 '^A' 
	 }
{ 01111110  }
{ 10000001  }
{ 10100101  }
{ 10000001  }
{ 10111101  }
{ 10011001  }
{ 10000001  }
{ 01111110  }
{
	* 2 0x02 '^B' 
	 }
{ 01111110  }
{ 11111111  }
{ 11011011  }
{ 11111111  }
{ 11000011  }
{ 11100111  }
{ 11111111  }
{ 01111110  }
{
	* 3 0x03 '^C' 
	 }
{ 01101100  }
{ 11111110  }
{ 11111110  }
{ 11111110  }
{ 01111100  }
{ 00111000  }
{ 00010000  }
{ 00000000  }
{
	* 4 0x04 '^D' 
	 }
{ 00010000  }
{ 00111000  }
{ 01111100  }
{ 11111110  }
{ 01111100  }
{ 00111000  }
{ 00010000  }
{ 00000000  }
{
	* 5 0x05 '^E' 
	 }
{ 00111000  }
{ 01111100  }
{ 00111000  }
{ 11111110  }
{ 11111110  }
{ 11010110  }
{ 00010000  }
{ 00111000  }
{
	* 6 0x06 '^F' 
	 }
{ 00010000  }
{ 00111000  }
{ 01111100  }
{ 11111110  }
{ 11111110  }
{ 01111100  }
{ 00010000  }
{ 00111000  }
{
	* 7 0x07 '^G' 
	 }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00111100  }
{ 00111100  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{
	* 8 0x08 '^H' 
	 }
{ 11111111  }
{ 11111111  }
{ 11100111  }
{ 11000011  }
{ 11000011  }
{ 11100111  }
{ 11111111  }
{ 11111111  }
{
	* 9 0x09 '^I' 
	 }
{ 00000000  }
{ 00111100  }
{ 01100110  }
{ 01000010  }
{ 01000010  }
{ 01100110  }
{ 00111100  }
{ 00000000  }
{
	* 10 0x0a '^J' 
	 }
{ 11111111  }
{ 11000011  }
{ 10011001  }
{ 10111101  }
{ 10111101  }
{ 10011001  }
{ 11000011  }
{ 11111111  }
{
	* 11 0x0b '^K' 
	 }
{ 00001111  }
{ 00000111  }
{ 00001111  }
{ 01111101  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01111000  }
{
	* 12 0x0c '^L' 
	 }
{ 00111100  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{ 00011000  }
{ 01111110  }
{ 00011000  }
{
	* 13 0x0d '^M' 
	 }
{ 00111111  }
{ 00110011  }
{ 00111111  }
{ 00110000  }
{ 00110000  }
{ 01110000  }
{ 11110000  }
{ 11100000  }
{
	* 14 0x0e '^N' 
	 }
{ 01111111  }
{ 01100011  }
{ 01111111  }
{ 01100011  }
{ 01100011  }
{ 01100111  }
{ 11100110  }
{ 11000000  }
{
	* 15 0x0f '^O' 
	 }
{ 00011000  }
{ 11011011  }
{ 00111100  }
{ 11100111  }
{ 11100111  }
{ 00111100  }
{ 11011011  }
{ 00011000  }
{
	* 16 0x10 '^P' 
	 }
{ 10000000  }
{ 11100000  }
{ 11111000  }
{ 11111110  }
{ 11111000  }
{ 11100000  }
{ 10000000  }
{ 00000000  }
{
	* 17 0x11 '^Q' 
	 }
{ 00000010  }
{ 00001110  }
{ 00111110  }
{ 11111110  }
{ 00111110  }
{ 00001110  }
{ 00000010  }
{ 00000000  }
{
	* 18 0x12 '^R' 
	 }
{ 00011000  }
{ 00111100  }
{ 01111110  }
{ 00011000  }
{ 00011000  }
{ 01111110  }
{ 00111100  }
{ 00011000  }
{
	* 19 0x13 '^S' 
	 }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 00000000  }
{ 01100110  }
{ 00000000  }
{
	* 20 0x14 '^T' 
	 }
{ 01111111  }
{ 11011011  }
{ 11011011  }
{ 01111011  }
{ 00011011  }
{ 00011011  }
{ 00011011  }
{ 00000000  }
{
	* 21 0x15 '^U' 
	 }
{ 00111110  }
{ 01100001  }
{ 00111100  }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{ 10000110  }
{ 01111100  }
{
	* 22 0x16 '^V' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 01111110  }
{ 01111110  }
{ 00000000  }
{
	* 23 0x17 '^W' 
	 }
{ 00011000  }
{ 00111100  }
{ 01111110  }
{ 00011000  }
{ 01111110  }
{ 00111100  }
{ 00011000  }
{ 11111111  }
{
	* 24 0x18 '^X' 
	 }
{ 00011000  }
{ 00111100  }
{ 01111110  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{
	* 25 0x19 '^Y' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 01111110  }
{ 00111100  }
{ 00011000  }
{ 00000000  }
{
	* 26 0x1a '^Z' 
	 }
{ 00000000  }
{ 00011000  }
{ 00001100  }
{ 11111110  }
{ 00001100  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{
	* 27 0x1b '^[' 
	 }
{ 00000000  }
{ 00110000  }
{ 01100000  }
{ 11111110  }
{ 01100000  }
{ 00110000  }
{ 00000000  }
{ 00000000  }
{
	* 28 0x1c '^\' 
	 }
{ 00000000  }
{ 00000000  }
{ 11000000  }
{ 11000000  }
{ 11000000  }
{ 11111110  }
{ 00000000  }
{ 00000000  }
{
	* 29 0x1d '^]' 
	 }
{ 00000000  }
{ 00100100  }
{ 01100110  }
{ 11111111  }
{ 01100110  }
{ 00100100  }
{ 00000000  }
{ 00000000  }
{
	* 30 0x1e '^^' 
	 }
{ 00000000  }
{ 00011000  }
{ 00111100  }
{ 01111110  }
{ 11111111  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{
	* 31 0x1f '^_' 
	 }
{ 00000000  }
{ 11111111  }
{ 11111111  }
{ 01111110  }
{ 00111100  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{
	* 32 0x20 ' ' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 33 0x21 '!' 
	 }
{ 00011000  }
{ 00111100  }
{ 00111100  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 00011000  }
{ 00000000  }
{
	* 34 0x22 '"' 
	 }
{ 01100110  }
{ 01100110  }
{ 00100100  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 35 0x23 '#' 
	 }
{ 01101100  }
{ 01101100  }
{ 11111110  }
{ 01101100  }
{ 11111110  }
{ 01101100  }
{ 01101100  }
{ 00000000  }
{
	* 36 0x24 '$' 
	 }
{ 00011000  }
{ 00111110  }
{ 01100000  }
{ 00111100  }
{ 00000110  }
{ 01111100  }
{ 00011000  }
{ 00000000  }
{
	* 37 0x25 '%' 
	 }
{ 00000000  }
{ 11000110  }
{ 11001100  }
{ 00011000  }
{ 00110000  }
{ 01100110  }
{ 11000110  }
{ 00000000  }
{
	* 38 0x26 '&' 
	 }
{ 00111000  }
{ 01101100  }
{ 00111000  }
{ 01110110  }
{ 11011100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 39 0x27 ''' 
	 }
{ 00011000  }
{ 00011000  }
{ 00110000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 40 0x28 '(' 
	 }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 00110000  }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00000000  }
{
	* 41 0x29 ')' 
	 }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00001100  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 00000000  }
{
	* 42 0x2a '*' 
	 }
{ 00000000  }
{ 01100110  }
{ 00111100  }
{ 11111111  }
{ 00111100  }
{ 01100110  }
{ 00000000  }
{ 00000000  }
{
	* 43 0x2b '+' 
	 }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 01111110  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{
	* 44 0x2c ',' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00110000  }
{
	* 45 0x2d '-' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 46 0x2e '.' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{
	* 47 0x2f '/' 
	 }
{ 00000110  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 01100000  }
{ 11000000  }
{ 10000000  }
{ 00000000  }
{
	* 48 0x30 '0' 
	 }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11010110  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{
	* 49 0x31 '1' 
	 }
{ 00011000  }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 01111110  }
{ 00000000  }
{
	* 50 0x32 '2' 
	 }
{ 01111100  }
{ 11000110  }
{ 00000110  }
{ 00011100  }
{ 00110000  }
{ 01100110  }
{ 11111110  }
{ 00000000  }
{
	* 51 0x33 '3' 
	 }
{ 01111100  }
{ 11000110  }
{ 00000110  }
{ 00111100  }
{ 00000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 52 0x34 '4' 
	 }
{ 00011100  }
{ 00111100  }
{ 01101100  }
{ 11001100  }
{ 11111110  }
{ 00001100  }
{ 00011110  }
{ 00000000  }
{
	* 53 0x35 '5' 
	 }
{ 11111110  }
{ 11000000  }
{ 11000000  }
{ 11111100  }
{ 00000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 54 0x36 '6' 
	 }
{ 00111000  }
{ 01100000  }
{ 11000000  }
{ 11111100  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 55 0x37 '7' 
	 }
{ 11111110  }
{ 11000110  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 00110000  }
{ 00110000  }
{ 00000000  }
{
	* 56 0x38 '8' 
	 }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 57 0x39 '9' 
	 }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 01111110  }
{ 00000110  }
{ 00001100  }
{ 01111000  }
{ 00000000  }
{
	* 58 0x3a ':' 
	 }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{
	* 59 0x3b ';' 
	 }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00110000  }
{
	* 60 0x3c '<' 
	 }
{ 00000110  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00000110  }
{ 00000000  }
{
	* 61 0x3d '=' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{ 00000000  }
{
	* 62 0x3e '>' 
	 }
{ 01100000  }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 01100000  }
{ 00000000  }
{
	* 63 0x3f '?' 
	 }
{ 01111100  }
{ 11000110  }
{ 00001100  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 00011000  }
{ 00000000  }
{
	* 64 0x40 '@' 
	 }
{ 01111100  }
{ 11000110  }
{ 11011110  }
{ 11011110  }
{ 11011110  }
{ 11000000  }
{ 01111000  }
{ 00000000  }
{
	* 65 0x41 'A' 
	 }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11111110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 66 0x42 'B' 
	 }
{ 11111100  }
{ 01100110  }
{ 01100110  }
{ 01111100  }
{ 01100110  }
{ 01100110  }
{ 11111100  }
{ 00000000  }
{
	* 67 0x43 'C' 
	 }
{ 00111100  }
{ 01100110  }
{ 11000000  }
{ 11000000  }
{ 11000000  }
{ 01100110  }
{ 00111100  }
{ 00000000  }
{
	* 68 0x44 'D' 
	 }
{ 11111000  }
{ 01101100  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 01101100  }
{ 11111000  }
{ 00000000  }
{
	* 69 0x45 'E' 
	 }
{ 11111110  }
{ 01100010  }
{ 01101000  }
{ 01111000  }
{ 01101000  }
{ 01100010  }
{ 11111110  }
{ 00000000  }
{
	* 70 0x46 'F' 
	 }
{ 11111110  }
{ 01100010  }
{ 01101000  }
{ 01111000  }
{ 01101000  }
{ 01100000  }
{ 11110000  }
{ 00000000  }
{
	* 71 0x47 'G' 
	 }
{ 00111100  }
{ 01100110  }
{ 11000000  }
{ 11000000  }
{ 11001110  }
{ 01100110  }
{ 00111010  }
{ 00000000  }
{
	* 72 0x48 'H' 
	 }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11111110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 73 0x49 'I' 
	 }
{ 00111100  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 74 0x4a 'J' 
	 }
{ 00011110  }
{ 00001100  }
{ 00001100  }
{ 00001100  }
{ 11001100  }
{ 11001100  }
{ 01111000  }
{ 00000000  }
{
	* 75 0x4b 'K' 
	 }
{ 11100110  }
{ 01100110  }
{ 01101100  }
{ 01111000  }
{ 01101100  }
{ 01100110  }
{ 11100110  }
{ 00000000  }
{
	* 76 0x4c 'L' 
	 }
{ 11110000  }
{ 01100000  }
{ 01100000  }
{ 01100000  }
{ 01100010  }
{ 01100110  }
{ 11111110  }
{ 00000000  }
{
	* 77 0x4d 'M' 
	 }
{ 11000110  }
{ 11101110  }
{ 11111110  }
{ 11111110  }
{ 11010110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 78 0x4e 'N' 
	 }
{ 11000110  }
{ 11100110  }
{ 11110110  }
{ 11011110  }
{ 11001110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 79 0x4f 'O' 
	 }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 80 0x50 'P' 
	 }
{ 11111100  }
{ 01100110  }
{ 01100110  }
{ 01111100  }
{ 01100000  }
{ 01100000  }
{ 11110000  }
{ 00000000  }
{
	* 81 0x51 'Q' 
	 }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11001110  }
{ 01111100  }
{ 00001110  }
{
	* 82 0x52 'R' 
	 }
{ 11111100  }
{ 01100110  }
{ 01100110  }
{ 01111100  }
{ 01101100  }
{ 01100110  }
{ 11100110  }
{ 00000000  }
{
	* 83 0x53 'S' 
	 }
{ 00111100  }
{ 01100110  }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 01100110  }
{ 00111100  }
{ 00000000  }
{
	* 84 0x54 'T' 
	 }
{ 01111110  }
{ 01111110  }
{ 01011010  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 85 0x55 'U' 
	 }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 86 0x56 'V' 
	 }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{
	* 87 0x57 'W' 
	 }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11010110  }
{ 11010110  }
{ 11111110  }
{ 01101100  }
{ 00000000  }
{
	* 88 0x58 'X' 
	 }
{ 11000110  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 89 0x59 'Y' 
	 }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 90 0x5a 'Z' 
	 }
{ 11111110  }
{ 11000110  }
{ 10001100  }
{ 00011000  }
{ 00110010  }
{ 01100110  }
{ 11111110  }
{ 00000000  }
{
	* 91 0x5b '[' 
	 }
{ 00111100  }
{ 00110000  }
{ 00110000  }
{ 00110000  }
{ 00110000  }
{ 00110000  }
{ 00111100  }
{ 00000000  }
{
	* 92 0x5c '\' 
	 }
{ 11000000  }
{ 01100000  }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00000110  }
{ 00000010  }
{ 00000000  }
{
	* 93 0x5d ']' 
	 }
{ 00111100  }
{ 00001100  }
{ 00001100  }
{ 00001100  }
{ 00001100  }
{ 00001100  }
{ 00111100  }
{ 00000000  }
{
	* 94 0x5e '^' 
	 }
{ 00010000  }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 95 0x5f '_' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{
	* 96 0x60 '`' 
	 }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 97 0x61 'a' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111000  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 98 0x62 'b' 
	 }
{ 11100000  }
{ 01100000  }
{ 01111100  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 11011100  }
{ 00000000  }
{
	* 99 0x63 'c' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111100  }
{ 11000110  }
{ 11000000  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 100 0x64 'd' 
	 }
{ 00011100  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 101 0x65 'e' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111100  }
{ 11000110  }
{ 11111110  }
{ 11000000  }
{ 01111100  }
{ 00000000  }
{
	* 102 0x66 'f' 
	 }
{ 00111100  }
{ 01100110  }
{ 01100000  }
{ 11111000  }
{ 01100000  }
{ 01100000  }
{ 11110000  }
{ 00000000  }
{
	* 103 0x67 'g' 
	 }
{ 00000000  }
{ 00000000  }
{ 01110110  }
{ 11001100  }
{ 11001100  }
{ 01111100  }
{ 00001100  }
{ 11111000  }
{
	* 104 0x68 'h' 
	 }
{ 11100000  }
{ 01100000  }
{ 01101100  }
{ 01110110  }
{ 01100110  }
{ 01100110  }
{ 11100110  }
{ 00000000  }
{
	* 105 0x69 'i' 
	 }
{ 00011000  }
{ 00000000  }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 106 0x6a 'j' 
	 }
{ 00000110  }
{ 00000000  }
{ 00000110  }
{ 00000110  }
{ 00000110  }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{
	* 107 0x6b 'k' 
	 }
{ 11100000  }
{ 01100000  }
{ 01100110  }
{ 01101100  }
{ 01111000  }
{ 01101100  }
{ 11100110  }
{ 00000000  }
{
	* 108 0x6c 'l' 
	 }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 109 0x6d 'm' 
	 }
{ 00000000  }
{ 00000000  }
{ 11101100  }
{ 11111110  }
{ 11010110  }
{ 11010110  }
{ 11010110  }
{ 00000000  }
{
	* 110 0x6e 'n' 
	 }
{ 00000000  }
{ 00000000  }
{ 11011100  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 00000000  }
{
	* 111 0x6f 'o' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 112 0x70 'p' 
	 }
{ 00000000  }
{ 00000000  }
{ 11011100  }
{ 01100110  }
{ 01100110  }
{ 01111100  }
{ 01100000  }
{ 11110000  }
{
	* 113 0x71 'q' 
	 }
{ 00000000  }
{ 00000000  }
{ 01110110  }
{ 11001100  }
{ 11001100  }
{ 01111100  }
{ 00001100  }
{ 00011110  }
{
	* 114 0x72 'r' 
	 }
{ 00000000  }
{ 00000000  }
{ 11011100  }
{ 01110110  }
{ 01100000  }
{ 01100000  }
{ 11110000  }
{ 00000000  }
{
	* 115 0x73 's' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 11000000  }
{ 01111100  }
{ 00000110  }
{ 11111100  }
{ 00000000  }
{
	* 116 0x74 't' 
	 }
{ 00110000  }
{ 00110000  }
{ 11111100  }
{ 00110000  }
{ 00110000  }
{ 00110110  }
{ 00011100  }
{ 00000000  }
{
	* 117 0x75 'u' 
	 }
{ 00000000  }
{ 00000000  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 118 0x76 'v' 
	 }
{ 00000000  }
{ 00000000  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{
	* 119 0x77 'w' 
	 }
{ 00000000  }
{ 00000000  }
{ 11000110  }
{ 11010110  }
{ 11010110  }
{ 11111110  }
{ 01101100  }
{ 00000000  }
{
	* 120 0x78 'x' 
	 }
{ 00000000  }
{ 00000000  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 00000000  }
{
	* 121 0x79 'y' 
	 }
{ 00000000  }
{ 00000000  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111110  }
{ 00000110  }
{ 11111100  }
{
	* 122 0x7a 'z' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 01001100  }
{ 00011000  }
{ 00110010  }
{ 01111110  }
{ 00000000  }
{
	* 123 0x7b '' 
	 }
{ 00001110  }
{ 00011000  }
{ 00011000  }
{ 01110000  }
{ 00011000  }
{ 00011000  }
{ 00001110  }
{ 00000000  }
{
	* 124 0x7c '|' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{
	* 125 0x7d '' 
	 }
{ 01110000  }
{ 00011000  }
{ 00011000  }
{ 00001110  }
{ 00011000  }
{ 00011000  }
{ 01110000  }
{ 00000000  }
{
	* 126 0x7e '~' 
	 }
{ 01110110  }
{ 11011100  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 127 0x7f '' 
	 }
{ 00000000  }
{ 00010000  }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11000110  }
{ 11111110  }
{ 00000000  }
{
	* 128 0x80 '�' 
	 }
{ 01111100  }
{ 11000110  }
{ 11000000  }
{ 11000000  }
{ 11000110  }
{ 01111100  }
{ 00001100  }
{ 01111000  }
{
	* 129 0x81 '�' 
	 }
{ 11001100  }
{ 00000000  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 130 0x82 '�' 
	 }
{ 00001100  }
{ 00011000  }
{ 01111100  }
{ 11000110  }
{ 11111110  }
{ 11000000  }
{ 01111100  }
{ 00000000  }
{
	* 131 0x83 '�' 
	 }
{ 01111100  }
{ 10000010  }
{ 01111000  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 132 0x84 '�' 
	 }
{ 11000110  }
{ 00000000  }
{ 01111000  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 133 0x85 '�' 
	 }
{ 00110000  }
{ 00011000  }
{ 01111000  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 134 0x86 '�' 
	 }
{ 00110000  }
{ 00110000  }
{ 01111000  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 135 0x87 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 11000000  }
{ 11000000  }
{ 01111110  }
{ 00001100  }
{ 00111000  }
{
	* 136 0x88 '�' 
	 }
{ 01111100  }
{ 10000010  }
{ 01111100  }
{ 11000110  }
{ 11111110  }
{ 11000000  }
{ 01111100  }
{ 00000000  }
{
	* 137 0x89 '�' 
	 }
{ 11000110  }
{ 00000000  }
{ 01111100  }
{ 11000110  }
{ 11111110  }
{ 11000000  }
{ 01111100  }
{ 00000000  }
{
	* 138 0x8a '�' 
	 }
{ 00110000  }
{ 00011000  }
{ 01111100  }
{ 11000110  }
{ 11111110  }
{ 11000000  }
{ 01111100  }
{ 00000000  }
{
	* 139 0x8b '�' 
	 }
{ 01100110  }
{ 00000000  }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 140 0x8c '�' 
	 }
{ 01111100  }
{ 10000010  }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 141 0x8d '�' 
	 }
{ 00110000  }
{ 00011000  }
{ 00000000  }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 142 0x8e '�' 
	 }
{ 11000110  }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11111110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 143 0x8f '�' 
	 }
{ 00111000  }
{ 01101100  }
{ 01111100  }
{ 11000110  }
{ 11111110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 144 0x90 '�' 
	 }
{ 00011000  }
{ 00110000  }
{ 11111110  }
{ 11000000  }
{ 11111000  }
{ 11000000  }
{ 11111110  }
{ 00000000  }
{
	* 145 0x91 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 00011000  }
{ 01111110  }
{ 11011000  }
{ 01111110  }
{ 00000000  }
{
	* 146 0x92 '�' 
	 }
{ 00111110  }
{ 01101100  }
{ 11001100  }
{ 11111110  }
{ 11001100  }
{ 11001100  }
{ 11001110  }
{ 00000000  }
{
	* 147 0x93 '�' 
	 }
{ 01111100  }
{ 10000010  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 148 0x94 '�' 
	 }
{ 11000110  }
{ 00000000  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 149 0x95 '�' 
	 }
{ 00110000  }
{ 00011000  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 150 0x96 '�' 
	 }
{ 01111000  }
{ 10000100  }
{ 00000000  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 151 0x97 '�' 
	 }
{ 01100000  }
{ 00110000  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 152 0x98 '�' 
	 }
{ 11000110  }
{ 00000000  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111110  }
{ 00000110  }
{ 11111100  }
{
	* 153 0x99 '�' 
	 }
{ 11000110  }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{
	* 154 0x9a '�' 
	 }
{ 11000110  }
{ 00000000  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 155 0x9b '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 01111110  }
{ 11000000  }
{ 11000000  }
{ 01111110  }
{ 00011000  }
{ 00011000  }
{
	* 156 0x9c '�' 
	 }
{ 00111000  }
{ 01101100  }
{ 01100100  }
{ 11110000  }
{ 01100000  }
{ 01100110  }
{ 11111100  }
{ 00000000  }
{
	* 157 0x9d '�' 
	 }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{ 01111110  }
{ 00011000  }
{ 01111110  }
{ 00011000  }
{ 00011000  }
{
	* 158 0x9e '�' 
	 }
{ 11111000  }
{ 11001100  }
{ 11001100  }
{ 11111010  }
{ 11000110  }
{ 11001111  }
{ 11000110  }
{ 11000111  }
{
	* 159 0x9f '�' 
	 }
{ 00001110  }
{ 00011011  }
{ 00011000  }
{ 00111100  }
{ 00011000  }
{ 11011000  }
{ 01110000  }
{ 00000000  }
{
	* 160 0xa0 '�' 
	 }
{ 00011000  }
{ 00110000  }
{ 01111000  }
{ 00001100  }
{ 01111100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 161 0xa1 '�' 
	 }
{ 00001100  }
{ 00011000  }
{ 00000000  }
{ 00111000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00000000  }
{
	* 162 0xa2 '�' 
	 }
{ 00001100  }
{ 00011000  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 01111100  }
{ 00000000  }
{
	* 163 0xa3 '�' 
	 }
{ 00011000  }
{ 00110000  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 11001100  }
{ 01110110  }
{ 00000000  }
{
	* 164 0xa4 '�' 
	 }
{ 01110110  }
{ 11011100  }
{ 00000000  }
{ 11011100  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 00000000  }
{
	* 165 0xa5 '�' 
	 }
{ 01110110  }
{ 11011100  }
{ 00000000  }
{ 11100110  }
{ 11110110  }
{ 11011110  }
{ 11001110  }
{ 00000000  }
{
	* 166 0xa6 '�' 
	 }
{ 00111100  }
{ 01101100  }
{ 01101100  }
{ 00111110  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{ 00000000  }
{
	* 167 0xa7 '�' 
	 }
{ 00111000  }
{ 01101100  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{ 01111100  }
{ 00000000  }
{ 00000000  }
{
	* 168 0xa8 '�' 
	 }
{ 00011000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00110000  }
{ 01100011  }
{ 00111110  }
{ 00000000  }
{
	* 169 0xa9 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111110  }
{ 11000000  }
{ 11000000  }
{ 00000000  }
{ 00000000  }
{
	* 170 0xaa '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111110  }
{ 00000110  }
{ 00000110  }
{ 00000000  }
{ 00000000  }
{
	* 171 0xab '�' 
	 }
{ 01100011  }
{ 11100110  }
{ 01101100  }
{ 01111110  }
{ 00110011  }
{ 01100110  }
{ 11001100  }
{ 00001111  }
{
	* 172 0xac '�' 
	 }
{ 01100011  }
{ 11100110  }
{ 01101100  }
{ 01111010  }
{ 00110110  }
{ 01101010  }
{ 11011111  }
{ 00000110  }
{
	* 173 0xad '�' 
	 }
{ 00011000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00111100  }
{ 00111100  }
{ 00011000  }
{ 00000000  }
{
	* 174 0xae '�' 
	 }
{ 00000000  }
{ 00110011  }
{ 01100110  }
{ 11001100  }
{ 01100110  }
{ 00110011  }
{ 00000000  }
{ 00000000  }
{
	* 175 0xaf '�' 
	 }
{ 00000000  }
{ 11001100  }
{ 01100110  }
{ 00110011  }
{ 01100110  }
{ 11001100  }
{ 00000000  }
{ 00000000  }
{
	* 176 0xb0 '�' 
	 }
{ 00100010  }
{ 10001000  }
{ 00100010  }
{ 10001000  }
{ 00100010  }
{ 10001000  }
{ 00100010  }
{ 10001000  }
{
	* 177 0xb1 '�' 
	 }
{ 01010101  }
{ 10101010  }
{ 01010101  }
{ 10101010  }
{ 01010101  }
{ 10101010  }
{ 01010101  }
{ 10101010  }
{
	* 178 0xb2 '�' 
	 }
{ 01110111  }
{ 11011101  }
{ 01110111  }
{ 11011101  }
{ 01110111  }
{ 11011101  }
{ 01110111  }
{ 11011101  }
{
	* 179 0xb3 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 180 0xb4 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 11111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 181 0xb5 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 11111000  }
{ 00011000  }
{ 11111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 182 0xb6 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 11110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 183 0xb7 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 184 0xb8 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 11111000  }
{ 00011000  }
{ 11111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 185 0xb9 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 11110110  }
{ 00000110  }
{ 11110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 186 0xba '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 187 0xbb '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 11111110  }
{ 00000110  }
{ 11110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 188 0xbc '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 11110110  }
{ 00000110  }
{ 11111110  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 189 0xbd '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 11111110  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 190 0xbe '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 11111000  }
{ 00011000  }
{ 11111000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 191 0xbf '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 192 0xc0 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 193 0xc1 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 194 0xc2 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 195 0xc3 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 196 0xc4 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 197 0xc5 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 11111111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 198 0xc6 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011111  }
{ 00011000  }
{ 00011111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 199 0xc7 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 200 0xc8 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110111  }
{ 00110000  }
{ 00111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 201 0xc9 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00111111  }
{ 00110000  }
{ 00110111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 202 0xca '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 11110111  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 203 0xcb '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 11110111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 204 0xcc '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110111  }
{ 00110000  }
{ 00110111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 205 0xcd '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 206 0xce '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 11110111  }
{ 00000000  }
{ 11110111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 207 0xcf '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 11111111  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 208 0xd0 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 209 0xd1 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 00000000  }
{ 11111111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 210 0xd2 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 211 0xd3 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 212 0xd4 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011111  }
{ 00011000  }
{ 00011111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 213 0xd5 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00011111  }
{ 00011000  }
{ 00011111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 214 0xd6 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00111111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 215 0xd7 '�' 
	 }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 11111111  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{
	* 216 0xd8 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 11111111  }
{ 00011000  }
{ 11111111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 217 0xd9 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 11111000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 218 0xda '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00011111  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 219 0xdb '�' 
	 }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{
	* 220 0xdc '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{
	* 221 0xdd '�' 
	 }
{ 11110000  }
{ 11110000  }
{ 11110000  }
{ 11110000  }
{ 11110000  }
{ 11110000  }
{ 11110000  }
{ 11110000  }
{
	* 222 0xde '�' 
	 }
{ 00001111  }
{ 00001111  }
{ 00001111  }
{ 00001111  }
{ 00001111  }
{ 00001111  }
{ 00001111  }
{ 00001111  }
{
	* 223 0xdf '�' 
	 }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 11111111  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 224 0xe0 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 01110110  }
{ 11011100  }
{ 11001000  }
{ 11011100  }
{ 01110110  }
{ 00000000  }
{
	* 225 0xe1 '�' 
	 }
{ 01111000  }
{ 11001100  }
{ 11001100  }
{ 11011000  }
{ 11001100  }
{ 11000110  }
{ 11001100  }
{ 00000000  }
{
	* 226 0xe2 '�' 
	 }
{ 11111110  }
{ 11000110  }
{ 11000000  }
{ 11000000  }
{ 11000000  }
{ 11000000  }
{ 11000000  }
{ 00000000  }
{
	* 227 0xe3 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 11111110  }
{ 01101100  }
{ 01101100  }
{ 01101100  }
{ 01101100  }
{ 00000000  }
{
	* 228 0xe4 '�' 
	 }
{ 11111110  }
{ 11000110  }
{ 01100000  }
{ 00110000  }
{ 01100000  }
{ 11000110  }
{ 11111110  }
{ 00000000  }
{
	* 229 0xe5 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 11011000  }
{ 11011000  }
{ 11011000  }
{ 01110000  }
{ 00000000  }
{
	* 230 0xe6 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 01100110  }
{ 01111100  }
{ 11000000  }
{
	* 231 0xe7 '�' 
	 }
{ 00000000  }
{ 01110110  }
{ 11011100  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{
	* 232 0xe8 '�' 
	 }
{ 01111110  }
{ 00011000  }
{ 00111100  }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{ 00011000  }
{ 01111110  }
{
	* 233 0xe9 '�' 
	 }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11111110  }
{ 11000110  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{
	* 234 0xea '�' 
	 }
{ 00111000  }
{ 01101100  }
{ 11000110  }
{ 11000110  }
{ 01101100  }
{ 01101100  }
{ 11101110  }
{ 00000000  }
{
	* 235 0xeb '�' 
	 }
{ 00001110  }
{ 00011000  }
{ 00001100  }
{ 00111110  }
{ 01100110  }
{ 01100110  }
{ 00111100  }
{ 00000000  }
{
	* 236 0xec '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 01111110  }
{ 11011011  }
{ 11011011  }
{ 01111110  }
{ 00000000  }
{ 00000000  }
{
	* 237 0xed '�' 
	 }
{ 00000110  }
{ 00001100  }
{ 01111110  }
{ 11011011  }
{ 11011011  }
{ 01111110  }
{ 01100000  }
{ 11000000  }
{
	* 238 0xee '�' 
	 }
{ 00011110  }
{ 00110000  }
{ 01100000  }
{ 01111110  }
{ 01100000  }
{ 00110000  }
{ 00011110  }
{ 00000000  }
{
	* 239 0xef '�' 
	 }
{ 00000000  }
{ 01111100  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 11000110  }
{ 00000000  }
{
	* 240 0xf0 '�' 
	 }
{ 00000000  }
{ 11111110  }
{ 00000000  }
{ 11111110  }
{ 00000000  }
{ 11111110  }
{ 00000000  }
{ 00000000  }
{
	* 241 0xf1 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 01111110  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{
	* 242 0xf2 '�' 
	 }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{
	* 243 0xf3 '�' 
	 }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 00011000  }
{ 00001100  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{
	* 244 0xf4 '�' 
	 }
{ 00001110  }
{ 00011011  }
{ 00011011  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{
	* 245 0xf5 '�' 
	 }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 00011000  }
{ 11011000  }
{ 11011000  }
{ 01110000  }
{
	* 246 0xf6 '�' 
	 }
{ 00000000  }
{ 00011000  }
{ 00000000  }
{ 01111110  }
{ 00000000  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{
	* 247 0xf7 '�' 
	 }
{ 00000000  }
{ 01110110  }
{ 11011100  }
{ 00000000  }
{ 01110110  }
{ 11011100  }
{ 00000000  }
{ 00000000  }
{
	* 248 0xf8 '�' 
	 }
{ 00111000  }
{ 01101100  }
{ 01101100  }
{ 00111000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 249 0xf9 '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 250 0xfa '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00011000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 251 0xfb '�' 
	 }
{ 00001111  }
{ 00001100  }
{ 00001100  }
{ 00001100  }
{ 11101100  }
{ 01101100  }
{ 00111100  }
{ 00011100  }
{
	* 252 0xfc '�' 
	 }
{ 01101100  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00110110  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 253 0xfd '�' 
	 }
{ 01111000  }
{ 00001100  }
{ 00011000  }
{ 00110000  }
{ 01111100  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{
	* 254 0xfe '�' 
	 }
{ 00000000  }
{ 00000000  }
{ 00111100  }
{ 00111100  }
{ 00111100  }
{ 00111100  }
{ 00000000  }
{ 00000000  }
{
	* 255 0xff ' ' 
	 }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
{ 00000000  }
in declaration at line 3106 *)

implementation


end.
