RadiantMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, RADIANT_TOWNSHIP, 6
	warp_event  3,  7, RADIANT_TOWNSHIP, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_RADIANT
	person_event SPRITE_REDS_MOM,  3,  5, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RadiantMartNPC1, -1


RadiantMartNPC1:
	jumptextfaceplayer RadiantMartNPC1Text
	
RadiantMartNPC1Text:
	text "I love mixing"
	line "SWEET HONEY into"
	cont "my tea."
	
	para "It can really help"
	line "improve the taste."
	
	para "Too bad they don't"
	line "sell it at the"
	cont "#MART!"
	done