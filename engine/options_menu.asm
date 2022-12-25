_OptionsMenu:: ; e41d0
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	call ClearBGPalettes
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBox
	hlcoord 2, 2
	ld de, StringOptions1
	call PlaceString
	xor a
	ld [wCurrentOptionsPage], a
	call OptionsMenu_LoadOptions

	xor a
	ld [wJumptableIndex], a
	ld b, CGB_DIPLOMA
	call GetCGBLayout
	call SetPalettes

.joypad_loop
	call JoyTextDelay
	ld a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, .ExitOptions
	call OptionsControl
	jr c, .dpad
	call GetOptionPointer
	jr c, .ExitOptions

.dpad
	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ld [hInMenu], a
	ret
; e4241

OptionsMenu_LoadOptions:
	xor a
	ld [wJumptableIndex], a
	ld [hJoyPressed], a
	ld c, $5 ; number of items on the menu minus 1 (for done)
.print_text_loop ; this next will display the settings of each option when the menu is opened
	push bc
	xor a
	ld [hJoyLast], a
	call GetOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .print_text_loop
	ld a, [wCurrentOptionsPage]
	and a
	call z, UpdateFrame
	ld a, 1
	ld [hBGMapMode], a
	jp ApplyTilemapInVBlank

StringOptions1: ; e4241
	db "TEXT SPEED<LNBRK>"
	db "        :<LNBRK>"
	db "BATTLE SCENE<LNBRK>"
	db "        :<LNBRK>"
	db "BATTLE STYLE<LNBRK>"
	db "        :<LNBRK>"
	db "FRAME<LNBRK>"
	db "        :TYPE<LNBRK>"
;	db "DEBUG MODE<LNBRK>"
;	db "        :<LNBRK>"
;	db "SOUND TEST<LNBRK>"
;	db "<LNBRK>"
	db "DONE@"
; e42d6

GetOptionPointer: ; e42d6
	ld a, [wJumptableIndex] ; load the cursor position to a
	ld e, a ; copy it to de
	ld a, [wCurrentOptionsPage]
	and a
	jr z, .page1
	ld a, $8
	add e
	ld e, a
.page1
	ld d, 0
	ld hl, .Pointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl ; jump to the code of the current highlighted item
; e42e5

.Pointers:
	dw Options_TextSpeed
	dw Options_BattleEffects
	dw Options_BattleStyle
	dw Options_Frame
;	dw Options_DebugMode
;	dw Options_MusicPlayer
	dw Options_Done
; e42f5


Options_TextSpeed: ; e42f5
	ld a, [wOptions1]
	and %11
	ld c, a
	ld a, [hJoyPressed]
	dec c
	bit D_LEFT_F, a
	jr nz, .ok
	inc c
	bit D_RIGHT_F, a
	jr z, .NonePressed
	inc c
.ok
	ld a, c
	and $3
	ld c, a
	ld a, [wOptions1]
	and $fc
	or c
	cp $c0
	jr nz, .skip
	ld a, $c1
.skip
	ld [wOptions1], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 3
	call PlaceString
	and a
	ret
; e4331

.Strings:
	dw .Instant
	dw .Fast
	dw .Medium
	dw .Slow

.Fast:
	db "FAST   @"
.Medium:
	db "MEDIUM @"
.Slow:
	db "SLOW   @"
.Instant:
	db "FAST   @"
; e4346


Options_BattleEffects: ; e4365
	ld hl, wOptions1
	ld a, [hJoyPressed]
	and D_LEFT | D_RIGHT
	jr nz, .Toggle
	bit BATTLE_EFFECTS, [hl]
	jr z, .SetOff
	jr .SetOn
.Toggle
	bit BATTLE_EFFECTS, [hl]
	jr z, .SetOn
.SetOff:
	res BATTLE_EFFECTS, [hl]
	ld de, .Off
	jr .Display
.SetOn:
	set BATTLE_EFFECTS, [hl]
	ld de, .On
.Display:
	hlcoord 11, 5
	call PlaceString
	and a
	ret
; e4398

.Off:
	db "OFF@"
.On:
	db "ON @"
; e43a0


Options_BattleStyle:
	ld hl, wOptions2
	ld a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SWITCH, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SWITCH, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SWITCH, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SWITCH, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SWITCH, [hl]
	ld de, .Set

.Display:
	hlcoord 11, 7
	call PlaceString
	and a
	ret

.Shift: db "SHIFT@"
.Set:   db "SET  @"


Options_Frame: ; e44fa
	ld hl, wTextBoxFrame
	ld a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	cp $9
	jr nz, .Save
	xor a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a
	cp $ff
	jr nz, .Save
	ld a, $8

.Save:
	ld [hl], a
UpdateFrame: ; e4512
	ld a, [wTextBoxFrame]
	hlcoord 16, 9 ; where on the screen the number is drawn
	add "1"
	ld [hl], a
	call LoadFontsExtra
	and a
	ret
; e4520


Options_MusicPlayer:
	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .gotomusicplayer
	and a
	ret

.gotomusicplayer:
;	scf
;	ret
	ld de, SFX_TRANSACTION
	call PlaySFX
	ld c, 5
	call FadeToWhite
	call WaitSFX
	ld a, MUSIC_NONE
	ld [wMapMusic], a
	ld e, a
	ld d, 0
	farcall PlayMusic
	farjp MusicPlayer
	

Options_Done: ; e4520
	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret
; e452a


Options_DebugMode: ; e4365
	ld hl, wOptions1
	ld a, [hJoyPressed]
	and D_LEFT | D_RIGHT
	jr nz, .Toggle
	bit DEBUG_MODE, [hl]
	jr z, .SetOff
	jr .SetOn
.Toggle
	bit DEBUG_MODE, [hl]
	jr z, .SetOn
.SetOff:
	res DEBUG_MODE, [hl]
	ld de, .Off
	jr .Display
.SetOn:
	set DEBUG_MODE, [hl]
	ld de, .On
.Display:
	hlcoord 11, 11
	call PlaceString
	and a
	ret

.Off:
	db "OFF@"
.On:
	db "ON @"

OptionsControl: ; e452a
	ld hl, wJumptableIndex
	ld a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl] ; load the cursor position to a

	cp $4 ; maximum number of items in option menu
	jr nz, .Increase
	ld [hl], -1
.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]

	and a
	jr nz, .Decrease
	ld [hl], $5 ; number of option items + 1
.Decrease:
	dec [hl]
	scf
	ret
; e455c

Options_UpdateCursorPosition: ; e455c
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, $10
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wJumptableIndex]
	rst AddNTimes
	ld [hl], "▶"
	ret
; e4579
