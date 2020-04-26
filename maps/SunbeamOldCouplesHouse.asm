SunbeamOldCouplesHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 7, SUNBEAM_ISLAND
	warp_def 7, 2, 7, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GRAMPS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse1NPC1, -1
	person_event SPRITE_GRANNY, 4, 5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, SunbeamIslandHouse1NPC2, -1

	const_def 1 ; object constants
	const SUNBEAM_OLD_COUPLES_HOUSE_NPC1
	const SUNBEAM_OLD_COUPLES_HOUSE_NPC2
	
SunbeamIslandHouse1NPC1:
	jumptextfaceplayer SunbeamIslandHouse1NPC1Text
	
SunbeamIslandHouse1NPC2:
	jumptextfaceplayer SunbeamIslandHouse1NPC2Text
	
SunbeamIslandHouse1NPC1Text:
	text "This island was"
	line "the perfect place"
	cont "to retire."
	
	para "We have great wea-"
	line "ther, and it isn't"
	cont "too quiet or too"
	cont "busy."
	done
	
SunbeamIslandHouse1NPC2Text:
	text "I try and take a"
	line "walk to the beach"
	cont "at least once a"
	cont "day."
	
	para "It's good exercise,"
	line "and the sunlight's"
	cont "good for my skin."
	done
	