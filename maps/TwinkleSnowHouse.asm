TwinkleSnowHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  9,  1, 5, TWINKLE_TOWN
	warp_def  9,  2, 5, TWINKLE_TOWN

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_POKEFAN_M, 5, 6, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TwinkleSnowHouseNpc1, -1
	person_event SPRITE_GRANNY, 3, 2, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, TwinkleSnowHouseNpc2, -1
	
TwinkleSnowHouseNpc1:
	jumptextfaceplayer TwinkleSnowHouseNpc1Text
	
TwinkleSnowHouseNpc2:
	jumptextfaceplayer TwinkleSnowHouseNpc2Text
	
TwinkleSnowHouseNpc1Text:
	text "Ma's always on my"
	line "case to shovel the"
	cont "yard."
	
	para "She says it's why"
	line "her friends dont"
	cont "come to visit!"
	
	para "I think it's cuz"
	line "she won't stop"
	cont "naggin'!"
	done
	
TwinkleSnowHouseNpc2Text:
	text "No one ever comes"
	line "to visit…"
	
	para "I don't blame them,"
	line "though."
	
	para "It's all because my"
	line "good-for-nothing"
	cont "son won't shovel"
	cont "the yard!"
	done