NPCTrades:
; OT names have 3 characters less padding so the total struct is 32 bytes
; TRADE_WITH_JAKE_FOR_PINSIR in Route 5 Gate
	db 0, SCYTHER,       PINSIR,     "SIR SNIPS@@"
	db $EE, $EE, $EE, ABILITY_1 | ADAMANT, MALE,   POKE_BALL,   SITRUS_BERRY
	dw 64582
	db "JAKE@@@@", $00
; TRADE_WITH_KYLE_FOR_VOLTORB in Violet City
	db 0, BULBASAUR,    BULBASAUR,    "M","i","m","i","c","@","@","@","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | HASTY,   MALE,   PREMIER_BALL, PERSIM_BERRY
	dw 48926
	db "K","y","l","e","@","@","@","@", $00
; TRADE_WITH_TIM_FOR_KANGASKHAN in Olivine City
	db 1, BULBASAUR,    BULBASAUR, "J","o","e","y","@","@","@","@","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | BRAVE,   MALE,   HEAVY_BALL,   SILK_SCARF
	dw 29189
	db "T","i","m","@","@","@","@","@", $00
; TRADE_WITH_EMY_FOR_MR__MIME in Blackthorn City
	db 3, BULBASAUR,       BULBASAUR,   "D","o","r","i","s","@","@","@","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | TIMID,   FEMALE, LOVE_BALL,    PINK_BOW
	dw 00283
	db "E","m","y","@","@","@","@","@", $00
; TRADE_WITH_CHRIS_FOR_HERACROSS in Pewter City
	db 2, BULBASAUR,     BULBASAUR,  "P","a","u","l","@","@","@","@","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | JOLLY,   MALE,   PARK_BALL,    SILVERPOWDER
	dw 15616
	db "C","h","r","i","s","@","@","@", $00
; TRADE_WITH_KIM_FOR_NUMEL in Route 14
	db 3, BULBASAUR,  BULBASAUR,    "C","h","a","n","c","e","@","@","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | CALM,    FEMALE, HEAL_BALL,    LUCKY_EGG
	dw 26491
	db "K","i","m","@","@","@","@","@", $00
; TRADE_WITH_JACQUES_FOR_GRIMER in Goldenrod Harbor
	db 1, BULBASAUR,  BULBASAUR,     "G","a","i","l","@","@","@","@","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | CAREFUL, FEMALE, LURE_BALL,    EVIOLITE
	dw 50082
	db "J","a","c","q","u","e","s","@", $00
; TRADE_WITH_HARI_FOR_DODUO in Ecruteak City
	db 0, BULBASAUR, BULBASAUR,      "C","l","a","r","e","n","c","e","@","@","@"
	db $EE, $EE, $EE, HIDDEN_ABILITY | HASTY,   MALE,   FAST_BALL,    GOLD_LEAF
	dw 43972
	db "H","a","r","i","@","@","@","@", $00
