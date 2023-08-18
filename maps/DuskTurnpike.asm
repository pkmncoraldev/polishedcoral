DuskTurnpike_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DuskTurnpikeTrigger0
	scene_script DuskTurnpikeTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, DuskTurnpikeCallback

	db 15 ; warp events
	warp_event  8, 28, ROUTE_18_DUSK_GATE, 3
	warp_event  8, 29, ROUTE_18_DUSK_GATE, 4
	warp_event  7, 13, ROUTE_21_TUNNEL, 1
	warp_event  7, 14, ROUTE_21_TUNNEL, 2
	warp_event  7, 15, ROUTE_21_TUNNEL, 3
	warp_event  7, 16, ROUTE_21_TUNNEL, 4
	warp_event  7, 17, ROUTE_21_TUNNEL, 5
	warp_event 25, 23, DUSK_AUTO_LOBBY, 1
	warp_event 27, 23, DUSK_AUTO_GARAGE, 3
	warp_event 28, 23, DUSK_AUTO_GARAGE, 6
	warp_event 23, 31, DUSK_POKECENTER, 1
	warp_event 31, 31, DUSK_MART, 1
	warp_event 13, 27, DUSK_HOUSE_1, 1
	warp_event 13, 33, DUSK_HOUSE_2, 1
	warp_event 27, 31, DUSK_HOUSE_3, 1

	db 0 ; coord events

	db 13 ; bg events
	signpost 21, 31, SIGNPOST_JUMPTEXT, DuskTurnpikeBrokenCar
	signpost 21, 32, SIGNPOST_JUMPTEXT, DuskTurnpikeBrokenCar
	signpost 20, 23, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 20, 33, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 24, 29, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 21, 22, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 22, 22, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 32, 18, SIGNPOST_JUMPTEXT, DuskTurnpikeSign
	signpost 21, 18, SIGNPOST_JUMPTEXT, DuskTurnpikeHighwaySign
	signpost  6, 15, SIGNPOST_READ, DuskTurnpikeTrashcan
	signpost 31, 24, SIGNPOST_READ, DuskTurnpikePokeCenterSign
	signpost 31, 32, SIGNPOST_READ, DuskTurnpikeMartSign
	signpost 13, 29, SIGNPOST_READ, DuskTurnpikeTollbooth
	

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
	changeblock $0c, $0e, $a5
	changeblock $18, $0e, $a5
	changeblock $22, $0e, $a5
	changeblock $2c, $0e, $a5
	changeblock $0c, $10, $a4
	changeblock $18, $10, $a4
	changeblock $22, $10, $a4
	changeblock $2c, $10, $a4
	changeblock $1c, $0c, $f2
	changeblock $16, $14, $f4
	changeblock $16, $16, $f8
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
	changeblock $0c, $0e, $a5
	changeblock $18, $0e, $a5
	changeblock $22, $0e, $a5
	changeblock $2c, $0e, $a5
	changeblock $0c, $10, $a4
	changeblock $18, $10, $a4
	changeblock $22, $10, $a4
	changeblock $2c, $10, $a4
	changeblock $1c, $0c, $f2
	changeblock $16, $14, $f6
	changeblock $16, $16, $fa
	setflag ENGINE_STREETLIGHTS
.notnite
	checkevent EVENT_ROUTE_21_TRASHCAN
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

DuskTurnpikeTollbooth:
	setevent EVENT_TALKED_TO_TOLL_BOOTH
	jumptext DuskTurnpikeTollboothText1

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
	
DuskTurnpikePokeCenterSign:
	jumpstd pokecentersign
	
DuskTurnpikeMartSign:
	jumpstd martsign
	
DuskTurnpikeSign:
	text "DUSK TURNPIKE"
	
	para "A breif pit-stop"
	line "along the road."
	done
	
DuskTurnpikeHighwaySign:
	text "ROUTE 21 HIGHWAY"
	line "ahead."
	
	para "Motor vehicles"
	line "only."
	done

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
	
DuskTurnpikeTollboothText1:
	text "Motor vehicles"
	line "only past this"
	cont "point."
	
	para "Sorry, that's the"
	line "rule."
	done