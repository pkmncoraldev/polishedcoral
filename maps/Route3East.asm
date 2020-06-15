Route3East_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 13, 18, 5, STARGLOW_CAVERN_1F

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_YOUNGSTER, 15,  5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3East_1, -1
	smashrock_event 15, 16
	smashrock_event 14, 17
	smashrock_event 17, 17
	smashrock_event 21, 15
	
	
TrainerRoute3East_1:
	generictrainer COOLTRAINERM, SAMMY, EVENT_BEAT_ROUTE_3_EAST_TRAINER, .SeenText, .BeatenText

	text "Maybe this spot"
	line "isn't so good"
	cont "after all…"
	done	

.SeenText:
	text "Hey!"
	
	para "What are you doing"
	line "at my secret"
	cont "training spot?"
	done

.BeatenText:
	text "I can't believe it!"
	done
