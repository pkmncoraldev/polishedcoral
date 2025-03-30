Route4_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route4Callback

	db 6 ; warp events
	warp_def 24, 37, 1, ROUTE_4_EVENTIDE_GATE
	warp_def 25, 37, 2, ROUTE_4_EVENTIDE_GATE
	warp_def  7, 12, 1, HUNTERS_THICKET
	warp_def  7, 13, 2, HUNTERS_THICKET
	warp_def  1, 44, 3, HUNTERS_THICKET
	warp_def  1, 45, 4, HUNTERS_THICKET

	db 0 ; coord events

	db 4 ; bg events
	signpost 15,  2, SIGNPOST_READ, Route4Sign
	signpost 23, 36, SIGNPOST_READ, Route4ForestSign
	signpost 14, 53, SIGNPOST_READ, Route4Grave
	bg_event 15, 12, SIGNPOST_ITEM + MOON_STONE, EVENT_ROUTE_4_HIDDEN_MOON_STONE

	db 15 ; object events
	person_event SPRITE_BIG_SNORLAX, 18, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route4Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_BIG_SNORLAX, 18, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route4Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_BIG_SNORLAX, 19, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route4Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_BIG_SNORLAX, 19, 21, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route4Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_LASS, 15,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute4_1, -1
	person_event SPRITE_FISHER, 19, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute4_2, -1
	person_event SPRITE_FISHER, 24, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute4_3, -1
	person_event SPRITE_FISHER, 24, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute4_4, -1
	person_event SPRITE_LASS, 18, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route4NPC5, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_YOUNGSTER, 18, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route4NPC7, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_POKEFAN_M, 19, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route4NPC8, EVENT_FOUGHT_SNORLAX_ROUTE_4
	itemball_event 33,  9, SILK_SCARF, 1, EVENT_ROUTE_4_SILK_SCARF
	itemball_event 53, 13, POKE_DOLL, 1, EVENT_ROUTE_4_POKE_DOLL
	fruittree_event 16, 15, FRUITTREE_ROUTE_4_1, CHERI_BERRY
	fruittree_event 35, 12, FRUITTREE_ROUTE_4_2, PECHA_BERRY

	const_def 1 ; object constants
	const ROUTE4SNORLAX1
	const ROUTE4SNORLAX2
	const ROUTE4SNORLAX3
	const ROUTE4SNORLAX4
	const ROUTE4LASS
	const ROUTE4FISHER1
	const ROUTE4FISHER2
	const ROUTE4FISHER3
	const ROUTE4SNORLAXNPC1
	const ROUTE4SNORLAXNPC2
	const ROUTE4SNORLAXNPC3
	
Route4Callback:
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	return
	
	
Route4Grave:
	jumptext Route4GraveText
	
Route4GraveText:
	text "Our be oved"
	line "dau hter."
	
	para "H re lies our"
	line "de r, sw  t"
	cont "RE  CCA."
	
	para "…"
	
	para "The letters are"
	line "worn away…"
	done
	
TrainerRoute4_1:	
	generictrainer LASS, JUNE, EVENT_BEAT_ROUTE_4_TRAINER_1, .SeenText, .BeatenText

	text "You weren't looking"
	line "at me?"

	para "Yeah, <WAIT_S>right!"	
	done

.SeenText:
	text "Ew…"
	
	para "Quit staring!"
	done

.BeatenText:
	text "How could you?"
	done
	
TrainerRoute4_2:
	generictrainer FISHER, HOMER, EVENT_BEAT_ROUTE_4_TRAINER_2, .SeenText, .BeatenText

	text "To each their own,"
	line "I suppose."
	done

.SeenText:
	text "I love fishin',<WAIT_S>"
	line "yes I do!"
	
	para "I love fishin',<WAIT_S>"
	line "how 'bout you?"
	done

.BeatenText:
	text "You seem more like"
	line "the battling type."
	done
	
TrainerRoute4_3:
	generictrainer FISHER, HUE, EVENT_BEAT_ROUTE_4_TRAINER_3, .SeenText, .BeatenText

	text "Maybe you DID beat"
	line "RODNEY."
	done

.SeenText:
	text "What's that?"
	
	para "You say you beat"
	line "RODNEY?"
	
	para "There's no way!"
	done

.BeatenText:
	text "Well I'll be!"
	done
	
TrainerRoute4_4:
	generictrainer FISHER, DARREN, EVENT_BEAT_ROUTE_4_TRAINER_4, .SeenText, .BeatenText

	text "That's one fishing"
	line "story I won't be"
	cont "sharing…"
	done

.SeenText:
	text "I knew someone"
	line "would come along"
	cont "looking for a"
	cont "battle."
	
	para "Hook, line, and"
	line "sinker!"
	done

