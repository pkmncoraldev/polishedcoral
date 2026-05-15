GlintPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 6, 1, GLINT_CITY
	warp_def 7, 5, 1, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	pc_nurse_event  5, 1
	pc_chansey_event  6, 1
	person_event SPRITE_FISHING_GURU, 6, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc1, -1
	person_event SPRITE_POKEFAN_M, 4, 2, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc2, -1
	person_event SPRITE_POKEMANIAC,  2,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintPokeCenterNpc3, -1
	object_event 9, 7, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CUBONE, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, GlintPokeCenterCubone, -1

	const_def 1 ; object constants
	const GLINT_POKECENTER_NURSE
	const GLINT_POKECENTER_CHANSEY
	const GLINT_POKECENTER_NPC1
	const GLINT_POKECENTER_NPC2
	const GLINT_POKECENTER_NPC3
	const GLINT_POKECENTER_TEA_LADY
	
	
GlintPokeCenterNpc1:
	jumptextfaceplayer GlintPokeCenterNpc1Text

GlintPokeCenterNpc2:
	jumptextfaceplayer GlintPokeCenterNpc2Text

GlintPokeCenterNpc3:
	jumptextfaceplayer GlintPokeCenterNpc3Text
	
GlintPokeCenterCubone:
	opentext TEXTBOX_POKEMON, CUBONE
	writetext GlintPokeCenterCuboneText
	cry CUBONE
	waitbutton
	closetext
	end
	
GlintPokeCenterNpc1Text:
	text "Some #MON"
	line "will evolve into"
	cont "different forms"
	cont "depending on the"
	cont "circumstances."
	done

GlintPokeCenterNpc2Text:
	text "There is a grove"
	line "NORTH of GLINT"
	cont "CITY."
	
	para "FAIRY-type #MON"
	line "seem to be drawn"
	
	para "to it for some"
	line "reason."
	done

GlintPokeCenterNpc3Text:
	text "You can store"
	line "#MON in the PCs"
	cont "at every #MON"
	cont "CENTER."
	
	para "If you catch a"
	line "#MON that fills"
	cont "your box,"
	
	para "you'll be asked"
	line "if you want to"
	cont "switch."
	
	para "Convenient!"
	done
	
GlintPokeCenterCuboneText:
	text "Bone kew"
	line "bone?"
	done