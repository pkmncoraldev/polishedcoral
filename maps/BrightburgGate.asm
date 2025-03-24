BrightburgGate_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrightburgGateTrigger0
	scene_script BrightburgGateTrigger1

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 4, 0, 6, BRIGHTBURG
	warp_def 5, 0, 7, BRIGHTBURG
	warp_def 4, 9, 1, ROUTE_30
	warp_def 5, 9, 2, ROUTE_30

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_OFFICER, 4, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_OFFICER, 5, 9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	
BrightburgGateTrigger0:
	end
	
BrightburgGateTrigger1:
	disappear 1
	disappear 2
	disappear 3
	dotrigger $0
	end