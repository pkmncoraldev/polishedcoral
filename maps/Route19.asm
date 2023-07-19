Route19_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 17, 29, ROUTE_19_GATE, 1
	warp_event 18, 29, ROUTE_19_GATE, 2

	db 0 ; coord events

	db 0 ; bg events
	
	db 5 ; object events
	itemball_event 18,  9, POTION, 1, EVENT_ROUTE_19_POKE_BALL
	cuttree_event 12, 23, EVENT_ROUTE_19_CUT_TREE
	fruittree_event 13, 22, FRUITTREE_ROUTE_19_1, ORAN_BERRY
	fruittree_event  8, 24, FRUITTREE_ROUTE_19_2, PERSIM_BERRY
	fruittree_event  7, 22, FRUITTREE_ROUTE_19_3, SITRUS_BERRY
	
	const_def 1 ; object constants
	const ROUTE_19_POKE_BALL
	const ROUTE_19_CUT_TREE
	const ROUTE_19_BERRY_TREE_1
	const ROUTE_19_BERRY_TREE_2
	const ROUTE_19_BERRY_TREE_3
	