BrightHouse3_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrightHouse3Trigger0
	scene_script BrightHouse3Trigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, BRIGHTBURG, 5
	warp_event  3,  7, BRIGHTBURG, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_FAT_GUY,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	
	
BrightHouse3Trigger0:
	end
	
BrightHouse3Trigger1:
	disappear 1
	disappear 2
	dotrigger $0
	end
	