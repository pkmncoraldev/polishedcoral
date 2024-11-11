DesertWastelandOasis_MapScriptHeader:
	db 3 ; scene scripts
	scene_script Route18NorthTrigger0
	scene_script Route18NorthTrigger1
	scene_script Route18NorthTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DesertWastelandOasisCallback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	tapeball_event  4, 13, MUSIC_OASIS, 2, EVENT_MUSIC_OASIS
	fruittree_event 10,  7, FRUITTREE_OASIS_1, LEPPA_BERRY
	fruittree_event  3,  8, FRUITTREE_OASIS_2, LUM_BERRY
	fruittree_event 19, 10, FRUITTREE_OASIS_3, SITRUS_BERRY
	fruittree_event 11, 14, FRUITTREE_OASIS_4, FIGY_BERRY

	
DesertWastelandOasisCallback:
	checkevent EVENT_SANDSTORM_HAPPENING
	iffalse .end
	dotrigger $2
.end
	return