pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;
with SDL3_SDL_stdinc_h;

package SDL3_SDL_keycode_h is

   SDLK_EXTENDED_MASK : constant := (2 ** 29);  --  /usr/local/include/SDL3/SDL_keycode.h:61
   SDLK_SCANCODE_MASK : constant := (2 ** 30);  --  /usr/local/include/SDL3/SDL_keycode.h:62
   --  arg-macro: function SDL_SCANCODE_TO_KEYCODE (X)
   --    return X or SDLK_SCANCODE_MASK;

   SDLK_UNKNOWN : constant := 16#00000000#;  --  /usr/local/include/SDL3/SDL_keycode.h:64
   SDLK_RETURN : constant := 16#0000000d#;  --  /usr/local/include/SDL3/SDL_keycode.h:65
   SDLK_ESCAPE : constant := 16#0000001b#;  --  /usr/local/include/SDL3/SDL_keycode.h:66
   SDLK_BACKSPACE : constant := 16#00000008#;  --  /usr/local/include/SDL3/SDL_keycode.h:67
   SDLK_TAB : constant := 16#00000009#;  --  /usr/local/include/SDL3/SDL_keycode.h:68
   SDLK_SPACE : constant := 16#00000020#;  --  /usr/local/include/SDL3/SDL_keycode.h:69
   SDLK_EXCLAIM : constant := 16#00000021#;  --  /usr/local/include/SDL3/SDL_keycode.h:70
   SDLK_DBLAPOSTROPHE : constant := 16#00000022#;  --  /usr/local/include/SDL3/SDL_keycode.h:71
   SDLK_HASH : constant := 16#00000023#;  --  /usr/local/include/SDL3/SDL_keycode.h:72
   SDLK_DOLLAR : constant := 16#00000024#;  --  /usr/local/include/SDL3/SDL_keycode.h:73
   SDLK_PERCENT : constant := 16#00000025#;  --  /usr/local/include/SDL3/SDL_keycode.h:74
   SDLK_AMPERSAND : constant := 16#00000026#;  --  /usr/local/include/SDL3/SDL_keycode.h:75
   SDLK_APOSTROPHE : constant := 16#00000027#;  --  /usr/local/include/SDL3/SDL_keycode.h:76
   SDLK_LEFTPAREN : constant := 16#00000028#;  --  /usr/local/include/SDL3/SDL_keycode.h:77
   SDLK_RIGHTPAREN : constant := 16#00000029#;  --  /usr/local/include/SDL3/SDL_keycode.h:78
   SDLK_ASTERISK : constant := 16#0000002a#;  --  /usr/local/include/SDL3/SDL_keycode.h:79
   SDLK_PLUS : constant := 16#0000002b#;  --  /usr/local/include/SDL3/SDL_keycode.h:80
   SDLK_COMMA : constant := 16#0000002c#;  --  /usr/local/include/SDL3/SDL_keycode.h:81
   SDLK_MINUS : constant := 16#0000002d#;  --  /usr/local/include/SDL3/SDL_keycode.h:82
   SDLK_PERIOD : constant := 16#0000002e#;  --  /usr/local/include/SDL3/SDL_keycode.h:83
   SDLK_SLASH : constant := 16#0000002f#;  --  /usr/local/include/SDL3/SDL_keycode.h:84
   SDLK_0 : constant := 16#00000030#;  --  /usr/local/include/SDL3/SDL_keycode.h:85
   SDLK_1 : constant := 16#00000031#;  --  /usr/local/include/SDL3/SDL_keycode.h:86
   SDLK_2 : constant := 16#00000032#;  --  /usr/local/include/SDL3/SDL_keycode.h:87
   SDLK_3 : constant := 16#00000033#;  --  /usr/local/include/SDL3/SDL_keycode.h:88
   SDLK_4 : constant := 16#00000034#;  --  /usr/local/include/SDL3/SDL_keycode.h:89
   SDLK_5 : constant := 16#00000035#;  --  /usr/local/include/SDL3/SDL_keycode.h:90
   SDLK_6 : constant := 16#00000036#;  --  /usr/local/include/SDL3/SDL_keycode.h:91
   SDLK_7 : constant := 16#00000037#;  --  /usr/local/include/SDL3/SDL_keycode.h:92
   SDLK_8 : constant := 16#00000038#;  --  /usr/local/include/SDL3/SDL_keycode.h:93
   SDLK_9 : constant := 16#00000039#;  --  /usr/local/include/SDL3/SDL_keycode.h:94
   SDLK_COLON : constant := 16#0000003a#;  --  /usr/local/include/SDL3/SDL_keycode.h:95
   SDLK_SEMICOLON : constant := 16#0000003b#;  --  /usr/local/include/SDL3/SDL_keycode.h:96
   SDLK_LESS : constant := 16#0000003c#;  --  /usr/local/include/SDL3/SDL_keycode.h:97
   SDLK_EQUALS : constant := 16#0000003d#;  --  /usr/local/include/SDL3/SDL_keycode.h:98
   SDLK_GREATER : constant := 16#0000003e#;  --  /usr/local/include/SDL3/SDL_keycode.h:99
   SDLK_QUESTION : constant := 16#0000003f#;  --  /usr/local/include/SDL3/SDL_keycode.h:100
   SDLK_AT : constant := 16#00000040#;  --  /usr/local/include/SDL3/SDL_keycode.h:101
   SDLK_LEFTBRACKET : constant := 16#0000005b#;  --  /usr/local/include/SDL3/SDL_keycode.h:102
   SDLK_BACKSLASH : constant := 16#0000005c#;  --  /usr/local/include/SDL3/SDL_keycode.h:103
   SDLK_RIGHTBRACKET : constant := 16#0000005d#;  --  /usr/local/include/SDL3/SDL_keycode.h:104
   SDLK_CARET : constant := 16#0000005e#;  --  /usr/local/include/SDL3/SDL_keycode.h:105
   SDLK_UNDERSCORE : constant := 16#0000005f#;  --  /usr/local/include/SDL3/SDL_keycode.h:106
   SDLK_GRAVE : constant := 16#00000060#;  --  /usr/local/include/SDL3/SDL_keycode.h:107
   SDLK_A : constant := 16#00000061#;  --  /usr/local/include/SDL3/SDL_keycode.h:108
   SDLK_B : constant := 16#00000062#;  --  /usr/local/include/SDL3/SDL_keycode.h:109
   SDLK_C : constant := 16#00000063#;  --  /usr/local/include/SDL3/SDL_keycode.h:110
   SDLK_D : constant := 16#00000064#;  --  /usr/local/include/SDL3/SDL_keycode.h:111
   SDLK_E : constant := 16#00000065#;  --  /usr/local/include/SDL3/SDL_keycode.h:112
   SDLK_F : constant := 16#00000066#;  --  /usr/local/include/SDL3/SDL_keycode.h:113
   SDLK_G : constant := 16#00000067#;  --  /usr/local/include/SDL3/SDL_keycode.h:114
   SDLK_H : constant := 16#00000068#;  --  /usr/local/include/SDL3/SDL_keycode.h:115
   SDLK_I : constant := 16#00000069#;  --  /usr/local/include/SDL3/SDL_keycode.h:116
   SDLK_J : constant := 16#0000006a#;  --  /usr/local/include/SDL3/SDL_keycode.h:117
   SDLK_K : constant := 16#0000006b#;  --  /usr/local/include/SDL3/SDL_keycode.h:118
   SDLK_L : constant := 16#0000006c#;  --  /usr/local/include/SDL3/SDL_keycode.h:119
   SDLK_M : constant := 16#0000006d#;  --  /usr/local/include/SDL3/SDL_keycode.h:120
   SDLK_N : constant := 16#0000006e#;  --  /usr/local/include/SDL3/SDL_keycode.h:121
   SDLK_O : constant := 16#0000006f#;  --  /usr/local/include/SDL3/SDL_keycode.h:122
   SDLK_P : constant := 16#00000070#;  --  /usr/local/include/SDL3/SDL_keycode.h:123
   SDLK_Q : constant := 16#00000071#;  --  /usr/local/include/SDL3/SDL_keycode.h:124
   SDLK_R : constant := 16#00000072#;  --  /usr/local/include/SDL3/SDL_keycode.h:125
   SDLK_S : constant := 16#00000073#;  --  /usr/local/include/SDL3/SDL_keycode.h:126
   SDLK_T : constant := 16#00000074#;  --  /usr/local/include/SDL3/SDL_keycode.h:127
   SDLK_U : constant := 16#00000075#;  --  /usr/local/include/SDL3/SDL_keycode.h:128
   SDLK_V : constant := 16#00000076#;  --  /usr/local/include/SDL3/SDL_keycode.h:129
   SDLK_W : constant := 16#00000077#;  --  /usr/local/include/SDL3/SDL_keycode.h:130
   SDLK_X : constant := 16#00000078#;  --  /usr/local/include/SDL3/SDL_keycode.h:131
   SDLK_Y : constant := 16#00000079#;  --  /usr/local/include/SDL3/SDL_keycode.h:132
   SDLK_Z : constant := 16#0000007a#;  --  /usr/local/include/SDL3/SDL_keycode.h:133
   SDLK_LEFTBRACE : constant := 16#0000007b#;  --  /usr/local/include/SDL3/SDL_keycode.h:134
   SDLK_PIPE : constant := 16#0000007c#;  --  /usr/local/include/SDL3/SDL_keycode.h:135
   SDLK_RIGHTBRACE : constant := 16#0000007d#;  --  /usr/local/include/SDL3/SDL_keycode.h:136
   SDLK_TILDE : constant := 16#0000007e#;  --  /usr/local/include/SDL3/SDL_keycode.h:137
   SDLK_DELETE : constant := 16#0000007f#;  --  /usr/local/include/SDL3/SDL_keycode.h:138
   SDLK_PLUSMINUS : constant := 16#000000b1#;  --  /usr/local/include/SDL3/SDL_keycode.h:139
   SDLK_CAPSLOCK : constant := 16#40000039#;  --  /usr/local/include/SDL3/SDL_keycode.h:140
   SDLK_F1 : constant := 16#4000003a#;  --  /usr/local/include/SDL3/SDL_keycode.h:141
   SDLK_F2 : constant := 16#4000003b#;  --  /usr/local/include/SDL3/SDL_keycode.h:142
   SDLK_F3 : constant := 16#4000003c#;  --  /usr/local/include/SDL3/SDL_keycode.h:143
   SDLK_F4 : constant := 16#4000003d#;  --  /usr/local/include/SDL3/SDL_keycode.h:144
   SDLK_F5 : constant := 16#4000003e#;  --  /usr/local/include/SDL3/SDL_keycode.h:145
   SDLK_F6 : constant := 16#4000003f#;  --  /usr/local/include/SDL3/SDL_keycode.h:146
   SDLK_F7 : constant := 16#40000040#;  --  /usr/local/include/SDL3/SDL_keycode.h:147
   SDLK_F8 : constant := 16#40000041#;  --  /usr/local/include/SDL3/SDL_keycode.h:148
   SDLK_F9 : constant := 16#40000042#;  --  /usr/local/include/SDL3/SDL_keycode.h:149
   SDLK_F10 : constant := 16#40000043#;  --  /usr/local/include/SDL3/SDL_keycode.h:150
   SDLK_F11 : constant := 16#40000044#;  --  /usr/local/include/SDL3/SDL_keycode.h:151
   SDLK_F12 : constant := 16#40000045#;  --  /usr/local/include/SDL3/SDL_keycode.h:152
   SDLK_PRINTSCREEN : constant := 16#40000046#;  --  /usr/local/include/SDL3/SDL_keycode.h:153
   SDLK_SCROLLLOCK : constant := 16#40000047#;  --  /usr/local/include/SDL3/SDL_keycode.h:154
   SDLK_PAUSE : constant := 16#40000048#;  --  /usr/local/include/SDL3/SDL_keycode.h:155
   SDLK_INSERT : constant := 16#40000049#;  --  /usr/local/include/SDL3/SDL_keycode.h:156
   SDLK_HOME : constant := 16#4000004a#;  --  /usr/local/include/SDL3/SDL_keycode.h:157
   SDLK_PAGEUP : constant := 16#4000004b#;  --  /usr/local/include/SDL3/SDL_keycode.h:158
   SDLK_END : constant := 16#4000004d#;  --  /usr/local/include/SDL3/SDL_keycode.h:159
   SDLK_PAGEDOWN : constant := 16#4000004e#;  --  /usr/local/include/SDL3/SDL_keycode.h:160
   SDLK_RIGHT : constant := 16#4000004f#;  --  /usr/local/include/SDL3/SDL_keycode.h:161
   SDLK_LEFT : constant := 16#40000050#;  --  /usr/local/include/SDL3/SDL_keycode.h:162
   SDLK_DOWN : constant := 16#40000051#;  --  /usr/local/include/SDL3/SDL_keycode.h:163
   SDLK_UP : constant := 16#40000052#;  --  /usr/local/include/SDL3/SDL_keycode.h:164
   SDLK_NUMLOCKCLEAR : constant := 16#40000053#;  --  /usr/local/include/SDL3/SDL_keycode.h:165
   SDLK_KP_DIVIDE : constant := 16#40000054#;  --  /usr/local/include/SDL3/SDL_keycode.h:166
   SDLK_KP_MULTIPLY : constant := 16#40000055#;  --  /usr/local/include/SDL3/SDL_keycode.h:167
   SDLK_KP_MINUS : constant := 16#40000056#;  --  /usr/local/include/SDL3/SDL_keycode.h:168
   SDLK_KP_PLUS : constant := 16#40000057#;  --  /usr/local/include/SDL3/SDL_keycode.h:169
   SDLK_KP_ENTER : constant := 16#40000058#;  --  /usr/local/include/SDL3/SDL_keycode.h:170
   SDLK_KP_1 : constant := 16#40000059#;  --  /usr/local/include/SDL3/SDL_keycode.h:171
   SDLK_KP_2 : constant := 16#4000005a#;  --  /usr/local/include/SDL3/SDL_keycode.h:172
   SDLK_KP_3 : constant := 16#4000005b#;  --  /usr/local/include/SDL3/SDL_keycode.h:173
   SDLK_KP_4 : constant := 16#4000005c#;  --  /usr/local/include/SDL3/SDL_keycode.h:174
   SDLK_KP_5 : constant := 16#4000005d#;  --  /usr/local/include/SDL3/SDL_keycode.h:175
   SDLK_KP_6 : constant := 16#4000005e#;  --  /usr/local/include/SDL3/SDL_keycode.h:176
   SDLK_KP_7 : constant := 16#4000005f#;  --  /usr/local/include/SDL3/SDL_keycode.h:177
   SDLK_KP_8 : constant := 16#40000060#;  --  /usr/local/include/SDL3/SDL_keycode.h:178
   SDLK_KP_9 : constant := 16#40000061#;  --  /usr/local/include/SDL3/SDL_keycode.h:179
   SDLK_KP_0 : constant := 16#40000062#;  --  /usr/local/include/SDL3/SDL_keycode.h:180
   SDLK_KP_PERIOD : constant := 16#40000063#;  --  /usr/local/include/SDL3/SDL_keycode.h:181
   SDLK_APPLICATION : constant := 16#40000065#;  --  /usr/local/include/SDL3/SDL_keycode.h:182
   SDLK_POWER : constant := 16#40000066#;  --  /usr/local/include/SDL3/SDL_keycode.h:183
   SDLK_KP_EQUALS : constant := 16#40000067#;  --  /usr/local/include/SDL3/SDL_keycode.h:184
   SDLK_F13 : constant := 16#40000068#;  --  /usr/local/include/SDL3/SDL_keycode.h:185
   SDLK_F14 : constant := 16#40000069#;  --  /usr/local/include/SDL3/SDL_keycode.h:186
   SDLK_F15 : constant := 16#4000006a#;  --  /usr/local/include/SDL3/SDL_keycode.h:187
   SDLK_F16 : constant := 16#4000006b#;  --  /usr/local/include/SDL3/SDL_keycode.h:188
   SDLK_F17 : constant := 16#4000006c#;  --  /usr/local/include/SDL3/SDL_keycode.h:189
   SDLK_F18 : constant := 16#4000006d#;  --  /usr/local/include/SDL3/SDL_keycode.h:190
   SDLK_F19 : constant := 16#4000006e#;  --  /usr/local/include/SDL3/SDL_keycode.h:191
   SDLK_F20 : constant := 16#4000006f#;  --  /usr/local/include/SDL3/SDL_keycode.h:192
   SDLK_F21 : constant := 16#40000070#;  --  /usr/local/include/SDL3/SDL_keycode.h:193
   SDLK_F22 : constant := 16#40000071#;  --  /usr/local/include/SDL3/SDL_keycode.h:194
   SDLK_F23 : constant := 16#40000072#;  --  /usr/local/include/SDL3/SDL_keycode.h:195
   SDLK_F24 : constant := 16#40000073#;  --  /usr/local/include/SDL3/SDL_keycode.h:196
   SDLK_EXECUTE : constant := 16#40000074#;  --  /usr/local/include/SDL3/SDL_keycode.h:197
   SDLK_HELP : constant := 16#40000075#;  --  /usr/local/include/SDL3/SDL_keycode.h:198
   SDLK_MENU : constant := 16#40000076#;  --  /usr/local/include/SDL3/SDL_keycode.h:199
   SDLK_SELECT : constant := 16#40000077#;  --  /usr/local/include/SDL3/SDL_keycode.h:200
   SDLK_STOP : constant := 16#40000078#;  --  /usr/local/include/SDL3/SDL_keycode.h:201
   SDLK_AGAIN : constant := 16#40000079#;  --  /usr/local/include/SDL3/SDL_keycode.h:202
   SDLK_UNDO : constant := 16#4000007a#;  --  /usr/local/include/SDL3/SDL_keycode.h:203
   SDLK_CUT : constant := 16#4000007b#;  --  /usr/local/include/SDL3/SDL_keycode.h:204
   SDLK_COPY : constant := 16#4000007c#;  --  /usr/local/include/SDL3/SDL_keycode.h:205
   SDLK_PASTE : constant := 16#4000007d#;  --  /usr/local/include/SDL3/SDL_keycode.h:206
   SDLK_FIND : constant := 16#4000007e#;  --  /usr/local/include/SDL3/SDL_keycode.h:207
   SDLK_MUTE : constant := 16#4000007f#;  --  /usr/local/include/SDL3/SDL_keycode.h:208
   SDLK_VOLUMEUP : constant := 16#40000080#;  --  /usr/local/include/SDL3/SDL_keycode.h:209
   SDLK_VOLUMEDOWN : constant := 16#40000081#;  --  /usr/local/include/SDL3/SDL_keycode.h:210
   SDLK_KP_COMMA : constant := 16#40000085#;  --  /usr/local/include/SDL3/SDL_keycode.h:211
   SDLK_KP_EQUALSAS400 : constant := 16#40000086#;  --  /usr/local/include/SDL3/SDL_keycode.h:212
   SDLK_ALTERASE : constant := 16#40000099#;  --  /usr/local/include/SDL3/SDL_keycode.h:213
   SDLK_SYSREQ : constant := 16#4000009a#;  --  /usr/local/include/SDL3/SDL_keycode.h:214
   SDLK_CANCEL : constant := 16#4000009b#;  --  /usr/local/include/SDL3/SDL_keycode.h:215
   SDLK_CLEAR : constant := 16#4000009c#;  --  /usr/local/include/SDL3/SDL_keycode.h:216
   SDLK_PRIOR : constant := 16#4000009d#;  --  /usr/local/include/SDL3/SDL_keycode.h:217
   SDLK_RETURN2 : constant := 16#4000009e#;  --  /usr/local/include/SDL3/SDL_keycode.h:218
   SDLK_SEPARATOR : constant := 16#4000009f#;  --  /usr/local/include/SDL3/SDL_keycode.h:219
   SDLK_OUT : constant := 16#400000a0#;  --  /usr/local/include/SDL3/SDL_keycode.h:220
   SDLK_OPER : constant := 16#400000a1#;  --  /usr/local/include/SDL3/SDL_keycode.h:221
   SDLK_CLEARAGAIN : constant := 16#400000a2#;  --  /usr/local/include/SDL3/SDL_keycode.h:222
   SDLK_CRSEL : constant := 16#400000a3#;  --  /usr/local/include/SDL3/SDL_keycode.h:223
   SDLK_EXSEL : constant := 16#400000a4#;  --  /usr/local/include/SDL3/SDL_keycode.h:224
   SDLK_KP_00 : constant := 16#400000b0#;  --  /usr/local/include/SDL3/SDL_keycode.h:225
   SDLK_KP_000 : constant := 16#400000b1#;  --  /usr/local/include/SDL3/SDL_keycode.h:226
   SDLK_THOUSANDSSEPARATOR : constant := 16#400000b2#;  --  /usr/local/include/SDL3/SDL_keycode.h:227
   SDLK_DECIMALSEPARATOR : constant := 16#400000b3#;  --  /usr/local/include/SDL3/SDL_keycode.h:228
   SDLK_CURRENCYUNIT : constant := 16#400000b4#;  --  /usr/local/include/SDL3/SDL_keycode.h:229
   SDLK_CURRENCYSUBUNIT : constant := 16#400000b5#;  --  /usr/local/include/SDL3/SDL_keycode.h:230
   SDLK_KP_LEFTPAREN : constant := 16#400000b6#;  --  /usr/local/include/SDL3/SDL_keycode.h:231
   SDLK_KP_RIGHTPAREN : constant := 16#400000b7#;  --  /usr/local/include/SDL3/SDL_keycode.h:232
   SDLK_KP_LEFTBRACE : constant := 16#400000b8#;  --  /usr/local/include/SDL3/SDL_keycode.h:233
   SDLK_KP_RIGHTBRACE : constant := 16#400000b9#;  --  /usr/local/include/SDL3/SDL_keycode.h:234
   SDLK_KP_TAB : constant := 16#400000ba#;  --  /usr/local/include/SDL3/SDL_keycode.h:235
   SDLK_KP_BACKSPACE : constant := 16#400000bb#;  --  /usr/local/include/SDL3/SDL_keycode.h:236
   SDLK_KP_A : constant := 16#400000bc#;  --  /usr/local/include/SDL3/SDL_keycode.h:237
   SDLK_KP_B : constant := 16#400000bd#;  --  /usr/local/include/SDL3/SDL_keycode.h:238
   SDLK_KP_C : constant := 16#400000be#;  --  /usr/local/include/SDL3/SDL_keycode.h:239
   SDLK_KP_D : constant := 16#400000bf#;  --  /usr/local/include/SDL3/SDL_keycode.h:240
   SDLK_KP_E : constant := 16#400000c0#;  --  /usr/local/include/SDL3/SDL_keycode.h:241
   SDLK_KP_F : constant := 16#400000c1#;  --  /usr/local/include/SDL3/SDL_keycode.h:242
   SDLK_KP_XOR : constant := 16#400000c2#;  --  /usr/local/include/SDL3/SDL_keycode.h:243
   SDLK_KP_POWER : constant := 16#400000c3#;  --  /usr/local/include/SDL3/SDL_keycode.h:244
   SDLK_KP_PERCENT : constant := 16#400000c4#;  --  /usr/local/include/SDL3/SDL_keycode.h:245
   SDLK_KP_LESS : constant := 16#400000c5#;  --  /usr/local/include/SDL3/SDL_keycode.h:246
   SDLK_KP_GREATER : constant := 16#400000c6#;  --  /usr/local/include/SDL3/SDL_keycode.h:247
   SDLK_KP_AMPERSAND : constant := 16#400000c7#;  --  /usr/local/include/SDL3/SDL_keycode.h:248
   SDLK_KP_DBLAMPERSAND : constant := 16#400000c8#;  --  /usr/local/include/SDL3/SDL_keycode.h:249
   SDLK_KP_VERTICALBAR : constant := 16#400000c9#;  --  /usr/local/include/SDL3/SDL_keycode.h:250
   SDLK_KP_DBLVERTICALBAR : constant := 16#400000ca#;  --  /usr/local/include/SDL3/SDL_keycode.h:251
   SDLK_KP_COLON : constant := 16#400000cb#;  --  /usr/local/include/SDL3/SDL_keycode.h:252
   SDLK_KP_HASH : constant := 16#400000cc#;  --  /usr/local/include/SDL3/SDL_keycode.h:253
   SDLK_KP_SPACE : constant := 16#400000cd#;  --  /usr/local/include/SDL3/SDL_keycode.h:254
   SDLK_KP_AT : constant := 16#400000ce#;  --  /usr/local/include/SDL3/SDL_keycode.h:255
   SDLK_KP_EXCLAM : constant := 16#400000cf#;  --  /usr/local/include/SDL3/SDL_keycode.h:256
   SDLK_KP_MEMSTORE : constant := 16#400000d0#;  --  /usr/local/include/SDL3/SDL_keycode.h:257
   SDLK_KP_MEMRECALL : constant := 16#400000d1#;  --  /usr/local/include/SDL3/SDL_keycode.h:258
   SDLK_KP_MEMCLEAR : constant := 16#400000d2#;  --  /usr/local/include/SDL3/SDL_keycode.h:259
   SDLK_KP_MEMADD : constant := 16#400000d3#;  --  /usr/local/include/SDL3/SDL_keycode.h:260
   SDLK_KP_MEMSUBTRACT : constant := 16#400000d4#;  --  /usr/local/include/SDL3/SDL_keycode.h:261
   SDLK_KP_MEMMULTIPLY : constant := 16#400000d5#;  --  /usr/local/include/SDL3/SDL_keycode.h:262
   SDLK_KP_MEMDIVIDE : constant := 16#400000d6#;  --  /usr/local/include/SDL3/SDL_keycode.h:263
   SDLK_KP_PLUSMINUS : constant := 16#400000d7#;  --  /usr/local/include/SDL3/SDL_keycode.h:264
   SDLK_KP_CLEAR : constant := 16#400000d8#;  --  /usr/local/include/SDL3/SDL_keycode.h:265
   SDLK_KP_CLEARENTRY : constant := 16#400000d9#;  --  /usr/local/include/SDL3/SDL_keycode.h:266
   SDLK_KP_BINARY : constant := 16#400000da#;  --  /usr/local/include/SDL3/SDL_keycode.h:267
   SDLK_KP_OCTAL : constant := 16#400000db#;  --  /usr/local/include/SDL3/SDL_keycode.h:268
   SDLK_KP_DECIMAL : constant := 16#400000dc#;  --  /usr/local/include/SDL3/SDL_keycode.h:269
   SDLK_KP_HEXADECIMAL : constant := 16#400000dd#;  --  /usr/local/include/SDL3/SDL_keycode.h:270
   SDLK_LCTRL : constant := 16#400000e0#;  --  /usr/local/include/SDL3/SDL_keycode.h:271
   SDLK_LSHIFT : constant := 16#400000e1#;  --  /usr/local/include/SDL3/SDL_keycode.h:272
   SDLK_LALT : constant := 16#400000e2#;  --  /usr/local/include/SDL3/SDL_keycode.h:273
   SDLK_LGUI : constant := 16#400000e3#;  --  /usr/local/include/SDL3/SDL_keycode.h:274
   SDLK_RCTRL : constant := 16#400000e4#;  --  /usr/local/include/SDL3/SDL_keycode.h:275
   SDLK_RSHIFT : constant := 16#400000e5#;  --  /usr/local/include/SDL3/SDL_keycode.h:276
   SDLK_RALT : constant := 16#400000e6#;  --  /usr/local/include/SDL3/SDL_keycode.h:277
   SDLK_RGUI : constant := 16#400000e7#;  --  /usr/local/include/SDL3/SDL_keycode.h:278
   SDLK_MODE : constant := 16#40000101#;  --  /usr/local/include/SDL3/SDL_keycode.h:279
   SDLK_SLEEP : constant := 16#40000102#;  --  /usr/local/include/SDL3/SDL_keycode.h:280
   SDLK_WAKE : constant := 16#40000103#;  --  /usr/local/include/SDL3/SDL_keycode.h:281
   SDLK_CHANNEL_INCREMENT : constant := 16#40000104#;  --  /usr/local/include/SDL3/SDL_keycode.h:282
   SDLK_CHANNEL_DECREMENT : constant := 16#40000105#;  --  /usr/local/include/SDL3/SDL_keycode.h:283
   SDLK_MEDIA_PLAY : constant := 16#40000106#;  --  /usr/local/include/SDL3/SDL_keycode.h:284
   SDLK_MEDIA_PAUSE : constant := 16#40000107#;  --  /usr/local/include/SDL3/SDL_keycode.h:285
   SDLK_MEDIA_RECORD : constant := 16#40000108#;  --  /usr/local/include/SDL3/SDL_keycode.h:286
   SDLK_MEDIA_FAST_FORWARD : constant := 16#40000109#;  --  /usr/local/include/SDL3/SDL_keycode.h:287
   SDLK_MEDIA_REWIND : constant := 16#4000010a#;  --  /usr/local/include/SDL3/SDL_keycode.h:288
   SDLK_MEDIA_NEXT_TRACK : constant := 16#4000010b#;  --  /usr/local/include/SDL3/SDL_keycode.h:289
   SDLK_MEDIA_PREVIOUS_TRACK : constant := 16#4000010c#;  --  /usr/local/include/SDL3/SDL_keycode.h:290
   SDLK_MEDIA_STOP : constant := 16#4000010d#;  --  /usr/local/include/SDL3/SDL_keycode.h:291
   SDLK_MEDIA_EJECT : constant := 16#4000010e#;  --  /usr/local/include/SDL3/SDL_keycode.h:292
   SDLK_MEDIA_PLAY_PAUSE : constant := 16#4000010f#;  --  /usr/local/include/SDL3/SDL_keycode.h:293
   SDLK_MEDIA_SELECT : constant := 16#40000110#;  --  /usr/local/include/SDL3/SDL_keycode.h:294
   SDLK_AC_NEW : constant := 16#40000111#;  --  /usr/local/include/SDL3/SDL_keycode.h:295
   SDLK_AC_OPEN : constant := 16#40000112#;  --  /usr/local/include/SDL3/SDL_keycode.h:296
   SDLK_AC_CLOSE : constant := 16#40000113#;  --  /usr/local/include/SDL3/SDL_keycode.h:297
   SDLK_AC_EXIT : constant := 16#40000114#;  --  /usr/local/include/SDL3/SDL_keycode.h:298
   SDLK_AC_SAVE : constant := 16#40000115#;  --  /usr/local/include/SDL3/SDL_keycode.h:299
   SDLK_AC_PRINT : constant := 16#40000116#;  --  /usr/local/include/SDL3/SDL_keycode.h:300
   SDLK_AC_PROPERTIES : constant := 16#40000117#;  --  /usr/local/include/SDL3/SDL_keycode.h:301
   SDLK_AC_SEARCH : constant := 16#40000118#;  --  /usr/local/include/SDL3/SDL_keycode.h:302
   SDLK_AC_HOME : constant := 16#40000119#;  --  /usr/local/include/SDL3/SDL_keycode.h:303
   SDLK_AC_BACK : constant := 16#4000011a#;  --  /usr/local/include/SDL3/SDL_keycode.h:304
   SDLK_AC_FORWARD : constant := 16#4000011b#;  --  /usr/local/include/SDL3/SDL_keycode.h:305
   SDLK_AC_STOP : constant := 16#4000011c#;  --  /usr/local/include/SDL3/SDL_keycode.h:306
   SDLK_AC_REFRESH : constant := 16#4000011d#;  --  /usr/local/include/SDL3/SDL_keycode.h:307
   SDLK_AC_BOOKMARKS : constant := 16#4000011e#;  --  /usr/local/include/SDL3/SDL_keycode.h:308
   SDLK_SOFTLEFT : constant := 16#4000011f#;  --  /usr/local/include/SDL3/SDL_keycode.h:309
   SDLK_SOFTRIGHT : constant := 16#40000120#;  --  /usr/local/include/SDL3/SDL_keycode.h:310
   SDLK_CALL : constant := 16#40000121#;  --  /usr/local/include/SDL3/SDL_keycode.h:311
   SDLK_ENDCALL : constant := 16#40000122#;  --  /usr/local/include/SDL3/SDL_keycode.h:312
   SDLK_LEFT_TAB : constant := 16#20000001#;  --  /usr/local/include/SDL3/SDL_keycode.h:313
   SDLK_LEVEL5_SHIFT : constant := 16#20000002#;  --  /usr/local/include/SDL3/SDL_keycode.h:314
   SDLK_MULTI_KEY_COMPOSE : constant := 16#20000003#;  --  /usr/local/include/SDL3/SDL_keycode.h:315
   SDLK_LMETA : constant := 16#20000004#;  --  /usr/local/include/SDL3/SDL_keycode.h:316
   SDLK_RMETA : constant := 16#20000005#;  --  /usr/local/include/SDL3/SDL_keycode.h:317
   SDLK_LHYPER : constant := 16#20000006#;  --  /usr/local/include/SDL3/SDL_keycode.h:318
   SDLK_RHYPER : constant := 16#20000007#;  --  /usr/local/include/SDL3/SDL_keycode.h:319

   SDL_KMOD_NONE : constant := 16#0000#;  --  /usr/local/include/SDL3/SDL_keycode.h:328
   SDL_KMOD_LSHIFT : constant := 16#0001#;  --  /usr/local/include/SDL3/SDL_keycode.h:329
   SDL_KMOD_RSHIFT : constant := 16#0002#;  --  /usr/local/include/SDL3/SDL_keycode.h:330
   SDL_KMOD_LEVEL5 : constant := 16#0004#;  --  /usr/local/include/SDL3/SDL_keycode.h:331
   SDL_KMOD_LCTRL : constant := 16#0040#;  --  /usr/local/include/SDL3/SDL_keycode.h:332
   SDL_KMOD_RCTRL : constant := 16#0080#;  --  /usr/local/include/SDL3/SDL_keycode.h:333
   SDL_KMOD_LALT : constant := 16#0100#;  --  /usr/local/include/SDL3/SDL_keycode.h:334
   SDL_KMOD_RALT : constant := 16#0200#;  --  /usr/local/include/SDL3/SDL_keycode.h:335
   SDL_KMOD_LGUI : constant := 16#0400#;  --  /usr/local/include/SDL3/SDL_keycode.h:336
   SDL_KMOD_RGUI : constant := 16#0800#;  --  /usr/local/include/SDL3/SDL_keycode.h:337
   SDL_KMOD_NUM : constant := 16#1000#;  --  /usr/local/include/SDL3/SDL_keycode.h:338
   SDL_KMOD_CAPS : constant := 16#2000#;  --  /usr/local/include/SDL3/SDL_keycode.h:339
   SDL_KMOD_MODE : constant := 16#4000#;  --  /usr/local/include/SDL3/SDL_keycode.h:340
   SDL_KMOD_SCROLL : constant := 16#8000#;  --  /usr/local/include/SDL3/SDL_keycode.h:341
   --  unsupported macro: SDL_KMOD_CTRL (SDL_KMOD_LCTRL | SDL_KMOD_RCTRL)
   --  unsupported macro: SDL_KMOD_SHIFT (SDL_KMOD_LSHIFT | SDL_KMOD_RSHIFT)
   --  unsupported macro: SDL_KMOD_ALT (SDL_KMOD_LALT | SDL_KMOD_RALT)
   --  unsupported macro: SDL_KMOD_GUI (SDL_KMOD_LGUI | SDL_KMOD_RGUI)

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
  -- * # CategoryKeycode
  -- *
  -- * Defines constants which identify keyboard keys and modifiers.
  -- *
  -- * Please refer to the Best Keyboard Practices document for details on what
  -- * this information means and how best to use it.
  -- *
  -- * https://wiki.libsdl.org/SDL3/BestKeyboardPractices
  --  

  --*
  -- * The SDL virtual key representation.
  -- *
  -- * Values of this type are used to represent keyboard keys using the current
  -- * layout of the keyboard. These values include Unicode values representing
  -- * the unmodified character that would be generated by pressing the key, or an
  -- * `SDLK_*` constant for those keys that do not generate characters.
  -- *
  -- * A special exception is the number keys at the top of the keyboard which map
  -- * by default to SDLK_0...SDLK_9 on AZERTY layouts.
  -- *
  -- * Keys with the `SDLK_EXTENDED_MASK` bit set do not map to a scancode or
  -- * Unicode code point.
  -- *
  -- * Many common keycodes are listed below, but this list is not exhaustive.
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  -- *
  -- * \sa SDL_HINT_KEYCODE_OPTIONS
  --  

   subtype SDL_Keycode is SDL3_SDL_stdinc_h.Uint32;  -- /usr/local/include/SDL3/SDL_keycode.h:59

  --*
  -- * Valid key modifiers (possibly OR'd together).
  -- *
  -- * \since This datatype is available since SDL 3.2.0.
  --  

   subtype SDL_Keymod is SDL3_SDL_stdinc_h.Uint16;  -- /usr/local/include/SDL3/SDL_keycode.h:326

end SDL3_SDL_keycode_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
