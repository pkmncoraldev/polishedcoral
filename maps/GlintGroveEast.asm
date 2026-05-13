GlintGroveEast_MapScriptHeader:
	db 1 ; scene scripts
	scene_script GlintGroveEastTrigger0

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 11, 13, 1, GLINT_GROVE_UNDERGROUND

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	itemball_event 10, 18, SHINY_STONE, 1, EVENT_GLINT_GROVE_EAST_POKE_BALL
	strengthboulder_event 12, 15, EVENT_GLINT_GROVE_EAST_BOULDER_1
	strengthboulder_event 13, 16, EVENT_GLINT_GROVE_EAST_BOULDER_2
	
GlintGroveEastTrigger0:
	special Special_UpdatePalsInstant
	end
	
