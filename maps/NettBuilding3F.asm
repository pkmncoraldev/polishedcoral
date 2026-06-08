NettBuilding3F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding3FCallback

	db 2 ; warp events
	warp_event 21,  0, NETT_BUILDING_2F, 2
	warp_event 17,  0, NETT_BUILDING_4F, 1

	db 8 ; coord events
	coord_event 22,  7, -1, NettBuilding3FTeleporter1
	coord_event 21, 10, -1, NettBuilding3FTeleporter2
	coord_event 21, 15, -1, NettBuilding3FTeleporter3
	coord_event 15, 13, -1, NettBuilding3FTeleporter4
	coord_event 11,  5, -1, NettBuilding3FTeleporter5
	coord_event  1,  3, -1, NettBuilding3FTeleporter6
	coord_event  3, 13, -1, NettBuilding3FTeleporter7
	coord_event 11,  9, -1, NettBuilding3FTeleporter8

	db 1 ; bg events
	signpost  0, 19, SIGNPOST_JUMPTEXT, NettBuilding3FSignText

	db 8 ; object events
	person_event SPRITE_SLOWPOKETAIL,  7,  4, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  9,  8, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  9,  0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SNARE,  8,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerNettBuilding3F_1, -1
	person_event SPRITE_SNARE, 11, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerNettBuilding3F_2, -1
	person_event SPRITE_SNARE,  2,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, TrainerNettBuilding3F_3, -1
	person_event SPRITE_SNARE,  5,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, TrainerNettBuilding3F_4, -1
	person_event SPRITE_SNARE_GIRL, 10, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerNettBuilding3F_5, -1


NettBuilding3FCallback:
	setevent EVENT_DONT_CHANGE_EMOTE_COLOR
	return

TrainerNettBuilding3F_1:
	generictrainer GRUNTM, NETT_GRUNTM_4, EVENT_BEAT_NETT_BUILDING_TRAINER_5, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
TrainerNettBuilding3F_2:
	generictrainer GRUNTM, NETT_GRUNTM_5, EVENT_BEAT_NETT_BUILDING_TRAINER_6, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
TrainerNettBuilding3F_3:
	generictrainer GRUNTM, NETT_GRUNTM_6, EVENT_BEAT_NETT_BUILDING_TRAINER_7, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
TrainerNettBuilding3F_4:
	generictrainer GRUNTM, NETT_GRUNTM_7, EVENT_BEAT_NETT_BUILDING_TRAINER_8, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
TrainerNettBuilding3F_5:
	generictrainer GRUNTF, NETT_GRUNTF_2, EVENT_BEAT_NETT_BUILDING_TRAINER_9, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done

NettBuilding3FTeleporter1:
	teleporter NETT_BUILDING_2F, 16, 9
	end
	
NettBuilding3FTeleporter2:
	teleporter NETT_BUILDING_5F, 15, 11
	end
	
NettBuilding3FTeleporter3:
	teleporter NETT_BUILDING_2F, 11, 9
	end
	
NettBuilding3FTeleporter4:
	teleporter NETT_BUILDING_6F, 15, 7
	end
	
NettBuilding3FTeleporter5:
	teleporter NETT_BUILDING_2F, 11, 15
	end
	
NettBuilding3FTeleporter6:
	teleporter NETT_BUILDING_4F, 3, 15
	end
	
NettBuilding3FTeleporter7:
	teleporter NETT_BUILDING_2F, 3, 9
	end
	
NettBuilding3FTeleporter8:
	teleporter NETT_BUILDING_6F, 22, 7
	end
