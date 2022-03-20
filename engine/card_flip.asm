CARDFLIP_LIGHT_OFF EQU $f3
CARDFLIP_LIGHT_ON  EQU $f4
CARDFLIP_DECK_SIZE EQU 4 * 6

_CardFlip: ; e00ee (38:40ee)
	ld hl, wOptions1
	set NO_TEXT_SCROLL, [hl]
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
;	ld de, MUSIC_NONE
;	call PlayMusic
	call DelayFrame
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra

	ld hl, CardFlipLZ01
	ld de, VTiles2 tile $00
	call Decompress
	ld hl, CardFlipLZ02
	ld de, VTiles2 tile $3e
	call Decompress
	ld hl, CardFlipLZ03
	ld de, VTiles0 tile $00
	call Decompress
	ld hl, CardFlipOffButtonGFX
	ld de, VTiles1 tile (CARDFLIP_LIGHT_OFF - $80)
	ld bc, 1 tiles
	rst CopyBytes
	ld hl, CardFlipOnButtonGFX
	ld de, VTiles1 tile (CARDFLIP_LIGHT_ON - $80)
	ld bc, 1 tiles
	rst CopyBytes

	call CardFlip_InitTilemap
	call CardFlip_InitAttrPals
	call EnableLCD
	call ApplyAttrAndTilemapInVBlank
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	call DelayFrame
	xor a
	ld [wJumptableIndex], a
	ld a, $2
	ld [wCardFlipCursorY], a
	ld [wCardFlipCursorX], a

;	ld de, MUSIC_NONE
;	ld a, [wMapGroup]
;	cp GROUP_GOLDENROD_GAME_CORNER
;	jr nz, .celadon_game_corner
;	ld a, [wMapNumber]
;	cp MAP_GOLDENROD_GAME_CORNER
;	jr nz, .celadon_game_corner
;	ld de, MUSIC_NONE_DPPT
;.celadon_game_corner
;	call PlayMusic

.MasterLoop:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .leavethegame
	call .CardFlip
	jr .MasterLoop
.leavethegame
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	call ClearBGPalettes
	ld hl, wOptions1
	res NO_TEXT_SCROLL, [hl]
	ret

.CardFlip: ; e0191 (38:4191)
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
; e01a0 (38:41a0)

.Jumptable: ; e01a0

	dw .AskPlayWithThree
	dw .DeductCoins
	dw .ChooseACard
	dw .PlaceYourBet
	dw .CheckTheCard
	dw .TabulateTheResult
	dw .PlayAgain
	dw .Quit
; e01b0

.Increment: ; e01b0
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e01b5

.AskPlayWithThree: ; e01b5
	ld hl, .PlayWithThreeCoinsText
	call CardFlip_UpdateCoinBalanceDisplay
	call YesNoBox
	jr c, .SaidNo
	call CardFlip_ShuffleDeck
	jr .Increment

.SaidNo:
	ld a, 7
	ld [wJumptableIndex], a
	ret
; e01cd

.PlayWithThreeCoinsText: ; 0xe01cd
	; Play with three coins?
	text_jump UnknownText_0x1c5793
	db "@"
; 0xe01d2

.DeductCoins: ; e01d2
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	ld a, h
	and a
	jr nz, .deduct ; You have at least 256 coins.
	ld a, l
	cp 3
	jr nc, .deduct ; You have at least 3 coins.
	ld hl, .NotEnoughCoinsText
	call CardFlip_UpdateCoinBalanceDisplay
	ld a, 7
	ld [wJumptableIndex], a
	ret

.deduct
	ld de, -3
	add hl, de
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	xor a
	ld [hBGMapMode], a
	call CardFlip_PrintCoinBalance
	ld a, $1
	ld [hBGMapMode], a
	call WaitSFX
	jp .Increment
; e0212

.NotEnoughCoinsText: ; 0xe0212
	; Not enough coins…
	text_jump UnknownText_0x1c57ab
	db "@"
; 0xe0217

.ChooseACard: ; e0217
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 9
	call CardFlip_FillGreenBox
	hlcoord 9, 0
	ld bc, SCREEN_WIDTH
	ld a, [wCardFlipNumCardsPlayed]
	rst AddNTimes
	ld [hl], CARDFLIP_LIGHT_ON
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	call PlaceCardFaceDown
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 6
	call PlaceCardFaceDown
	call ApplyTilemapInVBlank
	ld hl, .ChooseACardText
	call CardFlip_UpdateCoinBalanceDisplay
	xor a
	ld [wCardFlipWhichCard], a
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .next
	ld de, SFX_KINESIS
	call PlaySFX
	call PlaceOAMCardBorder
	ld c, 4
	call DelayFrames
	ld hl, wCardFlipWhichCard
	ld a, [hl]
	xor $1
	ld [hl], a
	jr .loop

.next
	ld de, SFX_SLOT_MACHINE_START
	call PlaySFX
	ld a, $3
.loop2
	push af
	call PlaceOAMCardBorder
	ld c, 4
	call DelayFrames
	call ClearSprites
	ld c, 4
	call DelayFrames
	pop af
	dec a
	jr nz, .loop2
	ld hl, wCardFlipWhichCard
	ld a, [hl]
	push af
	xor $1
	ld [hl], a
	call GetCoordsOfChosenCard
	lb bc, 6, 5
	call CardFlip_FillGreenBox
	pop af
	ld [wCardFlipWhichCard], a
	jp .Increment
; e02b2

.ChooseACardText: ; 0xe02b2
	; Choose a card.
	text_jump UnknownText_0x1c57be
	db "@"
; 0xe02b7

.PlaceYourBet: ; e02b7
	ld hl, .PlaceYourBetText
	call CardFlip_UpdateCoinBalanceDisplay
.betloop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .betdone
	call ChooseCard_HandleJoypad
	call CardFlip_UpdateCursorOAM
	call DelayFrame
	jr .betloop

.betdone
	jp .Increment
; e02d5

.PlaceYourBetText: ; 0xe02d5
	; Place your bet.
	text_jump UnknownText_0x1c57ce
	db "@"
; 0xe02da

.CheckTheCard: ; e02da
	xor a
	ld [hVBlankCounter], a
	call CardFlip_UpdateCursorOAM
	call WaitSFX
	ld de, SFX_CHOOSE_A_CARD
	call PlaySFX
	call WaitSFX
	ld a, [wCardFlipNumCardsPlayed]
	ld e, a
	ld d, 0
	ld hl, wDeck
	add hl, de
	add hl, de
	ld a, [wCardFlipWhichCard]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wCardFlipFaceUpCard], a
	ld e, a
	ld hl, wDiscardPile
	add hl, de
	ld [hl], TRUE
	call GetCoordsOfChosenCard
	call CardFlip_DisplayCardFaceUp
	call ApplyAttrAndTilemapInVBlank
	jp .Increment
; e0314

.TabulateTheResult: ; e0314
	call CardFlip_CheckWinCondition
	call WaitPressAorB_BlinkCursor
	jp .Increment
; e031e

.PlayAgain: ; e031e
	call ClearSprites
	ld hl, .PlayAgainText
	call CardFlip_UpdateCoinBalanceDisplay
	call YesNoBox
	jr nc, .Continue
	jp .Increment

.Continue:
	ld a, [wCardFlipNumCardsPlayed]
	inc a
	ld [wCardFlipNumCardsPlayed], a
	cp 12
	jr c, .KeepTheCurrentDeck
	call CardFlip_InitTilemap
	ld a, $1
	ld [hBGMapMode], a
	call CardFlip_ShuffleDeck
	ld hl, .CardsShuffledText
	call PrintText
	jr .LoopAround

.KeepTheCurrentDeck:
	call CardFlip_BlankDiscardedCardSlot

.LoopAround:
	ld a, 1
	ld [wJumptableIndex], a
	ret
; e0356

.PlayAgainText: ; 0xe0356
	; Want to play again?
	text_jump UnknownText_0x1c57df
	db "@"
; 0xe035b

.CardsShuffledText: ; 0xe035b
	; The cards have been shuffled.
	text_jump UnknownText_0x1c57f4
	db "@"
; 0xe0360

.Quit: ; e0360
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; e0366

CardFlip_ShuffleDeck: ; e0366
	ld hl, wDeck
	ld bc, CARDFLIP_DECK_SIZE
	xor a
	call ByteFill
	ld de, wDeck
	ld c, CARDFLIP_DECK_SIZE - 1
.loop
	call Random
	and $1f
	cp CARDFLIP_DECK_SIZE
	jr nc, .loop
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld [hl], c
	dec c
	jr nz, .loop
	xor a
	ld [wCardFlipNumCardsPlayed], a
	ld hl, wDiscardPile
	ld bc, CARDFLIP_DECK_SIZE
	jp ByteFill
; e0398

CollapseCursorPosition: ; e0398
	ld hl, 0
	ld bc, 6
	ld a, [wCardFlipCursorY]
	rst AddNTimes
	ld b, $0
	ld a, [wCardFlipCursorX]
	ld c, a
	add hl, bc
	ret
; e03ac

GetCoordsOfChosenCard: ; e03ac
	ld a, [wCardFlipWhichCard]
	and a
	jr nz, .BottomCard
	hlcoord 2, 0
	bcpixel 2, 3
	ret

.BottomCard:
	hlcoord 2, 6
	bcpixel 8, 3
	ret
; e03c1

PlaceCardFaceDown: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .FaceDownCardTilemap
	lb bc, 6, 5
	jp CardFlip_CopyToBox
; e03ce

.FaceDownCardTilemap: ; e03ce
	db $08, $09, $09, $09, $0a
	db $0b, $28, $2b, $28, $0c
	db $0b, $2c, $2d, $2e, $0c
	db $0b, $2f, $30, $31, $0c
	db $0b, $32, $33, $34, $0c
	db $0d, $0e, $0e, $0e, $0f

PlaceCardMoogooBorderSingle:
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 5, 4
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $08, $09, $09, $0a
	db $0b, $28, $28, $0c
	db $0b, $28, $28, $0c
	db $0b, $28, $28, $0c
	db $0d, $0e, $0e, $0f
	
PlaceCardMoogooBorderLeft:
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 5, 4
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $08, $09, $09, $21
	db $0b, $28, $28, $23
	db $0b, $28, $28, $23
	db $0b, $28, $28, $23
	db $0d, $0e, $0e, $25
	
PlaceCardMoogooBorderMiddle:
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 5, 4
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $20, $09, $09, $21
	db $22, $28, $28, $23
	db $22, $28, $28, $23
	db $22, $28, $28, $23
	db $24, $0e, $0e, $25
	
PlaceCardMoogooBorderRight:
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 5, 4
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $20, $09, $09, $0a
	db $22, $28, $28, $0c
	db $22, $28, $28, $0c
	db $22, $28, $28, $0c
	db $24, $0e, $0e, $0f
	
PlaceCardMoogooSuit:
	cp 5
	jp z, PlaceCardMoogoo5
	cp 4
	jp z, PlaceCardMoogoo4
	cp 3
	jp z, PlaceCardMoogoo3
	cp 2
	jp z, PlaceCardMoogoo2
	
PlaceCardMoogoo1: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 2, 2
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $3e, $3f
	db $40, $41
	
PlaceCardMoogoo2: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 2, 2
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $42, $43
	db $44, $45
	
