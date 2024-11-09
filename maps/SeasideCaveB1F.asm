SeasideCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SeasideCaveB1FCallback

	db 4 ; warp events
	warp_event 15,  5, SEASIDE_CAVE_1F, 2
	warp_event 15, 21, SEASIDE_CAVE_1F, 3
	warp_event 13, 33, SEASIDE_CAVE_B2F, 1
	warp_event  9,  1, CONNECTING_CAVERN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SeasideCaveB1FNPC1, -1

SeasideCaveB1FCallback:
	setevent EVENT_MADE_IT_TO_SOUTH_ONWA
	clearevent EVENT_HAVENT_MADE_IT_TO_SOUTH_ONWA
	return

SeasideCaveB1FNPC1:
	jumptextfaceplayer SeasideCaveB1FNPC1Text
	
SeasideCaveB1FNPC1Text:
	text "Do you know where"
	line "you are?"
	
	para "Take a look at"
	line "your map!"
	
	para "You've made it to"
	line "SOUTHERN ONWA!"
	
	para "You're pretty close"
	line "to town, if you're"
	cont "tired."
	
	para "But, if you feel"
	line "like pressing on,"
	
	para "I think there's"
	line "a strong #MON"
	cont "deeper in."
	
	para "Good luck, either"
	line "way!"
	done