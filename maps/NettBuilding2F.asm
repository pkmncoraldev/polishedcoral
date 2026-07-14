NettBuilding2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding2FCallback

	db 2 ; warp events
	warp_event 21,  2, NETT_BUILDING_1F, 3
	warp_event 17,  2, NETT_BUILDING_3F, 1

	db 7 ; coord events
	coord_event 16,  9, -1, NettBuilding2FTeleporter1
	coord_event 11, 15, -1, NettBuilding2FTeleporter2
	coord_event 21, 15, -1, NettBuilding2FTeleporter3
	coord_event 11,  9, -1, NettBuilding2FTeleporter4
	coord_event  3,  9, -1, NettBuilding2FTeleporter5
	coord_event  7, 15, -1, NettBuilding2FTeleporter6
	coord_event  1, 15, -1, NettBuilding2FTeleporter7

	db 2 ; bg events
	signpost  2, 19, SIGNPOST_JUMPTEXT, NettBuilding2FSignText
	signpost  3,  4, SIGNPOST_READ, NettBuilding2FNurse

	db 4 ; object events
	person_event SPRITE_BACKPACK,  2,  4, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NettBuilding2FNurse, -1
	person_event SPRITE_SNARE, 13,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 2, TrainerNettBuilding2F_1, -1
	person_event SPRITE_SNARE_GIRL, 13, 19, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerNettBuilding2F_2, -1
	person_event SPRITE_SNARE,  9,  7, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuilding2FNPC, -1
	
	
NettBuilding2FCallback:
	clearevent EVENT_DONT_CHANGE_EMOTE_COLOR
	return
	
NettBuilding2FSignText:
	text "FLOOR 2"
	done
	
NettBuilding3FSignText:
	text "FLOOR 3"
	done
	
NettBuilding4FSignText:
	text "FLOOR 4"
	done
	
NettBuilding5FSignText:
	text "FLOOR 5"
	done
	
NettBuilding6FSignText:
	text "FLOOR 6"
	done
	
NettBuilding7FSignText:
	text "FLOOR 7"
	done
	
TrainerNettBuilding2F_1:
	generictrainer GRUNTM, NETT_GRUNTM_1, EVENT_BEAT_NETT_BUILDING_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
TrainerNettBuilding2F_2:
	generictrainer GRUNTF, NETT_GRUNTF_1, EVENT_BEAT_NETT_BUILDING_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
NettBuilding2FNPC:
	jumptextfaceplayer NettBuilding2FNPCText
	
NettBuilding2FNPCText:
	text "I'm in no mood to"
	line "battle you…"
	
	para "I lost my stupid"
	line "EMPLOYEE ID down"
	cont "in the warehouse."
	
	para "Nursezilla over"
	line "there won't let me"
	cont "use the lounge."
	
	para "She sees me every"
	line "single day!"
	
	para "Can't she cut me"
	line "some slack?"
	done
	
NettBuilding2FNurse:
	setlasttalked 1
	faceplayer
	opentext
	checkevent EVENT_HEALED_AT_EMPLOYEE_LOUNGE
	iftrue .healed_before
	writetext NettBuilding2FNurseText1
	yesorno
	iffalse .no_heal
	checkitem EMPLOYEE_ID
	iffalse .no_card
	writetext NettBuilding2FNurseText4
	waitbutton
	closetext
	jump .heal
.healed_before
	writetext NettBuilding2FNurseText5
	yesorno
	iffalse .no_heal
	writetext NettBuilding2FNurseText4
	waitbutton
	closetext
.heal
	setevent EVENT_HEALED_AT_EMPLOYEE_LOUNGE
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	opentext
.no_heal
	writetext NettBuilding2FNurseText2
.end
	changeaction 1, PERSON_ACTION_TILE_UP
	pause 10
	changeaction 1, PERSON_ACTION_TILE_DOWN
	pause 10
	endtext
	end
.no_card
	writetext NettBuilding2FNurseText3
	buttonsound
	farwritetext StdBlankText
	pause 6
	jump .no_heal
	
NettBuilding2FTeleporter1:
	teleporter NETT_BUILDING_3F, 22, 7
	end
	
NettBuilding2FTeleporter2:
	teleporter NETT_BUILDING_3F, 11, 5
	end
	
NettBuilding2FTeleporter3:
	teleporter NETT_BUILDING_6F, 1, 15
	end
	
NettBuilding2FTeleporter4:
	teleporter NETT_BUILDING_SPINNER_ROOM, 27, 17
	end
	
NettBuilding2FTeleporter5:
	teleporter NETT_BUILDING_3F, 3, 13
	end
	
NettBuilding2FTeleporter6:
	teleporter NETT_BUILDING_6F, 13, 13
	end
	
NettBuilding2FTeleporter7:
	teleporter NETT_BUILDING_4F, 17, 11
	end
	
NettBuilding2FNurseText1:
	text "I used to be a"
	line "nurse at the"
	cont "#MON CENTER,"
	
	para "but TEAM SNARE"
	line "pays better."
	
	para "Now I run the"
	line "employee lounge."
	
	para "Show me your"
	line "EMPLOYEE ID, and"
	cont "you can rest here."
	done
	
NettBuilding2FNurseText2:
	text "We hope to see you"
	line "again."
	done
	
NettBuilding2FNurseText3:
	text "No EMPLOYEE ID, no"
	line "employee lounge."
	done
	
NettBuilding2FNurseText4:
	text "Hmmm…"
	
	para "You don't look much"
	line "like your photo…"
	
	para "…<WAIT_M>Oh well!<WAIT_S>"
	line "An ID's an ID!"
	
	para "Enjoy your rest!"
	done
	
NettBuilding2FNurseText5:
	text "Show me your"
	line "EMPLOYEE ID, and"
	cont "you can rest here."
	done
	
NettBuilding2FNurseText6:
	text "Enjoy your rest!"
	done
