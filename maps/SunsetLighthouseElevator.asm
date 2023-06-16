SunsetLighthouseElevator_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  1,  3, SUNSET_LIGHTHOUSE, -1
	warp_event  2,  3, SUNSET_LIGHTHOUSE, -1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, SIGNPOST_READ, SunsetLighthouseElevatorButton

	db 0 ; object events

SunsetLighthouseElevatorButton:
	opentext
	elevator .Floors
	closetext
	iffalse .Done
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	setevent EVENT_SUNSET_LIGHTHOUSE_UNLOCKED
.Done
	end

.Floors:
	db 3 ; floors
	elevfloor _B1F, 2, SUNSET_LIGHTHOUSE_BASEMENT
	elevfloor _1F, 3, SUNSET_LIGHTHOUSE
	elevfloor _2F, 1, SUNSET_LIGHTHOUSE_TOP
	db -1 ; end
