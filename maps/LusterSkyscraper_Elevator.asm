LusterSkyscraper_Elevator_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterSkyscraper_ElevatorCallback

	db 2 ; warp events
	warp_event  1,  3, LUSTER_SKYSCRAPER_1F, -1
	warp_event  2,  3, LUSTER_SKYSCRAPER_1F, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, SIGNPOST_READ, LusterSkyscraper1ElevatorButton

	db 0 ; object events

LusterSkyscraper_ElevatorCallback:
	checkevent EVENT_CAN_GO_TO_SKYCRAPER_BASEMENT
	iffalse .end
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
.end
	return

LusterSkyscraper1ElevatorButton:
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .basement
	elevator .Floors1
	jump .cont
.basement
	elevator .Floors2
.cont
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
.Done
	end

.Floors1:
	db 5 ; floors
	elevfloor _1F, 3, LUSTER_SKYSCRAPER_1F
	elevfloor _2F, 1, LUSTER_SKYSCRAPER_2F
	elevfloor _3F, 1, LUSTER_SKYSCRAPER_3F
	elevfloor _4F, 1, LUSTER_SKYSCRAPER_4F
	elevfloor _5F, 1, LUSTER_SKYSCRAPER_5F
	db -1 ; end
	
.Floors2:
	db 6 ; floors
	elevfloor _B1F, 1, LUSTER_SKYSCRAPER_B1F
	elevfloor _1F, 3, LUSTER_SKYSCRAPER_1F
	elevfloor _2F, 1, LUSTER_SKYSCRAPER_2F
	elevfloor _3F, 1, LUSTER_SKYSCRAPER_3F
	elevfloor _4F, 1, LUSTER_SKYSCRAPER_4F
	elevfloor _5F, 1, LUSTER_SKYSCRAPER_5F
	db -1 ; end
