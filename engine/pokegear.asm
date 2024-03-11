	const_def
	const CLOCK_CARD
	const MAP_CARD
	const PHONE_CARD
	const BANK_CARD
	const TAPE_PLAYER_CARD

TapePlayerFunction: ; 90b8d (24:4b8d)
	call Load1bppFont
	call Load1bppFrame
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld [wInPokegear], a
	ld a, [wVramState]
	push af
	ld a, [wCurrPocket]
	push af
	xor a
	ld [wVramState], a
	call .InitTilemap
	call DelayFrame
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call TapePlayerJumptable
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	ld a, 11
	ld [wJumptableIndex], a
	pop af
	ld [wCurrPocket], a
	pop af
	ld [wVramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [wOptions1], a
	call ClearBGPalettes
	xor a
	ld [hBGMapAddress], a
	ld [wInPokegear], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, $90
	ld [hWY], a
	ret

.InitTilemap: ; 90bea (24:4bea)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	call TapePlayer_LoadGFX
	farcall ClearSpriteAnims
;	call InitPokegearModeIndicatorArrow
	ld a, 8
	call SkipMusic
	ld a, %11100011
	ld [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	call Pokegear_InitJumptableIndices
	jp InitTapePlayerTilemap

PokeGear: ; 90b8d (24:4b8d)
	call Load1bppFont
	call Load1bppFrame
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld [wInPokegear], a
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	call .InitTilemap
	call DelayFrame
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call PokegearJumptable
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	pop af
	ld [wVramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [wOptions1], a
	call ClearBGPalettes
	xor a
	ld [hBGMapAddress], a
	ld [wInPokegear], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, $90
	ld [hWY], a
	ret

.InitTilemap: ; 90bea (24:4bea)
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld a, $7
	ld [hWX], a
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	call InitPokegearModeIndicatorArrow
	ld a, 8
	call SkipMusic
	ld a, %11100011
	ld [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	call Pokegear_InitJumptableIndices
	call InitPokegearTilemap
	ld b, CGB_POKEGEAR_PALS
	call GetCGBLayout
	call SetPalettes
	ld a, %11100100
	jp DmgToCgbObjPal0

Pokegear_LoadGFX: ; 90c4e
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, VTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress
	ld hl, PokegearGFX
	ld de, VTiles2 tile $40
	ld a, BANK(PokegearGFX)
	call Decompress
	ld hl, PokegearSpritesGFX
	ld de, VTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
;	call GetWorldMapLocation
;	cp FAST_SHIP
;	jr z, .ssaqua
;	cp SINJOH_RUINS
;	jr z, .sinjoh
;	cp MYSTRI_STAGE
;	jr z, .sinjoh
	farcall GetPlayerIcon
	ld a, [rSVBK]
	push af
	ld a, 6
	ld [rSVBK], a
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, VTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, VTiles0 tile $14
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	ld [rSVBK], a
	ret

TapePlayer_LoadGFX: ; 90c4e
	call ClearVBank1
	ld hl, RadioGFX
	ld de, VTiles2
	ld a, BANK(RadioGFX)
	call FarDecompress
	ld hl, PokegearGFX
	ld de, VTiles2 tile $40
	ld a, BANK(PokegearGFX)
	call Decompress
	ld hl, PokegearSpritesGFX
	ld de, VTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
;	call GetWorldMapLocation
;	cp FAST_SHIP
;	jr z, .ssaqua
;	cp SINJOH_RUINS
;	jr z, .sinjoh
;	cp MYSTRI_STAGE
;	jr z, .sinjoh
	farcall GetPlayerIcon
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, VTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, VTiles0 tile $14
	ld bc, 4 tiles
	jp FarCopyBytes

.ssaqua
	ld hl, FastShipGFX
.loadaltsprite
	ld de, VTiles0 tile $10
	ld bc, 8 tiles
	rst CopyBytes
	ret

.sinjoh
	ld hl, SinjohRuinsArrowGFX
	jr .loadaltsprite

; 90cb2

FastShipGFX: ; 90cb2
INCBIN "gfx/town_map/fast_ship.2bpp"
; 90d32

SinjohRuinsArrowGFX:
INCBIN "gfx/pokegear/arrow.2bpp"

InitPokegearModeIndicatorArrow: ; 90d32 (24:4d32)
	depixel 3, 2, 0, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_MODE_ARROW
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ret

AnimatePokegearModeIndicatorArrow: ; 90d41 (24:4d41)
	ld hl, wcf64
	ld e, [hl]
	ld d, 0
	ld hl, .XCoords
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

; 90d52 (24:4d52)

.XCoords: ; 90d52
	db $00, $10, $20, $30
; 90d56

TownMap_InitCursorAndPlayerIconPositions: ; 90d70 (24:4d70)
	call GetCurrentLandmark
	cp GATE_LANDMARK
	jr z, .gate
	cp RESIDENTIAL_DISTRICT
	jr z, .luster
	cp SHOPPING_DISTRICT
	jr z, .luster
	cp BUSINESS_DISTRICT
	jr z, .luster
	ld [wPokegearMapPlayerIconLandmark], a
	ld [wPokegearMapCursorLandmark], a
	ret

.gate
	ld a, [wPreviousLandmark]
	ld [wPokegearMapPlayerIconLandmark], a
	ld [wPokegearMapCursorLandmark], a
	ret
	
.luster
	ld a, LUSTER_CITY
	ld [wPokegearMapPlayerIconLandmark], a
	ld [wPokegearMapCursorLandmark], a
	ret
	
Pokegear_InitJumptableIndices: ; 90d9e (24:4d9e)
	xor a ; CLOCK_CARD
	ld [wJumptableIndex], a
	ld [wcf64], a
	ret

InitTapePlayerTilemap:
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	ld a, $4f
	call ByteFill
	ld de, RadioTilemapRLE
	call Pokegear_LoadTilemapRLE
	jp InitPokegearTilemap.cont_from_tape_player

InitPokegearTilemap: ; 90da8 (24:4da8)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	ld a, $4f
	call ByteFill
	ld a, [wcf64]
	and $3
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return_from_jumptable
	push de
	jp hl

.return_from_jumptable
	call Pokegear_FinishTilemap
.cont_from_tape_player
	call TownMapPals
	ld a, [wcf64]
	cp MAP_CARD
	jr nz, .not_town_map
	ld a, [wJumptableIndex]
	cp 3 ; NorthOnwa
	call z, TownMapNorthOnwaFlips
	ld a, [wJumptableIndex]
	cp 5 ; SouthOnwa
	call z, TownMapSouthOnwaFlips
	ld a, [wJumptableIndex]
	cp 7 ; Orange
	call z, TownMapOrangeFlips
.cont
	ld a, [wcf65]
	and a
	jr nz, .transition
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	call .UpdateBGMap
	ld a, $90
	jr .finish

.transition
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	call .UpdateBGMap
	xor a
.finish
	ld [hWY], a
	ld a, [wcf65]
	and 1
	xor 1
	ld [wcf65], a
	ret

.UpdateBGMap: ; 90e00 (24:4e00)
	ld a, $2
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
	jp ApplyTilemapInVBlank

.not_town_map
	call AssignPokeGearPals
	jr .cont

.Jumptable: ; 90e12
	dw .Clock
	dw .Map
	dw .Phone
	dw .Bank

; 90e1a
.Bank:
	ld de, BankTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	jp TextBox

.Clock: ; 90e1a
	ld de, ClockTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 12, 1
	ld de, .switch
	call PlaceString
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	jp Pokegear_UpdateClock

; 90e36 (24:4e36)

.switch
	db "SWITCH▶@"
; 90e3f

.Map: ; 90e3f
	farcall PokegearMap
	ld a, $7
	ld bc, $7
	hlcoord 1, 2
	call ByteFill
	hlcoord 0, 2
	ld [hl], $6
	hlcoord 8, 0
	ld [hl], $06
	hlcoord 8, 1
	ld [hl], $16
	hlcoord 8, 2
	ld [hl], $27
	ld a, [wPokegearMapCursorLandmark]
	jp PokegearMap_UpdateLandmarkName

; 90e72

.Tape: ; 90e72
	ld de, RadioTilemapRLE
	jp Pokegear_LoadTilemapRLE

; 90e82

.Phone: ; 90e82
	ld de, PhoneTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call .PlacePhoneBars
	jp PokegearPhone_UpdateDisplayList

; 90e98

.PlacePhoneBars: ; 90e98 (24:4e98)
	hlcoord 17, 1
	ld a, $58
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2
	inc a
	ld [hli], a
	call GetMapHeaderPhoneServiceNybble
	and a
	ret nz
	hlcoord 18, 2
	ld [hl], $5b
	ret

Pokegear_FinishTilemap: ; 90eb0 (24:4eb0)
	hlcoord 0, 0
	ld bc, $8
	ld a, $4f
	call ByteFill
	hlcoord 0, 1
	ld bc, $8
	ld a, $4f
	call ByteFill
	ld de, wPokegearFlags
	ld a, [de]
	bit 0, a
	call nz, .PlaceMapIcon
	ld a, [de]
	bit 2, a
	call nz, .PlacePhoneIcon
	ld a, [de]
	bit 1, a
	call nz, .PlaceRadioIcon
	hlcoord 0, 0
	ld a, $46
	jp .PlacePokegearCardIcon

.PlaceMapIcon: ; 90ee4 (24:4ee4)
	hlcoord 2, 0
	ld a, $40
	jr .PlacePokegearCardIcon

.PlacePhoneIcon: ; 90eeb (24:4eeb)
	hlcoord 4, 0
	ld a, $44
	jr .PlacePokegearCardIcon

.PlaceRadioIcon: ; 90ef2 (24:4ef2)
	hlcoord 6, 0
	ld a, $42
.PlacePokegearCardIcon: ; 90ef7 (24:4ef7)
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, $14
	add hl, bc
	add $f
	ld [hli], a
	inc a
	ld [hld], a
	ret

TapePlayerJumptable: ; 90f04 (24:4f04)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable: ; 90f13 (24:4f13)
	dw PokegearRadio_Init
	dw PokegearRadio_Joypad
	dw PokegearRadio_Reset

PokegearJumptable: ; 90f04 (24:4f04)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable: ; 90f13 (24:4f13)
	dw PokegearClock_Init
	dw PokegearClock_Joypad
	dw PokegearMap_CheckRegion
	dw PokegearMap_Init
	dw PokegearMap_NorthOnwaMap
	dw PokegearMap_Init
	dw PokegearMap_SouthOnwaMap
	dw PokegearMap_Init
	dw PokegearMap_OrangeMap
	dw PokegearPhone_Init
	dw PokegearPhone_Joypad
	dw PokegearPhone_MakePhoneCall
	dw PokegearPhone_FinishPhoneCall
	dw PokegearBank_Init
	dw PokegearBank_Joypad
	dw PokegearBank_Reset

PokegearBank_Init:
	ld b, CGB_BANK_CARD_PALS
	call GetCGBLayout
	call SetPalettes
	
	call InitPokegearTilemap
	ld hl, PokegearText_BankMakeSelection
	call PrintText
	
	hlcoord 3, 4
	ld de, .Welcome
	call PlaceString
	
	hlcoord 6, 8
	ld de, .Withdraw
	call PlaceString
	
	hlcoord 6, 10
	ld de, .Deposit
	call PlaceString
	
	call LoadStandardFont
	call LoadFontsExtra
	
	call CopyTilemapAtOnce
	
	call PokegearBank_UpdateCursor
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.Welcome:
	db "Welcome to your<LNBRK>     ATM!@"
	
.Withdraw:
	db "WITHDRAW@"
	
.Deposit:
	db "DEPOSIT@"
	
PokegearBank_Reset:
	ld b, CGB_BANK_CARD_PALS
	call GetCGBLayout
	call SetPalettes
	
	call InitPokegearTilemap
	ld hl, PokegearText_BankMakeSelection
	call PrintText
	
	hlcoord 3, 4
	ld de, PokegearBank_Init.Welcome
	call PlaceString
	
	hlcoord 6, 8
	ld de, PokegearBank_Init.Withdraw
	call PlaceString
	
	hlcoord 6, 10
	ld de, PokegearBank_Init.Deposit
	call PlaceString
	
	call CopyTilemapAtOnce
	
	call PokegearBank_UpdateCursor
	ld hl, wJumptableIndex
	ld a, [hl]
	dec a
	ld [wJumptableIndex], a
	ret
	
PokegearClock_Init: ; 90f2d (24:4f2d)
	call InitPokegearTilemap
	ld hl, PokegearText_PressAnyButtonToExit
	call PrintText
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearClock_Joypad: ; 90f3e (24:4f3e)
	call .UpdateClock
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON + B_BUTTON + START + SELECT
	jr nz, .quit
	ld a, [hl]
	and D_RIGHT
	ret z
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .no_map_card
	lb bc, MAP_CARD, $2
	jr .done

.no_map_card
	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .no_phone_card
	lb bc, PHONE_CARD, $9
	jr .done

.no_phone_card
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	lb bc, BANK_CARD, $d
.done
	jp Pokegear_SwitchPage

.quit
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.UpdateClock: ; 90f7b (24:4f7b)
	xor a
	ld [hBGMapMode], a
	call Pokegear_UpdateClock
	ld a, $1
	ld [hBGMapMode], a
	ret

Pokegear_UpdateClock: ; 90f86 (24:4f86)
	hlcoord 3, 5
	lb bc, 5, 14
	call ClearBox
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	ld a, [wOptions2]
	bit CLOCK_FORMAT, a
	decoord 6, 8
	jr z, .h12
	decoord 8, 8
.h12
	call PrintHoursMins
	ld hl, .DayText
	bccoord 6, 6
	jp PlaceWholeStringInBoxAtOnce

.DayText: ; 0x90faf
	text_jump UnknownText_0x1c5821
	db "@"

; 0x90fb4

PokegearMap_CheckRegion: ; 90fb4 (24:4fb4)
	ld a, [wPokegearMapPlayerIconLandmark]
	cp SHAMOUTI_LANDMARK
	jr nc, .orange
	cp SOUTH_ONWA_LANDMARK
	jr nc, .south_onwa
	ld a, 3
	jr .done
.south_onwa
	ld a, 5
	jr .done
.orange
	ld a, 7
.done
	ld [wJumptableIndex], a
	ret

PokegearMap_Init: ; 90fcd (24:4fcd)
	call InitPokegearTilemap
	ld a, [wPokegearMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wPokegearMapCursorObjectPointer], a
	ld a, b
	ld [wPokegearMapCursorObjectPointer + 1], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearMap_NorthOnwaMap: ; 90fee (24:4fee)
	call TownMap_GetNorthOnwaLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_SouthOnwaMap: ; 90fe9 (24:4fe9)
	call TownMap_GetSouthOnwaLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_OrangeMap:
	call TownMap_GetOrangeLandmarkLimits
PokegearMap_ContinueMap: ; 90ff2 (24:4ff2)
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	jp .DPad

.right
	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .no_phone
	lb bc, PHONE_CARD, $9
	jr .done

.no_phone
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	lb bc, BANK_CARD, $d
	jr .done

.left
	lb bc, CLOCK_CARD, $0
.done
	jp Pokegear_SwitchPage

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.DPad: ; 9102f (24:502f)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .wrap_around_up
	ld a, e
	dec a
	ld [hl], a
.wrap_around_up
	inc [hl]
	jr .done_dpad

.down
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .wrap_around_down
	ld a, d
	inc a
	ld [hl], a
.wrap_around_down
	dec [hl]

.done_dpad
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wPokegearMapCursorObjectPointer]
	ld c, a
	ld a, [wPokegearMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wPokegearMapCursorLandmark]
	jp PokegearMap_UpdateCursorPosition

PokegearMap_InitPlayerIcon: ; 9106a
	push af
	depixel 0, 0
	ld a, [wPlayerPalette]
	cp 0
	jp nz, .cont1
	ld b, SPRITE_ANIM_INDEX_RED_WALK
	jp .ok

.cont1
	ld a, [wPlayerPalette]
	cp 1
	jp nz, .cont2
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK
	jp .ok
	
.cont2
	ld a, [wPlayerPalette]
	cp 2
	jp nz, .cont3
	ld b, SPRITE_ANIM_INDEX_GREEN_WALK
	jp .ok

.cont3
	ld a, [wPlayerPalette]
	cp 3
	jp nz, .cont4
	ld b, SPRITE_ANIM_INDEX_BROWN_WALK
	jp .ok
	
.cont4
	ld a, [wPlayerPalette]
	cp 4
	jp nz, .cont5
	ld b, SPRITE_ANIM_INDEX_PURPLE_WALK
	jp .ok
	
.cont5
	ld a, [wPlayerPalette]
	cp 5
	jp nz, .cont6
	ld b, SPRITE_ANIM_INDEX_TEAL_WALK
	jp .ok
	
.cont6
	ld b, SPRITE_ANIM_INDEX_PINK_WALK
	
.ok
	ld a, b
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 91098

PokegearMap_InitCursor: ; 91098
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_MODE_ARROW
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $4
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	push bc
	call PokegearMap_UpdateCursorPosition
	pop bc
	ret

; 910b4

PokegearMap_UpdateLandmarkName: ; 910b4
	push af
	hlcoord 9, 1
	lb bc, 2, 10
	call ClearBox
	pop af
	ld e, a
	push de
	farcall GetLandmarkName
	pop de
	call TownMap_ConvertLineBreakCharacters
;	hlcoord 9, 1
;	ld [hl], "<UPDN>"
	ret
	
PokegearMap_UpdateLandmarkName2: ; 910b4
	push af
	hlcoord 8, 0
	lb bc, 2, 12
	call ClearBox
	pop af
	ld e, a
	push de
	farcall GetLandmarkName
	pop de
	call TownMap_ConvertLineBreakCharacters2
;	hlcoord 9, 1
;	ld [hl], "<UPDN>"
	ret

; 910d4

PokegearMap_UpdateCursorPosition: ; 910d4
	push bc
	ld e, a
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret
; 910e8

TownMap_ConvertLineBreakCharacters: ; 1de2c5
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "<NEXT>"
	jr z, .line_break
	cp "¯"
	jr z, .line_break
	inc hl
	jr .loop

.line_break
	ld [hl], "<LNBRK>"

.end
	ld de, wStringBuffer1
	hlcoord 9, 1
	jp PlaceString
	
TownMap_ConvertLineBreakCharacters2: ; 1de2c5
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .end
	cp "<NEXT>"
	jr z, .line_break
	cp "¯"
	jr z, .line_break
	inc hl
	jr .loop

.line_break
	ld [hl], "<LNBRK>"

.end
	ld de, wStringBuffer1
	hlcoord 8, 0
	jp PlaceString

TownMap_GetNorthOnwaLandmarkLimits:
	lb de, ROUTE_15, SUNSET_BAY
	ret

TownMap_GetSouthOnwaLandmarkLimits: ; 910e8
	lb de, DESERT_WASTELAND, ROUTE_16
	eventflagcheck EVENT_CAN_GO_TO_DESERT
	ret nz
	ld d, CROSSROADS
	ret

TownMap_GetOrangeLandmarkLimits:
	lb de, SUNSET_BAY, SUNSET_BAY
	ret

; 910f9

PlaceTapes:
	ld a, 128
	ld d, a
	ld a, 80
	ld e, a
	call TapeAnimate
	ld a, 128
	ld d, a
	ld a, 144
	ld e, a
	call TapeAnimate
	ret	

PokegearRadio_Init: ; 910f9 (24:50f9)	
	ld b, CGB_RADIO_PALS
	call GetCGBLayout
	call SetPalettes
	
	ld hl, RadioGFX
	ld de, VTiles2
	lb bc, BANK(RadioGFX), $40
	call DecompressRequest2bpp
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_RADIO_TUNING_KNOB
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $8
	
	ld a, [wRadioTuningKnob]
	inc a
	ld c, a
	ld a, [wMapMusic]
	cp c
	jr nz, .update_music
	
	ld a, [wTapePlayerActive]
	cp 0
	jr z, .update_music	
	call DrawRadioScreen
	jr .cont
.update_music
	call _UpdateRadioStation	
.cont
	call LoadStandardFont
	call LoadFontsExtra
	
	ld a, [wTapePlayerActive]
	cp 0
	jr z, .skip
	call PlaceTapes
	
.skip
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearRadio_Reset:
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_RADIO_TUNING_KNOB
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $8
	call _UpdateRadioStation
	ld hl, wJumptableIndex
	ld [hl], $0
	ret

PokegearRadio_Joypad: ; 91112 (24:5112)
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .select
	ld a, [wPlaceBallsX]
	cp 68
	jr z, .skip
	cp 69
	jr z, .skip
	cp 0
	jr z, .skip
	dec a
	ld [wPlaceBallsX], a
	cp 0
	jr nz, .skip
	ld a, [wTapePlayerActive]
	cp 1
	jr z, .skip
	ld a, 1
	ld [wTapePlayerActive], a
	
	xor a
	ld [wInputFlags], a
	
	jp UpdateRadioStation
.select
	ld a, [wTapePlayerBacklite]
	cp 0
	jr z, .set
	xor a
	jr .finish_select
.set
	ld a, 1
.finish_select
	ld [wTapePlayerBacklite], a
	ld de, SFX_PECK
	call PlaySFX
	ld b, CGB_RADIO_PALS
	call GetCGBLayout
	call SetPalettes
	
.skip
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
;	ld a, [hl]
;	and D_LEFT
;	jr nz, .left
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	jp FarCall_hl
	
.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

PokegearBank_Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jp nz, .cancel
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret
	
.up
	ld a, [wPokegearPhoneCursorPosition]
	cp 0
	ret z
	dec a
	ld [wPokegearPhoneCursorPosition], a
	jr .done_updown
	
.down
	ld a, [wPokegearPhoneCursorPosition]
	cp 0
	ret nz
	inc a
	ld [wPokegearPhoneCursorPosition], a
	
.done_updown
	xor a
	ld [hBGMapMode], a
	call PokegearBank_UpdateCursor
	jp ApplyTilemapInVBlank

.left
	ld a, [wPokegearFlags]
	bit 2, a
	jr z, .no_phone
	lb bc, PHONE_CARD, $9
	jr .switch_page

.no_phone
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .no_map
	lb bc, MAP_CARD, $2
	jr .switch_page

.no_map
	lb bc, CLOCK_CARD, $0
.switch_page
	jp Pokegear_SwitchPage

.a
	hlcoord 2, 4
	ld de, .blank
	call PlaceString
	hlcoord 2, 5
	ld de, .blank
	call PlaceString
	hlcoord 2, 6
	ld de, .blank
	call PlaceString
	hlcoord 2, 7
	ld de, .blank
	call PlaceString
	hlcoord 2, 8
	ld de, .blank
	call PlaceString
	hlcoord 2, 10
	ld de, .blank
	call PlaceString
	ld a, [wPokegearPhoneCursorPosition]
	cp 1
	jr z, .deposit
	farcall BankCard_TakeMoney
	jr .end
.deposit
	farcall BankCard_StoreMoney
.end	
	ld c, 20
	call DelayFrames
	
	ld hl, PokegearText_BankMakeSelection
	call PrintText
	
;	call CopyTilemapAtOnce
	
	ld a, BANK_CARD
	ld [wcf64], a
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
.Withdraw:
	db "WITHDRAW@"
	
.Deposit:
	db "DEPOSIT@"
	
.blank:
	db "                @"

PokegearPhone_Init: ; 91156 (24:5156)
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a

	call InitPokegearTilemap
	call Load1bppFont
	call Load1bppFrame
	ld hl, PokegearText_WhomToCall
	jp PrintText

PokegearPhone_Joypad: ; 91171 (24:5171)
	ld b, CGB_POKEGEAR_PALS
	call GetCGBLayout
	call SetPalettes

	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	jp PokegearPhone_GetDPad

.left
	ld a, [wPokegearFlags]
	bit 0, a
	jr z, .no_map
	lb bc, MAP_CARD, $2
	jr .switch_page

.no_map
	lb bc, CLOCK_CARD, $0
	jr .switch_page

.right
	ld a, [wPokegearFlags]
	bit 1, a
	ret z
	lb bc, BANK_CARD, $d
.switch_page
	jp Pokegear_SwitchPage

.b
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.a
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	ret z
	ld [wPokegearPhoneSelectedPerson], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 20 * 2
	rst AddNTimes
	ld [hl], "▷"
	call PokegearPhoneContactSubmenu
	jr c, .quit_submenu
	ld hl, wJumptableIndex
	inc [hl]
	ret

.quit_submenu
	ld a, $a
	ld [wJumptableIndex], a
	ret

PokegearPhone_MakePhoneCall: ; 911eb (24:51eb)
	eventflagcheck EVENT_SPOOKHOUSE_DARK
	jr nz, .dark_room
	call GetMapHeaderPhoneServiceNybble
	and a
	jr nz, .no_service
	ld hl, wOptions1
	res NO_TEXT_SCROLL, [hl]
	xor a
	ld [hInMenu], a
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld a, [wPokegearPhoneSelectedPerson]
	ld b, a
	call Function90199
.dark_room_return
	ld c, 10
	call DelayFrames
	ld hl, wOptions1
	set NO_TEXT_SCROLL, [hl]
	ld a, $1
	ld [hInMenu], a
	call PokegearPhone_UpdateCursor
	ld hl, wJumptableIndex
	inc [hl]
	ret
.dark_room
	ld hl, wOptions1
	res NO_TEXT_SCROLL, [hl]
	xor a
	ld [hInMenu], a
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld hl, .NoUse
	call PrintText
	jr .dark_room_return

.no_service
	farcall Phone_NoSignal
	ld hl, .OutOfServiceArea
	call PrintText
	ld a, $a
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	jp PrintText

; 9124c (24:524c)

.dotdotdot ; 0x9124c
	;
	text_jump UnknownText_0x1c5824
	db "@"

; 0x91251

.OutOfServiceArea: ; 0x91251
	; You're out of the service area.
	text_jump UnknownText_0x1c5827
	db "@"

.NoUse:
	text_jump NoUseText
	db "@"

PokegearPhone_FinishPhoneCall: ; 91256 (24:5256)
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z
	farcall HangUp
	ld a, $a
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	jp PrintText

PokegearPhone_GetDPad: ; 9126d (24:526d)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	and a
	jr z, .scroll_page_up
	dec [hl]
	jr .done_joypad_same_page

.scroll_page_up
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .done_joypad_update_page

.down
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	cp $3
	jr nc, .scroll_page_down
	inc [hl]
	jr .done_joypad_same_page

.scroll_page_down
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	cp CONTACT_LIST_SIZE - 4
	ret nc
	inc [hl]
	jr .done_joypad_update_page

.done_joypad_same_page
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateCursor
	jp ApplyTilemapInVBlank

.done_joypad_update_page
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	jp ApplyTilemapInVBlank

PokegearPhone_UpdateCursor: ; 912b7 (24:52b7)
	ld a, " "
	hlcoord 1, 4
	ld [hl], a
	hlcoord 1, 6
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	hlcoord 1, 10
	ld [hl], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 2 * SCREEN_WIDTH
	rst AddNTimes
	ld [hl], "▶"
	ret
	
PokegearBank_UpdateCursor: ; 912b7 (24:52b7)
	ld a, " "
	hlcoord 5, 8
	ld [hl], a
	hlcoord 5, 10
	ld [hl], a
	hlcoord 5, 8
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 2 * SCREEN_WIDTH
	rst AddNTimes
	ld [hl], "▶"
	ret

PokegearPhone_UpdateDisplayList: ; 912d8 (24:52d8)
	hlcoord 1, 3
	ld b, 9
	ld a, " "
.row
	ld c, 18
.col
	ld [hli], a
	dec c
	jr nz, .col
	inc hl
	inc hl
	dec b
	jr nz, .row
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, $0
	ld hl, wPhoneList
	add hl, de
	xor a
	ld [wPokegearPhoneLoadNameBuffer], a
.loop
	ld a, [hli]
	push hl
	push af
	hlcoord 2, 4
	ld a, [wPokegearPhoneLoadNameBuffer]
	ld bc, 2 * SCREEN_WIDTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop af
	ld b, a
	call Function90380
	pop hl
	ld a, [wPokegearPhoneLoadNameBuffer]
	inc a
	ld [wPokegearPhoneLoadNameBuffer], a
	cp $4 ; 4 entries fit on the screen
	jr c, .loop
	jp PokegearPhone_UpdateCursor

; 9131e (24:531e)

PokegearPhone_DeletePhoneNumber: ; 9131e
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 0
	ld hl, wPhoneList
	ld c, CONTACT_LIST_SIZE
.loop
	ld a, [hli]
	and a
	jr nz, .skip
	ld a, [hld]
	ld [hli], a
	ld [hl], 0
.skip
	dec c
	jr nz, .loop
	ret

; 91342

PokegearPhoneContactSubmenu: ; 91342 (24:5342)
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld c, [hl]
	farcall CheckCanDeletePhoneNumber
	ld a, c
	and a
	jr z, .cant_delete
	ld hl, .CallDeleteCancelJumptable
	ld de, .CallDeleteCancelStrings
	jr .got_menu_data

.cant_delete
	ld hl, .CallCancelJumptable
	ld de, .CallCancelStrings
.got_menu_data
	xor a
	ld [hBGMapMode], a
	push hl
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push hl
	ld bc, hBGMapAddress + 1
	add hl, bc
	ld a, [de]
	inc de
	sla a
	ld b, a
	ld c, 8
	push de
	call TextBox
	pop de
	pop hl
	inc hl
	call PlaceString
	pop de
	xor a
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	call ApplyTilemapInVBlank
.loop
	push de
	call JoyTextDelay
	pop de
	ld hl, hJoyPressed
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call DelayFrame
	jr .loop

.d_up
	ld hl, wPokegearPhoneSubmenuCursor
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	call .UpdateCursor
	jr .loop

.d_down
	ld hl, 2
	add hl, de
	ld a, [wPokegearPhoneSubmenuCursor]
	inc a
	cp [hl]
	jr nc, .loop
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	jr .loop

.a_b
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld a, $1
	ld [hBGMapMode], a
	pop hl
	ld a, [hJoyPressed]
	and B_BUTTON
	jr nz, .Cancel
	ld a, [wPokegearPhoneSubmenuCursor]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Cancel: ; 913f1
	ld hl, PokegearText_WhomToCall
	call PrintText
	scf
	ret

; 913f9 (24:53f9)

.Delete: ; 913f9
	ld hl, PokegearText_DeleteStoredNumber
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	jr c, .CancelDelete
	call PokegearPhone_DeletePhoneNumber
	xor a
	ld [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld hl, PokegearText_WhomToCall
	call PrintText
	call ApplyTilemapInVBlank
.CancelDelete:
	scf
	ret

; 9141b

.Call: ; 9141b
	and a
	ret

; 9141d

.UpdateCursor: ; 9141d (24:541d)
	push de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [de]
	ld c, a
	push hl
	ld a, " "
	ld de, SCREEN_WIDTH * 2
.clear_column
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear_column
	pop hl
	ld a, [wPokegearPhoneSubmenuCursor]
	ld bc, SCREEN_WIDTH  * 2
	rst AddNTimes
	ld [hl], "▶"
	pop de
	ret

; 9143f (24:543f)

.CallDeleteCancelStrings: ; 9143f
	dwcoord 10, 6
	db 3
	db   "Call"
	next "Delete"
	next "Cancel"
	db   "@"
; 91455

.CallDeleteCancelJumptable: ; 91455
	dw .Call
	dw .Delete
	dw .Cancel

; 9145b

.CallCancelStrings: ; 9145b
	dwcoord 10, 8
	db 2
	db   "Call"
	next "Cancel"
	db   "@"
; 9146a

.CallCancelJumptable: ; 9146a
	dw .Call
	dw .Cancel

; 9146e

Pokegear_SwitchPage: ; 91480 (24:5480)
	ld de, SFX_READ_TEXT_2
	call PlaySFX
.skipsound
	ld a, c
	ld [wJumptableIndex], a
	ld a, b
	ld [wcf64], a
	jp DeleteSpriteAnimStruct2ToEnd

DeleteSpriteAnimStruct2ToEnd: ; 914ab (24:54ab)
	ld hl, wSpriteAnim2
	ld bc, wSpriteAnimationStructsEnd - wSpriteAnim2
	xor a
	call ByteFill
	ld a, 2
	ld [wSpriteAnimCount], a
	ret

Pokegear_LoadTilemapRLE: ; 914bb (24:54bb)
	; Format: repeat count, tile ID
	; Terminated with $FF
	hlcoord 0, 0
Pokegear_LoadTilemapRLE2:
.loop
	ld a, [de]
	cp $ff
	ret z
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, b
.load
	ld [hli], a
	dec c
	jr nz, .load
	jr .loop

; 914ce (24:54ce)

PokegearText_WhomToCall: ; 0x914ce
	; Whom do you want to call?
	text_jump UnknownText_0x1c5847
	db "@"

; 0x914d3

PokegearText_PressAnyButtonToExit: ; 0x914d3
	; Press any button to exit.
	text_jump UnknownText_0x1c5862
	db "@"

PokegearText_BankMakeSelection:
	text_jump UnknownText_0x1bd942_2
	db "@"

PokegearText_DeleteStoredNumber: ; 0x914d8
	; Delete this stored phone number?
	text_jump UnknownText_0x1c587d
	db "@"

; 0x914dd

PokegearSpritesGFX: ; 914dd
INCBIN "gfx/pokegear/pokegear_sprites.2bpp.lz"
; 9150d

BankTilemapRLE: ; 915db
INCBIN "gfx/pokegear/bank.tilemap.rle"
RadioTilemapRLE: ; 9150d
INCBIN "gfx/pokegear/radio.tilemap.rle"
PhoneTilemapRLE: ; 9158a
INCBIN "gfx/pokegear/phone.tilemap.rle"
ClockTilemapRLE: ; 915db
INCBIN "gfx/pokegear/clock.tilemap.rle"
RadioButtonsPlayTilemapRLE:
INCBIN "gfx/pokegear/play.tilemap.rle"
RadioButtonsBackTilemapRLE:
INCBIN "gfx/pokegear/back.tilemap.rle"
RadioButtonsForwardTilemapRLE:
INCBIN "gfx/pokegear/forward.tilemap.rle"
RadioTitleTilemapRLE:
INCBIN "gfx/pokegear/radio_title.tilemap.rle"
RadioComposerTilemapRLE:
INCBIN "gfx/pokegear/radio_composer.tilemap.rle"

_UpdateRadioStation: ; 9163e (24:563e)
	jp UpdateRadioStation

; called from engine/sprite_anims.asm

AnimateTuningKnob: ; 91640 (24:5640)
	push bc
	call .TuningKnob
	pop bc
;	ld a, [wRadioTuningKnob]
;	ld hl, SPRITEANIMSTRUCT_XOFFSET
;	add hl, bc
;	ld [hl], a
	ret

.TuningKnob: ; 9164e (24:564e)
	ld hl, hJoypadDown
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jp nz, .right
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .A
	ld de, SFX_SWITCH_POCKETS
	ld a, [wPlaceBallsX]
	cp 68
	jr z, .release
	cp 69
	jr z, .release
	ret
.release
	ld a, 0
	ld [wPlaceBallsX], a
	jp .update
.A
	call CheckUnlockedSong
	ret z
	ld a, [wTapePlayerActive]
	cp 0
	jr z, .start
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	call WaitSFX
	xor a
	ld [wTapePlayerActive], a
	ld [wPlaceBallsX], a
	ld de, MUSIC_NONE
	call PlayMusic
	lb bc, TAPE_PLAYER_CARD, $2
	jp Pokegear_SwitchPage.skipsound
.start
	set 6, a
	ld [wInputFlags], a
	ld a, 14
	ld [wPlaceBallsX], a
	
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	call PlaceTapes
	
	ld de, RadioButtonsPlayTilemapRLE
	call Pokegear_LoadTilemapRLE
;	call Pokegear_FinishTilemap
	ret
.left
	ld hl, wRadioTuningKnob
	ld a, [hl]
	and a
	ret z
;	dec [hl]
	call DelayFrame
	call DelayFrame
	dec [hl]
	
	ld de, RadioButtonsBackTilemapRLE
	call Pokegear_LoadTilemapRLE
;	call Pokegear_FinishTilemap
	ld a, [wPlaceBallsX]
	cp 68
	jr z, .skip_sound_1
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	call WaitSFX
.skip_sound_1
	ld a, 68
	ld [wPlaceBallsX], a
	jr .left_right_end
.right
	ld hl, wRadioTuningKnob
	ld a, [hl]
	cp NUM_TAPE_PLAYER_SONGS - 2
	ret nc
;	inc [hl]
	call DelayFrame
	call DelayFrame
	inc [hl]
	
	ld de, RadioButtonsForwardTilemapRLE
	call Pokegear_LoadTilemapRLE
;	call Pokegear_FinishTilemap
	ld a, [wPlaceBallsX]
	cp 69
	jr z, .skip_sound_2
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	call WaitSFX
.skip_sound_2
	ld a, 69
	ld [wPlaceBallsX], a
.left_right_end
	xor a
	ld [wTapePlayerActive], a
	ld de, MUSIC_NONE
	call PlayMusic
	lb bc, TAPE_PLAYER_CARD, $2
	jp Pokegear_SwitchPage.skipsound
.update
UpdateRadioStation: ; 9166f (24:566f)
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	
	call DrawRadioScreen
	
	ld a, [wRadioTuningKnob]
	inc a
	ld [wMapMusic], a
	
	ld a, [wTapePlayerActive]
	cp 0
	ret z
	
	ld a, [wMapMusic]
	ld e, a
	ld d, 0
	jp PlayMusic

.foundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnafterstation
	push de
	jp hl

.returnafterstation
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

CheckUnlockedSong:
	ld a, [wRadioTuningKnob]
	inc a
	ld c, a
	ld hl, wUnlockedSongs
	ld b, CHECK_FLAG
	ld d, 0
	predef FlagPredef
	ld a, c
	and a
	ret

DrawRadioScreen:
;	ld a, MUSIC_POKEMON_CENTER
;	ld c, a
;	ld hl, wUnlockedSongs
;	ld b, SET_FLAG
;	ld d, 0
;	predef FlagPredef

	ld de, RadioTilemapRLE
	call Pokegear_LoadTilemapRLE
	
	ld a, [wPlaceBallsX]
	cp 68
	jr z, .left
	cp 69
	jr z, .right
	jr .try_play
.left
	ld de, RadioButtonsBackTilemapRLE
	call Pokegear_LoadTilemapRLE
;	call Pokegear_FinishTilemap
	jr .skip_play
.right
	ld de, RadioButtonsForwardTilemapRLE
	call Pokegear_LoadTilemapRLE
;	call Pokegear_FinishTilemap
	jr .skip_play
.try_play
	ld a, [wTapePlayerActive]
	cp 1
	jr nz, .skip_play
	ld de, RadioButtonsPlayTilemapRLE
	call Pokegear_LoadTilemapRLE
.skip_play
;	call Pokegear_FinishTilemap
	
	ld de, .Sharp
	hlcoord 1, 3
	call PlaceString
	
	ld a, [wRadioTuningKnob]
	inc a
	ld [wRadioTuningKnob], a
	ld de, wRadioTuningKnob
	hlcoord 2, 3
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [wRadioTuningKnob]
	dec a
	ld [wRadioTuningKnob], a
	
	call CheckUnlockedSong
	jr z, .song_not_unlocked
	ld a, [wRadioTuningKnob]
	inc a
	farcall DrawSongInfo
	ret
.song_not_unlocked
	ld de, .Unknown
	hlcoord 1, 9
	call PlaceString
	ld de, RadioComposerTilemapRLE
	hlcoord 1, 8
	call Pokegear_LoadTilemapRLE2
	ld de, .Unknown
	hlcoord 1, 5
	call PlaceString
	ld de, RadioTitleTilemapRLE
	hlcoord 1, 4
	call Pokegear_LoadTilemapRLE2
	ret
	
.Unknown
	db "???@"
	
.Sharp
	db "<SHARP>@"
	
_TownMap: ; 9191c
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, %11100011
	ld [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	ld [wTownMapPlayerIconLandmark], a
	ld [wTownMapCursorLandmark], a
	xor a
	ld [hBGMapMode], a
	call .InitTilemap
	call ApplyAttrAndTilemapInVBlank
	ld a, [wTownMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wTownMapCursorObjectPointer], a
	ld a, b
	ld [wTownMapCursorObjectPointer + 1], a
	ld b, CGB_POKEGEAR_PALS
	call GetCGBLayout
	call SetPalettes
	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame

	ld a, [wTownMapPlayerIconLandmark]
	cp SHAMOUTI_LANDMARK
	jr nc, .orange
	cp SOUTH_ONWA_LANDMARK
	jr nc, .south_onwa
	call TownMap_GetNorthOnwaLandmarkLimits
	jr .resume
.south_onwa
	call TownMap_GetSouthOnwaLandmarkLimits
	jr .resume
.orange
	call TownMap_GetOrangeLandmarkLimits

.resume
	call .loop
	pop af
	ld [wVramState], a
	pop af
	ld [hInMenu], a
	pop af
	ld [wOptions1], a
	jp ClearBGPalettes

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up

	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
.loop2
	push de
	farcall PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .okay
	ld a, e
	dec a
	ld [hl], a

.okay
	inc [hl]
	push de
	jr .next

.pressed_down
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .okay2
	ld a, d
	inc a
	ld [hl], a

.okay2
	dec [hl]
	push de

.next
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName2
	ld a, [wTownMapCursorObjectPointer]
	ld c, a
	ld a, [wTownMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	pop de
	jr .loop2
; 91a04

.InitTilemap: ; 91a04
	farcall PokegearMap
	ld a, $7
	ld bc, 6
	hlcoord 1, 0
	call ByteFill
	hlcoord 0, 0
	ld [hl], $6
	hlcoord 7, 0
	ld [hl], $17
	hlcoord 7, 1
	ld [hl], $16
	hlcoord 7, 2
	ld [hl], $26
	ld a, $7
	ld bc, NAME_LENGTH
	hlcoord 8, 2
	call ByteFill
	hlcoord 19, 2
	ld [hl], $17
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName2
	call TownMapPals

	ld a, [wTownMapPlayerIconLandmark]
	cp SHAMOUTI_LANDMARK
	jp nc, TownMapOrangeFlips
	cp SOUTH_ONWA_LANDMARK
	jp nc, TownMapSouthOnwaFlips
	jp TownMapNorthOnwaFlips
; 91a53

PokegearMap: ; 91ae1
	call LoadTownMapGFX
	ld a, [wPokegearMapPlayerIconLandmark]
;	cp SHAMOUTI_LANDMARK
;	jp nc, FillOrangeMap
	cp SOUTH_ONWA_LANDMARK
	jp nc, .south
	xor a
	ld [wWarpNumber], a
	ld b, CGB_POKEGEAR_PALS
	call GetCGBLayout
	call SetPalettes
	jp FillNorthOnwaMap
.south
	ld a, 1
	ld [wWarpNumber], a
	ld b, CGB_POKEGEAR_PALS
	call GetCGBLayout
	call SetPalettes
	jp FillSouthOnwaMap

_FlyMap: ; 91af3
	call GetCurrentLandmark
; The first 46 locations are part of NorthOnwa. The rest are in SouthOnwa
	cp SOUTH_ONWA_LANDMARK
	jr nc, .SouthOnwaFlyMap
	xor a
	ld [wWarpNumber], a
	jr .cont
.SouthOnwaFlyMap
	ld a, 1
	ld [wWarpNumber], a
.cont
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ld [hBGMapMode], a
.cont2
	farcall ClearSpriteAnims
	call LoadTownMapGFX	
	call FlyMap
	ld b, CGB_POKEGEAR_PALS
	call GetCGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and SELECT
	jr nz, .pressedSelect
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call FlyMapScroll
	call GetMapCursorCoordinates
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedSelect
	ld a, [wWarpNumber]
	cp 1
	jr z, .switch_to_north
	ld a, 1
	ld [wWarpNumber], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	jr _FlyMap.cont2
.switch_to_north
	xor a
	ld [wWarpNumber], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	jr _FlyMap.cont2

.pressedB
	ld a, -1
	jr .exit

.pressedA
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.exit
	ld [wTownMapPlayerIconLandmark], a
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ld [hWY], a
	xor a
	ld [hBGMapAddress], a
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	ret

; 91b73

FlyMapScroll: ; 91b73
	ld a, [wStartFlypoint]
	ld e, a
	ld a, [wEndFlypoint]
	ld d, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .ScrollNext
	ld a, [hl]
	and D_DOWN
	jr nz, .ScrollPrev
	ret

.ScrollNext:
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a
.NotAtEndYet:
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev:
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a
.NotAtStartYet:
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev
.Finally:
	call TownMapBubble
	call ApplyTilemapInVBlank
	xor a
	ld [hBGMapMode], a
	ret

; 91bb5

TownMapBubble: ; 91bb5
; Draw the bubble containing the location text in the town map HUD

	hlcoord 0, 0
;	ld a, $30
;	ld [hli], a

	ld bc, 20
	ld a, " "
	call ByteFill

	hlcoord 0, 1
	ld bc, 20
	ld a, " "
	call ByteFill
	
; Top of map border
	hlcoord 0, 2
	ld a, $06
	ld [hli], a
	ld bc, 18
	ld a, $07
	call ByteFill
	ld a, $17
	ld [hli], a

; Print "Where?"
	hlcoord 1, 0
	ld de, .Where
	call PlaceString
; Print the name of the default flypoint
	call .Name
; Up/down arrows
	hlcoord 18, 1
	ld [hl], "<UPDN>"
	ret

.Where:
	db "Where to?@"

.Name:
; We need the map location of the default flypoint
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkName
	hlcoord 2, 1
	ld de, wStringBuffer1
	jp PlaceString

; 91c17

GetMapCursorCoordinates: ; 91c17
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, $0
	add hl, hl
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkCoords
	ld a, [wTownMapCursorCoordinates]
	ld c, a
	ld a, [wTownMapCursorCoordinates + 1]
	ld b, a
	ld hl, $4
	add hl, bc
	ld [hl], e
	ld hl, $5
	add hl, bc
	ld [hl], d
	ret

; 91c3c

CheckIfVisitedFlypoint: ; 91c3c
; Check if the flypoint loaded in [hl] has been visited yet.
	push bc
	push de
	push hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld c, [hl]
	call HasVisitedSpawn
	pop hl
	pop de
	pop bc
	and a
	ret

; 91c50

HasVisitedSpawn: ; 91c50
; Check if spawn point c has been visited.
	ld hl, wVisitedSpawns
	ld b, CHECK_FLAG
	ld d, 0
	predef FlagPredef
	ld a, c
	ret

; 91c5e

INCLUDE "data/maps/flypoints.asm"

FlyMap: ; 91c90
	ld a, [wWarpNumber]
	cp 1
	jr z, .SouthOnwaFlyMap
.NorthOnwaFlyMap:
	push af
; Start from Sunset Bay
	ld a, FLY_SUNSET
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at Sunset Bay...
	ld [wStartFlypoint], a
; ..and end at Luster City
	ld a, FLY_LUSTER
	ld [wEndFlypoint], a
; Fill out the map
	call FillNorthOnwaMap
	call TownMapBubble
	call TownMapPals
	call TownMapNorthOnwaFlips
	call .MapHud
	pop af
	call GetCurrentLandmark
; The first 46 locations are part of NorthOnwa. The rest are in SouthOnwa
	cp SOUTH_ONWA_LANDMARK
	ret nc
	jp TownMapPlayerIcon

.SouthOnwaFlyMap:
	push af
; Start from Port Shimmer
	ld a, FLY_SHIMMER
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at Shimmer City...
	ld [wStartFlypoint], a
; ..and end at TODO
	ld a, FLY_CROSSROADS
	ld [wEndFlypoint], a
; Fill out the map
	call FillSouthOnwaMap
	call TownMapBubble
	call TownMapPals
	call TownMapSouthOnwaFlips
	call .MapHud
	pop af
	call GetCurrentLandmark
; The first 46 locations are part of NorthOnwa. The rest are in SouthOnwa
	cp SOUTH_ONWA_LANDMARK
	ret c
	jp TownMapPlayerIcon

.MapHud:
	hlbgcoord 0, 0 ; BG Map 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wTownMapCursorCoordinates], a
	ld a, b
	ld [wTownMapCursorCoordinates + 1], a
	ret

; 91d11

_Area: ; 91d11
; e: Current landmark
	ld a, [wTownMapPlayerIconLandmark]
	push af
	ld a, [wTownMapCursorLandmark]
	push af
	ld a, e
	ld [wTownMapPlayerIconLandmark], a
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [hInMenu], a
	ld de, PokedexNestIconGFX
	ld hl, VTiles0 tile $7f
	lb bc, BANK(PokedexNestIconGFX), 1
	call Request2bpp
	call .GetPlayerOrFastShipIcon
	ld hl, VTiles0 tile $78
	ld c, 4
	call Request2bppInWRA6
	call LoadTownMapGFX

	ld a, [wTownMapPlayerIconLandmark]
;	cp SHAMOUTI_LANDMARK
;	jr nc, .shamouti
	cp SOUTH_ONWA_LANDMARK
	jr nc, .south_onwa
.north_onwa
	xor a
	ld [wWarpNumber], a
	ld a, NORTH_ONWA_REGION
	jr .set_region
;.shamouti
;	ld a, ORANGE_REGION
;	jr .set_region
.south_onwa
	ld a, 1
	ld [wWarpNumber], a
	ld a, SOUTH_ONWA_REGION
.set_region
	ld [wTownMapCursorLandmark], a
	call .UpdateGFX
	call .GetAndPlaceNest
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	ld a, [hJoypadDown]
	and SELECT
	jr nz, .select
	call .LeftRightInput
	call .BlinkNestIcons
	jr .next

.select
	call .HideNestsShowPlayer
.next
	call DelayFrame
	jr .loop

.a_b
	call ClearSprites
	pop af
	ld [wTownMapCursorLandmark], a
	pop af
	ld [wTownMapPlayerIconLandmark], a
	ret

; 91d9b

.LeftRightInput: ; 91d9b
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.left
	ld a, [wTownMapCursorLandmark]
	and a ; cp NORTH_ONWA ; min
	ret z

	dec a
	ld [wTownMapCursorLandmark], a
	jr .update

.right
	ld a, [wTownMapCursorLandmark]
	cp ORANGE_REGION ; max
	ret z
	cp SOUTH_ONWA_REGION
	jr z, .check_seen_orange_island
	ld a, [wStatusFlags]
	bit 6, a ; ENGINE_CREDITS_SKIP
	ret z
	jr .go_right
.check_seen_orange_island
	ld a, [wStatusFlags2]
	bit 3, a ; ENGINE_SEEN_SHAMOUTI_ISLAND
	ret z
.go_right

	ld a, [wTownMapCursorLandmark]
	inc a
	ld [wTownMapCursorLandmark], a

.update
	call .UpdateGFX
	jp .GetAndPlaceNest

.UpdateGFX:
	call ClearSprites
	farcall _Pokedex_JustBlackOutBG
	ld a, [wTownMapCursorLandmark]
	cp SOUTH_ONWA_REGION
	jr z, .SouthOnwaGFX
	cp ORANGE_REGION
	jr z, .OrangeGFX
	call FillNorthOnwaMap
	call .PlaceString_MonsNest
	call TownMapPals
	call TownMapNorthOnwaFlips
.FinishGFX
	hlbgcoord 0, 0
	call TownMapBGUpdate
	ld b, CGB_POKEDEX_AREA_PALS
	call GetCGBLayout
	call SetPalettes
	xor a
	ld [hBGMapMode], a
	ret

.SouthOnwaGFX:
	call FillSouthOnwaMap
	call .PlaceString_MonsNest
	call TownMapPals
	call TownMapSouthOnwaFlips
	jr .FinishGFX

.OrangeGFX:
	call FillOrangeMap
	call .PlaceString_MonsNest
	call TownMapPals
	call TownMapOrangeFlips
	jr .FinishGFX

; 91dcd

.BlinkNestIcons: ; 91dcd
	ld a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jr nz, .copy_sprites
	jp ClearSprites

.copy_sprites
	hlcoord 0, 0
	ld de, wSprites
	ld bc, wSpritesEnd - wSprites
	rst CopyBytes
	ret

; 91de9

.PlaceString_MonsNest: ; 91de9
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 1
	ld a, $6
	ld [hli], a
	ld bc, SCREEN_WIDTH - 2
	ld a, $7
	call ByteFill
	ld [hl], $17
	call GetPokemonName
	hlcoord 2, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, .String_SNest
	call PlaceString
	ld a, [wCurSpecies]
	cp MAGIKARP
	ret nz
	hlcoord 5, 6
	ld de, .magikarp_string
	jp PlaceString
	
.magikarp_string:
	db "Many Areas@"

; 91e16

.String_SNest:
	db "'s Nest@"
; 91e1e

.GetAndPlaceNest: ; 91e1e
	ld a, [wTownMapCursorLandmark]
	ld e, a
	farcall FindNest ; load nest landmarks into wTileMap[0,0]
	decoord 0, 0
	ld hl, wSprites
.nestloop
	ld a, [de]
	and a
	jr z, .done_nest
	push de
	ld e, a
	push hl
	farcall GetLandmarkCoords
	pop hl
	; load into OAM
	ld a, d
	sub 4
	ld [hli], a
	ld a, e
	sub 4
	ld [hli], a
	ld a, $7f ; nest icon in this context
	ld [hli], a
	xor a
	ld [hli], a
	; next
	pop de
	inc de
	jr .nestloop

.done_nest
	ld hl, wSprites
	decoord 0, 0
	ld bc, wSpritesEnd - wSprites
	rst CopyBytes
	ret

; 91e5a

.HideNestsShowPlayer: ; 91e5a
	call .CheckPlayerLocation
	ret c
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	farcall GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, .PlayerOAM
	ld hl, wSprites
.ShowPlayerLoop:
	ld a, [de]
	cp $80
	jr z, .clear_oam
	add b
	ld [hli], a
	inc de
	ld a, [de]
	add c
	ld [hli], a
	inc de
	ld a, [de]
	add $78 ; where the player's sprite is loaded
	ld [hli], a
	inc de
	push bc
	ld c, 0 ; RED
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .got_gender
	inc c   ; BLUE
.got_gender
	ld a, c
	ld [hli], a
	pop bc
	jr .ShowPlayerLoop

.clear_oam
	ld hl, wSprites + 4 * 4
	ld bc, wSpritesEnd - (wSprites + 4 * 4)
	xor a
	jp ByteFill

; 91e9c

.PlayerOAM: ; 91e9c
	db -1 * 8, -1 * 8,  0 ; top left
	db -1 * 8,  0 * 8,  1 ; top right
	db  0 * 8, -1 * 8,  2 ; bottom left
	db  0 * 8,  0 * 8,  3 ; bottom right
	db $80 ; terminator
; 91ea9

.CheckPlayerLocation: ; 91ea9
; Don't show the player's sprite if you're
; not in the same region as what's currently
; on the screen.
	ld a, [wTownMapPlayerIconLandmark]
	cp SHAMOUTI_LANDMARK
	jr nc, .player_in_orange
	cp SOUTH_ONWA_LANDMARK
	jr nc, .player_in_south_onwa
	ld a, [wTownMapCursorLandmark]
	and a ; cp NORTH_ONWA
	jr nz, .clear
.ok
	and a
	ret

.player_in_south_onwa
	ld a, [wTownMapCursorLandmark]
	cp SOUTH_ONWA_REGION
	jr nz, .clear
	jr .ok

.player_in_orange
	ld a, [wTownMapCursorLandmark]
	cp ORANGE_REGION
	jr nz, .clear
	jr .ok

.clear
	ld hl, wSprites
	ld bc, wSpritesEnd - wSprites
	xor a
	call ByteFill
	scf
	ret

; 91ed0

.GetPlayerOrFastShipIcon: ; 91ed0
;	ld a, [wTownMapPlayerIconLandmark]
;	cp FAST_SHIP
;	jr z, .FastShip
;	cp SINJOH_RUINS
;	jr z, .Sinjoh
;	cp MYSTRI_STAGE
;	jr z, .Sinjoh
	farjp GetPlayerIcon

;.FastShip:
;	ld de, FastShipGFX
;	ld b, BANK(FastShipGFX)
;	ret

;.Sinjoh:
;	ld de, SinjohRuinsArrowGFX
;	ld b, BANK(SinjohRuinsArrowGFX)
;	ret

; 91ee4

TownMapBGUpdate: ; 91ee4
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
; BG Map mode 2 (palettes)
	ld a, 2
	ld [hBGMapMode], a
; The BG Map is updated in thirds, so we wait
; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames
; Update BG Map tiles
	call ApplyTilemapInVBlank
; Turn off BG Map update
	xor a
	ld [hBGMapMode], a
	ret

; 91eff

FillNorthOnwaMap: ; 91eff
	ld de, NorthOnwaMap
	jr FillTownMap

FillOrangeMap:
;	ld de, OrangeMap
;	call FillTownMap
;	eventflagcheck EVENT_VISITED_FARAWAY_ISLAND
;	ret nz
;	ld a, $a
;	hlcoord 1, 12
;	ld [hli], a
;	ld [hli], a
;	ld [hli], a
;	ld [hli], a
;	ld [hl], a
;	hlcoord 5, 13
;	ld [hl], a
;	hlcoord 2, 14
;	ld [hli], a
;	ld [hli], a
;	inc hl
;	ld [hl], a
;	hlcoord 2, 15
;	ld [hli], a
;	ld [hli], a
;	inc hl
;	ld [hl], a
;	hlcoord 5, 16
;	ld [hl], a
;	ret

FillSouthOnwaMap: ; 91f04
	ld de, SouthOnwaMap
FillTownMap: ; 91f07
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	; [de] == yxTTTTTT
	ld a, [de]
	and %00111111
	; a == 00TTTTTT
	ld [hli], a
	inc de
	jr .loop

; 91f13

AssignPokeGearPals: ; 91f13
; Assign palettes based on tile ids
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	ld a, [hli]
	push hl
	cp $40 ; tiles after TownMapGFX use palette 0
	jr nc, .pal0
	call GetNextPokegearTilePalette
	jr .update
.pal0
	xor a
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop	
	ret

TownMapPals: ; 91f13
; Assign palettes based on tile ids
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	ld a, [hli]
	push hl
	cp $7f
	jr z, .pal1
	cp $80
	jr nc, .pal1
	cp $40 ; tiles after TownMapGFX use palette 0
	jr nc, .pal0
	call GetNextTownMapTilePalette
	jr .update
.pal1
	ld a, 1
	jr .update
.pal0
	xor a
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop	
	ret

GetNextTownMapTilePalette:
; The palette data is condensed to nybbles, least-significant first.
	ld hl, .PalMap
	srl a
	jr c, .odd
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and %111
	ret

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and %111
	ret

.PalMap:
townmappals: MACRO
rept _NARG / 2
	dn \2, \1
	shift
	shift
endr
endm
	townmappals 2, 2, 2, 3, 3, 7, 0, 0, 2, 2, 4, 2, 5, 6, 6, 5
	townmappals 2, 2, 7, 3, 4, 5, 0, 0, 2, 2, 0, 4, 3, 3, 3, 6
	townmappals 2, 2, 2, 7, 7, 4, 0, 0, 3, 7, 4, 0, 0, 0, 0, 0
	townmappals 2, 2, 2, 7, 2, 2, 4, 6, 4, 6, 4, 0, 0, 0, 0, 0
	townmappals 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	townmappals 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1

GetNextPokegearTilePalette:
; The palette data is condensed to nybbles, least-significant first.
	ld hl, .PalMap
	srl a
	jr c, .odd
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and %111
	ret

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and %111
	ret

.PalMap:
pokegearpals: MACRO
rept _NARG / 2
	dn \2, \1
	shift
	shift
endr
endm
	pokegearpals 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	pokegearpals 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	pokegearpals 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	pokegearpals 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	pokegearpals 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	pokegearpals 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

TownMapNorthOnwaFlips:
	decoord 0, 0, NorthOnwaMap
	jr TownMapFlips

TownMapSouthOnwaFlips:
	decoord 0, 0, SouthOnwaMap
	jr TownMapFlips

TownMapOrangeFlips:
	decoord 0, 0, OrangeMap
TownMapFlips:
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	; [de] == YXtttttt
	ld a, [de]
	and %11000000
	srl a
	; a == 0YX00000
	or [hl]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

TownMapMon: ; 91f7b
; Draw the FlyMon icon at town map location in

	farcall LoadFlyMonColor
; Get FlyMon icon
	ld e, 8 ; starting tile in VRAM
	farcall PokegearFlyMap_GetMonIcon
; Animation/palette
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $8
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	xor a
	ld [wMoogooCard1Value], a 
	ret

; 91fa6

TownMapPlayerIcon: ; 91fa6
; Draw the player icon at town map location in a
	push af
	farcall GetPlayerIcon
; Standing icon
	ld hl, VTiles0 tile $10
	ld c, 4 ; # tiles
	push bc
	push de
	call Request2bppInWRA6
	pop de
	pop bc
; Walking icon
	ld hl, $c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTiles0 tile $14
	call Request2bppInWRA6
; Animation/palette
	depixel 0, 0

	ld a, [wPlayerPalette]
	cp 0
	jp nz, .cont1
	ld b, SPRITE_ANIM_INDEX_RED_WALK
	jp .ok

.cont1
	ld a, [wPlayerPalette]
	cp 1
	jp nz, .cont2
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK
	jp .ok
	
.cont2
	ld a, [wPlayerPalette]
	cp 2
	jp nz, .cont3
	ld b, SPRITE_ANIM_INDEX_GREEN_WALK
	jp .ok

.cont3
	ld a, [wPlayerPalette]
	cp 3
	jp nz, .cont4
	ld b, SPRITE_ANIM_INDEX_BROWN_WALK
	jp .ok
	
.cont4
	ld a, [wPlayerPalette]
	cp 4
	jp nz, .cont5
	ld b, SPRITE_ANIM_INDEX_PURPLE_WALK
	jp .ok
	
.cont5
	ld a, [wPlayerPalette]
	cp 5
	jp nz, .cont6
	ld b, SPRITE_ANIM_INDEX_TEAL_WALK
	jp .ok
	
.cont6
	ld b, SPRITE_ANIM_INDEX_PINK_WALK
	
.ok
	
	ld a, b
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

TapeAnimate: ; 91fa6
; Draw the player icon at town map location in de
	push de
	ld de, RadioGFX2
	ld b, BANK(RadioGFX2)
; Standing icon
	ld hl, VTiles0 tile $20
	ld c, 16 ; # tiles
	push bc
	push de
	call Request2bpp
	pop de
	pop bc
; Animation/palette
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_TAPE
	ld a, b
	farcall _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $20
	pop de
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

; 0x91ff2

LoadTownMapGFX: ; 91ff2
	ld hl, TownMapGFX
	ld de, VTiles2
	lb bc, BANK(TownMapGFX), $40
	jp DecompressRequest2bpp

; 91fff

NorthOnwaMap: ; 91fff
INCBIN "gfx/town_map/north_onwa.bin"
; 92168

SouthOnwaMap: ; 92168
INCBIN "gfx/town_map/south_onwa.bin"
; 922d1

OrangeMap:
INCBIN "gfx/town_map/orange.bin"

PokedexNestIconGFX: ; 922d1
INCBIN "gfx/town_map/dexmap_nest_icon.2bpp"

PokegearGFX: ; 1de2e4
INCBIN "gfx/pokegear/pokegear.2bpp.lz"

RadioGFX:
INCBIN "gfx/pokegear/tape1.2bpp.lz"

RadioGFX2:
INCBIN "gfx/pokegear/tape2.2bpp"