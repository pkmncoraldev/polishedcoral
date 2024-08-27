ShimmerHarbor_MapScriptHeader:
	db 3 ; scene scripts
	scene_script ShimmerHarborTrigger0
	scene_script ShimmerHarborTrigger1
	scene_script ShimmerHarborTrigger2

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 17, 19, SHIMMER_BOAT_HOUSE, 1

	db 0 ; coord events

	db 26 ; bg events
	signpost 17, 11, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_HARBOR_HIDDEN_BOTTLE_CAP_1
	signpost 15, 17, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_SHIMMER_HARBOR_HIDDEN_BOTTLE_CAP_2
	signpost 17,  7, SIGNPOST_ITEM + IRON, EVENT_SHIMMER_HARBOR_HIDDEN_ITEM
	signpost 20, 18, SIGNPOST_READ, ShimmerBoatHouseSign
	signpost 11, 11, SIGNPOST_READ, ShimmerSailboat
	signpost 11, 12, SIGNPOST_READ, ShimmerSailboat
	signpost  7, 10, SIGNPOST_READ, ShimmerSailboat
	signpost  7, 11, SIGNPOST_READ, ShimmerSailboat
	signpost  5, 14, SIGNPOST_READ, ShimmerSailboat
	signpost  5, 15, SIGNPOST_READ, ShimmerSailboat
	signpost 10, 11, SIGNPOST_READ, ShimmerSailboat
	signpost 10, 12, SIGNPOST_READ, ShimmerSailboat
	signpost 15,  6, SIGNPOST_READ, ShimmerContainers2
	signpost 16,  5, SIGNPOST_READ, ShimmerContainers2
	signpost 17,  5, SIGNPOST_READ, ShimmerContainers2
	signpost 17,  8, SIGNPOST_READ, ShimmerContainers2
	signpost 17,  9, SIGNPOST_READ, ShimmerContainers2
	signpost 18,  8, SIGNPOST_READ, ShimmerContainers2
	signpost 18,  4, SIGNPOST_READ, ShimmerContainers2
	signpost 18,  7, SIGNPOST_READ, ShimmerContainers
	signpost 22,  6, SIGNPOST_READ, ShimmerContainers
	signpost 22, 10, SIGNPOST_READ, ShimmerContainers
	signpost 20, 11, SIGNPOST_READ, ShimmerContainers
	signpost 20,  5, SIGNPOST_READ, ShimmerContainers
	signpost 16,  7, SIGNPOST_READ, ShimmerContainers3
	signpost 22,  7, SIGNPOST_READ, ShimmerContainers

	db 13 ; object events
	object_event 14,  6, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, EVENT_SHIMMER_BOATMAN
	object_event 12, 10, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 11, 10, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 11,  6, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 10,  6, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 15,  4, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	object_event 14,  4, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1
	person_event SPRITE_POKEMANIAC, 22, 15, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ShimmerHarborNPC1, -1
	person_event SPRITE_INVISIBLE, 19, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ShimmerHarborLockedDoor, EVENT_SHIMMER_BOAT_GUY_AT_WORK
	person_event SPRITE_SAILOR,  8, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerHarborNPC2, -1
	person_event SPRITE_SAILOR, 20,  6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ShimmerHarborNPC3, -1
	itemball_event  9, 18, LURE_BALL, 1, EVENT_SHIMMER_HARBOR_POKE_BALL
	itemball_event  6, 16, DIRE_HIT, 1, EVENT_SHIMMER_HARBOR_POKE_BALL_2

	const_def 1 ; object constants
	const SHIMMER_BOAT_MAN
	
ShimmerHarborTrigger0:
	end
	
ShimmerHarborTrigger1:
	priorityjump JustRodeBoatShimmer
	end
	
ShimmerHarborTrigger2:
	end
	
ShimmerBoatHouseSign:
	jumptext ShimmerBoatHouseSignText
	
ShimmerBoatHouseSignText:
	text "PORT SHIMMER"
	line "BOAT HOUSE"
	
	para "Inquire inside"
	line "for a ride."
	done
	
ShimmerContainers:
	jumptext ShimmerContainersText
	
ShimmerContainersText:
	text "A shipping crate."
	done
	
ShimmerContainers2:
	jumptext ShimmerContainersText2
	
ShimmerContainersText2:
	text "A stack of"
	line "shipping crates."
	done
	
ShimmerContainers3:
	jumptext ShimmerContainersText3
	
ShimmerContainersText3:
	text "A green shipping"
	line "crate."
	done
	
ShimmerHarborNPC1:
	checkevent EVENT_SHIMMER_BOAT_GUY_AT_WORK
	iffalse .not_here
	jumptextfaceplayer ShimmerHarborNPC1Text1
.not_here
	jumptextfaceplayer ShimmerHarborNPC1Text2
	
ShimmerHarborNPC2:
	jumptextfaceplayer ShimmerHarborNPC2Text
	
ShimmerHarborNPC3:
	jumptextfaceplayer ShimmerHarborNPC3Text
	
ShimmerHarborNPC1Text1:
	text "The guy that runs"
	line "the BOAT HOUSE"
	cont "finally returned."
	
	para "About time!"
	
	para "I have places to"
	line "be!"
	done
	
ShimmerHarborNPC1Text2:
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
	
ShimmerHarborNPC2Text:
	text "I've been out at"
	line "sea for so long."
	
	para "I miss the boat's"
	line "constant rocking."

	para "Without it, I"
	line "think I'm getting"
	cont "landsick!"
	
	para "Is that even a"
	line "thing?"
	done
	
ShimmerHarborNPC3Text:
	text "Stacking shipping"
	line "crates is hard"
	cont "work, but someone's"
	cont "gotta do it!"
	done
	
ShimmerSailboat:
	jumptext ShimmerSailboatText
	
ShimmerSailboatText:
	text "It's a sailboat."
	
	para "It's seen some use,"
	line "but it's still in"
	cont "good shape."
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
	text "Here we are,<WAIT_S>"
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