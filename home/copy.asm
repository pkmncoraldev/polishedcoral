ReplaceKrisSprite:: ; e4a
	farjp _ReplaceKrisSprite
; e51

LoadStandardOpaqueFont::
	farjp _LoadStandardOpaqueFont

LoadStandardFont:: ; e51
	farjp _LoadStandardFont
; e58

Load1bppFont:: ; e51
	farjp _Load1bppFont

LoadFontsBattleExtra:: ; e58
	farjp _LoadFontsBattleExtra
; e5f

LoadFontsExtra:: ; e5f
	farjp LoadFrame
; e6c

Load1bppFrame::
	farjp LoadFrame1bpp

ApplyTilemap::
; Tell VBlank to update BG Map
	ld a, 1
	ld [hBGMapMode], a
	ld a, [wSpriteUpdatesEnabled]
	and a
	ld b, 3
	jr nz, SafeCopyTilemapAtOnce
	ld b, 1 << 3 | 3

; fallthrough
SafeCopyTilemapAtOnce::
; copies the tile&attr map at once
; without any tearing
; input:
; b: 0 = no palette copy
;    1 = copy raw palettes
;    2 = set palettes and copy
;    3 = use whatever was in hCGBPalUpdate
; bit 2: if set, clear hOAMUpdate
; bit 3: if set, only update tilemap
	farjp _SafeCopyTilemapAtOnce

CopyTilemapAtOnce::
	farjp _CopyTilemapAtOnce

DecompressRequest2bpp::
; Decompress lz data from b:hl to scratch space at 6:d000, then copy c tiles to de.
	push de
;	ld a, BANK(sScratch)
;	call GetSRAMBank
	push bc
;
;	ld de, sScratch
;	ld a, b
;	call FarDecompress

	call FarDecompressWRA6InB
	pop bc
	pop hl
	ld de, wDecompressScratch

;	ld de, sScratch
;	call Request2bpp
;	jp CloseSRAM
; e8d
; fallthrough
Request2bppInWRA6:
	ldh a, [hROMBank]
	ld b, a
	call RunFunctionInWRA6

Get2bpp::
	ld a, [rLCDC]
	bit 7, a ; lcd on?
	jp nz, Request2bpp

Copy2bpp::
; copy c 2bpp tiles from b:de to hl
	call StackCallInBankB

.Function:
	call WriteVCopyRegistersToHRAM
	ld b, c
	jp _Serve2bppRequest

Request2bpp:: ; eba
; Load 2bpp at b:de to occupy c tiles of hl.
	call StackCallInBankB

.Function:
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	call WriteVCopyRegistersToHRAM
	ld a, [rLY]
	cp $88
	jr c, .handleLoop
