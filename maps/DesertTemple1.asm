DesertTemple1_MapScriptHeader:
	db 3 ; scene scripts
	scene_script DesertTemple1Trigger0
	scene_script DesertTemple1Trigger1
	scene_script DesertTemple1Trigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DesertTemple1Callback

	db 12 ; warp events
	warp_event 14, 37, DESERT_TEMPLE_OUTSIDE, 1
	warp_event 15, 37, DESERT_TEMPLE_OUTSIDE, 2
	warp_event  8, 10, DESERT_TEMPLE_LOWER_LEFT, 1
	warp_event  8, 11, DESERT_TEMPLE_LOWER_LEFT, 2
	warp_event 17, 10, DESERT_TEMPLE_LOWER_RIGHT, 1
	warp_event 17, 11, DESERT_TEMPLE_LOWER_RIGHT, 2
	warp_event  8,  4, DESERT_TEMPLE_TOP_LEFT, 1
	warp_event  8,  5, DESERT_TEMPLE_TOP_LEFT, 2
	warp_event 17,  4, DESERT_TEMPLE_TOP_RIGHT, 1
	warp_event 17,  5, DESERT_TEMPLE_TOP_RIGHT, 2
	warp_event 12,  1, DESERT_TEMPLE_2, 1
	warp_event 13,  1, DESERT_TEMPLE_2, 2
	

	db 8 ; coord events
	coord_event 16, 24, 1, DesertTemple1Door1
	coord_event 17, 24, 1, DesertTemple1Door1
	coord_event 16, 25, 1, DesertTemple1Door1
	coord_event 17, 25, 1, DesertTemple1Door1
	coord_event 12,  2, 2, DesertTemple1Door2
	coord_event 13,  2, 2, DesertTemple1Door2
	coord_event 12,  3, 2, DesertTemple1Door2
	coord_event 13,  3, 2, DesertTemple1Door2

	db 16 ; bg events
	signpost 31,  5, SIGNPOST_READ, DesertTemple1Switch1
	signpost 25, 21, SIGNPOST_READ, DesertTemple1Switch2
	signpost 24, 15, SIGNPOST_READ, DesertTemple1Torch1
	signpost 24, 18, SIGNPOST_READ, DesertTemple1Torch2
	signpost 10, 11, SIGNPOST_READ, DesertTemple1Torch3
	signpost 10, 14, SIGNPOST_READ, DesertTemple1Torch4
	signpost  2, 11, SIGNPOST_READ, DesertTemple1Torch5
	signpost  2, 14, SIGNPOST_READ, DesertTemple1Torch6
	signpost 10,  7, SIGNPOST_IFSET, DesertTemple1Collapse1
	signpost 11,  7, SIGNPOST_IFSET, DesertTemple1Collapse1
	signpost 10, 18, SIGNPOST_IFSET, DesertTemple1Collapse2
	signpost 11, 18, SIGNPOST_IFSET, DesertTemple1Collapse2
	signpost  4,  7, SIGNPOST_IFSET, DesertTemple1Collapse3
	signpost  5,  7, SIGNPOST_IFSET, DesertTemple1Collapse3
	signpost  4, 18, SIGNPOST_IFSET, DesertTemple1Collapse4
	signpost  5, 18, SIGNPOST_IFSET, DesertTemple1Collapse4

	db 1 ; object events
	person_event SPRITE_BALL_CUT_FRUIT,  7, 1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DesertTemple1Tonic, EVENT_GOT_DESERT_TEMPLE_SECRET
	
	
	const_def 1 ; object constants
	const DESERT_TEMPLE_TONIC

DesertTemple1Callback:
	setevent EVENT_ALWAYS_SET
	domaptrigger DESERT_TEMPLE_LOWER_LEFT, $0
	callasm DesertTemple1ClearTimerAsm
	ifequal 1, .right
	ifequal 2, .left
	jump .cont
.right
	callasm SpawnPlayer
	spriteface PLAYER, RIGHT
	jump .cont
.left
	callasm SpawnPlayer
	spriteface PLAYER, LEFT
.cont
	clearevent EVENT_SANDSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger DESERT_WASTELAND_1, $0
