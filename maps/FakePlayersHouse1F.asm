FakePlayersHouse1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event  7,  1, FAKE_PLAYERS_HOUSE_2F, 1
	warp_event  2,  7, FAKE_SUNSET_BAY, 1
	warp_event  3,  7, FAKE_SUNSET_BAY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_SILVER, PERSONTYPE_SCRIPT, 0, FakePlayersHouse1FNPCScript, -1
	
FakePlayersHouse1FNPCScript:
	jumptextfaceplayer FakePlayersHouse1FNPCText
	
FakePlayersHouse1FNPCText:
	text "ALL KIDS LEAVE"
	line "HOME SOME DAY."
	
	para "IT SAID SO ON TV."
	done
