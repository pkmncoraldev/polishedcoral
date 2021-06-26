_HandlePlayerStep:: ; d497 (3:5497)
	ld a, [wPlayerStepFlags]
	add a, a
	jr c, .updateOverworldMap ; starting step
	add a, a
	jr c, .updatePlayerCoords ; finishing step
	add a, a
	jr c, .finish ; ongoing step
	ret

.updateOverworldMap
	ld a, 4
	ld [wHandlePlayerStep], a
	call UpdateOverworldMap
	jr .finish

.updatePlayerCoords
	call UpdatePlayerCoords
	; fallthrough

.finish
	call HandlePlayerStep
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [wPlayerBGMapOffsetX]
	sub d
	ld [wPlayerBGMapOffsetX], a
	ld a, [wPlayerBGMapOffsetY]
	sub e
	ld [wPlayerBGMapOffsetY], a
	ret

ScrollScreen:: ; d4d2 (3:54d2)
	eventflagcheck EVENT_DONT_SCROLL_OW
	ret nz
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [hSCX]
	add d
	ld [hSCX], a
	ld a, [hSCY]
	add e
	ld [hSCY], a
	ret

HandlePlayerStep: ; d4e5 (3:54e5)
	ld hl, wHandlePlayerStep
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld a, [hl]
	ld hl, .Jumptable
	rst JumpTable
.fail
	ret

.Jumptable: ; d4f2 (3:54f2)

	dw GetMovementPermissions
	dw BufferScreen
	dw GetMovementPermissionsFar
	dw .fail
	
GetMovementPermissionsFar::
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a

	inc e
	inc e
	call GetCoordTile
	ld [wTileDownFar], a
	
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a
	
	dec e
	dec e
	call GetCoordTile
	ld [wTileUpFar], a
	
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a

	dec d
	dec d
	call GetCoordTile
	ld [wTileLeftFar], a
	
	ld a, [wPlayerStandingMapX]
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld e, a

	inc d
	inc d
	call GetCoordTile
	ld [wTileRightFar], a	
	ret
	
CheckFacingEdgeofMap::
	ld a, [wPlayerFacing]
	cp $04
	jr z, .up
	cp $00
	jr z, .down
	cp $08
	jr z, .left
	cp $0c
	jr z, .right
	jr .nope
.up
	ld a, [wPlayerStandingMapY]
	dec a
	dec a
	dec a
	dec a
	cp 0
	ret z
	jr .nope
.left
	ld a, [wPlayerStandingMapX]
	dec a
	dec a
	dec a
	dec a
	cp 0
	ret z
	jr .nope
.right
	ld a, [wMapWidth]
	add a, a
	ld d, a
	ld a, [wPlayerStandingMapX]
	dec a
	dec a
	cp d
	ret nz
	jr .nope
.down
	ld a, [wMapHeight]
	add a, a
	ld d, a
	ld a, [wPlayerStandingMapY]
	dec a
	dec a
	cp d
	ret nz
.nope
	scf
	ret

UpdatePlayerCoords: ; d511 (3:5511)
	ld hl, wYCoord
	ld a, [wPlayerStepDirection]
	and a
	jr z, .incrementCoord
	dec a
	jr z, .decrementCoord
	inc hl
	dec a
	jr z, .decrementCoord
	dec a
	ret nz
.incrementCoord
	inc [hl]
	ret
.decrementCoord
	dec [hl]
	ret

UpdateOverworldMap: ; d536 (3:5536)
	ld a, [wPlayerStepDirection]
	and a
	jr z, .stepDown
	dec a
	jr z, .stepUp
	dec a
	jr z, .stepLeft
	dec a
	ret nz
; step right
	call .ScrollOverworldMapRight
	call _LoadMapPart
	jp ScrollMapLeft
.stepDown
	call .ScrollOverworldMapDown
	call _LoadMapPart
	jp ScrollMapUp
.stepUp
	call .ScrollOverworldMapUp
	call _LoadMapPart
	jp ScrollMapDown
.stepLeft
	call .ScrollOverworldMapLeft
	call _LoadMapPart
	jp ScrollMapRight

.ScrollOverworldMapDown: ; d571 (3:5571)
	ld a, [wBGMapAnchor]
	add 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_overflowed
	ld a, [wBGMapAnchor + 1]
	inc a
	and $3
	or VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
