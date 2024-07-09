ObscuraCity_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 12,  6, 3, OBSCURA_GATE
	warp_def 13,  6, 4, OBSCURA_GATE

	db 54 ; coord events
	coord_event 22, 10, 0, ObscuraMakeYellow
	coord_event 23, 10, 0, ObscuraMakeYellow
	coord_event 24, 10, 0, ObscuraMakeYellow
	coord_event 25, 10, 0, ObscuraMakeYellow
	coord_event 26, 10, 0, ObscuraMakeYellow
	coord_event 28, 10, 0, ObscuraMakeYellow
	coord_event 29, 10, 0, ObscuraMakeYellow
	coord_event 30, 10, 0, ObscuraMakeYellow
	coord_event 31, 10, 0, ObscuraMakeYellow
	coord_event 32, 10, 0, ObscuraMakeYellow
	coord_event 33, 10, 0, ObscuraMakeYellow
	coord_event 34, 10, 0, ObscuraMakeYellow
	coord_event 35, 10, 0, ObscuraMakeYellow
	coord_event 22, 11, 0, ObscuraMakeYellow
	coord_event 23, 11, 0, ObscuraMakeYellow
	coord_event 24, 11, 0, ObscuraMakeYellow
	coord_event 25, 11, 0, ObscuraMakeYellow
	coord_event 26, 11, 0, ObscuraMakeYellow
	coord_event 27, 11, 0, ObscuraMakeYellow
	coord_event 28, 11, 0, ObscuraMakeYellow
	coord_event 29, 11, 0, ObscuraMakeYellow
	coord_event 30, 11, 0, ObscuraMakeYellow
	coord_event 31, 11, 0, ObscuraMakeYellow
	coord_event 32, 11, 0, ObscuraMakeYellow
	coord_event 33, 11, 0, ObscuraMakeYellow
	coord_event 34, 11, 0, ObscuraMakeYellow
	coord_event 35, 11, 0, ObscuraMakeYellow
	coord_event 20, 12, 1, ObscuraMakeBlue
	coord_event 21, 12, 1, ObscuraMakeBlue
	coord_event 20, 13, 1, ObscuraMakeBlue
	coord_event 21, 13, 1, ObscuraMakeBlue
	coord_event 22, 14, 1, ObscuraMakeBlue
	coord_event 23, 14, 1, ObscuraMakeBlue
	coord_event 24, 14, 1, ObscuraMakeBlue
	coord_event 25, 14, 1, ObscuraMakeBlue
	coord_event 26, 14, 1, ObscuraMakeBlue
	coord_event 27, 14, 1, ObscuraMakeBlue
	coord_event 28, 14, 1, ObscuraMakeBlue
	coord_event 29, 14, 1, ObscuraMakeBlue
	coord_event 30, 14, 1, ObscuraMakeBlue
	coord_event 31, 14, 1, ObscuraMakeBlue
	coord_event 32, 14, 1, ObscuraMakeBlue
	coord_event 33, 14, 1, ObscuraMakeBlue
	coord_event 34, 14, 1, ObscuraMakeBlue
	coord_event 35, 14, 1, ObscuraMakeBlue
	coord_event 24, 15, 1, ObscuraMakeBlue
	coord_event 25, 15, 1, ObscuraMakeBlue
	coord_event 26, 15, 1, ObscuraMakeBlue
	coord_event 27, 15, 1, ObscuraMakeBlue
	coord_event 32, 15, 1, ObscuraMakeBlue
	coord_event 33, 15, 1, ObscuraMakeBlue
	coord_event 34, 15, 1, ObscuraMakeBlue
	coord_event 35, 15, 1, ObscuraMakeBlue

	db 0 ; bg events

	db 0 ; object events

ObscuraMakeYellow:
	setevent EVENT_OBSCURA_WINDOWS_YELLOW
	special Special_UpdatePalsInstant
	dotrigger $1
	end
	
ObscuraMakeBlue:
	clearevent EVENT_OBSCURA_WINDOWS_YELLOW
	special Special_UpdatePalsInstant
	dotrigger $0
	end