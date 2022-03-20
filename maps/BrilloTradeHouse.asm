BrilloTradeHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRILLO_TOWN, 3
	warp_event  3,  7, BRILLO_TOWN, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  3, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_COMMAND, trade, TRADE_WITH_CARRIE_FOR_MARACTUS, -1
	object_event  2,  4, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloTradeHouseNPC1, -1
	
BrilloTradeHouseNPC1:
	jumptextfaceplayer BrilloTradeHouseNPC1Text
	
BrilloTradeHouseNPC1Text:
	text "You like games?"
	
	para "There's a place in"
	line "town you might be"
	cont "interested in…"
	
	para "All I can say is"
	line "the password might"
	cont "start with an “S”."
	
	para "I've already said"
	line "too much…"
	done	
	