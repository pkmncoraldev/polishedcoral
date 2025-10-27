Route9_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route9Callback

	db 5 ; warp events
	warp_def 23, 21, 1, DODRIO_RANCH_HOUSE
	warp_def 11, 30, 1, DODRIO_RANCH_BARN
	warp_def 11, 31, 2, DODRIO_RANCH_BARN
	warp_def 75, 19, 1, ROUTE_11_GATE
	warp_def 75, 20, 2, ROUTE_11_GATE

	db 27 ; coord events
	xy_trigger 0, 24, 18, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 25, 18, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 26, 18, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 27, 18, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 24, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 25, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 26, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 27, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0,  9, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0,  9, 24, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0,  9, 25, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 16, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0,  9, 23, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0,  9, 22, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0,  9, 20, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 19, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 20, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 21, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 0, 22, 19, 0, DodrioRanchMapSignThing, 0, 0
	xy_trigger 1, 24, 17, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 25, 17, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 26, 17, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 27, 17, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 24, 16, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 25, 16, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 26, 16, 0, Route9MapSignThing, 0, 0
	xy_trigger 1, 27, 16, 0, Route9MapSignThing, 0, 0

	db 10 ; bg events
	signpost 22, 25, SIGNPOST_READ, RanchLogs
	signpost 21, 24, SIGNPOST_READ, RanchLogs
	signpost 16, 29, SIGNPOST_READ, RanchLogs
	signpost 15, 30, SIGNPOST_READ, RanchLogs
	signpost 15, 31, SIGNPOST_READ, RanchLogs
	signpost 14, 30, SIGNPOST_READ, RanchLogs
	signpost 24, 20, SIGNPOST_READ, RanchSign
	signpost 46, 12, SIGNPOST_READ, Route9Sign
	signpost 33,  8, SIGNPOST_READ, Route9Sign2
	bg_event 17, 29, SIGNPOST_ITEM + FIRE_STONE, EVENT_ROUTE_9_HIDDEN_FIRE_STONE

	db 20 ; object events
	person_event SPRITE_N64, 11, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchScarecrow, -1
	object_event 26, 19, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, -1, (1 << 3) | PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchDodrio1, -1
	object_event 26, 10, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODRIO, -1, -1, (1 << 3) | PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchDodrio2, -1
	object_event 20, 15, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, (1 << 3) | PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	object_event 27, 16, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, DODUO, -1, -1, (1 << 3) | PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	itemball_event 32,  2, CARBOS, 1, EVENT_ROUTE_9_POKE_BALL_1
	itemball_event 30, 16, FULL_RESTORE, 1, EVENT_ROUTE_9_POKE_BALL_2
	person_event SPRITE_BIRD_KEEPER, 39, 15, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, TrainerRanch_1, -1
	person_event SPRITE_BIRD_KEEPER, 32,  3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerRanch_2, -1
	person_event SPRITE_BEAUTY, 16, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, TrainerRanch_3, -1
	person_event SPRITE_BUG_CATCHER, 10, 13, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 5, TrainerRanch_4, -1
	person_event SPRITE_BIRD_KEEPER,  7, 21, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerRanch_5, -1
	person_event SPRITE_BEAUTY, 68, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerRanch_6, -1
	person_event SPRITE_BURGLAR, 69, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerRanch_7, -1
	object_event 19, 52, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 17, 50, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MILTANK, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	fruittree_event 11, 55, FRUITTREE_ROUTE_9, ASPEAR_BERRY
	tapeball_event  7, 67, MUSIC_HARDCORE_ENCOUNTER, 2, EVENT_MUSIC_HARDCORE_ENCOUNTER
	person_event SPRITE_FAT_GUY, 59, 14, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route9NPC1, -1
	person_event SPRITE_PONYTAIL, 47, 10, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route9NPC2, -1


Route9Trigger0:
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<DUSK
	iffalse .end
	changeblock $1e, $a, $24
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm Route9StreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock $1e, $a, $15
	clearflag ENGINE_STREETLIGHTS
	clearflag ENGINE_STREETLIGHTS2
	callasm GenericFinishBridge
	callasm Route9StreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end

Route9Callback:
	checktime 1<<DUSK
	iftrue .nite
	checktime 1<<NITE
	iffalse .notnite
.nite
	changeblock $1e, $a, $24
	setflag ENGINE_STREETLIGHTS
.notnite
	return

Route9StreetlightPaletteUpdateThingMoreWordsExtraLongStyle:
	farcall CheckCurrentMapXYTriggers
	ret nc
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapScriptHeaderBank]
	farjp CallScript

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
	
Route9NPC1:
	jumptextfaceplayer Route9NPC1Text
	
Route9NPC1Text:
	text "If your #MON"
	line "knows HEADBUTT,"
	cont "try having them"
	cont "use it on a tree."
	
	para "A #MON might"
	line "fall from it!"
	
	para "Any old tree will"
	line "do, even really"
	cont "big ones."
	done
	
