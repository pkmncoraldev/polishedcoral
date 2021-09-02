NettBuildingElevator_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  1,  3, NETT_BUILDING_1F, -1
	warp_event  2,  3, NETT_BUILDING_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, SIGNPOST_READ, NettBuildingElevatorButton

	db 0 ; object events

NettBuildingElevatorButton:
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
	db 2 ; floors
	elevfloor _1F, 4, NETT_BUILDING_1F
	elevfloor _9F, 1, NETT_BUILDING_2F
;	elevfloor _3F, 1, LUSTER_SKYSCRAPER_2_3F
	db -1 ; end
