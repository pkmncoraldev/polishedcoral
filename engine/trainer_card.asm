TRAINERCARD_BORDERGFX_START EQU $75

TrainerCard: ; 25105
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	
.return
	call TrainerCard_LoadGFX
	
	call .InitRAM
	
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .quit
	ld a, [hJoyLast]
	cp SELECT
	jr z, .phrase
	and B_BUTTON
	jr nz, .quit
	call .RunJumptable
	call DelayFrame
	jr .loop

.quit
	ld de, SFX_READ_TEXT
	call PlaySFX
	farcall FadeOutPalettes
	pop af
	ld [wOptions1], a
	pop af
	ld [wVramState], a
	ret

.phrase
	farcall FadeOutPalettes
	ld b, $3 ; trendy phrase
	ld de, wTrendyPhrase
	farcall _NamingScreen2
	ld hl, wTrendyPhrase
	ld de, DefaultTrendyPhrase
	call InitName
	
	ld hl, DefaultTrendyPhrase
	ld de, wTrendyPhrase
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .skip_sfx
	
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
.skip_sfx
	farcall FadeOutPalettes
	jr .return
; 0xc2b2
	
.InitRAM: ; 2513b (9:513b)
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD

	farcall GetCardPic

	ld hl, CardBorderGFX
	ld de, VTiles1 tile ($75 + $80)
	ld bc, 8 tiles
	ld a, BANK(CardBorderGFX)
	call FarCopyBytes
	
	ld hl, CardMiscGFX
	ld de, VTiles1 tile ($fa - $80)
	ld bc, 6 tiles
	ld a, BANK(CardMiscGFX)
	call FarCopyBytes

	call TrainerCard_PrintBorder
	call TrainerCard_PrintMedian
	call TrainerCard_PrintTopHalfOfCard

	call EnableLCD
	call ApplyTilemapInVBlank
	ld b, CGB_TRAINER_CARD
	call GetCGBLayout
	call SetPalettes
	call ApplyTilemapInVBlank
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.RunJumptable: ; 2518e (9:518e)
	jumptable .Jumptable, wJumptableIndex

.Jumptable: ; 2519d (9:519d)
	dw TrainerCard_Page1_LoadGFX
	dw TrainerCard_Page1_Joypad
	dw TrainerCard_Page2_LoadGFX
	dw TrainerCard_Page2_Joypad
	dw TrainerCard_Page3_LoadGFX
	dw TrainerCard_Page3_Joypad
	dw TrainerCard_Quit

DefaultTrendyPhrase:
	db "┐@@@@@@@@@@"
	
TrainerCard_IncrementJumptable: ; 251ab (9:51ab)
	ld hl, wJumptableIndex
	inc [hl]
	ret

TrainerCard_Quit: ; 251b0 (9:51b0)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TrainerCard_Page1_LoadGFX: ; 251b6 (9:51b6)
	call ClearSprites
	call TrainerCardSetup_ClearBottomHalf
	call ApplyTilemapInVBlank

	call TrainerCard_PrintMedian1

	ld b, CGB_TRAINER_CARD
	call GetCGBLayout
	call SetPalettes
	call ApplyTilemapInVBlank

	call TrainerCard_Page1_PrintMoney
	jp TrainerCard_IncrementJumptable

TrainerCard_Page1_Joypad: ; 251d7 (9:51d7)
;	call TrainerCard_Page1_PrintGameTime
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .pressed_right
	ret

.pressed_right
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	ld a, $2
	ld [wJumptableIndex], a
	ret
	
TrainerCard_Page2_LoadGFX: ; 251b6 (9:51b6)
	call ClearSprites
	call TrainerCardSetup_ClearBottomHalf
	call ApplyTilemapInVBlank

	call TrainerCard_PrintMedian2

	ld b, CGB_TRAINER_CARD
	call GetCGBLayout
	call SetPalettes
	call ApplyTilemapInVBlank

	call TrainerCard_Page2_PrintDexCaught_GameTime
	jp TrainerCard_IncrementJumptable

