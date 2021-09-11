; strings
NAME_LENGTH EQU 11
PLAYER_NAME_LENGTH EQU 8
BOX_NAME_LENGTH EQU 9
PKMN_NAME_LENGTH EQU 11
MOVE_NAME_LENGTH EQU 13
ITEM_NAME_LENGTH EQU 13
TRAINER_CLASS_NAME_LENGTH EQU 13

; GetName types
PKMN_NAME     EQU 1
MOVE_NAME     EQU 2
CLOTHES_NAME  EQU 3
ITEM_NAME     EQU 4
PARTY_OT_NAME EQU 5
ENEMY_OT_NAME EQU 6
TRAINER_NAME  EQU 7

; text
BORDER_WIDTH   EQU 2
TEXTBOX_WIDTH  EQU SCREEN_WIDTH
TEXTBOX_INNERW EQU TEXTBOX_WIDTH - BORDER_WIDTH
TEXTBOX_HEIGHT EQU 6
TEXTBOX_INNERH EQU TEXTBOX_HEIGHT - BORDER_WIDTH
TEXTBOX_X      EQU 0
TEXTBOX_INNERX EQU TEXTBOX_X + 1
TEXTBOX_Y      EQU SCREEN_HEIGHT - TEXTBOX_HEIGHT
TEXTBOX_INNERY EQU TEXTBOX_Y + 2

; PrintNum bit flags

PRINTNUM_MONEY_F        EQU 5
PRINTNUM_LEFTALIGN_F    EQU 6
PRINTNUM_LEADINGZEROS_F EQU 7

PRINTNUM_MONEY          EQU 1 << PRINTNUM_MONEY_F
PRINTNUM_LEFTALIGN      EQU 1 << PRINTNUM_LEFTALIGN_F
PRINTNUM_LEADINGZEROS   EQU 1 << PRINTNUM_LEADINGZEROS_F
