BrightHouse1_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrightHouse1Trigger0
	scene_script BrightHouse1Trigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRIGHTBURG, 3
	warp_event  3,  7, BRIGHTBURG, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_CUTE_GIRL,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightburgNPC2, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_COOL_DUDE,  3,  5, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	

BrightHouse1Trigger0:
	end
	
BrightHouse1Trigger1:
	disappear 1
	disappear 2
	dotrigger $0
	end
