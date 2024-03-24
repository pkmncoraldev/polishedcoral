FindItemInBallScript:: ; 0x122ce
	callasm .TryReceiveItem
	iffalse .no_room
	disappear LAST_TALKED
	opentext
	writetext .text_found
	playsound SFX_ITEM
	pause 60
	itemnotify
	closetext
	end
; 0x122e3

.no_room ; 0x122e3
	opentext
	writetext .text_found
	waitbutton
	pocketisfull
	closetext
	end
; 0x122ee

.text_found ; 0x122ee
	; found @ !
	text_jump UnknownText_0x1c0a1c
	db "@"
; 0x122f3

.TryReceiveItem: ; 122f8
	xor a
	ld [wScriptVar], a
	ld a, [wCurItemBallContents]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld hl, wStringBuffer3
	call CopyName2
	ld a, [wCurItemBallContents]
	ld [wCurItem], a
	ld a, [wCurItemBallQuantity]
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	ret nc
	ld a, $1
	ld [wScriptVar], a
	ret
; 12324

FindTMHMInBallScript::
	callasm .ReceiveTMHM
	disappear LAST_TALKED
	opentext
	writetext .text_found
	playsound SFX_ITEM
	pause 60
	tmhmnotify
	closetext
	end

.text_found
	; found @ !
	text_jump UnknownText_0x1c0a1c
	db "@"

.ReceiveTMHM:
	xor a
	ld [wScriptVar], a
	ld a, [wCurItemBallContents]
	ld [wNamedObjectIndexBuffer], a
	farcall GetTMHMName
	ld hl, wStringBuffer3
	call CopyName2

	; off by one error?
	ld a, [wd265]
	inc a
	ld [wd265], a

	predef GetTMHMMove
	ld a, [wd265]
	ld [wPutativeTMHMMove], a
	call GetMoveName

	ld hl, wStringBuffer3 + 4 ; assume all TM names are 4 characters, "TM##"
	ld a, " "
	ld [hli], a
	call CopyName2

	ld a, [wCurItemBallContents]
	ld [wCurTMHM], a
	call ReceiveTMHM
	ld a, $1
	ld [wScriptVar], a
	ret
	
CheckBarFacingJukebox:
	ld a, [wMapGroup]
	cp GROUP_BAR_INSIDE
	jr nz, .nope
	ld a, [wMapNumber]
	cp MAP_BAR_INSIDE
	jr nz, .nope
	ld a, 1
	ld [wScriptVar], a
	ret
.nope
	xor a
	ld [wScriptVar], a
	ret
	
FindTapeInBallScript::
	callasm CheckBarFacingJukebox
	iffalse .cont
	checkcode VAR_FACING
	ifnotequal UP, .cont
	farscall BarInsideJukeboxScript
	end
.cont
	callasm .ReceiveTape
	iffalse .No_Player
	disappear LAST_TALKED
	opentext
	writetext .text_found
	playsound SFX_ITEM
	pause 60
	callasm GetTapeNameLines
	ifequal 2, .two_line_name
	writetext TapeNameText
	buttonsound
	writetext PutAwayTapeText
	waitbutton
	closetext
	end
.two_line_name
	writetext TapeNameText2
	buttonsound
	writetext PutAwayTapeText
	waitbutton
	closetext
	end
	
.No_Player
	opentext
	writetext .text_found
	waitbutton
	writetext NoTapePlayerText
	waitbutton
	closetext
	end

.text_found
	; found @ !
	text_jump UnknownText_0x1c0a1c
	db "@"

.ReceiveTape:
	xor a
	ld [wScriptVar], a
	ld a, [wCurItemBallContents]
	ld [wNamedObjectIndexBuffer], a

	ld a, TAPE_NAME
	ld [wNamedObjectTypeBuffer], a

	farcall GetTMHMName
	ld hl, wStringBuffer3
	call CopyName2
	
	call GetTapeName

	; off by one error?
	ld a, [wd265]
	inc a
	ld [wd265], a

	xor a
	ld [wNamedObjectTypeBuffer], a

	ld de, EVENT_GOT_TAPE_PLAYER
	farcall CheckEventFlag
	ret z

	ld a, [wCurItemBallContents]
	ld c, a
	ld hl, wUnlockedSongs
	ld b, SET_FLAG
	ld d, 0
	predef FlagPredef
	ld a, $1
	ld [wScriptVar], a
	ret

GetTapeNameLines:
	ld a, [wCurItemBallQuantity]
	ld [wScriptVar], a
	ret

TapeNameText:
	text "@"
	text_from_ram wStringBuffer1
	text ""
	
	line "is written on the"
	cont "label."
	done
	
TapeNameText2:
	text "@"
	text_from_ram wStringBuffer1
	text ""
	
	cont "is written on the"
	cont "label."
	done

PutAwayTapeText:
	text "<PLAYER> put the"
	line "CASSETTE in the"
	cont "TAPE PLAYER."
	done
	
NoTapePlayerText:
	text "…but has no"
	line "TAPE PLAYER!"
	done
