BrightPokeCenter_MapScriptHeader:
	db 2 ; scene scripts
	scene_script BrightPokeCenterTrigger0
	scene_script BrightPokeCenterTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BrightPokeCenterCallback

	db 2 ; warp events
	warp_event  4,  7, BRIGHTBURG, 1
	warp_event  5,  7, BRIGHTBURG, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11,  1, SIGNPOST_ITEM + TAPE_PLAYER, EVENT_MUSIC_POKEMON_CENTER

	db 9 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, -5, -5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_BOWING_NURSE,  1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNurse, EVENT_BRIGHTBURG_REVEALED
	object_event 5, 1, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CHANSEY, -1, -1, PAL_NPC_PURPLE, PERSONTYPE_SCRIPT, 0, BrightPokeCenterChansey, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_GENTLEMAN,  6,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNPC1, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_POKEFAN_M,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNPC1, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_PONYTAIL,  3, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNurse, EVENT_BRIGHTBURG_REVEALED
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	hiddentape_event 11,  1, MUSIC_POKEMON_CENTER, 1, EVENT_MUSIC_POKEMON_CENTER


BrightPokeCenterTrigger0:
	end
	
BrightPokeCenterTrigger1:
	disappear 1
	disappear 2
	disappear 3
	disappear 4
	disappear 5
	disappear 6
	disappear 7
	disappear 8
	disappear 9
	dotrigger $0
	end

BrightPokeCenterCallback:
	checkevent EVENT_BRIGHT_CENTER_MART_EMPTY
	iftrue .empty
	checkevent EVENT_BRIGHTBURG_REVEALED
	iftrue .done
.empty
	moveperson 7, -5, -5
	moveperson 8, -5, -5
.done
	return

BrightPokeCenterNurse:
	jumptextfaceplayer BrightPokeCenterNurseText
	
BrightPokeCenterChansey:
	jumptext BrightPokeCenterChanseyText
	
BrightPokeCenterNPC1:
	jumptextfaceplayer BrightPokeCenterNPC1Text

BrightPokeCenterNurseText:
	text "…"
	
	para "…"
	
	para "She has a vacant"
	line "smile on her face…"
	done

BrightPokeCenterChanseyText:
	text "…"
	
	para "…"
	
	para "It has a vacant"
	line "smile on its face…"
	done
	
BrightPokeCenterNPC1Text:
	text "…"
	
	para "…"
	
	para "He has a vacant"
	line "smile on his face…"
	done
	