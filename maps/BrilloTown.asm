BrilloTown_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrilloTownTrigger0
	scene_script BrilloTownTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, BrilloTownFlyPoint

	db 6 ; warp events
	warp_event 19, 21, BRILLO_BOAT_HOUSE, 1
	warp_event 17, 15, BRILLO_ROCK_HOUSE, 1
	warp_event 29, 17, BRILLO_TRADE_HOUSE, 1
	warp_event 15,  9, BRILLO_LEGEND_SPEECH_HOUSE, 1
	warp_event 23, 11, BRILLO_POKECENTER, 1
	warp_event 29, 11, BRILLO_MART, 1

	db 0 ; coord events

	db 1 ; bg events
	signpost 17, 15, SIGNPOST_READ, BrilloTownSign

	db 6 ; object events
	object_event 17, 24, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, EVENT_BRILLO_BOATMAN
	object_event 17, 25, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 17, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_UP_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 16, 26, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	object_event 16, 25, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, BrilloSailboat, -1
	person_event SPRITE_MALL_SIGN, 11, 24, SPRITEMOVEDATA_PC_SIGN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NULL, -1

	const_def 1 ; object constants
	const BRILLO_BOAT_MAN
	
	
BrilloTownTrigger0:
	end
	
BrilloTownTrigger1:
	priorityjump JustRodeBoatBrillo
	end
	
BrilloTownFlyPoint:
	setflag ENGINE_FLYPOINT_BRILLO
	return
	
JustRodeBoatBrillo:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext BrilloJustRodeBoatText
	waitbutton
	closetext
	applymovement BRILLO_BOAT_MAN, Movement_BrilloBoatmanLeave
	playsound SFX_EXIT_BUILDING
	disappear BRILLO_BOAT_MAN
	waitsfx
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_BRILLO_BOATMAN
	dotrigger $0
	end
	
BrilloTownSign:
	jumptext BrilloTownSignText
	
BrilloSailboat:
	jumptext BrilloSailboatText
	
BrilloTownSignText:
	text "BRILLO TOWN"
	
	para "The vibrant rose"
	line "of the desert."
	done
	
BrilloSailboatText:
	text "It's a sailboat."
	
	para "It's seen some use,"
	line "but it's still in"
	cont "good shape."
	done
	
BrilloJustRodeBoatText:
	text "Here we are,"
	line "BRILLO TOWN."
	
	para "Thanks for riding."
	
	para "Come again."
	done
	
Movement_BrilloBoatmanLeave:
	step_up
	step_up
	step_right
	step_right
	step_up
	step_end