; fallthrough to vblank copy handler if LY is too high
.loop
	ld a, [hTilesPerCycle]
	sub $10
	ld [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copySixteenTilesAndContinue
.copyRemainingTilesAndExit
	add $10
	ld [hRequested2bpp], a
	xor a
	ld [hTilesPerCycle], a
	call DelayFrame
	ld a, [hRequested2bpp]
	and a
	jr z, .clearTileCountAndFinish
.addUncopiedTilesToCount
	ld b, a
	ld a, [hTilesPerCycle]
	add b
	ld [hTilesPerCycle], a
	xor a
	ld [hRequested2bpp], a
	jr .handleLoop
.clearTileCountAndFinish
	xor a
	ld [hTilesPerCycle], a
	jr .done
.copySixteenTilesAndContinue
	ld a, $10
	ld [hRequested2bpp], a
	call DelayFrame
	ld a, [hRequested2bpp]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy2bpp
	jr c, .loop
.done

	pop af
	ld [hBGMapMode], a
	ret

GetMaybeOpaque1bpp::
	ld a, [rLCDC]
	bit 7, a
	jr nz, _Request1bpp
	jr _Copy1bpp

GetOpaque1bppSpaceTile::
	ld de, TextBoxSpace1bppGFX
GetOpaque1bppFontTile::
; Two bytes in VRAM define eight pixels (2 bits/pixel)
; Bits are paired from the bytes, e.g. %ABCDEFGH %abcdefgh defines pixels
; %Aa, %Bb, %Cc, %Dd, %Ee, %Ff, %Gg, %Hh
; %00 = white, %11 = black, %10 = light, %01 = dark
	lb bc, BANK(FontTiles), 1
GetOpaque1bpp::
	ld a, [rLCDC]
	bit 7, a ; lcd on?
	jr nz, RequestOpaque1bpp
CopyOpaque1bpp:
	ld a, 1
	ld [hRequestOpaque1bpp], a
	jr _Copy1bpp

Get1bppSpaceTile::
	ld de, TextBoxSpace1bppGFX
Get1bppFontTile::
	lb bc, BANK(FontTiles), 1
Get1bpp:: ; f9d
	ld a, [rLCDC]
	bit 7, a ; lcd on?
	jr nz, Request1bpp
Copy1bpp::
	xor a
	ld [hRequestOpaque1bpp], a
_Copy1bpp::
; copy c 1bpp tiles from b:de to hl
	call StackCallInBankB

.Function:
	call WriteVCopyRegistersToHRAM
	ld b, c
	jp _Serve1bppRequest

RequestOpaque1bpp:
	ld a, 1
	ld [hRequestOpaque1bpp], a
	jr _Request1bpp
Request1bpp::
	xor a
	ld [hRequestOpaque1bpp], a
_Request1bpp:
; Load 1bpp at b:de to occupy c tiles of hl.
	call StackCallInBankB

.Function:
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	call WriteVCopyRegistersToHRAM
	ld a, [rLY]
	cp $88
	jr c, .handleLoop
.loop
	ld a, [hTilesPerCycle]
	sub 16
	ld [hTilesPerCycle], a
	jr c, .copyRemainingTilesAndExit
	jr nz, .copySixteenTilesAndContinue
.copyRemainingTilesAndExit
	add 16
	ld [hRequested1bpp], a
	xor a
	ld [hTilesPerCycle], a
	call DelayFrame
	ld a, [hRequested1bpp]
	and a
	jr z, .clearTileCountAndFinish
.addUncopiedTilesToCount
	ld b, a
	ld a, [hTilesPerCycle]
	add b
	ld [hTilesPerCycle], a
	xor a
	ld [hRequested1bpp], a
	jr .handleLoop
.clearTileCountAndFinish
	xor a
	ld [hTilesPerCycle], a
	jr .done
.copySixteenTilesAndContinue
	ld a, 16
	ld [hRequested1bpp], a
	call DelayFrame
	ld a, [hRequested1bpp]
	and a
	jr nz, .addUncopiedTilesToCount
.handleLoop
	call HBlankCopy1bpp
	jr c, .loop
.done
	pop af
	ld [hBGMapMode], a
	ret

HBlankCopy1bpp:
	di
	ld [hSPBuffer], sp
	ld hl, hRequestedVTileDest
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ld h, d
	ld l, e
	jr .innerLoop

.outerLoop
	ld a, [rLY]
	cp $88
	jr nc, ContinueHBlankCopy
.innerLoop
	pop bc
	pop de
	ld a, [hRequestOpaque1bpp]
	dec a
	jr z, .waithblank2opaque
.waithblank2
	ld a, [rSTAT]
	and 3
	jr z, .waithblank2
.waithblank
	ld a, [rSTAT]
	and 3
	jr nz, .waithblank
	ld a, c
	ld [hli], a
	ld [hli], a
	ld a, b
	ld [hli], a
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
	rept 2
	pop de
	ld a, e
	ld [hli], a
	ld [hli], a
	ld a, d
	ld [hli], a
	ld [hli], a
	endr
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .outerLoop
	jr DoneHBlankCopy
.waithblank2opaque
	ld a, [rSTAT]
	and 3
	jr z, .waithblank2opaque
.waithblankopaque
	ld a, [rSTAT]
	and 3
	jr nz, .waithblankopaque
	ld a, c
	ld [hl], $ff
	inc hl
	ld [hli], a
	ld a, b
	ld [hl], $ff
	inc hl
	ld [hli], a
	ld a, e
	ld [hl], $ff
	inc hl
	ld [hli], a
	ld a, d
	ld [hl], $ff
	inc hl
	ld [hli], a
	rept 2
	pop de
	ld a, e
	ld [hl], $ff
	inc hl
	ld [hli], a
	ld a, d
	ld [hl], $ff
	inc hl
	ld [hli], a
	endr
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .outerLoop
	jr DoneHBlankCopy

ContinueHBlankCopy:
	ld [hRequestedVTileSource], sp
	ld sp, hl
	ld [hRequestedVTileDest], sp
	scf
DoneHBlankCopy:
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	reti

WriteVCopyRegistersToHRAM:
	ld a, e
	ld [hRequestedVTileSource], a
	ld a, d
	ld [hRequestedVTileSource + 1], a
	ld a, l
	ld [hRequestedVTileDest], a
	ld a, h
	ld [hRequestedVTileDest + 1], a
	ld a, c
	ld [hTilesPerCycle], a
	ret

VRAMToVRAMCopy::
	lb bc, %11, rSTAT & $ff ; predefine bitmask and rSTAT source for speed and size
	jr .waitNoHBlank2
.outerLoop2
	ld a, [rLY]
	cp $88
	jp nc, ContinueHBlankCopy
.waitNoHBlank2
	ld a, [$ff00+c]
	and b
	jr z, .waitNoHBlank2
.waitHBlank2
	ld a, [$ff00+c]
	and b
	jr nz, .waitHBlank2
	rept 7
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	endr
	pop de
	ld a, e
	ld [hli], a
	ld [hl], d
	inc hl
	ld a, l
	and $f
	jr nz, .waitNoHBlank2
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .outerLoop2
	jp DoneHBlankCopy

CopyDataUntil::
; Copy hl to de until hl == bc

; In other words, the source data is
; from hl up to but not including bc,
; and the destination is de.
	ld a, c
	sub l
	ld c, a
	ld a, b
	sbc h
	ld b, a
	inc bc
	jr _CopyBytes

FarCopyBytes::
	call StackCallInBankA
	; fallthrough
_CopyBytes:: ; 0x3026
; copy bc bytes from hl to de
	inc b  ; we bail the moment b hits 0, so include the last run
	inc c  ; same thing; include last byte
	jr .HandleLoop
.CopyByte:
	ld a, [hli]
	ld [de], a
	inc de
.HandleLoop:
	dec c
	jr nz, .CopyByte
	dec b
	jr nz, .CopyByte
	ret

ByteFill:: ; 0x3041
; fill bc bytes with the value of a, starting at hl
	inc b  ; we bail the moment b hits 0, so include the last run
	inc c  ; same thing; include last byte
	jr .HandleLoop
.PutByte:
	ld [hli], a
.HandleLoop:
	dec c
	jr nz, .PutByte
	dec b
	jr nz, .PutByte
	ret

GetFarHalfword::
; retrieve a halfword from a:hl, and return it in hl.
	; bankswitch to new bank
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	; get halfword from new bank, put it in hl
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; bankswitch to previous bank and return
	pop af
	rst Bankswitch
	ret

HDMATransferAttrMapAndTileMapToWRAMBank3:: ; 104000
	ld hl, .Function
	jp CallInSafeGFXMode

.Function:
	decoord 0, 0, wAttrMap
	ld hl, wScratchAttrMap
	call CutAndPasteAttrMap
	decoord 0, 0
	ld hl, wScratchTileMap
	call CutAndPasteTilemap
	ld a, $0
	ld [rVBK], a
	ld hl, wScratchTileMap
	call HDMATransferToWRAMBank3
	ld a, $1
	ld [rVBK], a
	ld hl, wScratchAttrMap
	call HDMATransferToWRAMBank3
	ret
	
HDMATransferToWRAMBank3: ; 10419d (41:419d)
	call _LoadHDMAParameters
	ld a, $23
	ld [hDMATransfer], a

WaitDMATransfer: ; 104a14
.loop
	call DelayFrame
	ld a, [hDMATransfer]
	and a
	jr nz, .loop
	ret
	
_LoadHDMAParameters: ; 10424e (41:424e)
	ld a, h
	ld [rHDMA1], a
	ld a, l
	ld [rHDMA2], a
	ld a, [hBGMapAddress + 1]
	and $1f
	ld [rHDMA3], a
	ld a, [hBGMapAddress]
	ld [rHDMA4], a
	ret