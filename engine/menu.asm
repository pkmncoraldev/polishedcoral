PlayerNameStutter::
rept 2
	ld a, [wPlayerName]
	ld [hli], a
	call PrintLetterDelay
	ld a, "-"
	ld [hli], a
	call PrintLetterDelay
	ld c, 10
	call DelayFrames
endr
	ret

_2DMenu_:: ; 2400e
	ld hl, CopyMenuData2
	ld a, [wMenuData2_2DMenuItemStringsBank]
	call FarCall_hl

	call Draw2DMenu
	call UpdateSprites
	call ApplyTilemap

Get2DMenuSelection: ; 2408f
	call Init2DMenuCursorPosition
	call DoMenuJoypadLoop
	call MenuClickSound
	ld a, [wMenuData2Flags]
	bit 1, a
	jr z, .skip
	call GetMenuJoypad
	bit SELECT_F, a
	jr nz, .quit

.skip
	ld a, [wMenuData2Flags]
	rra
	jr c, .skip2
	call GetMenuJoypad
	bit B_BUTTON_F, a
	jr nz, .quit

.skip2
	ld a, [w2DMenuNumCols]
	ld c, a
	ld a, [wMenuCursorY]
	dec a
	call SimpleMultiply
	ld c, a
	ld a, [wMenuCursorX]
	add c
	ld [wMenuCursorBuffer], a
	and a
	ret

.quit
	scf
	ret
; 240cd

GetMenuNumberOfColumns: ; 240cd
	ld a, [wMenuData2Items]
	and $f
	ret
; 240d3

GetMenuNumberOfRows: ; 240d3
	ld a, [wMenuData2Items]
	swap a
	and $f
	ret
; 240db

Draw2DMenu: ; 24085
	xor a
	ldh [hBGMapMode], a
	call MenuBox

Place2DMenuItemStrings:
	ld hl, wMenuData2_2DMenuItemStringsAddr
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile
	call GetMenuNumberOfRows
	ld b, a
.row
	push bc
	push hl
	call GetMenuNumberOfColumns
	ld c, a
.col
	push bc
	ld a, [wMenuData2_2DMenuItemStringsBank]
	call Place2DMenuItemName
	inc de
	ld a, [wMenuData2Spacing]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec c
	jr nz, .col
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ld hl, wMenuData2_2DMenuFunctionAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [wMenuData2_2DMenuFunctionBank]
	jp FarCall_hl


Init2DMenuCursorPosition: ; 2411a (9:411a)
	call GetMenuTextStartCoord
	ld a, b
	ld [w2DMenuCursorInitY], a
	dec c
	ld a, c
	ld [w2DMenuCursorInitX], a
	call GetMenuNumberOfRows
	ld [w2DMenuNumRows], a
	call GetMenuNumberOfColumns
	ld [w2DMenuNumCols], a
	call .InitFlags_a
	call .InitFlags_b
	call .InitFlags_c
	ld a, [w2DMenuNumCols]
	ld e, a
	ld a, [wMenuCursorBuffer]
	ld b, a
	xor a
	ld d, 0
.loop
	inc d
	add e
	cp b
	jr c, .loop
	sub e
	ld c, a
	ld a, b
	sub c
	and a
	jr z, .reset1
	cp e
	jr z, .okay1
	jr c, .okay1
.reset1
	ld a, 1
.okay1
	ld [wMenuCursorX], a
	ld a, [w2DMenuNumRows]
	ld e, a
	ld a, d
	and a
	jr z, .reset2
	cp e
	jr z, .okay2
	jr c, .okay2
.reset2
	ld a, 1
.okay2
	ld [wMenuCursorY], a
	xor a
	ld [wCursorOffCharacter], a
	ld [wCursorCurrentTile], a
	ld [wCursorCurrentTile + 1], a
	ret
; 24179

.InitFlags_a: ; 24179
	xor a
	ld hl, w2DMenuFlags1
	ld [hli], a
	ld [hld], a
	ld a, [wMenuData2Flags]
	bit 5, a
	ret z
	set 5, [hl]
	set 4, [hl]
	ret
; 2418a

.InitFlags_b: ; 2418a
	ld a, [wMenuData2Spacing]
	or $20
	ld [w2DMenuCursorOffsets], a
	ret
; 24193

.InitFlags_c: ; 24193
	ld hl, wMenuData2Flags
	ld a, A_BUTTON
	bit 0, [hl]
	jr nz, .skip
	or B_BUTTON
.skip
	bit 1, [hl]
	jr z, .skip2
	or SELECT
.skip2
	ld [wMenuJoypadFilter], a
	ret
; 241a8


_DoMenuJoypadLoop::
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ldh a, [hBGMapMode]
	push af
	call MenuJoypadLoop
	pop af
	ldh [hBGMapMode], a
	ret