TrainerCard_Page2_Joypad: ; 251d7 (9:51d7)
	call TrainerCard_Page2_PrintGameTime
	ld hl, hJoyLast
	ld a, [hl]
	cp D_RIGHT
	jr z, .d_right
	cp D_LEFT
	jr z, .d_left
	ret

.d_right
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	ld a, $4
	ld [wJumptableIndex], a
	ret
	
.d_left
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	xor a
	ld [wJumptableIndex], a
	ret
	

; 251f4

TrainerCard_Page3_LoadGFX: ; 251f4 (9:51f4)
	call ClearSprites
	call TrainerCardSetup_ClearBottomHalf
	call ApplyTilemapInVBlank

	call TrainerCard_PrintMedian3

	ld b, CGB_TRAINER_CARD_2
	call GetCGBLayout
	call SetPalettes
	call ApplyTilemapInVBlank
	
	call TrainerCard_Page3_3_InitObjectsAndStrings
	jp TrainerCard_IncrementJumptable

TrainerCard_Page3_Joypad: ; 25221 (9:5221)
	ld hl, TrainerCard_OnwaBadgesOAM
	call TrainerCard_Page3_3_AnimateBadges
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .pressed_left
	ret

.pressed_left
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	ld a, $2
	ld [wJumptableIndex], a
	ret

TrainerCard_LoadHeaderGFX:
	ld hl, VTiles2 tile $23
	lb bc, BANK(CardStatusGFX), 20
	jp Request2bpp
	
TrainerCard_LoadGFX:
	ld de, CardStatusGFX
	call TrainerCard_LoadHeaderGFX
	
	ld de, LeaderGFX
	ld hl, VTiles2 tile $37
	lb bc, BANK(LeaderGFX), $50
	call Request2bpp

	ld de, BadgeGFX
	ld hl, VTiles0 tile $00
	lb bc, BANK(BadgeGFX), $2c
	jp Request2bpp

TrainerCard_PrintBorder: ; 253b0 (9:53b0)
;	hlcoord 1, 1
;	ld a, $fc
;	ld [hli], a

	hlcoord 0, 0

	ld a, TRAINERCARD_BORDERGFX_START
	ld [hli], a
	ld e, SCREEN_WIDTH - 3
	inc a ; top border
.loop1
	ld [hli], a
	dec e
	jr nz, .loop1
	
	ld a, TRAINERCARD_BORDERGFX_START
	ld [hli], a
	inc a
	inc a ; top-right corner
	ld [hli], a

	ld bc, SCREEN_WIDTH - 2
	ld e, SCREEN_HEIGHT - 3
	inc a ; left border
	ld [hli], a
	add hl, bc
	ld a, TRAINERCARD_BORDERGFX_START
	ld [hli], a
	inc a
	inc a
	inc a ; left border
.loop2
	ld [hli], a
	add hl, bc
	inc a ; right border
	ld [hli], a
	dec a ; left border again
	dec e
	jr nz, .loop2

	inc a
	inc a ; bottom-left corner
	ld [hli], a
	ld e, SCREEN_WIDTH - 2
	inc a ; bottom border
.loop3
	ld [hli], a
	dec e
	jr nz, .loop3
;	inc a ; bottom-right corner
	ld a, TRAINERCARD_BORDERGFX_START
	ld [hl], a
	
	hlcoord 1, 16
	ld a, $35
	ld [hli], a
	ret

TrainerCard_PrintMedian:
	hlcoord $12, 9
	ld a, $36
	ld [hli], a

	hlcoord 0, 7
	ld a, TRAINERCARD_BORDERGFX_START
	ld [hli], a
	hlcoord $13, 9
	ld [hli], a
	hlcoord 0, $10
	ld [hli], a
	hlcoord 1, $11
	ld [hli], a

	hlcoord 0, 8
	ld [hli], a
	ld a, $76
	ld [hli], a
	ld a, $7c
	ld [hli], a
	ld [hli], a
	
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	
	hlcoord 16, 8
	ld a, $7c
	ld [hli], a
	ld [hli], a
	ld a, $7b
	ld [hli], a
	ld a, TRAINERCARD_BORDERGFX_START
	ld [hli], a
	ret

