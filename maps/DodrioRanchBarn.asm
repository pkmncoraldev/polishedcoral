DodrioRanchBarn_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 3, 4, ROUTE_9
	warp_def 7, 4, 4, ROUTE_9

	db 0 ; coord events

	db 9 ; bg events
	signpost  6,  0, SIGNPOST_READ, RanchLogs
	signpost  7,  1, SIGNPOST_READ, RanchLogs
	signpost  7,  7, SIGNPOST_READ, RanchLogs
	signpost  7,  8, SIGNPOST_READ, RanchLogs
	signpost  7,  9, SIGNPOST_READ, RanchLogs
	signpost  7, 10, SIGNPOST_READ, RanchLogs
	signpost  5, 12, SIGNPOST_READ, RanchLogs
	signpost  6, 13, SIGNPOST_READ, RanchLogs
	signpost  7, 13, SIGNPOST_READ, RanchLogs

	db 4 ; object events
	person_event SPRITE_DODRIO, 5, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDodrio2, -1
	person_event SPRITE_DODUO, 2, 9, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	person_event SPRITE_DODUO, 2, 3, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RanchDoduo, -1
	person_event SPRITE_ROCKER, 5, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RanchBarnNPC, -1

	const_def 1 ; object constants
	const RANCHBARN_DODRIO
	const RANCHBARN_DODUO1
	const RANCHBARN_DODUO2
	const RANCHBARN_NPC
	
RanchBarnNPC:
	faceplayer
	opentext
	writetext RanchBarnNPCText
	waitbutton
	closetext
	spriteface RANCHBARN_NPC, LEFT
	end
	
RanchBarnNPCText:
	text "It's my job to"
	line "take care of all"
	cont "the #MON."
	
	para "It's real hard"
	line "work…"
	done
