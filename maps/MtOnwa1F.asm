MtOnwa1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, MtOnwa1FCallback

	db 3 ; warp events
	warp_def 23, 19, 3, LAKE_ONWA
	warp_def 1, 9, 1, MT_ONWA_CLIFF
	warp_def 11, 5, 3, MT_ONWA_2F

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_JUGGLER, 16, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerMtOnwa_1, -1
	person_event SPRITE_HIKER, 8, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerMtOnwa_2, -1
	person_event SPRITE_HIKER, 9, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwa_3, -1
	person_event SPRITE_JUGGLER, 3, 8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwa_4, -1
	itemball_event 10, 20, FULL_RESTORE, 1, EVENT_MT_ONWA_1F_POKE_BALL

MtOnwa1FCallback:
	setevent EVENT_LAKE_ROCKS_BROWN
	checkevent EVENT_MT_ONWA_B3F_MAGMAR_2
	iftrue .end
	clearevent EVENT_MT_ONWA_B3F_MAGMAR_GONE
.end
	return
	
TrainerMtOnwa_1:
	generictrainer JUGGLER, ERNIE, EVENT_BEAT_MT_ONWA_1F_TRAINER_1, .SeenText, .BeatenText

	text "Seems like my"
	line "battling could use"
	cont "just as much work"
	cont "as my act!"
	done

.SeenText:
	text "Wanna see a cool"
	line "trick?"
	
	para "Check this out!"
	done

.BeatenText:
	text "What?"
	
	para "You aren't"
	line "impressed?"
	done

TrainerMtOnwa_2:
	generictrainer HIKER, GILL, EVENT_BEAT_MT_ONWA_1F_TRAINER_2, .SeenText, .BeatenText

	text "I always wear"
	line "vests, even in"
	cont "summer!"
	done

.SeenText:
	text "Hi!"
	
	para "I like vests!"
	
	para "They're comfy and"
	line "easy to wear!"
	done

.BeatenText:
	text "I don't believe"
	line "it!"
	done
	
TrainerMtOnwa_3:
	generictrainer HIKER, HARVEY, EVENT_BEAT_MT_ONWA_1F_TRAINER_3, .SeenText, .BeatenText

	text "I'm getting all"
	line "sweaty standing"
	cont "around here."
	done

.SeenText:
	text "This part of the"
	line "cave seems hotter"
	cont "than over there."
	done

.BeatenText:
	text "YEOWCH!"
	done
	
TrainerMtOnwa_4:
	generictrainer JUGGLER, WILLY, EVENT_BEAT_MT_ONWA_1F_TRAINER_4, .SeenText, .BeatenText

	text "Aren't you even a"
	line "little bit tired?"
	done

.SeenText:
	text "Hey!"
	
	para "Why not stop for"
	line "a while and have"
	cont "a battle?"
	done

.BeatenText:
	text "I lost?"
	done
