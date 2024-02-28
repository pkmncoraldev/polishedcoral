Brightburg_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, BrightburgFlyPoint

	db 5 ; warp events
	warp_event 17,  9, BRIGHT_POKECENTER, 1
	warp_event  3,  9, BRIGHT_MART, 1
	warp_event  3, 18, BRIGHT_HOUSE_1, 1
	warp_event 13, 16, BRIGHT_HOUSE_2, 1
	warp_event 19, 16, BRIGHT_HOUSE_3, 1

	db 0 ; coord events

	db 5 ; bg events
	signpost 14, 16, SIGNPOST_ITEM + QUICK_POWDER, EVENT_BRIGHTBURG_HIDDEN_QUICK_POWDER
	signpost 21, 17, SIGNPOST_ITEM + METAL_POWDER, EVENT_BRIGHTBURG_HIDDEN_METAL_POWDER
	signpost  9, 18, SIGNPOST_READ, BrightburgPokeCenterSign
	signpost  9,  4, SIGNPOST_READ, BrightburgMartSign
	signpost 12,  9, SIGNPOST_READ, BrightburgSign

	db 4 ; object events
	person_event SPRITE_GRANNY,  8, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrightburgNPC1, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_REDS_MOM, 11,  8, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightburgNPC2, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_CHILD, 17, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_YOUNGSTER, 17,  9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, BrightburgNPC4, -1

	const_def 1 ; object constants
	const BRIGHTBURG_NPC_1
	const BRIGHTBURG_NPC_2
	const BRIGHTBURG_NPC_3

BrightburgFlyPoint:
	setflag ENGINE_FLYPOINT_BRIGHT
	return
	
BrightburgPokeCenterSign:
	jumpstd pokecentersign
	
BrightburgMartSign:
	jumpstd martsign
	
BrightburgSign:
	jumptext BrightburgSignText
	
BrightburgNPC1:
	faceplayer
	opentext
	writetext BrightburgNPCFemaleText
	waitbutton
	closetext
	spriteface BRIGHTBURG_NPC_1, DOWN
	end
	
BrightburgNPC2:
	jumptextfaceplayer BrightburgNPCFemaleText
	
BrightburgNPC3:
	jumptextfaceplayer BrightburgNPCMaleText
	
BrightburgNPC4:
	jumptextfaceplayer BrightburgNPC4Text
	
BrightburgNPCMaleText:
	text "…"
	
	para "…"
	
	para "He has a vacant"
	line "smile on his face…"
	done
	
BrightburgNPCFemaleText:
	text "…"
	
	para "…"
	
	para "She has a vacant"
	line "smile on her face…"
	done
	
BrightburgNPC4Text:
	text "No one here will"
	line "speak to me…"
	
	para "Does my breath"
	line "stink?"
	done
	
BrightburgSignText:
	text "BRIGHTBURG"
	
	line "A happy little"
	cont "community."
	done
	