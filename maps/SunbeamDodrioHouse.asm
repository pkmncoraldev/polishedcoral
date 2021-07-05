SunbeamDodrioHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 5, SUNBEAM_ISLAND
	warp_def 7, 2, 5, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_REDS_MOM, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse4NPC1, -1
	person_event SPRITE_BATTLE_GIRL, 3, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse4NPC2, -1
	object_event 7, 4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse4NPC3, -1

	const_def 1 ; object constants
	const SUNBEAM_DODRIO_HOUSE_NPC1
	const SUNBEAM_DODRIO_HOUSE_NPC2
	const SUNBEAM_DODRIO_HOUSE_DODUO
	
SunbeamIslandHouse4NPC1:
	jumptextfaceplayer SunbeamIslandHouse4NPC1Text
	
SunbeamIslandHouse4NPC2:
	jumptextfaceplayer SunbeamIslandHouse4NPC2Text
	
SunbeamIslandHouse4NPC3:
	opentext
	writetext SunbeamIslandHouse4NPC3Text
	cry DODUO
	waitsfx
	waitbutton
	closetext
	end
	
SunbeamIslandHouse4NPC1Text:
	text "There is a DODRIO"
	line "RANCH to the NORTH"
	cont "EAST."
	
	para "The DODUO bred"
	line "there are the"
	cont "fastest around."
	done
	
SunbeamIslandHouse4NPC2Text:
	text "Our DODUO isn't"
	line "from the DODRIO"
	cont "RANCH,"
	
	para "but we love it"
	line "just the same."
	done
	
SunbeamIslandHouse4NPC3Text:
	text "DODUO: DEWO! DEWO!"
	line "DEWO!"
	done