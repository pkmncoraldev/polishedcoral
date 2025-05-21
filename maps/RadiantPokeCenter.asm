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
	person_event SPRITE_CHANSEY,  1, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantPokeCenterChansey, -1
	person_event SPRITE_COOL_DUDE,  5,  2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantPokeCenterNPC1, -1
	person_event SPRITE_GRAMPS,  3, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantPokeCenterNPC2, -1
	object_event  9,  6, SPRITE_PONYTAIL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_COMMAND, trade, TRADE_WITH_BEV_FOR_VOLTORB, -1
	
RadiantPokeCenterChansey:
	opentext
	writetext RadiantPokeCenterChanseyText1
	callasm RadiantPokeCenterChanseyCry
	pause 10
	killsfx
	playsound SFX_FAINT
	writetext RadiantPokeCenterChanseyText2
	waitbutton
	closetext
	end
	
RadiantPokeCenterChanseyCry:
	ld a, CHANSEY
	jp PlayCry2
	
RadiantPokeCenterChanseyText1:
	text "CHANSEY: Si-"
	done
	
RadiantPokeCenterChanseyText2:
	text "CHOO!"
	
	para "…"
	
	para "It sneezed!"
	
	para "Poor thing must"
	line "have a pollen"
	cont "allergy!"
	done
	
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
	
	para "Oh ho ho!"
	done
