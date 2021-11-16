Route11_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  5, 34, 3, ROUTE_11_GATE
	warp_def  5, 35, 4, ROUTE_11_GATE
	warp_def 57,  8, 1, ROUTE_12_GATE
	warp_def 57,  9, 2, ROUTE_12_GATE

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_SKATER, 38, 35, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11Npc1, -1
	person_event SPRITE_SKATER, 39, 36, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route11Npc2, -1
	person_event SPRITE_SKATER, 39, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route11Npc3, -1

	
	
Route11Npc1:
	jumptextfaceplayer Route11Npc1Text
	
Route11Npc2:
	jumptextfaceplayer Route11Npc2Text
	
Route11Npc3:
	jumptextfaceplayer Route11Npc3Text
	
TrainerRoute11_1:
	generictrainer SKATER, TONY, EVENT_BEAT_ROUTE_11_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
Route11Npc1Text:
	text "…or Die!"
	done
	
Route11Npc2Text:
	text "NO ENTRY 1"
	done
	
Route11Npc3Text:
	text "NO ENTRY 2"
	done