Skatepark_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 41,  1, 7, FLICKER_STATION

	db 34 ; coord events
	coord_event 15, 28, 0, SkateparkFountain
	coord_event 18, 28, 0, SkateparkFountain
	coord_event 15, 31, 0, SkateparkFountain
	coord_event 18, 31, 0, SkateparkFountain
	coord_event  5, 48, 0, SkateparkRail1
	coord_event  5, 54, 0, SkateparkRail1
	coord_event  8, 51, 0, SkateparkRail2
	coord_event 13, 53, 0, SkateparkRail3
	coord_event 16, 50, 0, SkateparkRail4
	coord_event 22, 50, 0, SkateparkRail4
	coord_event 19, 53, 0, SkateparkRail5
	coord_event 19, 40, 0, SkateparkRail5
	coord_event  7, 60, 0, SkateparkFlowerBed1
	coord_event 10, 60, 0, SkateparkFlowerBed1
	coord_event 12, 60, 0, SkateparkFlowerBed1
	coord_event 15, 60, 0, SkateparkFlowerBed1
	coord_event 17, 60, 0, SkateparkFlowerBed1
	coord_event 20, 60, 0, SkateparkFlowerBed1
	coord_event 12, 38, 0, SkateparkFlowerBed2
	coord_event 15, 38, 0, SkateparkFlowerBed2
	coord_event 10, 32, 0, SkateparkFlowerBed3
	coord_event 10, 35, 0, SkateparkFlowerBed3
	coord_event 10, 26, 0, SkateparkFlowerBed4
	coord_event 10, 29, 0, SkateparkFlowerBed4
	coord_event 23, 32, 0, SkateparkFlowerBed5
	coord_event 23, 35, 0, SkateparkFlowerBed5
	coord_event 23, 26, 0, SkateparkFlowerBed6
	coord_event 23, 29, 0, SkateparkFlowerBed6
	coord_event 10, 23, 0, SkateparkFlowerBed7
	coord_event 13, 23, 0, SkateparkFlowerBed7
	coord_event 15, 23, 0, SkateparkFlowerBed7
	coord_event 18, 23, 0, SkateparkFlowerBed7
	coord_event 20, 23, 0, SkateparkFlowerBed7
	coord_event 23, 23, 0, SkateparkFlowerBed7

	db 0 ; bg events

	db 3 ; object events
	person_event SPRITE_VALVE_2, 42,  9, SPRITEMOVEDATA_HALFPIPE_1, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_VALVE_2, 42, 15, SPRITEMOVEDATA_HALFPIPE_2, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SKATER, 33, 17, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, SkateparkTMNpc, -1
	
	
	
SkateparkRail1:
	callasm SkateparkRail1Asm
	end
	
SkateparkRail2:
	callasm SkateparkRail2Asm
	end
	
SkateparkRail3:
	callasm SkateparkRail3Asm
	end
	
SkateparkRail4:
	callasm SkateparkRail4Asm
	end
	
SkateparkRail5:
	callasm SkateparkRail5Asm
	end
	
SkateparkFlowerBed1:
	callasm SkateparkFlowerBed1Asm
	end
	
SkateparkFlowerBed2:
	callasm SkateparkFlowerBed2Asm
	end
	
SkateparkFlowerBed3:
	callasm SkateparkFlowerBed3Asm
	end
	
SkateparkFlowerBed4:
	callasm SkateparkFlowerBed4Asm
	end
	
SkateparkFlowerBed5:
	callasm SkateparkFlowerBed5Asm
	end
	
SkateparkFlowerBed6:
	callasm SkateparkFlowerBed6Asm
	end
	
SkateparkFlowerBed7:
	callasm SkateparkFlowerBed7Asm
	end
	
SkateparkFountain:
	callasm SkateparkFountainAsm
	end
	
SkateparkRail1Asm:
	ld a, SKATEPARK_RAIL_1
	jr SkateparkTrickAsm
	
SkateparkRail2Asm:
	ld a, SKATEPARK_RAIL_2
	jr SkateparkTrickAsm
	
SkateparkRail3Asm:
	ld a, SKATEPARK_RAIL_3
	jr SkateparkTrickAsm
	
SkateparkRail4Asm:
	ld a, SKATEPARK_RAIL_4
	jr SkateparkTrickAsm
	
SkateparkRail5Asm:
	ld a, SKATEPARK_RAIL_5
	jr SkateparkTrickAsm
	
SkateparkFlowerBed1Asm:
	ld a, SKATEPARK_FLOWERBED_1
	jr SkateparkTrickAsm
	
SkateparkFlowerBed2Asm:
	ld a, SKATEPARK_FLOWERBED_2
	jr SkateparkTrickAsm
	
SkateparkFlowerBed3Asm:
	ld a, SKATEPARK_FLOWERBED_3
	jr SkateparkTrickAsm
	
SkateparkFlowerBed4Asm:
	ld a, SKATEPARK_FLOWERBED_4
	jr SkateparkTrickAsm
	
SkateparkFlowerBed5Asm:
	ld a, SKATEPARK_FLOWERBED_5
	jr SkateparkTrickAsm
	
SkateparkFlowerBed6Asm:
	ld a, SKATEPARK_FLOWERBED_6
	jr SkateparkTrickAsm
	
SkateparkFlowerBed7Asm:
	ld a, SKATEPARK_FLOWERBED_7
	jr SkateparkTrickAsm
	
SkateparkFountainAsm:
	ld a, SKATEPARK_FOUNTAIN
	
SkateparkTrickAsm:
	push af
	ld a, [wSkateparkCurTrick]
	cp 0
	jr nz, .nope
	pop af
	ld [wSkateparkCurTrick], a
	ret
.nope
	pop af
	ret
	
SkateparkTMNpc:
	setevent EVENT_SKATEPARK_CONTEST_TIMER
	playmusic MUSIC_GSC_GAME_CORNER
	end
	
SkateparkTimesUp::
	clearevent EVENT_SKATEPARK_CONTEST_TIMER
	special MapCallbackSprites_LoadUsedSpritesGFX
	opentext
	writetext SkateparkTMNPCText2
	pause 80
	closetext
	playmapmusic
	end

SkateparkTMNPCText1:
	text "So you got past"
	line "my boys, huh?"
	
	para "You think you're"
	line "a real skater?"
	done
	
SkateparkTMNPCText2:
	text "True"
	done
