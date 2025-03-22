Route25_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route23Callback2

	db 1 ; warp events
	warp_event  0,  8, BRIGHTBURG, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost 12, 29, SIGNPOST_ITEM + SILVER_LEAF, EVENT_ROUTE_25_HIDDEN_SILVER_LEAF

	db 7 ; object events
	object_event -6, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event -6, -5, SPRITE_LEAVES, SPRITEMOVEDATA_BAGGAGE, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PINK
	person_event SPRITE_POKEMANIAC, 11, 10, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, Route25Trainer1, -1
	person_event SPRITE_PSYCHIC, 13, 24, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, Route25Trainer2, -1
	person_event SPRITE_HIKER, 12, 38, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, Route25Trainer3, -1
	person_event SPRITE_REDS_MOM,  7, 35, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route25NPC1, -1
	
	
Route25NPC1:
	jumptextfaceplayer Route25NPC1Text
	
Route25NPC1Text:
	text "I think they're"
	line "buidling something"
	cont "up ahead."
	
	para "I don't see any"
	line "workers, though."
	done
	
Route25NPC2:
	jumptextfaceplayer Route25NPC2Text
	
Route25NPC2Text:
	text "The fallen tree"
	line "has finally been"
	cont "cleared!"
	
	para "Thank goodness!"
	done
	
Route25Trainer1:
	generictrainer POKEMANIAC, NOAH, EVENT_BEAT_ROUTE_25_TRAINER_1, .SeenText, .BeatenText

	text "That's a shame."
	
	para "I was enjoying the"
	line "quiet."
	done

.SeenText:
	text "Since that large"
	line "tree fell,"
	
	para "not many people"
	line "have been passing"
	cont "through here."
	
	para "…"
	
	para "The fallen tree"
	line "is gone? I see…"
	done

.BeatenText:
	text "I see…"
	done
	
Route25Trainer2:
	generictrainer PSYCHIC_T, DAVID, EVENT_BEAT_ROUTE_25_TRAINER_2, .SeenText, .BeatenText

	text "It was probably"
	line "a coincidence…"
	done

.SeenText:
	text "I knew someone"
	line "would come along"
	cont "if I stood here."
	
	para "I had a feeling."
	
	para "…<WAIT_M>Or was it a"
	line "vision!?"
	done

.BeatenText:
	text "It's all clear"
	line "now!"
	done
	
Route25Trainer3:
	generictrainer HIKER, KEITH, EVENT_BEAT_ROUTE_25_TRAINER_3, .SeenText, .BeatenText

	text "It can be fun to"
	line "explore, but the"
	cont "road more traveled"
	cont "is that way for"
	cont "a reason."
	done

.SeenText:
	text "Do you like to"
	line "explore the world"
	cont "around you?"
	
	para "Or are you more"
	line "prone to stick"
	cont "to the beaten"
	cont "path?"
	done

.BeatenText:
	text "Well you've"
	line "beaten me, at"
	cont "least."
	done
	
Route25Windy_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
