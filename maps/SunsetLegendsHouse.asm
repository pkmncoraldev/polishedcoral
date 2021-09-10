SunsetLegendsHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SUNSET_BAY, 6
	warp_event  3,  7, SUNSET_BAY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, SIGNPOST_JUMPSTD, magazinebookshelf
	bg_event  1,  1, SIGNPOST_JUMPSTD, magazinebookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetLegendsHouseNPC, -1

SunsetLegendsHouseNPC:
	faceplayer
	opentext
	writetext SunsetLegendsHouseNPCText	
	waitbutton
	closetext
	end

SunsetLegendsHouseNPCText:
	text "I just moved here"
	line "from the HOENN"
	cont "region."
	

	para "It's a lot calmer"
	line "around here than"
	cont "back home."

	para "The ONWA region"
	line "doesn't seem to"
	cont "have LEGENDARY"
	cont "#MON like most"
	cont "other regions do."
	done