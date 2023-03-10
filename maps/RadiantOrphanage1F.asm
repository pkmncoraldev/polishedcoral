RadiantOrphanage1F_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  4, 4, RADIANT_TOWNSHIP
	warp_def  9,  5, 4, RADIANT_TOWNSHIP

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  5, SPRITE_LEILANI, SPRITEMOVEDATA_STEAM, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
