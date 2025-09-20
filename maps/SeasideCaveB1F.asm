SeasideCaveB1F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SeasideCaveB1FCallback

	db 4 ; warp events
	warp_event 15,  5, SEASIDE_CAVE_1F, 2
	warp_event 15, 21, SEASIDE_CAVE_1F, 3
	warp_event 13, 39, SEASIDE_CAVE_B2F, 1
	warp_event  9,  1, CONNECTING_CAVERN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  7,  2, SPRITE_FAT_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SeasideCaveB1FNPC1, -1
	object_event 17, 22, SPRITE_ROCKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SeasideCaveB1FNPC2, -1
	strengthboulder_event 13, 34, -1
	strengthboulder_event 14, 34, -1

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
	line "SOUTH ONWA!"
	
	para "You're pretty close"
	line "to town, if you're"
	cont "feeling tired."
	
	para "Just head up and"
	line "out of this cave,"
	cont "and then go WEST."
	done
	
SeasideCaveB1FNPC2:
	jumptextfaceplayer SeasideCaveB1FNPC2Text
	
SeasideCaveB1FNPC2Text:
	text "Down past these"
	line "currents, I saw"
	cont "some big rocks."
	
	para "Boulders even."
	
	para "I tried moving"
	line "them, but I'm just"
	cont "not strong enough."
	done
	