NettBuilding2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  2, 11, NETT_BUILDING_ELEVATOR, 1
	warp_event  9, 11, ROUTE_1, 1
	warp_event  5,  1, NETT_BUILDING_OFFICE, 1
	warp_event  6,  1, NETT_BUILDING_OFFICE, 2

	db 2 ; coord events
	coord_event  5,  2, 0, NettBuilding2FStopL
	coord_event  6,  2, 0, NettBuilding2FStopR

	db 13 ; bg events
	signpost 11, 10, SIGNPOST_READ, NettBuilding2F_Sign1
	signpost  1,  4, SIGNPOST_READ, NettBuilding2F_Sign2
	signpost  2,  2, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  5,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  5,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  7,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  7,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  9,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost  9,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 11,  4, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 11,  7, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 12,  0, SIGNPOST_READ, NettBuildingOfficeRoseBushes
	signpost 12, 11, SIGNPOST_READ, NettBuildingOfficeRoseBushes

	db 2 ; object events
	person_event SPRITE_OFFICER, 12,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, NettBuilding1F_NPC_3, -1
	person_event SPRITE_RECEPTIONIST,  2,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuilding2F_NPC_2, -1


NettBuilding2FStopL:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface ROUTE_12_GATE_OFFICER2, LEFT
	showemote EMOTE_SHOCK, ROUTE_12_GATE_OFFICER2, 15
	opentext TEXTBOX_LADY
	writetext NettBuilding2FStopText
	waitbutton
	closetext
	applymovement PLAYER, Movement_NettBuilding2FStop
	jump NettBuilding2FStopR.cont
	
	
NettBuilding2FStopR:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface ROUTE_12_GATE_OFFICER2, LEFT
	showemote EMOTE_SHOCK, ROUTE_12_GATE_OFFICER2, 15
	opentext TEXTBOX_LADY
	writetext NettBuilding2FStopText
	waitbutton
	closetext
	applyonemovement PLAYER, step_right
.cont
	opentext TEXTBOX_LADY
	writetext NettBuilding2F_NPC_2_Text1
	waitbutton
	closetext
	dotrigger $1
	end
	
Movement_NettBuilding2FStop:
	step_right
	step_right
	step_end

NettBuilding2F_NPC_2:
	checkitem TRAIN_PASS
	iftrue .got_pass
	jumptextfaceplayer NettBuilding2F_NPC_2_Text1
.got_pass
	jumptextfaceplayer NettBuilding2F_NPC_2_Text2
	
NettBuilding2F_Sign1:
	jumptext NettBuilding2F_Sign1Text
	
NettBuilding2F_Sign2:
	jumptext NettBuilding2F_Sign2Text
	
NettBuilding2FStopText:
	text "Excuse me!"
	
	para "Can I help you?"
	done
	
NettBuilding2F_NPC_2_Text1:
	text "Ah, you must be"
	line "<PLAYER>."
	
	para "You indeed have an"
	line "appointment with"
	cont "MR. ELI."
	
	para "Go on in."
	done
	
NettBuilding2F_NPC_2_Text2:
	text "Have a nice day,"
	line "<PLAYER>!"
	done
	
NettBuilding2F_Sign1Text:
	text "FLOOR 9"
	done
	
NettBuilding2F_Sign2Text:
	text "ELI'S OFFICE"
	done