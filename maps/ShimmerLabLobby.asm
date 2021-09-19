ShimmerLabLobby_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  5, SHIMMER_CITY, 1
	warp_event  4,  5, SHIMMER_CITY, 1
	warp_event  7,  3, SHIMMER_LAB_RESEARCH_ROOM, 1
	warp_event 11,  3, SHIMMER_LAB_EXPERIMENTAL_LAB, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
