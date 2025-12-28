Route11House_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  2,  7, ROUTE_11_2, 2
	warp_event  3,  7, ROUTE_11_2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route11HouseNPC, -1
	
	
Route11HouseNPC:
	jumptextfaceplayer Route11HouseNPCText
	
Route11HouseNPCText:
	text "I used to love"
	line "living here."
	
	para "It was so nice"
	line "and secluded."
	
	para "Ever since they"
	line "built that darn"
	cont "bridge,"
	
	para "things have been"
	line "so noisy!"
	
	para "Bah!"
	
	para "Even my sweet lil"
	line "poochy has gotten"
	cont "so irritable that"
	cont "I have to keep"
	cont "her outside!"
	done