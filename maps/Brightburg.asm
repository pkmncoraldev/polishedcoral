Brightburg_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrightburgTrigger0
	scene_script BrightburgTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, BrightburgFlyPoint

	db 8 ; warp events
	warp_event 17,  9, BRIGHT_POKECENTER, 1
	warp_event  3,  9, BRIGHT_MART, 1
	warp_event  3, 18, BRIGHT_HOUSE_1, 1
	warp_event 13, 16, BRIGHT_HOUSE_2, 1
	warp_event 19, 16, BRIGHT_HOUSE_3, 1
	warp_event 23, 10, BRIGHTBURG_GATE, 1
	warp_event 23, 11, BRIGHTBURG_GATE, 2
	warp_event  9,  5, ROUTE_25_GATE, 3

	db 0 ; coord events

	db 5 ; bg events
	signpost 14, 16, SIGNPOST_ITEM + QUICK_POWDER, EVENT_BRIGHTBURG_HIDDEN_QUICK_POWDER
	signpost 21, 17, SIGNPOST_ITEM + METAL_POWDER, EVENT_BRIGHTBURG_HIDDEN_METAL_POWDER
	signpost  9, 18, SIGNPOST_READ, BrightburgPokeCenterSign
	signpost  9,  4, SIGNPOST_READ, BrightburgMartSign
	signpost 12,  9, SIGNPOST_READ, BrightburgSign

	db 7 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_GRANNY,  8, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC1, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_BIRD_KEEPER, 11,  8, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_BUG_MANIAC, 17, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_POKEFAN_F, 12, 18, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC2, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_CHILD, 12, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightburgNPC3, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_YOUNGSTER, 17,  9, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, BrightburgNPC4, -1
	

	const_def 1 ; object constants
	const BRIGHTBURG_DITTO
	const BRIGHTBURG_NPC_1

BrightburgTrigger0:
	end
	
BrightburgTrigger1:
	disappear 1
	disappear 2
	disappear 3
	disappear 4
	disappear 5
	disappear 6
	dotrigger $0
	end

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
	checkevent EVENT_BRIGHTBURG_REVEALED
	iftrue .ditto_gone
	jumptextfaceplayer BrightburgNPC4Text1
.ditto_gone
	jumptextfaceplayer BrightburgNPC4Text2
	
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
	
BrightburgNPC4Text1:
	text "No one here will"
	line "talk to me…"
	
	para "Do I smell bad"
	line "or something?"
	done
	
BrightburgNPC4Text2:
	text "Hey, where'd"
	line "everyone go?"
	
	para "This place is a"
	line "total ghost town!"
	done
	
BrightburgSignText:
	text "BRIGHTBURG"
	
	para "A happy little"
	line "community."
	done
	