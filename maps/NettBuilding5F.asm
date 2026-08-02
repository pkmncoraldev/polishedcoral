NettBuilding5F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding3FCallback

	db 2 ; warp events
	warp_event 21,  0, NETT_BUILDING_4F, 2
	warp_event 17,  0, NETT_BUILDING_6F, 1

	db 4 ; coord events
	coord_event  3,  3, -1, NettBuilding5FTeleporter1
	coord_event 11,  9, -1, NettBuilding5FTeleporter2
	coord_event  7, 15, -1, NettBuilding5FTeleporter3
	coord_event 15, 11, -1, NettBuilding5FTeleporter4

	db 31 ; bg events
	signpost  0, 19, SIGNPOST_JUMPTEXT, NettBuilding5FSignText
	signpost  4, 14, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 15, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 16, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 17, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 18, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 19, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 20, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 21, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 22, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  4, 23, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 14, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 15, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 16, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 17, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 18, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 19, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 20, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 21, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 22, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost  5, 23, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 14, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 15, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 16, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 17, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 18, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 19, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 20, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 21, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 22, SIGNPOST_JUMPTEXT, NettBuilding5FServerText
	signpost 12, 23, SIGNPOST_JUMPTEXT, NettBuilding5FServerText

	db 12 ; object events
	itemball_event 23,  7, KEY_CARD_B, 1, EVENT_GOT_BLUE_KEY_CARD
	person_event SPRITE_SLOWPOKETAIL,  9,  2, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7,  6, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  5,  2, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7, 16, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SLOWPOKETAIL,  7, 20, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SNARE,  7,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerNettBuilding5F_1, -1
	person_event SPRITE_SNARE, 13,  3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, TrainerNettBuilding5F_2, -1
	person_event SPRITE_SNARE_GIRL, 11, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, TrainerNettBuilding5F_3, -1
	person_event SPRITE_SNARE,  5,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerNettBuilding5F_4, -1
	person_event SPRITE_SNARE_GIRL,  1,  6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerNettBuilding5F_5, -1
	person_event SPRITE_SNARE, 11, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, TrainerNettBuilding5F_6, -1


TrainerNettBuilding5F_1:
	generictrainer GRUNTM, NETT_GRUNTM_6, EVENT_BEAT_NETT_BUILDING_TRAINER_11, .SeenText, .BeatenText

	text "No matter how fast"
	line "you scurry, you'll"
	cont "never find your"
	cont "cheese, you little"
	cont "rat!"
	done

.SeenText:
	text "Hehe…"
	
	para "Don't you feel like"
	line "a rat in a maze?"
	done

.BeatenText:
	text "Jeez…"
	done

TrainerNettBuilding5F_2:
	generictrainer GRUNTM, NETT_GRUNTM_7, EVENT_BEAT_NETT_BUILDING_TRAINER_12, .SeenText, .BeatenText

	text "I honestly don't"
	line "really care if"
	cont "you pass."
	
	para "I'm just in this"
	line "for the paycheck."
	done

.SeenText:
	text "Hey you."
	
	para "Uhh…<WAIT_M> Stop!"
	
	para "Or…<WAIT_M> whatever…"
	done

.BeatenText:
	text "Eh, whatever…"
	done

TrainerNettBuilding5F_3:
	generictrainer GRUNTF, NETT_GRUNTF_6, EVENT_BEAT_NETT_BUILDING_TRAINER_13, .SeenText, .BeatenText

	text "Intruder alert!<WAIT_S>"
	line "Intruder alert!"
	
	para "The intruder"
	line "kicked my butt!"
	done

.SeenText:
	text "Intruder alert!<WAIT_S>"
	line "Intruder alert!"
	
	para "Stop the intruder!"
	done

.BeatenText:
	text "Not good!"
	done

TrainerNettBuilding5F_4:
	generictrainer GRUNTM, NETT_GRUNTM_8, EVENT_BEAT_NETT_BUILDING_TRAINER_14, .SeenText, .BeatenText

	text "At this rate,"
	line "TEAM SNARE is done"
	cont "for!"
	done

.SeenText:
	text "You're getting"
	line "awful close to"
	cont "the door."
	
	para "Do you have all"
	line "the key cards?"
	done

.BeatenText:
	text "You're good!"
	done

TrainerNettBuilding5F_5:
	generictrainer GRUNTF, NETT_GRUNTF_7, EVENT_BEAT_NETT_BUILDING_TRAINER_15, .SeenText, .BeatenText

	text "Fine.<WAIT_S>"
	line "Go on then."
	done

.SeenText:
	text "Thought you could"
	line "sneak past?"
	
	para "Hehehe. <WAIT_S>Not today!"
	done

.BeatenText:
	text "Oh no!"
	done
	
TrainerNettBuilding5F_6:
	generictrainer GRUNTM, NETT_GRUNTM_9, EVENT_BEAT_NETT_BUILDING_TRAINER_16, .SeenText, .BeatenText

	text "Listen, just don't"
	line "touch any of the"
	cont "servers, ok?"
	
	para "Our whole system"
	line "could go down!"
	done

.SeenText:
	text "Ah!"
	
	para "You came from the"
	line "warehouse!"
	
	para "You aren't"
	line "authroized to be"
	cont "down there!"
	done

.BeatenText:
	text "You aren't"
	line "authroized to be"
	cont "up here, either!"
	done

NettBuilding5FServerText:
	text "A huge stack of"
	line "computer servers"
	cont "click and whir."
	done

NettBuilding5FTeleporter1:
	teleporter NETT_BUILDING_4F, 11, 11
	end
	
NettBuilding5FTeleporter2:
	teleporter NETT_BUILDING_7F, 2, 9
	end
	
NettBuilding5FTeleporter3:
	teleporter NETT_BUILDING_6F, 3, 3
	end
	
NettBuilding5FTeleporter4:
	teleporter NETT_BUILDING_SPINNER_ROOM, 27, 5
	end

;	teleporter NETT_BUILDING_3F, 21, 10
	end
