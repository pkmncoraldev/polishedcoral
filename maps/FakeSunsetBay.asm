FakeSunsetBay_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_event 13, 13, FAKE_PLAYERS_HOUSE_1F, 3

	db 0 ; coord events

	db 5 ; bg events
	signpost 27, 25, SIGNPOST_JUMPTEXT, FakeRoute1DoorSignText
	signpost 13, 11, SIGNPOST_JUMPTEXT, FakeRoute1HomeText
	signpost 15, 27, SIGNPOST_JUMPTEXT, FakeRoute1CafeText
	signpost  9, 26, SIGNPOST_JUMPTEXT, FakeRoute1CenterText
	signpost 13, 37, SIGNPOST_JUMPTEXT, FakeRoute1SunsetBayText
	

	db 11 ; object events
	person_event SPRITE_PORYGON_SCREEN,  9, 19, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBayLockedDoor, -1
	person_event SPRITE_PORYGON_SCREEN, 15, 21, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBayLockedDoor, -1
	person_event SPRITE_PORYGON_SCREEN,  9, 31, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBayLockedDoor, -1
	person_event SPRITE_PORYGON_SCREEN,  9, 25, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBayLockedDoor, -1
	person_event SPRITE_PORYGON_SCREEN, 15, 29, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBayLockedDoor, -1
	person_event SPRITE_COOLTRAINER_F, 11, 18, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBaytNPC1, -1
	person_event SPRITE_CUTE_GIRL, 15, 32, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBaytNPC2, -1
	person_event SPRITE_SUPER_NERD, 18, 33, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBaytNPC3, -1
	person_event SPRITE_GRAMPS, 14, 37, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBaytNPC4, -1
	person_event SPRITE_FAT_GUY, 18, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, FakeSunsetBaytNPC5, -1
	person_event SPRITE_ROCKER, 13, 32, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
FakeSunsetBayLockedDoor:
	jumptext FakeRoute1DoorSignText

FakeRoute1HomeText:
	text "HOME OF <PLAYER>"
	done
	
FakeRoute1CafeText:
	text "CAFE"
	done
	
FakeRoute1CenterText:
	text "HEAL YOUR"
	line "MONSTER."
	done
	
FakeRoute1SunsetBayText:
	text "SUNSET BAY"
	done

FakeSunsetBaytNPC1:
	jumptextfaceplayer FakeSunsetBaytNPC1Text
	
FakeSunsetBaytNPC1Text:
	text "NICE SHOES."
	line "PRESS B TO RUN."
	done
	
FakeSunsetBaytNPC2:
	jumptextfaceplayer FakeSunsetBaytNPC2Text
	
FakeSunsetBaytNPC2Text:
	text "I AM ON A DATE."
	done
	
FakeSunsetBaytNPC3:
	jumptextfaceplayer FakeSunsetBaytNPC3Text
	
FakeSunsetBaytNPC3Text:
	text "BUY ITEMS AT"
	line "THE CAFE."
	done
	
FakeSunsetBaytNPC4:
	jumptextfaceplayer FakeSunsetBaytNPC4Text
	
FakeSunsetBaytNPC4Text:
	text "THE LIGHTHOUSE WAS"
	line "BUILT LONG AGO."
	done
	
FakeSunsetBaytNPC5:
	jumptextfaceplayer FakeSunsetBaytNPC5Text
	
FakeSunsetBaytNPC5Text:
	text "OBJECTS WASH UP"
	line "ON THE BEACH."
	done
