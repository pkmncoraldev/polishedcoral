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
	generictrainer GRUNTM, NETT_GRUNTM_2, EVENT_BEAT_NETT_BUILDING_TRAINER_3, .SeenText, .BeatenText

	text "We don't need your"
	line "grubby fingers all"
	cont "on the computers!"
	
	para "Ok?"
	done

.SeenText:
	text "Hey!"
	
	para "Don't touch"
	line "anything!"
	
	para "Ok?"
	done

.BeatenText:
	text "You got me."
	
	para "Ok?"
	done
	
TrainerNettBuilding3F_2:
	generictrainer GRUNTM, NETT_GRUNTM_3, EVENT_BEAT_NETT_BUILDING_TRAINER_4, .SeenText, .BeatenText
	
	text "If you're tired,"
	line "have a rest in"
	cont "the lounge."
	
	para "Hah!<WAIT_S> As if!"
	done

.SeenText:
	text "Feeling tired?"
	
	para "TOO BAD!"
	done

.BeatenText:
	text "You aren't even"
	line "tired?"
	done
	
TrainerNettBuilding3F_3:
	generictrainer GRUNTM, NETT_GRUNTM_4, EVENT_BEAT_NETT_BUILDING_TRAINER_5, .SeenText, .BeatenText

	text "I can't do anything"
	line "right!"
	done

.SeenText:
	text "It's the kid they"
	line "told us to look"
	cont "out for!"
	
	para "Now's my chance to"
	line "prove I'm not a"
	cont "screw-up!"
	done

.BeatenText:
	text "Dad was right!"
	
	para "I AM a screw-up…"
	done
	
TrainerNettBuilding3F_4:
	generictrainer GRUNTM, NETT_GRUNTM_5, EVENT_BEAT_NETT_BUILDING_TRAINER_6, .SeenText, .BeatenText

	text "Well, there's tons"
	line "more where I came"
	cont "from."
	
	para "There's no way"
	line "you'll beat us all!"
	done

.SeenText:
	text "You're on our turf"
	line "now."
	
	para "There's no way TEAM"
	line "SNARE will lose!"
	done

.BeatenText:
	text "I lose!?"
	done
	
TrainerNettBuilding3F_5:
	generictrainer GRUNTF, NETT_GRUNTF_2, EVENT_BEAT_NETT_BUILDING_TRAINER_7, .SeenText, .BeatenText

	text "Well, you've made"
	line "it pretty far"
	cont "messing with"
	cont "TEAM SNARE."
	
	para "Maybe it's working"
	line "out for you."
	done

.SeenText:
	text "Quit messing with"
	line "TEAM SNARE."
	
	para "You'll be sorry!"
	done

.BeatenText:
	text "I'm sorry!"
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
