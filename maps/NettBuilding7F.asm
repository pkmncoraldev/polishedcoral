NettBuilding7F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuilding7FCallback

	db 2 ; warp events
	warp_event 13,  6, NETT_BUILDING_6F, 2
	warp_event  6,  1, NETT_BUILDING_ELEVATOR, 1

	db 1 ; coord events
	coord_event  2,  9, -1, NettBuilding7FTeleporter

	db 4 ; bg events
	signpost  8,  6, SIGNPOST_UP, NettBuilding7FCardReader
	signpost  7,  4, SIGNPOST_IFNOTSET, NettBuilding7FBarrier
	signpost  7,  5, SIGNPOST_IFNOTSET, NettBuilding7FBarrier
	signpost  6, 11, SIGNPOST_JUMPTEXT, NettBuilding7FSignText

	db 2 ; object events
	person_event SPRITE_CORAL_STAR, -5, -5, SPRITEMOVEDATA_TILE_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_SNARE,  7, 10, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerNettBuilding7F, -1


NettBuilding7FCallback:
	scall NettBuilding7FRedBlueLight
	checkevent EVENT_NETT_YELLOW_LIGHT_ON
	iffalse .skip_yellow
	moveperson 1, 7, 7
.skip_yellow
	checkevent EVENT_NETT_BARRIER_DOWN
	iffalse .skip_door
	changeblock 4, 6, 143
.skip_door
	clearevent EVENT_DONT_CHANGE_EMOTE_COLOR
	return

TrainerNettBuilding7F:
	generictrainer GRUNTM, NETT_GRUNTM_12, EVENT_BEAT_NETT_BUILDING_TRAINER_19, .SeenText, .BeatenText

	text "You have to find"
	line "a way to get over"
	cont "there."
	done

.SeenText:
	text "The elevator to"
	line "ELI's office is"
	cont "on this floor."
	
	para "Surely you didn't"
	line "think getting to"
	cont "it would be that"
	cont "easy, though."
	done

.BeatenText:
	text "You'll never get"
	line "to that elevator!"
	done

NettBuilding7FBarrier:
	dw EVENT_NETT_BARRIER_DOWN
	jumptext NettBuilding7FBarrierText
	
NettBuilding7FBarrierText:
	text "A barrier blocks"
	line "the way."
	
	para "Maybe that console"
	line "has information."
	done

NettBuilding7FCardReader:
	opentext
.return
	playsound SFX_CHOOSE_PC_OPTION
	checkevent EVENT_NETT_BARRIER_DOWN
	iftrue .down
	writetext NettBuilding7FCardReaderText1
	waitbutton
	checkitem KEY_CARD_R
	iftrue .red
	checkitem KEY_CARD_B
	iftrue .blue
	checkitem KEY_CARD_Y
	iftrue .yellow
	closetext
	end
.red
	takeitem KEY_CARD_R
	setevent EVENT_NETT_RED_LIGHT_ON
	writetext NettBuilding7FCardReaderSwipedRedText
	pause 15
	closetext
	pause 6
	opentext
	writetext NettBuilding7FCardReaderSwipedText
	playsound SFX_GRASS_RUSTLE
	pause 10
	closetext
	pause 15
	playsound SFX_GET_COIN_FROM_SLOTS
	scall NettBuilding7FRedBlueLight
	callasm GenericFinishBridge
	waitsfx
	pause 10
	checkevent EVENT_NETT_BLUE_LIGHT_ON
	iffalse .opentext_return
	checkevent EVENT_NETT_YELLOW_LIGHT_ON
	iffalse .opentext_return
	jump .bring_it_down
