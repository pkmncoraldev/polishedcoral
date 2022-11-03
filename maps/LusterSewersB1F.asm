LusterSewersB1F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script LusterSewersB1FTrigger0
	scene_script LusterSewersB1FTrigger1
	scene_script LusterSewersB1FTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSewersB1FChangeBlocks

	db 5 ; warp events
	warp_def  3,  8, 1, LUSTER_CITY_RESIDENTIAL
	warp_def 19,  3, 1, LUSTER_SEWERS_VALVE_ROOM
	warp_def  3, 25, 1, LUSTER_SEWERS_B2F
	warp_def  1, 29, 5, LUSTER_SEWERS_VALVE_ROOM
	warp_def 11, 27, 3, LUSTER_SEWERS_B2F
	
	db 6 ; coord events
	xy_trigger 0,  4,  5, 0, LusterSewersB1FUnderBridge, 0, 0
	xy_trigger 0, 18, 11, 0, LusterSewersB1FUnderBridge, 0, 0
	xy_trigger 0,  6, 25, 0, LusterSewersB1FUnderBridge, 0, 0
	xy_trigger 1,  3,  5, 0, LusterSewersB1FOverBridge, 0, 0
	xy_trigger 1, 17, 11, 0, LusterSewersB1FOverBridge, 0, 0
	xy_trigger 1,  5, 25, 0, LusterSewersB1FOverBridge, 0, 0

	db 0 ; bg events

	db 12 ; object events
	person_event SPRITE_PLANK_BRIDGE, 14, 17, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 17, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE, 15, 17, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_PLANK_BRIDGE_2,  4, 26, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE_2,  4, 27, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_EMPTY
	person_event SPRITE_PLANK_BRIDGE_2,  5, 26, SPRITEMOVEDATA_TILE_DOWN, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_PLANK_BRIDGE_2,  5, 27, SPRITEMOVEDATA_TILE_UP, 2, 2, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, EVENT_LUSTER_SEWERS_FLOODED
	person_event SPRITE_DELINQUENT_M,  9,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerLusterSewersB1F_1,  EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_F, 21, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, TrainerLusterSewersB1F_2,  EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_M, 18, 25, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerLusterSewersB1F_3,  EVENT_CLEARED_LUSTER_SEWERS
	person_event SPRITE_DELINQUENT_M, 11, 28, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerLusterSewersB1F_4,  EVENT_CLEARED_LUSTER_SEWERS
	itemball_event 25, 19, POTION, 1, EVENT_LUSTER_SEWERS_B1F_POKEBALL
	
TrainerLusterSewersB1F_1:
	generictrainer BUNEARY_M, BOY_1, EVENT_BEAT_LUSTER_SEWERS_B1F_TRAINER_1, .SeenText, .BeatenText

	text "You ARE with"
	line "“THE NIDOKINGS”,"
	cont "aren't you?"
	done

.SeenText:
	text "Who the heck are"
	line "you?"
	
	para "This is “BUNEARY”"
	line "turf now!"	
	done

.BeatenText:
	text "You darn"
	line "“NIDOKINGS”…"
	done
	
TrainerLusterSewersB1F_2:
	generictrainer BUNEARY_F, GAL_1, EVENT_BEAT_LUSTER_SEWERS_B1F_TRAINER_2, .SeenText, .BeatenText

	text "Don't get it wrong!"
	
	para "These sewers are"
	line "still ours!"
	done

.SeenText:
	text "You can't be down"
	line "here!"
	
	para "FRANKIE says WE"
	line "own these sewers!"	
	done

.BeatenText:
	text "You better watch"
	line "yourself down"
	cont "here!"
	done
	
TrainerLusterSewersB1F_3:
	generictrainer BUNEARY_M, BOY_2, EVENT_BEAT_LUSTER_SEWERS_B1F_TRAINER_3, .SeenText, .BeatenText

	text "Just because we"
	line "stole all of it"
	cont "doesn't mean you"
	cont "can steal it back!"
	done

.SeenText:
	text "Everything here"
	line "is property of the"
	cont "“BUNEARY BOYS”."
	
	para "Don't even think"
	line "about touching"
	cont "anything!"
	done

.BeatenText:
	text "Man, whatever…"
	done
	
TrainerLusterSewersB1F_4:
	generictrainer BUNEARY_M, BOY_3, EVENT_BEAT_LUSTER_SEWERS_B1F_TRAINER_4, .SeenText, .BeatenText

	text "There ain't"
	line "nothin' over here!"
	
	para "You may as well"
	line "just head back"
	cont "the way you came!"
	done

.SeenText:
	text "How did you get"
	line "over here?"
	
	para "There ain't"
	line "nothin' over here!"
	done

.BeatenText:
	text "I'm telling ya…"
	done
	
LusterSewersB1FTrigger0:
	end
	
LusterSewersB1FTrigger1:
	end
	
LusterSewersB1FTrigger2:
	end
	
LusterSewersB1FChangeBlocks:
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	checkevent EVENT_LUSTER_SEWERS_EMPTY
	iffalse .endcallback
	changemap LusterSewersB1FEmpty_BlockData
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
	changeblock $6, $6, $40
	changeblock $6, $8, $44
	changeblock $c, $12, $40
	changeblock $c, $14, $44
	return
	
LusterSewersB1FUnderBridge:
	special Special_StopLandmarkTimer
	changeblock $6, $6, $40
	changeblock $6, $8, $44
	changeblock $c, $12, $40
	changeblock $c, $14, $44
	callasm GenericFinishBridge
	dotrigger $1
	end
	
LusterSewersB1FOverBridge:
	changeblock $6, $6, $1f
	changeblock $6, $8, $1e
	changeblock $c, $12, $1f
	changeblock $c, $14, $1e
	callasm GenericFinishBridge
	dotrigger $0
	end