PlaceCardMoogoo3: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 2, 2
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $46, $47
	db $48, $49
	
PlaceCardMoogoo4: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 2, 2
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $4a, $4b
	db $4c, $4d
	
PlaceCardMoogoo5: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .Tilemap
	lb bc, 2, 2
	jp CardFlip_CopyToBox

.Tilemap: ; e03ce
	db $3e, $3f
	db $40, $41

CardFlip_DisplayCardFaceUp: ; e03ec
	xor a
	ld [hBGMapMode], a
	push hl
	push hl
	; Flip the card face up.
	ld de, .FaceUpCardTilemap
	lb bc, 6, 5
	call CardFlip_CopyToBox

	; Get the level and species of the upturned card.
	ld a, [wCardFlipFaceUpCard]
	ld e, a
	ld d, 0
	ld hl, .Deck
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	; Place the level.
	pop hl
	ld bc, 3 + SCREEN_WIDTH
	add hl, bc
	ld [hl], e

	; Place the Pokepic.
	ld bc, SCREEN_HEIGHT
	add hl, bc
	ld a, d
	ld de, SCREEN_WIDTH
	ld b, 3
.row
	push hl
	ld c, 3
.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	dec b
	jr nz, .row
	pop hl

	; Set the attributes
	ld de, wAttrMap - wTileMap
	add hl, de
	ld a, [wCardFlipFaceUpCard]
	and 3
	inc a
	lb bc, 6, 5
	jp CardFlip_FillBox
; e043b

.FaceUpCardTilemap: ; e043b
	db $18, $19, $19, $19, $1a
	db $1b, $35, $7f, $7f, $1c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $1d, $1e, $1e, $1e, $1f
; e0459

.Deck: ; e0459
	; level, pic anchor (3x3)
	db "1",$4e, "1",$57, "1",$69, "1",$60
	db "2",$4e, "2",$57, "2",$69, "2",$60
	db "3",$4e, "3",$57, "3",$69, "3",$60
	db "4",$4e, "4",$57, "4",$69, "4",$60
	db "5",$4e, "5",$57, "5",$69, "5",$60
	db "6",$4e, "6",$57, "6",$69, "6",$60
; e0489

CardFlip_UpdateCoinBalanceDisplay: ; e0489
	push hl
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	pop hl
	call PrintTextBoxText
	; fallthrough
; e049c

CardFlip_PrintCoinBalance: ; e049c
	hlcoord 8, 15
	lb bc, 1, 10
	call TextBox
	hlcoord 9, 16
	ld de, .CoinStr
	call PlaceString
	hlcoord 14, 16
	ld de, wCoins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	jp PrintNum
; e04bc

.CoinStr:
	db "COIN@"
; e04c1

CardFlip_InitTilemap: ; e04c1 (38:44c1)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $07
	call ByteFill
	hlcoord 9, 0
	ld de, CardFlipTilemap
	lb bc, 12, 11
	call CardFlip_CopyToBox
	hlcoord 0, 12
	lb bc, 4, 18
	jp TextBox
; e04e5 (38:44e5)

MoogooMankey_InitTilemap:
	xor a
	ld [hBGMapMode], a
	ld hl, MoogooMankeyTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
CardFlip_FillGreenBox: ; e04e5
	ld a, $07

CardFlip_FillBox: ; e04e7 (38:44e7)
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

CardFlip_CopyToBox: ; e04f7 (38:44f7)
.row
	push bc
	push hl
.col
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; e0509 (38:4509)

CardFlip_CopyOAM: ; e0509
	ld de, wSprites
	ld a, [hli]
.loop
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .loop
	ret
; e0521

CardFlip_BlankDiscardedCardSlot: ; e0534
	xor a
	ld [hBGMapMode], a
	ld a, [wCardFlipFaceUpCard]
	ld e, a
	ld d, 0

	and 3 ; get mon
	ld c, a
	ld b, 0

	ld a, e
	and $1c ; get level
	srl a
	add .Jumptable % $100
	ld l, a
	ld a, 0 ; not xor a; preserve carry flag?
	adc .Jumptable / $100
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e0553

.Jumptable: ; e0553

	dw .Level1
	dw .Level2
	dw .Level3
	dw .Level4
	dw .Level5
	dw .Level6
; e055f

.Level1: ; e055f
	ld hl, wDiscardPile + 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded2
	hlcoord 13, 3
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $37
	ret

.discarded2
	hlcoord 13, 3
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e0583

.Level2: ; e0583
	ld hl, wDiscardPile - 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded1
	hlcoord 13, 4
	add hl, bc
	add hl, bc
	ld [hl], $3b
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.discarded1
	hlcoord 13, 4
	add hl, bc
	add hl, bc
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e05a7

.Level3: ; e05a7
	ld hl, wDiscardPile + 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded4
	hlcoord 13, 6
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $38
	ret

.discarded4
	hlcoord 13, 6
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e05cb

.Level4: ; e05cb
	ld hl, wDiscardPile - 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded3
	hlcoord 13, 7
	add hl, bc
	add hl, bc
	ld [hl], $3c
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.discarded3
	hlcoord 13, 7
	add hl, bc
	add hl, bc
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e05ef

.Level5: ; e05ef
	ld hl, wDiscardPile + 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded6
	hlcoord 13, 9
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $39
	ret

.discarded6
	hlcoord 13, 9
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e0613

.Level6: ; e0613
	ld hl, wDiscardPile - 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded5
	hlcoord 13, 10
	add hl, bc
	add hl, bc
	ld [hl], $3c
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.discarded5
	hlcoord 13, 10
	add hl, bc
	add hl, bc
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e0637

CardFlip_CheckWinCondition: ; e0637
	call CollapseCursorPosition
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e0643

.Jumptable: ; e0643

	dw .Impossible
	dw .Impossible
	dw .PikaJiggly
	dw .PikaJiggly
	dw .PoliOddish
	dw .PoliOddish

	dw .Impossible
	dw .Impossible
	dw .Pikachu
	dw .Jigglypuff
	dw .Poliwag
	dw .Oddish

	dw .OneTwo
	dw .One
	dw .PikaOne
	dw .JigglyOne
	dw .PoliOne
	dw .OddOne

	dw .OneTwo
	dw .Two
	dw .PikaTwo
	dw .JigglyTwo
	dw .PoliTwo
	dw .OddTwo

	dw .ThreeFour
	dw .Three
	dw .PikaThree
	dw .JigglyThree
	dw .PoliThree
	dw .OddThree

	dw .ThreeFour
	dw .Four
	dw .PikaFour
	dw .JigglyFour
	dw .PoliFour
	dw .OddFour

	dw .FiveSix
	dw .Five
	dw .PikaFive
	dw .JigglyFive
	dw .PoliFive
	dw .OddFive

	dw .FiveSix
	dw .Six
	dw .PikaSix
	dw .JigglySix
	dw .PoliSix
	dw .OddSix
; e06a3

.Impossible: ; e06a3
	jp .Lose
; e06a6

.PikaJiggly: ; e06a6
	ld a, [wCardFlipFaceUpCard]
	and $2
	jp nz, .Lose
	jr .WinSix

.PoliOddish: ; e06b0
	ld a, [wCardFlipFaceUpCard]
	and $2
	jr nz, .WinSix
	jp .Lose

.WinSix: ; e06ba
	ld c, $6
	ld de, SFX_2ND_PLACE
	jp .Payout
; e06c2

.OneTwo: ; e06c2
	ld a, [wCardFlipFaceUpCard]
	and $18
	jr z, .WinNine
	jp .Lose

.ThreeFour: ; e06cc
	ld a, [wCardFlipFaceUpCard]
	and $18
	cp $8
	jr z, .WinNine
	jp .Lose

.FiveSix: ; e06d8
	ld a, [wCardFlipFaceUpCard]
	and $18
	cp $10
	jr z, .WinNine
	jp .Lose

.WinNine: ; e06e4
	ld c, $9
	ld de, SFX_2ND_PLACE
	jp .Payout
; e06ec

.Pikachu: ; e06ec
	ld a, [wCardFlipFaceUpCard]
	and $3
	jr z, .WinTwelve
	jp .Lose

.Jigglypuff: ; e06f6
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $1
	jr z, .WinTwelve
	jp .Lose

.Poliwag: ; e0702
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $2
	jr z, .WinTwelve
	jp .Lose

.Oddish: ; e070e
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $3
	jr z, .WinTwelve
	jp .Lose

.WinTwelve: ; e071a
	ld c, $c
	ld de, SFX_2ND_PLACE
	jp .Payout
; e0722

.One: ; e0722
	ld a, [wCardFlipFaceUpCard]
	and $1c
	jr z, .WinEighteen
	jp .Lose

.Two: ; e072c
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $4
	jr z, .WinEighteen
	jp .Lose

.Three: ; e0738
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $8
	jr z, .WinEighteen
	jp .Lose

.Four: ; e0744
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $c
	jr z, .WinEighteen
	jp .Lose

.Five: ; e0750
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $10
	jr z, .WinEighteen
	jp .Lose

.Six: ; e075c
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $14
	jr z, .WinEighteen
	jp .Lose

.WinEighteen: ; e0768
	ld c, $12
	ld de, SFX_2ND_PLACE
	jp .Payout
; e0770


.PikaOne: ; e0770
	ld e, $0
	jr .CheckWin72

.JigglyOne: ; e0774
	ld e, $1
	jr .CheckWin72

.PoliOne: ; e0778
	ld e, $2
	jr .CheckWin72

.OddOne: ; e077c
	ld e, $3
	jr .CheckWin72

.PikaTwo: ; e0780
	ld e, $4
	jr .CheckWin72

.JigglyTwo: ; e0784
	ld e, $5
	jr .CheckWin72

.PoliTwo: ; e0788
	ld e, $6
	jr .CheckWin72

.OddTwo: ; e078c
	ld e, $7
	jr .CheckWin72

.PikaThree: ; e0790
	ld e, $8
	jr .CheckWin72

.JigglyThree: ; e0794
	ld e, $9
	jr .CheckWin72

.PoliThree: ; e0798
	ld e, $a
	jr .CheckWin72

.OddThree: ; e079c
	ld e, $b
	jr .CheckWin72

.PikaFour: ; e07a0
	ld e, $c
	jr .CheckWin72

.JigglyFour: ; e07a4
	ld e, $d
	jr .CheckWin72

.PoliFour: ; e07a8
	ld e, $e
	jr .CheckWin72

.OddFour: ; e07ac
	ld e, $f
	jr .CheckWin72

.PikaFive: ; e07b0
	ld e, $10
	jr .CheckWin72

.JigglyFive: ; e07b4
	ld e, $11
	jr .CheckWin72

.PoliFive: ; e07b8
	ld e, $12
	jr .CheckWin72

.OddFive: ; e07bc
	ld e, $13
	jr .CheckWin72

.PikaSix: ; e07c0
	ld e, $14
	jr .CheckWin72

.JigglySix: ; e07c4
	ld e, $15
	jr .CheckWin72

.PoliSix: ; e07c8
	ld e, $16
	jr .CheckWin72

.OddSix: ; e07cc
	ld e, $17

.CheckWin72: ; e07ce
	ld a, [wCardFlipFaceUpCard]
	cp e
	jr nz, .Lose
	ld c, 72
	ld de, SFX_2ND_PLACE
	jr .Payout

