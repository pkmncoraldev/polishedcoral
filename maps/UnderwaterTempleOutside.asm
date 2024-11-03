UnderwaterTempleOutside_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, UnderwaterTempleOutsideCallback

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	signpost  9, 12, SIGNPOST_READ, UnderwaterTempleOutsideTest
	signpost  9, 13, SIGNPOST_READ, UnderwaterTempleOutsideTest

	db 4 ; object events
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_TEAL
	object_event 13, -5, SPRITE_PLANK_BRIDGE_2, SPRITEMOVEDATA_BAGGAGE, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, -1, EVENT_HIDE_OW_OBJECTS_PURPLE
	person_event SPRITE_GENERAL_VARIABLE_1,  9, 13, SPRITEMOVEDATA_TILE_HALFWAY_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_CORAL_STAR_1
	person_event SPRITE_ICESKATER_VARIABLE,  9, 13, SPRITEMOVEDATA_TILE_HALFWAY_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDE_CORAL_STAR_2

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
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_5
	iftrue .done_5
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MUSEUM_STANDEE
.done_5
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_SNES
	return

UnderwaterTempleOutsideTest:
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_1
	iftrue .done_1
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_1
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_MUSEUM_STANDEE
	appear UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_1
	end
.done_1
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_2
	iftrue .done_2
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_2
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_SNES
	end
.done_2
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_3
	iftrue .done_3
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_3
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_CORAL_STAR
	end
.done_3
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_4
	iftrue .done_4
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_4
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_MUSEUM_STANDEE
	appear UNDERWATER_TEMPLE_OUTSIDE_CORAL_STAR_2
	end
.done_4
	checkevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_5
	iftrue .done_5
	playsound SFX_SECOND_PART_OF_ITEMFINDER
	setevent EVENT_UNDERWATER_TEMPLE_OUTSIDE_CORAL_SHARD_5
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_SNES
.done_5
	end