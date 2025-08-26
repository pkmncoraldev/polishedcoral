Route30_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 32,  4, 3, BRIGHTBURG_GATE
	warp_def 33,  4, 4, BRIGHTBURG_GATE

	db 0 ; coord events

	db 1 ; bg events
	signpost 30,  8, SIGNPOST_JUMPTEXT, Route30SignText

	db 6 ; object events
	person_event SPRITE_BIG_SNORLAX, 17, 22, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route30Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_30
	person_event SPRITE_BIG_SNORLAX, 17, 23, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route30Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_30
	person_event SPRITE_BIG_SNORLAX, 18, 22, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route30Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_30
	person_event SPRITE_BIG_SNORLAX, 18, 23, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route30Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_30
	itemball_event 15, 20, REPEAT_BALL, 1, EVENT_ROUTE_30_POKE_BALL1
	tmhmball_event 18, 37, TM_ENDURE, EVENT_ROUTE_30_POKE_BALL2


Route30SignText:
	text "ROUTE 30"
	
	para "NORTH: AUREOLE"
	line "MOUNTAIN"
	
	para "WEST: BRIGHTBURG"
	done
	
Route30Snorlax:
	checkitem POKE_FLUTE
	iffalse Route4NoFlute
	opentext
	writetext Route4SnorlaxTextHaveFlute
	yesorno
	iffalse Route4DontUseFlute
Route30PlayedFluteForSnorlax::
	writetext Route4SnorlaxTextUseFlute
	playsound SFX_POKEFLUTE
	waitsfx
	writetext Route4SnorlaxTextWakeUp
	cry SNORLAX
	waitbutton
	closetext
	waitsfx
	setevent EVENT_BIG_OW_MON_BATTLE
	loadwildmon SNORLAX, 25
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear 1
	disappear 2
	disappear 3
	disappear 4
	clearevent EVENT_BIG_OW_MON_BATTLE
	setevent EVENT_FOUGHT_SNORLAX_ROUTE_30
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