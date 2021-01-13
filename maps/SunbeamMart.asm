SunbeamMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 1, SUNBEAM_ISLAND
	warp_def 7, 3, 1, SUNBEAM_ISLAND

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	mart_clerk_event  1,  3, MARTTYPE_STANDARD, MART_SUNBEAM
	person_event SPRITE_SUPER_NERD, 3, 8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SunbeamMartNPC1, -1
	person_event SPRITE_CHILD, 5, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SunbeamMartNPC2, -1

	const_def 1 ; object constants
	const SUNBEAMMART_CLERK
	const SUNBEAMMART_NPC1
	const SUNBEAMMART_NPC2
	
SunbeamMartNPC1:
	jumptextfaceplayer SunbeamMartNPC1Text
	
SunbeamMartNPC2:
	jumptextfaceplayer SunbeamMartNPC2Text
	
SunbeamMartNPC1Text:
	text "Alright!"
	
	para "GREAT BALLS!"
	
	para "That's great!"
	done
	
SunbeamMartNPC2Text:
	text "I found some weird"
	line "candy called"
	cont "“RARE CANDY.”"
	
	para "It was gross!"
	
	para "I'm glad it's"
	line "so rare."
	done