ClearJoypad:: ; 92f
	xor a
; Pressed this frame (delta)
	ld [hJoyPressed], a
; Currently pressed
	ld [hJoyDown], a
	ret
; 935

Joypad:: ; 935
; Read the joypad register and translate it to something more
; workable for use in-game. There are 8 buttons, so we can use
; one byte to contain all player input.

; Updates:

; hJoypadReleased: released this frame (delta)
; hJoypadPressed: pressed this frame (delta)
; hJoypadDown: currently pressed
; hJoypadSum: pressed so far

; Any of these three bits can be used to disable input.
	ld a, [wInputFlags]
	and %11010000
	ret nz

; If we're saving, input is disabled.
	ld a, [wGameLogicPaused]
	and a
	ret nz

; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, R_DPAD
	ld [rJOYP], a
; Read twice to give the request time to take.
	ld a, [rJOYP]
	ld a, [rJOYP]

; The Joypad register output is in the lo nybble (inversed).
; We make the hi nybble of our new container d-pad input.
	cpl
	and $f
	swap a

; We'll keep this in b for now.
	ld b, a

; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, R_BUTTONS
	ld [rJOYP], a
; Wait for input to stabilize.
rept 6
	ld a, [rJOYP]
endr
; Buttons take the lo nybble.
	cpl
	and $f
	or b
	ld b, a

; Reset the joypad register since we're done with it.
	ld a, $30
	ld [rJOYP], a

; To get the delta we xor the last frame's input with the new one.
	ld a, [hJoypadDown] ; last frame
	ld e, a
	xor b
	ld d, a
; Released this frame:
	and e
	ld [hJoypadReleased], a
; Pressed this frame:
	ld a, d
	and b
	ld [hJoypadPressed], a

; Add any new presses to the list of collective presses:
	ld c, a
	ld a, [hJoypadSum]
	or c
	ld [hJoypadSum], a

; Currently pressed:
	ld a, b
	ld [hJoypadDown], a

; Now that we have the input, we can do stuff with it.

; For example, soft reset:
	and A_BUTTON | B_BUTTON | SELECT | START
	cp  A_BUTTON | B_BUTTON | SELECT | START
	jp z, SoftReset

	ret
; 984


GetJoypad:: ; 984
; Update mirror joypad input from hJoypadDown (real input)

; hJoyReleased: released this frame (delta)
; hJoyPressed: pressed this frame (delta)
; hJoyDown: currently pressed

; bit 0 A
;     1 B
;     2 SELECT
;     3 START
;     4 RIGHT
;     5 LEFT
;     6 UP
;     7 DOWN

	push af
	push hl
	push de
	push bc

; The player input can be automated using an input stream.
; See more below.
	ld a, [wInputType]
	cp AUTO_INPUT
	jr z, .auto

; To get deltas, take this and last frame's input.
	ld a, [hJoypadDown] ; real input
	ld b, a
	ld a, [hJoyDown] ; last frame mirror
	ld e, a

; Released this frame:
	xor b
	ld d, a
	and e
	ld [hJoyReleased], a

; Pressed this frame:
	ld a, d
	and b
	ld [hJoyPressed], a

; It looks like the collective presses got commented out here.
	ld c, a

; Currently pressed:
	ld a, b
	ld [hJoyDown], a ; frame input

.quit
	pop bc
	pop de
	pop hl
	pop af
	ret

.auto
; Use a predetermined input stream (used in the catching tutorial).

; Stream format: [input][duration]
; A value of $ff will immediately end the stream.

; Read from the input stream.
	ld a, [hROMBank]
	push af
	ld a, [wAutoInputBank]
	rst Bankswitch

	ld hl, wAutoInputAddress
	ld a, [hli]
	ld h, [hl]
	ld l, a

; We only update when the input duration has expired.
	ld a, [wAutoInputLength]
	and a
	jr z, .updateauto

