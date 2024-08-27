Route23Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_event  3,  0, CROSSROADS, 4
	warp_event  4,  0, CROSSROADS, 5
	warp_event  3,  7, ROUTE_23, 1
	warp_event  4,  7, ROUTE_23, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, Route23Officer, -1
	
	const_def 1 ; object constants
	
Route23Officer:
	jumptext Route23OfficerText
	
Route23OfficerText:
	text "ROUTE 23 can get"
	line "pretty windy."
	
	para "Watch out!"
	done