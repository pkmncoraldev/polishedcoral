UndergroundPassageEntrance_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  7,  9, ROUTE_15, 1
	warp_event  9,  3, UNDERGROUND_PASSAGE_ENTRANCE, 3
	warp_event 16,  9, UNDERGROUND_PASSAGE_ENTRANCE, 2
	warp_event 17,  1, UNDERGROUND_PASSAGE, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_BATTLE_GIRL,  5, 17, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, UndergroundPassageEntranceNPC, -1

UndergroundPassageEntranceNPC:
	checkevent EVENT_HAVE_FLASH
	iftrue .haveflash
	checkevent EVENT_SNARKY_GIRL_2
	iftrue .snarky
	setevent EVENT_SNARKY_GIRL_1
.haveflash
	jumptextfaceplayer UndergroundPassageEntranceNPCText1
.snarky
	jumptextfaceplayer UndergroundPassageEntranceNPCText2

UndergroundPassageEntranceNPCText1:
	text "Golly, It sure is"
	line "dark up ahead."
	
	para "You aren't gonna"
	line "be able to see"
	cont "anything."
	
	para "You need a #MON"
	line "to light the way."
	done
	
UndergroundPassageEntranceNPCText2:
	text "See?"
	
	para "I told you it"
	line "was too dark!"
	
	para "Did you just not"
	line "believe me or"
	cont "something?"
	
	para "Honestly!"
	done
	