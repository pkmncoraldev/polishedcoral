LusterMallBackRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LusterMallBackRoomCallback

	db 3 ; warp events
	warp_def 12,  2, 23, LUSTER_MALL
	warp_def 13,  2, 24, LUSTER_MALL
	warp_def 1, 1, 7, LUSTER_CITY_SHOPPING

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

LusterMallBackRoomCallback:
	checkevent EVENT_MIDDLE_PART_TIME_JOB
	iftrue .skip
	domaptrigger LUSTER_CITY_SHOPPING, $2
.skip
	return