TrainerCard_PrintMedian1:
	hlcoord 3, 8
	ld a, $23
	ld [hli], a
	inc a ; $24
	ld [hli], a
	inc a ; $25
	ld [hli], a
	inc a ; $26
	ld [hli], a
	inc a ; $27
	ld [hli], a
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	ret
	
TrainerCard_PrintMedian2:
	hlcoord 3, 8
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	ld a, $28
	ld [hli], a
	inc a ; $29
	ld [hli], a
	inc a ; $2a
	ld [hli], a
	inc a ; $2b
	ld [hli], a
	inc a ; $2c
	ld [hli], a
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	ret
	
TrainerCard_PrintMedian3:
	hlcoord 7, 8
	ld a, $32
	ld [hli], a
	inc a ; $33
	ld [hli], a
	ld [hli], a
	inc a ; $34
	ld [hli], a
	ld a, $2d
	ld [hli], a
	inc a ; $2e
	ld [hli], a
	inc a ; $2f
	ld [hli], a
	inc a ; $30
	ld [hli], a
	inc a ; $31
	ld [hli], a
	ret

TrainerCard_PrintTopHalfOfCard: ; 25299 (9:5299)
	ld hl, DefaultTrendyPhrase
	ld de, wTrendyPhrase
	ld c, PLAYER_NAME_LENGTH
	call StringCmp
	jr z, .defaultphrase

	hlcoord 1, 2
	ld de, .Top_Headings
	call PlaceString
	jr .cont
	
.defaultphrase
	hlcoord 1, 2
	ld de, .Top_Headings_Default
	call PlaceString

.cont
	hlcoord 7, 2
	ld de, wPlayerName
	call PlaceString

	hlcoord 5, 3
	ld de, wPlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum

	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ld [hGraphicStartTile], a
	predef PlaceGraphic
	
	hlcoord 18, 1
	ld a, $36
	ld [hli], a
	
	hlcoord 1, 7
	ld a, $35
	ld [hli], a
	ret

; 252ec (9:52ec)

.Top_Headings_Default: ; 252ec
	db " NAME/<LNBRK>"
	db " <ID>№.<LNBRK>"
	db "└└└└└└└└└└└└┘<LNBRK>"
	db "<LNBRK>"
	db " PRESS SELECT!"
	db "<LNBRK>@"

.Top_Headings: ; 252ec
	db " NAME/<LNBRK>"
	db " <ID>№.<LNBRK>"
	db "└└└└└└└└└└└└┘<LNBRK>"
	db "<LNBRK>"
	db "┌─:<TRENDY>"
	db "<LNBRK>@"

TrainerCardSetup_ClearBottomHalf:
	hlcoord 1, 10
	lb bc, 7, 17
	call ClearBox
	
	hlcoord 1, 16
	ld a, $35
	ld [hli], a
	
	hlcoord 2, 16
	lb bc, 1, 17
	jp ClearBox

TrainerCard_Page1_PrintMoney:
	call CombinePocketAndBank
	
	hlcoord 1, $10
	ld a, $35
	ld [hli], a

	hlcoord 2, 10
	ld de, .Money
	call PlaceString

	hlcoord $0a, $0a
.print_money
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	call PrintNum

	hlcoord $0a, $0c
.print_money2
	ld de, wMomsMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	call PrintNum
	
	hlcoord $0a, $0e
.print_money3
	ld de, wTotalMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	jp PrintNum
	
.Money:
	db   "POCKET"
	next "BANK"
	next "TOTAL"
	next "                ▶@"
	
CombinePocketAndBank:
	ld hl, wMoney+2
	ld de, wMomsMoney+2
	ld bc, wTotalMoney+2

	ld a, [de]
	add [hl]
	ld [bc], a
	dec de
	dec hl
	dec bc

	ld a, [de]
	adc [hl]
	ld [bc], a
	dec de
	dec hl
	dec bc

	ld a, [de]
	adc [hl]
	ld [bc], a
	ret
	
