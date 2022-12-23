LusterMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 2, LUSTER_CITY_RESIDENTIAL
	warp_def 7, 3, 2, LUSTER_CITY_RESIDENTIAL

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_LUSTER
	person_event SPRITE_MATRON, 6, 6, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, LusterMartNPC1, -1
	person_event SPRITE_CUTE_GIRL, 3, 9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LusterMartNPC2, -1
	person_event SPRITE_CHILD, 2, 5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterMartNPC3, -1
	
	const_def 1 ; object constants
	const LUSTER_MART_CLERK
	const LUSTER_MART_NPC1
	const LUSTER_MART_NPC2
	const LUSTER_MART_NPC3
	
LusterMartNPC1:
	jumptextfaceplayer LusterMartNPC1Text
	
LusterMartNPC2:
	jumptextfaceplayer LusterMartNPC2Text
	
LusterMartNPC3:
	faceplayer
	opentext
	writetext LusterMartNPC3Text
	waitbutton
	closetext
	spriteface LUSTER_MART_NPC3, UP
	end
	
LusterMartNPC1Text:
	text "Since the MALL is"
	line "always so busy,"
	
	para "I've started doing"
	line "my shopping here"
	cont "instead."
	
	para "They even have"
	line "things the MALL"
	cont "doesn't sell!"
	done
	
LusterMartNPC2Text:
	text "I was jumped by"
	line "a wild #MON"
	cont "in the streets!"
	
	para "Even in a city"
	line "like this, it's"
	cont "good to be"
	cont "prepared."
	done
	
LusterMartNPC3Text:
	text "Wow!"
	
	para "Lots of #MON"
	line "merchandise!"
	done
	
