SunsetLighthouseTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 18,  0, SUNSET_LIGHTHOUSE_ELEVATOR, 1
	warp_event 15,  3, SUNSET_LIGHTHOUSE_TOP, 3
	warp_event  6,  7, SUNSET_LIGHTHOUSE_TOP, 2

	db 0 ; coord events

	db 27 ; bg events
	signpost  4,  6, SIGNPOST_JUMPTEXT, SunsetLighthouseTopFoodText
	signpost  4,  0, SIGNPOST_DOWN, SunsetLighthouseTopTV
	signpost  4,  1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopFanText
	signpost  6,  0, SIGNPOST_JUMPTEXT, SunsetLighthouseTopBedText
	signpost  7,  0, SIGNPOST_JUMPTEXT, SunsetLighthouseTopBedText
	signpost  0,  0, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  2, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  3, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  4, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  1, -1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopWestText
	signpost  3, -1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopWestText
	signpost  5, -1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopWestText
	signpost  8,  1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  8,  2, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  8,  3, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  8,  4, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  8,  5, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  8,  6, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  8,  7, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  7,  8, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  6,  8, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  2,  8, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  3,  7, SIGNPOST_JUMPTEXT, SunsetLighthouseTopFlowerText
	signpost  1,  7, SIGNPOST_JUMPTEXT, SunsetLighthouseTopFridgeText
	signpost  1,  6, SIGNPOST_JUMPTEXT, SunsetLighthouseTopStoveText
	signpost  1,  5, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSinkText

	db 3 ; object events
	object_event  3,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, AMPHAROS, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SunsetLighthouseTopAmpharos, -1
	person_event SPRITE_WEIRD_TREE,  3,  0, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BALL_CUT_FRUIT,  1, 0, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, SunsetLighthouseMareepDoll, EVENT_DECO_MAREEP_DOLL


SunsetLighthouseMareepDoll:
	disappear LAST_TALKED
	setevent EVENT_DECO_MAREEP_DOLL
	opentext
	writetext GiveMareepDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayMareepDollText
	waitbutton
	closetext
	end

SunsetLighthouseTopAmpharos:
	opentext
	writetext SunsetLighthouseTopAmpharosText1
	cry AMPHAROS
	waitsfx
	buttonsound
	checkevent EVENT_SUNSET_LIGHTHOUSE_FED_AMPHAROS
	iftrue .done
	readmem wAmpharosFood
	ifequal 0, .first
	writetext SunsetLighthouseTopAmpharosTextSniff2
	jump .cont
.first
	writetext SunsetLighthouseTopAmpharosTextSniff1
.cont
	yesorno
	iffalse .no
	special FadeOutPalettes
	special Special_ChooseItem
	iffalse .no
	callasm CheckItemFood
	iffalse .not_interested
	copybytetovar wCurItem
	takeitem ITEM_FROM_MEM
	writetext SunsetLighthouseTopAmpharosTextYum
	cry AMPHAROS
	waitsfx
	waitbutton
	readmem wAmpharosFood
	addval 1
	writemem wAmpharosFood
	ifequal 4, .full
	closetext
	end
.full
	writetext SunsetLighthouseTopAmpharosTextFull
	waitbutton
	verbosegivetmhm TM_ZAP_CANNON
	closetext
	setevent EVENT_SUNSET_LIGHTHOUSE_FED_AMPHAROS
	end
.done
	writetext SunsetLighthouseTopAmpharosText2
	waitbutton
	closetext
	end
.no
	writetext SunsetLighthouseTopAmpharosTextNo
	waitbutton
	closetext
	end
.not_interested
	writetext SunsetLighthouseTopAmpharosTextNotInterested
	waitbutton
	closetext
	end
	
CheckItemFood:
	ld a, [wCurItem]
	ld [wd265], a
	call GetItemName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	ld a, [wCurItem]
	ld hl, TastyFoodItems
	ld de, 1
	call IsInArray
	jr nc, .not_food
	ld a, TRUE
	ld [wScriptVar], a
	ret
.not_food
	ld a, FALSE
	ld [wScriptVar], a
	ret
	
