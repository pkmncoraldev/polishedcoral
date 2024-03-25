Route6South_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_SWIMMER_GIRL,  6, 17, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6South_1, -1
	person_event SPRITE_SWIMMER_GUY,  7, 30, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute6South_2, -1
	person_event SPRITE_TUBER, 17, 13, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, TrainerRoute6South_3, -1
	
	
TrainerRoute6South_1:
	generictrainer SWIMMERF, SHANNON, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_1, .SeenText, .BeatenText

	text "The water gets"
	line "pretty deep around"
	cont "here."
	
	para "What could be down"
	line "there, I wonder!"
	done

.SeenText:
	text "Let's battle!"
	
	para "You'll be sinking"
	line "to the bottom of"
	cont "the ocean when I'm"
	cont "done with you!"
	done

.BeatenText:
	text "I'm sinking!"
	done
	
TrainerRoute6South_2:
	generictrainer SWIMMERM, DAVY, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_2, .SeenText, .BeatenText

	text "Let's just say my"
	line "new suit doesn't"
	cont "leave much to the"
	cont "imagination."
	
	para "I think I'll just"
	line "stay under the"
	cont "water…"
	done

.SeenText:
	text "My friend talked"
	line "me into a new"
	cont "style of swimsuit."
	
	para "He said all the"
	line "ladies love them!"
	
	para "I feel so exposed!"
	done

.BeatenText:
	text "Ah shoot!"
	done
	
	
TrainerRoute6South_3:
	generictrainer TUBER, KERRI, EVENT_BEAT_ROUTE_6_SOUTH_TRAINER_3, .SeenText, .BeatenText

	text "I'm getting dizzy!"
	done

.SeenText:
	text "I've drifted pretty"
	line "far away from the"
	cont "beach."
	
	para "I hope I wash up"
	line "somewhere soon…"
	done

.BeatenText:
	text "Sigh…"
	done
