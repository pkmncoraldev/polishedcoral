DesertTemple1_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DesertTemple1Callback

	db 12 ; warp events
	warp_event 12, 37, DESERT_TEMPLE_OUTSIDE, 1
	warp_event 13, 37, DESERT_TEMPLE_OUTSIDE, 2
	warp_event  4, 10, DESERT_TEMPLE_LOWER_LEFT, 1
	warp_event  4, 11, DESERT_TEMPLE_LOWER_LEFT, 2
	warp_event 13, 10, DESERT_TEMPLE_LOWER_RIGHT, 1
	warp_event 13, 11, DESERT_TEMPLE_LOWER_RIGHT, 2
	warp_event  4,  4, DESERT_TEMPLE_TOP_LEFT, 1
	warp_event  4,  5, DESERT_TEMPLE_TOP_LEFT, 2
	warp_event 13,  4, DESERT_TEMPLE_TOP_RIGHT, 1
	warp_event 13,  5, DESERT_TEMPLE_TOP_RIGHT, 2
	warp_event  8,  1, DESERT_TEMPLE_2, 1
	warp_event  9,  1, DESERT_TEMPLE_2, 2
	

	db 8 ; coord events
	coord_event 12, 24, 1, DesertTemple1Door1
	coord_event 13, 24, 1, DesertTemple1Door1
	coord_event 12, 25, 1, DesertTemple1Door1
	coord_event 13, 25, 1, DesertTemple1Door1
	coord_event  8,  2, 2, DesertTemple1Door2
	coord_event  9,  2, 2, DesertTemple1Door2
	coord_event  8,  3, 2, DesertTemple1Door2
	coord_event  9,  3, 2, DesertTemple1Door2

	db 16 ; bg events
	signpost 31,  1, SIGNPOST_READ, DesertTemple1Switch1
	signpost 25, 17, SIGNPOST_READ, DesertTemple1Switch2
	signpost 24, 11, SIGNPOST_READ, DesertTemple1Torch1
	signpost 24, 14, SIGNPOST_READ, DesertTemple1Torch2
	signpost 10,  7, SIGNPOST_READ, DesertTemple1Torch3
	signpost 10, 10, SIGNPOST_READ, DesertTemple1Torch4
	signpost  2,  7, SIGNPOST_READ, DesertTemple1Torch5
	signpost  2, 10, SIGNPOST_READ, DesertTemple1Torch6
	signpost 10,  3, SIGNPOST_IFSET, DesertTemple1Collapse1
	signpost 11,  3, SIGNPOST_IFSET, DesertTemple1Collapse1
	signpost 10, 14, SIGNPOST_IFSET, DesertTemple1Collapse2
	signpost 11, 14, SIGNPOST_IFSET, DesertTemple1Collapse2
	signpost  4,  3, SIGNPOST_IFSET, DesertTemple1Collapse3
	signpost  5,  3, SIGNPOST_IFSET, DesertTemple1Collapse3
	signpost  4, 14, SIGNPOST_IFSET, DesertTemple1Collapse4
	signpost  5, 14, SIGNPOST_IFSET, DesertTemple1Collapse4

	db 0 ; object events

DesertTemple1Callback:
	setevent EVENT_ALWAYS_SET
	clearevent EVENT_TEMPLE_RUMBLING
	domaptrigger DESERT_TEMPLE_LOWER_LEFT, $0
	callasm DesertTemple1ClearTimerAsm
	clearevent EVENT_SANDSTORM_HAPPENING
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger DESERT_WASTELAND_1, $0
.door1
	checkevent EVENT_DESERT_TEMPLE_DOOR_1
	iffalse .door2
	changeblock $c, $16, $ff
.door2
	checkevent EVENT_DESERT_TEMPLE_DOOR_2
	iffalse .torches1
	changeblock $8, $0, $cf
.torches1
	checkevent EVENT_DESERT_TEMPLE_SWITCH_1
	iffalse .torches2
	changeblock $a, $16, $ca
.torches2
	checkevent EVENT_DESERT_TEMPLE_SWITCH_2
	iffalse .torches3
	changeblock $e, $16, $cb
.torches3
	checkevent EVENT_DESERT_TEMPLE_SWITCH_3
	iffalse .torches4
	changeblock $6, $8, $ca
	changeblock $4, $a, $d8
.torches4
	checkevent EVENT_DESERT_TEMPLE_SWITCH_4
	iffalse .torches5
	changeblock $a, $8, $cb
	changeblock $c, $a, $d9
.torches5
	checkevent EVENT_DESERT_TEMPLE_SWITCH_5
	iffalse .torches6
	changeblock $6, $0, $ca
	changeblock $4, $4, $d8
.torches6
	checkevent EVENT_DESERT_TEMPLE_SWITCH_6
	iffalse .end
	changeblock $a, $0, $cb
	changeblock $c, $4, $d9
.end
	return

DesertTemple1ClearTimerAsm:
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
	changeblock $a, $16, $ca
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
	changeblock $e, $16, $cb
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
	changeblock $c, $16, $fc
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $16, $fd
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $16, $fe
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $c, $16, $ff
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
	changeblock $8, $0, $fc
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $8, $0, $fd
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $8, $0, $fe
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $8, $0, $cf
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