.door1
	checkevent EVENT_DESERT_TEMPLE_DOOR_1
	iffalse .door2
	changeblock $10, $16, $ff
.door2
	checkevent EVENT_DESERT_TEMPLE_DOOR_2
	iffalse .torches1
	changeblock $c, $0, $cf
.torches1
	checkevent EVENT_DESERT_TEMPLE_SWITCH_1
	iffalse .torches2
	changeblock $e, $16, $ca
.torches2
	checkevent EVENT_DESERT_TEMPLE_SWITCH_2
	iffalse .torches3
	changeblock $12, $16, $cb
.torches3
	checkevent EVENT_DESERT_TEMPLE_SWITCH_3
	iffalse .torches4
	changeblock $a, $8, $ca
	changeblock $8, $a, $d8
.torches4
	checkevent EVENT_DESERT_TEMPLE_SWITCH_4
	iffalse .torches5
	changeblock $e, $8, $cb
	changeblock $10, $a, $d9
.torches5
	checkevent EVENT_DESERT_TEMPLE_SWITCH_5
	iffalse .torches6
	changeblock $a, $0, $ca
	changeblock $8, $4, $d8
.torches6
	checkevent EVENT_DESERT_TEMPLE_SWITCH_6
	iffalse .end
	changeblock $e, $0, $cb
	changeblock $10, $4, $d9
.end
	return
	
DesertTemple1Trigger0:
DesertTemple1Trigger1:
DesertTemple1Trigger2:
	checkevent EVENT_TEMPLE_RUMBLING
	iffalse .skip
	clearevent EVENT_TEMPLE_RUMBLING
	playsound SFX_THUNDER
	earthquake 20
	opentext
	writetext DesertTemple1CollapseText2
	waitbutton
	closetext
.skip
	end

DesertTemple1Tonic:
	loadvar wCurItemBallQuantity, 1
	loadvar wCurItemBallContents, MIRACLETONIC
	farscall FindItemInBallScript
	iffalse .end
	disappear DESERT_TEMPLE_TONIC
	special Special_IncSecretCounter
.end
	end

DesertTemple1ClearTimerAsm:
	ld a, [wXCoord]
	cp $08
	jr z, .right
	cp $11
	jr z, .left
	ld a, 0
	jr .cont
.right
	ld a, 1
	jr .cont
.left
	ld a, 2
.cont
	ld [wScriptVar], a
	ld hl, wStatusFlags2
	res 2, [hl] ; ENGINE_BUG_CONTEST_TIMER
	xor a ;clear time
	farjp StartTempleTimer
	
DesertTemple1Collapse1:
	dw EVENT_DESERT_TEMPLE_SWITCH_3
	jumptext DesertTemple1CollapseText
	
DesertTemple1Collapse2:
	dw EVENT_DESERT_TEMPLE_SWITCH_4
	jumptext DesertTemple1CollapseText
	
DesertTemple1Collapse3:
	dw EVENT_DESERT_TEMPLE_SWITCH_5
	jumptext DesertTemple1CollapseText
	
DesertTemple1Collapse4:
	dw EVENT_DESERT_TEMPLE_SWITCH_6
	jumptext DesertTemple1CollapseText
	
DesertTemple1Switch1:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_1
	iftrue DesertTemple1SwitchPressedAlready
	opentext
	writetext DesertTemple1SwitchText
	yesorno
	iffalse DesertTemple1SwitchNo
	writetext DesertTempleWhoWouldntText
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 10
	changeblock $e, $16, $ca
	callasm GenericFinishBridge
	setevent EVENT_DESERT_TEMPLE_SWITCH_1
	checkevent EVENT_DESERT_TEMPLE_SWITCH_2
	iffalse .end
	dotrigger $1
.end
	pause 20
	opentext
	writetext DesertTemple1SwitchText2
	waitbutton
	closetext
	end

DesertTemple1Switch2:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_2
	iftrue DesertTemple1SwitchPressedAlready
	opentext
	writetext DesertTemple1SwitchText
	yesorno
	iffalse DesertTemple1SwitchNo
	writetext DesertTempleWhoWouldntText
	waitbutton
	closetext
	playsound SFX_PUSH_BUTTON
	pause 10
	changeblock $12, $16, $cb
	callasm GenericFinishBridge
	setevent EVENT_DESERT_TEMPLE_SWITCH_2
	checkevent EVENT_DESERT_TEMPLE_SWITCH_1
	iffalse .end
	dotrigger $1
