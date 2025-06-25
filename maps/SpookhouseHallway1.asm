SpookhouseHallway1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  3,  9, 7, SPOOKHOUSE_LIVING_ROOM
	warp_def  2,  9, 8, SPOOKHOUSE_LIVING_ROOM
	warp_def  1,  4, 1, SPOOKHOUSE_LIVING_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SCARY_PAINTING,  1,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, SpookHousePainting, -1