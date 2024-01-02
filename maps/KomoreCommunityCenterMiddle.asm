KomoreCommunityCenterMiddle_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 4 ; warp events
	warp_def  4,  5, 3, KOMORE_COMMUNITY_CENTER_RIGHT
	warp_def  5,  5, 4, KOMORE_COMMUNITY_CENTER_RIGHT
	warp_def  4,  0, 1, KOMORE_COMMUNITY_CENTER_LEFT
	warp_def  5,  0, 1, KOMORE_COMMUNITY_CENTER_LEFT

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
