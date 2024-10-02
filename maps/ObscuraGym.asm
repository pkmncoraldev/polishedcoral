ObscuraGym_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  5,  2, 2, OBSCURA_MUSEUM_2F
	warp_def  5,  3, 3, OBSCURA_MUSEUM_2F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_ROCKY,  1,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraGymRocky, -1
	
ObscuraGymRocky:
	end
