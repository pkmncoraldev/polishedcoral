Skatepark_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 41,  1, 7, FLICKER_STATION

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_OFFICER, 26, 16, SPRITEMOVEDATA_STANDING_RIGHT, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SkateparkDemoNPC, -1
	person_event SPRITE_VALVE_2, 42,  9, SPRITEMOVEDATA_HALFPIPE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_VALVE_2, 42, 15, SPRITEMOVEDATA_HALFPIPE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1

SkateparkDemoNPC:
	faceplayer
	opentext
	writetext SkateparkDemoNPCText
	yesorno
	iffalse .end
	closetext
	warpfacing DOWN, ROUTE_11_GATE, 4, 6
	end
.end
	closetext
	end
	
SkateparkDemoNPCText:
	text "Would you like"
	line "to leave the"
	cont "SKATEPARK?"
	done