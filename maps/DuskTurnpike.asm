DuskTurnpike_MapScriptHeader:
	db 2 ; scene scripts
	scene_script DuskTurnpikeTrigger0
	scene_script DuskTurnpikeTrigger1

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, DuskTurnpikeFlyPoint
	callback MAPCALLBACK_TILES, DuskTurnpikeCallback

	db 19 ; warp events
	warp_event  8, 28, ROUTE_19_DUSK_GATE, 3
	warp_event  8, 29, ROUTE_19_DUSK_GATE, 4
	warp_event  9, 13, ROUTE_22_TUNNEL, 1
	warp_event  9, 14, ROUTE_22_TUNNEL, 2
	warp_event  9, 15, ROUTE_22_TUNNEL, 3
	warp_event  9, 16, ROUTE_22_TUNNEL, 4
	warp_event  9, 17, ROUTE_22_TUNNEL, 5
	warp_event 27, 23, DUSK_AUTO_LOBBY, 1
	warp_event 29, 23, DUSK_AUTO_GARAGE, 3
	warp_event 30, 23, DUSK_AUTO_GARAGE, 6
	warp_event 23, 31, DUSK_POKECENTER, 1
	warp_event 31, 31, DUSK_MART, 1
	warp_event 13, 33, DUSK_HOUSE_1, 1
	warp_event 15, 25, DUSK_HOUSE_2, 1
	warp_event 27, 31, DUSK_HOUSE_3, 1
	warp_event 17,  5, BAR_BACK_ALLEY, 2
	warp_event 24,  5, BAR_BACK_ALLEY, 5
	warp_event 19,  7, BAR_INSIDE, 1
	warp_event 20,  7, BAR_INSIDE, 2

	db 48 ; coord events
	xy_trigger 0, 14, 14, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 14, 15, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 13, 14, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 13, 15, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 14, 26, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 14, 27, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 13, 26, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 13, 27, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 17, 14, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 17, 15, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 17, 26, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 0, 17, 27, 0, DuskTurnpikeLight, 0, 0
	xy_trigger 1, 14, 12, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 13, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 12, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 13, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 16, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 17, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 16, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 17, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 24, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 25, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 24, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 25, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 28, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 14, 29, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 28, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 13, 29, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 12, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 13, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 15, 14, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 15, 15, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 16, 14, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 16, 15, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 16, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 17, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 24, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 25, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 15, 26, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 15, 27, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 16, 26, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 16, 27, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 28, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 1, 17, 29, 0, DuskTurnpikeDark, 0, 0
	xy_trigger 0, 14, 35, 0, DuskTurnpikeTollBoothStopsYou1, 0, 0
	xy_trigger 0, 15, 35, 0, DuskTurnpikeTollBoothStopsYou2, 0, 0
	xy_trigger 0, 16, 35, 0, DuskTurnpikeTollBoothStopsYou3, 0, 0
	xy_trigger 0, 17, 35, 0, DuskTurnpikeTollBoothStopsYou4, 0, 0

	db 13 ; bg events
	signpost 22, 32, SIGNPOST_JUMPTEXT, DuskTurnpikeBrokenCar
	signpost 22, 33, SIGNPOST_JUMPTEXT, DuskTurnpikeBrokenCar
	signpost 20, 25, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 20, 32, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 24, 31, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 21, 24, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 22, 24, SIGNPOST_JUMPTEXT, DuskTurnpikeTire
	signpost 30, 19, SIGNPOST_JUMPTEXT, DuskTurnpikeSign
	signpost 20, 21, SIGNPOST_JUMPTEXT, DuskTurnpikeHighwaySign
	signpost  6, 17, SIGNPOST_READ, DuskTurnpikeTrashcan
	signpost 31, 24, SIGNPOST_READ, DuskTurnpikePokeCenterSign
	signpost 31, 32, SIGNPOST_READ, DuskTurnpikeMartSign
	signpost 26, 17, SIGNPOST_JUMPTEXT, DuskTurnpikeDestiny
	

	db 11 ; object events
	person_event SPRITE_INVISIBLE, 13, 35, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, DuskTurnpikeTollbooth, -1
	person_event SPRITE_PLANK_BRIDGE,  5, 22, SPRITEMOVEDATA_TILE_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPA_WORKER, 26, 27, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC1, -1
	person_event SPRITE_COOLTRAINER_F, 30, 15, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC2, -1
	person_event SPRITE_COOL_DUDE, 33, 29, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC3, -1
	person_event SPRITE_SKATER, 23, 20, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC4, -1
	person_event SPRITE_BIKER,  8, 15, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC5, -1
	person_event SPRITE_BIKER,  8, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC6, -1
	person_event SPRITE_BIKER,  8, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC7, -1
	person_event SPRITE_BEAUTY,  8, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC8, EVENT_HIDE_OW_OBJECTS_RED
	person_event SPRITE_BEAUTY,  8, 23, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, DuskTurnpikeNPC8, EVENT_HIDE_OW_OBJECTS_TEAL


	const_def 1 ; object constants
	const DUSK_TOLLBOOTH_GUY

