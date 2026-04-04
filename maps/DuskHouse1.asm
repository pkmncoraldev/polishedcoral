DuskHouse1_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, DUSK_TURNPIKE, 13
	warp_event  3,  7, DUSK_TURNPIKE, 13

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_REDS_MOM,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, DuskHouse1NPC1, -1
	person_event SPRITE_COOL_DUDE,  6,  6, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DuskHouse1NPC2, -1


DuskHouse1NPC1:
	jumptextfaceplayer DuskHouse1NPC1Text
	
DuskHouse1NPC2:
	jumptextfaceplayer DuskHouse1NPC2Text
	
DuskHouse1NPC1Text:
	text "Do you know of"
	line "NETT CORP.?"
	
	para "No one knows what"
	line "happened it's"
	cont "founder."
	
	para "He gave up the"
	line "entire company to"
	cont "his son one day,"
	cont "and disappeared."
	
	para "I wonder if he's"
	line "living a new life"
	cont "somewhere…"
	done
	
DuskHouse1NPC2Text:
	text "What would compel"
	line "someone to give up"
	cont "so much money and"
	cont "power?"
	done
	
	