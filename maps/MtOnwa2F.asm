MtOnwa2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 15, 19, 7, MT_ONWA_1F
	warp_def  1,  9, 1, MT_ONWA_CLIFF

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9, 14, SIGNPOST_ITEM + HP_UP, EVENT_MT_ONWA_2F_HIDDEN_HP_UP
	bg_event 21, 16, SIGNPOST_ITEM + STAR_PIECE, EVENT_MT_ONWA_2F_HIDDEN_STAR_PIECE

	db 5 ; object events
	person_event SPRITE_BLACK_BELT, 10, 14, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwa2F_1, -1
	person_event SPRITE_POKEMANIAC,  7,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerMtOnwa2F_2, -1
	person_event SPRITE_BLACK_BELT,  2, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 3, TrainerMtOnwa2F_3, -1
	itemball_event 20,  6, SUPER_REPEL, 1, EVENT_MT_ONWA_2F_POKE_BALL
	tapeball_event  2, 11, MUSIC_HIKER_ENCOUNTER, 2, EVENT_MUSIC_HIKER_ENCOUNTER
	

TrainerMtOnwa2F_1:
	generictrainer BLACKBELT_T, HIRO, EVENT_BEAT_MT_ONWA_2F_TRAINER_1, .SeenText, .BeatenText

	text "We train deep in"
	line "the mountains to"
	cont "hone our bodies"
	cont "and minds!"
	done

.SeenText:
	text "Have you come here"
	line "to train your"
	cont "body and mind?"
	done

.BeatenText:
	text "I see."
	done
	
TrainerMtOnwa2F_2:
	generictrainer POKEMANIAC, DEREK, EVENT_BEAT_MT_ONWA_2F_TRAINER_2, .SeenText, .BeatenText

	text "Your collection"
	line "trumps mine!"
	done

.SeenText:
	text "Do you collect"
	line "#MON too?"
	
	para "Let me see!"
	done

.BeatenText:
	text "Aha!"
	done
	
TrainerMtOnwa2F_3:
	generictrainer BLACKBELT_T, NAKA, EVENT_BEAT_MT_ONWA_2F_TRAINER_3, .SeenText, .BeatenText

	text "I have much more"
	line "training to do!"
	done

.SeenText:
	text "HIYAH!"
	
	para "Fight me!"
	done

.BeatenText:
	text "Hmph!"
	done