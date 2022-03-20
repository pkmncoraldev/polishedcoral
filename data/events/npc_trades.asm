NPCTrades:
; OT names have 3 characters less padding so the total struct is 32 bytes
; TRADE_WITH_JAKE_FOR_HERACROSS in Route 5 Gate
	db 0, SCYTHER,       HERACROSS,     "HERC@@@@@@@"
	db $DD, $DD, $DD, ABILITY_2 | ADAMANT, MALE,   POKE_BALL,   SITRUS_BERRY
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
	dw 25145
	db "ALICE@@@", $00
; TRADE_WITH_EMY_FOR_SCRAGGY in Luster City Residential
	db 3, CROAGUNK,       SCRAGGY,   "SHAGGY@@@@@"
	db $DD, $DD, $DD, ABILITY_2 | JOLLY, MALE,   POKE_BALL,   SHED_SHELL
	dw 37351
	db "EMY@@@@@", $00
; TRADE_WITH_TABBY_FOR_HOUNDOUR in Luster City Business
	db 4, MEOWTH,     HOUNDOUR,  "MITTENS@@@@"
	db $DD, $DD, $DD, HIDDEN_ABILITY | BRAVE,   FEMALE,   POKE_BALL,    DESTINY_KNOT
	dw 12817
	db "TABBY@@@", $00
; TRADE_WITH_CARRIE_FOR_MARACTUS in Brillo Town
	db 5, CACNEA,  MARACTUS,    "SAMBA@S@@@@"
	db $DD, $DD, $DD, HIDDEN_ABILITY | MODEST,    FEMALE, POKE_BALL,    LUM_BERRY
	dw 43876
	db "CARRIE@@", $00
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
