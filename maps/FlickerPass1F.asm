FlickerPass1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 41, 19, 7, FLICKER_STATION
	warp_def  3, 17, 1, FLICKER_PASS_2F
	warp_def 17, 37, 2, FLICKER_PASS_2F

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4, 34, SIGNPOST_ITEM + REVIVE, EVENT_FLICKER_PASS_1F_HIDDEN_ITEM_1
	bg_event 33, 23, SIGNPOST_ITEM + FULL_RESTORE, EVENT_FLICKER_PASS_1F_HIDDEN_ITEM_2

	db 8 ; object events
	itemball_event 25, 30, SUPER_REPEL, 1, EVENT_FLICKER_PASS_1F_POKEBALL_1
	tmhmball_event 19, 22, TM_ICE_PUNCH, EVENT_FLICKER_PASS_1F_POKEBALL_ICE_PUNCH
	person_event SPRITE_POKEMANIAC, 27, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass1F_1, -1
	person_event SPRITE_HIKER, 22, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 4, TrainerFlickerPass1F_2, -1
	person_event SPRITE_POKEMANIAC, 14, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, TrainerFlickerPass1F_3, -1
	person_event SPRITE_FIREBREATHER, 28,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerFlickerPass1F_4, -1
	person_event SPRITE_FIREBREATHER,  5, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerFlickerPass1F_5, -1
	smashrock_event 27, 28
	
TrainerFlickerPass1F_1:
	generictrainer POKEMANIAC, CARLOS, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_1, .SeenText, .BeatenText

	text "Someday I'll have"
	line "#MON that"
	cont "strong!"
	
	para "AHAHAHA!"
	done

.SeenText:
	text "AHAHAHA!"
	
	para "Do you have strong"
	line "#MON?"
	
	para "Show me!"
	done

.BeatenText:
	text "Crazy strong!"
	done
	
TrainerFlickerPass1F_2:
	generictrainer HIKER, HENRY, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_2, .SeenText, .BeatenText

	text "Cry! Cry! Cry!"
	
	para "Time to cry…"
	done

.SeenText:
	text "Battle! Battle!"
	line "Battle!"
	
	para "Time to battle!"
	done

.BeatenText:
	text "Battle! Battle!"
	line "Battle!"
	
	para "Lost the battle!"
	done

TrainerFlickerPass1F_3:
	generictrainer POKEMANIAC, TRISTEN, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_3, .SeenText, .BeatenText

	text "Hehe…"
	
	para "Your #MON are"
	line "so cute…"
	
	para "Hehe…"
	done

.SeenText:
	text "Gotcha!"
	
	para "Let me see your"
	line "adorable #MON!"
	done

.BeatenText:
	text "So cute!"
	done
	
TrainerFlickerPass1F_4:
	generictrainer FIREBREATHER, JOB, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_4, .SeenText, .BeatenText

	text "This is too close"
	line "quarters for me."
	
	para "Your breath"
	line "stinks!"
	done

.SeenText:
	text "Sure is cramped"
	line "around here."
	
	para "Hope you aren't"
	line "claustrophobic!"
	done

.BeatenText:
	text "Can't move!"
	done
	
TrainerFlickerPass1F_5:
	generictrainer FIREBREATHER, WIZ, EVENT_BEAT_FLICKER_PASS_1F_TRAINER_5, .SeenText, .BeatenText

	text "Don't let me hold"
	line "you up anymore."
	done

.SeenText:
	text "Hold on!"
	
	para "One more battle"
	line "before you move"
	cont "on!"
	done

.BeatenText:
	text "Great job!"
	done