TrainerCard_Page2_PrintDexCaught_GameTime: ; 2530a (9:530a)
	hlcoord 1, $10
	ld a, $35
	ld [hli], a

	hlcoord 2, 10
	ld de, .Dex_PlayTime_BP
	call PlaceString

	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld de, wd265
	hlcoord 15, 10
	lb bc, 1, 3
	call PrintNum

	ld de, wBattlePoints
	hlcoord 15, 14
	lb bc, 1, 3
	call PrintNum

	call TrainerCard_Page2_PrintGameTime

	ld a, [wStatusFlags] ; pokedex
	bit 0, a
	jr nz, .have_pokedex
	hlcoord 2, 10
	lb bc, 1, 16
	call ClearBox
.have_pokedex
	ld a, [wBattlePoints]
	and a
	jr nz, .have_bp
	hlcoord 2, 14
	lb bc, 1, 16
	call ClearBox
.have_bp

; trainer stars
	ld c, VAR_TRAINER_STARS
	farcall _GetVarAction
	ld a, [wStringBuffer2]
	hlcoord 2, 16
.star_loop
	dec a
	cp -1
	ret z
	ld [hl], $28
	inc hl
	jr .star_loop

.Dex_PlayTime_BP:
	db   "#DEX"
	next "PLAY TIME"
	next "BATTLE PTS."
	next "◀               ▶@"

TrainerCard_Page2_PrintGameTime: ; 25415 (9:5415)
	hlcoord 11, 12
	ld de, wGameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [hVBlankCounter]
	and $1f
	ret nz
	hlcoord 15, 12
	ld a, [hl]
	cp ":"
	jr z, .space
	ld a, ":"
	jr .ok
.space
	ld a, " "
.ok
	ld [hl], a
	ret

TrainerCard_Page3_3_InitObjectsAndStrings: ; 2536c (9:536c)
	hlcoord 2, 16
	ld de, .Status
	call PlaceString

	hlcoord 1, $10
	ld a, $35
	ld [hli], a

	hlcoord 2, 10
	ld a, $35
	ld c, 4
.loop
	call TrainerCard_Page3_3_PlaceLeadersFaces
rept 4
	inc hl
endr
	dec c
	jr nz, .loop

	hlcoord 2, 13
	ld a, $57
	ld c, 4
.loop2
	call TrainerCard_Page3_3_PlaceLeadersFaces
rept 4
	inc hl
endr
	dec c
	jr nz, .loop2

	xor a
	ld [wcf64], a
	ld hl, TrainerCard_OnwaBadgesOAM ;kanto
	jp TrainerCard_Page3_3_OAMUpdate

.Status:
	db "◀                @"
	
TrainerCard_Page3_3_PlaceLeadersFaces: ; 253f4 (9:53f4)
	hlcoord 2, 10
	ld de, .Numbers1Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 13
	ld de, .Numbers2Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 11
	ld de, .Faces1Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 12
	ld de, .Faces2Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 14
	ld de, .Faces1Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 2, 15
	ld de, .Faces2Tilemap
	call TrainerCardSetup_PlaceTilemapString
	
	eventflagcheck EVENT_MET_LEADER8
	jp nz, .leader8
.return_1
	eventflagcheck EVENT_MET_LEADER7
	jp nz, .leader7
.return_2
	eventflagcheck EVENT_MET_LEADER6
	jp nz, .leader6
.return_3
	eventflagcheck EVENT_MET_LEADER5
	jp nz, .leader5
.return_4
	eventflagcheck EVENT_MET_CHARLIE
	jp nz, .charlie
.return_5
	eventflagcheck EVENT_MET_WENDY
	jp nz, .wendy
.return_6
	eventflagcheck EVENT_MET_RODNEY
	jp nz, .rodney
.return_7
	eventflagcheck EVENT_MET_STANLEY
	jp nz, .stanley
	ret
	
.leader8
	hlcoord $f, $e
	ld de, .Leader81Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord $f, $f
	ld de, .Leader82Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_1
	
.leader7
	hlcoord $b, $e
	ld de, .Leader71Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord $b, $f
	ld de, .Leader72Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_2
	
