BrilloTown_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrilloTownTrigger0
	scene_script BrilloTownTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 19, 21, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_MALL_SIGN, 11, 24, SPRITEMOVEDATA_PC_SIGN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, NULL, -1

	
BrilloTownTrigger0:
	end
	
BrilloTownTrigger1:
	priorityjump JustRodeBoatBrillo
	end
	
JustRodeBoatBrillo:
	special Special_StopRunning
	special Special_StopLandmarkTimer
	opentext
	writetext BrilloJustRodeBoatText
	waitbutton
	closetext
;	applymovement SUNBEAM_NPC4, Movement_SunbeamBoatmanLeave
	playsound SFX_EXIT_BUILDING
;	disappear SUNBEAM_NPC4
	waitsfx
	special Special_StartLandmarkTimer
	waitsfx
	setevent EVENT_BRILLO_BOATMAN
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_GRANNY
	dotrigger $0
	end
	
BrilloJustRodeBoatText:
	text "TEXT"
	done