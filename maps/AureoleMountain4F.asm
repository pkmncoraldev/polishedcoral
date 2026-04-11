AureoleMountain4F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_CMDQUEUE, AureoleMountain4FCallback
	callback MAPCALLBACK_TILES, AureoleMountain4FChangeBlocks

	db 5 ; warp events
	warp_def 39, 17, 2, AUREOLE_MOUNTAIN_OUTSIDE
	warp_def 13, 27, 1, AUREOLE_MOUNTAIN_5F
	warp_def 35, 23, 1, ROUTE_1
	warp_def 33, 25, 1, ROUTE_1
	warp_def 35, 13, 1, ROUTE_1

	db 8 ; coord events
	coord_event 16, 30, 1, AureoleMountain4FBridgeUp
	coord_event 16, 32, 2, AureoleMountain4FBridgeDown
	coord_event 20, 18, 1, AureoleMountain4FBridgeUp
	coord_event 20, 20, 2, AureoleMountain4FBridgeDown
	coord_event 17,  4, 1, AureoleMountain4FBridgeUp
	coord_event 17,  6, 2, AureoleMountain4FBridgeDown
	coord_event 12, 22, 1, AureoleMountain4FBridgeUp
	coord_event 12, 24, 2, AureoleMountain4FBridgeDown

	db 9 ; bg events
	bg_event 24, 22, SIGNPOST_ITEM + HP_UP, EVENT_AUREOLE_MOUNTAIN_4F_HIDDEN_ITEM_1
	bg_event  9, 19, SIGNPOST_ITEM + SERPSPARILLA, EVENT_AUREOLE_MOUNTAIN_4F_HIDDEN_ITEM_2
	bg_event 23, 24, SIGNPOST_ITEM + ULTRA_BALL, EVENT_AUREOLE_MOUNTAIN_4F_HIDDEN_ITEM_3
	signpost 35, 23, SIGNPOST_JUMPTEXT, AureoleMountain4FRedSwitchText
	signpost 33, 25, SIGNPOST_JUMPTEXT, AureoleMountain4FBlueSwitchText
	signpost 35, 13, SIGNPOST_JUMPTEXT, AureoleMountain4FGreenSwitchText
	signpost 32, 25, SIGNPOST_IFNOTSET, AureoleMountain4FRedRock
	signpost 16, 26, SIGNPOST_IFNOTSET, AureoleMountain4FBlueRock
	signpost 32, 12, SIGNPOST_IFNOTSET, AureoleMountain4FGreenRock

	db 14 ; object events
	tmhmball_event 30, 25, TM_SIGNAL_BEAM, EVENT_TM71
	itemball_event 30, 14, SHINY_STONE, 1, EVENT_AUREOLE_MOUNTAIN_4F_ITEM_1
	smashrock_event  8, 22
	person_event SPRITE_HIKER, 20,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_GENERICTRAINER, 1, AureoleMountain4F_Trainer, -1
	person_event SPRITE_FOSSIL_DISPLAYS, 35, 23, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FOSSIL_DISPLAYS, 33, 25, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FOSSIL_DISPLAYS, 35, 13, SPRITEMOVEDATA_TILE_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	strengthboulder_event 23, 33, EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_1
	strengthboulder_event 17, 21, EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_2
	strengthboulder_event 17, 36, EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_3
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AureoleMountain4FStaticBoulder, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AureoleMountain4FStaticBoulder, -1
	person_event SPRITE_BOULDER_ROCK_FOSSIL, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, AureoleMountain4FStaticBoulder, -1
	itemball_event 22, 14, QUICK_BALL, 1, EVENT_AUREOLE_MOUNTAIN_4F_ITEM_2

	
AureoleMountain4FChangeBlocks:
	checkevent EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_1
	iffalse .skip1
	moveperson 11, 23, 35
	changeblock $18, $20, $b3
.skip1
	checkevent EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_2
	iffalse .skip2
	moveperson 12, 25, 33
	changeblock $1a, $10, $02
.skip2
	checkevent EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_3
	iffalse .skip3
	moveperson 13, 13, 35
	changeblock $c, $20, $02
.skip3
	checkscene
	ifequal $2, .changeblocks
	moveperson 1, 30, 25
	return
.changeblocks
	moveperson 1, -5, -5
	changeblock $12, $1c, $ac
	changeblock $14, $1c, $ad
	changeblock $16, $1c, $ad
	changeblock $18, $1c, $ae
	
	changeblock $1c, $18, $ac
	changeblock $1e, $18, $ad
	changeblock $20, $18, $ae
	
	changeblock $c, $a, $ac
	changeblock $e, $a, $ad
	changeblock $10, $a, $ad
	changeblock $12, $a, $ad
	changeblock $14, $a, $ae
	return
	
AureoleMountain4FCallback:
	writecmdqueue .BoulderCmdQueue
	return
	
.BoulderCmdQueue:
	dbw CMDQUEUE_STONETABLE, .BoulderTable ; check if any stones are sitting on a warp
	dw 0 ; filler

.BoulderTable:
;	stonetable	warp num, object num, .script
	stonetable 3, 8, .Boulder_1
	stonetable 4, 9, .Boulder_2
	stonetable 5, 10, .Boulder_3
	db -1 ; end
	
.Boulder_1
	special Special_StopRunning
	refreshscreen
	disappear 11
	moveperson 11, 23, 35
	appear 11
	pause 10
	playsound SFX_WALL_OPEN
	loadvar wCmdQueue, 0
	earthquake 5
	waitsfx
	refreshscreen
	pause 10
	playsound SFX_SUPER_EFFECTIVE
	earthquake 10
	disappear 8
	changeblock $18, $20, $b3
	callasm GenericFinishBridge
	loadvar wCmdQueue, 2
	jumptext RockDestroyedText
	
