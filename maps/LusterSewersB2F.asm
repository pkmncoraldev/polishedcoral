LusterSewersB2F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersB2FTrigger0
	scene_script LusterSewersB2FTrigger1
	scene_script LusterSewersB2FTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSewersB2FChangeBlocks

	db 5 ; warp events
	warp_def  7, 14, 3, LUSTER_SEWERS_B1F
	warp_def  1, 15, 3, LUSTER_SEWERS_VALVE_ROOM
	warp_def 15, 16, 5, LUSTER_SEWERS_B1F
	warp_def 13,  9, 1, LUSTER_SEWERS_THRONE_ROOM
	warp_def 13,  1, 1, LUSTER_SEWERS_MUK_ROOM
	

	db 8 ; coord events
	xy_trigger 0,  5, 13, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 13, 17, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 11, 29, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 0, 17,  9, 0, LusterSewersB2FUnderBridge, 0, 0
	xy_trigger 1,  3, 13, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 11, 17, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1,  9, 29, 0, LusterSewersB2FOverBridge, 0, 0
	xy_trigger 1, 15,  9, 0, LusterSewersB2FOverBridge, 0, 0

	db 0 ; bg events

	db 9 ; object events
	person_event SPRITE_PLANK_BRIDGE,  4, 15, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5, 15, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE,  5, 15, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_DELINQUENT_M, 11, 16, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerLusterSewersB2F_1,  EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_F, 20, 19, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerLusterSewersB2F_2,  EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_M,  8, 26, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerLusterSewersB2F_3,  EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_BURGLAR, 17,  1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSewerShadyGuy1, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_BURGLAR, 15,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LusterSewerShadyGuy2, EVENT_LUSTER_SEWERS_EMPTY
	itemball_event 21, 14, ESCAPE_ROPE, 1, EVENT_LUSTER_SEWERS_B2F_POKEBALL

	
LusterSewersB2FTrigger0:
	end
	
LusterSewersB2FTrigger1:
	end
	
LusterSewersB2FTrigger2:
	end
	
LusterSewerShadyGuy1:
	jumptextfaceplayer LusterSewerShadyGuyText1
	
LusterSewerShadyGuy2:
	jumptextfaceplayer LusterSewerShadyGuyText2
	
TrainerLusterSewersB2F_1:
	generictrainer BUNEARY_M, BOY_4, EVENT_BEAT_LUSTER_SEWERS_B2F_TRAINER_1, .SeenText, .BeatenText

	text "Cut it out!"
	
	para "Someone could get"
	line "hurt!"
	done

.SeenText:
	text "Someone keeps"
	line "raising and lower-"
	cont "ing the water"
	cont "level!"
	
	para "Is that you?"	
	done

.BeatenText:
	text "It IS you, isn't"
	line "it?"
	done
	
TrainerLusterSewersB2F_2:
	generictrainer BUNEARY_F, GAL_2, EVENT_BEAT_LUSTER_SEWERS_B2F_TRAINER_2, .SeenText, .BeatenText

	text "Yeah, yeah…"
	
	para "You win."
	
	para "Whatever…"
	done

.SeenText:
	text "Thought you could"
	line "sneak by me?"
	
	para "Guess again!"
	done

.BeatenText:
	text "Thought I would"
	line "win?"
	
	para "Guess again!"
	done
	
TrainerLusterSewersB2F_3:
	generictrainer BUNEARY_M, BOY_5, EVENT_BEAT_LUSTER_SEWERS_B2F_TRAINER_3, .SeenText, .BeatenText

	text "This ain't good for"
	line "me at all!"
	done

.SeenText:
	text "You're gettin' too"
	line "close to FRANKIE!"
	
	para "If you make it,"
	line "I'm the one who"
	cont "gets in trouble!"
	done

.BeatenText:
	text "Wait, kid!"
	
	para "Please!"
	done
	
LusterSewersB2FChangeBlocks:
	checkevent EVENT_LUSTER_SEWERS_MUK_ROOM_MUK
	iftrue .skip
	clearevent EVENT_LUSTER_SEWERS_GRIMER_1
	clearevent EVENT_LUSTER_SEWERS_GRIMER_2
	clearevent EVENT_LUSTER_SEWERS_GRIMER_3
	clearevent EVENT_LUSTER_SEWERS_GRIMER_4
	clearevent EVENT_LUSTER_SEWERS_MUK_RIGHT
	setevent EVENT_PLAYER_CUTSCENE_SILVER
.skip
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iffalse .endcallback
	changemap LusterSewersB2FEmpty_BlockData
	checkscene
	ifequal $0, .end
	ifequal $1, .changeblocks
	dotrigger $0
.end
	return
.endcallback
	dotrigger $2
	return
.changeblocks
	changeblock $12, $10, $40
	changeblock $12, $12, $44
	changeblock $18, $10, $40
	changeblock $18, $12, $44
	return
	
LusterSewersB2FUnderBridge:
	changeblock $12, $10, $40
	changeblock $12, $12, $44
	changeblock $18, $10, $40
	changeblock $18, $12, $44
	callasm GenericFinishBridge
	dotrigger $1
	end
	
LusterSewersB2FOverBridge:
	changeblock $12, $10, $1f
	changeblock $12, $12, $1e
	changeblock $18, $10, $1f
	changeblock $18, $12, $1e
	callasm GenericFinishBridge
	dotrigger $0
	end
	
LusterSewerShadyGuyText1:
	text "There's gotta be"
	line "something cool"
	cont "stashed up there!"
	
	para "I just can't reach!"
	done
	
LusterSewerShadyGuyText2:
	text "I was down there"
	line "when water just"
	cont "started flooding"
	cont "in!"
	
	para "I could have been"
	line "killed!"
	done
	