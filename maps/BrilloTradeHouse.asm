BrilloTradeHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRILLO_TOWN, 3
	warp_event  3,  7, BRILLO_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_FAT_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, BrilloTradeHouseNPC1, -1
	object_event  5,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrilloTradeHouseNPC2, -1
	
	
BrilloTradeHouseNPC1:
	jumptextfaceplayer BrilloTradeHouseNPC1Text
	
BrilloTradeHouseNPC2:
	jumptextfaceplayer BrilloTradeHouseNPC2Text
	
BrilloTradeHouseNPC1Text:
	text "The wasteland to"
	line "the NORTHEAST is"
	cont "known for intense"
	cont "sandstorms."
	
	para "Anyone who gets"
	line "caught in one is"
	cont "said to be lost"
	cont "forever…"
	done
	
BrilloTradeHouseNPC2Text:
	text "There is a legend"
	line "of an explorer who"
	cont "somehow made it"
	cont "through the desert"
	cont "wastes."
	
	para "“The steaks in the"
	line "sand shall guide"
	cont "you…”"
	
	para "“Let the flags be"
	line "your compass…”"
	
	para "…or so the legend"
	line "goes."
	done