.blue
	takeitem KEY_CARD_B
	setevent EVENT_NETT_BLUE_LIGHT_ON
	writetext NettBuilding7FCardReaderSwipedBlueText
	pause 15
	closetext
	pause 6
	opentext
	writetext NettBuilding7FCardReaderSwipedText
	playsound SFX_GRASS_RUSTLE
	pause 10
	closetext
	pause 15
	playsound SFX_GET_COIN_FROM_SLOTS
	scall NettBuilding7FRedBlueLight
	callasm GenericFinishBridge
	waitsfx
	pause 10
	checkevent EVENT_NETT_RED_LIGHT_ON
	iffalse .opentext_return
	checkevent EVENT_NETT_YELLOW_LIGHT_ON
	iffalse .opentext_return
	jump .bring_it_down
.yellow
	takeitem KEY_CARD_Y
	setevent EVENT_NETT_YELLOW_LIGHT_ON
	writetext NettBuilding7FCardReaderSwipedYellowText
	pause 15
	closetext
	pause 6
	opentext
	writetext NettBuilding7FCardReaderSwipedText
	playsound SFX_GRASS_RUSTLE
	pause 10
	closetext
	pause 15
	disappear 1
	moveperson 1, 7, 7
	playsound SFX_GET_COIN_FROM_SLOTS
	appear 1
	applyonemovement PLAYER, remove_fixed_facing
	waitsfx
	pause 10
	checkevent EVENT_NETT_RED_LIGHT_ON
	iffalse .opentext_return
	checkevent EVENT_NETT_BLUE_LIGHT_ON
	iffalse .opentext_return
.bring_it_down
	pause 30
	opentext
	writetext NettBuilding7FCardReaderText3
	playsound SFX_LEVEL_UP
	waitsfx
	writetext NettBuilding7FCardReaderText4
	waitbutton
	closetext
	pause 15
	playsound SFX_HORN_ATTACK
	changeblock 4, 6, 43
	callasm GenericFinishBridge
	earthquake 5
	playsound SFX_HORN_ATTACK
	changeblock 4, 6, 41
	callasm GenericFinishBridge
	earthquake 5
	playsound SFX_HORN_ATTACK
	changeblock 4, 6, 143
	callasm GenericFinishBridge
	earthquake 5
	setevent EVENT_NETT_BARRIER_DOWN
	domaptrigger NETT_BUILDING_TOP_FLOOR, $3
	end
.opentext_return
	opentext
	jump .return
.down
	writetext NettBuilding7FCardReaderText2
	waitbutton
	closetext
	
NettBuilding7FRedBlueLight:
	checkevent EVENT_NETT_RED_LIGHT_ON
	iftrue .red_on
;red_off
	checkevent EVENT_NETT_BLUE_LIGHT_ON
	iffalse .end
	changeblock 6, 6, 61
	jump .end
.red_on
	checkevent EVENT_NETT_BLUE_LIGHT_ON
	iftrue .both_on
	changeblock 6, 6, 55
	jump .end
.both_on
	changeblock 6, 6, 40
.end
	end
	
NettBuilding7FCardReaderSwipedRedText:
	text "<PLAYER> swiped the"
	line "RED KEY CARD."
	done
	
NettBuilding7FCardReaderSwipedBlueText:
	text "<PLAYER> swiped the"
	line "BLUE KEY CARD."
	done
	
NettBuilding7FCardReaderSwipedYellowText:
	text "<PLAYER> swiped the"
	line "YELLOW KEY CARD."
	done
	
NettBuilding7FCardReaderSwipedText:
	text "Fwip!"
	done
	
NettBuilding7FCardReaderText1:
	text "Barrier status:"
	
	para "BARRIER ACTIVE"
	
	para "Please swipe all"
	line "three KEY CARDS"
	cont "to deactivate."
	done
	
NettBuilding7FCardReaderText2:
	text "Barrier status:"
	
	para "BARRIER INACTIVE"
	done
	
NettBuilding7FCardReaderText3:
	text "Credentials"
	line "confrimed!"
	done
	
NettBuilding7FCardReaderText4:
	text "Raising barrier."
	done

NettBuilding7FTeleporter:
	teleporter NETT_BUILDING_5F, 11, 9
	end
	