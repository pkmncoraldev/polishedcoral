NettBuildingFBathroom_MapScriptHeader:
	db 2 ; scene scripts
	scene_script NettBuildingFBathroomTrigger0
	scene_script NettBuildingFBathroomTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, NettBuildingFBathroomCallback

	db 2 ; warp events
	warp_event  1,  7, NETT_BUILDING_1F, 6
	warp_event  2,  7, NETT_BUILDING_1F, 6

	db 0 ; coord events

	db 7 ; bg events
	signpost  1,  4, SIGNPOST_READ, NettBuildingFBathroomDoor1
	signpost  3,  4, SIGNPOST_READ, NettBuildingFBathroomDoor2
	signpost  5,  4, SIGNPOST_READ, NettBuildingFBathroomDoor3
	signpost  1,  5, SIGNPOST_READ, NettBuildingFBathroomToilet1
	signpost  3,  5, SIGNPOST_READ, NettBuildingFBathroomToilet2
	signpost  5,  5, SIGNPOST_READ, NettBuildingFBathroomToilet3
	bg_event  0,  5, SIGNPOST_ITEM + BLACK_SLUDGE, EVENT_NETT_BATHROOM_HIDDEN_ITEM

	db 4 ; object events
	person_event SPRITE_BEAUTY,  4,  1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, NettBuildingFBathroom_NPC_1, -1
	person_event SPRITE_CUTE_GIRL,  6,  0, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, NettBuildingFBathroom_NPC_2, EVENT_PLAYER_IS_MALE
	person_event SPRITE_SITTING_POKEFANF,  1,  5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, NettBuildingFBathroom_NPC_3, EVENT_PLAYER_IS_MALE
	person_event SPRITE_RECEPTIONIST,  2,  1, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NettBuildingFBathroom_NPC_4, EVENT_PLAYER_IS_MALE

	const_def 1 ; object constants
	const NETT_BATHROOM_F_NPC_1
	const NETT_BATHROOM_F_NPC_2
	const NETT_BATHROOM_F_NPC_3
	const NETT_BATHROOM_F_NPC_4
	
	
NettBuildingFBathroomTrigger0:
	checkevent EVENT_PLAYER_IS_FEMALE
	iftrue .end
	playsound SFX_PAY_DAY
	spriteface NETT_BATHROOM_F_NPC_1, DOWN
	showemote EMOTE_SHOCK, NETT_BATHROOM_F_NPC_1, 15
	applymovement NETT_BATHROOM_F_NPC_1, Movement_NettBuildingFBathroom
	opentext
	writetext NettBuildingFBathroom_NPC_1_Text1
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	changeblock $0, $6, $7e
	pause 5
	special FadeOutPalettes
	playsound SFX_EXIT_BUILDING
	waitsfx
	warpfacing DOWN, NETT_BUILDING_1F, $10, $04
.end
	end
	
NettBuildingFBathroomTrigger1:
	end
	
NettBuildingFBathroomCallback:
	checkevent EVENT_BATHROOM_DOOR_3
	iffalse .skip1
	changeblock $4, $0, $99
.skip1
	checkevent EVENT_BATHROOM_DOOR_4
	iffalse .skip2
	changeblock $4, $2, $9a
.skip2
	checkevent EVENT_BATHROOM_DOOR_5
	iffalse .skip3
	changeblock $4, $4, $9a
.skip3
	return
	
NettBuildingFBathroom_NPC_1:
	opentext
	writetext NettBuildingFBathroom_NPC_1_Text2
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, NETT_BATHROOM_F_NPC_1, 15
	faceplayer
	opentext
	writetext NettBuildingFBathroom_NPC_1_Text3
	waitbutton
	closetext
	spriteface NETT_BATHROOM_F_NPC_1, LEFT
	end
	
NettBuildingFBathroom_NPC_2:
	checkevent EVENT_NETT_BATHROOM_HIDDEN_ITEM
	iftrue .got_item
	jumptextfaceplayer NettBuildingFBathroom_NPC_2_Text1
.got_item
	jumptextfaceplayer NettBuildingFBathroom_NPC_2_Text2
	
NettBuildingFBathroom_NPC_3:
	end
	
