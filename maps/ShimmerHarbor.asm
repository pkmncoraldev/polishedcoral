ShimmerHarbor_MapScriptHeader:
	db 2 ; scene scripts
	scene_script ShimmerHarborTrigger0
	scene_script ShimmerHarborTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 17, 19, SHIMMER_BOAT_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	signpost 15,  7, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_HARBOR_HIDDEN_BOTTLE_CAP_1
	signpost 15, 17, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_HARBOR_HIDDEN_BOTTLE_CAP_2

	db 9 ; object events
	object_event 14,  8, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, EVENT_SHIMMER_BOATMAN
	object_event 12, 12, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 11, 12, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 11,  8, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 10,  8, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 15,  6, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 14,  6, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_POKEMANIAC, 22, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerHarborNPC, -1
	person_event SPRITE_INVISIBLE, 19, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerHarborLockedDoor, EVENT_SHIMMER_BOAT_GUY_AT_WORK

	const_def 1 ; object constants
	const SHIMMER_BOAT_MAN
	
ShimmerHarborTrigger0:
	end
	
ShimmerHarborTrigger1:
	priorityjump JustRodeBoatShimmer
	end
	
ShimmerHarborNPC:
	checkevent EVENT_SHIMMER_BOAT_GUY_AT_WORK
	iffalse .not_here
	jumptextfaceplayer ShimmerHarborNPCText1
.not_here
	jumptextfaceplayer ShimmerHarborNPCText2
	
ShimmerHarborNPCText1:
	text "The guy that runs"
	line "the BOAT HOUSE"
	cont "finally returned."
	
	para "About time!"
	
	para "I have places to"
	line "be!"
	done
	
ShimmerHarborNPCText2:
	text "The guy that runs"
	line "the BOAT HOUSE is"
	cont "gone."
	
	para "I've been here for"
	line "way longer than"
	cont "five minutes…"
	
	para "I bet that bum is"
	line "off stuffing his"
	cont "face somewhere!"
	done
	
ShimmerHarborLockedDoor:
	jumptext ShimmerHarborLockedDoorText
	
ShimmerHarborLockedDoorText:
	text "Closed."
	
	para "Back in five"
	line "minutes."
	done
	
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
	line "PORT SHIMMER."
	
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