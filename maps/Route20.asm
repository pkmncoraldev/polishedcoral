Route20_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 17, 29, ROUTE_20_GATE, 1
	warp_event 18, 29, ROUTE_20_GATE, 2

	db 0 ; coord events

	db 0 ; bg events
	
	db 5 ; object events
	itemball_event 18,  9, POTION, 1, EVENT_ROUTE_20_POKE_BALL
	cuttree_event 12, 23, EVENT_ROUTE_20_CUT_TREE
	fruittree_event 13, 22, FRUITTREE_ROUTE_20_1, ORAN_BERRY
	fruittree_event  8, 24, FRUITTREE_ROUTE_20_2, PERSIM_BERRY
	fruittree_event  7, 22, FRUITTREE_ROUTE_20_3, SITRUS_BERRY
	
	const_def 1 ; object constants
	const ROUTE_20_POKE_BALL
	const ROUTE_20_CUT_TREE
	const ROUTE_20_BERRY_TREE_1
	const ROUTE_20_BERRY_TREE_2
	const ROUTE_20_BERRY_TREE_3
	