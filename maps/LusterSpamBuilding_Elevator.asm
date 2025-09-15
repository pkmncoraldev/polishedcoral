LusterSpamBuilding_Elevator_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  1,  3, LUSTER_SPAM_BUILDING_1F, -1
	warp_event  2,  3, LUSTER_SPAM_BUILDING_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, SIGNPOST_READ, LusterSpamBuildingElevatorButton

	db 0 ; object events

LusterSpamBuildingElevatorButton:
	opentext
	elevator .Floors
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done
	end

.Floors:
	db 4 ; floors
	elevfloor _1F, 3, LUSTER_SPAM_BUILDING_1F
	elevfloor _11F, 1, LUSTER_SPAM_BUILDING_2F
	elevfloor _35F, 1, LUSTER_SPAM_BUILDING_3F
	elevfloor _58F, 1, LUSTER_SPAM_BUILDING_4F
	db -1 ; end