.Boulder_2
	special Special_StopRunning
	refreshscreen
	disappear 12
	moveperson 12, 25, 33
	appear 12
	pause 10
	playsound SFX_WALL_OPEN
	loadvar wCmdQueue, 0
	earthquake 5
	waitsfx
	refreshscreen
	pause 10
	playsound SFX_SUPER_EFFECTIVE
	earthquake 10
	disappear 9
	changeblock $1a, $10, $02
	callasm GenericFinishBridge
	loadvar wCmdQueue, 2
	jumptext RockDestroyedText
	
.Boulder_3
	special Special_StopRunning
	refreshscreen
	disappear 13
	moveperson 13, 13, 35
	appear 13
	pause 10
	playsound SFX_WALL_OPEN
	loadvar wCmdQueue, 0
	earthquake 5
	waitsfx
	refreshscreen
	pause 10
	playsound SFX_SUPER_EFFECTIVE
	earthquake 10
	disappear 10
	changeblock $c, $20, $02
	callasm GenericFinishBridge
	loadvar wCmdQueue, 2
	jumptext RockDestroyedText
	
RockDestroyedText:
	text "The rock blocking"
	line "the way is gone!"
	done
	
AureoleMountain4FRedSwitchText:
	text "A red switch."
	
	para "Maybe a boulder"
	line "can press it down."
	done
	
AureoleMountain4FBlueSwitchText:
	text "A blue switch."
	
	para "Maybe a boulder"
	line "can press it down."
	done
	
AureoleMountain4FGreenSwitchText:
	text "A green switch."
	
	para "Maybe a boulder"
	line "can press it down."
	done
	
AureoleMountain4FRedRock:
	dw EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_1
	jumptext AureoleMountain4FRedRockText

AureoleMountain4FRedRockText:
	text "A red rock"
	line "blocks the way."
	done

AureoleMountain4FBlueRock:
	dw EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_2
	jumptext AureoleMountain4FBlueRockText

AureoleMountain4FBlueRockText:
	text "A blue rock"
	line "blocks the way."
	done
	
AureoleMountain4FGreenRock:
	dw EVENT_AUREOLE_MOUNTAIN_4F_BOULDER_3
	jumptext AureoleMountain4FGreenRockText

AureoleMountain4FGreenRockText:
	text "A green rock"
	line "blocks the way."
	done
	
AureoleMountain4FStaticBoulder:
	jumptext AureoleMountain4FStaticBoulderText
	
AureoleMountain4FStaticBoulderText:
	text "The boulder is"
	line "holding down the"
	cont "switch."
	done
	
AureoleMountain4FBridgeUp:
	checkspritey 9
	if_equal 28, .boulder_under_bridge_up
	if_not_equal 29, .done_bridge_boulder
;.boulder_under_bridge_down
	disappear 9
	moveperson 9, -5, -5
	appear 9
	clearevent EVENT_BRIDGE_BOULDER_UP
	setevent EVENT_BRIDGE_BOULDER_DOWN
	jump .done_bridge_boulder
.boulder_under_bridge_up
	disappear 9
	moveperson 9, -5, -5
	appear 9
	setevent EVENT_BRIDGE_BOULDER_UP
	clearevent EVENT_BRIDGE_BOULDER_DOWN
.done_bridge_boulder
	moveperson 1, -5, -5
	changeblock $12, $1c, $ac
	changeblock $14, $1c, $ad
	changeblock $16, $1c, $ad
	changeblock $18, $1c, $ae
	
	changeblock $1c, $18, $ac
	changeblock $1e, $18, $ad
	changeblock $20, $18, $ae
	
	changeblock $c, $a, $ac
	changeblock $e, $a, $ad
	changeblock $10, $a, $ad
	changeblock $12, $a, $ad
	changeblock $14, $a, $ae
	callasm GenericFinishBridge
	dotrigger $2
.end
	end
	
AureoleMountain4FBridgeDown:
	checkevent EVENT_BRIDGE_BOULDER_UP
	iftrue .boulder_under_bridge_up
	checkevent EVENT_BRIDGE_BOULDER_DOWN
	iffalse .done_bridge_boulder
;.boulder_under_bridge_down
	disappear 9
	moveperson 9, 20, 29
	appear 9
	jump .done_bridge_boulder
.boulder_under_bridge_up
	disappear 9
	moveperson 9, 20, 28
	appear 9
.done_bridge_boulder
	clearevent EVENT_BRIDGE_BOULDER_UP
	clearevent EVENT_BRIDGE_BOULDER_DOWN
	moveperson 1, 30, 25
	changeblock $12, $1c, $b0
	changeblock $14, $1c, $b1
	changeblock $16, $1c, $b1
	changeblock $18, $1c, $b2
	
	changeblock $1c, $18, $b0
	changeblock $1e, $18, $b1
	changeblock $20, $18, $b2
	
	changeblock $c, $a, $b0
	changeblock $e, $a, $b1
	changeblock $10, $a, $b1
	changeblock $12, $a, $b1
	changeblock $14, $a, $b2
	callasm GenericFinishBridge
	dotrigger $1
	end
	
AureoleMountain4F_Trainer:
	generictrainer HIKER, JOE, EVENT_BEAT_AUREOLE_MOUNTAIN_4F_TRAINER, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"	
	done

.BeatenText:
	text "YOU WIN"
	done
