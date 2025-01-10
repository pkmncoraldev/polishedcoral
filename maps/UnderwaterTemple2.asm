UnderwaterTemple2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 12 ; warp events
	warp_def 42,  2, 3, UNDERWATER_TEMPLE_1
	warp_def 42,  3, 4, UNDERWATER_TEMPLE_1
	warp_def 43,  2, 5, UNDERWATER_TEMPLE_1
	warp_def 43,  3, 6, UNDERWATER_TEMPLE_1
	warp_def 16,  2, 7, UNDERWATER_TEMPLE_1
	warp_def 16,  3, 8, UNDERWATER_TEMPLE_1
	warp_def 17,  2, 9, UNDERWATER_TEMPLE_1
	warp_def 17,  3, 10, UNDERWATER_TEMPLE_1
	warp_def  4, 30, 11, UNDERWATER_TEMPLE_1
	warp_def  4, 31, 12, UNDERWATER_TEMPLE_1
	warp_def  5, 30, 13, UNDERWATER_TEMPLE_1
	warp_def  5, 31, 14, UNDERWATER_TEMPLE_1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  9, 25, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CORSOLA, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, GALARIAN_FORM, UnderwaterTemple2Corsola, EVENT_UNDERWATER_TEMPLE_2_CORSOLA
	itemball_event 27, 40, CORAL_SHARD, 1, EVENT_UNDERWATER_TEMPLE_2_POKEBALL


	const_def 1 ; object constants
	const UNDERWATER_TEMPLE_CORSOLA

UnderwaterTemple2Corsola:
	opentext
	writetext UnderwaterTemple1CorsolaText
	cry CORSOLA
	waitbutton
	closetext
	waitsfx
	loadwildmon CORSOLA, GALARIAN_FORM, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	disappear UNDERWATER_TEMPLE_CORSOLA
	reloadmapafterbattle
	setevent EVENT_UNDERWATER_TEMPLE_2_CORSOLA
	checkcode VAR_MONJUSTCAUGHT
	if_equal CORSOLA, .CaughtCorsola
	opentext
	writetext UnderwaterTemple1CorsolaTextGone
	waitbutton
	closetext
.CaughtCorsola
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end