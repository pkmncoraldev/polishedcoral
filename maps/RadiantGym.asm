RadiantGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17,  4, 5, RADIANT_ORPHANAGE_1F
	warp_def 17,  5, 5, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  3, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantGymGuy, -1
	object_event  5, 12, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 1, RadiantGymRose, -1
	object_event  4,  8, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, RadiantGymLily, -1
	object_event  5,  8, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 1, RadiantGymIris, -1
	object_event  6,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, RadiantGymPoppy, -1
	object_event  3,  4, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, RadiantGymViolet, -1
	object_event  2,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, RadiantGymClover, -1
	object_event  7,  7, SPRITE_PIGTAILS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_GENERICTRAINER, 1, RadiantGymFelicia, -1
	object_event  4,  2, SPRITE_LEILANI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantGymLeilani, -1

RadiantGymLeilani:
RadiantGymGuy:
	end

RadiantGymRose:
	generictrainer ROSE, 1, EVENT_BEAT_RADIANT_GYM_ROSE, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymLily:
	generictrainer LILY, 1, EVENT_BEAT_RADIANT_GYM_LILY, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymIris:
	generictrainer IRIS, 1, EVENT_BEAT_RADIANT_GYM_IRIS, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymPoppy:
	generictrainer POPPY, 1, EVENT_BEAT_RADIANT_GYM_POPPY, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymViolet:
	generictrainer VIOLET, 1, EVENT_BEAT_RADIANT_GYM_VIOLET, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymClover:
	generictrainer CLOVER, 1, EVENT_BEAT_RADIANT_GYM_CLOVER, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
RadiantGymFelicia:
	generictrainer FELICIA, 1, EVENT_BEAT_RADIANT_GYM_FELICIA, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done