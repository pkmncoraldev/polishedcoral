FakePlayersHouse2F_MapScriptHeader:
	db  2 ; scene scripts
	scene_script FakePlayersHouse2FTrigger0
	scene_script FakePlayersHouse2FTrigger1

	db 0 ; callbacks

	db 1 ; warp events
	warp_event  7,  1, FAKE_PLAYERS_HOUSE_1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events

FakePlayersHouse2FTrigger0:
	end
	
FakePlayersHouse2FTrigger1:
	clearevent EVENT_SKIP_MAP_MUSIC
	playnewmapmusic
	dotrigger $0
	end