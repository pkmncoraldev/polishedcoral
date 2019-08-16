Route5Gate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 0, 3, 1, ROUTE_5
	warp_def 0, 4, 2, ROUTE_5
	warp_def 7, 3, 1, ROUTE_6
	warp_def 7, 4, 1, ROUTE_6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, OfficerScript_0x19ab0b, -1

	const_def 1 ; object constants
	const ROUTE5ROUTE6GATE_OFFICER
	
OfficerScript_0x19ab0b:
	faceplayer
	opentext
	writetext UnknownText_0x19ab1f
	waitbutton
	closetext
	end

UnknownText_0x19ab1f:
	text "South of here is"
	line "SUNBEAM ISLAND."

	para "The #MON PROF."
	line "conductes his"
	
	para "research on the"
	line "island."
	done