GlintEvoHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 3, GLINT_CITY
	warp_def 7, 3, 3, GLINT_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_FISHING_GURU, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintEvoHouseNPC1, -1
	person_event SPRITE_REDS_MOM, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintEvoHouseNPC2, -1
	object_event 6, 6, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CUBONE, -1, -1, (1 << 3) | PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, GlintEvoHouseCubone, -1

	const_def 1 ; object constants
	const GLINT_EVOHOUSE_NPC1
	const GLINT_EVOHOUSE_NPC2
	const GLINT_EVOHOUSE_CUBONE

GlintEvoHouseNPC1:
	jumptextfaceplayer GlintEvoHouseNPC1Text
	
GlintEvoHouseNPC2:
	jumptextfaceplayer GlintEvoHouseNPC2Text
	
GlintEvoHouseCubone:
	opentext
	writetext GlintEvoHouseCuboneText
	cry CUBONE
	waitbutton
	closetext
	end
	
GlintEvoHouseNPC1Text:
	text "If you battle with"
	line "your #MON, they"
	cont "grow stronger!"
	
	para "They might even"
	line "evolve!"
	done
	
GlintEvoHouseNPC2Text:
	text "Some #MON"
	line "evolve into"
	cont "different #MON"
	cont "depending on the"
	cont "time of day they're"
	cont "trained."
	done
	
GlintEvoHouseCuboneText:
	text "CUBONE: Bone"
	line "kew bone?"
	done