MenuJoypadLoop:
.loop
	call Move2DMenuCursor
	call .BGMap_OAM
	call Do2DMenuRTCJoypad
	jr nc, .done
	call _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr nz, .done
	call GetMenuJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .loop
.done
	jp Move2DMenuCursor

.BGMap_OAM: ; 24238
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	ldh [hBGMapMode], a
	ld a, [w2DMenuFlags1]
	bit 6, a
	call z, DelayFrame
	call Delay2
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ret
; 24249

CheckMenuQuizInterrupt:

CheckQuizActive:
	ld a, [wMapGroup]
	cp GROUP_OBSCURA_GYM
	jr nz, .no
	ld a, [wMapNumber]
	cp MAP_OBSCURA_GYM
	jr nz, .no
	eventflagcheck EVENT_OBSCURA_QUIZ_ACTIVE
	jr z, .no
	scf
	ret
.no
	xor a
	ret
	
QuizUpdateTimer:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	ldh [hBGMapMode], a
	hlcoord 16, 1
	ld de, wCurrentAirportBaggage
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ld a, [wRanchRaceSeconds]
	cp QUIZ_TIME_LIMIT + 1
	jr z, .end
	scf
	ret
.end
	ld a, $69
	ld [wRanchRaceSeconds], a
	xor a
	ret

Do2DMenuRTCJoypad: ; 24249
	jr .handleLoop
.loopRTC
	call CheckQuizActive
	jr nc, .no_quiz
	call QuizUpdateTimer
	ret nc
	jr .handleLoop
.no_quiz
	call DelayFrame
.handleLoop
	call RTC
	call Menu_WasButtonPressed
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loopRTC
	and a
	ret
	

Menu_WasButtonPressed: ; 24259
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .skip_to_joypad
	ld a, $1
	ldh [hBGMapMode], a
	farcall PlaySpriteAnimationsAndDelayFrame
	xor a
	ldh [hBGMapMode], a

.skip_to_joypad
	call JoyTextDelay
	call GetMenuJoypad
	and a
	ret z
	scf
	ret
; 24270

_2DMenuInterpretJoypad: ; 24270
	call GetMenuJoypad
	bit A_BUTTON_F, a
	jp nz, .a_start_select
	bit B_BUTTON_F, a
	jp nz, .b_button
	bit SELECT_F, a
	jp nz, .a_start_select
	bit START_F, a
	jp nz, .a_start_select
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	and a
	ret

.set_bit_7 ; 24299
	ld hl, w2DMenuFlags2
	set 7, [hl]
	scf
	ret

.d_down
	ld hl, wMenuCursorY
	ld a, [w2DMenuNumRows]
	cp [hl]
	jr z, .check_wrap_around_down
	inc [hl]
	xor a
	ret

.check_wrap_around_down
	ld a, [w2DMenuFlags1]
	bit 5, a
	jr nz, .wrap_around_down
	bit 3, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_down
	ld [hl], $1
	xor a
	ret

.d_up
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	jr z, .check_wrap_around_up
	ld [hl], a
	xor a
	ret

.check_wrap_around_up
	ld a, [w2DMenuFlags1]
	bit 5, a
	jr nz, .wrap_around_up
	bit 2, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_up
	ld a, [w2DMenuNumRows]
	ld [hl], a
	xor a
	ret

.d_left
	ld hl, wMenuCursorX
	ld a, [hl]
	dec a
	jr z, .check_wrap_around_left
	ld [hl], a
	xor a
	ret

.check_wrap_around_left
	ld a, [w2DMenuFlags1]
	bit 4, a
	jr nz, .wrap_around_left
	bit 1, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_left
	ld a, [w2DMenuNumCols]
	ld [hl], a
	xor a
	ret

.d_right
	ld hl, wMenuCursorX
	ld a, [w2DMenuNumCols]
	cp [hl]
	jr z, .check_wrap_around_right
	inc [hl]
	xor a
	ret

.check_wrap_around_right
	ld a, [w2DMenuFlags1]
	bit 4, a
	jr nz, .wrap_around_right
	bit 0, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_right
	ld [hl], $1
	xor a
	ret
; 24318

.b_button
.a_start_select
	xor a
	ret

Move2DMenuCursor: ; 2431a
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp "▶"
	jr nz, Place2DMenuCursor
	ld a, [wCursorOffCharacter]
	ld [hl], a
Place2DMenuCursor: ; 24329
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuCursorOffsets]
	swap a
	and $f
	jr z, .got_row
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	jr .handleLoop
.row_loop
	add c
.handleLoop
	dec b
	jr nz, .row_loop

.got_row
	ld c, SCREEN_WIDTH
	rst AddNTimes
	ld a, [w2DMenuCursorOffsets]
	and $f
	jr z, .got_col
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .got_col
.col_loop
	add c
	dec b
	jr nz, .col_loop

