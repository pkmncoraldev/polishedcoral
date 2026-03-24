ObscuraPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 5, 6, OBSCURA_CITY
	warp_def 7, 6, 6, OBSCURA_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_HIKER,  5,  3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraPokeCenterNPC1, -1
	person_event SPRITE_YOUNGSTER,  6,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObscuraPokeCenterNPC2, -1
	person_event SPRITE_PONYTAIL,  3,  9, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObscuraPokeCenterNPC3, -1
	object_event  9,  7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, GOLBAT, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, PLAIN_FORM, ObscuraPokeCenterGolbat, -1
	
ObscuraPokeCenterNPC1:
	jumptextfaceplayer ObscuraPokeCenterNPC1Text
	
ObscuraPokeCenterNPC1Text:
	text "I've decided to"
	line "hike up AUREOLE"
	cont "MOUNTAIN with my"
	cont "#MON."
	
	para "First we have to"
	line "make our way to"
	cont "ROUTE 30."
	done
	
ObscuraPokeCenterNPC2:
	jumptextfaceplayer ObscuraPokeCenterNPC2Text
	
ObscuraPokeCenterNPC2Text:
	text "No matter how much"
	line "my GOLBAT battles,"
	cont "it won't evolve!"
	
	para "What am I doing"
	line "wrong?"
	done
	
ObscuraPokeCenterNPC3:
	jumptextfaceplayer ObscuraPokeCenterNPC3Text
	
ObscuraPokeCenterNPC3Text:
	text "I saw a big bat"
	line "#MON flying"
	cont "toward the cave"
	cont "EAST of town."
	
	para "I wonder if it has"
	line "a nest over there."
	done
	
ObscuraPokeCenterGolbat:
	opentext TEXTBOX_POKEMON, GOLBAT
	writetext ObscuraPokeCenterGolbatText
	cry GOLBAT
	waitsfx
	waitbutton
	endtext
	
ObscuraPokeCenterGolbatText:
	text "Guuu oooo!"
	done