.Lose: ; e07db
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, .Text_Darn
	call CardFlip_UpdateCoinBalanceDisplay
	jp WaitSFX

.Payout: ; e07eb
	push bc
	push de
	ld hl, .Text_Yeah
	call CardFlip_UpdateCoinBalanceDisplay
	pop de
	call PlaySFX
	call WaitSFX
	pop bc
.loop
	push bc
	call .IsCoinCaseFull
	jr c, .full
	call .AddCoinPlaySFX

.full
	call CardFlip_PrintCoinBalance
	ld c, 2
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	ret
; e0811

.Text_Yeah: ; 0xe0811
	; Yeah!
	text_jump UnknownText_0x1c5813
	db "@"
; 0xe0816

.Text_Darn: ; 0xe0816
	; Darn…
	text_jump UnknownText_0x1c581a
	db "@"
; 0xe081b

.AddCoinPlaySFX: ; e081b
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	inc hl
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_PAY_DAY
	jp PlaySFX
; e0833

.IsCoinCaseFull: ; e0833
	ld a, [wCoins]
	cp 50000 / $100
	jr c, .less
	jr z, .check_low
	jr .more

.check_low
	ld a, [wCoins + 1]
	cp 50000 % $100
	jr c, .less

.more
	scf
	ret

.less
	and a
	ret
; e0849

PlaceOAMCardBorder: ; e0849
	call GetCoordsOfChosenCard
	ld hl, .SpriteData
	jp CardFlip_CopyOAM
; e0853

.SpriteData: ; e0853
	db 18
	dsprite 0, 0, 0, 0, $04, $0
	dsprite 0, 0, 1, 0, $06, $0
	dsprite 0, 0, 2, 0, $06, $0
	dsprite 0, 0, 3, 0, $06, $0
	dsprite 0, 0, 4, 0, $04, $0 | X_FLIP

	dsprite 1, 0, 0, 0, $05, $0
	dsprite 1, 0, 4, 0, $05, $0 | X_FLIP

	dsprite 2, 0, 0, 0, $05, $0
	dsprite 2, 0, 4, 0, $05, $0 | X_FLIP

	dsprite 3, 0, 0, 0, $05, $0
	dsprite 3, 0, 4, 0, $05, $0 | X_FLIP

	dsprite 4, 0, 0, 0, $05, $0
	dsprite 4, 0, 4, 0, $05, $0 | X_FLIP

	dsprite 5, 0, 0, 0, $04, $0 | Y_FLIP
	dsprite 5, 0, 1, 0, $06, $0 | Y_FLIP
	dsprite 5, 0, 2, 0, $06, $0 | Y_FLIP
	dsprite 5, 0, 3, 0, $06, $0 | Y_FLIP
	dsprite 5, 0, 4, 0, $04, $0 | X_FLIP | Y_FLIP
; e089c

ChooseCard_HandleJoypad: ; e089c
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jp nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jp nz, .d_right
	ld a, [hl]
	and D_UP
	jp nz, .d_up
	ld a, [hl]
	and D_DOWN
	jp nz, .d_down
	ret
; e08b8

.d_left ; e08b8
	ld hl, wCardFlipCursorX
	ld a, [wCardFlipCursorY]
	and a
	jr z, .mon_pair_left
	cp $1
	jr z, .mon_group_left
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jp .play_sound

.mon_group_left
	ld a, [hl]
	cp $3
	jr c, .left_to_number_gp
	dec [hl]
	jp .play_sound

.mon_pair_left
	ld a, [hl]
	and $e
	ld [hl], a
	cp $3
	jr c, .left_to_number_gp
	dec [hl]
	dec [hl]
	jp .play_sound

.left_to_number_gp
	ld a, $2
	ld [wCardFlipCursorY], a
	ld a, $1
	ld [wCardFlipCursorX], a
	jp .play_sound
; e08ef

.d_right ; e08ef
	ld hl, wCardFlipCursorX
	ld a, [wCardFlipCursorY]
	and a
	jr z, .mon_pair_right
	ld a, [hl]
	cp $5
	ret nc
	inc [hl]
	jr .play_sound

.mon_pair_right
	ld a, [hl]
	and $e
	ld [hl], a
	cp $4
	ret nc
	inc [hl]
	inc [hl]
	jr .play_sound

.d_up ; e090a
	ld hl, wCardFlipCursorY
	ld a, [wCardFlipCursorX]
	and a
	jr z, .num_pair_up
	cp $1
	jr z, .num_gp_up
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .play_sound

.num_gp_up
	ld a, [hl]
	cp $3
	jr c, .up_to_mon_group
	dec [hl]
	jr .play_sound

.num_pair_up
	ld a, [hl]
	and $e
	ld [hl], a
	cp $3
	jr c, .up_to_mon_group
	dec [hl]
	dec [hl]
	jr .play_sound

.up_to_mon_group
	ld a, $1
	ld [wCardFlipCursorY], a
	ld a, $2
	ld [wCardFlipCursorX], a
	jr .play_sound

.d_down ; e093d
	ld hl, wCardFlipCursorY
	ld a, [wCardFlipCursorX]
	and a
	jr z, .num_pair_down
	ld hl, wCardFlipCursorY
	ld a, [hl]
	cp $7
	ret nc
	inc [hl]
	jr .play_sound

.num_pair_down
	ld a, [hl]
	and $e
	ld [hl], a
	cp $6
	ret nc
	inc [hl]
	inc [hl]

.play_sound ; e0959
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	jp PlaySFX
; e0960

CardFlip_UpdateCursorOAM: ; e0960
	call ClearSprites
	call CollapseCursorPosition
	add hl, hl
	add hl, hl
	ld de, .OAMData
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp CardFlip_CopyOAM
; e0981

.OAMData: ; e0981
cardflip_cursor: MACRO
if _NARG >= 5
	dbpixel \1, \2, \3, \4
	dw \5
else
	dbpixel \1, \2
	dw \3
endc
endm


	cardflip_cursor 11,  2,       .Impossible
	cardflip_cursor 12,  2,       .Impossible
	cardflip_cursor 13,  2,       .PokeGroupPair
	cardflip_cursor 13,  2,       .PokeGroupPair
	cardflip_cursor 17,  2,       .PokeGroupPair
	cardflip_cursor 17,  2,       .PokeGroupPair

	cardflip_cursor 11,  3,       .Impossible
	cardflip_cursor 12,  3,       .Impossible
	cardflip_cursor 13,  3,       .PokeGroup
	cardflip_cursor 15,  3,       .PokeGroup
	cardflip_cursor 17,  3,       .PokeGroup
	cardflip_cursor 19,  3,       .PokeGroup

	cardflip_cursor 11,  5,       .NumGroupPair
	cardflip_cursor 12,  5,       .NumGroup
	cardflip_cursor 13,  5,       .SingleTile
	cardflip_cursor 15,  5,       .SingleTile
	cardflip_cursor 17,  5,       .SingleTile
	cardflip_cursor 19,  5,       .SingleTile

	cardflip_cursor 11,  5,       .NumGroupPair
	cardflip_cursor 12,  6, 0, 4, .NumGroup
	cardflip_cursor 13,  6, 0, 4, .SingleTile
	cardflip_cursor 15,  6, 0, 4, .SingleTile
	cardflip_cursor 17,  6, 0, 4, .SingleTile
	cardflip_cursor 19,  6, 0, 4, .SingleTile

	cardflip_cursor 11,  8,       .NumGroupPair
	cardflip_cursor 12,  8,       .NumGroup
	cardflip_cursor 13,  8,       .SingleTile
	cardflip_cursor 15,  8,       .SingleTile
	cardflip_cursor 17,  8,       .SingleTile
	cardflip_cursor 19,  8,       .SingleTile

	cardflip_cursor 11,  8,       .NumGroupPair
	cardflip_cursor 12,  9, 0, 4, .NumGroup
	cardflip_cursor 13,  9, 0, 4, .SingleTile
	cardflip_cursor 15,  9, 0, 4, .SingleTile
	cardflip_cursor 17,  9, 0, 4, .SingleTile
	cardflip_cursor 19,  9, 0, 4, .SingleTile

	cardflip_cursor 11, 11,       .NumGroupPair
	cardflip_cursor 12, 11,       .NumGroup
	cardflip_cursor 13, 11,       .SingleTile
	cardflip_cursor 15, 11,       .SingleTile
	cardflip_cursor 17, 11,       .SingleTile
	cardflip_cursor 19, 11,       .SingleTile

	cardflip_cursor 11, 11,       .NumGroupPair
	cardflip_cursor 12, 12, 0, 4, .NumGroup
	cardflip_cursor 13, 12, 0, 4, .SingleTile
	cardflip_cursor 15, 12, 0, 4, .SingleTile
	cardflip_cursor 17, 12, 0, 4, .SingleTile
	cardflip_cursor 19, 12, 0, 4, .SingleTile
; e0a41

.SingleTile: ; e0a41
	db 6
	dsprite   0, 0,  -1, 7, $00, $0 | BEHIND_BG
	dsprite   0, 0,   0, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   0, 5,  -1, 7, $00, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   0, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   1, 0, $03, $0 | BEHIND_BG

.PokeGroup: ; e0a5a
	db 26
	dsprite   0, 0,  -1, 7, $00, $0 | BEHIND_BG
	dsprite   0, 0,   0, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   1, 0, $00, $0 | X_FLIP | BEHIND_BG
	dsprite   1, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   1, 0,   1, 0, $01, $0 | X_FLIP | BEHIND_BG
	dsprite   2, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   2, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   3, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   3, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   4, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   4, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   5, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   5, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   6, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   6, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   7, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   7, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   8, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   8, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   9, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   9, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite  10, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite  10, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite  10, 1,  -1, 7, $00, $0 | Y_FLIP | BEHIND_BG
	dsprite  10, 1,   0, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite  10, 1,   1, 0, $03, $0 | BEHIND_BG

.NumGroup: ; e0ac3
	db 20
	dsprite   0, 0,  -1, 7, $00, $0 | BEHIND_BG
	dsprite   0, 0,   0, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   1, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   2, 0, $03, $0 | BEHIND_BG
	dsprite   0, 0,   3, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   4, 0, $03, $0 | BEHIND_BG
	dsprite   0, 0,   5, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   6, 0, $03, $0 | BEHIND_BG
	dsprite   0, 0,   7, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   8, 0, $03, $0 | BEHIND_BG
	dsprite   0, 5,  -1, 7, $00, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   0, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   1, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   2, 0, $03, $0 | BEHIND_BG
	dsprite   0, 5,   3, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   4, 0, $03, $0 | BEHIND_BG
	dsprite   0, 5,   5, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   6, 0, $03, $0 | BEHIND_BG
	dsprite   0, 5,   7, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   0, 5,   8, 0, $03, $0 | BEHIND_BG

