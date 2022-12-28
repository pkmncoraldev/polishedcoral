LusterPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 4, 3, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 5, 3, LUSTER_CITY_RESIDENTIAL

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_NURSE, 6, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterPokeCenterNPC1, -1
	person_event SPRITE_COOL_DUDE, 4, 2, SPRITEMOVEDATA_WANDER, 0, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterPokeCenterNPC2, -1
	object_event 9, 5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CHANSEY, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, LusterPokeCenterChansey, -1
	
LusterPokeCenterNPC1:
	jumptextfaceplayer LusterPokeCenterNPC1Text
	
LusterPokeCenterNPC2:
	jumptextfaceplayer LusterPokeCenterNPC2Text
	
LusterPokeCenterChansey:
	opentext
	writetext LusterPokeCenterChanseyText1
	cry CHANSEY
	waitsfx
	buttonsound
	writetext LusterPokeCenterChanseyText2
	waitbutton
	closetext
	end
	
LusterPokeCenterNPC1Text:
	text "Whaddya ya want"
	line "twerp?"
	
	para "Can't you see our"
	line "shift is over?"
	
	para "Go bug the nurse"
	line "at the desk!"
	done
	
LusterPokeCenterNPC2Text:
	text "This #MON"
	line "CENTER isn't as"
	cont "busy as the one"
	cont "in the SHOPPING"
	cont "MALL."
	
	para "It's gotta be"
	line "pretty boring to"
	cont "work here…"
	done
	
LusterPokeCenterChanseyText1:
	text "CHANSEY: Sii…"
	done
	
LusterPokeCenterChanseyText2:
	text "It's giving you"
	line "the stink eye…"
	done
