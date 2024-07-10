ObscuraCity_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 12,  6, 3, OBSCURA_GATE
	warp_def 13,  6, 4, OBSCURA_GATE

	db 34 ; coord events
	coord_event 22, 12, 0, ObscuraMakeYellow
	coord_event 22, 13, 0, ObscuraMakeYellow
	coord_event 22, 14, 0, ObscuraMakeYellow
	coord_event 32, 12, 0, ObscuraMakeYellow
	coord_event 33, 12, 0, ObscuraMakeYellow
	coord_event 34, 12, 0, ObscuraMakeYellow
	coord_event 35, 12, 0, ObscuraMakeYellow
	coord_event 32, 13, 0, ObscuraMakeYellow
	coord_event 33, 13, 0, ObscuraMakeYellow
	coord_event 34, 13, 0, ObscuraMakeYellow
	coord_event 35, 13, 0, ObscuraMakeYellow
	coord_event 23, 12, 0, ObscuraMakeYellow
	coord_event 23, 13, 0, ObscuraMakeYellow
	coord_event 23, 14, 0, ObscuraMakeYellow
	coord_event 30, 14, 0, ObscuraMakeYellow
	coord_event 30, 13, 0, ObscuraMakeYellow
	coord_event 30, 12, 0, ObscuraMakeYellow
	coord_event 31, 14, 0, ObscuraMakeYellow
	coord_event 31, 13, 0, ObscuraMakeYellow
	coord_event 31, 12, 0, ObscuraMakeYellow
	coord_event 20, 12, 1, ObscuraMakeBlue
	coord_event 21, 12, 1, ObscuraMakeBlue
	coord_event 20, 13, 1, ObscuraMakeBlue
	coord_event 21, 13, 1, ObscuraMakeBlue
	coord_event 20, 14, 1, ObscuraMakeBlue
	coord_event 21, 14, 1, ObscuraMakeBlue
	coord_event 32, 14, 1, ObscuraMakeBlue
	coord_event 33, 14, 1, ObscuraMakeBlue
	coord_event 34, 14, 1, ObscuraMakeBlue
	coord_event 35, 14, 1, ObscuraMakeBlue
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