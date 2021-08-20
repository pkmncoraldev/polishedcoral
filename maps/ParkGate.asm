ParkGate_MapScriptHeader:
	db 2 ; scene scripts
	scene_script ParkGateTrigger0
	scene_script ParkGateTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ParkGateCallback

	db 4 ; warp events
	warp_event  3,  0, LUSTER_CITY_RESIDENTIAL, 10
	warp_event  4,  0, LUSTER_CITY_RESIDENTIAL, 11
	warp_event  3,  7, PARK, 1
	warp_event  4,  7, PARK, 2

	db 2 ; coord events
	coord_event  3,  7, 0, ParkGateOfficerStopsYou1
	coord_event  4,  7, 0, ParkGateOfficerStopsYou2

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, ParkGateOfficer, -1
	
	const_def 1 ; object constants
	const ParkGate_OFFICER
	
ParkGateTrigger0:
	end
	
ParkGateTrigger1:
	end
	
ParkGateOfficer:
	end
	
ParkGateCallback
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	return
	
ParkGateOfficerStopsYou1:
	checkevent EVENT_WENT_TO_NETT_BUILDING
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE1GATE_OFFICER, 15
	pause 7
	opentext
	writetext ParkGateOfficerStopsYouText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_ParkGateOfficerStopsYou1
	jump ParkGateOfficerStopsYouEnd
	
ParkGateOfficerStopsYou2:
	checkevent EVENT_WENT_TO_NETT_BUILDING
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE1GATE_OFFICER, 15
	pause 7
	opentext
	writetext ParkGateOfficerStopsYouText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_ParkGateOfficerStopsYou2
ParkGateOfficerStopsYouEnd:
	opentext
	writetext ParkGateOfficerStopsYouText2
	waitbutton
	closetext
	end
	
ParkGateOfficerStopsYouText1:
	text "Hold on!"
	done
	
ParkGateOfficerStopsYouText2:	
	text "I was told to keep"
	line "an eye out for a"
	cont "kid named <PLAYER>."
	
	para "That's you, right?"
	
	para "MR. NETT wanted"
	line "you to pay him a"
	cont "visit."
	
	para "You shouldn't keep"
	line "someone like him"
	cont "waiting!"
	done
	
Movement_ParkGateOfficerStopsYou1:
	step_up
	step_up
	step_up
	step_left
	step_end
	
Movement_ParkGateOfficerStopsYou2:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_end
