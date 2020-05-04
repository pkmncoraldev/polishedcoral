SpookyForest4_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 0 ; warp events

	db 4 ; coord events
	coord_event  0,  6, 0, SpookyForestReset
	coord_event  0,  7, 0, SpookyForestReset
	coord_event  7, 13, 0, SpookyForestReset
	coord_event  6, 13, 0, SpookyForestReset

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_CHILD,  2, 20, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAVED_BIKESHOP_OWNERS_SON