.end
	pause 20
	opentext
	writetext DesertTemple1SwitchText3
	waitbutton
	closetext
	end
DesertTemple1SwitchNo:
	farwritetext BetterNotText
	waitbutton
	closetext
	end
	
DesertTemple1SwitchPressedAlready:
	opentext
	writetext DesertTemple1SwitchText
	yesorno
	iffalse DesertTemple1SwitchNo
	writetext DesertTempleWhoWouldntText
	waitbutton
	closetext
	pause 10
	jumptext DesertTempleAlreadyPressedText
	
DesertTemple1Door1:
	special Special_StopRunning
	spriteface PLAYER, UP
	pause 10
	special SaveMusic
	special Special_FadeOutMusic
	pause 30
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 30
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $10, $16, $fc
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $10, $16, $fd
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $10, $16, $fe
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $10, $16, $ff
	callasm GenericFinishBridge
	earthquake 5
	pause 20
	special RestoreMusic
	opentext
	writetext DesertTemple1DoorText
	waitbutton
	closetext
	setevent EVENT_DESERT_TEMPLE_DOOR_1
	dotrigger $0
	end
	
DesertTemple1Door2:
	special Special_StopRunning
	spriteface PLAYER, UP
	pause 10
	special SaveMusic
	special Special_FadeOutMusic
	pause 30
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 30
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $0, $fc
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $0, $fd
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $0, $fe
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $0, $cf
	callasm GenericFinishBridge
	earthquake 5
	pause 20
	special RestoreMusic
	opentext
	writetext DesertTemple1DoorText
	waitbutton
	closetext
	setevent EVENT_DESERT_TEMPLE_DOOR_2
	dotrigger $0
	end
	
DesertTemple1Torch1:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_1
	iffalse .off
	jumptext DesertTemple1TorchOn
.off
	jumptext DesertTemple1TorchOff
	
DesertTemple1Torch2:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_2
	iffalse .off
	jumptext DesertTemple1TorchOn
.off
	jumptext DesertTemple1TorchOff
	
DesertTemple1Torch3:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_3
	iffalse .off
	jumptext DesertTemple1TorchOn
.off
	jumptext DesertTemple1TorchOff
	
DesertTemple1Torch4:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_4
	iffalse .off
	jumptext DesertTemple1TorchOn
.off
	jumptext DesertTemple1TorchOff
	
DesertTemple1Torch5:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_5
	iffalse .off
	jumptext DesertTemple1TorchOn
.off
	jumptext DesertTemple1TorchOff
	
DesertTemple1Torch6:
	checkevent EVENT_DESERT_TEMPLE_SWITCH_6
	iffalse .off
	jumptext DesertTemple1TorchOn
.off
	jumptext DesertTemple1TorchOff
	
DesertTemple1SwitchText:
	text "A switch rests on"
	line "the wall."
	
	para "Press it?"
	done
	
DesertTemple1SwitchText2:
	text "A torch lit up"
	line "somewhere…"
	done
	
DesertTemple1SwitchText3:
	text "A torch lit up…"
	done
	
DesertTemple1SwitchText4:
	text "The roof is"
	line "collapsing!"
	done
	
DesertTemple1TorchOff:
	text "Some kind of"
	line "torch."
	
	para "It's not active…"
	done
	
DesertTemple1TorchOn:
	text "A mysterious"
	line "light…"
	
	para "Looks like this"
	line "torch is active!"
	done
	
DesertTempleWhoWouldntText:
	text "Who wouldn't?"
	done
	
DesertTempleAlreadyPressedText:
	text "Nothing happened…"
	done
	
DesertTemple1DoorText:
	text "A door revealed"
	line "itself…"
	done
	
DesertTemple1CollapseText:
	text "The entire room"
	line "is collapsed in!"
	done
	
DesertTemple1CollapseText2:
	text "Whew!<WAIT_S>"
	line "Close call!"
	done
	