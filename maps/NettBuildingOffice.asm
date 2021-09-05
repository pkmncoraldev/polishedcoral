NettBuildingOffice_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  9, NETT_BUILDING_2F, 3
	warp_event  6,  9, NETT_BUILDING_2F, 4

	db 0 ; coord events

	db 2 ; bg events
	signpost  5,  5, SIGNPOST_READ, NettBuildingTest
	signpost  5,  6, SIGNPOST_READ, NettBuildingOfficeNewton

	db 3 ; object events
	person_event SPRITE_CORY,  3,  5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingOfficeNett, -1
	person_event SPRITE_GOLD_TROPHY,  4,  0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NettBuildingOfficeTrophySilver, -1
	person_event SPRITE_GOLD_TROPHY,  5,  0, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NettBuildingOfficeTrophyGold, -1

	const_def 1 ; object constants
	const NETT_OFFICE_NETT
	
	
NettBuildingOfficeTrophySilver:
	jumptext NettBuildingOfficeTrophySilverText
	
NettBuildingOfficeTrophyGold:
	jumptext NettBuildingOfficeTrophyGoldText
	
NettBuildingOfficeNewton:
	checkevent EVENT_NEWTON_OFF
	iftrue .turnon
	opentext
	writetext NettBuildingOfficeNewtonText1
	yesorno
	iffalse .no
	setevent EVENT_NEWTON_OFF
	closetext
	end
.turnon
	opentext
	writetext NettBuildingOfficeNewtonText2
	yesorno
	iffalse .no
	clearevent EVENT_NEWTON_OFF
	closetext
	end
.no
	writetext NettBuildingOfficeNewtonTextNo
	waitbutton
	closetext
	end
	
NettBuildingOfficeNett:
	end
	
NettBuildingTest:
	opentext
	writetext NettBuildingOfficeNettText1
	waitbutton
	closetext
	pause 5
	changeblock $4, $2, $ae
	spriteface NETT_OFFICE_NETT, RIGHT
	callasm GenericFinishBridge
	pause 10
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement NETT_OFFICE_NETT, slow_step_right
	pause 10
	applymovement NETT_OFFICE_NETT, Movement_NettBuildingOfficeNett1
	spriteface PLAYER, RIGHT
	opentext
	writetext NettBuildingOfficeNettText2
	waitbutton
	closetext
	setevent EVENT_NEWTON_OFF
	callasm GenericFinishBridge
	waitbutton
	clearevent EVENT_NEWTON_OFF
	applymovement NETT_OFFICE_NETT, Movement_NettBuildingOfficeNett2
	spriteface NETT_OFFICE_NETT, RIGHT
	pause 5
	changeblock $4, $2, $ad
	spriteface NETT_OFFICE_NETT, DOWN
	callasm GenericFinishBridge
	end
	
NettBuildingOfficeNettText1:
	text "TEXT 1"
	done
	
NettBuildingOfficeNettText2:
	text "TEXT 2"
	done
	
NettBuildingOfficeTrophySilverText:
	text "A silver trophy."
	done
	
NettBuildingOfficeTrophyGoldText:
	text "A shiny golden"
	line "trophy."
	done
	
NettBuildingOfficeNewtonText:
	text "Three balls are"
	line "suspended by wire."
	
	para "The middle ball"
	line "stays in place!"
	done
	
NettBuildingOfficeNewtonText1:
	text "Stop it?"
	done
	
NettBuildingOfficeNewtonText2:
	text "Start it?"
	done
	
NettBuildingOfficeNewtonTextNo:
	text "Better not…"
	done
	
Movement_NettBuildingOfficeNett1:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_left
	step_end
	
Movement_NettBuildingOfficeNett2:
	step_right
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	slow_step_left
	step_end
	