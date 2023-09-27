RadiantOrphanage2F_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, RadiantOrphanage2FCallback

	db 1 ; warp events
	warp_def  2,  6, 4, RADIANT_ORPHANAGE_1F

	db 0 ; coord events

	db 1 ; bg events
	signpost  2,  8, SIGNPOST_READ, RadiantOrphanage2FPhoto

	db 7 ; object events
	object_event  1,  2, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomRose, EVENT_RADIANT_GYM_ACTIVE
	object_event  3,  2, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomLily, EVENT_RADIANT_GYM_ACTIVE
	object_event  5,  2, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomIris, EVENT_RADIANT_GYM_ACTIVE
	object_event  1,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomPoppy, EVENT_RADIANT_GYM_ACTIVE
	object_event  5,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomViolet, EVENT_RADIANT_GYM_ACTIVE
	object_event  7,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomClover, EVENT_RADIANT_GYM_ACTIVE
	object_event  3,  6, SPRITE_PIGTAILS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, RadiantOrphanageLeilanisRoomFelicia, EVENT_RADIANT_GYM_ACTIVE


	const_def 1 ; object constants
	const RADIANT_ORPHANAGE_2F_ROSE
	const RADIANT_ORPHANAGE_2F_LILY
	const RADIANT_ORPHANAGE_2F_IRIS
	const RADIANT_ORPHANAGE_2F_POPPY
	const RADIANT_ORPHANAGE_2F_VIOLET
	const RADIANT_ORPHANAGE_2F_CLOVER
	const RADIANT_ORPHANAGE_2F_FELICIA

RadiantOrphanage2FCallback:
	checkevent EVENT_SAVED_ALL_LOST_GIRLS
	iftrue .end
	moveperson RADIANT_ORPHANAGE_2F_ROSE, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_LILY, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_IRIS, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_POPPY, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_VIOLET, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_CLOVER, -5, -5
	moveperson RADIANT_ORPHANAGE_2F_FELICIA, -5, -5
.end
	return

RadiantOrphanage2FPhoto:
	checkevent EVENT_LOST_GIRLS_QUEST_ACTIVE
	iftrue .know_erika
	jumptext RadiantOrphanage2FPhotoText1
.know_erika
	jumptext RadiantOrphanage2FPhotoText2
	
RadiantOrphanage2FPhotoText1:
	text "A photo of a"
	line "middle-aged woman"
	cont "and a little girl."
	
	para "They are wearing"
	line "kimonos."
	done
	
RadiantOrphanage2FPhotoText2:
	text "A photo of a much"
	line "younger looking"
	cont "LEILANI and a"
	cont "little girl."
	
	para "They are wearing"
	line "kimonos."
	done