Route32_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route32Callback

	db 3 ; warp events
	warp_def 32,  4, 3, BRIGHTBURG_GATE
	warp_def 33,  4, 4, BRIGHTBURG_GATE
	warp_def  5, 30, 1, AUREOLE_MOUNTAIN_1F

	db 0 ; coord events

	db 2 ; bg events
	signpost 30,  8, SIGNPOST_JUMPTEXT, Route32SignText
	signpost  6, 28, SIGNPOST_JUMPTEXT, Route32AureoleSignText

	db 10 ; object events
	person_event SPRITE_BIG_SNORLAX, 19, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_BIG_SNORLAX, 19, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_BIG_SNORLAX, 20, 25, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_BIG_SNORLAX, 20, 26, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route32Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_32
	person_event SPRITE_LASS, 17, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route32NPC1, EVENT_ROUTE_32_LASS_GONE
	person_event SPRITE_YOUNGSTER, 22, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route32NPC2, -1
	person_event SPRITE_POKEMANIAC,  9, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route32NPC3, -1
	strengthboulder_event 30,  6, -1
	itemball_event 15, 20, REPEAT_BALL, 1, EVENT_ROUTE_32_POKE_BALL1
	tmhmball_event 18, 35, TM_ENDURE, EVENT_TM58


Route32Callback:
	setevent EVENT_EVENTIDE_LASS_GONE
	return

Route32NPC1:
	jumptextfaceplayer Route32NPC1Text
	
Route32NPC1Text:
	text "That other SNORLAX"
	line "blocked my way by"
	cont "STARGLOW VALLEY,"
	
	para "and now THIS one"
	line "was blocking the"
	cont "road here!"
	
	para "Hey!"
	
	para "You were there"
	line "last time too!"
	
	para "Man, you're one"
	line "talented musician!"
	done
	
Route32NPC2:
	checkevent EVENT_FOUGHT_SNORLAX_ROUTE_32
	iftrue .snorlax_done
	jumptextfaceplayer Route32NPC2Text1
.snorlax_done
	jumptextfaceplayer Route32NPC2Text2
	
Route32NPC2Text1:
	text "If I could just"
	line "hop up that ledge,"
	cont "SNORLAX wouldn't"
	cont "be a problem."
	
	para "Sigh…"
	
	para "Guess I have to"
	line "wait for someone"
	cont "to make it move!"	
	done
	
Route32NPC2Text2:
	text "Your flute woke"
	line "SNORLAX up?"
	
	para "Hey, that works"
	line "for me!"
	done
	
Route32NPC3:
	jumptextfaceplayer Route32NPC3Text
	
Route32NPC3Text:
	text "If you're planning"
	line "on heading up"
	cont "AUREOLE MOUNTAIN,"
	
	para "you'd better be"
	line "ready for a long"
	cont "climb."
	
	para "TRAINERS often try"
	line "and fail before"
	cont "getting very far…"
	done

Route32SignText:
	text "ROUTE 32"
	
	para "NORTH: AUREOLE"
	line "MOUNTAIN &"
	cont "LUMINA TOWN"
	
	para "WEST: BRIGHTBURG"
	done
	
Route32AureoleSignText:
	text "AUREOLE MOUNTAIN"
	line "ahead."
	done
	
Route32Snorlax:
	checkitem POKE_FLUTE
	iffalse Route4NoFlute
	opentext
	writetext Route4SnorlaxTextHaveFlute
	yesorno
	iffalse Route4DontUseFlute
Route32PlayedFluteForSnorlax::
	spriteface 5, DOWN
	setlasttalked 6
	faceplayer
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