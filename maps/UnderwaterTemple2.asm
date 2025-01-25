UnderwaterTemple2_MapScriptHeader:
	db 1 ; scene scripts
	scene_script UnderwaterTemple2Trigger0

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, UnderwaterTemple2Callback

	db 12 ; warp events
	warp_def 32,  2, 3, UNDERWATER_TEMPLE_1
	warp_def 32,  3, 4, UNDERWATER_TEMPLE_1
	warp_def 33,  2, 5, UNDERWATER_TEMPLE_1
	warp_def 33,  3, 6, UNDERWATER_TEMPLE_1
	warp_def  6,  2, 7, UNDERWATER_TEMPLE_1
	warp_def  6,  3, 8, UNDERWATER_TEMPLE_1
	warp_def  7,  2, 9, UNDERWATER_TEMPLE_1
	warp_def  7,  3, 10, UNDERWATER_TEMPLE_1
	warp_def 16, 24, 11, UNDERWATER_TEMPLE_1
	warp_def 16, 25, 12, UNDERWATER_TEMPLE_1
	warp_def 17, 24, 13, UNDERWATER_TEMPLE_1
	warp_def 17, 25, 14, UNDERWATER_TEMPLE_1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, 15,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, UnderwaterTemple2Corsola, EVENT_UNDERWATER_TEMPLE_2_CORSOLA
	person_event SPRITE_GENERAL_VARIABLE_1, 8, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, UnderwaterTemple2Cursola, EVENT_UNDERWATER_TEMPLE_2_CORSOLA_2
	person_event SPRITE_BIG_CURSOLA,  8, 25, SPRITEMOVEDATA_CURSOLA, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_UNDERWATER_TEMPLE_2_CURSOLA
	itemball_event 27, 30, CORAL_SHARD, 1, EVENT_UNDERWATER_TEMPLE_2_POKEBALL
	itemball_event 25,  5, ANCIENT_BALL, 1, EVENT_UNDERWATER_TEMPLE_2_ARTIFACT


	const_def 1 ; object constants
	const UNDERWATER_TEMPLE_CORSOLA
	const UNDERWATER_TEMPLE_CORSOLA_2
	const UNDERWATER_TEMPLE_CURSOLA


UnderwaterTemple2Trigger0:
	readmem wOWSpriteAnimationTimer
	if_not_equal 140, .end
	priorityjump UnderwaterTemple2Cursola2
.end
	end

UnderwaterTemple2Callback:
	loadvar wTimeOfDayPalFlags, $40 | 0
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CURSOLA
	return

UnderwaterTemple2Cursola:
	loadvar wOWSpriteAnimationTimer, 0
	opentext
	writetext UnderwaterTemple2CursolaText2
	yesorno
	iffalse .no
	closetext
	pause 40
	playmusic MUSIC_NONE
	playsound SFX_COMET_PUNCH
	pause 5
	spriteface UNDERWATER_TEMPLE_CORSOLA_2, UP
	pause 4
	spriteface UNDERWATER_TEMPLE_CORSOLA_2, LEFT
	pause 20
	opentext
	writetext UnderwaterTemple2CursolaText
	waitbutton
	closetext
	appear UNDERWATER_TEMPLE_CURSOLA
	pause 70
	special Special_DisableInput
	pause 30
	end
.no
	writetext UnderwaterTempleOutsideDoorText6
	waitbutton
	closetext
	end
	
UnderwaterTemple2Cursola2:
	pause 40
	opentext
	writetext UnderwaterTemple2CursolaText3
	special Special_EnableInput
	cry CURSOLA
	waitbutton
	closetext
	waitsfx
	setlasttalked UNDERWATER_TEMPLE_CURSOLA
	loadwildmon CURSOLA, 40
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear UNDERWATER_TEMPLE_CURSOLA
	disappear UNDERWATER_TEMPLE_CORSOLA_2
	clearevent EVENT_UNDERWATER_TEMPLE_2_CORSOLA_2
	reloadmapafterbattle
	setevent EVENT_UNDERWATER_TEMPLE_2_CURSOLA
	setevent EVENT_UNDERWATER_TEMPLE_2_CORSOLA_2
	checkcode VAR_MONJUSTCAUGHT
	if_equal CURSOLA, .CaughtCursola
	opentext
	writetext UnderwaterTemple2CursolaTextGone
	waitbutton
	closetext
.CaughtCursola
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	loadvar wOWSpriteAnimationTimer, 0
	playmapmusic
	end
	
UnderwaterTemple2CursolaText:
	text "It fell to pieces…"
	done
	
UnderwaterTemple2CursolaText2:
	text "It's a CORSOLA."
	
	para "It doesn't look"
	line "so good…"
	
	para "Reach out and"
	line "touch it?"
	done
	
UnderwaterTemple2CursolaText3:
	text "CURSOLA: SOLAAAA!"
	done
	
UnderwaterTemple2CursolaTextGone:
	text "CURSOLA"
	line "disappeared."
	done

UnderwaterTemple2Corsola:
	opentext
	writetext UnderwaterTemple2CursolaText2
	yesorno
	iffalse .no
	closetext
	pause 40
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
.no
	writetext UnderwaterTempleOutsideDoorText6
	waitbutton
	closetext
	end
	
UnderwaterTemple2CorsolaText:
	text "CORSOLA: …<WAIT_S>S<WAIT_S>o<WAIT_S>l<WAIT_S>…"
	done
	
UnderwaterTemple2CorsolaTextGone:
	text "The poor thing"
	line "slinked away…"
	done