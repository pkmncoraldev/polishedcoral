MtOnwaLowerCliff_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 20, 2, MT_ONWA_2F
	warp_def 17, 6, 2, DAYBREAK_GROTTO_2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	cuttree_event 13,  7, EVENT_MT_ONWA_LOWER_CLIFF_CUT_TREE_1
	cuttree_event  6, 15, EVENT_MT_ONWA_LOWER_CLIFF_CUT_TREE_2
