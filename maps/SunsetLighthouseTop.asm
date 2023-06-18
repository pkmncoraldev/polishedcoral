SunsetLighthouseTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_event 17,  0, SUNSET_LIGHTHOUSE_ELEVATOR, 1
	warp_event 15,  3, SUNSET_LIGHTHOUSE_TOP, 3
	warp_event  6,  7, SUNSET_LIGHTHOUSE_TOP, 2

	db 0 ; coord events

	db 25 ; bg events
	signpost  2,  6, SIGNPOST_JUMPTEXT, SunsetLighthouseTopFoodText
	signpost  4,  0, SIGNPOST_DOWN, SunsetLighthouseTopTV
	signpost  4,  1, SIGNPOST_DOWN, SunsetLighthouseTopTV
	signpost  6,  0, SIGNPOST_JUMPTEXT, SunsetLighthouseTopBedText
	signpost  7,  0, SIGNPOST_JUMPTEXT, SunsetLighthouseTopBedText
	signpost  0,  0, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  1, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  2, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  3, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  4, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
	signpost  0,  5, SIGNPOST_JUMPTEXT, SunsetLighthouseTopNorthText
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
	signpost  5,  8, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText
	signpost  4,  8, SIGNPOST_JUMPTEXT, SunsetLighthouseTopSouthEastText

	db 3 ; object events
	object_event  3,  4, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, AMPHAROS, -1, -1, PAL_NPC_RED, PERSONTYPE_SCRIPT, 0, SunsetLighthouseTopAmpharos, -1
	person_event SPRITE_WEIRD_TREE,  3,  0, SPRITEMOVEDATA_TILE_LEFT_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	tmhmball_event  0,  1, TM_ZAP_CANNON, EVENT_SUNSET_LIGHTHOUSE_ZAP_CANNON


SunsetLighthouseTopAmpharos:
	opentext
	writetext SunsetLighthouseTopAmpharosText1
	cry AMPHAROS
	waitsfx
	buttonsound
	writetext SunsetLighthouseTopAmpharosText2
	waitbutton
	closetext
	end
	
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
	
SunsetLighthouseTopAmpharosText1:
	text "AMPHAROS: Far!"
	line "Faro!"
	done
	
SunsetLighthouseTopAmpharosText2:
	text "It looks happy"
	line "and well fed."
	done
	
SunsetLighthouseTopFoodText:
	text "A plate of yummy"
	line "looking food."
	done
	
SunsetLighthouseTopTVText:
	text "It's playing an"
	line "old cartoon."
	
	para "A PERSIAN is"
	line "chasing a RATATTA"
	cont "with a frying pan."
	done
	
SunsetLighthouseTopTVText2:
	text "UNFINISHED"
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
	
SecretWord:
	db "CONVERSION@"
	