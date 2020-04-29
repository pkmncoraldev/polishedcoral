EventideGym_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, EventideGymCallback

	db 2 ; warp events
	warp_event 24, 21, EVENTIDE_VILLAGE, 8
	warp_event 25, 21, EVENTIDE_VILLAGE, 9

	db 0 ; coord events

	db 5 ; bg events
	bg_event 27,  8, SIGNPOST_UP, EventideGymBlueSwitchScript
	bg_event  0,  4, SIGNPOST_UP, EventideGymRedSwitchScript
	bg_event 11, 12, SIGNPOST_UP, EventideGymYellowSwitchScript
	bg_event 37, 16, SIGNPOST_UP, EventideGymRedSwitchScript
	bg_event 45,  8, SIGNPOST_UP, EventideGymBlueSwitchScript

	db 0 ; object events

	
EventideGymCallback:
	checkevent EVENT_EVENTIDE_GYM_RED_SWITCH
	iftrue .red_on
	jump .check_blue
.red_on
	changeblock $14, $a, $9a
	changeblock $12, $a, $9a
	changeblock $10, $a, $9a
	changeblock $e, $8, $aa
	changeblock $e, $6, $ab
	changeblock $c, $6, $9a
	changeblock $26, $a, $9b
	changeblock $28, $a, $9b
	changeblock $22, $c, $c2
	changeblock $22, $e, $c3

.check_blue
	checkevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	iftrue .blue_on
	jump .check_yellow
.blue_on
	changeblock $6, $6, $a1
	changeblock $4, $6, $a1
	changeblock $1c, $a, $a1
	changeblock $1e, $a, $a1
	changeblock $20, $a, $a1
	
.check_yellow
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .yellow_on
	return
.yellow_on
	changeblock $18, $6, $97
	return

EventideGymRedSwitchScript:
	opentext
	writetext EventideGymRedSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	checkevent EVENT_EVENTIDE_GYM_RED_SWITCH
	iftrue .turn_off
	changeblock $14, $a, $9a
	changeblock $12, $a, $9a
	changeblock $10, $a, $9a
	changeblock $e, $8, $aa
	changeblock $e, $6, $ab
	changeblock $c, $6, $9a
	changeblock $26, $a, $9b
	changeblock $28, $a, $9b
	changeblock $22, $c, $c2
	changeblock $22, $e, $c3
	reloadmappart
	closetext
	waitsfx
	setevent EVENT_EVENTIDE_GYM_RED_SWITCH
	end
.turn_off
	changeblock $14, $a, $9b
	changeblock $12, $a, $9b
	changeblock $10, $a, $9b
	changeblock $e, $8, $a8
	changeblock $e, $6, $a9
	changeblock $c, $6, $9b
	changeblock $26, $a, $9a
	changeblock $28, $a, $9a
	changeblock $22, $c, $c0
	changeblock $22, $e, $c1
	closetext
	clearevent EVENT_EVENTIDE_GYM_RED_SWITCH
	end
	
EventideGymBlueSwitchScript:
	opentext
	writetext EventideGymBlueSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	checkevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	iftrue .turn_off
	changeblock $6, $6, $a1
	changeblock $4, $6, $a1
	changeblock $1c, $a, $a1
	changeblock $1e, $a, $a1
	changeblock $20, $a, $a1
	reloadmappart
	closetext
	waitsfx
	setevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	end
.turn_off
	changeblock $6, $6, $a0
	changeblock $4, $6, $a0
	changeblock $1c, $a, $a0
	changeblock $1e, $a, $a0
	changeblock $20, $a, $a0
	reloadmappart
	closetext
	waitsfx
	clearevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	end
	
	
EventideGymYellowSwitchScript:
	opentext
	writetext EventideGymYellowSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	waitbutton
	closetext
	playsound SFX_WALL_OPEN
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .turn_off
	changeblock $18, $6, $97
	reloadmappart
	closetext
	waitsfx
	setevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	end
.turn_off
	changeblock $18, $6, $96
	reloadmappart
	closetext
	waitsfx
	clearevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	end

EventideGymNoSwitchScript:
	writetext EventideGymNoSwitchText
	waitbutton
	closetext
	end

EventideGymYesSwitchText:
	text "Who wouldn't?"
	done

EventideGymNoSwitchText:
	text "Better not…"
	done

EventideGymRedSwitchText:
	text "A red SWITCH!"
	
	para "Push it?"
	done

EventideGymBlueSwitchText:
	text "A blue SWITCH!"
	
	para "Push it?"
	done

EventideGymYellowSwitchText:
	text "A yellow SWITCH!"
	
	para "Push it?"
	done
