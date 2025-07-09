SendSGBPacket:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop2
	push bc
	ld a, 1
	ld [wInputFlags], a
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.nextByte
	ld e, $8
	ld a, [hli]
	ld d, a
.nextBit0
	bit 0, d
	ld a, $10
	jr nz, .next0
	ld a, $20
.next0
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .nextBit0
	dec b
	jr nz, .nextByte
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	xor a
	ld [wInputFlags], a
	call SGBDelayCycles
	pop bc
	dec b
	ret z
	jr .loop2

SGBDelayCycles:
	ld de, 7000
.wait
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .wait
	ret

InitSGBBorder::
	; ldh a, [hCGB]
	; and a
	; ret nz

	di
	ld a, [wInputFlags]
	push af
	set 7, a
	ld [wInputFlags], a

	xor a
	ldh [rJOYP], a
	ldh [hSGB], a
	call PushSGBBorderPalsAndWait
	jr nc, .skip
	ld a, $1
	ldh [hSGB], a
	call _InitSGBBorderPals
;	call SGBBorder_PushBGPals
	call SGBDelayCycles
	call SGB_ClearVRAM
	call PushSGBBorder
	call SGBDelayCycles
	call SGB_ClearVRAM
	ld hl, MaskEnCancelPacket
	call _PushSGBPals

.skip
	pop af
	ld [wInputFlags], a
	ei
	ret

_PushSGBPals:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.loop
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.loop2
	ld e, $8
	ld a, [hli]
	ld d, a
.loop3
	bit 0, d
	ld a, $10
	jr nz, .okay
	ld a, $20
.okay
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .loop3
	dec b
	jr nz, .loop2
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	call SGBDelayCycles
	pop bc
	dec b
	jr nz, .loop
	ret
	
_InitSGBBorderPals:
	ld hl, .PacketPointerTable
	ld c, 9
.loop
	push bc
	ld a, [hli]
	push hl
	ld h, [hl]
	ld l, a
	call _PushSGBPals
	pop hl
	inc hl
	pop bc
	dec c
	jr nz, .loop
	ret

.PacketPointerTable:
	dw MaskEnFreezePacket
	dw DataSndPacket1
	dw DataSndPacket2
	dw DataSndPacket3
	dw DataSndPacket4
	dw DataSndPacket5
	dw DataSndPacket6
	dw DataSndPacket7
	dw DataSndPacket8	
	
PushSGBBorder:
	call .LoadSGBBorderPointers
	push de
	call SGBBorder_YetMorePalPushing
	pop hl
	call SGBBorder_MorePalPushing
	ret

.LoadSGBBorderPointers:
	ld hl, SGBBorderGFX
	ld de, SGBBorderMapAndPalettes
	ret
	
SGB_ClearVRAM:
	ld hl, STARTOF(VRAM)
	ld bc, SIZEOF(VRAM)
	xor a
	call ByteFill
	ret
	
PushSGBBorderPalsAndWait:
	ld hl, MltReq2Packet
	call _PushSGBPals
	call SGBDelayCycles
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	ld a, $20
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ldh [rJOYP], a
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $10
	ldh [rJOYP], a
rept 6
	ldh a, [rJOYP]
endr
	call SGBDelayCycles
	call SGBDelayCycles
	ld a, $30
	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	ldh a, [rJOYP]
	call SGBDelayCycles
	call SGBDelayCycles
	ldh a, [rJOYP]
	and $3
	cp $3
	jr nz, .carry
	call .FinalPush
	and a
	ret

.carry
	call .FinalPush
	scf
	ret

.FinalPush:
	ld hl, MltReq1Packet
	call _PushSGBPals
	jp SGBDelayCycles

CopySGBBorderData:
; copy bc bytes of data from hl to de
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, CopySGBBorderData
	ret
	
ClearSGBBorderBytes: ; 0x9a5b
; clear bc bytes of data starting from de
	xor a
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, ClearSGBBorderBytes
	ret
	
; SGBBorder_PushBGPals:
	; ret
	; call DisableLCD
	; ld a, %11100100
	; ldh [rBGP], a
	; ld hl, PredefPals
	; ld de, VTiles1
	; ld bc, $100 tiles
	; call CopySGBBorderData
	; call DrawDefaultTiles
	; ld a, LCDC_DEFAULT
	; ldh [rLCDC], a
	; ld hl, PalTrnPacket
	; call _PushSGBPals
	; xor a
	; ldh [rBGP], a
	; ret
	
SGBBorder_MorePalPushing:
	call DisableLCD
	ld a, $e4
	ldh [rBGP], a
	ld de, VTiles1
	ld bc, (6 + SCREEN_WIDTH + 6) * 5 * 2
	call CopySGBBorderData
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld bc, 6 * 2
	call CopySGBBorderData
	ld bc, SCREEN_WIDTH * 2
	call ClearSGBBorderBytes
	ld bc, 6 * 2
	call CopySGBBorderData
	pop bc
	dec b
	jr nz, .loop
	ld bc, (6 + SCREEN_WIDTH + 6) * 5 * 2
	call CopySGBBorderData
	ld bc, $100
	call ClearSGBBorderBytes
	ld bc, 16 palettes
	call CopySGBBorderData
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, PctTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

SGBBorder_YetMorePalPushing:
	call DisableLCD
	ld a, %11100100
	ldh [rBGP], a
	ld de, VTiles1
	ld b, $80
.loop
	push bc
    ld bc, 1 tiles
    call CopySGBBorderData
    ld bc, 1 tiles
    call CopySGBBorderData
	pop bc
	dec b
	jr nz, .loop
	call DrawDefaultTiles
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld hl, ChrTrnPacket
	call _PushSGBPals
	xor a
	ldh [rBGP], a
	ret

DrawDefaultTiles:
; Draw 240 tiles (2/3 of the screen) from tiles in VRAM
	hlbgcoord 0, 0 ; BG Map 0
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	ld a, $80 ; starting tile
	ld c, 12 + 1
.line
	ld b, 20
.tile
	ld [hli], a
	inc a
	dec b
	jr nz, .tile
; next line
	add hl, de
	dec c
	jr nz, .line
	ret



INCLUDE "gfx/sgb/blk_packets.asm"
INCLUDE "gfx/sgb/pal_packets.asm"
INCLUDE "data/sgb_ctrl_packets.asm"

;PredefPals:

;INCLUDE "gfx/sgb/predef.pal"


SGBBorderMapAndPalettes:
; interleaved tile ids and palette ids, without the center 20x18 screen area
INCBIN "gfx/sgb/sgb_border.sgb.tilemap"
; four SGB palettes of 16 colors each; only the first 4 colors are used
INCBIN "gfx/sgb/sgb_border.pal.bin"

SGBBorderGFX:
INCBIN "gfx/sgb/sgb_border.4bpp"
