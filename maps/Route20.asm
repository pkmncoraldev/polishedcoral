Route20_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route20Trigger0

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	signpost 29,  2, SIGNPOST_READ, Route20Sunflower
	signpost 29,  3, SIGNPOST_READ, Route20Sunflower

	db 7 ; object events
	person_event SPRITE_AROMA_LADY,  8, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 3, Route20Trainer1, -1
	person_event SPRITE_SCHOOLBOY, 11, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, Route20Trainer2, -1
	person_event SPRITE_POKEFAN_M, 16,  8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route20NPC, -1
	person_event SPRITE_CASINO, 28,  2, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 28,  3, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	itemball_event  2,  6, REVIVE, 1, EVENT_ROUTE_20_POKE_BALL_1
	tmhmball_event  2, 28, TM_ACROBATICS, EVENT_ROUTE_20_POKE_BALL_2

Route20Sunflower:
	jumptext Route20SunflowerText

Route20Trigger0:
	special Special_UpdatePalsInstant
	end
	
Route20NPC:
	jumptextfaceplayer Route20NPCText
	
Route20NPCText:
	text "Walking through"
	line "the flowers kicks"
	cont "up tons of pollen."
	
	para "Achoo!"
	
	para "…"
	
	para "It's terrible for"
	line "my allergies!"
	done
	
Route20Trainer1:
	generictrainer AROMA_LADY, MARTHA, EVENT_BEAT_ROUTE_20_TRAINER_1, .SeenText, .BeatenText

	text "Your nose doesn't"
	line "betray you!"
	
	para "The flowers ahead"
	line "smell wonderful!"
	done

.SeenText:
	text "Caught a wiff of"
	line "something sweet?"
	
	para "Very keen nose!"
	done

.BeatenText:
	text "Aha!"
	done
	
Route20Trainer2:
	generictrainer SCHOOLBOY, FLYNN, EVENT_BEAT_ROUTE_20_TRAINER_2, .SeenText, .BeatenText

	text "GRASS-type #MON"
	line "share traits with"
	cont "organisms from the"
	cont "plant AND animal"
	cont "kingdoms!"
	done

.SeenText:
	text "I've been studying"
	line "GRASS-type #MON"
	cont "for school."
	
	para "They're facinating!"
	done

.BeatenText:
	text "Facinating!"
	done
	
Route20SunflowerText:
	text "A huge sunflower!"
	done