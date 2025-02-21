OldManorExterior_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 9, 14, 1, SPOOKHOUSE_LIVING_ROOM
	warp_def 9, 15, 2, SPOOKHOUSE_LIVING_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	tapeball_event  3,  4, MUSIC_EVENTIDE, 1, EVENT_MUSIC_EVENTIDE
