StarglowGrandpaHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 3, STARGLOW_VALLEY
	warp_def 7, 2, 3, STARGLOW_VALLEY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GENTLEMAN, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, StarglowHouse3NPC1, -1
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, StarglowHouse3NPC2, -1
	
StarglowHouse3NPC1:
	jumptextfaceplayer StarglowHouse3NPC1Text
	
StarglowHouse3NPC2:
	jumptextfaceplayer StarglowHouse3NPC2Text
	
StarglowHouse3NPC1Text:
	text "Thank you for your"
	line "help child,"
	
	para "but I was never in"
	line "any danger."
	
	para "I'm the toughest"
	line "TRAINER around!"
	
	para "Ohohohoho…"
	done
	
StarglowHouse3NPC2Text:
	text "My grandpa thinks"
	line "he's the toughest"
	cont "TRAINER around."
	
	para "Between you and"
	line "me, he's nothing"
	cont "special."
	
	para "I just don't have"
	line "the heart to tell"
	cont "him…"
	done
