SpookhouseHallway2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, SpookhouseHallway2Callback

	db 1 ; warp events
	warp_def  1,  4, 255, SPOOKHOUSE_TV_ROOM

	db 0 ; coord events

	db 1 ; bg events
	signpost  1,  8, SIGNPOST_READ, SpookHousePainting

	db 0 ; object events

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
	