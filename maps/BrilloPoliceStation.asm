BrilloPoliceStation_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  9, BRILLO_TOWN, 7
	warp_event  3,  9, BRILLO_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 11 ; object events
	person_event SPRITE_SITTING_POKEFANF,  7,  0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationLady, -1
	object_event  1,  4, SPRITE_SPA_WORKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCaptain, -1
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop1, -1
	object_event  4,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop2, -1
	object_event  5,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop3, -1
	object_event  3,  6, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrilloPoliceStationCop4, -1
	object_event 11,  3, SPRITE_COP_SCRUB, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, -1
	object_event 14,  2, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, NULL, -1
	object_event  8,  7, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, NULL, -1
	object_event 14,  7, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, NULL, -1
	person_event SPRITE_SLOWPOKETAIL,  5,  0, SPRITEMOVEDATA_TILE_UP_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, 0, -1

	const_def 1 ; object constants
	const BRILLO_POLICE_STATION_LADY
	const BRILLO_POLICE_STATION_CAPTAIN
	const BRILLO_POLICE_STATION_COP_1
	const BRILLO_POLICE_STATION_COP_2
	const BRILLO_POLICE_STATION_COP_3
	const BRILLO_POLICE_STATION_COP_4


BrilloPoliceStationLady:
	jumptextfaceplayer BrilloPoliceStationCop4Text

BrilloPoliceStationCaptain:
BrilloPoliceStationCop1:
BrilloPoliceStationCop2:
BrilloPoliceStationCop3:
BrilloPoliceStationCop4:
	jumptextfaceplayer BrilloPoliceStationCop4Text

BrilloPoliceStationCop4Text:
	text "We're hot on the"
	line "tail of an illegal"
	cont "gambling ring!"
	
	para "We've hit a wall in"
	line "the case, though…"
	
	para "And boy is the"
	line "captain mad about"
	cont "it!"
	done
