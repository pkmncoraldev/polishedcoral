EventideForest_MapScriptHeader:
	db 3 ; scene scripts
	scene_script EventideForestTrigger0
	scene_script EventideForestTrigger1
	scene_script EventideForestTrigger2

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  4,  6, 3, ROUTE_4_EVENTIDE_GATE
	warp_def  5,  6, 4, ROUTE_4_EVENTIDE_GATE
	warp_def 68, 39, 1, EVENTIDE_VILLAGE_GATE
	warp_def 69, 39, 2, EVENTIDE_VILLAGE_GATE

	db 8 ; coord events
	xy_trigger 0, 14, 26, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 15, 26, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0, 17, 33, 0, ForestGhostGirlTrigger, 0, 0
	xy_trigger 0,  9, 32, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 0,  9, 33, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 1,  9, 32, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 1,  9, 33, 0, ForestGhostGirlTrigger2, 0, 0
	xy_trigger 0,  7, 52, 0, ForestGhostGirlTrigger, 0, 0

	db 3 ; bg events
	signpost  6,  8, SIGNPOST_READ, EventideForestSign
	signpost 67, 37, SIGNPOST_READ, EventideForestSign2
	bg_event 37, 17, SIGNPOST_ITEM + DUSK_STONE, EVENT_EVENTIDE_FOREST_HIDDEN_DUSK_STONE

	db 13 ; object events
	person_event SPRITE_TWIN, 11, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FOREST_GHOST_GIRL_GONE
	person_event SPRITE_TWIN,  5, 34, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_FOREST_GHOST_GIRL_GONE2
	person_event SPRITE_YOUNGSTER, 12,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_1, -1
	person_event SPRITE_LASS, 21, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_2, -1
	person_event SPRITE_POKEFAN_M, 31, 23, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerEventide_3, -1
	person_event SPRITE_POKEFAN_F, 62, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerEventide_4, -1
	person_event SPRITE_POKEFAN_M, 49, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 4, TrainerEventide_5, -1
	person_event SPRITE_BUG_CATCHER, 35, 18, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerEventide_6, -1
	itemball_event 28, 22, SUPER_REPEL, 1, EVENT_FOREST_POKE_BALL_1
	itemball_event 30, 47, SUPER_POTION, 1, EVENT_FOREST_POKE_BALL_2
	fruittree_event 27, 14, FRUITTREE_EVENTIDE_FOREST, PECHA_BERRY
	cuttree_event 32, 22, EVENT_EVENTIDE_FOREST_CUT_TREE_1
	cuttree_event 33, 16, EVENT_EVENTIDE_FOREST_CUT_TREE_2

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
	cont "girl wandering"
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

TrainerEventide_6:
	generictrainer BUG_CATCHER, TURK, EVENT_BEAT_EVENTIDE_TRAINER_6, .SeenText, .BeatenText

	text "There's some crazy"
	line "cool BUG-TYPEs"
	cont "around here."
	done

.SeenText:
	text "Check out my cool"
	line "#MON!"
	
	para "BUG-TYPEs are the"
	line "best!"
	done
	
.BeatenText:
	text "Actually, YOU'RE"
	line "the best!"
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
	text "EVENTIDE VILLAGE"
	line "AHEAD"
	done
	
Movement_ForestGhostGirl:
	slide_step_up
	slide_step_up
	step_end