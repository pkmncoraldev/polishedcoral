NettBuilding6F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding2FCallback

	db 2 ; warp events
	warp_event 21,  0, NETT_BUILDING_5F, 2
	warp_event 17,  0, NETT_BUILDING_7F, 1

	db 6 ; coord events
	coord_event  3,  3, -1, NettBuilding6FTeleporter1
	coord_event 15,  7, -1, NettBuilding6FTeleporter2
	coord_event 22,  7, -1, NettBuilding6FTeleporter3
	coord_event  1, 15, -1, NettBuilding6FTeleporter4
	coord_event 13, 13, -1, NettBuilding6FTeleporter5
	coord_event 21, 13, -1, NettBuilding6FTeleporter6

	db 1 ; bg events
	signpost  0, 19, SIGNPOST_JUMPTEXT, NettBuilding6FSignText

	db 2 ; object events
	itemball_event 11,  4, KEY_CARD_R, 1, EVENT_GOT_RED_KEY_CARD
	person_event SPRITE_SNARE_GIRL, 15,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 1, TrainerNettBuilding6F_1, -1
		
	
TrainerNettBuilding6F_1:
	generictrainer GRUNTF, NETT_GRUNTF_6, EVENT_BEAT_NETT_BUILDING_TRAINER_15, .SeenText, .BeatenText

	text "TEAM SNARE's goal?"
	
	para "To cause waton"
	line "mayhem of course!"
	done

.SeenText:
	text "You want to know"
	line "TEAM SNARE's goal?"
	
	para "Beat me, and I'll"
	line "tell you."
	done

.BeatenText:
	text "Ok, I'll tell you."
	done
	
NettBuilding6FTeleporter1:
	teleporter NETT_BUILDING_5F, 7, 15
	end
	
NettBuilding6FTeleporter2:
	teleporter NETT_BUILDING_3F, 15, 13
	end
	
NettBuilding6FTeleporter3:
	teleporter NETT_BUILDING_3F, 11, 9
	end
	
NettBuilding6FTeleporter4:
	teleporter NETT_BUILDING_2F, 21, 15
	end
	
NettBuilding6FTeleporter5:
	teleporter NETT_BUILDING_2F, 7, 15
	end
	
NettBuilding6FTeleporter6:
	teleporter NETT_BUILDING_4F, 3, 7
	end