.got_col
	ld c, a
	add hl, bc
	ld a, [hl]
	cp "▶"
	jr z, .cursor_on
	ld [wCursorOffCharacter], a
	ld [hl], "▶"

.cursor_on
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret
; 24374

_PushWindow:: ; 24374
	ldh a, [rSVBK]
	push af
	ld a, $7
	ldh [rSVBK], a

	ld hl, wWindowStackPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld b, $10
	ld hl, wMenuFlags
.loop
	ld a, [hli]
	ld [de], a
	dec de
	dec b
	jr nz, .loop

; If bit 6 or 7 of the menu flags is set, set bit 0 of the address
; at 7:[wWindowStackPointer], and draw the menu using the coordinates from the header.
; Otherwise, reset bit 0 of 7:[wWindowStackPointer].
	ld a, [wMenuFlags]
	bit 6, a
	jr z, .not_bit_6

	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	set 0, [hl]
	call PushWindow_MenuBoxCoordToTile
	call .copy
	call PushWindow_MenuBoxCoordToAttr
	call .copy
	jr .done

.not_bit_6
	pop hl ; last-pushed register was de
	push hl
	ld a, [hld]
	ld l, [hl]
	ld h, a
	res 0, [hl]

.done
	pop hl
	ld a, h
	ld [de], a
	dec de
	ld a, l
	ld [de], a
	dec de
	ld hl, wWindowStackPointer
	ld [hl], e
	inc hl
	ld [hl], d

	pop af
	ldh [rSVBK], a
	ld hl, wWindowStackSize
	inc [hl]
	ret
; 243cd

.copy ; 243cd
	call GetTileBackupMenuBoxDims

.row
	push bc
	push hl

.col
	ld a, [hli]
	ld [de], a
	dec de
	dec c
	jr nz, .col

	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 243e7

_ExitMenu:: ; 243e8
	xor a
	ldh [hBGMapMode], a

	ldh a, [rSVBK]
	push af
	ld a, $7
	ldh [rSVBK], a

	call GetWindowStackTop
	ld a, l
	or h
	jp z, Error_Cant_ExitMenu
	ld a, l
	ld [wWindowStackPointer], a
	ld a, h
	ld [wWindowStackPointer + 1], a
	call PopWindow
	ld a, [wMenuFlags]
	bit 0, a
	jr z, .loop
	ld d, h
	ld e, l
	call RestoreTileBackup

.loop
	call GetWindowStackTop
	ld a, h
	or l
	jr z, .done
	call PopWindow

.done
	pop af
	ldh [rSVBK], a
	ld hl, wWindowStackSize
	dec [hl]
	ret
; 24423

Error_Cant_ExitMenu: ; 2445d
	ld hl, .Text_NoWindowsAvailableForPopping
	call PrintText
	call ApplyTilemapInVBlank
.InfiniteLoop:
	jr .InfiniteLoop
; 24468

.Text_NoWindowsAvailableForPopping: ; 24468
	text_jump UnknownText_0x1c46b7
	db "@"
; 2446d

_InitVerticalMenuCursor:: ; 2446d
	ld a, [wMenuData2Flags]
	ld b, a
	ld hl, w2DMenuCursorInitY
	ld a, [wMenuBorderTopCoord]
	inc a
	bit 6, b
	jr nz, .skip_offset
	inc a
.skip_offset
	ld [hli], a
; w2DMenuCursorInitX
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld [hli], a
; w2DMenuNumRows
	ld a, [wMenuData2Items]
	ld [hli], a
; w2DMenuNumCols
	ld a, 1
	ld [hli], a
; w2DMenuFlags1
	ld [hl], $0
	bit 5, b
	jr z, .skip_bit_5
	set 5, [hl]
.skip_bit_5
	ld a, [wMenuFlags]
	bit 4, a
	jr z, .skip_bit_6
	set 6, [hl]
.skip_bit_6
	inc hl
; w2DMenuFlags2
	xor a
	ld [hli], a
; w2DMenuCursorOffsets
	ln a, 2, 0
	ld [hli], a
; wMenuJoypadFilter
	ld a, A_BUTTON
	bit 0, b
	jr nz, .skip_bit_1
	add B_BUTTON
.skip_bit_1
	ld [hli], a
; wMenuCursorY
	ld a, [wMenuCursorBuffer]
	and a
	jr z, .load_at_the_top
	ld c, a
	ld a, [wMenuData2Items]
	cp c
	jr nc, .load_position
.load_at_the_top
	ld c, 1
.load_position
	ld [hl], c
	inc hl
; wMenuCursorX
	ld a, 1
	ld [hli], a
; wCursorOffCharacter, wCursorCurrentTile
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
; 244c3