; Until then, don't change anything.
	dec a
	ld [wAutoInputLength], a
	pop af
	rst Bankswitch
	jr .quit


.updateauto
; An input of $ff will end the stream.
	ld a, [hli]
	cp -1
	jr z, .stopauto
	ld b, a

; A duration of $ff will end the stream indefinitely.
	ld a, [hli]
	ld [wAutoInputLength], a
	cp -1
	jr nz, .next

; The current input is overwritten.
	dec hl
	dec hl
	ld b, NO_INPUT
	jr .finishauto

.next
; On to the next input...
	ld a, l
	ld [wAutoInputAddress], a
	ld a, h
	ld [wAutoInputAddress+1], a
	jr .finishauto

.stopauto
	call StopAutoInput
	ld b, NO_INPUT

.finishauto
	pop af
	rst Bankswitch
	ld a, b
	ld [hJoyPressed], a ; pressed
	ld [hJoyDown], a ; input
	jr .quit
; 9ee


StartAutoInput:: ; 9ee
; Start reading automated input stream at a:hl.

	ld [wAutoInputBank], a
	ld a, l
	ld [wAutoInputAddress], a
	ld a, h
	ld [wAutoInputAddress+1], a
; Start reading the stream immediately.
	xor a
	ld [wAutoInputLength], a
; Reset input mirrors.
	xor a
	ld [hJoyPressed], a ; pressed this frame
	ld [hJoyReleased], a ; released this frame
	ld [hJoyDown], a ; currently pressed

	ld a, AUTO_INPUT
	ld [wInputType], a
	ret
; a0a


StopAutoInput:: ; a0a
; Clear variables related to automated input.
	xor a
	ld [wAutoInputBank], a
	ld [wAutoInputAddress], a
	ld [wAutoInputAddress+1], a
	ld [wAutoInputLength], a
; Back to normal input.
	ld [wInputType], a
	ret
; a1b


JoyWaitAorB::
.loop
	call DelayFrame
	call GetJoypad
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret nz
	call CheckAutoscroll
	ret nz
	call RTC
	jr .loop
	
JoyWaitLeft::
.loop
	call DelayFrame
	call GetJoypad
	ld a, [hJoyPressed]
	and D_LEFT
	ret nz
	call CheckAutoscroll
	ret nz
	call RTC
	jr .loop
	
JoyWaitRight::
.loop
	call DelayFrame
	call GetJoypad
	ld a, [hJoyPressed]
	and D_RIGHT
	ret nz
	call CheckAutoscroll
	ret nz
	call RTC
	jr .loop

CheckIfAOrBPressed:
	call JoyTextDelay
	ld a, [hJoyLast]
_Autoscroll:
	and A_BUTTON | B_BUTTON
	ret nz
	; fallthrough
CheckAutoscroll:
; Returns nz if we should autoscroll
	ld a, [wOptions1]
	and AUTOSCROLL_MASK
	ret z

	cp AUTOSCROLL_START
	ld a, [hJoyDown]
	jr z, .start

	; Check A+B. If both are held, autoscroll for both A&B and A|B.
	; Otherwise, autoscroll if the option is set to A or B, not A and B
	and A_BUTTON | B_BUTTON
	ret z
	cp A_BUTTON | B_BUTTON
	jr z, _Autoscroll
	ld a, [wOptions1]
	; nz if AORB, z if AANDB
	and %100
	ret

.start
	and START
	ret

WaitButton:: ; a46
	ld a, [hOAMUpdate]
	push af
	ld a, 1
	ld [hOAMUpdate], a
	call ApplyTilemapInVBlank
	call JoyWaitAorB
	pop af
	ld [hOAMUpdate], a
	ret
; a57

WaitButtonLeftRight::
	ld a, [hOAMUpdate]
	push af
	ld a, 1
	ld [hOAMUpdate], a
	call ApplyTilemapInVBlank
	ld a, [wPlayerDirection]
	cp $0c
	jp z, .right
	call JoyWaitLeft
	pop af
	ld [hOAMUpdate], a
	ret
