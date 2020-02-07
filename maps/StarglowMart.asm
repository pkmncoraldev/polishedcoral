StarglowMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 6, STARGLOW_VALLEY
	warp_def 7, 3, 6, STARGLOW_VALLEY

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_STARGLOW
	person_event SPRITE_REDS_MOM, 6, 5, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, StarglowMartNPC1, -1
	person_event SPRITE_POKEFAN_M, 2, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StarglowMartNPC2, -1
	
StarglowMartNPC1:
	jumptextfaceplayer StarglowMartNPC1Text
	
StarglowMartNPC2:
	jumptextfaceplayer StarglowMartNPC2Text
	
StarglowMartNPC1Text:
	text "Different shops"
	line "sell different"
	cont "items."
	
	para "You should always"
	line "check the #MART"
	cont "in every town you"
	cont "visit."
	done
	
StarglowMartNPC2Text:
	text "This town's MART"
	line "doesn't sell"
	cont "GREAT BALLS?"
	
	para "I guess I'll have"
	line "to take the trek"
	cont "over to the next"
	cont "town."
	done