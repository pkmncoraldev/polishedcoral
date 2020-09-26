Route3East_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  5, 20, 1, STARGLOW_CAVERN_3F

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_YOUNGSTER, 15,  5, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute3East_1, -1
	smashrock_event 20, 12
	smashrock_event 21, 13
	smashrock_event 18,  8
	smashrock_event 21,  9
	
	
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
