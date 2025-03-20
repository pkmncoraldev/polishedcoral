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

	db 2 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SunsetLegendsHouseNPC, -1
	object_event  5,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetLegendsHouseNPC2, -1

SunsetLegendsHouseNPC:
	jumptextfaceplayer SunsetLegendsHouseNPCText
	
SunsetLegendsHouseNPC2:
	jumptextfaceplayer SunsetLegendsHouseNPC2Text

SunsetLegendsHouseNPCText:
	text "We just moved here"
	line "from the HOENN"
	cont "region."

	para "It's a lot calmer"
	line "around here than"
	cont "back home."
	done

SunsetLegendsHouseNPC2Text:
	text "Places like HOENN"
	line "have tons of myths"
	cont "and legends."
	
	para "Many even turn out"
	line "to be true!"
	
	para "I wonder if the"
	line "ONWA region has"
	cont "something similar."
	done