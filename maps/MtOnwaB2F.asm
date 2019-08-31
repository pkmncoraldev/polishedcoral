MtOnwaB2F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 23, 39, 6, MT_ONWA_B1F
	warp_def 7, 11, 7, MT_ONWA_B1F
	warp_def 23,  3, 1, MT_ONWA_B3F
	warp_def  7, 10, 4, MT_ONWA_B3F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 2, 25, SIGNPOST_ITEM + REVIVE, EVENT_MT_ONWA_B2F_HIDDEN_REVIVE

	db 0 ; object events