.NumGroupPair: ; e0b14
	db 30
	dsprite   0, 0,   0, 0, $00, $0 | BEHIND_BG
	dsprite   0, 0,   1, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   2, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   0, 0,   4, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   5, 0, $03, $0 | BEHIND_BG
	dsprite   0, 0,   6, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   7, 0, $03, $0 | BEHIND_BG
	dsprite   0, 0,   8, 0, $02, $0 | BEHIND_BG
	dsprite   0, 0,   9, 0, $03, $0 | BEHIND_BG
	dsprite   1, 0,   0, 0, $01, $0 | BEHIND_BG
	dsprite   1, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   1, 0,   5, 0, $03, $0 | BEHIND_BG
	dsprite   1, 0,   7, 0, $03, $0 | BEHIND_BG
	dsprite   1, 0,   9, 0, $03, $0 | BEHIND_BG
	dsprite   2, 0,   0, 0, $01, $0 | BEHIND_BG
	dsprite   2, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   2, 0,   5, 0, $03, $0 | BEHIND_BG
	dsprite   2, 0,   7, 0, $03, $0 | BEHIND_BG
	dsprite   2, 0,   9, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   0, 0, $00, $0 | Y_FLIP | BEHIND_BG
	dsprite   2, 1,   1, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   2, 1,   2, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite   2, 1,   3, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   4, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   5, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   6, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   7, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   8, 0, $03, $0 | BEHIND_BG
	dsprite   2, 1,   9, 0, $03, $0 | BEHIND_BG

.PokeGroupPair: ; e0b8d
	db 38
	dsprite   0, 0,  -1, 7, $00, $0 | BEHIND_BG
	dsprite   0, 0,   3, 0, $00, $0 | X_FLIP | BEHIND_BG
	dsprite   1, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   1, 0,   3, 0, $01, $0 | X_FLIP | BEHIND_BG
	dsprite   2, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   2, 0,   3, 0, $01, $0 | X_FLIP | BEHIND_BG
	dsprite   3, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   3, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   3, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   4, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   4, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   4, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   5, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   5, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   5, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   6, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   6, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   6, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   7, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   7, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   7, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   8, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   8, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   8, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite   9, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite   9, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite   9, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite  10, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite  10, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite  10, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite  11, 0,  -1, 7, $01, $0 | BEHIND_BG
	dsprite  11, 0,   1, 0, $03, $0 | BEHIND_BG
	dsprite  11, 0,   3, 0, $03, $0 | BEHIND_BG
	dsprite  11, 1,  -1, 7, $00, $0 | Y_FLIP | BEHIND_BG
	dsprite  11, 1,   0, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite  11, 1,   1, 0, $03, $0 | Y_FLIP | BEHIND_BG
	dsprite  11, 1,   2, 0, $02, $0 | Y_FLIP | BEHIND_BG
	dsprite  11, 1,   3, 0, $03, $0 | X_FLIP | Y_FLIP | BEHIND_BG

.Impossible: ; e0c26
	db 4
	dsprite   0, 0,   0, 0, $00, $0 | BEHIND_BG
	dsprite   0, 0,   1, 0, $00, $0 | X_FLIP | BEHIND_BG
	dsprite   1, 0,   0, 0, $00, $0 | Y_FLIP | BEHIND_BG
	dsprite   1, 0,   1, 0, $00, $0 | X_FLIP | Y_FLIP | BEHIND_BG
; e0c37

CardFlip_InitAttrPals: ; e0c37 (38:4c37)
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill

	hlcoord 12, 1, wAttrMap
	lb bc, 2, 2
	ld a, $1
	call CardFlip_FillBox

	hlcoord 14, 1, wAttrMap
	lb bc, 2, 2
	ld a, $2
	call CardFlip_FillBox

	hlcoord 16, 1, wAttrMap
	lb bc, 2, 2
	ld a, $3
	call CardFlip_FillBox

	hlcoord 18, 1, wAttrMap
	lb bc, 2, 2
	ld a, $4
	call CardFlip_FillBox

	hlcoord 9, 0, wAttrMap
	lb bc, 12, 1
	ld a, $1
	call CardFlip_FillBox

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, .palettes
	ld de, wUnknBGPals
	ld bc, 9 palettes
	rst CopyBytes
	pop af
	ld [rSVBK], a
	ret
; e0c93 (38:4c93)

.palettes ; e0c93
	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 25, 00
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 13, 30
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 17, 30
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 31, 08
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 31, 00, 00
	
MoogooMankey_InitAttrPals:
	hlcoord 0, 0, wAttrMap
	lb bc, 1, 24
	ld a, $7
	call CardFlip_FillBox

	hlcoord 0, 5, wAttrMap
	ld bc, 13 * SCREEN_WIDTH
	xor a
	call ByteFill

	hlcoord 0, 1, wAttrMap
	lb bc, 4, 4
	ld a, $1
	call CardFlip_FillBox

	hlcoord 4, 1, wAttrMap
	lb bc, 4, 4
	ld a, $2
	call CardFlip_FillBox

	hlcoord 8, 1, wAttrMap
	lb bc, 4, 4
	ld a, $3
	call CardFlip_FillBox

	hlcoord 12, 1, wAttrMap
	lb bc, 4, 4
	ld a, $4
	call CardFlip_FillBox

	hlcoord 16, 1, wAttrMap
	lb bc, 4, 4
	ld a, $5
	call CardFlip_FillBox
	
	hlcoord 0, 7, wAttrMap
	lb bc, 5, 4
	ld a, $1
	call CardFlip_FillBox

	hlcoord 4, 7, wAttrMap
	lb bc, 5, 4
	ld a, $2
	call CardFlip_FillBox

	hlcoord 8, 7, wAttrMap
	lb bc, 5, 4
	ld a, $3
	call CardFlip_FillBox

	hlcoord 12, 7, wAttrMap
	lb bc, 5, 4
	ld a, $4
	call CardFlip_FillBox

	hlcoord 16, 7, wAttrMap
	lb bc, 5, 4
	ld a, $5
	call CardFlip_FillBox

	hlcoord 0, 15, wAttrMap
	lb bc, 1, 1
	ld a, 1
	call CardFlip_FillBox
	
	hlcoord 0, 16, wAttrMap
	lb bc, 1, 1
	ld a, 3
	call CardFlip_FillBox
	
	hlcoord 1, 14, wAttrMap
	lb bc, 3, 2
	ld a, 7
	call CardFlip_FillBox
	
	hlcoord 1, 8, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	
	hlcoord 5, 8, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	
	hlcoord 9, 8, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	
	hlcoord 13, 8, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	
	hlcoord 17, 8, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, .palettes
	ld de, wUnknBGPals
	ld bc, 9 palettes
	rst CopyBytes
	pop af
	ld [rSVBK], a
	ret
; e0c93 (38:4c93)

.palettes ; e0c93
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 25, 00
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 13, 30
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 17, 30
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 31, 08
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 06, 19, 08
	RGB 31, 31, 31

	RGB 06, 19, 08
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 31, 00, 00

CardFlipLZ03: ; e0cdb
INCBIN "gfx/card_flip/0e0cdb.2bpp.lz"

CardFlipOffButtonGFX: ; e0cf6
INCBIN "gfx/card_flip/off_button.2bpp"

CardFlipOnButtonGFX: ; e0d06
INCBIN "gfx/card_flip/on_button.2bpp"

CardFlipLZ01: ; e0d16
INCBIN "gfx/card_flip/0e0d16.2bpp.lz"

CardFlipLZ02: ; e0ea8
INCBIN "gfx/card_flip/0e0ea8.2bpp.lz"

MoogooLZ01: ; e0d16
INCBIN "gfx/card_flip/0e0d162.2bpp.lz"

CardFlipTilemap: ; e110c
	db CARDFLIP_LIGHT_OFF, $15, $27, $2a, $2a, $06, $27, $2a, $2a, $06, $27
	db CARDFLIP_LIGHT_OFF, $07, $27, $3e, $3f, $42, $43, $46, $47, $4a, $4b
	db CARDFLIP_LIGHT_OFF, $17, $26, $40, $41, $44, $45, $48, $49, $4c, $4d
	db CARDFLIP_LIGHT_OFF, $25, $04, $00, $01, $00, $01, $00, $01, $00, $01
	db CARDFLIP_LIGHT_OFF, $05, $14, $10, $11, $10, $11, $10, $11, $10, $11
	db CARDFLIP_LIGHT_OFF, $16, $24, $20, $21, $20, $21, $20, $21, $20, $21
	db CARDFLIP_LIGHT_OFF, $25, $04, $00, $02, $00, $02, $00, $02, $00, $02
	db CARDFLIP_LIGHT_OFF, $05, $14, $10, $12, $10, $12, $10, $12, $10, $12
	db CARDFLIP_LIGHT_OFF, $16, $24, $20, $22, $20, $22, $20, $22, $20, $22
	db CARDFLIP_LIGHT_OFF, $25, $04, $00, $03, $00, $03, $00, $03, $00, $03
	db CARDFLIP_LIGHT_OFF, $05, $14, $10, $13, $10, $13, $10, $13, $10, $13
	db CARDFLIP_LIGHT_OFF, $16, $24, $20, $23, $20, $23, $20, $23, $20, $23

MoogooMankeyTilemap:
	INCBIN "gfx/card_flip/moogoomankey.tilemap"

_MoogooMankey:
	ld hl, wMoogooCard1Value
	ld bc, 39
	xor a
	call ByteFill
	ld [wMoogooTurn], a
	ld [wPlaceBallsX], a
	ld [wOnSkateboard], a
	ld a, 1
	ld [wPlaceBallsY], a
	ld hl, wOptions1
	set NO_TEXT_SCROLL, [hl]
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
;	ld de, MUSIC_NONE
;	call PlayMusic
	call DelayFrame
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra

	ld hl, MoogooLZ01
	ld de, VTiles2 tile $00
	call Decompress
	ld hl, CardFlipLZ02
	ld de, VTiles2 tile $3e
	call Decompress
	ld hl, CardFlipLZ03
	ld de, VTiles0 tile $00
	call Decompress
	ld hl, CardFlipOffButtonGFX
	ld de, VTiles1 tile (CARDFLIP_LIGHT_OFF - $80)
	ld bc, 1 tiles
	rst CopyBytes
	ld hl, CardFlipOnButtonGFX
	ld de, VTiles1 tile (CARDFLIP_LIGHT_ON - $80)
	ld bc, 1 tiles
	rst CopyBytes

	call MoogooMankey_InitTilemap
	call MoogooMankey_InitAttrPals
	call MoogooMankey_UpdateScores
	call EnableLCD
	call ApplyAttrAndTilemapInVBlank
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	call DelayFrame
	xor a
	ld [wJumptableIndex], a
	ld a, $2
	ld [wCardFlipCursorY], a
	ld [wCardFlipCursorX], a
	
	ld a, $1
	ld [hBGMapMode], a
;	ld c, 20
;	call DelayFrames
;	hlcoord 0, 0
;	call PlaceCardMoogoo1
;	hlcoord 4, 0
;	call PlaceCardMoogoo2
;	hlcoord 8, 0
;	call PlaceCardMoogoo3
;	hlcoord 12, 0
;	call PlaceCardMoogoo4
;	hlcoord 16, 0
;	call PlaceCardMoogoo5
;	call ApplyTilemapInVBlank
	
	ld c, 20
	call DelayFrames
.MasterLoop:
	ld a, [wMoogooTurn]
	cp 69
	jr z, .leavethegame
	call .MoogooMankey
	jr .MasterLoop
