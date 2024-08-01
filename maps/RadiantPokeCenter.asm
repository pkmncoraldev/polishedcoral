RadiantPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  4,  7, RADIANT_TOWNSHIP, 5
	warp_event  5,  7, RADIANT_TOWNSHIP, 5

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_COOL_DUDE,  5,  2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantPokeCenterNPC1, -1
	person_event SPRITE_GRAMPS,  3, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantPokeCenterNPC2, -1
	object_event  9,  6, SPRITE_PONYTAIL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, trade, TRADE_WITH_BEV_FOR_PINECO, -1
	
RadiantPokeCenterNPC1:
	jumptextfaceplayer RadiantPokeCenterNPC1Text
	
RadiantPokeCenterNPC2:
	jumptextfaceplayer RadiantPokeCenterNPC2Text
	
RadiantPokeCenterNPC1Text:
	text "We tend to have a"
	line "lot of GRASS and"
	cont "BUG-type #MON"
	cont "around here."
	
	para "They just love the"
	line "nectar from the"
	cont "flowers."
	done
	
RadiantPokeCenterNPC2Text:
	text "LEILANI opened the"
	line "orphanage here"
	cont "many years ago."
	
	para "She's always been"
	line "a sweetheart."
	
	para "…<WAIT_M>and back then"
	line "she was quite a"
	cont "looker, too!"
	
	para "Oh <WAIT_S>ho <WAIT_S>ho!"
	done
