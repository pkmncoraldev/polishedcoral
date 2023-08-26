LakeOnwaMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, LAKE_ONWA, 8
	warp_event  3,  7, LAKE_ONWA, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_LAKE_ONWA

	const_def 1 ; object constants
	const LAKE_ONWA_CLERK
	