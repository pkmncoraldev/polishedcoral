Route7_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route7Callback

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 23, 10, SIGNPOST_ITEM + LEAF_STONE, EVENT_ROUTE_7_HIDDEN_LEAF_STONE

	db 2 ; object events
	person_event SPRITE_BALL_CUT_FRUIT, 26, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route7Dummy, EVENT_ROUTE_6_POKE_BALL_CHARM
	person_event SPRITE_HIKER, 11, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerRoute7_1, -1

Route7Callback:
	clearevent EVENT_LAKE_ROCKS_BROWN
	return
	
Route7Dummy:
	end
	
TrainerRoute7_1:
	generictrainer HIKER, STEVEN, EVENT_BEAT_ROUTE_7_TRAINER, .SeenText, .BeatenText

	text "So young, but so"
	line "strong!"
	
	para "Keep that spirit!"
	done

.SeenText:
	text "A fresh, young"
	line "TRAINER!"
	
	para "How about a"
	line "battle?"
	done

.BeatenText:
	text "Amazing!"
	done