DuskTurnpikeTrigger0:
DuskTurnpikeTrigger1:
	checkflag ENGINE_STREETLIGHTS2
	iftrue .checkmorn
	checktime 1<<NITE
	iftrue .nite
	checkflag ENGINE_STREETLIGHTS
	iftrue .end
	checktime 1<<DUSK
	iftrue .dusk
	jump .end
.nite
	changeblock $16, $14, $f4
	changeblock $16, $16, $f8
	setflag ENGINE_STREETLIGHTS2
.dusk
;	changeblock $22, $0a, $5b
;	changeblock $2c, $0a, $5b
	changeblock $0e, $0c, $a1
	changeblock $1a, $0c, $a1
;	changeblock $22, $0c, $a1
;	changeblock $2c, $0c, $a1
	changeblock $0e, $0e, $a5
	changeblock $1a, $0e, $a5
;	changeblock $22, $0e, $a5
;	changeblock $2c, $0e, $a5
	changeblock $0e, $10, $a4
	changeblock $1a, $10, $a4
;	changeblock $22, $10, $a4
;	changeblock $2c, $10, $a4
	changeblock $22, $0c, $f2
	changeblock $1c, $16, $10
	changeblock $1e, $16, $11
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
;	changeblock $22, $0a, $a8
;	changeblock $2c, $0a, $5b
	changeblock $0e, $0c, $a9
	changeblock $1a, $0c, $a9
;	changeblock $22, $0c, $a9
;	changeblock $2c, $0c, $a9
	changeblock $0e, $0e, $4e
	changeblock $1a, $0e, $20
;	changeblock $22, $0e, $20
;	changeblock $2c, $0e, $4e
	changeblock $0e, $10, $aa
	changeblock $1a, $10, $aa
;	changeblock $22, $10, $aa
;	changeblock $2c, $10, $aa
	changeblock $22, $0c, $f3
	changeblock $1c, $16, $4a
	changeblock $1e, $16, $4b
	changeblock $18, $14, $85
	changeblock $18, $16, $89
	clearflag ENGINE_STREETLIGHTS
	clearflag ENGINE_STREETLIGHTS2
	callasm GenericFinishBridge
	callasm CrossroadsStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
.end
	end
	
DuskTurnpikeFlyPoint:
	setflag ENGINE_FLYPOINT_DUSK
	return

DuskTurnpikeCallback:
	callasm CheckJukeboxSong
	iffalse .skip_music
	loadvar wJukeboxSong, 0
	callasm RestoreDuskTurnpikeMusic
.skip_music
	readvar VAR_PLAYER_COLOR
	if_equal 0, .red
	setevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
	clearevent EVENT_HIDE_OW_OBJECTS_RED
	jump .done_npc
.red
	setevent EVENT_HIDE_OW_OBJECTS_RED
	clearevent EVENT_HIDE_OW_OBJECTS_BROWN
	clearevent EVENT_HIDE_OW_OBJECTS_TEAL
	clearevent EVENT_HIDE_OW_OBJECTS_PURPLE
	clearevent EVENT_HIDE_OW_OBJECTS_BLUE
	clearevent EVENT_HIDE_OW_OBJECTS_PINK
.done_npc
	checkevent EVENT_TOLL_BOOTH_OPEN
	iftrue .done_tollbooth
	changeblock $24, $0c, $e9
	changeblock $26, $0c, $0b
	changeblock $24, $0e, $eb
	changeblock $24, $10, $ea
.done_tollbooth
	checktime 1<<DUSK
	iftrue .dusk
	checktime 1<<NITE
	iffalse .notnite
	changeblock $16, $14, $f4
	changeblock $16, $16, $f8
	setflag ENGINE_STREETLIGHTS2
.dusk
;	changeblock $22, $0a, $5b
;	changeblock $2c, $0a, $5b
	changeblock $0e, $0c, $a1
	changeblock $1a, $0c, $a1
;	changeblock $22, $0c, $a1
;	changeblock $2c, $0c, $a1
	changeblock $0e, $0e, $a5
	changeblock $1a, $0e, $a5
;	changeblock $22, $0e, $a5
;	changeblock $2c, $0e, $a5
	changeblock $0e, $10, $a4
	changeblock $1a, $10, $a4
;	changeblock $22, $10, $a4
;	changeblock $2c, $10, $a4
	changeblock $22, $0c, $f2
	changeblock $1c, $16, $10
	changeblock $1e, $16, $11
	setflag ENGINE_STREETLIGHTS
