Route27_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route27Callback

	db 2 ; warp events
	warp_event 41, 33, ROUTE_25_GATE, 1
	warp_event 42, 33, ROUTE_25_GATE, 2

	db 4 ; coord events
	xy_trigger 0, 12,  6, 0, Route27MapSignThing, 0, 0
	xy_trigger 0, 12,  7, 0, Route27MapSignThing, 0, 0
	xy_trigger 1, 11,  6, 0, Route25MapSignThing, 0, 0
	xy_trigger 1, 11,  7, 0, Route25MapSignThing, 0, 0

	db 19 ; bg events
	signpost 12, 10, SIGNPOST_READ, Route27Sign
	signpost 17, 20, SIGNPOST_READ, Route27Beams
	signpost 17, 21, SIGNPOST_READ, Route27Beams
	signpost 22, 19, SIGNPOST_READ, Route27Beams
	signpost 23, 32, SIGNPOST_READ, Route27Beams
	signpost 23, 33, SIGNPOST_READ, Route27Beams
	signpost 28, 33, SIGNPOST_READ, Route27Beams
	signpost 28, 35, SIGNPOST_READ, Route27Beams
	signpost 19, 48, SIGNPOST_READ, Route27Beams
	signpost 19, 49, SIGNPOST_READ, Route27Beams
	signpost 24, 47, SIGNPOST_READ, Route27Beams
	signpost 24, 49, SIGNPOST_READ, Route27Beams
	signpost 18, 17, SIGNPOST_READ, Route27Pipes
	signpost 19, 17, SIGNPOST_READ, Route27Pipes
	signpost 22, 45, SIGNPOST_READ, Route27Pipes
	signpost 23, 45, SIGNPOST_READ, Route27Pipes
	signpost 30, 43, SIGNPOST_READ, Route27BrightburgSign
	signpost  8, -1, SIGNPOST_IFNOTSET, Route27Tree
	signpost  9, -1, SIGNPOST_IFNOTSET, Route27Tree

	db 15 ; object events
	person_event SPRITE_COOLTRAINER_M,  9,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 5, TrainerRoute27_1, -1
	person_event SPRITE_SKATER, 22, 26, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute27_2, -1
	person_event SPRITE_OFFICER, 23, 41, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerRoute27_3, -1
	person_event SPRITE_TWIN, 20, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute27_4, -1
	person_event SPRITE_TWIN, 20, 36, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute27_5, -1
	person_event SPRITE_POKEMANIAC, 26, 21, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route27NPC1, -1
	itemball_event 20, 22, FULL_RESTORE, 1, EVENT_ROUTE_27_POKE_BALL_1
	tapeball_event 50, 19, MUSIC_AUTUMN, 1, EVENT_MUSIC_AUTUMN
	person_event SPRITE_LEILANI_CHAIR_2, 23, 17, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 22, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_LEILANI_CHAIR_2, 25, 45, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightCondosSign, -1
	person_event SPRITE_MISC_CONE, 18, 13, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MISC_CONE, 26, 27, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MISC_CONE, 24, 39, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MISC_CONE, 26, 47, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


Route27Callback:
	checkevent EVENT_ROUTE_26_TREE
	iffalse .skip
	changeblock -$02, $08, $bb
.skip
	checkevent EVENT_SET_ROUTE_27
	iftrue .set
	clearevent EVENT_ON_ROUTE_27
	return
.set
	setevent EVENT_ON_ROUTE_27
	return

Route25MapSignThing::
	clearevent EVENT_ON_ROUTE_27
	clearevent EVENT_SET_ROUTE_27
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	dotrigger $0
	end

Route27MapSignThing::
	setevent EVENT_ON_ROUTE_27
	setevent EVENT_SET_ROUTE_27
	loadvar wEnteredMapFromContinue, 0
	callasm ReturnFromMapSetupScript
	dotrigger $1
	end

