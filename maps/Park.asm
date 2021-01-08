Park_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_SKATER, 36, 35, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ParkNpc1, -1
	person_event SPRITE_SKATER, 37, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ParkNpc2, -1
	person_event SPRITE_SKATER, 38, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ParkNpc3, -1

	
	
ParkNpc1:
	jumptextfaceplayer ParkNpc1Text
	
ParkNpc2:
	jumptextfaceplayer ParkNpc2Text
	
ParkNpc3:
	jumptextfaceplayer ParkNpc3Text
	
TrainerPark_1:
	generictrainer SKATER, TONY, EVENT_BEAT_PARK_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
ParkNpc1Text:
	text "…or Die!"
	done
	
ParkNpc2Text:
	text "NO ENTRY 1"
	done
	
ParkNpc3Text:
	text "NO ENTRY 2"
	done