StarglowCavern2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 23, 3, 3, STARGLOW_CAVERN_1F
	warp_def 23, 25, 4, STARGLOW_CAVERN_1F
	warp_def 3, 5, 1, STARGLOW_CAVERN_1F

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_HIKER, 14, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 3, TrainerStarglowCavern2F_1, -1
	person_event SPRITE_HIKER, 16, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 2, TrainerStarglowCavern2F_2, -1
	itemball_event  -6, -6, POTION, 1, EVENT_STARGLOW_CAVERN_2F_POKE_BALL1
	itemball_event  9, 22, ETHER, 1, EVENT_STARGLOW_CAVERN_2F_POKE_BALL2

TrainerStarglowCavern2F_1:
	generictrainer HIKER, BENJAMIN, EVENT_BEAT_STARGLOW_CAVERN_2F_TRAINER_1, .SeenText, .BeatenText

	text "It's so nice and"
	line "refreshing down"
	cont "here."
	done

.SeenText:
	text "Ah!"
	
	para "It's so cool and"
	line "damp down here." 
	done

.BeatenText:
	text "Ahhh…"
	done
	
TrainerStarglowCavern2F_2:
	generictrainer HIKER, LANDON, EVENT_BEAT_STARGLOW_CAVERN_2F_TRAINER_2, .SeenText, .BeatenText

	text "The exit is near-"
	line "by."
	
	para "Good luck, kid!"
	done

.SeenText:
	text "Feeling tired?"
	
	para "You're almost"
	line "through!"
	done

.BeatenText:
	text "Wow!"
	
	para "Still looking"
	line "spry!"
	done