.leader6
	hlcoord 7, $e
	ld de, .Leader61Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 7, $f
	ld de, .Leader62Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_3
	
.leader5
	hlcoord 3, $e
	ld de, .Leader51Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 3, $f
	ld de, .Leader52Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_4
	
.charlie
	hlcoord $f, $b
	ld de, .Leader41Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord $f, $c
	ld de, .Leader42Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_5
	
.wendy
	hlcoord $b, $b
	ld de, .Leader31Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord $b, $c
	ld de, .Leader32Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_6
	
.rodney
	hlcoord 7, $b
	ld de, .Rodney1Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 7, $c
	ld de, .Rodney2Tilemap
	call TrainerCardSetup_PlaceTilemapString
	jp .return_7
	
.stanley
	hlcoord 3, $b
	ld de, .Stanley1Tilemap
	call TrainerCardSetup_PlaceTilemapString
	hlcoord 3, $c
	ld de, .Stanley2Tilemap
	call TrainerCardSetup_PlaceTilemapString
	ret

.Numbers1Tilemap:
	db $37, $7f, $7f, $7f, $3e, $7f, $7f, $7f, $45, $7f, $7f, $7f, $4c, $7f, $7f, $7f, $ff
	
.Numbers2Tilemap:
	db $53, $7f, $7f, $7f, $5a, $7f, $7f, $7f, $61, $7f, $7f, $7f, $68, $7f, $7f, $7f, $ff
	
.Faces1Tilemap:
	db $7f, $6f, $70, $71, $7f, $6f, $70, $71, $7f, $6f, $70, $71, $7f, $6f, $70, $71, $ff
	
.Faces2Tilemap:
	db $7f, $72, $73, $74, $7f, $72, $73, $74, $7f, $72, $73, $74, $7f, $72, $73, $74, $ff
	
.Stanley1Tilemap:
	db $38, $39, $3a, $ff
	
.Stanley2Tilemap:
	db $3b, $3c, $3d, $ff
	
.Rodney1Tilemap:
	db $3f, $40, $41, $ff
	
.Rodney2Tilemap:
	db $42, $43, $44, $ff
	
.Leader31Tilemap:
	db $46, $47, $48, $ff
	
.Leader32Tilemap:
	db $49, $4a, $4b, $ff
	
.Leader41Tilemap:
	db $4d, $4e, $4f, $ff
	
.Leader42Tilemap:
	db $50, $51, $52, $ff
	
.Leader51Tilemap:
	db $54, $55, $56, $ff
	
.Leader52Tilemap:
	db $57, $58, $59, $ff
	
.Leader61Tilemap:
	db $5b, $5c, $5d, $ff
	
.Leader62Tilemap:
	db $5e, $5f, $60, $ff
	
.Leader71Tilemap:
	db $62, $63, $64, $ff
	
.Leader72Tilemap:
	db $65, $66, $67, $ff
	
.Leader81Tilemap:
	db $69, $6a, $6b, $ff
	
.Leader82Tilemap:
	db $6c, $6d, $6e, $ff

TrainerCard_Page3_3_AnimateBadges: ; 25438 (9:5438)
	ld a, [hVBlankCounter]
	and $7
	ret nz
	ld a, [wcf64]
	inc a
	and $7
	ld [wcf64], a
TrainerCard_Page3_3_OAMUpdate: ; 25448 (9:5448)
; copy flag array pointer
	ld a, [hli]
	ld e, a
	ld a, [hli]
; get flag array
	ld d, a
	ld a, [de]
	ld c, a
	ld de, wSprites
	ld b, 8
.loop
	srl c
	push bc
	jr nc, .skip_badge
	push hl
	ld a, [hli] ; y
	ld b, a
	ld a, [hli] ; x
	ld c, a
	ld a, h
	ld [wTrainerCardBadgePaletteAddr], a
	ld a, l
	ld [wTrainerCardBadgePaletteAddr + 1], a
rept 4
	inc hl
endr
	ld a, [wcf64]
	add l
	ld l, a
	ld a, 0 ; not xor a; preserve carry flag?
	adc h
	ld h, a
	ld a, [hl]
	ld [wcf65], a
	call .PrepOAM
	pop hl
