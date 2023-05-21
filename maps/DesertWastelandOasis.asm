DesertWastelandOasis_MapScriptHeader:
	db 3 ; scene scripts
	scene_script Route16NorthTrigger0
	scene_script Route16NorthTrigger1
	scene_script Route16NorthTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DesertWastelandOasisCallback

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

	
DesertWastelandOasisCallback:
	checkevent EVENT_SANDSTORM_HAPPENING
	iffalse .end
	dotrigger $2
.end
	return