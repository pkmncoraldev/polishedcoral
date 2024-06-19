MtOnwa1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, MtOnwa1FCallback

	db 11 ; warp events
	warp_def 25, 53, 3, LAKE_ONWA
	warp_def  4, 43, 6, MT_ONWA_1F
	warp_def 13, 39, 4, MT_ONWA_1F
	warp_def  5, 33, 3, MT_ONWA_1F
	warp_def  3, 35, 1, MT_ONWA_B1F
	warp_def 25, 35, 2, MT_ONWA_1F
	warp_def 22, 37, 1, MT_ONWA_2F
	warp_def 21, 19, 2, MT_ONWA_CLIFF
	warp_def 25, 21, 10, MT_ONWA_1F
	warp_def 14, 31, 9, MT_ONWA_1F
	warp_def  1,  9, 1, MT_ONWA_LOWER_CLIFF

	db 0 ; coord events

	db 3 ; bg events
	bg_event 18,  2, SIGNPOST_ITEM + NUGGET, EVENT_MT_ONWA_1F_HIDDEN_NUGGET
	bg_event  9, 22, SIGNPOST_ITEM + ULTRA_BALL, EVENT_MT_ONWA_1F_HIDDEN_ULTRA_BALL
	bg_event 42,  4, SIGNPOST_ITEM + REVIVE, EVENT_MT_ONWA_1F_HIDDEN_REVIVE

	db 8 ; object events
	person_event SPRITE_JUGGLER, 18, 47, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, TrainerMtOnwa_1, -1
	person_event SPRITE_HIKER, 10, 54, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerMtOnwa_2, -1
	person_event SPRITE_HIKER, 11, 47, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwa_3, -1
	person_event SPRITE_JUGGLER,  5, 42, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwa_4, -1
	person_event SPRITE_JUGGLER, 13, 26, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwa_5, -1
	person_event SPRITE_HIKER, 11,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, TrainerMtOnwa_6, -1
	person_event SPRITE_POKEMANIAC,  3, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 4, TrainerMtOnwa_7, -1
	itemball_event 44, 22, FULL_RESTORE, 1, EVENT_MT_ONWA_1F_POKE_BALL

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
	
TrainerMtOnwa_5:
	generictrainer JUGGLER, QUINN, EVENT_BEAT_MT_ONWA_1F_TRAINER_5, .SeenText, .BeatenText

	text "We're all jugglers"
	line "in the circus of"
	cont "life."
	done

.SeenText:
	text "It's really hard"
	line "juggling work,"
	cont "responsibilities,"
	cont "and #MON train-"
	cont "ing."
	
	para "It gets exhausting"
	line "pretty quickly."
	done

.BeatenText:
	text "I dropped the"
	line "ball…"
	done
	
TrainerMtOnwa_6:
	generictrainer HIKER, LEROY, EVENT_BEAT_MT_ONWA_1F_TRAINER_6, .SeenText, .BeatenText

	text "My LARVITAR can"
	line "eat rocks, so it"
	cont "never runs out of"
	cont "food."
	
	para "Me, on the other"
	line "hand…"
	done

.SeenText:
	text "My POKEMON is"
	line "always hungry."
	
	para "Like TRAINER, like"
	line "#MON."
	done

.BeatenText:
	text "Ooooh…<WAIT_M>"
	line "I'm so hungry…"
	done
	
TrainerMtOnwa_7:
	generictrainer POKEMANIAC, PAUL, EVENT_BEAT_MT_ONWA_1F_TRAINER_7, .SeenText, .BeatenText

	text "Ok you win…"
	
	para "Just go…"
	done

.SeenText:
	text "Dead end!"
	
	para "But don't go!"
	
	para "Stick around for"
	line "awhile and battle!"
	done

.BeatenText:
	text "Argh!"
	done
