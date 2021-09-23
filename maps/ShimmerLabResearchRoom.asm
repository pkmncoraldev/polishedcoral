ShimmerLabResearchRoom_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  5,  9, SHIMMER_LAB_LOBBY, 3
	warp_event  6,  9, SHIMMER_LAB_LOBBY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SCIENTIST,  1,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerLabResearchRoom, -1
	
	
ShimmerLabResearchRoom:
	setevent EVENT_CAN_GO_TO_DESERT
	end
