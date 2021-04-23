MtOnwa2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 13, 31, 2, MT_ONWA_CLIFF
	warp_def 1, 9, 1, MT_ONWA_LOWER_CLIFF
	warp_def 25, 19, 3, MT_ONWA_1F
	warp_def 23, 19, 1, MT_ONWA_B1F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_JUGGLER, 13, 25, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwa2_1, -1
	person_event SPRITE_HIKER, 11, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwa2_2, -1

TrainerMtOnwa2_1:
	generictrainer JUGGLER, QUINN, EVENT_BEAT_MT_ONWA_2F_TRAINER_1, .SeenText, .BeatenText

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

TrainerMtOnwa2_2:
	generictrainer HIKER, LEROY, EVENT_BEAT_MT_ONWA_2F_TRAINER_2, .SeenText, .BeatenText

	text "My LARVITAR can"
	line "eat rocks, so it"
	cont "never runs out of"
	cont "of food."
	
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
	text "Ooooh…"
	
	para "I'm so hungry…"
	done
