ClearBGPalettes::
	call ClearPalettes
	jr ApplyTilemapInVBlank

ApplyAttrAndTilemapInVBlank::
	ld a, 2
	ldh [hBGMapMode], a
	call Delay2

ApplyTilemapInVBlank::
; Tell VBlank to update BG Map
	ld a, 1
	ldh [hBGMapMode], a

SFXDelay2::
Delay2::
	ld c, 2

SFXDelayFrames::
DelayFrames::
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret

SFXDelayFrame::
DelayFrame::
; Wait for one frame
	ldh a, [rLY]
	ldh [hDelayFrameLY], a
	ld a, 1
	ld [wVBlankOccurred], a

; Wait for the next VBlank, halting to conserve battery
.halt
	halt
	nop
	ld a, [wVBlankOccurred]
	and a
	jr nz, .halt
	ret
