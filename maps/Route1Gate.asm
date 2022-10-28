Route1Gate_MapScriptHeader:
	db 3 ; scene scripts
	
	scene_script Route1GateTrigger0
	scene_script Route1GateTrigger1
	scene_script Route1GateTrigger2

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, ROUTE_1, 1
	warp_event  4,  0, ROUTE_1, 2
	warp_event  3,  7, SUNSET_CAPE, 2
	warp_event  4,  7, SUNSET_CAPE, 2

	db 2 ; coord events
	coord_event  3,  1, 0, SunsetOfficerStopsYou1
	coord_event  4,  1, 0, SunsetOfficerStopsYou2

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route1OfficerScript1, -1
	
	const_def 1 ; object constants
	const ROUTE1GATE_OFFICER
	
Route1GateTrigger0:
	end
	
Route1GateTrigger1:
	specialphonecall SPECIALCALL_MOMCOMEGETTRAINERCARD
;	addcellnum PHONE_MOM
	end
	
Route1GateTrigger2:
	end

Route1OfficerScript1:
	faceplayer
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iftrue Route1OfficerScript2
	writetext Route1OfficerText1
	waitbutton
	closetext
	end
	
Route1OfficerScript2:
	checkevent EVENT_MOM_GOT_POKEGEAR
	iftrue Route1OfficerScript3
	writetext Route1OfficerText2
	waitbutton
	closetext
	end
	
Route1OfficerScript3:
	writetext Route1OfficerText3
	waitbutton
	closetext
	end
	
SunsetOfficerStopsYou1:
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iftrue SunsetOfficerStopsYou1_2
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE1GATE_OFFICER, 15
	pause 7
	opentext
	writetext OfficerStopsYouText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunsetOfficerStopsYou1
	opentext
	writetext OfficerStopsYouText2
	waitbutton
	closetext
	end
	
SunsetOfficerStopsYou1_2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE1GATE_OFFICER, 15
	pause 7
	opentext
	writetext OfficerStopsYouText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunsetOfficerStopsYou1
	opentext
	writetext OfficerStopsYouText3
	waitbutton
	closetext
	end
	
SunsetOfficerStopsYou2:
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iftrue SunsetOfficerStopsYou2_2
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE1GATE_OFFICER, 15
	pause 7
	opentext
	writetext OfficerStopsYouText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunsetOfficerStopsYou2
	opentext
	writetext OfficerStopsYouText2
	waitbutton
	closetext
	end
	
SunsetOfficerStopsYou2_2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, ROUTE1GATE_OFFICER, 15
	pause 7
	opentext
	writetext OfficerStopsYouText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_SunsetOfficerStopsYou2
	opentext
	writetext OfficerStopsYouText3
	waitbutton
	closetext
	end
	
Movement_SunsetOfficerStopsYou1:
	step_down
	step_down
	step_down
	step_left
	step_end
	
Movement_SunsetOfficerStopsYou2:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_end
	
OfficerStopsYouText1:
	text "Hey kid!"
	done
	
OfficerStopsYouText2:
	text "You don't have"
	line "a #MON!"
	
	para "I'm sorry, but I"
	line "can't let you go"
	cont "out there without"
	cont "a #MON!"
	
	para "I could lose my"
	line "job!"
	done
	
OfficerStopsYouText3:
	text "Didn't your MOM"
	line "have something for"
	cont "you?"
	
	para "Huh?"

	para "Of course I wasn't"
	line "eavesdropping!"
	done

Route1OfficerText1:
	text "You can't leave"
	line "out through those"
	cont "doors without a"
	cont "#MON."
	
	para "Come back when you"
	line "have one."
	done
	
Route1OfficerText2:
	text "Didn't your MOM"
	line "have something for"
	cont "you?"
	
	para "Huh?"

	para "Of course I wasn't"
	line "eavesdropping!"
	done
	
Route1OfficerText3:
	text "Good luck out"
	line "there, kid."
	done