.leavethegame
	call WaitSFX
	hlcoord 0, 0
	ld de, .GameOverText
	call PlaceString
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call DelayFrame
	ld hl, wMoogooPlayerScore
	call CheckIfYouWon
	cp 0
	jr z, .youlose
	cp 1
	jr z, .youwin
	hlcoord 0, 0
	ld de, .YouTiedText
	call PlaceString
	ld a, 2
	ld [wScriptVar], a
	jr .leavethegame_cont
.youwin
	hlcoord 0, 0
	ld de, .YouWinText
	call PlaceString
	ld a, 1
	ld [wScriptVar], a
	jr .leavethegame_cont
.youlose
	hlcoord 0, 0
	ld de, .YouLoseText
	call PlaceString
	ld a, 0
	ld [wScriptVar], a
.leavethegame_cont
	call WaitSFX
	call ClearBGPalettes
	ld hl, wOptions1
	res NO_TEXT_SCROLL, [hl]
	call MoogooShowCursor
	ret
	
.MoogooMankey:
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


.Jumptable:
	dw .PlaceBet
	dw .ChangeTurn
	dw .PlaceBet
	dw .ChangeTurn
	dw .PlaceBet
	dw .Shuffling
	dw .ChangeTurn
	dw .PlaceBet
	dw .PlayCard
	dw .CheckRoundOver
	dw .NextRound
	dw .Quit

.Increment:
	ld hl, wJumptableIndex
	inc [hl]
	ret
	
.PlaceBet:
	ld a, [wPlaceBallsX]
	cp 1
	jr z, .PlaceBet_round1
	cp 2
	jr z, .PlaceBet_round2
.PlaceBet_round1
	ld a, [wMoogooPlayerScore]
	ld b, a
	ld a, [wMoogooCPU1Score]
	add b
	ld b, a
	ld a, [wMoogooCPU2Score]
	add b
	cp 20
	jr z, .PlaceBet_skipbet
	jr .PlaceBet_normal

.PlaceBet_round2
	ld a, [wMoogooPlayerScore]
	ld b, a
	ld a, [wMoogooCPU1Score]
	add b
	ld b, a
	ld a, [wMoogooCPU2Score]
	add b
	cp 16
	jr z, .PlaceBet_skipbet
	jr .PlaceBet_normal

.PlaceBet_skipbet
	hlcoord 0, 0
	
	ld a, [wMoogooTurn]
	cp 2
	jr z, .LoadCPU2TurnText2
	cp 1
	jr z, .LoadCPU1TurnText2
	
	ld de, .PlayersTurnText
	jr .betskiploop
.LoadCPU2TurnText2
	ld de, .CPU2TurnText
	jr .betskiploop
.LoadCPU1TurnText2
	ld de, .CPU1TurnText
.betskiploop
	call PlaceString
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jp nz, .Increment
	jr .betskiploop
	
.PlaceBet_normal
	ld a, 1
	ld [wPlaceBallsY], a
	
	hlcoord 0, 0
	
	ld a, [wMoogooTurn]
	cp 2
	jr z, .LoadCPU2TurnText
	cp 1
	jr z, .LoadCPU1TurnText
	
	ld de, .PlayersTurnText
	jr .betloop2
.LoadCPU2TurnText
	ld de, .CPU2TurnText
	jr .betloop2
.LoadCPU1TurnText
	ld de, .CPU1TurnText
.betloop2
	call PlaceString
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .PlaceBetCont
	jr .betloop2
.PlaceBetCont
	ld de, SFX_READ_TEXT
	call PlaySFX
	hlcoord 0, 0
	ld de, .PlaceBetText
	call PlaceString
	ld c, 20
	call DelayFrames
.betloop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .dobet
	call ChooseSurvivor_HandleJoypad
	call ChooseSurvivor_UpdateCursorOAM
	call DelayFrame
	call MoogooShowCursor
	jr .betloop

.dobet
	ld a, [wMoogooRetiredSuit1]
	ld b, a
	ld a, [wMoogooRetiredSuit2]
	ld c, a
	ld a, [wPlaceBallsY]
	cp b
	jp z, .placebetnope
	cp c
	jp z, .placebetnope
	cp 5
	jp z, .placebet5
	cp 4
	jp z, .placebet4
	cp 3
	jp z, .placebet3
	cp 2
	jp z, .placebet2
	cp 1
	jp z, .placebet1
	
.betdone
	call MoogooHideCursor
	ld a, 1
	ld [wPlaceBallsY], a
	hlcoord 0, 0
	ld de, .Clear
	call PlaceString
	ld de, SFX_READ_TEXT
	call PlaySFX
	call WaitSFX
	jp .Increment
	
.Shuffling
	ld a, 1
	ld [wOnSkateboard], a
	ld a, [wPlaceBallsX]
	inc a
	ld [wPlaceBallsX], a
	cp 3
	jp z, .Quit
	hlcoord 0, 0
	ld de, .ShufflingText
	call PlaceString
rept 15
	ld de, SFX_SWITCH_POCKETS
	call PlaySFX
	call WaitSFX
endr
	hlcoord 0, 0
	ld de, .Dealing
	call PlaceString
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard1Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard1Suit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard2Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard2Suit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard3Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard3Suit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard4Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard4Suit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard5Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard5Suit], a
	

	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	call DealPlayerCard1
	ld c, 20
	call DelayFrames
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	call DealPlayerCard2
	ld c, 20
	call DelayFrames
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	call DealPlayerCard3
	ld c, 20
	call DelayFrames
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	call DealPlayerCard4
	ld c, 20
	call DelayFrames
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	call DealPlayerCard5
	hlcoord 0, 0
	ld de, .Clear
	call PlaceString
	ld c, 20
	call DelayFrames
	xor a
	ld [wOnSkateboard], a
	jp .Increment
.Clear
	db "                    @"
	
.PlayersTurnText
	db "    <PLAYER>'s Turn@"
	
.CPU1TurnText
	db "     CPU 1's Turn@"
	
.CPU2TurnText
	db "     CPU 2's Turn@"
	
.PlaceBetText
	db "     Place a bet@"
	
.PlayCardText
	db "     Play a card@"
	
.Dealing
	db "       Dealing…@"
	
.ShufflingText
	db "     Shuffling…@"
	
.GameOverText
	db "      GAME OVER!@"
	
.YouWinText
	db "         YOU WIN!@"
	
.YouLoseText
	db "         YOU LOSE!@"
	
.YouTiedText
	db "         YOU TIED!@"

.PlayCard:
	hlcoord 0, 0
	ld de, .PlayCardText
	call PlaceString
	ld c, 20
	call DelayFrames
.playcardloop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .playcarddone
	call ChooseSurvivor_HandleJoypad
	call PickCard_UpdateCursorOAM
	call DelayFrame
	call MoogooShowCursor
	jr .playcardloop
.playcarddone
	ld de, SFX_READ_TEXT
	call PlaySFX
	
	call CheckWhichCard
	call PlaceCard
	call ApplyTilemapInVBlank
	call MoogooHideCursor
	call WaitSFX
	
	ld c, 20
	call DelayFrames
	call ReplacePlayerCard
	
	hlcoord 0, 0
	ld de, .Clear
	call PlaceString
	jp .Increment
	
.ChangeTurn
	ld a, [wMoogooTurn]
	cp 2
	jr nz, .inc_turn
	xor a
	jr .got_turn
.inc_turn
	inc a
.got_turn
	ld [wMoogooTurn], a
	jp .Increment
	
.CheckRoundOver:
	xor a
	ld [wMoogooCardsWithLowestValue], a
.CheckRoundOverLoop
	ld b, a
	ld a, [wMoogooCard1Value]
	cp b
	jp z, .got_lowest_value
	ld a, [wMoogooCard2Value]
	cp b
	jp z, .got_lowest_value
	ld a, [wMoogooCard3Value]
	cp b
	jp z, .got_lowest_value
	ld a, [wMoogooCard4Value]
	cp b
	jp z, .got_lowest_value
	ld a, [wMoogooCard5Value]
	cp b
	jp z, .got_lowest_value
	ld a, b
	inc a
	jr .CheckRoundOverLoop

.got_lowest_value
	cp 0
	jp z, .round_not_over
	ld b, a
	ld a, [wMoogooCard1Value]
	cp b
	jr nz, .no_1
	call MoogooIncreaseCardsWithLowestValue
	ld a, 1
	call MoogooRetireSuit
.no_1
	ld a, [wMoogooCard2Value]
	cp b
	jr nz, .no_2
	call MoogooIncreaseCardsWithLowestValue
	ld a, 2
	call MoogooRetireSuit
.no_2
	ld a, [wMoogooCard3Value]
	cp b
	jr nz, .no_3
	call MoogooIncreaseCardsWithLowestValue
	ld a, 3
	call MoogooRetireSuit
.no_3
	ld a, [wMoogooCard4Value]
	cp b
	jr nz, .no_4
	call MoogooIncreaseCardsWithLowestValue
	ld a, 4
	call MoogooRetireSuit
.no_4
	ld a, [wMoogooCard5Value]
	cp b
	jr nz, .no_5
	call MoogooIncreaseCardsWithLowestValue
	ld a, 5
	call MoogooRetireSuit
.no_5
	ld a, [wMoogooCardsWithLowestValue]
	cp 1
	jp z, .Increment	
.round_not_over
	xor a
	call MoogooRetireSuit
	ld a, 6
	ld [wJumptableIndex], a
	ret
	
.NextRound:
	call WaitSFX
	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	call WaitSFX
	
	ld hl, wMoogooPlayerCard1Suit
	ld bc, 10
	xor a
	call ByteFill
	
	ld hl, wMoogooCard1Value
	ld bc, 5
	xor a
	call ByteFill
	
	ld a, [wMoogooRetiredSuit1]
	call MoogooCrossOutSuit
	ld a, [wMoogooRetiredSuit2]
	call MoogooCrossOutSuit
	
	ld a, 5
	ld [wJumptableIndex], a
	ret
	
.Quit: ; e0360
	ld a, 69
	ld [wMoogooTurn], a
	ret
	
.placebet5:
	ld a, [wMoogooCard5ChipsA]
	ld b, a
	ld a, [wMoogooCard5ChipsB]
	add b
	ld b, a
	ld a, [wMoogooCard5ChipsC]
	add b
	cp 0
	jr z, .placebet5_0
	cp 1
	jr z, .placebet5_1
	cp 2
	jr z, .placebet5_2
	cp 3
	jr z, .placebet5_3
	jp .placebetnope
	
.placebet5_0
	hlcoord $11, $5, wAttrMap
	call ColorChip
	hlcoord $11, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet5end
	
.placebet5_1
	hlcoord $12, $5, wAttrMap
	call ColorChip
	hlcoord $12, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet5end

.placebet5_2
	hlcoord $11, $6, wAttrMap
	call ColorChip
	hlcoord $11, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet5end

.placebet5_3
	hlcoord $12, $6, wAttrMap
	call ColorChip
	hlcoord $12, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet5end
	
.placebet5end:
	ld a, [wMoogooTurn]
	cp 1
	jr z, .placebet5cpu1
	cp 2
	jr z, .placebet5cpu2
	ld a, [wMoogooCard5ChipsA]
	inc a
	ld [wMoogooCard5ChipsA], a
	jp .betdone
.placebet5cpu1
	ld a, [wMoogooCard5ChipsB]
	inc a
	ld [wMoogooCard5ChipsB], a
	jp .betdone
