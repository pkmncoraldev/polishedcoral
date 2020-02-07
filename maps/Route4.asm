Route4_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 6, 39, 1, ROUTE_4_EVENTIDE_GATE
	warp_def 7, 39, 2, ROUTE_4_EVENTIDE_GATE

	db 0 ; coord events

	db 2 ; bg events
	signpost 7, 2, SIGNPOST_READ, Route4Sign
	signpost 5, 38, SIGNPOST_READ, Route4ForestSign

	db 9 ; object events
	person_event SPRITE_LASS, 7, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute4_1, -1
	person_event SPRITE_FISHER, 11, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute4_2, -1
	person_event SPRITE_FISHER, 16, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute4_3, -1
	person_event SPRITE_FISHER, 16, 15, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 0, TrainerRoute4_4, -1
	person_event SPRITE_BIG_SNORLAX, 10, 20, SPRITEMOVEDATA_SNORLAX, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route4Snorlax, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_LASS, 10, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route4NPC5, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_YOUNGSTER, 10, 24, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route4NPC7, EVENT_FOUGHT_SNORLAX_ROUTE_4
	person_event SPRITE_POKEFAN_M, 11, 23, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route4NPC8, EVENT_FOUGHT_SNORLAX_ROUTE_4
	fruittree_event 16,  8, FRUITTREE_ROUTE_4, CHERI_BERRY

	const_def 1 ; object constants
	const ROUTE4LASS
	const ROUTE4FISHER1
	const ROUTE4FISHER2
	const ROUTE4FISHER3
	const ROUTE4SNORLAX
	const ROUTE4SNORLAXNPC1
	const ROUTE4SNORLAXNPC2
	const ROUTE4SNORLAXNPC3
	
TrainerRoute4_1:	
	generictrainer LASS, JUNE, EVENT_BEAT_ROUTE_4_TRAINER_1, .SeenText, .BeatenText

	text "You weren't looking"
	line "at me?"

	para "Yeah, right!"	
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
	text "I love fishin',"
	line "yes I do!"
	
	para "I love fishin',"
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
	text "I'm fin-ished!"
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
	iffalse noflute
	opentext
	writetext Route4SnorlaxTextHaveFlute
	yesorno
	iffalse dontuseflute
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
	loadwildmon SNORLAX, 30
	startbattle
	if_equal $2, DidntBeatSnorlaxRoute4
	disappear ROUTE4SNORLAX
	reloadmapafterbattle
	opentext
	writetext Route4SnorlaxTextSnorlaxGone
	waitbutton
	closetext
	setevent EVENT_FOUGHT_SNORLAX_ROUTE_4
	end
	
dontuseflute:
	writetext Route4SnorlaxTextDontUseFlute
	waitbutton
	closetext
	end
	
noflute:
	opentext
	writetext Route4SnorlaxTextNoFlute
	waitbutton
	closetext
	end
	
DidntBeatSnorlaxRoute4:
	reloadmapafterbattle
	opentext
	writetext Route4SnorlaxTextRanAway
	waitbutton
	closetext
	end
	
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
	text "SNORLAX is no"
	line "longer blocking"
	cont "the path!"
	done
	
Route4SnorlaxTextRanAway:
	text "SNORLAX still"
	line "blocks the path."
	done
	
Route4NPC5Text:
	text "It's always some-"
	line "thing."
	
	para "First that weirdo"
	line "wouldn't let me"
	cont "leave town,"
	
	para "and now a SNORLAX"
	line "decided this would"
	cont "be the perfect"
	cont "place to take a"
	cont "nap."
	
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
	
	para "If I was as big"
	line "as it,"
	
	para "I'd probably lay"
	line "around all day,"
	cont "too!"
	done