NettBuildingFBathroom_NPC_4:
	faceplayer
	opentext
	writetext NettBuildingFBathroom_NPC_4_Text
	waitbutton
	closetext
	spriteface NETT_BATHROOM_F_NPC_4, LEFT
	end
	
NettBuildingFBathroomToilet1:
	applyonemovement PLAYER, slow_step_right
	spriteface PLAYER, LEFT
	callasm BathroomSeatAsm
	pause 1
	changeblock $4, $0, $1e
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitbuttonseat
	closetext
	changeblock $4, $0, $99
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitsfx
	playsound SFX_JUMP_OVER_LEDGE
	callasm BathroomSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	playsound SFX_WHIRLWIND
	end
	
NettBuildingFBathroomToilet2:
	applyonemovement PLAYER, slow_step_right
	spriteface PLAYER, LEFT
	callasm BathroomSeatAsm
	pause 1
	changeblock $4, $2, $32
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitbuttonseat
	closetext
	changeblock $4, $2, $9a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitsfx
	playsound SFX_JUMP_OVER_LEDGE
	callasm BathroomSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	playsound SFX_WHIRLWIND
	end
	
NettBuildingFBathroomToilet3:
	applyonemovement PLAYER, slow_step_right
	spriteface PLAYER, LEFT
	callasm BathroomSeatAsm
	pause 1
	changeblock $4, $4, $32
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitbuttonseat
	closetext
	changeblock $4, $4, $9a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	waitsfx
	playsound SFX_JUMP_OVER_LEDGE
	callasm BathroomSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	playsound SFX_WHIRLWIND
	end
	
NettBuildingFBathroomDoor1:
	jumptext NettBuildingFBathroomDoor1Text
	checkevent EVENT_BATHROOM_DOOR_3
	iftrue NettBuildingFBathroomDoor1Close
	changeblock $4, $0, $99
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	setevent EVENT_BATHROOM_DOOR_3
	end
	
NettBuildingFBathroomDoor1Close:
	changeblock $4, $0, $1e
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	clearevent EVENT_BATHROOM_DOOR_3
	end
	
NettBuildingFBathroomDoor2:
	checkevent EVENT_BATHROOM_DOOR_4
	iftrue NettBuildingFBathroomDoor2Close
	changeblock $4, $2, $9a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	setevent EVENT_BATHROOM_DOOR_4
	end
	
NettBuildingFBathroomDoor2Close:
	changeblock $4, $2, $32
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	clearevent EVENT_BATHROOM_DOOR_4
	end
	
NettBuildingFBathroomDoor3:
	checkevent EVENT_BATHROOM_DOOR_5
	iftrue NettBuildingFBathroomDoor3Close
	changeblock $4, $4, $9a
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	setevent EVENT_BATHROOM_DOOR_5
	end
	
NettBuildingFBathroomDoor3Close:
	changeblock $4, $4, $32
	playsound SFX_WALL_OPEN
	callasm GenericFinishBridge
	clearevent EVENT_BATHROOM_DOOR_5
	end

NettBuildingFBathroom_NPC_1_Text1:
	text "Eeek!"
	
	para "This is the lady's"
	line "room!"
	
	para "What are you doing"
	line "in here?"
	done
	
NettBuildingFBathroom_NPC_1_Text2:
	text "Puff… puff…"
	done
	
NettBuildingFBathroom_NPC_1_Text3:
	text "What am I doing?"
	
	para "I'm putting on"
	line "makeup."
	
	para "…And you're"
	line "interrupting me!"
	done
	
NettBuildingFBathroom_NPC_2_Text1:
	text "Someone dropped"
	line "something really"
	cont "nasty in the"
	cont "trashcan…"
	
	para "Yuck!"
	done
	
NettBuildingFBathroom_NPC_2_Text2:
	text "Eww!"
	
	para "That's so gross!"
	
	para "Weirdo…"
	done
	
NettBuildingFBathroom_NPC_4_Text:
	text "I'm on break right"
	line "now."
	
	para "If I hide out in"
	line "the bathroom,"
	
	para "my break will"
	line "never end!"
	done
	
NettBuildingFBathroomDoor1Text:
	text "LADY: Can I help"
	line "you?"
	
	para "This I'm a little"
	line "busy in here!"
	done
	
Movement_NettBuildingFBathroom:
	step_down
	step_down
	step_end
	