.placebet5cpu2
	ld a, [wMoogooCard5ChipsC]
	inc a
	ld [wMoogooCard5ChipsC], a
	jp .betdone
	
.placebet4:
	ld a, [wMoogooCard4ChipsA]
	ld b, a
	ld a, [wMoogooCard4ChipsB]
	add b
	ld b, a
	ld a, [wMoogooCard4ChipsC]
	add b
	cp 0
	jr z, .placebet4_0
	cp 1
	jr z, .placebet4_1
	cp 2
	jr z, .placebet4_2
	cp 3
	jr z, .placebet4_3
	jp .placebetnope
	
.placebet4_0
	hlcoord $0d, $5, wAttrMap
	call ColorChip
	hlcoord $0d, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet4end
	
.placebet4_1
	hlcoord $0e, $5, wAttrMap
	call ColorChip
	hlcoord $0e, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet4end

.placebet4_2
	hlcoord $0d, $6, wAttrMap
	call ColorChip
	hlcoord $0d, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet4end

.placebet4_3
	hlcoord $0e, $6, wAttrMap
	call ColorChip
	hlcoord $0e, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet4end
	
.placebet4end:
	ld a, [wMoogooTurn]
	cp 1
	jr z, .placebet4cpu1
	cp 2
	jr z, .placebet4cpu2
	ld a, [wMoogooCard4ChipsA]
	inc a
	ld [wMoogooCard4ChipsA], a
	jp .betdone
.placebet4cpu1
	ld a, [wMoogooCard4ChipsB]
	inc a
	ld [wMoogooCard4ChipsB], a
	jp .betdone
.placebet4cpu2
	ld a, [wMoogooCard4ChipsC]
	inc a
	ld [wMoogooCard4ChipsC], a
	jp .betdone
	
.placebet3:
	ld a, [wMoogooCard3ChipsA]
	ld b, a
	ld a, [wMoogooCard3ChipsB]
	add b
	ld b, a
	ld a, [wMoogooCard3ChipsC]
	add b
	cp 0
	jr z, .placebet3_0
	cp 1
	jr z, .placebet3_1
	cp 2
	jr z, .placebet3_2
	cp 3
	jr z, .placebet3_3
	jp .placebetnope
	
.placebet3_0
	hlcoord $09, $5, wAttrMap
	call ColorChip
	hlcoord $09, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet3end
	
.placebet3_1
	hlcoord $0a, $5, wAttrMap
	call ColorChip
	hlcoord $0a, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet3end

.placebet3_2
	hlcoord $09, $6, wAttrMap
	call ColorChip
	hlcoord $09, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet3end

.placebet3_3
	hlcoord $0a, $6, wAttrMap
	call ColorChip
	hlcoord $0a, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet3end
	
.placebet3end:
	ld a, [wMoogooTurn]
	cp 1
	jr z, .placebet3cpu1
	cp 2
	jr z, .placebet3cpu2
	ld a, [wMoogooCard3ChipsA]
	inc a
	ld [wMoogooCard3ChipsA], a
	jp .betdone
.placebet3cpu1
	ld a, [wMoogooCard3ChipsB]
	inc a
	ld [wMoogooCard3ChipsB], a
	jp .betdone
.placebet3cpu2
	ld a, [wMoogooCard3ChipsC]
	inc a
	ld [wMoogooCard3ChipsC], a
	jp .betdone
	
.placebet2:
	ld a, [wMoogooCard2ChipsA]
	ld b, a
	ld a, [wMoogooCard2ChipsB]
	add b
	ld b, a
	ld a, [wMoogooCard2ChipsC]
	add b
	cp 0
	jr z, .placebet2_0
	cp 1
	jr z, .placebet2_1
	cp 2
	jr z, .placebet2_2
	cp 3
	jr z, .placebet2_3
	jp .placebetnope
	
.placebet2_0
	hlcoord $5, $5, wAttrMap
	call ColorChip
	hlcoord $5, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet2end
	
.placebet2_1
	hlcoord $6, $5, wAttrMap
	call ColorChip
	hlcoord $6, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet2end

.placebet2_2
	hlcoord $5, $6, wAttrMap
	call ColorChip
	hlcoord $5, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet2end

.placebet2_3
	hlcoord $6, $6, wAttrMap
	call ColorChip
	hlcoord $6, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet2end
	
.placebet2end:
	ld a, [wMoogooTurn]
	cp 1
	jr z, .placebet2cpu1
	cp 2
	jr z, .placebet2cpu2
	ld a, [wMoogooCard2ChipsA]
	inc a
	ld [wMoogooCard2ChipsA], a
	jp .betdone
.placebet2cpu1
	ld a, [wMoogooCard2ChipsB]
	inc a
	ld [wMoogooCard2ChipsB], a
	jp .betdone
.placebet2cpu2
	ld a, [wMoogooCard2ChipsC]
	inc a
	ld [wMoogooCard2ChipsC], a
	jp .betdone
	
.placebet1:
	ld a, [wMoogooCard1ChipsA]
	ld b, a
	ld a, [wMoogooCard1ChipsB]
	add b
	ld b, a
	ld a, [wMoogooCard1ChipsC]
	add b
	cp 0
	jr z, .placebet1_0
	cp 1
	jr z, .placebet1_1
	cp 2
	jr z, .placebet1_2
	cp 3
	jr z, .placebet1_3
	jp .placebetnope
	
.placebet1_0
	hlcoord $1, $5, wAttrMap
	call ColorChip
	hlcoord $1, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet1end
	
.placebet1_1
	hlcoord $2, $5, wAttrMap
	call ColorChip
	hlcoord $2, $5
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet1end

.placebet1_2
	hlcoord $1, $6, wAttrMap
	call ColorChip
	hlcoord $1, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet1end

.placebet1_3
	hlcoord $2, $6, wAttrMap
	call ColorChip
	hlcoord $2, $6
	call PlaceChip
	call MoogooMankey_UpdateScores
	jr .placebet1end
	
.placebet1end:
	ld a, [wMoogooTurn]
	cp 1
	jr z, .placebet1cpu1
	cp 2
	jr z, .placebet1cpu2
	ld a, [wMoogooCard1ChipsA]
	inc a
	ld [wMoogooCard1ChipsA], a
	jp .betdone
.placebet1cpu1
	ld a, [wMoogooCard1ChipsB]
	inc a
	ld [wMoogooCard1ChipsB], a
	jp .betdone
.placebet1cpu2
	ld a, [wMoogooCard1ChipsC]
	inc a
	ld [wMoogooCard1ChipsC], a
	jp .betdone
	
.placebetnope
	ld de, SFX_WRONG
	call PlaySFX
	jp .betloop
	
DealPlayerCard1:
	hlcoord 3, 13
	call PlaceCardMoogooBorderSingle
	ld a, [wOnSkateboard]
	cp 1
	jr z, .cont
	hlcoord 3, 13
	call PlaceCardMoogooBorderLeft
.cont
	hlcoord 4, 15
	ld a, [wMoogooPlayerCard1Suit]
	call PlaceCardMoogooSuit
	hlcoord 3, 13, wAttrMap
	lb bc, 5, 4
	ld a, [wMoogooPlayerCard1Suit]
	call CardFlip_FillBox
	hlcoord 4, 14, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	hlcoord 5, 14
	ld de, wMoogooPlayerCard1Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyAttrAndTilemapInVBlank
	
DealPlayerCard2:
	hlcoord 6, 13
	call PlaceCardMoogooBorderRight
	ld a, [wOnSkateboard]
	cp 1
	jr z, .cont
	hlcoord 6, 13
	call PlaceCardMoogooBorderMiddle
.cont
	hlcoord 7, 15
	ld a, [wMoogooPlayerCard2Suit]
	call PlaceCardMoogooSuit
	hlcoord 6, 13, wAttrMap
	lb bc, 5, 4
	ld a, [wMoogooPlayerCard2Suit]
	call CardFlip_FillBox
	hlcoord 7, 14, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	hlcoord 8, 14
	ld de, wMoogooPlayerCard2Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyAttrAndTilemapInVBlank

DealPlayerCard3:
	hlcoord 9, 13
	call PlaceCardMoogooBorderRight
	ld a, [wOnSkateboard]
	cp 1
	jr z, .cont
	hlcoord 9, 13
	call PlaceCardMoogooBorderMiddle
.cont
	hlcoord 10, 15
	ld a, [wMoogooPlayerCard3Suit]
	call PlaceCardMoogooSuit
	hlcoord 9, 13, wAttrMap
	lb bc, 5, 4
	ld a, [wMoogooPlayerCard3Suit]
	call CardFlip_FillBox
	hlcoord 10, 14, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	hlcoord 11, 14
	ld de, wMoogooPlayerCard3Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyAttrAndTilemapInVBlank

DealPlayerCard4:
	hlcoord 12, 13
	call PlaceCardMoogooBorderRight
	ld a, [wOnSkateboard]
	cp 1
	jr z, .cont
	hlcoord 12, 13
	call PlaceCardMoogooBorderMiddle
.cont
	hlcoord 13, 15
	ld a, [wMoogooPlayerCard4Suit]
	call PlaceCardMoogooSuit
	hlcoord 12, 13, wAttrMap
	lb bc, 5, 4
	ld a, [wMoogooPlayerCard4Suit]
	call CardFlip_FillBox
	hlcoord 13, 14, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	hlcoord 14, 14
	ld de, wMoogooPlayerCard4Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyAttrAndTilemapInVBlank

DealPlayerCard5:
	hlcoord 15, 13
	call PlaceCardMoogooBorderRight
	hlcoord 16, 15
	ld a, [wMoogooPlayerCard5Suit]
	call PlaceCardMoogooSuit
	hlcoord 15, 13, wAttrMap
	lb bc, 5, 4
	ld a, [wMoogooPlayerCard5Suit]
	call CardFlip_FillBox
	hlcoord 16, 14, wAttrMap
	lb bc, 1, 2
	ld a, 6
	call CardFlip_FillBox
	hlcoord 17, 14
	ld de, wMoogooPlayerCard5Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyAttrAndTilemapInVBlank
	
UpdatePlayerCard1:
	hlcoord 3, 13
	call PlaceCardMoogooBorderLeft
	hlcoord 4, 15
	ld a, [wMoogooPlayerCard1Suit]
	call PlaceCardMoogooSuit
	hlcoord 5, 14
	ld de, wMoogooPlayerCard1Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyTilemapInVBlank
	
UpdatePlayerCard2:
	hlcoord 6, 13
	call PlaceCardMoogooBorderMiddle
	hlcoord 7, 15
	ld a, [wMoogooPlayerCard2Suit]
	call PlaceCardMoogooSuit
	hlcoord 8, 14
	ld de, wMoogooPlayerCard2Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyTilemapInVBlank

UpdatePlayerCard3:
	hlcoord 9, 13
	call PlaceCardMoogooBorderMiddle
	hlcoord 10, 15
	ld a, [wMoogooPlayerCard3Suit]
	call PlaceCardMoogooSuit
	hlcoord 11, 14
	ld de, wMoogooPlayerCard3Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyTilemapInVBlank

UpdatePlayerCard4:
	hlcoord 12, 13
	call PlaceCardMoogooBorderMiddle
	hlcoord 13, 15
	ld a, [wMoogooPlayerCard4Suit]
	call PlaceCardMoogooSuit
	hlcoord 14, 14
	ld de, wMoogooPlayerCard4Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyTilemapInVBlank

