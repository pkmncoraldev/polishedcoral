EventideGym_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, EventideGymCallback

	db 2 ; warp events
	warp_event 24, 21, EVENTIDE_VILLAGE, 8
	warp_event 25, 21, EVENTIDE_VILLAGE, 9

	db 0 ; coord events

	db 6 ; bg events
	bg_event 22, 14, SIGNPOST_UP, EventideGymBlueSwitchScript
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
	changeblock $22, $c, $c2
	changeblock $22, $e, $c3

.check_blue
	checkevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	iftrue .blue_on
	jump .check_yellow
.blue_on
	changeblock $1c, $a, $a1
	changeblock $1e, $a, $a1
	changeblock $20, $a, $a1
	
.check_yellow
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .yellow_on
	jump .check_black
.yellow_on
	changeblock $18, $6, $97
	
.check_black
	checkevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	iftrue .black_on
	return
.black_on
	changeblock $18, $c, $94
	changeblock $26, $a, $98
	changeblock $26, $a, $98
	changeblock $4, $6, $99
	changeblock $6, $6, $99
	changeblock $8, $8, $cd
	changeblock $8, $a, $ce
	changeblock $c, $e, $99
	changeblock $e, $e, $af
	changeblock $e, $c, $cf
	changeblock $e, $a, $a7
	return

EventideGymRedSwitchScript:
	opentext
	writetext EventideGymRedSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	checkevent EVENT_EVENTIDE_GYM_RED_SWITCH
	iftrue .turn_off
	changeblock $14, $a, $9a
	changeblock $12, $a, $9a
	changeblock $10, $a, $9a
	changeblock $e, $8, $aa
	changeblock $e, $6, $ab
	changeblock $c, $6, $9a
	changeblock $22, $c, $c2
	changeblock $22, $e, $c3
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_RED_SWITCH
	jump EventideGymBlackSwitchScript
.turn_off
	changeblock $14, $a, $9b
	changeblock $12, $a, $9b
	changeblock $10, $a, $9b
	changeblock $e, $8, $a8
	changeblock $e, $6, $a9
	changeblock $c, $6, $9b
	changeblock $22, $c, $c0
	changeblock $22, $e, $c1
	closetext
	clearevent EVENT_EVENTIDE_GYM_RED_SWITCH
	jump EventideGymBlackSwitchScript
	
EventideGymBlueSwitchScript:
	opentext
	writetext EventideGymBlueSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	checkevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	iftrue .turn_off
	changeblock $1c, $a, $a1
	changeblock $1e, $a, $a1
	changeblock $20, $a, $a1
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	jump EventideGymBlackSwitchScript
.turn_off
	changeblock $1c, $a, $a0
	changeblock $1e, $a, $a0
	changeblock $20, $a, $a0
	reloadmappart
	closetext
	clearevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	jump EventideGymBlackSwitchScript
	
	
EventideGymYellowSwitchScript:
	opentext
	writetext EventideGymYellowSwitchText
	yesorno
	iffalse EventideGymNoSwitchScript
	writetext EventideGymYesSwitchText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	checkevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	iftrue .turn_off
	changeblock $18, $6, $97
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
	jump EventideGymBlackSwitchScript
.turn_off
	changeblock $18, $6, $96
	reloadmappart
	closetext
	clearevent EVENT_EVENTIDE_GYM_YELLOW_SWITCH
;fallthrough
	
EventideGymBlackSwitchScript:
	checkevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	iftrue .turn_off
	changeblock $18, $c, $94
	changeblock $28, $a, $98
	changeblock $26, $a, $98
	changeblock $4, $6, $99
	changeblock $6, $6, $99
	changeblock $8, $8, $cd
	changeblock $8, $a, $ce
	changeblock $c, $e, $99
	changeblock $e, $e, $af
	changeblock $e, $c, $cf
	changeblock $e, $a, $a7
	reloadmappart
	closetext
	setevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	end
.turn_off
	changeblock $18, $c, $95
	changeblock $28, $a, $99
	changeblock $26, $a, $99
	changeblock $4, $6, $98
	changeblock $6, $6, $98
	changeblock $8, $8, $ac
	changeblock $8, $a, $b0
	changeblock $c, $e, $98
	changeblock $e, $e, $cc
	changeblock $e, $c, $b1
	changeblock $e, $a, $9e
	reloadmappart
	closetext
	clearevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
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
