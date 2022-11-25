SpookhouseLivingRoom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script SpookhouseLivingRoomTrigger0
	scene_script SpookhouseLivingRoomTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SpookhouseLivingRoomCheckSideDoor

	db 10 ; warp events
	warp_def 11, 4, 1, OLD_MANOR_EXTERIOR
	warp_def 11, 5, 1, OLD_MANOR_EXTERIOR
	warp_def 5, 1, 1, SPOOKHOUSE_DINING_ROOM
	warp_def 5, 8, 3, SPOOKHOUSE_DINING_ROOM
	warp_def 1, 4, 1, SPOOKHOUSE_BEDROOM
	warp_def 1, 5, 2, SPOOKHOUSE_BEDROOM
	warp_def 3, 0, 2, SPOOKHOUSE_HALLWAY_1
	warp_def 2, 0, 2, SPOOKHOUSE_HALLWAY_1
	warp_def  3,  9, 1, ROUTE_1
	warp_def 2, 9, 2, ROUTE_1

	db 2 ; coord events
	xy_trigger 1, 6, 5, 0, SpookHouseGhost1, 0, 0
	xy_trigger 1, 6, 4, 0, SpookHouseGhost2, 0, 0

	db 4 ; bg events
	signpost 3, 10, SIGNPOST_READ, SpookHouseLockedDoor
	signpost 2, 10, SIGNPOST_READ, SpookHouseLockedDoor
	signpost 3, -1, SIGNPOST_IFNOTSET, SpookHouseLockedDoor2
	signpost 2, -1, SIGNPOST_IFNOTSET, SpookHouseLockedDoor2

	db 1 ; object events
	person_event SPRITE_TWIN, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, SpookHouseNPC1, EVENT_SPOOKHOUSE_SAW_GHOST_1

	const_def 1 ; object constants
	const SPOOKHOUSE_NPC1
	
SpookhouseLivingRoomTrigger0:
	end
	
SpookhouseLivingRoomTrigger1:
	end
	
SpookhouseLivingRoomCheckSideDoor:
	setevent EVENT_SPOOKHOUSE_BLOCKER_GONE
	checkevent EVENT_SPOOKHOUSE_DOOR_UNLOCKED
	iftrue .OpenSesame
	return

.OpenSesame:
	changeblock $0, $3, $51
	return

SpookHouseGhost1:
	checkevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	iffalse NoGhost
	checkevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	iffalse NoGhost
	special Special_StopRunning
	moveperson SPOOKHOUSE_NPC1, $5, $2
	applymovement PLAYER, Movement_SpookHouseGhost1_0
	appear SPOOKHOUSE_NPC1
	applymovement SPOOKHOUSE_NPC1, Movement_SpookHouseGhost1_1
	spriteface PLAYER, UP
	applymovement SPOOKHOUSE_NPC1, Movement_SpookHouseGhost1_2
	applymovement SPOOKHOUSE_NPC1, Movement_SpookHouseGhost1_4
	playsound SFX_EXIT_BUILDING
	disappear SPOOKHOUSE_NPC1
	clearevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	dotrigger $0
	end
	
SpookHouseGhost2:
	checkevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	iffalse NoGhost
	checkevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	iffalse NoGhost
	special Special_StopRunning
	applymovement PLAYER, Movement_SpookHouseGhost1_0
	appear SPOOKHOUSE_NPC1
	applymovement SPOOKHOUSE_NPC1, Movement_SpookHouseGhost1_1
	spriteface PLAYER, UP
	applymovement SPOOKHOUSE_NPC1, Movement_SpookHouseGhost1_2
	applymovement SPOOKHOUSE_NPC1, Movement_SpookHouseGhost1_3
	playsound SFX_EXIT_BUILDING
	disappear SPOOKHOUSE_NPC1
	clearevent EVENT_SPOOKHOUSE_GHOST_WILL_APPEAR
	dotrigger $0
	end
	
NoGhost:
	end
	
SpookHouseNPC1:
	end
	
SpookHouseLockedDoor:
	jumptext SpookHouseLockedDoorText
	
SpookHouseLockedDoor2:
	dw EVENT_SPOOKHOUSE_DOOR_UNLOCKED
	checkitem OLD_KEY
	iftrue .unlockdoor
	jumptext SpookHouseLockedDoorText2
	
.unlockdoor:
	opentext
	writetext SpookHouseUnlockDoorText
	yesorno
	iffalse SpookHouseDontUnlockDoor
	closetext
	changeblock $0, $3, $51
	setevent EVENT_SPOOKHOUSE_DOOR_UNLOCKED
	pause 7
	playsound SFX_WALL_OPEN
	pause 14
	opentext
	writetext SpookHouseLockedDoor2Text
	waitbutton
	closetext
	end
	
SpookHouseDontUnlockDoor:
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
Movement_SpookHouseGhost1_0:
	step_sleep 48
	step_end
	
Movement_SpookHouseGhost1_1:
	step_sleep 96
	step_end
	
Movement_SpookHouseGhost1_2:
	step_sleep 32
	step_end
	
Movement_SpookHouseGhost1_3:
	set_sliding
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	remove_sliding
	step_end
	
Movement_SpookHouseGhost1_4:
	set_sliding
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	remove_sliding
	step_end
	
SpookHouseLockedDoorText:
	text "It seems to be"
	line "locked from the"
	cont "other side."
	done
	
SpookHouseLockedDoorText2:
	text "It's locked."
	
	para "There might be"
	line "a key somewhere"
	cont "nearby."
	done
	
SpookHouseLockedDoor2Text:
	text "The door is un-"
	line "locked."
	done
	
SpookHouseUnlockDoorText:
	text "Looks like your"
	line "key works on this"
	cont "door."
	
	para "Unlock the door?"
	done