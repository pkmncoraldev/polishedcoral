SpookhouseHallway2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SpookhouseHallway2Callback

	db 1 ; warp events
	warp_def  1,  4, 255, SPOOKHOUSE_TV_ROOM

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_SCARY_PAINTING,  1,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, SpookHousePainting, -1

SpookhouseHallway2Callback:
	checkevent EVENT_SPOOKHOUSE_BEATEN
	iftrue .beaten
	callasm SpookhouseRandomHallway
	ifequal 1, .change
.beaten
	warpmod 1, SPOOKHOUSE_LIVING_ROOM
	return
.change
	changeblock $6, $0, $54
	callasm GenericFinishBridge
	warpmod 1, SPOOKHOUSE_TV_ROOM
	return
	
SpookhouseRandomHallway:
	call Random
	cp 10 percent
	jr c, .yes
	xor a
	ld [wScriptVar], a
	ret
.yes
	ld a, 1
	ld [wScriptVar], a
	ret
	
SpookHousePainting:
	jumptext SpookHousePaintingText
	
SpookHousePaintingText:
	text "A painting of a"
	line "young girl hangs"
	cont "on the wall."
	done
	