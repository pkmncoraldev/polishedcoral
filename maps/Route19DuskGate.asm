Route19DuskGate_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 4, 0, 1, ROUTE_19
	warp_def 5, 0, 2, ROUTE_19
	warp_def 4, 9, 1, DUSK_TURNPIKE
	warp_def 5, 9, 2, DUSK_TURNPIKE

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_OFFICER, 2, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route19DuskGateOfficer, -1
	
	
Route19DuskGateOfficer:
	jumptextfaceplayer Route19DuskGateOfficerText
	
Route19DuskGateOfficerText:
	text "My friend is the"
	line "guard of the gate"
	cont "near RADIANT TOWN."
	
	para "He always talks"
	line "about how slow and"
	cont "boring it is."
	
	para "I wish we could"
	line "trade places!"
	done
	