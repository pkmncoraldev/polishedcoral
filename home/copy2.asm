ApplyTilemap2::
	ld a, 1
	ld [hBGMapMode], a
	jr LoadEDTile
	ret
; 3238

CGBOnly_LoadEDTile:: ; 3238
	ld a, [hCGB]
	and a
	jp z, WaitBGMap

LoadEDTile:: ; 323d
	jr .LoadEDTile
; 323f

; XXX
	callba HDMATransferAttrMapAndTileMapToWRAMBank3
	ret
; 3246

.LoadEDTile: ; 3246
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a

.wait
	ld a, [rLY]
	cp $7f
	jr c, .wait

	di
	ld a, 1 ; BANK(VTiles3)
	ld [rVBK], a
	hlcoord 0, 0, wAttrMap
	call .StackPointerMagic
	ld a, 0 ; BANK(VTiles0)
	ld [rVBK], a
	hlcoord 0, 0
	call .StackPointerMagic

.wait2
	ld a, [rLY]
	cp $7f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret
; 327b

.StackPointerMagic: ; 327b
; Copy all tiles to VBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
; if in v/hblank, wait until not in v/hblank
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
; load BGMap0
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 32f9

WaitBGMap:: ; 31f6
; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ld [hBGMapMode], a
; Wait for it to do its magic
	ld c, 4
	call DelayFrames
	ret
