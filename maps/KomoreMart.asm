KomoreMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, KOMORE_VILLAGE, 7
	warp_event  2,  7, KOMORE_VILLAGE, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_KOMORE
