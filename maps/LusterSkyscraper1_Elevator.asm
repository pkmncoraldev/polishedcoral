LusterSkyscraper1_Elevator_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  1,  3, LUSTER_SKYSCRAPER_1_1F, -1
	warp_event  2,  3, LUSTER_SKYSCRAPER_1_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, SIGNPOST_READ, LusterSkyscraper1ElevatorButton

	db 0 ; object events

LusterSkyscraper1ElevatorButton:
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
	db 3 ; floors
	elevfloor _1F, 3, LUSTER_SKYSCRAPER_1_1F
	elevfloor _2F, 1, LUSTER_SKYSCRAPER_1_2F
	elevfloor _3F, 1, LUSTER_SKYSCRAPER_1_3F
	db -1 ; end