.notnite
	checkevent EVENT_ROUTE_22_TRASHCAN
	iffalse .end
	changeblock $10, $06, $e7
.end
	domaptrigger ROUTE_22_TUNNEL, $1
	return
	
RestoreDuskTurnpikeMusic:
	ld a, MUSIC_NONE
	ld [wMapMusic], a
	call FadeToMapMusic
	ret

DuskTurnpikeLight:
	checktime 1<<DUSK
	iftrue .dusk
	checktime 1<<NITE
	iffalse .notnite
.dusk
	setflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $1
.notnite
	end
	
DuskTurnpikeDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $0
	end

DuskTurnpikeTollBoothStopsYou1:
	checkevent EVENT_TOLL_BOOTH_OPEN
	iftrue DuskTurnpikeTollbooth.end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, DUSK_TOLLBOOTH_GUY, 15
	opentext
	writetext DuskTurnpikeTollboothText1
	waitbutton
	closetext
	spriteface PLAYER, UP
	jump DuskTurnpikeTollbooth
	
DuskTurnpikeTollBoothStopsYou2:
	checkevent EVENT_TOLL_BOOTH_OPEN
	iftrue DuskTurnpikeTollbooth.end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, DUSK_TOLLBOOTH_GUY, 15
	opentext
	writetext DuskTurnpikeTollboothText1
	waitbutton
	closetext
	applyonemovement PLAYER, step_up
	jump DuskTurnpikeTollbooth
	
DuskTurnpikeTollBoothStopsYou3:
	checkevent EVENT_TOLL_BOOTH_OPEN
	iftrue DuskTurnpikeTollbooth.end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, DUSK_TOLLBOOTH_GUY, 15
	opentext
	writetext DuskTurnpikeTollboothText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_DuskTollbooth1
	jump DuskTurnpikeTollbooth
	
DuskTurnpikeTollBoothStopsYou4:
	checkevent EVENT_TOLL_BOOTH_OPEN
	iftrue DuskTurnpikeTollbooth.end
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, DUSK_TOLLBOOTH_GUY, 15
	opentext
	writetext DuskTurnpikeTollboothText1
	waitbutton
	closetext
	applymovement PLAYER, Movement_DuskTollbooth2

DuskTurnpikeTollbooth:
	checkevent EVENT_TOLL_BOOTH_OPEN
	iftrue .open
	checkcode VAR_MOVEMENT
	ifequal PLAYER_BIKE, .bike
.no
	opentext
	writetext DuskTurnpikeTollboothText2
	waitbutton
	closetext
	applyonemovement PLAYER, step_left
	setevent EVENT_TALKED_TO_TOLL_BOOTH
.end
	end
.bike
	checkevent EVENT_BIKE_UPGRADED
	iffalse .no
	opentext
	writetext DuskTurnpikeTollboothText3
	waitbutton
	closetext
	changeblock $24, $0c, $42
	changeblock $26, $0c, $46
	changeblock $24, $0e, $20
	changeblock $24, $10, $43
	pause 20
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	callasm GenericFinishBridge
	setevent EVENT_TALKED_TO_TOLL_BOOTH
	setevent EVENT_TOLL_BOOTH_OPEN
	end
.open
	opentext
	writetext DuskTurnpikeTollboothText4
	waitbutton
	closetext
	end

DuskTurnpikeTrashcan:
	checkevent EVENT_ROUTE_22_TRASHCAN
	iftrue .OnlyTrash
	changeblock $10, $06, $e7
	setevent EVENT_ROUTE_22_TRASHCAN
	opentext
	writetext DuskTurnpikeTrashcanText1
	playsound SFX_SANDSTORM
	waitsfx
	buttonsound
	checkevent EVENT_ROUTE_22_TRASHCAN_ITEM
	iffalse .get_item
	callasm DuskTurnpikeTrashcanAsm
	closetext
	end
	
.get_item
	verbosegiveitem LEFTOVERS
	iffalse .NoRoom
	closetext
	setevent EVENT_ROUTE_22_TRASHCAN_ITEM
	end
.NoRoom
	changeblock $10, $06, $e6
	callasm GenericFinishBridge
	closetext
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
	
DuskTurnpikeNPC1:
	jumptextfaceplayer DuskTurnpikeNPC1Text
	
DuskTurnpikeNPC2:
	jumptextfaceplayer DuskTurnpikeNPC2Text
	
DuskTurnpikeNPC3:
	jumptextfaceplayer DuskTurnpikeNPC3Text
	
DuskTurnpikeNPC4:
	jumptextfaceplayer DuskTurnpikeNPC4Text
	
