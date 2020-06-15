TwinkleMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 2, TWINKLE_TOWN
	warp_def 7, 3, 2, TWINKLE_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_SUNBEAM