Route9NPC2:
	jumptextfaceplayer Route9NPC2Text
	
Route9NPC2Text:
	text "I guess I can't"
	line "head to the SOUTH."
	
	para "There's some kind"
	line "of roadblock."
	
	para "NORTH it is, then!"
	done
	
Route9Sign:
	jumptext Route9SignText
	
Route9Sign2:
	jumptext Route9Sign2Text

TrainerRanch_1:
	generictrainer BIRD_KEEPER, TODD, EVENT_BEAT_ROUTE_9_TRAINER_1, .SeenText, .BeatenText

	text "Did I get ripped"
	line "off?"
	done

.SeenText:
	text "I just got myself"
	line "a DODUO from the"
	cont "DODRIO RANCH!"
	
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
	generictrainer BEAUTY, SANDRA, EVENT_BEAT_ROUTE_9_TRAINER_3, .SeenText, .BeatenText

	text "I just wanna go"
	line "hooome…"
	done

.SeenText:
	text "Ugh!"
	
	para "This ranch is so"
	line "smelly…"
	
	para "My feet hurt…"
	
	para "It's too hot…"
	done

.BeatenText:
	text "And now I even"
	line "lost a battle?"
	done
	
TrainerRanch_4:
	generictrainer BUG_CATCHER, DANNY, EVENT_BEAT_ROUTE_9_TRAINER_4, .SeenText, .BeatenText

	text "What a bad place"
	line "for a BUG CATCHER"
	cont "to train…"
	done

.SeenText:
	text "This place is"
	line "dangerous for"
	cont "BUG-type #MON!"
	
	para "I've gotta watch my"
	line "back!"
	done

.BeatenText:
	text "AAAAH!"
	
	line "My #MON!"
	done
	
TrainerRanch_5:
	generictrainer BIRD_KEEPER, RANDY, EVENT_BEAT_ROUTE_9_TRAINER_5, .SeenText, .BeatenText

	text "I'm a disgrace to"
	line "my whole lineage…"
	done

.SeenText:
	text "I'm a bird #MON"
	line "TRAINER."
	
	para "My father was a"
	line "bird TRAINER."
	
	para "HIS father was a"
	line "bird TRAINER."
	done

.BeatenText:
	text "FATHER!"
	done
	
TrainerRanch_6:
	generictrainer BEAUTY, HARMONY, EVENT_BEAT_ROUTE_9_TRAINER_6, .SeenText, .BeatenText

	text "We all float into"
	line "and out of others'"
	cont "lives like a bal-"
	cont "loon in the wind."
	done

.SeenText:
	text "You floated right"
	line "into my sight."
	
	para "Now it's time to"
	line "fight!"
	done

.BeatenText:
	text "POP!"
	done
	
TrainerRanch_7:
	generictrainer BURGLAR, SHEM, EVENT_BEAT_ROUTE_9_TRAINER_7, .SeenText, .BeatenText

	text "I ripped this"
	line "DODUO off for"
	cont "nothing!"
	done

.SeenText:
	text "I nabbed this lil"
	line "guy from that farm"
	cont "up there."
	
	para "Made a clean"
	line "getaway!"
	done

.BeatenText:
	text "What a waste of"
	line "time!"
	done
	
RanchScarecrow:	
	jumptext RanchScarecrowText
	
RanchLogs:
	jumptext RanchLogsText
	
RanchHay:
	jumptext RanchHayText
	
RanchSign:
	jumptext RanchSignText
	
RanchDodrio1:
	opentext TEXTBOX_POKEMON, DODRIO
	writetext RanchDodrioText1
	cry DODRIO
	buttonsound
	changetextboxspeaker
	writetext RanchDodrioText2
	waitbutton
	closetext
	end
	
RanchDodrio2:
	opentext TEXTBOX_POKEMON, DODRIO
	writetext RanchDodrioText1
	cry DODRIO
	waitbutton
	closetext
	end
	
RanchDoduo:
	opentext TEXTBOX_POKEMON, DODUO
	writetext RanchDoduoText
	cry DODUO
	waitbutton
	closetext
	end
	
Route9SignText:
	text "ROUTE 9"
	
	para "NORTH: FLICKER"
	line "STATION"
	
	para "SOUTH: ROUTE 12"
	
	para "WEST: EVENTIDE"
	line "VILLAGE"
	done
	
Route9Sign2Text:
	text "DODRIO RANCH"
	line "ahead."
	done
	
RanchDodrioText1:
	text "DRRREEEO!"
	done
	
RanchDodrioText2:
	text "DODRIO stomps its"
	line "foot impatiently."
	done
	
RanchDoduoText:
	text "DEWO! <WAIT_S>DEWO!"
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
	
RanchHayText:
	text "Big, fluffy"
	line "haystacks."
	
	para "Not a needle"
	line "in site!"
	done
	
RanchSignText:
	text "World-famous"
	line "DODRIO RANCH!"
	done