TastyFoodItems:
	db RARE_CANDY
	db RAGECANDYBAR
	db CHERI_BERRY
	db CHESTO_BERRY
	db PECHA_BERRY
	db RAWST_BERRY
	db ASPEAR_BERRY
	db LEPPA_BERRY
	db ORAN_BERRY
	db PERSIM_BERRY
	db LUM_BERRY
	db SITRUS_BERRY
	db FIGY_BERRY
	db BIG_MALASADA
	db SLOWPOKETAIL
	db SODA_POP
	db FRESH_WATER
	db LEMONADE
	db MOOMOO_MILK
	db BLOSSOM_TEA
	db SUNSHINE_TEA
	db -1
	
SunsetLighthouseTopTV:
	callasm SunsetLighthouseTopTVAsm
	iffalse .normal
	jumptext SunsetLighthouseTopTVText2
.normal
	jumptext SunsetLighthouseTopTVText
	
SunsetLighthouseTopTVAsm:
	ld a, [hMinutes]
	cp 33
	jr nz, .no
	ld a, [hHours]
	cp 3
	jr nz, .no
.yes
	ld a, TRUE
	jr .end
.no
	ld a, FALSE
.end
	ld [wScriptVar], a
	ret
	
GiveMareepDollText:
	text "<PLAYER> received"
	line "MAREEP DOLL!"
	done
	
PutAwayMareepDollText:
	text "The DOLL was sent"
	line "to the PC in"
	cont "<PLAYER>'s room."
	done
	
SunsetLighthouseTopStoveText:
	text "It's a stove."
	done
	
SunsetLighthouseTopSinkText:
	text "A clean sparkly"
	line "sink."
	done
	
SunsetLighthouseTopFridgeText:
	text "Let's see what's"
	line "in the fridge…"
	
	para "…<WAIT_L>Wow it's fully"
	line "stocked!"
	done
	
SunsetLighthouseTopFlowerText:
	text "Some pretty"
	line "flowers."
	done
	
SunsetLighthouseTopAmpharosText1:
	text "AMPHAROS: Far!<WAIT_S>"
	line "Faro!"
	done
	
SunsetLighthouseTopAmpharosText2:
	text "It looks happy"
	line "and well fed."
	done
	
SunsetLighthouseTopAmpharosTextSniff1:
	text "It's sniffing at"
	line "your bag."
	
	para "Maybe it's hungry…"
	
	para "Give it something"
	line "to eat?"
	done
	
SunsetLighthouseTopAmpharosTextSniff2:
	text "It's sniffing at"
	line "your bag."
	
	para "Maybe it's still"
	line "hungry…"
	
	para "Give it something"
	line "to eat?"
	done
	
SunsetLighthouseTopAmpharosTextYum:
	text "It gobbled down"
	line "the @"
	text_from_ram wMonOrItemNameBuffer
	text "!"
	
	para "Yum!"
	done
	
SunsetLighthouseTopAmpharosTextFull:
	text "It's finally"
	line "satisfied!"
	
	para "…<WAIT_L>Oh!"
	
	para "It's clutching"
	line "something in its"
	cont "hand."
	
	para "It offers it to"
	line "to you."
	done
	
SunsetLighthouseTopAmpharosTextNo:
	text "It looks"
	line "disappointed…"
	done
	
SunsetLighthouseTopAmpharosTextNotInterested:
	text "It doesn't seem"
	line "intereseted in"
	cont "the @"
	text_from_ram wMonOrItemNameBuffer
	text "."
	done
	
SunsetLighthouseTopFanText:
	text "A small fan blows"
	line "cool air."
	done
	
SunsetLighthouseTopFoodText:
	text "A plate of tasty"
	line "looking food."
	done
	
SecretWord:
	db "LINK CABLE@"
	
SunsetLighthouseTopTVText:
	text "It's playing an"
	line "old cartoon."
	
	para "A PERSIAN is"
	line "chasing a RATATTA"
	cont "with a frying pan."
	done
	
SunsetLighthouseTopTVText2:
	text "Nothing but"
	line "static…"
	done
	
SunsetLighthouseTopBedText:
	text "A big, fluffy bed."
	
	para "Looks comfy!"
	done
	
SunsetLighthouseTopNorthText:
	text "ROUTE 1 is off in"
	line "the distance."
	done
	
SunsetLighthouseTopWestText:
	text "A nice view of"
	line "SUNSET BAY!"
	
	para "Hey!"
	
	para "I can see my house"
	line "from here!"
	done
	
SunsetLighthouseTopSouthEastText:
	text "Ocean as far as"
	line "the eye can see…"
	done
	