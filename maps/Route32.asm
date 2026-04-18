Route32_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 32,  4, 3, BRIGHTBURG_GATE
	warp_def 33,  4, 4, BRIGHTBURG_GATE
	warp_def  5, 30, 1, AUREOLE_MOUNTAIN_1F

	db 0 ; coord events

	db 1 ; bg events
	signpost 30,  8, SIGNPOST_JUMPTEXT, Route32SignText

	db 6 ; object events
	person_event SPRITE_BIG_SNORLAX, 17, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_BIG_SNORLAX, 17, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_BIG_SNORLAX, 18, 22, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_BIG_SNORLAX, 18, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	itemball_event 15, 20, REPEAT_BALL, 1, EVENT_ROUTE_32_POKE_BALL1
	tmhmball_event 18, 37, TM_ENDURE, EVENT_TM58


Route32SignText:
	text "ROUTE 32"
	
	para "NORTH: AUREOLE"
	line "MOUNTAIN"
	
	para "WEST: BRIGHTBURG"
	done
	
Route32Snorlax:
	checkitem POKE_FLUTE
	iffalse Route4NoFlute
	opentext
	writetext Route4SnorlaxTextHaveFlute
	yesorno
	iffalse Route4DontUseFlute
Route32PlayedFluteForSnorlax::
	special SaveMusic
	special Special_FadeOutMusic
	pause 20
	writetext Route4SnorlaxTextUseFlute
	playsound SFX_POKEFLUTE
	waitsfx
	special RestoreMusic
	writetext Route4SnorlaxTextWakeUp
	cry SNORLAX
	waitbutton
	closetext
	waitsfx
	setevent EVENT_BIG_OW_MON_BATTLE
	loadwildmon SNORLAX, SECOND_BATTLE, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY_2
	startbattle
	disappear 1
	disappear 2
	disappear 3
	disappear 4
	clearevent EVENT_BIG_OW_MON_BATTLE
	setevent EVENT_FOUGHT_SNORLAX_ROUTE_32
	reloadmapafterbattle
	checkcode VAR_MONJUSTCAUGHT
	if_equal SNORLAX, .CaughtSnorlax
	opentext
	writetext Route4SnorlaxTextSnorlaxGone
	waitbutton
	closetext
.CaughtSnorlax
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end