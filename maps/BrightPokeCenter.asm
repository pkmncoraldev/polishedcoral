BrightPokeCenter_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, BrightPokeCenterCallback

	db 2 ; warp events
	warp_event  4,  7, BRIGHTBURG, 1
	warp_event  5,  7, BRIGHTBURG, 1

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	pc_nurse_event  4, 1
	pc_chansey_event  5, 1
	person_event SPRITE_BOWING_NURSE,  1, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNurse, EVENT_BRIGHTBURG_REVEALED
	object_event 5, 1, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, CHANSEY, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, BrightPokeCenterChansey, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_GENTLEMAN,  6,  9, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNPC1, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_POKEFAN_M,  4,  2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNPC1, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_BATTLE_GIRL,  2, 11, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNurse, EVENT_BRIGHTBURG_REVEALED
	person_event SPRITE_POKEMANIAC,  3, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, BrightPokeCenterNPC1, EVENT_BRIGHTBURG_REVEALED


BrightPokeCenterCallback:
	checkevent EVENT_BRIGHTBURG_REVEALED
	iftrue .done
	moveperson 1, -5, -5
	moveperson 2, -5, -5
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
	