UpdatePlayerCard5:
	hlcoord 15, 13
	call PlaceCardMoogooBorderRight
	hlcoord 16, 15
	ld a, [wMoogooPlayerCard5Suit]
	call PlaceCardMoogooSuit
	hlcoord 17, 14
	ld de, wMoogooPlayerCard5Value
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	jp ApplyTilemapInVBlank
	
MoogooMankey_UpdateScores:
	hlcoord $2, $e
	ld de, wMoogooPlayerScore
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	hlcoord $2, $f
	ld de, wMoogooCPU1Score
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	hlcoord $2, $10
	ld de, wMoogooCPU2Score
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	jp PrintNum
	
GetRandomSuit:
	ld a, [wMoogooRetiredSuit1]
	ld b, a
	ld a, [wMoogooRetiredSuit2]
	ld c, a
	call Random
	and $7
	inc a
	cp 8
	jr z, GetRandomSuit
	cp 7
	jr z, GetRandomSuit
	cp 6
	jr z, GetRandomSuit
	cp b
	jr z, GetRandomSuit
	cp c
	jr z, GetRandomSuit
	ret
	
PlaceChip:
	ld a, [wMoogooTurn]
	cp 0
	jr z, .player
	cp 1
	jr z, .cpu1
	cp 2
	jr z, .cpu2
.return
	lb bc, 1, 1
	ld a, $7d
	ld [hGraphicStartTile], a
	predef PlaceGraphic
	ret
.player
	ld a, [wMoogooPlayerScore]
	inc a
	ld [wMoogooPlayerScore], a
	jr .return
.cpu1
	ld a, [wMoogooCPU1Score]
	inc a
	ld [wMoogooCPU1Score], a
	jr .return
.cpu2
	ld a, [wMoogooCPU2Score]
	inc a
	ld [wMoogooCPU2Score], a
	jr .return
	
	
ColorChip:
	lb bc, 1, 1
	ld a, [wMoogooTurn]
	cp 2
	jr nz, .colorchipskip
	inc a
.colorchipskip
	call CardFlip_FillBox
	jp ApplyAttrAndTilemapInVBlank
	
ReplacePlayerCard:
	ld a, [wPlaceBallsY]
	cp 5
	jr z, .five
	cp 4
	jr z, .four
	cp 3
	jp z, .three
	cp 2
	jp z, .two
.one
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	jp DealPlayerCard1
.five
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	jp DealPlayerCard5
.four
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	jp DealPlayerCard4
.three
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	jp DealPlayerCard3
.two
	ld de, SFX_GRASS_RUSTLE
	call PlaySFX
	jp DealPlayerCard2
	
CheckWhichCard:
	ld a, [wPlaceBallsY]
	cp 5
	jr z, .five
	cp 4
	jr z, .four
	cp 3
	jp z, .three
	cp 2
	jp z, .two
.one
	ld a, [wMoogooPlayerCard1Value]
	ld [wMoogooCurrentCardValue], a
	ld a, [wMoogooPlayerCard1Suit]
	ld [wMoogooCurrentCardSuit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard1Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard1Suit], a
	hlcoord $3, $d
	ld de, .TilemapLeft
	lb bc, 5, 4
	jp CardFlip_CopyToBox
.five
	ld a, [wMoogooPlayerCard5Value]
	ld [wMoogooCurrentCardValue], a
	ld a, [wMoogooPlayerCard5Suit]
	ld [wMoogooCurrentCardSuit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard5Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard5Suit], a
	hlcoord $f, $d
	ld de, .TilemapRight
	lb bc, 5, 4
	jp CardFlip_CopyToBox
.four
	ld a, [wMoogooPlayerCard4Value]
	ld [wMoogooCurrentCardValue], a
	ld a, [wMoogooPlayerCard4Suit]
	ld [wMoogooCurrentCardSuit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard4Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard4Suit], a
	hlcoord $c, $d
	ld de, .TilemapMid
	lb bc, 5, 4
	jp CardFlip_CopyToBox
.three
	ld a, [wMoogooPlayerCard3Value]
	ld [wMoogooCurrentCardValue], a
	ld a, [wMoogooPlayerCard3Suit]
	ld [wMoogooCurrentCardSuit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard3Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard3Suit], a
	hlcoord $9, $d
	ld de, .TilemapMid
	lb bc, 5, 4
	jp CardFlip_CopyToBox
.two
	ld a, [wMoogooPlayerCard2Value]
	ld [wMoogooCurrentCardValue], a
	ld a, [wMoogooPlayerCard2Suit]
	ld [wMoogooCurrentCardSuit], a
	call Random
	and $7
	inc a
	ld [wMoogooPlayerCard2Value], a
	call GetRandomSuit
	ld [wMoogooPlayerCard2Suit], a
	hlcoord $6, $d
	ld de, .TilemapMid
	lb bc, 5, 4
	jp CardFlip_CopyToBox
	
.TilemapLeft:
	db $07, $07, $07, $08
	db $07, $07, $07, $0b
	db $07, $07, $07, $0b
	db $07, $07, $07, $0b
	db $07, $07, $07, $0d
	
.TilemapMid:
	db $0a, $07, $07, $08
	db $0c, $07, $07, $0b
	db $0c, $07, $07, $0b
	db $0c, $07, $07, $0b
	db $0f, $07, $07, $0d
	
.TilemapRight:
	db $0a, $07, $07, $07
	db $0c, $07, $07, $07
	db $0c, $07, $07, $07
	db $0c, $07, $07, $07
	db $0f, $07, $07, $07
	
PlaceCard:
	ld a, [wMoogooCurrentCardSuit]
	cp 5
	jr z, .five
	cp 4
	jr z, .four
	cp 3
	jr z, .three
	cp 2
	jr z, .two
.one
	hlcoord $0, $7
	call PlaceCardMoogooBorderSingle
	hlcoord $1, $9
	call PlaceCardMoogoo1
	hlcoord $2, $8
	ld de, wMoogooCurrentCardValue
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, [wMoogooCurrentCardValue]
	ld [wMoogooCard1Value], a
	ret
.five
	hlcoord $10, $7
	call PlaceCardMoogooBorderSingle
	hlcoord $11, $9
	call PlaceCardMoogoo5
	hlcoord $12, $8
	ld de, wMoogooCurrentCardValue
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, [wMoogooCurrentCardValue]
	ld [wMoogooCard5Value], a
	ret
.four
	hlcoord $c, $7
	call PlaceCardMoogooBorderSingle
	hlcoord $d, $9
	call PlaceCardMoogoo4
	hlcoord $e, $8
	ld de, wMoogooCurrentCardValue
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, [wMoogooCurrentCardValue]
	ld [wMoogooCard4Value], a
	ret
.three
	hlcoord $8, $7
	call PlaceCardMoogooBorderSingle
	hlcoord $9, $9
	call PlaceCardMoogoo3
	hlcoord $a, $8
	ld de, wMoogooCurrentCardValue
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, [wMoogooCurrentCardValue]
	ld [wMoogooCard3Value], a
	ret
.two
	hlcoord $4, $7
	call PlaceCardMoogooBorderSingle
	hlcoord $5, $9
	call PlaceCardMoogoo2
	hlcoord $6, $8
	ld de, wMoogooCurrentCardValue
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ld a, [wMoogooCurrentCardValue]
	ld [wMoogooCard2Value], a
	ret
	
ChooseSurvivor_HandleJoypad: ; e089c
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jp nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jp nz, .d_right
	ret
.d_left
	ld a, [wPlaceBallsY]
	cp 1
	ret z
	dec a
	ld [wPlaceBallsY], a
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret
.d_right
	ld a, [wPlaceBallsY]
	cp 5
	ret z
	inc a
	ld [wPlaceBallsY], a
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret
	
ChooseSurvivor_UpdateCursorOAM:
	ld a, [wPlaceBallsY]
	cp 1
	jr z, .one
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	
.five
	ld hl, ChooseSurvivor_OAM05
	ld de, wSprites
	ld bc, 54
	jp CopyBytes

.one
	ld hl, ChooseSurvivor_OAM01
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
.two
	ld hl, ChooseSurvivor_OAM02
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
.three
	ld hl, ChooseSurvivor_OAM03
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
.four
	ld hl, ChooseSurvivor_OAM04
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
ChooseSurvivor_OAM01:
;y pos, x pos, tile, palette
	dsprite  3,  0, 1,  0, $04, $0 | BEHIND_BG
	dsprite  3,  0, 2,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 3,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 4,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  4,  0, 1,  0, $05, $0 | BEHIND_BG
	dsprite  4,  0, 4,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  5,  0, 1,  0, $05, $0 | BEHIND_BG
	dsprite  5,  0, 4,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  6,  0, 1,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 2,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 3,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 4,  0, $04, $0 | X_FLIP | Y_FLIP | BEHIND_BG
	dsprite  0,  0, 0,  0, $00, $0
	dsprite  0,  0, 0,  0, $00, $0
	
ChooseSurvivor_OAM02:
;y pos, x pos, tile, palette
	dsprite  3,  0, 5,  0, $04, $0 | BEHIND_BG
	dsprite  3,  0, 6,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 7,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 8,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  4,  0, 5,  0, $05, $0 | BEHIND_BG
	dsprite  4,  0, 8,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  5,  0, 5,  0, $05, $0 | BEHIND_BG
	dsprite  5,  0, 8,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  6,  0, 5,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 6,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 7,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 8,  0, $04, $0 | X_FLIP | Y_FLIP | BEHIND_BG
	dsprite  0,  0, 0,  0, $00, $0
	dsprite  0,  0, 0,  0, $00, $0
	
ChooseSurvivor_OAM03:
;y pos, x pos, tile, palette
	dsprite  3,  0, 9,  0, $04, $0 | BEHIND_BG
	dsprite  3,  0, 10,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 11,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 12,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  4,  0, 9,  0, $05, $0 | BEHIND_BG
	dsprite  4,  0, 12,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  5,  0, 9,  0, $05, $0 | BEHIND_BG
	dsprite  5,  0, 12,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  6,  0, 9,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 10,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 11,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 12,  0, $04, $0 | X_FLIP | Y_FLIP | BEHIND_BG
	dsprite  0,  0, 0,  0, $00, $0
	dsprite  0,  0, 0,  0, $00, $0
	
ChooseSurvivor_OAM04:
;y pos, x pos, tile, palette
	dsprite  3,  0, 13,  0, $04, $0 | BEHIND_BG
	dsprite  3,  0, 14,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 15,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 16,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  4,  0, 13,  0, $05, $0 | BEHIND_BG
	dsprite  4,  0, 16,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  5,  0, 13,  0, $05, $0 | BEHIND_BG
	dsprite  5,  0, 16,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  6,  0, 13,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 14,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 15,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 16,  0, $04, $0 | X_FLIP | Y_FLIP | BEHIND_BG
	dsprite  0,  0, 0,  0, $00, $0
	dsprite  0,  0, 0,  0, $00, $0
	
