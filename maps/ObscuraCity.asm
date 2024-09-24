ObscuraCity_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraCityCallback

	db 4 ; warp events
	warp_def 13, 16, 1, OBSCURA_MUSEUM_1F
	warp_def 13, 17, 2, OBSCURA_MUSEUM_1F
	warp_def  9, 23, 3, OBSCURA_MUSEUM_1F
	warp_def 10, 23, 4, OBSCURA_MUSEUM_1F

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_SNARE, 14, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCitySnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE_GIRL, 14, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraCitySnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	
	
	const_def 1 ; object constants
	const OBSCURA_CITY_SNARE_1
	const OBSCURA_CITY_SNARE_2
	
ObscuraCityCallback:
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .skip
	domaptrigger OBSCURA_MUSEUM_1F, $0
.skip
	return
	
ObscuraCitySnare1:
	faceplayer
	opentext
	writetext ObscuraCitySnare1Text
	waitbutton
	closetext
	spriteface OBSCURA_CITY_SNARE_1, DOWN
	end
	
ObscuraCitySnare2:
	faceplayer
	opentext
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext ObscuraCitySnare2TextBoy
	jump .cont
.girl
	writetext ObscuraCitySnare2TextGirl
.cont
	waitbutton
	closetext
	spriteface OBSCURA_CITY_SNARE_2, DOWN
	end

ObscuraCitySnare1Text:
	text "The MUSEUM is"
	line "closed today."
	
	para "Run along."
	done
	
ObscuraCitySnare2TextBoy:
	text "We were told not"
	line "to let a kid named"
	cont "<PLAYER> in."
	
	para "You are him."
	done
	
ObscuraCitySnare2TextGirl:
	text "We were told not"
	line "to let a kid named"
	cont "<PLAYER> in."
	
	para "You are her."
	done
