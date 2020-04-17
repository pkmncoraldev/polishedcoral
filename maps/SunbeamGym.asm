SunbeamGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 25,  4, 3, SUNBEAM_ISLAND
	warp_def 25,  5, 12, SUNBEAM_ISLAND
	warp_def  5, 12, 1, SUNBEAM_GYM_CAVE

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	cuttree_event  4,  9, EVENT_SUNBEAM_GYM_CUT_TREE_1
	cuttree_event 24,  5, EVENT_SUNBEAM_GYM_CUT_TREE_2
	cuttree_event 25, 18, EVENT_SUNBEAM_GYM_CUT_TREE_3
	
	const_def 1 ; object constants
	const SUNBEAM_GYM_TREE_1
	const SUNBEAM_GYM_TREE_2
	const SUNBEAM_GYM_TREE_3
