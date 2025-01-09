UnderwaterTemple1_MapScriptHeader:
	db 2 ; scene scripts
	scene_script UnderwaterTemple1Trigger0
	scene_script UnderwaterTemple1Trigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, UnderwaterTemple1Callback

	db 14 ; warp events
	warp_def 43, 20, 1, UNDERWATER_TEMPLE_OUTSIDE
	warp_def 43, 21, 2, UNDERWATER_TEMPLE_OUTSIDE
	warp_def 40,  0, 1, UNDERWATER_TEMPLE_2
	warp_def 40,  1, 2, UNDERWATER_TEMPLE_2
	warp_def 41,  0, 3, UNDERWATER_TEMPLE_2
	warp_def 41,  1, 4, UNDERWATER_TEMPLE_2
	warp_def 18,  1, 5, UNDERWATER_TEMPLE_2
	warp_def 18,  2, 6, UNDERWATER_TEMPLE_2
	warp_def 19,  1, 7, UNDERWATER_TEMPLE_2
	warp_def 19,  2, 8, UNDERWATER_TEMPLE_2
	warp_def  5, 28, 9, UNDERWATER_TEMPLE_2
	warp_def  5, 29, 10, UNDERWATER_TEMPLE_2
	warp_def  6, 28, 11, UNDERWATER_TEMPLE_2
	warp_def  6, 29, 12, UNDERWATER_TEMPLE_2

	db 2 ; coord events
	coord_event 16, 25, 0, UnderwaterTemple1MakeSilverGreen
	coord_event 16, 26, 1, UnderwaterTemple1MakeSilverBrown

	db 2 ; bg events
	signpost 33, 20, SIGNPOST_IFNOTSET, UnderwaterTemple1Door2
	signpost 33, 21, SIGNPOST_IFNOTSET, UnderwaterTemple1Door2

	db 10 ; object events
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_GENERAL_VARIABLE_1, 33, 21, SPRITEMOVEDATA_TILE_HALFWAY_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Door, EVENT_HIDE_CORAL_STAR_3
	person_event SPRITE_ICESKATER_VARIABLE, 33, 21, SPRITEMOVEDATA_TILE_HALFWAY_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Door, EVENT_HIDE_CORAL_STAR_4
	object_event 33, 29, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CORSOLA, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Corsola1, EVENT_UNDERWATER_TEMPLE_1_CORSOLA_1
	object_event  1, 27, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CORSOLA, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Corsola2, EVENT_UNDERWATER_TEMPLE_1_CORSOLA_2
	object_event  1, 11, SPRITE_MON_ICON, SPRITEMOVEDATA_STANDING_DOWN, 0, CORSOLA, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, UnderwaterTemple1Corsola3, EVENT_UNDERWATER_TEMPLE_1_CORSOLA_3
	itemball_event 33, 28, CORAL_SHARD, 1, EVENT_UNDERWATER_TEMPLE_1_POKEBALL_1
	itemball_event  1, 26, CORAL_SHARD, 1, EVENT_UNDERWATER_TEMPLE_1_POKEBALL_2
	itemball_event  1, 10, CORAL_SHARD, 1, EVENT_UNDERWATER_TEMPLE_1_POKEBALL_3
	

	
	const_def 1 ; object constants
	const UNDERWATER_TEMPLE_1_BUBBLES_1
	const UNDERWATER_TEMPLE_1_BUBBLES_2
	const UNDERWATER_TEMPLE_1_CORAL_STAR_1
	const UNDERWATER_TEMPLE_1_CORAL_STAR_2
	const UNDERWATER_TEMPLE_1_CORSOLA_1
	const UNDERWATER_TEMPLE_1_CORSOLA_2
	const UNDERWATER_TEMPLE_1_CORSOLA_3
	
UnderwaterTemple1Trigger0:
	end
	
UnderwaterTemple1Trigger1:
	end
	
UnderwaterTemple1Callback:
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
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_5
	iftrue .done_door
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_1
	iftrue .done_1
	return
.done_1
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_2
	iftrue .done_2
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MUSEUM_STANDEE
	return
.done_2
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_3
	iftrue .done_3
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNES
	return
.done_3
	checkevent EVENT_UNDERWATER_TEMPLE_1_CORAL_SHARD_4
	iftrue .done_4
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CORAL_STAR
	return
.done_4
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MUSEUM_STANDEE
	return
.done_door
	changeblock $14, $20, $d7
	changeblock $14, $1e, $ca
	return
	
UnderwaterTemple1Corsola1:
	opentext
	writetext UnderwaterTemple1CorsolaText
	cry CORSOLA
	waitbutton
	closetext
	waitsfx
	loadwildmon CORSOLA, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	disappear UNDERWATER_TEMPLE_1_CORSOLA_1
	reloadmapafterbattle
	setevent EVENT_UNDERWATER_TEMPLE_1_CORSOLA_1
	checkcode VAR_MONJUSTCAUGHT
	if_equal CORSOLA, .CaughtCorsola
	opentext
	writetext UnderwaterTemple1CorsolaTextGone
	waitbutton
	closetext
.CaughtCorsola
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
UnderwaterTemple1Corsola2:
	opentext
	writetext UnderwaterTemple1CorsolaText
	cry CORSOLA
	waitbutton
	closetext
	waitsfx
	loadwildmon CORSOLA, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	disappear UNDERWATER_TEMPLE_1_CORSOLA_2
	reloadmapafterbattle
	setevent EVENT_UNDERWATER_TEMPLE_1_CORSOLA_2
	checkcode VAR_MONJUSTCAUGHT
	if_equal CORSOLA, .CaughtCorsola
	opentext
	writetext UnderwaterTemple1CorsolaTextGone
	waitbutton
	closetext
.CaughtCorsola
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
UnderwaterTemple1Corsola3:
	opentext
	writetext UnderwaterTemple1CorsolaText
	cry CORSOLA
	waitbutton
	closetext
	waitsfx
	loadwildmon CORSOLA, 30
	writecode VAR_BATTLETYPE, BATTLETYPE_TRAP
	startbattle
	disappear UNDERWATER_TEMPLE_1_CORSOLA_3
	reloadmapafterbattle
	setevent EVENT_UNDERWATER_TEMPLE_1_CORSOLA_3
	checkcode VAR_MONJUSTCAUGHT
	if_equal CORSOLA, .CaughtCorsola
	opentext
	writetext UnderwaterTemple1CorsolaTextGone
	waitbutton
	closetext
.CaughtCorsola
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end
	
UnderwaterTemple1CorsolaText:
	text "TEXT 1"
	done
	
UnderwaterTemple1CorsolaTextGone:
	text "CORSOLA gently"
	line "floated away."
	done
	
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
