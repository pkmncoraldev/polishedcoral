BrightMart_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, BRIGHTBURG, 2
	warp_event  2,  7, BRIGHTBURG, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_CLERK,  3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrightMartClerk, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_SUPER_NERD,  6,  6, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightMartClerk, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_POKEFAN_F,  2,  9, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrightMartNPC, EVENT_BRIGHTBURG_REVEALED


BrightMartClerk:
	jumptextfaceplayer BrightMartClerkText
	
BrightMartNPC:
	jumptextfaceplayer BrightMartNPCText
	
BrightMartClerkText:
	text "…"
	
	para "…"
	
	para "He has a vacant"
	line "smile on his face…"
	done
	
BrightMartNPCText:
	text "…"
	
	para "…"
	
	para "She has a vacant"
	line "smile on her face…"
	done

