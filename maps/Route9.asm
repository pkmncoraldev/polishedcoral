Route9_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 25, 13, 1, DODRIO_RANCH_HOUSE
	warp_def 11, 23, 1, DODRIO_RANCH_BARN

	db 8 ; coord events
	xy_trigger 0, 26, 10, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 27, 10, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 28, 10, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 29, 10, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 1, 26,  9, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 27,  9, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 28,  9, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 29,  9, 0, Route9MapSignThing, 0, 0

	db 10 ; bg events
	signpost 24, 20, SIGNPOST_READ, RanchLogs
	signpost 24, 17, SIGNPOST_READ, RanchLogs
	signpost 23, 16, SIGNPOST_READ, RanchLogs
	signpost 18, 21, SIGNPOST_READ, RanchLogs
	signpost 17, 22, SIGNPOST_READ, RanchLogs
	signpost 17, 23, SIGNPOST_READ, RanchLogs
	signpost 16, 22, SIGNPOST_READ, RanchLogs
	signpost 12, 21, SIGNPOST_READ, RanchLogs
	signpost 26, 16, SIGNPOST_READ, RanchSign
	signpost 25,  4, SIGNPOST_READ, Route9Sign

	db 13 ; object events
	person_event SPRITE_SNES, 15, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchScarecrow, -1
	person_event SPRITE_DODRIO, 20, 11, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDodrio1, -1
	person_event SPRITE_DODRIO, 12, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDodrio2, -1
	person_event SPRITE_DODUO, 17, 12, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	person_event SPRITE_DODUO, 14, 15, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	person_event SPRITE_DODUO, 18, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	person_event SPRITE_DODUO, 22, 19, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	itemball_event  4, 11, CARBOS, 1, EVENT_ROUTE_9_POKE_BALL_1
	itemball_event 22, 18, FULL_RESTORE, 1, EVENT_ROUTE_9_POKE_BALL_2
	person_event SPRITE_BIRD_KEEPER, 18,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, TrainerRanch_1, -1
	person_event SPRITE_BIRD_KEEPER, 13,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRanch_2, -1
	person_event SPRITE_BIRD_KEEPER,  9, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRanch_3, -1
	fruittree_event 24,  4, FRUITTREE_ROUTE_9, ASPEAR_BERRY

Route9MapSignThing::
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $0
	clearevent EVENT_ON_DODRIO_RANCH
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
    end

DodrioRanchMapSignThing::
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $1
	setevent EVENT_ON_DODRIO_RANCH
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
    end
	
Route9Sign:
	jumptext Route9SignText

TrainerRanch_1:
	generictrainer BIRD_KEEPER, TODD, EVENT_BEAT_ROUTE_9_TRAINER_1, .SeenText, .BeatenText

	text "Did I get ripped"
	line "off?"
	done

.SeenText:
	text "This ranch is"
	line "known for its"
	cont "DODUO."
	
	para "I just got one"
	line "myself."
	
	para "Let's test this"
	line "little guy out!"
	done

.BeatenText:
	text "Cripes!"
	done
	
TrainerRanch_2:
	generictrainer BIRD_KEEPER, BRYANT, EVENT_BEAT_ROUTE_9_TRAINER_2, .SeenText, .BeatenText

	text "I got blown over…"
	done

.SeenText:
	text "A TRAINER!"
	
	para "Think you can"
	line "withstand the"
	cont "wind?"
	done

.BeatenText:
	text "What a blow out!"
	done
	
TrainerRanch_3:
	generictrainer BIRD_KEEPER, RANDY, EVENT_BEAT_ROUTE_9_TRAINER_3, .SeenText, .BeatenText

	text "I'm a disgrace to"
	line "my whole lineage…"
	done

.SeenText:
	text "I'm a bird #MON"
	line "TRAINER."
	
	para "My father was a"
	line "bird TRAINER."
	
	para "His father was a"
	line "bird TRAINER."
	done

.BeatenText:
	text "FATHER!"
	done
	
RanchScarecrow:	
	jumptext RanchScarecrowText
	
RanchLogs:
	jumptext RanchLogsText
	
RanchSign:
	jumptext RanchSignText
	
RanchDodrio1:
	opentext
	writetext RanchDodrioText1
	cry DODRIO
	buttonsound
	writetext RanchDodrioText2
	waitbutton
	closetext
	end
	
RanchDodrio2:
	opentext
	writetext RanchDodrioText1
	cry DODRIO
	waitbutton
	closetext
	end
	
RanchDoduo:
	opentext
	writetext RanchDoduoText
	cry DODUO
	waitbutton
	closetext
	end
	
Route9SignText:
	text "ROUTE 9"
	
	para "NORTH: FLICKER"
	line "STATION"
	
	para "EAST: DODRIO"
	line "RANCH"
	
	para "WEST: EVENTIDE"
	line "FOREST"
	done
		
RanchDodrioRideText:
	text "Ride DODRIO?"
	done
	
RanchDodrioText1:
	text "DODRIO: DRRREEEO!"
	done
	
RanchDodrioText2:
	text "DODRIO stomps its"
	line "foot impatiently."
	done
	
RanchDoduoText:
	text "DODUO: DEWO! DEWO!"
	done
	
RanchScarecrowText:
	text "It's a SCARE-"
	line "MURKROW."
	
	para "So life-like…"
	done
	
RanchLogsText:
	text "Some logs are"
	line "stacked neatly."
	done
	
RanchSignText:
	text "World-famous"
	line "DODRIO RANCH!"
	done
