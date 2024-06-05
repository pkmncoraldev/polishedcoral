Route12_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  5, 34, 3, ROUTE_12_GATE
	warp_def  5, 35, 4, ROUTE_12_GATE
	warp_def 57,  8, 1, AIRPORT_GATE
	warp_def 57,  9, 2, AIRPORT_GATE

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_SKATER, 36, 34, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route12Npc1, -1
	person_event SPRITE_SKATER, 35, 29, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route12Npc2, -1
	person_event SPRITE_SKATER, 35, 28, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route12Npc3, -1

	
	
Route12Npc1:
	jumptextfaceplayer Route12Npc1Text
	
Route12Npc2:
	jumptextfaceplayer Route12Npc2Text
	
Route12Npc3:
	jumptextfaceplayer Route12Npc3Text
	
TrainerRoute12_1:
	generictrainer SKATER, TONY, EVENT_BEAT_ROUTE_12_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route12Npc1Text:
	text "…or Die!"
	done
	
Route12Npc2Text:
	text "NO ENTRY 1"
	done
	
Route12Npc3Text:
	text "NO ENTRY 2"
	done