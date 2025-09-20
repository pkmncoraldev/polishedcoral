LakeOnwaMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, LAKE_ONWA, 8
	warp_event  3,  7, LAKE_ONWA, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_LAKE_ONWA
	person_event SPRITE_PONYTAIL, 2, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LakeOnwaMartNpc1, -1
	person_event SPRITE_HIKER, 7, 9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LakeOnwaMartNpc2, -1

	const_def 1 ; object constants
	const LAKE_ONWA_CLERK
	
LakeOnwaMartNpc1:
	jumptextfaceplayer LakeOnwaMartNpc1Text
	
LakeOnwaMartNpc1Text:
	text "It gets pretty hot"
	line "the deeper into"
	cont "MT. ONWA you dive."
	
	para "If you just want"
	line "to get through"
	cont "the mountain,"
	
	para "you'll be better"
	line "off moving upward."
	done
	
LakeOnwaMartNpc2:
	jumptextfaceplayer LakeOnwaMartNpc2Text
	
LakeOnwaMartNpc2Text:
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
	