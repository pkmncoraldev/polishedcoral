SpookhouseHallway1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  3,  9, 7, SPOOKHOUSE_LIVING_ROOM
	warp_def  2,  9, 8, SPOOKHOUSE_LIVING_ROOM
	warp_def  1,  4, 1, SPOOKHOUSE_LIVING_ROOM

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  8, SIGNPOST_READ, SpookHousePainting

	db 0 ; object events