ChooseSurvivor_OAM05:
;y pos, x pos, tile, palette
	dsprite  3,  0, 17,  0, $04, $0 | BEHIND_BG
	dsprite  3,  0, 18,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 19,  0, $06, $0 | BEHIND_BG
	dsprite  3,  0, 20,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  4,  0, 17,  0, $05, $0 | BEHIND_BG
	dsprite  4,  0, 20,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  5,  0, 17,  0, $05, $0 | BEHIND_BG
	dsprite  5,  0, 20,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  6,  0, 17,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 18,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 19,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  6,  0, 20,  0, $04, $0 | X_FLIP | Y_FLIP | BEHIND_BG
	dsprite  0,  0, 0,  0, $00, $0
	dsprite  0,  0, 0,  0, $00, $0
	
PickCard_UpdateCursorOAM:
	ld a, [wPlaceBallsY]
	cp 1
	jr z, .one
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	
.five
	call UpdatePlayerCard5
	ld hl, PickCard_OAM05
	ld de, wSprites
	ld bc, 54
	jp CopyBytes

.one
	call UpdatePlayerCard1
	ld hl, PickCard_OAM01
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
.two
	call UpdatePlayerCard2
	ld hl, PickCard_OAM02
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
.three
	call UpdatePlayerCard3
	ld hl, PickCard_OAM03
	ld de, wSprites
	ld bc, 54
	jp CopyBytes
	
.four
	call UpdatePlayerCard4
	ld hl, PickCard_OAM04
	ld de, wSprites
	ld bc, 55
	jp CopyBytes
	
PickCard_OAM01:
;y pos, x pos, tile, palette
	dsprite  15,  0, 4,  0, $04, $0 | BEHIND_BG
	dsprite  15,  0, 5,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 6,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 7,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  16,  0, 4,  0, $05, $0 | BEHIND_BG
	dsprite  16,  0, 7,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  17,  0, 4,  0, $05, $0 | BEHIND_BG
	dsprite  17,  0, 7,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  18,  0, 4,  0, $05, $0 | BEHIND_BG
	dsprite  18,  0, 7,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  19,  0, 4,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 5,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 6,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 7,  0, $00, $0 | BEHIND_BG
	
PickCard_OAM02:
;y pos, x pos, tile, palette
	dsprite  15,  0, 7,  0, $04, $0 | BEHIND_BG
	dsprite  15,  0, 8,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 9,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 10,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  16,  0, 7,  0, $05, $0 | BEHIND_BG
	dsprite  16,  0, 10,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  17,  0, 7,  0, $05, $0 | BEHIND_BG
	dsprite  17,  0, 10,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  18,  0, 7,  0, $05, $0 | BEHIND_BG
	dsprite  18,  0, 10,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  19,  0, 7,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 8,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 9,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 10,  0, $00, $0 | BEHIND_BG
	
PickCard_OAM03:
;y pos, x pos, tile, palette
	dsprite  15,  0, 10,  0, $04, $0 | BEHIND_BG
	dsprite  15,  0, 11,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 12,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 13,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  16,  0, 10,  0, $05, $0 | BEHIND_BG
	dsprite  16,  0, 13,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  17,  0, 10,  0, $05, $0 | BEHIND_BG
	dsprite  17,  0, 13,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  18,  0, 10,  0, $05, $0 | BEHIND_BG
	dsprite  18,  0, 13,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  19,  0, 10,   0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 11,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 12,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 13,  0, $00, $0 | BEHIND_BG
	
PickCard_OAM04:
;y pos, x pos, tile, palette
	dsprite  15,  0, 13,  0, $04, $0 | BEHIND_BG
	dsprite  15,  0, 14,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 15,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 16,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  16,  0, 13,  0, $05, $0 | BEHIND_BG
	dsprite  16,  0, 16,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  17,  0, 13,  0, $05, $0 | BEHIND_BG
	dsprite  17,  0, 16,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  18,  0, 13,  0, $05, $0 | BEHIND_BG
	dsprite  18,  0, 16,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  19,  0, 13,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 14,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 15,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 16,  0, $00, $0 | BEHIND_BG
	
PickCard_OAM05:
;y pos, x pos, tile, palette
	dsprite  15,  0, 16,  0, $04, $0 | BEHIND_BG
	dsprite  15,  0, 17,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 18,  0, $06, $0 | BEHIND_BG
	dsprite  15,  0, 19,  0, $04, $0 | X_FLIP | BEHIND_BG
	
	dsprite  16,  0, 16,  0, $05, $0 | BEHIND_BG
	dsprite  16,  0, 19,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  17,  0, 16,  0, $05, $0 | BEHIND_BG
	dsprite  17,  0, 19,  0, $05, $0 | X_FLIP | BEHIND_BG
	dsprite  18,  0, 16,  0, $05, $0 | BEHIND_BG
	dsprite  18,  0, 19,  0, $05, $0 | X_FLIP | BEHIND_BG
	
	dsprite  19,  0, 16,  0, $04, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 17,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 18,  0, $06, $0 | Y_FLIP | BEHIND_BG
	dsprite  19,  0, 19,  0, $00, $0 | BEHIND_BG
	
MoogooIncreaseCardsWithLowestValue:
	ld a, [wMoogooCardsWithLowestValue]
	inc a
	ld [wMoogooCardsWithLowestValue], a
	ret
	
MoogooRetireSuit:
	ld c, a
	ld a, [wPlaceBallsX]
	cp 2
	jr z, .round2
	ld a, c
	ld [wMoogooRetiredSuit1], a
	ret
.round2
	ld a, c
	ld [wMoogooRetiredSuit2], a
	ret
	
MoogooCrossOutSuit:
	cp 0
	ret z
	cp 1
	jr z, .one
	cp 2
	jr z, .two
	cp 3
	jp z, .three
	cp 4
	jp z, .four
	ld a, [wMoogooCard5ChipsA]
	ld b, a
	ld a, [wMoogooPlayerScore]
	sub b
	ld [wMoogooPlayerScore], a
	ld a, [wMoogooCard5ChipsB]
	ld b, a
	ld a, [wMoogooCPU1Score]
	sub b
	ld [wMoogooCPU1Score], a
	
	ld a, [wMoogooCard5ChipsC]
	ld b, a
	ld a, [wMoogooCPU2Score]
	sub b
	ld [wMoogooCPU2Score], a
	
	xor a
	ld [wMoogooCard5ChipsA], a
	ld [wMoogooCard5ChipsB], a
	ld [wMoogooCard5ChipsC], a
	ld a, 69
	ld [wMoogooCard5Value], a
	hlcoord $10, 1
	jp .draw
.one
	ld a, [wMoogooCard1ChipsA]
	ld b, a
	ld a, [wMoogooPlayerScore]
	sub b
	ld [wMoogooPlayerScore], a 
	ld a, [wMoogooCard1ChipsB]
	ld b, a
	ld a, [wMoogooCPU1Score]
	sub b
	ld [wMoogooCPU1Score], a
	
	ld a, [wMoogooCard1ChipsC]
	ld b, a
	ld a, [wMoogooCPU2Score]
	sub b
	ld [wMoogooCPU2Score], a
	
	xor a
	ld [wMoogooCard1ChipsA], a
	ld [wMoogooCard1ChipsB], a
	ld [wMoogooCard1ChipsC], a
	ld a, 69
	ld [wMoogooCard1Value], a
	hlcoord 0, 1
	jp .draw
.two
	ld a, [wMoogooCard2ChipsA]
	ld b, a
	ld a, [wMoogooPlayerScore]
	sub b
	ld [wMoogooPlayerScore], a
	ld a, [wMoogooCard2ChipsB]
	ld b, a
	ld a, [wMoogooCPU1Score]
	sub b
	ld [wMoogooCPU1Score], a
	
	ld a, [wMoogooCard2ChipsC]
	ld b, a
	ld a, [wMoogooCPU2Score]
	sub b
	ld [wMoogooCPU2Score], a
	
	xor a
	ld [wMoogooCard2ChipsA], a
	ld [wMoogooCard2ChipsB], a
	ld [wMoogooCard2ChipsC], a
	ld a, 69
	ld [wMoogooCard2Value], a
	hlcoord 4, 1
	jr .draw
.three
	ld a, [wMoogooCard3ChipsA]
	ld b, a
	ld a, [wMoogooPlayerScore]
	sub b
	ld [wMoogooPlayerScore], a 
	ld a, [wMoogooCard3ChipsB]
	ld b, a
	ld a, [wMoogooCPU1Score]
	sub b
	ld [wMoogooCPU1Score], a
	
	ld a, [wMoogooCard3ChipsC]
	ld b, a
	ld a, [wMoogooCPU2Score]
	sub b
	ld [wMoogooCPU2Score], a
	
	xor a
	ld [wMoogooCard3ChipsA], a
	ld [wMoogooCard3ChipsB], a
	ld [wMoogooCard3ChipsC], a
	ld a, 69
	ld [wMoogooCard3Value], a
	hlcoord 8, 1
	jr .draw
.four
	ld a, [wMoogooCard4ChipsA]
	ld b, a
	ld a, [wMoogooPlayerScore]
	sub b
	ld [wMoogooPlayerScore], a
	ld a, [wMoogooCard4ChipsB]
	ld b, a
	ld a, [wMoogooCPU1Score]
	sub b
	ld [wMoogooCPU1Score], a
	
	ld a, [wMoogooCard4ChipsC]
	ld b, a
	ld a, [wMoogooCPU2Score]
	sub b
	ld [wMoogooCPU2Score], a
	
	xor a
	ld [wMoogooCard4ChipsA], a
	ld [wMoogooCard4ChipsB], a
	ld [wMoogooCard4ChipsC], a
	ld a, 69
	ld [wMoogooCard4Value], a
	hlcoord $c, 1
.draw
	ld de, .Tilemap
	lb bc, 6, 4
	call CardFlip_CopyToBox
	
	hlcoord 0, 7
	call MoogooDrawEmptyCard
	hlcoord 4, 7
	call MoogooDrawEmptyCard
	hlcoord 8, 7
	call MoogooDrawEmptyCard
	hlcoord $c, 7
	call MoogooDrawEmptyCard
	hlcoord $10, 7
	call MoogooDrawEmptyCard
	
	hlcoord 3, $d
	lb bc, 5, 16
	call CardFlip_FillGreenBox
	call MoogooMankey_UpdateScores
	jp ApplyAttrAndTilemapInVBlank
	
	
.Tilemap:
	db $10, $11, $12, $13
	db $14, $15, $16, $17
	db $18, $19, $1a, $1b
	db $1c, $1d, $1e, $1f
	db $07, $07, $07, $07
	db $07, $07, $07, $07
	
MoogooDrawEmptyCard:
	ld de, .Tilemap
	lb bc, 5, 4
	jp CardFlip_CopyToBox
	
.Tilemap
	db $72, $73, $73, $74
	db $75, $72, $74, $76
	db $75, $75, $76, $76
	db $75, $77, $79, $76
	db $77, $78, $78, $79
	
MoogooHideCursor:
	ldh a, [rLCDC]
	res rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a
	ret
	
MoogooShowCursor:
	ldh a, [rLCDC]
	set rLCDC_SPRITES_ENABLE, a
	ldh [rLCDC], a
	ret
	
CheckIfYouWon:
	ld a, [hli]
	cp [hl]
	jr c, .lost
	jr z, .tie
	inc hl
	cp [hl]
	jr c, .lost
	jr z, .tie
; won
	ld a, 1
	ret
.lost
	xor a
	ret
.tie
	ld a, -1
	ret