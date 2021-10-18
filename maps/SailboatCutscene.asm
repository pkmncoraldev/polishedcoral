SailboatCutscene_MapScriptHeader:
	db 1 ; scene scripts
	scene_script SailboatCutsceneTrigger0

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  0,  0, ROUTE_1, 1
	warp_event 12,  0, ROUTE_1, 1

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  7,  1, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_BOTTOM, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  0, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP_RIGHT, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  0, SPRITE_SAILBOAT, SPRITEMOVEDATA_SAILBOAT_TOP, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  7,  1, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_UP_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  1, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_DOWN_SOLID, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6,  0, SPRITE_SAILBOAT, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	const_def 1 ; object constants
	const SAILBOAT_CUTSCENE_BOAT_R_1
	const SAILBOAT_CUTSCENE_BOAT_R_2
	const SAILBOAT_CUTSCENE_BOAT_L_1
	const SAILBOAT_CUTSCENE_BOAT_L_2
	const SAILBOAT_CUTSCENE_BOAT_L_3
	const SAILBOAT_CUTSCENE_BOAT_L_4
	
	
SailboatCutsceneTrigger0:
	playmapmusic
	checkevent EVENT_SAILBOAT_LEFT
	iftrue .left
	disappear SAILBOAT_CUTSCENE_BOAT_L_1
	disappear SAILBOAT_CUTSCENE_BOAT_L_2
	disappear SAILBOAT_CUTSCENE_BOAT_L_3
	disappear SAILBOAT_CUTSCENE_BOAT_L_4
	applymovement PLAYER, Movement_SailboatCutsceneRight
	clearevent EVENT_DONT_SCROLL_OW
	clearevent EVENT_SAILBOAT_LEFT
	special Special_FadeOutMusic
	jump .find_destination
.left
	disappear SAILBOAT_CUTSCENE_BOAT_R_1
	disappear SAILBOAT_CUTSCENE_BOAT_R_2
	applymovement PLAYER, Movement_SailboatCutsceneLeft
	clearevent EVENT_DONT_SCROLL_OW
	clearevent EVENT_SAILBOAT_LEFT
.find_destination
	checkevent EVENT_BOAT_GOING_TO_SUNSET
	iftrue .sunset
	checkevent EVENT_BOAT_GOING_TO_LAKE_L
	iftrue .lakeL
	checkevent EVENT_BOAT_GOING_TO_LAKE_R
	iftrue .lakeR
	checkevent EVENT_BOAT_GOING_TO_SUNBEAM
	iftrue .sunbeam
	checkevent EVENT_BOAT_GOING_TO_SHIMMER
	iftrue .shimmer
	checkevent EVENT_BOAT_GOING_TO_BRILLO
	iftrue .brillo

.sunset
	clearevent EVENT_BOAT_GOING_TO_SUNSET
	domaptrigger SUNSET_BAY, $3
	special FadeOutPalettes
	warpfacing DOWN, SUNSET_BAY, 29, 28
	end
.lakeL
	clearevent EVENT_BOAT_GOING_TO_LAKE_L
	domaptrigger LAKE_ONWA, $2
	special FadeOutPalettes
	warpfacing LEFT, LAKE_ONWA, $18, $19
	end
.lakeR
	clearevent EVENT_BOAT_GOING_TO_LAKE_R
	domaptrigger LAKE_ONWA, $1
	special FadeOutPalettes
	warpfacing RIGHT, LAKE_ONWA, $27, $1f
	end
.sunbeam
	clearevent EVENT_BOAT_GOING_TO_SUNBEAM
	domaptrigger SUNBEAM_ISLAND, $1
	special FadeOutPalettes
	warpfacing UP, SUNBEAM_ISLAND, 7, 50
	end
.shimmer
	clearevent EVENT_BOAT_GOING_TO_SHIMMER
	domaptrigger SHIMMER_HARBOR, $1
	special FadeOutPalettes
	warpfacing LEFT, SHIMMER_HARBOR, 15, 8
	end
.brillo
	clearevent EVENT_BOAT_GOING_TO_BRILLO
	domaptrigger BRILLO_TOWN, $1
	special FadeOutPalettes
	warpfacing UP, BRILLO_TOWN, 17, 25
	end
	
Movement_SailboatCutsceneRight:
	step_sleep 50
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_sleep 200
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_sleep 50
	step_end
	
Movement_SailboatCutsceneLeft:
	step_sleep 50
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_sleep 200
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	slow_step_right
	step_sleep 50
	step_end