SunbeamPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 4, 2, SUNBEAM_ISLAND
	warp_def 7, 5, 2, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_SUPER_NERD, 3, 8, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 5, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterNPC2, -1
	object_event 1, 5, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MEOWTH, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamPokecenterNPC3, -1

	
	const_def 1 ; object constants
	const SUNBEAM_POKECENTER_NURSE
	const SUNBEAM_POKECENTER_CHANSEY
	const SUNBEAM_POKECENTER_NPC1
	const SUNBEAM_POKECENTER_NPC2
	const SUNBEAM_POKECENTER_NPC3
	
SunbeamPokecenterNPC1:
	jumptextfaceplayer SunbeamPokecenterNPC1Text
	
SunbeamPokecenterNPC2:
	jumptextfaceplayer SunbeamPokecenterNPC2Text
	
SunbeamPokecenterNPC3:
	opentext
	writetext SunbeamPokecenterNPC3Text
	cry MEOWTH
	waitsfx
	waitbutton
	closetext
	end
	
SunbeamPokecenterNPC1Text:
	text "CORSOLA used to"
	line "gather near the"
	cont "beach on the WEST"
	cont "of the island."
	
	para "You don't see them"
	line "very much anymore."
	done
	
SunbeamPokecenterNPC2Text:
	text "Lately my MEOWTH"
	line "has been acting"
	cont "out a lot more."
	
	para "I wonder if he's"
	line "getting close to"
	cont "evolving."
	done
	
SunbeamPokecenterNPC3Text:
	text "MEOWTH: OWTH!"
	line "ME-OWTH!"
	done