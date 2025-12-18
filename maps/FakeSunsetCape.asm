FakeSunsetCape_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  5,  5, FAKE_NORTH_SOUTH_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	signpost  8,  6, SIGNPOST_JUMPTEXT, FakeSunsetCapeSignText

	db 1 ; object events
	person_event SPRITE_PORYGON_SCREEN, 29,  3, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBayLockedDoor, -1
	
FakeSunsetCapeSignText:
	text "ROUTE 1 AHEAD"
	done