Route27Tree:
	dw EVENT_ROUTE_26_TREE
	strengthtree
	iffalse .end
	changeblock -$02, $08, $bb
	callasm GenericFinishBridge
	pause 40
	callasm LoadMapPals
	special FadeInPalettes
	pause 10
	setevent EVENT_ROUTE_26_TREE
.end
	end

Route27NPC1:
	jumptextfaceplayer Route27NPC1Text
	
Route27NPC1Text:
	text "There's a little"
	line "town ahead called"
	cont "BRIGHTBURG."
	
	para "They were planning"
	line "an urban expansion"
	cont "project, but it"
	cont "was cancelled."
	
	para "No one in town"
	line "will tell me why…"
	done

TrainerRoute27_1:
	generictrainer COOLTRAINERM, TREY, EVENT_BEAT_ROUTE_27_TRAINER_1, .SeenText, .BeatenText

	text "I guess you got"
	line "me beat, huh?"
	done

.SeenText:
	text "You look tough."
	
	para "Not as much as me,"
	line "though."
	
	para "Let me show you!"
	done

.BeatenText:
	text "Wait, what?"
	done
	
TrainerRoute27_2:
	generictrainer SKATER, BOB, EVENT_BEAT_ROUTE_27_TRAINER_2, .SeenText, .BeatenText

	text "I wonder why they"
	line "abandoned this"
	cont "place anyway…"
	done

.SeenText:
	text "An abandoned"
	line "construction site"
	cont "is a great place"
	cont "to skate!"
	done

.BeatenText:
	text "You got me."
	done
	
TrainerRoute27_3:
	generictrainer OFFICER, JOHNSON, EVENT_BEAT_ROUTE_27_TRAINER_3, .SeenText, .BeatenText

	text "My job is to keep"
	line "hooligans like you"
	cont "from loitering,"
	cont "so move along!"
	done

.SeenText:
	text "Are you"
	line "trespassing?"
	
	para "Are you causing"
	line "trouble?"
	done

.BeatenText:
	text "Carry on then."
	done
	
TrainerRoute27_4:
	generictrainer TWINS, LIZLES, EVENT_BEAT_ROUTE_27_TRAINER_4, .SeenText, .BeatenText

	text "I love playing"
	line "#MON battle!"
	
	para "Too bad LES is"
	line "such a spoilsport."
	done

.SeenText:
	text "LIZ: Yippee!"
	line "Battle time, LES!"
	
	para "LES: Whatever…"
	done

.BeatenText:
	text "LIZ: That was"
	line "fun!"
	
	para "LES: Whatever…"
	done
	
TrainerRoute27_5:
	generictrainer TWINS, LESLIZ, EVENT_BEAT_ROUTE_27_TRAINER_4, .SeenText, .BeatenText

	text "Whatever…"
	done

.SeenText:
	text "LES: Whatever…"
	
	para "LIZ: Yippee!"
	line "Battle time, LES!"
	done

.BeatenText:
	text "LES: Whatever…"
	
	para "LIZ: That was"
	line "fun!"
	done

Route27Beams:
	jumptext Route27BeamsText
	
Route27BeamsText:
	text "A stack of steel"
	line "support beams."
	done
	
Route27Pipes:
	jumptext Route27PipesText
	
Route27PipesText:
	text "Copper pipes."
	done

Route27Sign:
	jumptext Route27SignText
	
Route27SignText:
	text "ROUTE 27"
	
	para "NORTH:"
	line "ROUTE 25"
	
	para "WEST:"
	line "ROUTE 26"
	
	para "SOUTHEAST:"
	line "BRIGHTBURG"
	done

Route27BrightburgSign:
	jumptext Route27BrightburgSignText

Route27BrightburgSignText:
	text "ROUTE 27"
	
	para "SOUTH:"
	line "BRIGHTBURG"
	done

BrightCondosSign:
	jumptext BrightCondosSignText
	
BrightCondosSignText:
	text "Coming soon:"
	line "BRIGHTBURG CONDOS"
	
	para "A big red “X”"
	line "covers the sign."
	done
	