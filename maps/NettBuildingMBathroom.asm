NettBuildingMBathroom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script NettBuildingMBathroomTrigger0
	scene_script NettBuildingMBathroomTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuildingMBathroomCallback

	db 2 ; warp events
	warp_event  3,  7, NETT_BUILDING_1F, 5
	warp_event  4,  7, NETT_BUILDING_1F, 5

	db 0 ; coord events

	db 5 ; bg events
	signpost 1, 1, SIGNPOST_READ, NettBuildingMBathroomDoor1
	signpost 3, 1, SIGNPOST_READ, NettBuildingMBathroomDoor2
	signpost  1,  0, SIGNPOST_READ, NettBuildingMBathroomToilet1
	signpost 3, 0, SIGNPOST_READ, NettBuildingMBathroomToilet2
	bg_event  5,  5, SIGNPOST_ITEM + BLACK_SLUDGE, EVENT_NETT_BATHROOM_HIDDEN_ITEM

	db 5 ; object events
	person_event SPRITE_GENTLEMAN,  4,  4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, NettBuildingMBathroom_NPC_1, -1
	person_event SPRITE_SITTING_BIRD_KEEPER,  3,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NettBuildingMBathroom_NPC_2, EVENT_PLAYER_IS_FEMALE
	person_event SPRITE_POKEMANIAC,  5,  1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NettBuildingMBathroom_NPC_3, EVENT_PLAYER_IS_FEMALE
	person_event SPRITE_OFFICER,  1,  4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingFBathroom_NPC_4, EVENT_PLAYER_IS_FEMALE
	person_event SPRITE_CHILD,  6,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, NettBuildingFBathroom_NPC_2, EVENT_PLAYER_IS_FEMALE
	
	const_def 1 ; object constants
	const NETT_BATHROOM_M_NPC_1
	const NETT_BATHROOM_M_NPC_2
	const NETT_BATHROOM_M_NPC_3
	const NETT_BATHROOM_M_NPC_4
	const NETT_BATHROOM_M_NPC_5
	
	
NettBuildingMBathroomTrigger0:
	checkevent EVENT_PLAYER_IS_MALE
	iftrue .end
	playsound SFX_PAY_DAY
	spriteface NETT_BATHROOM_M_NPC_1, DOWN
	showemote EMOTE_SHOCK, NETT_BATHROOM_M_NPC_1, 15
	applymovement NETT_BATHROOM_M_NPC_1, Movement_NettBuildingMBathroom
	opentext
	writetext NettBuildingMBathroom_NPC_1_Text1
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	changeblock $2, $6, $7e
	pause 5
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing DOWN, NETT_BUILDING_1F, $0e, $04
.end
	end
	
NettBuildingMBathroomTrigger1:
	end
	
NettBuildingMBathroomCallback:
	checkevent EVENT_BATHROOM_DOOR_1
	iffalse .skip1
	changeblock $0, $0, $98
.skip1
	checkevent EVENT_BATHROOM_DOOR_2
	iffalse .skip2
	changeblock $0, $2, $97
.skip2
	return
	
NettBuildingMBathroom_NPC_1:
	faceplayer
	opentext
	writetext NettBuildingMBathroom_NPC_1_Text2
	waitbutton
	closetext
	spriteface NETT_BATHROOM_F_NPC_1, RIGHT
	end
	
NettBuildingMBathroom_NPC_2:
	end
	
NettBuildingMBathroom_NPC_3:
	jumptext NettBuildingMBathroom_NPC_3_Text
	
NettBuildingMBathroom_NPC_4:
	jumptextfaceplayer NettBuildingFBathroom_NPC_4_Text
	
NettBuildingMBathroomToilet1:
	applyonemovement PLAYER, slow_step_left
	spriteface PLAYER, RIGHT
	callasm BathroomSeatAsm
	pause 1
	changeblock $0, $0, $1a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitbuttonseat
	closetext
	changeblock $0, $0, $98
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitsfx
	playsound SFX_JUMP_OVER_LEDGE
	callasm BathroomSeatGetUpAsm
	applyonemovement PLAYER, slow_step_right
	playsound SFX_WHIRLWIND
	end
	
NettBuildingMBathroomToilet2:
	applyonemovement PLAYER, slow_step_left
	spriteface PLAYER, RIGHT
	callasm BathroomSeatAsm
	pause 1
	changeblock $0, $2, $14
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitbuttonseat
	closetext
	changeblock $0, $2, $97
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitsfx
	playsound SFX_JUMP_OVER_LEDGE
	callasm BathroomSeatGetUpAsm
	applyonemovement PLAYER, slow_step_right
	playsound SFX_WHIRLWIND
	end
	
NettBuildingMBathroomDoor1:
	checkevent EVENT_BATHROOM_DOOR_1
	iftrue NettBuildingMBathroomDoor1Close
	changeblock $0, $0, $98
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	setevent EVENT_BATHROOM_DOOR_1
	end
	
NettBuildingMBathroomDoor1Close:
	changeblock $0, $0, $1a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	clearevent EVENT_BATHROOM_DOOR_1
	end
	
NettBuildingMBathroomDoor2:
	jumptext NettBuildingMBathroomDoor2Text
	checkevent EVENT_BATHROOM_DOOR_2
	iftrue NettBuildingMBathroomDoor2Close
	changeblock $0, $2, $97
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	setevent EVENT_BATHROOM_DOOR_2
	end
	
NettBuildingMBathroomDoor2Close:
	changeblock $0, $2, $14
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	clearevent EVENT_BATHROOM_DOOR_2
	end
	
NettBuildingMBathroomDoor2Text:
	text "Guy: Buzz off!"
	
	line "Someone's in here!"
	done
	
NettBuildingMBathroom_NPC_1_Text1:
	text "Young lady!"

	para "This is the men's"
	line "room!"
	
	para "You aren't allowed"
	line "in here!"
	done
	
NettBuildingMBathroom_NPC_1_Text2:
	text "A gentleman always"
	line "makes sure he's"
	cont "properly groomed."
	
	para "You'd do well to"
	line "remember that."
	done
	
NettBuildingMBathroom_NPC_3_Text:
	text "He seems busy…"
	
	para "Don't be a creep!"
	done
	
Movement_NettBuildingMBathroom:
	step_left
	step_down
	step_down
	step_end
	
BathroomSeatAsm:
	ld a, PLAYER_SITTING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
BathroomSeatGetUpAsm:
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret