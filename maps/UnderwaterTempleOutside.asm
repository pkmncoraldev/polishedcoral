UnderwaterTempleOutside_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, UnderwaterTempleOutsideCallback

	db 2 ; warp events
	warp_def  9, 12, 1, UNDERWATER_TEMPLE_1
	warp_def  9, 13, 2, UNDERWATER_TEMPLE_1

	db 0 ; coord events

	db 2 ; bg events
	signpost  9, 12, SIGNPOST_IFNOTSET, UnderwaterTempleOutsideDoor2
	signpost  9, 13, SIGNPOST_IFNOTSET, UnderwaterTempleOutsideDoor2

	db 4 ; object events
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_GENERAL_VARIABLE_1,  9, 13, SPRITEMOVEDATA_TILE_HALFWAY_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, UnderwaterTempleOutsideDoor, EVENT_HIDE_CORAL_STAR_1
	person_event SPRITE_ICESKATER_VARIABLE,  9, 13, SPRITEMOVEDATA_TILE_HALFWAY_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, UnderwaterTempleOutsideDoor, EVENT_HIDE_CORAL_STAR_2

	const_def 1 ; object constants
	const UNDERWATER_TEMPLE_OUTSIDE_BUBBLES_1
	const UNDERWATER_TEMPLE_OUTSIDE_BUBBLES_2
	const UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_1
	const UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_2


UnderwaterTempleOutsideCallback:
	callasm UnderwaterSetUpBubbles
	readvar VAR_PLAYER_COLOR
	if_equal 4, .purple
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	disappear ROUTE14_15_UNDERWATER_BUBBLE1
	disappear ROUTE14_15_UNDERWATER_BUBBLE2
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE1
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE2
	disappear ROUTE14_15_UNDERWATER_BUBBLE1
	appear ROUTE14_15_UNDERWATER_BUBBLE2
	jump .cont
.purple
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	setevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	disappear ROUTE14_15_UNDERWATER_BUBBLE1
	disappear ROUTE14_15_UNDERWATER_BUBBLE2
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE1
	movetoplayer ROUTE14_15_UNDERWATER_BUBBLE2
	appear ROUTE14_15_UNDERWATER_BUBBLE1
	disappear ROUTE14_15_UNDERWATER_BUBBLE2
.cont
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_5
	iftrue .done_door
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_1
	iftrue .done_1
	return
.done_1
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_2
	iftrue .done_2
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MUSEUM_STANDEE
	return
.done_2
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_3
	iftrue .done_3
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNES
	return
.done_3
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_4
	iftrue .done_4
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CORAL_STAR
	return
.done_4
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MUSEUM_STANDEE
	return
.done_door
	changeblock $0c, $08, $af
	changeblock $0c, $06, $bc
	return

UnderwaterTempleOutsideDoor2:
	dw EVENT_UNDERWATER_TEMPLE_OUTSIDE_DOOR_OPEN
UnderwaterTempleOutsideDoor:
	opentext
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_1
	iftrue .done_1
	writetext UnderwaterTempleOutsideDoorText1
	yesorno
	iffalse .no
	special FadeOutPalettes
	special Special_ChooseItem
	iffalse .no
	callasm CheckCoralShard
	iftrue .yes
.wrong
	writetext UnderwaterTempleOutsideDoorText2
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext UnderwaterTempleOutsideDoorText3
	farwritetext StdBlankText
	pause 6
	writetext UnderwaterTempleOutsideDoorText5
	waitbutton
	closetext
	end
.no
	writetext UnderwaterTempleOutsideDoorText6
	waitbutton
	closetext
	end	
.yes
	takeitem CORAL_SHARD
	writetext UnderwaterTempleOutsideDoorText2
	waitbutton
	closetext
	waitsfx
	pause 10
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_1
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MUSEUM_STANDEE
	appear UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_1
	jump .finish
.done_1
	checkitem CORAL_SHARD
	iffalse .no_more_shards
	writetext UnderwaterTempleOutsideDoorText8
	yesorno
	iffalse .no
	takeitem CORAL_SHARD
	closetext
	waitsfx
	pause 10
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_2
	iftrue .done_2
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_2
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNES
	jump .finish
.done_2
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_3
	iftrue .done_3
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_3
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CORAL_STAR
	jump .finish
.done_3
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_4
	iftrue .done_4
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_4
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MUSEUM_STANDEE
	appear UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_2
	jump .finish
.done_4
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_5
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_SNES
.finish
	closetext
	pause 10
	opentext
	writetext UnderwaterTempleOutsideDoorText4
	waitbutton
	closetext
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_5
	iffalse .done
	changeblock $0c, $08, $d0
	callasm GenericFinishBridge
	disappear UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_1
	disappear UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_2
	pause 10
	special Special_FadeOutMusic
	pause 30
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 30
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $0c, $08, $b8
	changeblock $0c, $06, $d1
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $0c, $08, $b9
	changeblock $0c, $06, $b5
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $0c, $08, $ba
	changeblock $0c, $06, $bb
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $0c, $08, $af
	changeblock $0c, $06, $bc
	callasm GenericFinishBridge
	earthquake 5
	pause 20
	opentext
	writetext UnderwaterTempleOutsideDoorText7
	waitbutton
	closetext
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_DOOR_OPEN
	end
.no_more_shards
	writetext UnderwaterTempleOutsideDoorText9
	waitbutton
.done
	closetext
	end
	
CheckCoralShard:
	ld a, [wCurItem]
	ld [wd265], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	ld a, [wCurItem]
	cp CORAL_SHARD
	jr nz, .no
	ld a, TRUE
	ld [wScriptVar], a
	ret
.no
	ld a, FALSE
	ld [wScriptVar], a
	ret
	
UnderwaterTempleOutsideDoorText1:
	text "A star-shaped hole"
	line "with 5 indents."
	
	para "Put something"
	line "inside?"
	done
	
UnderwaterTempleOutsideDoorText2:
	text "<PLAYER> tried the"
	line "@"
	text_from_ram wMonOrItemNameBuffer
	text "."
	done
	
UnderwaterTempleOutsideDoorText3:
	text "…<WAIT_L><WAIT_L>"
	done
	
UnderwaterTempleOutsideDoorText4:
	text "A perfect fit!"
	done
	
	
UnderwaterTempleOutsideDoorText5:
	text "Nope!<WAIT_S>"
	line "Nothing…"
	done
	
UnderwaterTempleOutsideDoorText6:
	text "Better not…"
	done
	
UnderwaterTempleOutsideDoorText7:
	text "A door revealed"
	line "itself…"
	done
	
UnderwaterTempleOutsideDoorText8:
	text "Place another"
	line "CORAL SHARD?"
	done
	
UnderwaterTempleOutsideDoorText9:
	text "There's room for"
	line "another CORAL"
	cont "SHARD."
	
	para "Better find one"
	line "and come back!"
	done
	