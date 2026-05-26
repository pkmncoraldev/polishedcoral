LakeOnwaMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, LAKE_ONWA, 8
	warp_event  3,  7, LAKE_ONWA, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_LAKE_ONWA
	person_event SPRITE_HIKER, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LakeOnwaMartNpc, -1

	const_def 1 ; object constants
	const LAKE_ONWA_CLERK
	
LakeOnwaMartNpc:
	jumptextfaceplayer LakeOnwaMartNpcText
	
LakeOnwaMartNpcText:
	text "When hiking, I"
	line "always remember"
	cont "what my GRANDPAPPY"
	cont "told me:"
	
	para "“When in a cave,"
	line "REPEL is your best"
	cont "friend!”"
	
	para "Wise man, my old"
	line "GRANDPAPPY!"
	done
	