BrightMart_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrightMartTrigger0
	scene_script BrightMartTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  7, BRIGHTBURG, 2
	warp_event  2,  7, BRIGHTBURG, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_CLERK,  3, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightMartClerk, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_SUPER_NERD,  6,  6, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightMartClerk, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_REDS_MOM,  2,  9, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightMartNPC, EVENT_BRIGHTBURG_REVEALED


BrightMartTrigger0:
	end
	
BrightMartTrigger1:
	disappear 1
	disappear 2
	disappear 3
	disappear 4
	dotrigger $0
	end

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

