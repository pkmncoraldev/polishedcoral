Route31_MapScriptHeader:
	db 1 ; scene scripts
	scene_script Route31Trigger0

	db 0 ; callbacks

	db 1 ; warp events
	warp_def  3, 49, 1, BONE_CAVERN_B1F

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	strengthboulder_event 48, 12, -1
	strengthboulder_event 28,  4, -1
	strengthboulder_event 29,  5, -1
	person_event SPRITE_YOUNGSTER,  4, 31, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route32StrengthMan, -1
	smashrock_event 28,  5
	smashrock_event 29,  4
	smashrock_event 49,  5
	smashrock_event 48,  4
	
	
Route31Trigger0:
	special Special_UpdatePalsInstant
	end