.BeatenText:
	text "I'm fin-<WAIT_S>ished!"
	done
	
Route4NPC5:
	checkevent EVENT_FOUGHT_SNORLAX_ROUTE_4
	iftrue .foughtthatsleepyboi
	jumptextfaceplayer Route4NPC5Text
.foughtthatsleepyboi
	jumptextfaceplayer Route4NPC5Text2
	
Route4NPC7:
	jumptextfaceplayer Route4NPC7Text
	
Route4NPC8:
	jumptextfaceplayer Route4NPC8Text
	
Route4Snorlax:
	checkitem POKE_FLUTE
	iffalse Route4NoFlute
	opentext
	writetext Route4SnorlaxTextHaveFlute
	yesorno
	iffalse Route4DontUseFlute
Route4PlayedFluteForSnorlax::
	spriteface ROUTE4SNORLAXNPC1, RIGHT
	spriteface ROUTE4SNORLAXNPC2, LEFT
	spriteface ROUTE4SNORLAXNPC3, LEFT
	writetext Route4SnorlaxTextUseFlute
	playsound SFX_POKEFLUTE
	waitsfx
	writetext Route4SnorlaxTextWakeUp
	cry SNORLAX
	waitbutton
	closetext
	waitsfx
	loadwildmon SNORLAX, 25
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear ROUTE4SNORLAX1
	disappear ROUTE4SNORLAX2
	disappear ROUTE4SNORLAX3
	disappear ROUTE4SNORLAX4
	setevent EVENT_FOUGHT_SNORLAX_ROUTE_4
	reloadmapafterbattle
	callasm Route4SetupMomSnarePhoneCallASM
	checkcode VAR_MONJUSTCAUGHT
	if_equal SNORLAX, .CaughtSnorlax
	opentext
	writetext Route4SnorlaxTextSnorlaxGone
	waitbutton
	closetext
.CaughtSnorlax
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
Route4DontUseFlute:
	writetext Route4SnorlaxTextDontUseFlute
	waitbutton
	closetext
	end
	
Route4NoFlute:
	opentext
	writetext Route4SnorlaxTextNoFlute
	waitbutton
	closetext
	end
	
Route4SetupMomSnarePhoneCallASM:
	xor a
	ld [wBikeUpgradeSteps], a
	ld a, 150
	ld [wBikeUpgradeSteps + 1], a
	ret
	
BeatSnorlaxRoute4:
	
	
Route4Sign:
	jumptext Route4SignText
	
Route4ForestSign:
	jumptext Route4ForestSignText
	
Route4SignText:
	text "ROUTE 4"
	
	para "WEST:"
	line "STARGLOW VALLEY"
	
	para "EAST:"
	line "EVENTIDE FOREST"
	
	para "SOUTH:"
	line "ROUTE 5"
	done
	
Route4ForestSignText:
	text "EVENTIDE¯FOREST"
	done
	
Route4SnorlaxTextHaveFlute:
	text "A sleeping #MON"
	line "blocks the way!"
	
	para "Play the"
	line "# FLUTE?"
	done
	
Route4SnorlaxTextNoFlute:
	text "A sleeping #MON"
	line "blocks the path."
	done
	
Route4SnorlaxTextWakeUp:
	text "SNORLAX woke up!"
	
	para "It attacked in a"
	line "grumpy rage!"
	done
	
Route4SnorlaxTextDontUseFlute:
	text "Better not wake it"
	line "now…"
	done
	
Route4SnorlaxTextUseFlute:
	text "<PLAYER> played the"
	line "# FLUTE."
	done
	
Route4SnorlaxTextSnorlaxGone:
	text "With a big yawn,"
	line "SNORLAX returned"
	cont "to the mountains!"
	done
	
Route4NPC5Text:
	text "It's always some-"
	line "thing."
	
	para "First that weirdo"
	line "wouldn't let me"
	cont "leave town,"
	
	para "and now a SNORLAX"
	line "decided this was"
	cont "the perfect place"
	cont "to take a nap!"
	
	para "I'm just trying to"
	line "get home…"
	done
	
Route4NPC5Text2:
	text "Finally!"
	
	para "Thank you!"
	
	para "Maybe now I can"
	line "finally get home."
	done
	
Route4NPC7Text:
	text "A flute woke it"
	line "up?"
	
	para "How does that even"
	line "work?"
	done
	
Route4NPC8Text:
	text "I wonder if"
	line "SNORLAX realizes"
	cont "all the trouble"
	cont "it's caused."
	
	para "I can't blame it,"
	line "though."
	
	para "If I was that big"
	line "I'd probably lay"
	cont "around all day,"
	cont "too!"
	done
