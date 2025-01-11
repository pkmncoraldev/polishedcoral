UnderwaterTemple2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, UnderwaterTemple2Callback

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
	person_event SPRITE_GENERAL_VARIABLE_1, 25, 9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, UnderwaterTemple2Corsola, EVENT_UNDERWATER_TEMPLE_2_CORSOLA
	itemball_event 27, 40, CORAL_SHARD, 1, EVENT_UNDERWATER_TEMPLE_2_POKEBALL


	const_def 1 ; object constants
	const UNDERWATER_TEMPLE_CORSOLA


UnderwaterTemple2Callback:
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CURSOLA_1
	return

UnderwaterTemple2CursolaTest:
	opentext
	writetext UnderwaterTemple2CursolaTestText2
	yesorno
	iffalse .no
	closetext
	waitsfx
	pause 10
	playsound SFX_WATER_GUN
	waitsfx
	pause 15
	playsound SFX_COMET_PUNCH
	pause 5
	spriteface UNDERWATER_TEMPLE_CORSOLA, UP
	pause 4
	spriteface UNDERWATER_TEMPLE_CORSOLA, LEFT
	pause 20
	opentext
	writetext UnderwaterTemple2CursolaTestText
	waitbutton
	closetext
	pause 10
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CURSOLA_2
	pause 20
	spriteface UNDERWATER_TEMPLE_CORSOLA, UP
	pause 2
	spriteface UNDERWATER_TEMPLE_CORSOLA, DOWN
	end
.no
	writetext UnderwaterTempleOutsideDoorText6
	waitbutton
	closetext
	end	
	
UnderwaterTemple2CursolaTestText:
	text "It fell to pieces…"
	done
	
UnderwaterTemple2CursolaTestText2:
	text "It's a CORSOLA."
	
	para "It doesn't look"
	line "so good…"
	
	para "Reach out and"
	line "touch it?"
	done

UnderwaterTemple2Corsola:
	opentext
	writetext UnderwaterTemple2CorsolaText
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
	writetext UnderwaterTemple2CorsolaTextGone
	waitbutton
	closetext
.CaughtCorsola
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
UnderwaterTemple2CorsolaText:
	text "CORSOLA: Sol…"
	done
	
UnderwaterTemple2CorsolaTextGone:
	text "The poor thing"
	line "slinked away…"
	done