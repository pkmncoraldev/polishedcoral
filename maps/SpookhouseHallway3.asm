SpookhouseHallway3_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SpookhouseHallway3Trigger0
	scene_script SpookhouseHallway3Trigger1

	db 0 ; callbacks

	db 9 ; warp events
	warp_def 3, 41, 3, SPOOKHOUSE_HALLWAY_1
	warp_def 2, 41, 4, SPOOKHOUSE_HALLWAY_1
	warp_def  3,  0, 9, SPOOKHOUSE_LIVING_ROOM
	warp_def  2,  0, 10, SPOOKHOUSE_LIVING_ROOM
	warp_def 1, 37, 1, SPOOKHOUSE_LIVING_ROOM
	warp_def 1, 29, 1, SPOOKHOUSE_LIVING_ROOM
	warp_def 1, 21, 1, SPOOKHOUSE_TV_ROOM
	warp_def 1, 13, 1, SPOOKHOUSE_LIVING_ROOM
	warp_def 1, 5, 1, SPOOKHOUSE_LIVING_ROOM

	db 0 ; coord events

	db 10 ; bg events
	signpost 1, 38, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 34, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 30, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 26, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 18, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 14, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 10, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 6, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 2, SIGNPOST_READ, SpookHouseDeadLight
	signpost 1, 22, SIGNPOST_READ, SpookHouseFlickerLight

	db 1 ; object events
	person_event SPRITE_TWIN, 2, 40, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_SAW_GHOST_4

	const_def 1 ; object constants
	const SPOOKHOUSE_HALLWAY3_NPC1
	
SpookhouseHallway3Trigger0:
	priorityjump SpookHouseHallwayGhost3
	end
	
SpookhouseHallway3Trigger1:
	clearflag ENGINE_PUNKS_IN_STARGLOW
	end

SpookHouseHallwayGhost3:
	special Special_StopRunning
	applymovement SPOOKHOUSE_HALLWAY3_NPC1, Movement_SpookHouseGhost4
	disappear SPOOKHOUSE_HALLWAY3_NPC1
	wait 16
	setevent EVENT_SPOOKHOUSE_SAW_GHOST_4
	dotrigger $1
	end

Movement_SpookHouseGhost4:
	fix_facing
	set_sliding
	step_sleep 48
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	remove_sliding
	remove_fixed_facing
	step_end
