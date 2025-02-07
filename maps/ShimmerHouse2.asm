ShimmerHouse2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, SHIMMER_CITY, 25
	warp_event  3,  7, SHIMMER_CITY, 25

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_PONYTAIL,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ShimmerHouse2NPC, -1
	
ShimmerHouse2NPC:
	jumptextfaceplayer ShimmerHouse2NPCText
	
ShimmerHouse2NPCText:
	text "My husband shipped"
	line "off one day and"
	cont "never returned."
	
	para "I wonder if he's"
	line "really out there"
	cont "somewhere…"
	done