.not_overflowed
	ld hl, wMetatileStandingY
	inc [hl]
	ld a, [hl]
	cp 2 ; was 1
	ret nz
	ld [hl], 0
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 6
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

.ScrollOverworldMapUp: ; d5a2 (3:55a2)
	ld a, [wBGMapAnchor]
	sub 2 * BG_MAP_WIDTH
	ld [wBGMapAnchor], a
	jr nc, .not_underflowed
	ld a, [wBGMapAnchor + 1]
	dec a
	and $3
	or VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
.not_underflowed
	ld hl, wMetatileStandingY
	dec [hl]
	ld a, [hl]
	inc a
	ret nz
	ld [hl], $1
	ld hl, wOverworldMapAnchor
	ld a, [wMapWidth]
	add 6
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapLeft: ; d5d5 (3:55d5)
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	dec [hl]
	ld a, [hl]
	inc a
	ret nz
	ld [hl], 1
	ld hl, wOverworldMapAnchor
	ld a, [hl]
	sub 1
	ld [hli], a
	ret nc
	dec [hl]
	ret

.ScrollOverworldMapRight: ; d5fe (3:55fe)
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wMetatileStandingX
	inc [hl]
	ld a, [hl]
	cp 2
	ret nz
	ld [hl], 0
	ld hl, wOverworldMapAnchor
	inc [hl]
	ret nz
	inc hl
	inc [hl]
	ret
	
ScrollMapDown:: ; 272a
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapRow
	hlcoord 0, 0, wAttrMap
	ld de, wBGMapPalBuffer
	call BackupBGMapRow
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 2748

ScrollMapUp:: ; 2748
	hlcoord 0, SCREEN_HEIGHT - 2
	ld de, wBGMapBuffer
	call BackupBGMapRow
	hlcoord 0, SCREEN_HEIGHT - 2, wAttrMap
	ld de, wBGMapPalBuffer
	call BackupBGMapRow
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld bc, $0200
	add hl, bc
; cap d at VBGMap1 / $100
	ld a, h
	and %00000011
	or VBGMap0 / $100
	ld e, l
	ld d, a
	call UpdateBGMapRow
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 2771

ScrollMapRight:: ; 2771
	hlcoord 0, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	hlcoord 0, 0, wAttrMap
	ld de, wBGMapPalBuffer
	call BackupBGMapColumn
	ld a, [wBGMapAnchor]
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 278f

ScrollMapLeft:: ; 278f
	hlcoord SCREEN_WIDTH - 2, 0
	ld de, wBGMapBuffer
	call BackupBGMapColumn
	hlcoord SCREEN_WIDTH - 2, 0, wAttrMap
	ld de, wBGMapPalBuffer
	call BackupBGMapColumn
	ld a, [wBGMapAnchor]
	ld e, a
	and %11100000
	ld b, a
	ld a, e
	add SCREEN_HEIGHT
	and %00011111
	or b
	ld e, a
	ld a, [wBGMapAnchor + 1]
	ld d, a
	call UpdateBGMapColumn
	ld a, $1
	ld [hBGMapUpdate], a
	ret
; 27b7

BackupBGMapRow:: ; 27b7
	ld c, 2 * SCREEN_WIDTH
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret
; 27c0

BackupBGMapColumn:: ; 27c0
	ld c, SCREEN_HEIGHT
.loop
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, SCREEN_WIDTH - 1
	add l
	ld l, a
	jr nc, .skip
	inc h

.skip
	dec c
	jr nz, .loop
	ret
; 27d3

UpdateBGMapRow:: ; 27d3
	ld hl, wBGMapBufferPtrs
	push de
	call .iteration
	pop de
	ld a, $20
	add e
	ld e, a

.iteration
	ld c, 10
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	inc a
	inc a
	and $1f
	ld b, a
	ld a, e
	and $e0
	or b
	ld e, a
	dec c
	jr nz, .loop
	ld a, SCREEN_WIDTH
	ld [hBGMapTileCount], a
	ret
; 27f8

UpdateBGMapColumn:: ; 27f8
	ld hl, wBGMapBufferPtrs
	ld c, SCREEN_HEIGHT
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $20
	add e
	ld e, a
	jr nc, .skip
	inc d
; cap d at VBGMap1 / $100
	ld a, d
	and $3
	or VBGMap0 / $100
	ld d, a

.skip
	dec c
	jr nz, .loop
	ld a, SCREEN_HEIGHT
	ld [hBGMapTileCount], a
	ret
; 2816
