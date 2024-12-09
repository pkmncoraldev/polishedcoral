KomoreHouse3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, KOMORE_VILLAGE, 5
	warp_event  3,  7, KOMORE_VILLAGE, 5

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	person_event SPRITE_POKEFAN_M,  3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, KomoreHouse3NPC1, -1
	person_event SPRITE_MATRON,  4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse3NPC2, -1
	person_event SPRITE_TWIN,  6, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, KomoreHouse3NPC3, -1
	object_event  3,  1, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, JIGGLYPUFF, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, KomoreHouse3Jiggly, -1
	object_event  1,  6, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, SWABLU, -1, -1, PAL_NPC_TEAL, PERSONTYPE_SCRIPT, 0, KomoreHouse3Swablu, -1
	object_event  0,  3, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, MARILL, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse3Marill, -1
	object_event  7,  5, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, MAREEP, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, KomoreHouse3Mareep, -1
	
KomoreHouse3Jiggly:
	jumptext KomoreHouse3JigglyText
	
KomoreHouse3Swablu:
	jumptext KomoreHouse3SwabluText
	
KomoreHouse3Marill:
	jumptext KomoreHouse3MarillText
	
KomoreHouse3Mareep:
	jumptext KomoreHouse3MareepText
	
KomoreHouse3Giraf:
	jumptext KomoreHouse3GirafText
	
KomoreHouse3NPC1:
	jumptextfaceplayer KomoreHouse3NPC1Text
	
KomoreHouse3NPC2:
	jumptextfaceplayer KomoreHouse3NPC2Text
	
KomoreHouse3NPC3:
	jumptextfaceplayer KomoreHouse3NPC3Text
	
KomoreHouse3GiveText:
	text "<PLAYER> handed"
	line "over # DOLL."
	done
	
KomoreHouse3NPC1Text:
	text "Why would a"
	line "PIKACHU take a"
	cont "child's doll?"
	
	para "We don't even"
	line "have wild PIKACHU"
	cont "around here!"
	done
	
KomoreHouse3NPC2Text:
	text "Our little girl's"
	line "dolls keep going"
	cont "missing."
	
	para "She keeps making"
	line "up tall tales"
	cont "about a PIKACHU"
	cont "taking them."
	
	para "I think she just"
	line "wants us to buy"
	cont "her new toys!"
	done
	
KomoreHouse3NPC3Text:
	text "A scary PIKACHU"
	line "comes in at night"
	cont "and takes away my"
	cont "dollies!"
	
	para "It's true!"
	done
	
KomoreHouse3JigglyText:
	text "A fluffy"
	line "JIGGLYPUFF doll."
	done
	
KomoreHouse3SwabluText:
	text "A fluffy"
	line "SWABLU doll."
	done
	
KomoreHouse3MarillText:
	text "A fluffy"
	line "MARILL doll."
	done
	
KomoreHouse3MareepText:
	text "A fluffy"
	line "MAREEP doll."
	done
	
KomoreHouse3GirafText:
	text "A fluffy"
	line "GIRAFARIG doll."
	done
