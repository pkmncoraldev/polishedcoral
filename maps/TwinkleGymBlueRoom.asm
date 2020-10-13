TwinkleGymBlueRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 17,  4, 3, TWINKLE_GYM_ENTRY
	warp_def 17,  5, 3, TWINKLE_GYM_ENTRY

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  3, 15, SPRITE_CORY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomNpc1, -1
	object_event  3, 14, SPRITE_CORY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomNpc2, -1
	object_event  3, 13, SPRITE_CORY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TwinkleGymBlueRoomNpc3, -1
	object_event  6, 15, SPRITE_CORY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 14, SPRITE_CORY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event  6, 13, SPRITE_CORY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

	
TwinkleGymBlueRoomNpc1:
	clearevent EVENT_BLUE_ROOM_STEAM_1
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
	
TwinkleGymBlueRoomNpc2:
	clearevent EVENT_BLUE_ROOM_STEAM_2
	loadvar wTimeOfDayPalFlags, $40 | 1
	end
	
TwinkleGymBlueRoomNpc3:
	clearevent EVENT_BLUE_ROOM_STEAM_3
	loadvar wTimeOfDayPalFlags, $40 | 1
	end