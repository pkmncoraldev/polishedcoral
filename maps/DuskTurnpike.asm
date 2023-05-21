DuskTurnpike_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DuskTurnpikeTrigger0
	scene_script DuskTurnpikeTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DuskTurnpikeCallback

	db 7 ; warp events
	warp_event  8, 28, ROUTE_17, 1
	warp_event  8, 29, ROUTE_17, 2
	warp_event  7, 13, ROUTE_20_TUNNEL, 1
	warp_event  7, 14, ROUTE_20_TUNNEL, 2
	warp_event  7, 15, ROUTE_20_TUNNEL, 3
	warp_event  7, 16, ROUTE_20_TUNNEL, 4
	warp_event  7, 17, ROUTE_20_TUNNEL, 5

	db 0 ; coord events

	db 8 ; bg events
	signpost 21, 31, SIGNPOST_JUMPTEXT, DuskTurnpikeBrokenCar
	signpost 21, 32, SIGNPOST_JUMPTEXT, DuskTurnpikeBrokenCar
	signpost 20, 23, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 20, 33, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 22, 30, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 23, 30, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 24, 29, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost  6, 15, SIGNPOST_READ, DuskTurnpikeTrashcan
	

	db 1 ; object events
	person_event SPRITE_PLANK_BRIDGE,  5, 20, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


DuskTurnpikeTrigger0:
DuskTurnpikeTrigger1:
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<NITE
	iffalse .end
	changeblock $22, $0a, $5b
	changeblock $2c, $0a, $5b
	changeblock $0c, $0c, $a1
	changeblock $18, $0c, $a1
	changeblock $22, $0c, $a1
	changeblock $2c, $0c, $a1
	changeblock $0c, $0e, $a2
	changeblock $18, $0e, $a2
	changeblock $22, $0e, $a2
	changeblock $2c, $0e, $a2
	changeblock $0c, $10, $a4
	changeblock $18, $10, $a4
	changeblock $22, $10, $a4
	changeblock $2c, $10, $a4
	changeblock $1c, $0c, $f2
	changeblock $16, $14, $f6
	changeblock $16, $16, $fa
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm DuskTurnpikeStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock $22, $0a, $a8
	changeblock $2c, $0a, $5b
	changeblock $0c, $0c, $a9
	changeblock $18, $0c, $a9
	changeblock $22, $0c, $a9
	changeblock $2c, $0c, $a9
	changeblock $0c, $0e, $4e
	changeblock $18, $0e, $20
	changeblock $22, $0e, $20
	changeblock $2c, $0e, $4e
	changeblock $0c, $10, $aa
	changeblock $18, $10, $aa
	changeblock $22, $10, $aa
	changeblock $2c, $10, $aa
	changeblock $1c, $0c, $f3
	changeblock $16, $14, $85
	changeblock $16, $16, $89
	clearflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm DuskTurnpikeStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end

DuskTurnpikeCallback:
	checktime 1<<NITE
	iffalse .notnite
	changeblock $22, $0a, $5b
	changeblock $2c, $0a, $5b
	changeblock $0c, $0c, $a1
	changeblock $18, $0c, $a1
	changeblock $22, $0c, $a1
	changeblock $2c, $0c, $a1
	changeblock $0c, $0e, $a2
	changeblock $18, $0e, $a2
	changeblock $22, $0e, $a2
	changeblock $2c, $0e, $a2
	changeblock $0c, $10, $a4
	changeblock $18, $10, $a4
	changeblock $22, $10, $a4
	changeblock $2c, $10, $a4
	changeblock $1c, $0c, $f2
	changeblock $16, $14, $f6
	changeblock $16, $16, $fa
	setflag ENGINE_STREETLIGHTS
.notnite
	checkevent EVENT_ROUTE_20_TRASHCAN
	iffalse .end
	changeblock $0e, $06, $e7
.end
	return

DuskTurnpikeStreetlightPaletteUpdateThingMoreWordsExtraLongStyle:
	farcall CheckCurrentMapXYTriggers
	ret nc
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapScriptHeaderBank]
	farjp CallScript

DuskTurnpikeTrashcan:
	checkevent EVENT_LUSTER_TRASHCAN_1
	iftrue .OnlyTrash
	changeblock $0e, $06, $e7
	setevent EVENT_LUSTER_TRASHCAN_1
	opentext
	writetext DuskTurnpikeTrashcanText1
	playsound SFX_SANDSTORM
	waitsfx
	buttonsound
	checkevent EVENT_LUSTER_TRASHCAN_1_ITEM
	iffalse .get_item
	callasm DuskTurnpikeTrashcanAsm
	closetext
	end
	
.get_item
	verbosegiveitem LEFTOVERS
	closetext
	setevent EVENT_LUSTER_TRASHCAN_1_ITEM
	end
	
.OnlyTrash
	jumptext DuskTurnpikeTrashcanTextOnlyTrash

DuskTurnpikeTrashcanAsm:
	farcall TrashMonEncounter
	ld a, BANK(LusterTrashcanWildBattleScript)
	ld hl, LusterTrashcanWildBattleScript
	call CallScript
	scf
	ret
	
DuskTurnpikeTrashcanWildBattleScript:
	copybytetovar wTempWildMonSpecies
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

DuskTurnpikeTrashcanText1:
	text "<PLAYER> dug"
	line "through the trash…"
	
	para "Rustle… rustle…"
	done

DuskTurnpikeTrashcanTextOnlyTrash:
	text "Nope, there's"
	line "only trash here."
	done

DuskTurnpikeBrokenCar:
	text "A broken down car."
	done
	
DuskTurnpikeTire:
	text "Tires are stacked"
	line "around randomly."
	done