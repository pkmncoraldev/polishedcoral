RadiantTownship_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 13, 35, 1, RADIANT_FLOWER_SHOP
	warp_def 25, 18, 1, RADIANT_FIELD
	warp_def 25, 19, 2, RADIANT_FIELD

	db 0 ; coord events

	db 30 ; bg events
	signpost 14, 12, SIGNPOST_READ, RadiantTownshipSign
	signpost 14, 21, SIGNPOST_READ, RadiantTownshipGymSign
	signpost  6, 32, SIGNPOST_READ, RadiantTownshipRoute18Sign
	signpost  6,  2, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  6,  3, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  2, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 14,  3, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 12, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 13, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 18, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  8, 19, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 24, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 18, 25, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 26, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 27, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 32, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost 12, 33, SIGNPOST_READ, RadiantTownshipSolarPanel
	signpost  7,  6, SIGNPOST_READ, RadiantTownshipPokeCenterSign
	signpost 15,  6, SIGNPOST_READ, RadiantTownshipMartSign
	signpost 15,  6, SIGNPOST_READ, RadiantTownshipFlwoerShopSign
	signpost 11,  2, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 11,  3, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 18, 14, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 18, 15, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 23, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 24, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 25, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 19, 26, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 19, 27, SIGNPOST_READ, RadiantTownshipSunflower
	signpost 14, 37, SIGNPOST_READ, RadiantTownshipSunflower

	db 11 ; object events
	person_event SPRITE_CUTE_GIRL, 15, 16, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, RadiantTownshipSign, -1
	person_event SPRITE_CASINO, 10,  2, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 10,  3, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 17, 14, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 17, 15, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 23, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 24, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 25, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 18, 26, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 18, 27, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1
	person_event SPRITE_CASINO, 13, 37, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, -1


RadiantTownshipSunflower:
	jumptext RadiantTownshipSunflowerText

Sunflower1:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_1
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_1
	jump SunflowerGivePollen
	
Sunflower2:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_2
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_2
	jump SunflowerGivePollen
	
Sunflower3:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_3
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_3
	jump SunflowerGivePollen
	
Sunflower4:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_4
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_4
	jump SunflowerGivePollen
	
Sunflower5:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_5
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_5
	jump SunflowerGivePollen
	
Sunflower6:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_6
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_6
	jump SunflowerGivePollen
	
Sunflower7:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_7
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_7
	jump SunflowerGivePollen
	
Sunflower8:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_8
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_8
	jump SunflowerGivePollen
	
Sunflower9:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_9
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_9
	jump SunflowerGivePollen
	
Sunflower10:
	opentext
	checkitem POLLEN_POUCH
	iffalse SunflowerNoPouch
	checkevent EVENT_SUNFLOWER_10
	iftrue SunflowerDoneForToday
	callasm CheckSunflowerPollenAsm
	ifequal 0, SunflowerFull
	setevent EVENT_SUNFLOWER_10

SunflowerGivePollen:
	ifequal 1, .almost
	callasm SunflowerGivePollenAsm
	writetext ReceivedPollenText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayPollenText
.cont
	callasm CheckSunflowerPollenAsm
	ifequal 0, .full
	waitbutton
	closetext
	end
.full
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext PollenFullText
	waitbutton
	closetext
	end
.almost
	callasm SunflowerGivePollenAsm
	writetext Received1PollenText
	playsound SFX_ITEM
	waitsfx
	writetext PutAway1PollenText
	jump .cont

SunflowerNoPouch:
	writetext NoPouchText
	waitbutton
	closetext
	end

SunflowerDoneForToday:
	writetext NoPollenText
	waitbutton
	closetext
	end

SunflowerFull:
	writetext PollenFullText
	waitbutton
	closetext
	end

RadiantTownshipSunflowerText:
	text "A huge sunflower!"
	done

Received1PollenText:
	text "<PLAYER> received"
	line "@"
	deciram wPlaceBallsX, 1, 1
	text " POLLEN PUFF!"
	done

ReceivedPollenText:
	text "<PLAYER> received"
	line "@"
	deciram wPlaceBallsX, 1, 1
	text " POLLEN PUFFs!"
	done

PutAwayPollenText:
	text "<PLAYER> put the"
	line "POLLEN PUFFs in"
	cont "the POLLEN POUCH."
	done
	
PutAway1PollenText:
	text "<PLAYER> put the"
	line "POLLEN PUFF in"
	cont "the POLLEN POUCH."
	done

PollenFullText:
	text "Your POLLEN POUCH"
	line "is full!"
	done
	
NoPollenText:
	text "It has no more"
	line "POLLEN PUFFs…"
	done
	
NoPouchText:
	text "It's covered in"
	line "pollen…"
	done

CheckSunflowerPollenAsm:
	xor a
	ld [wPlaceBallsX], a
	ld a, [wPollenSteps]
	cp 250
	jr z, .full
	cp 249
	jr z, .almost
	ld a, 2
	ld [wScriptVar], a
	ret
.almost
	ld a, 1
	ld [wScriptVar], a
	ret
.full
	ld a, 0
	ld [wScriptVar], a
	ret

SunflowerGivePollenAsm:
	xor a
	ld e, a
	ld a, [wPollenSteps]
	inc e
	inc a
	cp 250
	jr z, .end
	inc e
	inc a
	cp 250
	jr z, .end
	inc e
	inc a
	cp 250
	jr z, .end
	inc e
	inc a
	cp 250
	jr z, .end
	inc e
	inc a
.end
	ld [wPollenSteps], a
	ld a, e
	ld [wPlaceBallsX], a
	ret


RadiantTownshipSign:
	jumptext RadiantTownshipSignText
	
RadiantTownshipGymSign:
	jumptext RadiantTownshipGymSignText
	
RadiantTownshipRoute18Sign:
	jumptext RadiantTownshipRoute18SignText
	
RadiantTownshipSolarPanel:
	jumptext RadiantTownshipSolarPanelText
	
RadiantTownshipPokeCenterSign:
	jumpstd pokecentersign
	
RadiantTownshipMartSign:
	jumpstd martsign
	
RadiantTownshipFlwoerShopSign:
	jumptext RadiantTownshipFlwoerShopSignText
	
RadiantTownshipSignText:
	text "RADIANT TOWNSHIP"
	
	para "A little community"
	line "among the flowers."
	done
	
RadiantTownshipGymSignText:
	text "RADIANT TOWNSHIP"
	line "#MON GYM"
	cont "LEADER: LEILANI"
	
	para "The ferocious"
	line "flower."
	done
	
RadiantTownshipRoute18SignText:
	text "NORTH:"
	line "ROUTE 18"
	done
	
RadiantTownshipFlwoerShopSignText:
	text "TEXT 1"
	done
	
RadiantTownshipSolarPanelText:
	text "A reflective"
	line "solar panel."
	
	para "Shiny!"
	done