EventideForest_MapScriptHeader:
	db 3 ; scene scripts
	scene_script EventideForestTrigger0
	scene_script EventideForestTrigger1
	scene_script EventideForestTrigger2

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 44, 6, 3, ROUTE_4_EVENTIDE_GATE
	warp_def 45, 6, 4, ROUTE_4_EVENTIDE_GATE
	warp_def 8, 53, 1, EVENTIDE_VILLAGE_GATE
	warp_def 9, 53, 2, EVENTIDE_VILLAGE_GATE

	db 11 ; coord events
	xy_trigger 0, 15, 28, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 15, 29, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 15, 30, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 15, 31, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 15, 32, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 15, 33, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 9, 14, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 0, 9, 15, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 1, 9, 14, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 1, 9, 15, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 0, 7, 34, 0, ForestGhostGirlTrigger, 0, 0

	db 2 ; bg events
	signpost 43, 8, SIGNPOST_READ, EventideForestSign
	signpost  7, 51, SIGNPOST_READ, EventideForestSign2

	db 12 ; object events
	person_event SPRITE_TWIN, 11, 30, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FOREST_GHOST_GIRL_GONE
	person_event SPRITE_TWIN, 5, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FOREST_GHOST_GIRL_GONE2
	person_event SPRITE_YOUNGSTER, 37, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_1, -1
	person_event SPRITE_LASS, 30, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_2, -1
	person_event SPRITE_POKEFAN_M, 28, 28, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerEventide_3, -1
	person_event SPRITE_POKEFAN_F, 2, 39, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_4, -1
	person_event SPRITE_POKEFAN_M, 20, 35, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_5, -1
	itemball_event 35, 26, SUPER_REPEL, 1, EVENT_FOREST_POKE_BALL_1
	itemball_event 20, 26, SUPER_POTION, 1, EVENT_FOREST_POKE_BALL_2
	fruittree_event 32, 14, FRUITTREE_EVENTIDE_FOREST, PECHA_BERRY
	cuttree_event 21, 20, EVENT_EVENTIDE_FOREST_CUT_TREE_1
	cuttree_event 15, 15, EVENT_EVENTIDE_FOREST_CUT_TREE_2

	const_def 1 ; object constants
	const FORESTGHOSTGIRL
	const FORESTGHOSTGIRL2
	
EventideForestTrigger0:
	end
	
EventideForestTrigger1:
	end
	
EventideForestTrigger2:
	end
	
EventideForestSign:
	jumptext EventideForestSignText
	
EventideForestSign2:
	jumptext EventideForestSign2Text
	
TrainerEventide_1:
	generictrainer YOUNGSTER, TOMMY, EVENT_BEAT_EVENTIDE_TRAINER_1, .SeenText, .BeatenText

	text "I-I'm not afraid of"
	line "the dark or any-"
	cont "thing."
	
	para "Honest!"
	done

.SeenText:
	text "AH!"
	
	para "You scared me!"
	done

.BeatenText:
	text "Eeep!"
	done
	
TrainerEventide_2:
	generictrainer LASS, MARSHA, EVENT_BEAT_EVENTIDE_TRAINER_2, .SeenText, .BeatenText

	text "I saw a weird"
	line "house up NORTH,"
	
	para "but I feel like"
	line "I've been walking"
	cont "around these woods"
	cont "for hours."
	done

.SeenText:
	text "Oh no!"
	
	para "I think I'm lost!"
	
	para "What'll I do if I"
	line "can't find my way"
	cont "out?"
	done

.BeatenText:
	text "Lost. Lost."
	line "Lost."
	done
	
TrainerEventide_3:
	generictrainer POKEFANM, SID, EVENT_BEAT_EVENTIDE_TRAINER_3, .SeenText, .BeatenText

	text "People often drop"
	line "things in the dark"
	cont "around here."
	
	para "That just means"
	line "free stuff for"
	cont "people like me!"
	done

.SeenText:
	text "Are you keeping an"
	line "eye out for items?"
	done

.BeatenText:
	text "I dropped that"
	line "one…"
	done
	
TrainerEventide_4:
	generictrainer POKEFANF, JILL, EVENT_BEAT_EVENTIDE_TRAINER_4, .SeenText, .BeatenText

	text "I heard someone"
	line "even saw a little"
	cont "girl who was"
	cont "wandering, lost"
	cont "around here."
	done

.SeenText:
	text "They really need"
	line "to install some"
	cont "lamps or some-"
	cont "thing."
	
	para "This place is too"
	line "dangerous for kids"
	cont "to be exploring!"
	done
	
.BeatenText:
	text "You seem like you"
	line "can hold your own."
	done
	
TrainerEventide_5:
	generictrainer POKEFANM, RICK, EVENT_BEAT_EVENTIDE_TRAINER_5, .SeenText, .BeatenText

	text "Did I spook you?"
	
	para "Haha!"
	
	para "It's just a story!"
	done

.SeenText:
	text "They say these"
	line "woods are haunted"
	cont "by the a ghost."
	
	para "It sneaks up on"
	line "unsuspecting young"
	cont "TRAINERs, and…"
	
	para "…"
	
	para "BOO!"
	done

.BeatenText:
	text "It gets you!"
	done

ForestGhostGirlTrigger:
	disappear FORESTGHOSTGIRL
	setevent EVENT_FOREST_GHOST_GIRL_GONE
	dotrigger $1
	end
	
ForestGhostGirlTrigger2:
	disappear FORESTGHOSTGIRL
	disappear FORESTGHOSTGIRL2
	setevent EVENT_FOREST_GHOST_GIRL_GONE
	setevent EVENT_FOREST_GHOST_GIRL_GONE2
	dotrigger $2
	end
	
EventideForestSignText:
	text "EVENTIDE FOREST"
	
	para "Watch your step in"
	line "the dark!"
	done
	
EventideForestSign2Text:
	text "ROUTE 5 AHEAD"
	done
	
Movement_ForestGhostGirl:
	slide_step_up
	slide_step_up
	step_end