.right
	call JoyWaitRight
	pop af
	ld [hOAMUpdate], a
	ret

JoyTextDelay:: ; a57
	call GetJoypad
	ld a, [hInMenu]
	and a
	ld a, [hJoyPressed]
	jr z, .ok
	ld a, [hJoyDown]
.ok
	ld [hJoyLast], a
	ld a, [hJoyPressed]
	and a
	jr z, .checkframedelay
	ld a, 15
	ld [wTextDelayFrames], a
	ret

.checkframedelay
	ld a, [wTextDelayFrames]
	and a
	jr z, .restartframedelay
	xor a
	ld [hJoyLast], a
	ret

.restartframedelay
	ld a, 5
	ld [wTextDelayFrames], a
	ret
; a80

WaitPressAorB_BlinkCursor:: ; a80
	ld a, [hMapObjectIndexBuffer]
	push af
	ld a, [hObjectStructIndexBuffer]
	push af
	xor a
	ld [hMapObjectIndexBuffer], a
	ld a, 6
	ld [hObjectStructIndexBuffer], a

.loop
	push hl
	hlcoord 18, 17
	call BlinkCursor
	pop hl

	call CheckIfAOrBPressed
	jr z, .loop

	pop af
	ld [hObjectStructIndexBuffer], a
	pop af
	ld [hMapObjectIndexBuffer], a
	ret
; aa5

SimpleWaitPressAorB::
.loop
	call CheckIfAOrBPressed
	ret nz
	call DelayFrame
	jr .loop

ButtonSound:: ; aaf
	ld a, [wLinkMode]
	and a
	jr nz, .link
	call .wait_input
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

.link
	ld c, 65
	jp DelayFrames
; ac6

.wait_input ; ac6
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, [wInputType]
	or a
	jr z, .input_wait_loop
	ld hl, .autoinput_a
	ld a, BANK(.autoinput_a)
	call StartAutoInput

.input_wait_loop
	call .blink_cursor
	call CheckIfAOrBPressed
	jr nz, .received_input
	call RTC
	ld a, $1
	ld [hBGMapMode], a
	call DelayFrame
	jr .input_wait_loop

.received_input
	pop af
	ld [hOAMUpdate], a
	ret

.autoinput_a
	db NO_INPUT, $50
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; af5

.blink_cursor ; af5
	ld a, [hVBlankCounter]
	and %00010000 ; bit 4, a
	jr z, .cursor_off
	ld a, "▼"
	jr .load_cursor_state

.cursor_off
	ld a, [wTileMap + 17 + 17 * SCREEN_WIDTH]

.load_cursor_state
	ld [wTileMap + 18 + 17 * SCREEN_WIDTH], a
	ret
; b06

BlinkCursor:: ; b06
	push bc
	ld a, [hl]
	ld b, a
	ld a, "▼"
	cp b
	pop bc
	jr nz, .place_arrow
	ld a, [hMapObjectIndexBuffer]
	dec a
	ld [hMapObjectIndexBuffer], a
	ret nz
	ld a, [hObjectStructIndexBuffer]
	dec a
	ld [hObjectStructIndexBuffer], a
	ret nz
	ld a, "─"
	ld [hl], a
	ld a, -1
	ld [hMapObjectIndexBuffer], a
	ld a, 6
	ld [hObjectStructIndexBuffer], a
	ret

.place_arrow
	ld a, [hMapObjectIndexBuffer]
	and a
	ret z
	dec a
	ld [hMapObjectIndexBuffer], a
	ret nz
	dec a
	ld [hMapObjectIndexBuffer], a
	ld a, [hObjectStructIndexBuffer]
	dec a
	ld [hObjectStructIndexBuffer], a
	ret nz
	ld a, 6
	ld [hObjectStructIndexBuffer], a
	ld a, "▼"
	ld [hl], a
	ret
; b40
