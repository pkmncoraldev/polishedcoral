DuskHouse3_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, DUSK_TURNPIKE, 15
	warp_event  3,  7, DUSK_TURNPIKE, 15

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_POKEFAN_M,  4,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DuskHouse3NPC1, -1
	person_event SPRITE_BATTLE_GIRL,  3,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DuskHouse3NPC2, -1

DuskHouse3NPC1:
	jumptextfaceplayer DuskHouse3NPC1Text
	
DuskHouse3NPC2:
	jumptextfaceplayer DuskHouse3NPC2Text
	
DuskHouse3NPC1Text:
	text "This used to be"
	line "such a nice place"
	cont "to live."
	
	para "Then that MOOMOO's"
	line "starting drawing"
	cont "in a bad crowd…"
	
	para "Now it's noisy,"
	line "smelly, and"
	cont "dangerous outside!"
	done
	
DuskHouse3NPC2Text:
	text "I'm a waitress at"
	line "MOOMOO's and I'm"
	cont "totally fed up!"
	
	para "The work is hard,"
	line "the pay is low,"
	cont "and the customers"
	cont "are total creeps!"
	
	para "Maybe I'll slip on"
	line "an ice cube and"
	cont "get workers'"
	cont "compensation!"
	done
	