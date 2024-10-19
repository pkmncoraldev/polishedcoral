ObscuraMuseumPhoto_MapScriptHeader:
	db 1 ; scene scripts
	scene_script ObscuraMuseumPhotoTrigger0

	db 0 ; callbacks

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	person_event SPRITE_RECEPTIONIST,  3,  2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum2FPhotoLady, -1
	person_event SPRITE_RAINBOW_SILVER_WING,  1,  3, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MUSEUM_STANDEE,  1,  2, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GOLD_TROPHY,  1,  3, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_PICNIC,  1,  2, SPRITEMOVEDATA_DEALER_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


ObscuraMuseumPhotoTrigger0:
	waitbuttonsilent
	special FadeOutPalettes
	warp2 UP, PLAYER_HOUSE_2F, 8, 1
	end