DuskTurnpikeNPC5:
	jumptextfaceplayer DuskTurnpikeNPC5Text
	
DuskTurnpikeNPC6:
	jumptextfaceplayer DuskTurnpikeNPC6Text
	
DuskTurnpikeNPC7:
	checkcode VAR_MOVEMENT
	ifequal PLAYER_BIKE, .bike
	ifequal PLAYER_SKATEBOARD, .skateboard
	jumptextfaceplayer DuskTurnpikeNPC7TextNone
.skateboard
	jumptextfaceplayer DuskTurnpikeNPC7TextSkateboard
.bike
	checkevent EVENT_BIKE_UPGRADED
	iffalse .no_upgrade
	jumptextfaceplayer DuskTurnpikeNPC7TextBike1
.no_upgrade
	jumptextfaceplayer DuskTurnpikeNPC7TextBike2
	
DuskTurnpikeNPC8:
	jumptextfaceplayer DuskTurnpikeNPC8Text
	
DuskTurnpikeNPC1Text:
	text "Cough! <WAIT_S>Hack!<WAIT_S>"
	line "Cough!"
	
	para "I had to step out"
	line "of the garage for"
	cont "a second."
	
	para "All the exhaust"
	line "fumes are gettin'"
	cont "to me."
	
	para "…<WAIT_S>Step back, kid!"
	
	para "I think <WAIT_S>I'm gonna"
	line "hurl!"
	done
	
DuskTurnpikeNPC2Text:
	text "I heard that the"
	line "tunnel here con-"
	cont "nects to a big"
	cont "underground cave."
	
	para "Pretty neat!"
	done
	
DuskTurnpikeNPC3Text:
	text "The HIGHWAY goes"
	line "on for miles and"
	cont "miles with no rest"
	cont "stops."
	
	para "Better make sure"
	line "you're ready before"
	cont "you hit the road!"
	done
	
DuskTurnpikeNPC4Text:
	text "The dude at the"
	line "toll booth won't"
	cont "let my SKATEBOARD"
	cont "on the HIGHWAY!"
	
	para "It's got wheels!<WAIT_M>"
	line "It should count!"
	done
	
DuskTurnpikeNPC5Text:
	text "The rest of our"
	line "gang- <WAIT_M>err… <WAIT_L>bike<SCRL2>enthusiast club…"
	
	para "…is hanging out"
	line "in the tunnel to"
	cont "the WEST."
	done
	
DuskTurnpikeNPC6Text:
	text "Sup, squirt?"
	
	para "You friends with"
	line "that girl behind"
	cont "the bar?"
	
	para "She really should"
	line "not be back there."
	done
	
DuskTurnpikeNPC7TextNone:
	text "A kid like you"
	line "probably doesn't"
	cont "have a set of"
	cont "wheels, huh?"
	done
	
DuskTurnpikeNPC7TextSkateboard:
	text "A SKATEBOARD, huh?"
	
	para "Pretty far cry"
	line "from a bike, kid…"
	done
	
DuskTurnpikeNPC7TextBike1:
	text "Pffft!"
	
	para "Get a load of this"
	line "kid's bike, guys!"
	
	para "What a poser!"
	
	para "Hahaha!"
	done
	
DuskTurnpikeNPC7TextBike2:
	text "Woah."
	
	para "Nice wheels, kid."
	
	para "Lookin' good!"
	done
	
DuskTurnpikeNPC8Text:
	text "Heya, kiddo."
	
	para "Lotta shady"
	line "characters hang"
	cont "around here."
	
	para "I'd be prepared"
	line "heading in there."
	
	para "Just in case."
	done
	
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
	text "ROUTE 22 HIGHWAY"
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
	text "Nope, <WAIT_S>there's"
	line "only trash here."
	done

DuskTurnpikeBrokenCar:
	text "A broken down car."
	done
	
DuskTurnpikeTire:
	text "Tires are stacked"
	line "around randomly."
	done
	
DuskTurnpikeDestiny:
	text "DESTINY HOUSE"
	done
	
DuskTurnpikeTollboothText1:
	text "Hey!"
	done
	
DuskTurnpikeTollboothText2:
	text "Motor vehicles"
	line "only past this"
	cont "point."
	
	para "Sorry, <WAIT_S>that's the"
	line "rules."
	done
	
DuskTurnpikeTollboothText3:
	text "Motor vehicles"
	line "only past this"
	cont "point."
	
	para "I'll go ahead and"
	line "open the gate."
	done
	
DuskTurnpikeTollboothText4:
	text "Motor vehicles"
	line "only past this"
	cont "point."
	done
	
Movement_DuskTollbooth1:
	step_up
	step_up
	step_end
	
Movement_DuskTollbooth2:
	step_up
	step_up
	step_up
	step_end
