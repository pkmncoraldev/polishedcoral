UnderwaterTemple1_MapScriptHeader:
	db 2 ; scene scripts
	scene_script UnderwaterTemple1Trigger0
	scene_script UnderwaterTemple1Trigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 43, 20, 1, UNDERWATER_TEMPLE_OUTSIDE
	warp_def 43, 21, 2, UNDERWATER_TEMPLE_OUTSIDE

	db 2 ; coord events
	coord_event 16, 25, 0, UnderwaterTemple1MakeSilverGreen
	coord_event 16, 26, 1, UnderwaterTemple1MakeSilverBrown

	db 2 ; bg events
	signpost 33, 20, SIGNPOST_IFNOTSET, UnderwaterTemple1Door2
	signpost 33, 21, SIGNPOST_IFNOTSET, UnderwaterTemple1Door2

	db 4 ; object events
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_GENERAL_VARIABLE_1, 33, 21, SPRITEMOVEDATA_TILE_HALFWAY_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Door, EVENT_HIDE_CORAL_STAR_3
	person_event SPRITE_ICESKATER_VARIABLE, 33, 21, SPRITEMOVEDATA_TILE_HALFWAY_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Door, EVENT_HIDE_CORAL_STAR_4

	
	const_def 1 ; object constants
	const UNDERWATER_TEMPLE_1_BUBBLES_1
	const UNDERWATER_TEMPLE_1_BUBBLES_2
	const UNDERWATER_TEMPLE_1_CORAL_STAR_1
	const UNDERWATER_TEMPLE_1_CORAL_STAR_2
	
UnderwaterTemple1Trigger0:
	end
	
UnderwaterTemple1Trigger1:
	end
	
UnderwaterTemple1MakeSilverBrown:
	clearevent EVENT_UNDERWATER_TEMPLE_GREEN
	loadvar wTimeOfDayPalFlags, $40 | 1
	dotrigger $0
	end
	
UnderwaterTemple1MakeSilverGreen:
	setevent EVENT_UNDERWATER_TEMPLE_GREEN
	loadvar wTimeOfDayPalFlags, $40 | 0
	dotrigger $1
	end
	
UnderwaterTemple1Door2:
	dw EVENT_UNDERWATER_TEMPLE_1_DOOR_OPEN
UnderwaterTemple1Door:
	opentext
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_1
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
	setevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_1
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MUSEUM_STANDEE
	appear UNDERWATER_TEMPLE_1_CORAL_STAR_1
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
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_2
	iftrue .done_2
	setevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_2
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNES
	jump .finish
.done_2
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_3
	iftrue .done_3
	setevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_3
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CORAL_STAR
	jump .finish
.done_3
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_4
	iftrue .done_4
	setevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_4
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MUSEUM_STANDEE
	appear UNDERWATER_TEMPLE_1_CORAL_STAR_2
	jump .finish
.done_4
	setevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_5
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_SNES
.finish
	closetext
	pause 10
	opentext
	writetext UnderwaterTempleOutsideDoorText4
	waitbutton
	closetext
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_5
	iffalse .done
	changeblock $14, $20, $d0
	callasm GenericFinishBridge
	disappear UNDERWATER_TEMPLE_1_CORAL_STAR_1
	disappear UNDERWATER_TEMPLE_1_CORAL_STAR_2
	pause 10
	special Special_FadeOutMusic
	pause 30
	playsound SFX_EMBER
	earthquake 60
	waitsfx
	pause 30
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $14, $20, $d4
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $14, $20, $d5
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $14, $20, $d6
	changeblock $14, $1e, $d2
	callasm GenericFinishBridge
	earthquake 5
	pause 5
	playsound SFX_PLACE_PUZZLE_PIECE_DOWN
	changeblock $14, $20, $d7
	changeblock $14, $1e, $ca
	callasm GenericFinishBridge
	earthquake 5
	pause 20
	opentext
	writetext UnderwaterTempleOutsideDoorText7
	waitbutton
	closetext
	setevent EVENT_UNDERWATER_TEMPLE_1_DOOR_OPEN
	end
.no_more_shards
	writetext UnderwaterTempleOutsideDoorText9
	waitbutton
.done
	closetext
	end
