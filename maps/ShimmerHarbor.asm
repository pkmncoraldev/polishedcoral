ShimmerHarbor_MapScriptHeader:
	db 2 ; scene scripts
	scene_script ShimmerHarborTrigger0
	scene_script ShimmerHarborTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 17, 19, SHIMMER_BOAT_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event 14,  8, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, EVENT_SHIMMER_BOATMAN
	object_event 11, 12, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 10, 12, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 12,  8, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 11,  8, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 15,  6, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 14,  6, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const SHIMMER_BOAT_MAN
	
ShimmerHarborTrigger0:
	end
	
ShimmerHarborTrigger1:
	priorityjump JustRodeBoatShimmer
	end
	
JustRodeBoatShimmer:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext ShimmerJustRodeBoatText
	waitbutton
	closetext
	applymovement SHIMMER_BOAT_MAN, Movement_ShimmerBoatmanLeave
	disappear SHIMMER_BOAT_MAN
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_SHIMMER_BOATMAN
	dotrigger $0
	end
	
ShimmerJustRodeBoatText:
	text "Here we are,"
	line "SHIMMER CITY."
	
	para "Thanks for riding."
	
	para "Come again."
	done
	
Movement_ShimmerBoatmanLeave:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end