.skip_badge
	ld bc, $e ; 6 + 2 * 4
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

.PrepOAM: ; 2547b (9:547b)
	ld a, [wcf65]
	and $80
	jr nz, .xflip
	ld hl, .facing1
	jr .loop2

.xflip
	ld hl, .facing2
.loop2
	ld a, [hli]
	cp $ff
	ret z
	add b
	ld [de], a
	inc de

	ld a, [hli]
	add c
	ld [de], a
	inc de

	ld a, [wcf65]
	and $7f
	add [hl]
	ld [de], a
	inc hl
	inc de
	push hl
	push bc
	ld a, [wTrainerCardBadgePaletteAddr]
	ld h, a
	ld a, [wTrainerCardBadgePaletteAddr + 1]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, h
	ld [wTrainerCardBadgePaletteAddr], a
	ld a, l
	ld [wTrainerCardBadgePaletteAddr + 1], a
	ld a, b
	pop bc
	pop hl
	add [hl]
	ld [de], a
	inc hl
	inc de
	jr .loop2

; 254a7 (9:54a7)

.facing1 ; 254a7
	; y, x, tile, OAM attributes
	db 0, 0, 0, 0
	db 0, 8, 1, 0
	db 8, 0, 2, 0
	db 8, 8, 3, 0
	db -1

.facing2 ; 254b8
	db 0, 0, 1, X_FLIP
	db 0, 8, 0, X_FLIP
	db 8, 0, 3, X_FLIP
	db 8, 8, 2, X_FLIP
	db -1

TrainerCardSetup_PlaceTilemapString: ; 253a8 (9:53a8)
.loop
	ld a, [de]
	cp $ff
	ret z
	ld [hli], a
	inc de
	jr .loop
	
TrainerCard_OnwaBadgesOAM: ; 254c9
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette1, palette2, palette3, palette4
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw wOnwaBadges

	; Zephyr Badge
	db $68, $18, 0, 0, 0, 0
	db $00, $20, $24, $20 | $80
	db $00, $20, $24, $20 | $80

	; Hive Badge
	db $68, $38, 1, 1, 1, 1
	db $04, $20, $24, $20 | $80
	db $04, $20, $24, $20 | $80

	; Plain Badge
	db $68, $58, 2, 2, 2, 2
	db $08, $20, $24, $20 | $80
	db $08, $20, $24, $20 | $80

	; Fog Badge
	db $68, $78, 3, 3, 3, 3
	db $0c, $20, $24, $20 | $80
	db $0c | $80, $20, $24, $20 | $80

	; Mineral Badge
	db $80, $38, 5, 5, 5, 5
	db $10, $20, $24, $20 | $80
	db $10, $20, $24, $20 | $80

	; Storm Badge
	db $80, $18, 4, 4, 4, 4
	db $14, $20, $24, $20 | $80
	db $14 | $80, $20, $24, $20 | $80

	; Glacier Badge
	db $80, $58, 6, 6, 6, 6
	db $18, $20, $24, $20 | $80
	db $18, $20, $24, $20 | $80

	; Rising Badge
	db $80, $78, 7, 7, 7, 7
	db $1c, $20, $24, $20 | $80
	db $1c, $20, $24, $20 | $80
; 25523

CardBorderGFX:  INCBIN "gfx/trainer_card/border.2bpp"
CardDividerGFX: INCBIN "gfx/trainer_card/divider.2bpp"
CardStatusGFX:  INCBIN "gfx/trainer_card/status.2bpp" ; must come after CardDividerGFX
CardMiscGFX:	INCBIN "gfx/trainer_card/misc.2bpp"

LeaderGFX:  INCBIN "gfx/trainer_card/johto_leaders.w40.2bpp"
LeaderGFX2: INCBIN "gfx/trainer_card/kanto_leaders.w40.2bpp"
BadgeGFX:   INCBIN "gfx/trainer_card/johto_badges.w16.2bpp"
BadgeGFX2:  INCBIN "gfx/trainer_card/kanto_badges.w16.2bpp"
