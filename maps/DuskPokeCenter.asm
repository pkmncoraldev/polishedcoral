DuskPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  7, DUSK_TURNPIKE, 11
	warp_event  6,  7, DUSK_TURNPIKE, 11

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_CUTE_GIRL,  3,  2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DuskPokeCenterNPC1, -1
	person_event SPRITE_FAT_GUY,  5,  6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, DuskPokeCenterNPC2, -1
	person_event SPRITE_COOL_DUDE,  6,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DuskPokeCenterNPC3, -1
	object_event  8,  6, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, GRIMER, -1, -1, PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, DuskPokeCenterGrimer, -1
	person_event SPRITE_SUPER_NERD,  1,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, DuskPokeCenterNPC4, -1
	
DuskPokeCenterNPC1:
	jumptextfaceplayer DuskPokeCenterNPC1Text
	
DuskPokeCenterNPC2:
	jumptextfaceplayer DuskPokeCenterNPC2Text
	
DuskPokeCenterNPC3:
	jumptextfaceplayer DuskPokeCenterNPC3Text

DuskPokeCenterNPC4:
	faceplayer
	opentext
	writetext DuskPokeCenterNPC4Text
	waitbutton
	closetext
	spriteface 7, DOWN
	end

DuskPokeCenterGrimer:
	opentext TEXTBOX_POKEMON, GRIMER
	writetext DuskPokeCenterGrimerText
	cry GRIMER
	waitbutton
	closetext
	end

DuskPokeCenterNPC1Text:
	text "Most people that"
	line "travel from NORTH"
	cont "to SOUTH ONWA, or"
	cont "vice versa, do so"
	cont "via the ocean."
	
	para "There's also"
	line "ROUTE 23 down the"
	cont "highway."
	
	para "But apparently"
	line "there's a third"
	cont "way…"
	done
	
DuskPokeCenterNPC2Text:
	text "There's a beautiful"
	line "little town SOUTH"
	cont "of here."
	
	para "How can such a"
	line "nice little place"
	cont "be so close to"
	cont "such a dingy town"
	cont "as this one?"
	done
	
DuskPokeCenterNPC3Text:
	text "My precious little"
	line "GRIMER leaves an"
	cont "adorable little"
	cont "trail of sludge"
	cont "everywhere we go."
	
	para "Boy, I'm glad I'm"
	line "not the one that"
	cont "has to mop up the"
	cont "floors!"
	done
	
DuskPokeCenterNPC4Text:
	text "I'm the janitor."
	
	para "I don't get paid"
	line "enough for this…"
	done
	
DuskPokeCenterGrimerText:
	text "Rai ai ai!"
	done
	