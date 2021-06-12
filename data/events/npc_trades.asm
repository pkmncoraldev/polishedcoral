NPCTrades:
; OT names have 3 characters less padding so the total struct is 32 bytes
; TRADE_WITH_JAKE_FOR_PINSIR in Route 5 Gate
	db 0, SCYTHER,       PINSIR,     "SIR SNIPS@@"
	db $DD, $DD, $DD, ABILITY_1 | ADAMANT, MALE,   POKE_BALL,   SITRUS_BERRY
	dw 64582
	db "JAKE@@@@", $00
; TRADE_WITH_PAUL_FOR_EXEGGCUTE on Sunbeam Island
	db 1, GLOOM,       EXEGGCUTE_A,     "SUNNY SIDE@"
	db $DD, $DD, $DD, HIDDEN_ABILITY | MODEST, MALE,   POKE_BALL,   RAWST_BERRY
	dw 15832
	db "PAULIE@@", $00
; TRADE_WITH_ALICE_FOR_GLIGAR in Twinkle Town
	db 2, SNEASEL,       GLIGAR,     "ROBIN@@@@@@"
	db $DD, $DD, $DD, ABILITY_1 | ADAMANT, FEMALE,   POKE_BALL,   RAZOR_CLAW
	dw 64582
	db "ALICE@@@", $00
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
