	const_def
	const BGSQUARE_SIX
	const BGSQUARE_FOUR
	const BGSQUARE_TWO
	const BGSQUARE_SEVEN
	const BGSQUARE_FIVE
	const BGSQUARE_THREE

; BG effects for use in battle animations.

ExecuteBGEffects: ; c8000 (32:4000)
	ld hl, wActiveBGEffects
	ld e, 5
.loop
	ld a, [hl]
	and a
	jr z, .next
	ld c, l
	ld b, h
	push hl
	push de
	call DoBattleBGEffectFunction
	pop de
	pop hl
.next
	ld bc, 4
	add hl, bc
	dec e
	jr nz, .loop
	ret

QueueBGEffect: ; c801a (32:401a)
	ld hl, wActiveBGEffects
	ld e, 5
.loop
	ld a, [hl]
	and a
	jr z, .load
	ld bc, 4
	add hl, bc
	dec e
	jr nz, .loop
	scf
	ret

.load
	ld c, l
	ld b, h
	ld hl, BG_EFFECT_STRUCT_FUNCTION
	add hl, bc
	ld a, [wBattleAnimTemp0]
	ld [hli], a
	ld a, [wBattleAnimTemp1]
	ld [hli], a
	ld a, [wBattleAnimTemp2]
	ld [hli], a
	ld a, [wBattleAnimTemp3]
	ld [hl], a
	ret

EndBattleBGEffect: ; c8043 (32:4043)
	ld hl, BG_EFFECT_STRUCT_FUNCTION
	add hl, bc
	ld [hl], 0
	ret

DoBattleBGEffectFunction: ; c804a (32:404a)
	ld hl, BG_EFFECT_STRUCT_FUNCTION
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, BattleBGEffects
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleBGEffects: ; c805a (32:405a)
	dw BattleBGEffect_End
	dw BattleBGEffect_FlashInverted
	dw BattleBGEffect_FlashWhite
	dw BattleBGEffect_WhiteHues
	dw BattleBGEffect_BlackHues
	dw BattleBGEffect_AlternateHues
	dw BattleBGEffect_CycleOBPalsGrayAndYellow
	dw BattleBGEffect_CycleMidOBPalsGrayAndYellow
	dw BattleBGEffect_CycleBGPals_Inverted
	dw BattleBGEffect_HideMon
	dw BattleBGEffect_ShowMon
	dw BattleBGEffect_EnterMon
	dw BattleBGEffect_ReturnMon
	dw BattleBGEffect_Surf
	dw BattleBGEffect_Whirlpool
	dw BattleBGEffect_Teleport
	dw BattleBGEffect_NightShade
	dw BattleBGEffect_BattlerObj_1Row
	dw BattleBGEffect_BattlerObj_2Row
	dw BattleBGEffect_DoubleTeam
	dw BattleBGEffect_AcidArmor
	dw BattleBGEffect_RapidFlash
	dw BattleBGEffect_FadeMonToLight
	dw BattleBGEffect_FadeMonToBlack
	dw BattleBGEffect_FadeMonToLightRepeating
	dw BattleBGEffect_FadeMonToBlackRepeating
	dw BattleBGEffect_CycleMonLightDarkRepeating
	dw BattleBGEffect_FlashMonRepeating
	dw BattleBGEffect_FadeMonsToBlackRepeating
	dw BattleBGEffect_FadeMonToWhiteWaitFadeBack
	dw BattleBGEffect_FadeMonFromWhite
	dw BattleBGEffect_ShakeScreenX
	dw BattleBGEffect_ShakeScreenY
	dw BattleBGEffect_Withdraw
	dw BattleBGEffect_BounceDown
	dw BattleBGEffect_Dig
	dw BattleBGEffect_Tackle
	dw BattleBGEffect_BodySlam
	dw BattleBGEffect_WobbleMon
	dw BattleBGEffect_RemoveMon
	dw BattleBGEffect_WaveDeformMon
	dw BattleBGEffect_Psychic
	dw BattleBGEffect_Flail
	dw BattleBGEffect_Rollout
	dw BattleBGEffect_VitalThrow
	dw BattleBGEffect_StartWater
	dw BattleBGEffect_Water
	dw BattleBGEffect_EndWater
	dw BattleBGEffect_VibrateMon
	dw BattleBGEffect_WobblePlayer
	dw BattleBGEffect_WobbleScreen
	dw BattleBGEffect_ShakeMonX
	dw BattleBGEffect_ShakeMonY
	dw BattleBGEffect_CycleOBPalsGrayAndYellowFullShift


BattleBGEffect_End: ; c80c6 (32:40c6)
	jp EndBattleBGEffect

BatttleBGEffects_GetNamedJumptablePointer: ; c80ca (32:40ca)
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

BattleBGEffects_AnonJumptable: ; c80d7 (32:40d7)
	pop de
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BattleBGEffects_IncrementJumptable: ; c80e5 (32:40e5)
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	inc [hl]
	ret

BattleBGEffect_FlashInverted: ; c80eb (32:40eb)
	ld de, .inverted
	jp BattleBGEffect_FlashContinue

.inverted
	db %11100100 ; 3210
	db %00011011 ; 0123
; c80f3

BattleBGEffect_FlashWhite: ; c80f3 (32:40f3)
	ld de, .white
	jp BattleBGEffect_FlashContinue

.white
	db %11100100 ; 3210
	db %00000000 ; 0000
; c80fb

BattleBGEffect_FlashContinue: ; c80fb (32:40fb)
; current timer, flash duration, number of flashes
	ld a, $1
	ld [wBattleAnimTemp0], a
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	and a
	jr z, .init
	dec [hl]
	ret

.init
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .apply_pal
	jp EndBattleBGEffect

.apply_pal
	dec a
	ld [hl], a
	and 1
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wBGP], a
	ret

BattleBGEffect_WhiteHues: ; c812d (32:412d)
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	jr c, .quit
	ld [wBGP], a
	ret

.quit
	jp EndBattleBGEffect

.Pals:
	db %11100100
	db %11100000
	db %11010000
	db -1
; c8141

BattleBGEffect_BlackHues: ; c8141 (32:4141)
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	jr c, .quit
	ld [wBGP], a
	ret

.quit
	jp EndBattleBGEffect

.Pals:
	db %11100100
	db %11110100
	db %11111000
	db -1
; c8155

BattleBGEffect_AlternateHues: ; c8155 (32:4155)
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	jr c, .quit
	ld [wBGP], a
	ld [wOBP1], a
	ret

.quit
	jp EndBattleBGEffect

.Pals:
	db %11100100
	db %11111000
	db %11111100
	db %11111000
	db %11100100
	db %10010000
	db %01000000
	db %10010000
	db -2
; c8171

BattleBGEffect_CycleOBPalsGrayAndYellow: ; c8171 (32:4171)
	ld de, .PalsCGB
	call BattleBGEffect_GetNthDMGPal
	ld [wOBP0], a
	ret

.PalsCGB:
	db %11100100
	db %10010000
	db -2
; c818b

BattleBGEffect_CycleOBPalsGrayAndYellowFullShift:
	ld de, .PalsCGB
	call BattleBGEffect_GetNthDMGPal
	ld [wOBP0], a
	ret

.PalsCGB:
	db %11100100
	db %10010011
	db %01001110
	db %00111001
	db -2

BattleBGEffect_CycleMidOBPalsGrayAndYellow: ; c818b (32:418b)
	ld de, .PalsCGB
	call BattleBGEffect_GetNthDMGPal
	ld [wOBP0], a
	ret

.PalsCGB:
	db %11100100
	db %11011000
	db -2
; c81a5

BattleBGEffect_CycleBGPals_Inverted: ; c81a5 (32:41a5)
	ld de, .Pals
	call BattleBGEffect_GetNthDMGPal
	ld [wBGP], a
	ret

.Pals:
	db %00011011
	db %01100011
	db %10000111
	db -2
; c81b3

BattleBGEffect_HideMon: ; c81b3 (32:41b3)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .four


.zero
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	hlcoord 12, 0
	lb bc, 7, 7
	jr .got_pointer

.player_side
	hlcoord 2, 6
	lb bc, 6, 6
.got_pointer
	call ClearBox
	pop bc
	xor a
	ldh [hBGMapHalf], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.four
	xor a
	ldh [hBGMapMode], a
	jp EndBattleBGEffect

BattleBGEffect_ShowMon: ; c81ea (32:41ea)
	call BGEffect_CheckFlyDigStatus
	jr z, .not_flying
	jp EndBattleBGEffect

.not_flying
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld de, .EnemyData
	jr .got_pointer

.player_side
	ld de, .PlayerData
.got_pointer
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	jp BattleBGEffect_RunPicResizeScript

.PlayerData:
	db  0, $31, 0
	db -1
.EnemyData:
	db  3, $00, 3
	db -1
; c8214

BattleBGEffect_BattlerObj_1Row: ; c8214 (32:4214)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .five


.zero
	call BGEffect_CheckFlyDigStatus
	jr z, .not_flying_digging
	ld hl, wNumActiveBattleAnims
	inc [hl]
	jp EndBattleBGEffect

.not_flying_digging
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld a, LOW(ANIM_OBJ_ENEMYFEET_1ROW)
	ld [wBattleAnimTemp0], a
	assert !HIGH(ANIM_OBJ_ENEMYFEET_1ROW)
	xor a
	ld [wBattleAnimTemp0 + 1], a
	ld a, 16 * 8 + 4
	jr .okay

.player_turn
	ld a, LOW(ANIM_OBJ_PLAYERHEAD_1ROW)
	ld [wBattleAnimTemp0], a
	assert !HIGH(ANIM_OBJ_PLAYERHEAD_1ROW)
	xor a
	ld [wBattleAnimTemp0 + 1], a
	ld a, 6 * 8
.okay
	ld [wBattleAnimTemp1], a
	ld a, 8 * 8
	ld [wBattleAnimTemp2], a
	xor a
	ld [wBattleAnimTemp3], a
	call _QueueBattleAnimation
	pop bc
	ret

.one
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn_2
	hlcoord 12, 6
	lb bc, 1, 7
	jr .okay2

.player_turn_2
	hlcoord 2, 6
	lb bc, 1, 6
.okay2
	call ClearBox
	ld a, $1
	ldh [hBGMapMode], a
	pop bc
	ret

.five
	xor a
	ldh [hBGMapMode], a
	jp EndBattleBGEffect

BattleBGEffect_BattlerObj_2Row: ; c8281 (32:4281)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .five


.zero
	call BGEffect_CheckFlyDigStatus
	jr z, .not_flying_digging
	ld hl, wNumActiveBattleAnims
	inc [hl]
	jp EndBattleBGEffect

.not_flying_digging
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld a, LOW(ANIM_OBJ_ENEMYFEET_2ROW)
	ld [wBattleAnimTemp0], a
	assert !HIGH(ANIM_OBJ_ENEMYFEET_2ROW)
	xor a
	ld [wBattleAnimTemp0 + 1], a
	ld a, 16 * 8 + 4
	jr .okay

.player_turn
	ld a, LOW(ANIM_OBJ_PLAYERHEAD_2ROW)
	ld [wBattleAnimTemp0], a
	assert !HIGH(ANIM_OBJ_PLAYERHEAD_2ROW)
	xor a
	ld [wBattleAnimTemp0 + 1], a
	ld a, 6 * 8
.okay
	ld [wBattleAnimTemp1], a
	ld a, 8 * 8
	ld [wBattleAnimTemp2], a
	xor a
	ld [wBattleAnimTemp3], a
	call _QueueBattleAnimation
	pop bc
	ret

.one
	call BattleBGEffects_IncrementJumptable
	push bc
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn_2
	hlcoord 12, 5
	lb bc, 2, 7
	jr .okay2

.player_turn_2
	hlcoord 2, 6
	lb bc, 2, 6
.okay2
	call ClearBox
	ld a, $1
	ldh [hBGMapMode], a
	pop bc
	ret

.five
	xor a
	ldh [hBGMapMode], a
	jp EndBattleBGEffect

_QueueBattleAnimation: ; c82ee (32:42ee)
	farjp QueueBattleAnimation

BattleBGEffect_RemoveMon: ; c82f5 (32:42f5)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .four


.zero
	call BattleBGEffects_IncrementJumptable
	call BGEffect_CheckBattleTurn
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	jr z, .user
	ld a, $9
	jr .okay

.user
	ld a, $8
.okay
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	jr z, .user_2
	hlcoord 0, 6
	lb de, 8, 6
.row1
	push de
	push hl
.col1
	inc hl
	ld a, [hld]
	ld [hli], a
	dec d
	jr nz, .col1
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec e
	jr nz, .row1
	jr .okay2

.user_2
	hlcoord 19, 0
	lb de, 8, 7
.row2
	push de
	push hl
.col2
	dec hl
	ld a, [hli]
	ld [hld], a
	dec d
	jr nz, .col2
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	dec e
	jr nz, .row2
.okay2
	xor a
	ldh [hBGMapHalf], a
	ld a, $1
	ldh [hBGMapMode], a
	call BattleBGEffects_IncrementJumptable
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	dec [hl]
	ret

.four
	xor a
	ldh [hBGMapMode], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], $1
	ret

.done
	jp EndBattleBGEffect

BattleBGEffect_EnterMon: ; c837b (32:437b)
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld de, .EnemyData
	jr .okay

.player_turn
	ld de, .PlayerData
.okay
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	jp BattleBGEffect_RunPicResizeScript

.PlayerData:
	db  2, $31, 2
	db  1, $31, 1
	db  0, $31, 0
	db -1
.EnemyData:
	db  5, $00, 5
	db  4, $00, 4
	db  3, $00, 3
	db -1
; c83a8

BattleBGEffect_ReturnMon: ; c83a8 (32:43a8)
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld de, .EnemyData
	jr .okay

.player_turn
	ld de, .PlayerData
.okay
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	jp BattleBGEffect_RunPicResizeScript

.PlayerData:
	db  0, $31, 0
	db -2, $66, 0
	db  1, $31, 1
	db -2, $44, 1
	db  2, $31, 2
	db -2, $22, 2
	db -3, $00, 0
	db -1
.EnemyData:
	db  3, $00, 3
	db -2, $77, 3
	db  4, $00, 4
	db -2, $55, 4
	db  5, $00, 5
	db -2, $33, 5
	db -3, $00, 0
	db -1
; c83ed

BattleBGEffect_RunPicResizeScript: ; c83ed (32:43ed)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw BattleBGEffects_IncrementJumptable
	dw BattleBGEffects_IncrementJumptable
	dw .restart
	dw .end


.zero
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld d, $0
	inc [hl]
	ld a, [wBattleAnimTemp1]
	ld l, a
	ld a, [wBattleAnimTemp2]
	ld h, a
	add hl, de
	add hl, de
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .end
	cp -2
	jr z, .clear
	cp -3
	jr z, .skip
	call .PlaceGraphic
.skip
	call BattleBGEffects_IncrementJumptable
	ld a, $1
	ldh [hBGMapMode], a
	ret

.clear
	call .ClearBox
	jr .zero

.restart
	xor a
	ldh [hBGMapMode], a
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], $0
	ret

.end
	xor a
	ldh [hBGMapMode], a
	jp EndBattleBGEffect

.ClearBox:
; get dims
	push bc
	inc hl
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	ld b, a
; get coords
	ld e, [hl]
	ld d, 0
	ld hl, .Coords
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ClearBox
	pop bc
	ret

.PlaceGraphic:
; get dims
	push bc
	push hl
	ld e, [hl]
	ld d, 0
	ld hl, .BGSquares
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	and $f
	ld c, a
	ld a, b
	swap a
	and $f
	ld b, a
; store pointer
	ld e, [hl]
	inc hl
	ld d, [hl]
; get byte
	pop hl
	inc hl
	ld a, [hli]
	ld [wBattleAnimTemp0], a
; get coord
	push de
	ld e, [hl]
	ld d, 0
	ld hl, .Coords
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
; fill box
.row
	push bc
	push hl
	ld a, [wBattleAnimTemp0]
	ld b, a
.col
	ld a, [de]
	add b
	ld [hli], a
	inc de
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	pop bc
	ret

.Coords:
	dwcoord  2,  6
	dwcoord  3,  8
	dwcoord  4, 10
	dwcoord 12,  0
	dwcoord 13,  2
	dwcoord 14,  4

.BGSquares:
MACRO bgsquare
	dn \1,\2
	dw \3
endm

	bgsquare 6, 6, .SixBySix
	bgsquare 4, 4, .FourByFour
	bgsquare 2, 2, .TwoByTwo
	bgsquare 7, 7, .SevenBySeven
	bgsquare 5, 5, .FiveByFive
	bgsquare 3, 3, .ThreeByThree

.SixBySix:
	db $00, $06, $0c, $12, $18, $1e
	db $01, $07, $0d, $13, $19, $1f
	db $02, $08, $0e, $14, $1a, $20
	db $03, $09, $0f, $15, $1b, $21
	db $04, $0a, $10, $16, $1c, $22
	db $05, $0b, $11, $17, $1d, $23

.FourByFour:
	db $00, $0c, $12, $1e
	db $02, $0e, $14, $20
	db $03, $0f, $15, $21
	db $05, $11, $17, $23

.TwoByTwo:
	db $00, $1e
	db $05, $23

.SevenBySeven:
	db $00, $07, $0e, $15, $1c, $23, $2a
	db $01, $08, $0f, $16, $1d, $24, $2b
	db $02, $09, $10, $17, $1e, $25, $2c
	db $03, $0a, $11, $18, $1f, $26, $2d
	db $04, $0b, $12, $19, $20, $27, $2e
	db $05, $0c, $13, $1a, $21, $28, $2f
	db $06, $0d, $14, $1b, $22, $29, $30

.FiveByFive:
	db $00, $07, $15, $23, $2a
	db $01, $08, $16, $24, $2b
	db $03, $0a, $18, $26, $2d
	db $05, $0c, $1a, $28, $2f
	db $06, $0d, $1b, $29, $30

.ThreeByThree:
	db $00, $15, $2a
	db $03, $18, $2d
	db $06, $1b, $30
; c8545

BattleBGEffect_Surf: ; c8545 (32:4545)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	lb de, 2, 2
	call InitSurfWaves

.one
	ldh a, [hLCDCPointer]
	and a
	ret z
	push bc
	call .RotatewSurfWaveBGEffect
	pop bc
	ret

.two
	jp BattleAnim_ResetLCDStatCustom

.RotatewSurfWaveBGEffect:
	ld hl, wSurfWaveBGEffect
	ld de, wSurfWaveBGEffect + 1
	ld c, wSurfWaveBGEffectEnd - wSurfWaveBGEffect - 1
	ld a, [hl]
	push af
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [hl], a
	ld de, wLYOverridesBackup
	ld hl, wSurfWaveBGEffect
	ld bc, $0
.loop2
	ldh a, [hLYOverrideStart]
	cp e
	jr nc, .load_zero
	push hl
	add hl, bc
	ld a, [hl]
	pop hl
	jr .okay

.load_zero
	xor a
.okay
	ld [de], a
	ld a, c
	inc a
	and $3f
	ld c, a
	inc de
	ld a, e
	cp $5f
	jr c, .loop2
	ret

BattleBGEffect_Whirlpool: ; c8599 (32:4599)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $5e
	ldh [hLYOverrideEnd], a
	lb de, 2, 2
	jp Functionc8f2e

.one
	jp BattleBGEffect_WavyScreenFX

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_StartWater: ; c85c2 (32:45c2)
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	call BattleBGEffect_SetLCDStatCustoms1
	jp EndBattleBGEffect

BattleBGEffect_Water: ; c85ce (32:45ce)
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld e, a
	add $4
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f0
	swap a
	cpl
	add $4
	ld d, a
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	ld [wBattleAnimTemp0], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .done
	inc [hl]
	inc [hl]
	jp Functionc8f9a

.done
	call BattleBGEffects_ClearLYOverrides
	jp EndBattleBGEffect

BattleBGEffect_EndWater: ; c8603 (32:4603)
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Psychic: ; c8607 (32:4607)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $5f
	ldh [hLYOverrideEnd], a
	lb de, 6, 5
	call Functionc8f2e
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	and $3
	ret nz
	jp BattleBGEffect_WavyScreenFX

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Teleport: ; c863f (32:463f)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	lb de, 6, 5
	jp Functionc8f2e

.one
	jp BattleBGEffect_WavyScreenFX

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_NightShade: ; c8662 (32:4662)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	call BattleBGEffect_SetLCDStatCustoms1
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld d, 2
	jp Functionc8f2e

.one
	jp BattleBGEffect_WavyScreenFX

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_DoubleTeam: ; c8689 (32:4689)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three
	dw .four
	dw .five


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cp $10
	jr nc, .next
	inc [hl]
	jp .UpdateLYOverrides

.three
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cp $ff
	jr z, .next
	dec [hl]
	jp .UpdateLYOverrides

.next
	jp BattleBGEffects_IncrementJumptable

.two
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld d, $2
	call Sine
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	add [hl]
	call .UpdateLYOverrides
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
.four
	ret

.UpdateLYOverrides:
	ld e, a
	cpl
	inc a
	ld d, a
	ld h, wLYOverridesBackup / $100
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	srl a
	push af
.loop
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec a
	jr nz, .loop
	pop af
	ret nc
	ld [hl], e
	ret

.five
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_AcidArmor: ; c8709 (32:4709)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	call BattleBGEffect_SetLCDStatCustoms1
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld e, [hl]
	ld d, 2
	call Functionc8f2e
	ld h, $d2
	ldh a, [hLYOverrideEnd]
	ld l, a
	ld [hl], $0
	dec l
	ld [hl], $0
	ret

.one
	ldh a, [hLYOverrideEnd]
	ld l, a
	ld h, $d2
	ld e, l
	ld d, h
	dec de
.loop
	ld a, [de]
	dec de
	ld [hld], a
	ldh a, [hLYOverrideStart]
	cp l
	jr nz, .loop
	ld [hl], $90
	ldh a, [hLYOverrideEnd]
	ld l, a
	ld a, [hl]
	cp $1
	jr c, .okay
	cp $90
	jr z, .okay
	ld [hl], $0
.okay
	dec l
	ld a, [hl]
	cp $2
	ret c
	cp $90
	ret z
	ld [hl], $0
	ret

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Withdraw: ; c8761 (32:4761)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $1
	ret

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $3f
	ld d, a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cp d
	ret nc
	call BGEffect_DisplaceLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	and $3
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Dig: ; c87a7 (32:47a7)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two
	dw .three


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $2
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld [hl], $10
	call BattleBGEffects_IncrementJumptable
.two
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	dec a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	cp [hl]
	ret c
	ld a, [hl]
	push af
	and $7
	jr nz, .skip
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	dec [hl]
.skip
	pop af
	call BGEffect_DisplaceLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.three
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Tackle: ; c8805 (32:4805)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw Tackle_BGEffect25_2d_one
	dw Tackle_BGEffect25_2d_two
	dw .three


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld a, 2
	jr .okay

.player_side
	ld a, -2
.okay
	ld [hl], a
	ret

.three
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_BodySlam: ; c8837 (32:4837)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw Tackle_BGEffect25_2d_one
	dw Tackle_BGEffect25_2d_two
	dw .three


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms2
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	call BGEffect_CheckBattleTurn
	jr nz, .player_side
	ld a,  2
	jr .okay

.player_side
	ld a, -2
.okay
	ld [hl], a
	ret

.three
	jp BattleAnim_ResetLCDStatCustom

Tackle_BGEffect25_2d_one:
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cp -8
	jr z, .reached_limit
	cp  8
	jr nz, .finish
.reached_limit
	call BattleBGEffects_IncrementJumptable
.finish
	call Functionc88a5
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Tackle_BGEffect25_2d_two:
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_c8893
	call BattleBGEffects_IncrementJumptable
.asm_c8893
	call Functionc88a5
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	add [hl]
	ld [hl], a
	ret

Functionc88a5: ; c88a5 (32:48a5)
	push af
	ld a, [wFXAnimIDHi] ; FXAnimIDHi
	or a
	jr nz, .not_rollout
	ld a, [wFXAnimIDLo] ; wFXAnimID
	cp ROLLOUT
	jr z, .rollout
.not_rollout
	pop af
	jp BGEffect_FillLYOverridesBackup

.rollout
	ldh a, [hLYOverrideStart]
	ld d, a
	ldh a, [hLYOverrideEnd]
	sub d
	ld d, a
	ld h, wLYOverridesBackup / $100
	ldh a, [hSCY]
	or a
	jr nz, .skip1
	ldh a, [hLYOverrideStart]
	or a
	jr z, .skip2
	dec a
	ld l, a
	ld [hl], $0
	jr .skip2

.skip1
	ldh a, [hLYOverrideEnd]
	dec a
	ld l, a
	ld [hl], $0
.skip2
	ldh a, [hSCY]
	ld l, a
	ldh a, [hLYOverrideStart]
	sub l
	jr nc, .skip3
	xor a
	dec d
.skip3
	ld l, a
	pop af
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

BGEffect2d_2f_zero:
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	ld a, -2
	jr .okay

.player_turn
	ld a, 2
.okay
	ld [hl], a
	ret

BattleBGEffect_VitalThrow: ; c8919 (32:4919)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw BGEffect2d_2f_zero
	dw Tackle_BGEffect25_2d_one
	dw .two
	dw Tackle_BGEffect25_2d_two
	dw .four

.four
	call BattleAnim_ResetLCDStatCustom
.two
	ret

BattleBGEffect_WobbleMon: ; c892a (32:492a)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	ret

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $8
	call Sine
	call BGEffect_FillLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $4
	ld [hl], a
	ret

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Flail: ; c8964 (32:4964)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	xor a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hli], a
	ld [hl], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $6
	call Sine
	push af
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld d, $2
	call Sine
	ld e, a
	pop af
	add e
	call BGEffect_FillLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	add $8
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_WaveDeformMon: ; c89b5 (32:49b5)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	jp BattleBGEffect_SetLCDStatCustoms1

.one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cp $20
	ret nc
	inc [hl]
	ld d, a
	ld e, 4
	jp Functionc8f2e

.two
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .reset
	dec [hl]
	ld d, a
	ld e, 4
	jp Functionc8f2e

.reset
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_BounceDown: ; c89ee (32:49ee)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $42
	call BattleBGEffect_SetLCDStatCustoms2
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $1
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $20
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cp $38
	ret nc
	push af
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld d, $10
	call Cosine
	add $10
	ld d, a
	pop af
	add d
	call BGEffect_DisplaceLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	inc [hl]
	inc [hl]
	ret

.two
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_FadeMonsToBlackRepeating: ; c8b00 (32:4b00)
	ld de, .Jumptable
	call BatttleBGEffects_GetNamedJumptablePointer
	jp hl

.Jumptable:
	dw .cgb_zero
	dw .cgb_one
	dw .cgb_two
.cgb_zero
	call BattleBGEffects_IncrementJumptable
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	ret

.cgb_one
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
	ld e, a
	and $7
	ret nz
	ld a, e
	and $18
	sla a
	swap a
	sla a
	ld e, a
	ld d, 0
	call BGEffect_CheckBattleTurn
	jr nz, .player_2
	ld hl, .CGB_DMGEnemyData
	add hl, de
	ld a, [hli]
	push hl
	call BGEffects_LoadBGPal1_OBPal0
	pop hl
	ld a, [hl]
	jp BGEffects_LoadBGPal0_OBPal1

.player_2
	ld hl, .CGB_DMGEnemyData
	add hl, de
	ld a, [hli]
	push hl
	call BGEffects_LoadBGPal0_OBPal1
	pop hl
	ld a, [hl]
	jp BGEffects_LoadBGPal1_OBPal0

.cgb_two
	ld a, $e4
	call BGEffects_LoadBGPal0_OBPal1
	ld a, $e4
	call BGEffects_LoadBGPal1_OBPal0
	jp EndBattleBGEffect

.CGB_DMGEnemyData:
	db $e4, $e4
	db $f8, $90
	db $fc, $40
	db $f8, $90
; c8be8

BattleBGEffect_RapidFlash: ; c8be8 (32:4be8)
	ld de, .FlashPals
	jp BGEffect_RapidCyclePals

.FlashPals:
	db $e4, $6c, $fe
; c8bf2

BattleBGEffect_FadeMonToLight: ; c8bf2 (32:4bf2)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $90, $40, $ff
; c8bfd

BattleBGEffect_FadeMonToBlack: ; c8bfd (32:4bfd)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $f8, $fc, $ff
; c8c08

BattleBGEffect_FadeMonToLightRepeating: ; c8c08 (32:4c08)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $90, $40, $90, $fe
; c8c14

BattleBGEffect_FadeMonToBlackRepeating: ; c8c14 (32:4c14)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $f8, $fc, $f8, $fe
; c8c20

BattleBGEffect_CycleMonLightDarkRepeating: ; c8c20 (32:4c20)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $f8, $fc, $f8, $e4, $90, $40, $90, $fe
; c8c30

BattleBGEffect_FlashMonRepeating: ; c8c30 (32:4c30)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $fc, $e4, $00, $fe
; c8c3c

BattleBGEffect_FadeMonToWhiteWaitFadeBack: ; c8c3c (32:4c3c)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $e4, $90, $40, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $90, $e4, $ff
; c8c55

BattleBGEffect_FadeMonFromWhite: ; c8c55 (32:4c55)
	ld de, .Pals
	jp BGEffect_RapidCyclePals

.Pals:
	db $00, $40, $90, $e4, $ff
; c8c61

BattleBGEffect_VibrateMon: ; c8c61 (32:4c61)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one


.zero ; c8c68 (32:4c68)
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	call BattleBGEffect_SetLCDStatCustoms1
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], $1
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $20
	ret

.one ; c8c85 (32:4c85)
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and a
	jr z, .finish
	dec [hl]
	and $1
	ret nz
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
	jp BGEffect_FillLYOverridesBackup

.finish
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_WobblePlayer: ; c8ca2 (32:4ca2)
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw .two


.zero ; c8cab (32:4cab)
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld a, $43
	ldh [hLCDCPointer], a
	xor a
	ldh [hLYOverrideStart], a
	ld a, $37
	ldh [hLYOverrideEnd], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
	ret

.one ; c8cc3 (32:4cc3)
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .two
	ld d, $6
	call Sine
	call BGEffect_FillLYOverridesBackup
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

.two ; c8cdd (32:4cdd)
	jp BattleAnim_ResetLCDStatCustom

BattleBGEffect_Rollout: ; c8ce1 (32:4ce1)
	call Functionc8d0b
	jr c, .xor_a
	bit 7, a
	jr z, .okay
.xor_a
	xor a
.okay
	push af
	call DelayFrame
	pop af
	ldh [hSCY], a
	cpl
	inc a
	ld [wAnimObject01_YOffset], a
	ret

BattleBGEffect_ShakeScreenX: ; c8cf9 (32:4cf9)
	call Functionc8d0b
	jr nc, .skip
	xor a
.skip
	ldh [hSCX], a
	ret

BattleBGEffect_ShakeMonX:
; Oscillates a mon between -x and +x pixels in the X axis, where x is
; the argument given to BG_EFFEECT_STRUCT_PARAM.
; Note that the oscillation distance is different from ShakeMonY.
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleAnim_ResetLCDStatCustom

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld hl, rIE
	set LCD_STAT, [hl]
	ld a, LOW(rSCX)
	call BattleBGEffect_SetLCDStatCustoms2
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	jr .reset_duration

.reload_distance
	; Toggles between sides.
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
.reset_duration
	; (Re)set shake duration.
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f0
	ld [hl], a
	swap a
	or [hl]
	ld [hl], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	dec [hl]
	ld a, [hli]
	and $f
	call z, .reload_distance

	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld e, a
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	ld h, HIGH(wLYOverridesBackup)
	ld d, a
	ld a, e
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

BattleBGEffect_ShakeMonY:
; Oscillates a mon between +1 and +x+1 pixels in the Y axis, where x is
; the argument given to BG_EFFEECT_STRUCT_PARAM.
	call BattleBGEffects_AnonJumptable
.anon_dw
	dw .zero
	dw .one
	dw BattleAnim_ResetLCDStatCustom

.zero
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_ClearLYOverrides
	ld hl, rIE
	set LCD_STAT, [hl]
	ld a, LOW(rSCY)
	call BattleBGEffect_SetLCDStatCustoms2
	ldh a, [hLYOverrideEnd]
	inc a
	ldh [hLYOverrideEnd], a
	jr .reset_duration

.reload_distance
	; Toggles between distances.
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, $80
	xor [hl]
	ld [hl], a
.reset_duration
	; (Re)set shake duration.
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f0
	ld [hl], a
	swap a
	or [hl]
	ld [hl], a
	ret

.one
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	dec [hl]
	ld a, [hl]
	and $f
	call z, .reload_distance

	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	bit 7, a
	jr z, .got_distance
	xor a
.got_distance
	jp BGEffect_DisplaceLYOverridesBackup

BattleBGEffect_ShakeScreenY: ; c8d02 (32:4d02)
	call Functionc8d0b
	jr nc, .skip
	xor a
.skip
	ldh [hSCY], a
	ret

Functionc8d0b: ; c8d0b (32:4d0b)
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .okay
	call EndBattleBGEffect
	scf
	ret

.okay
	dec [hl]
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .every_16_frames
	dec [hl]
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and a
	ret

.every_16_frames
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	cpl
	inc a
	ld [hl], a
	and a
	ret

BattleBGEffect_WobbleScreen: ; c8d3a (32:4d3a)
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	cp $40
	jr nc, .finish
	ld d, $6
	call Sine
	ldh [hSCX], a
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	ret

.finish
	xor a
	ldh [hSCX], a
	ret

BattleBGEffect_GetNthDMGPal: ; c8d57 (32:4d57)
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld a, [hl]
	and a
	jr z, .zero
	dec [hl]
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	jp BattleBGEffect_GetNextDMGPal

.zero
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	ld hl, BG_EFFECT_STRUCT_JT_INDEX
	add hl, bc
	ld [hl], a
	jp BattleBGEffect_GetFirstDMGPal

BGEffect_RapidCyclePals: ; c8d77 (32:4d77)
	push de
	ld de, .Jumptable_CGB
	call BatttleBGEffects_GetNamedJumptablePointer
	pop de
	jp hl

.Jumptable_CGB: ; c8ddd (32:4ddd)
	dw .zero_cgb
	dw .one_cgb
	dw .two_cgb
	dw .three_cgb
	dw .four_cgb


.zero_cgb ; c8de7 (32:4de7)
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn_cgb
	call BattleBGEffects_IncrementJumptable
	call BattleBGEffects_IncrementJumptable
.player_turn_cgb
	call BattleBGEffects_IncrementJumptable
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	ld [hl], $0
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld [hl], a
	ret

.one_cgb ; c8e02 (32:4e02)
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .okay_1_cgb
	dec [hl]
	ret

.okay_1_cgb
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call BattleBGEffect_GetFirstDMGPal
	jr c, .okay_2_cgb
	jp BGEffects_LoadBGPal0_OBPal1

.okay_2_cgb
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	dec [hl]
	ret

.two_cgb ; c8e21 (32:4e21)
	ld a, $e4
	call BGEffects_LoadBGPal0_OBPal1
	jp EndBattleBGEffect

.three_cgb ; c8e2a (32:4e2a)
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ld a, [hl]
	and $f
	jr z, .okay_3_cgb
	dec [hl]
	ret

.okay_3_cgb
	ld a, [hl]
	swap a
	or [hl]
	ld [hl], a
	call BattleBGEffect_GetFirstDMGPal
	jr c, .okay_4_cgb
	jp BGEffects_LoadBGPal1_OBPal0

.okay_4_cgb
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	dec [hl]
	ret

.four_cgb ; c8e49 (32:4e49)
	ld a, $e4
	call BGEffects_LoadBGPal1_OBPal0
	jp EndBattleBGEffect

BGEffects_LoadBGPal0_OBPal1: ; c8e52 (32:4e52)
	ld h, a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld a, h
	push bc
	push af
	ld hl, wBGPals palette PAL_BATTLE_BG_PLAYER
	ld de, wUnknBGPals palette PAL_BATTLE_BG_PLAYER
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, wBGPals palette PAL_BATTLE_BG_TYPE_CAT
	ld de, wUnknBGPals palette PAL_BATTLE_BG_TYPE_CAT
	pop af
	ld b, a
	push af
	ld c, $1
	call CopyPals
	ld hl, wOBPals palette PAL_BATTLE_OB_PLAYER
	ld de, wUnknOBPals palette PAL_BATTLE_OB_PLAYER
	pop af
	ld b, a
	ld c, $1
	call CopyPals
	pop bc
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

BGEffects_LoadBGPal1_OBPal0: ; c8e7f (32:4e7f)
	ld h, a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld a, h
	push bc
	push af
	ld hl, wBGPals palette PAL_BATTLE_BG_ENEMY
	ld de, wUnknBGPals palette PAL_BATTLE_BG_ENEMY
	ld b, a
	ld c, $1
	call CopyPals
	ld hl, wOBPals palette PAL_BATTLE_OB_ENEMY
	ld de, wUnknOBPals palette PAL_BATTLE_OB_ENEMY
	pop af
	ld b, a
	ld c, $1
	call CopyPals
	pop bc
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

BattleBGEffect_GetFirstDMGPal: ; c8eac (32:4eac)
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld a, [hl]
	inc [hl]
BattleBGEffect_GetNextDMGPal: ; c8eb2 (32:4eb2)
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .quit
	cp -2
	jr nz, .repeat
	ld a, [de]
	ld hl, BG_EFFECT_STRUCT_PARAM
	add hl, bc
	ld [hl], $0
.repeat
	and a
	ret

.quit
	scf
	ret

BattleBGEffects_ClearLYOverrides: ; c8eca (32:4eca)
	xor a
BattleBGEffects_SetLYOverrides: ; c8ecb (32:4ecb)
	ld hl, wLYOverrides
	ld e, $99
.loop1
	ld [hli], a
	dec e
	jr nz, .loop1
	ld hl, wLYOverridesBackup
	ld e, $91
.loop2
	ld [hli], a
	dec e
	jr nz, .loop2
	ret

BattleBGEffect_SetLCDStatCustoms1: ; c8ede (32:4ede)
	ldh [hLCDCPointer], a
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	lb de, $00, $36
	jr .okay

.player_turn
	lb de, $2f, $5e
.okay
	ld a, d
	ldh [hLYOverrideStart], a
	ld a, e
	ldh [hLYOverrideEnd], a
	ret

BattleBGEffect_SetLCDStatCustoms2: ; c8ef4 (32:4ef4)
	ldh [hLCDCPointer], a
	call BGEffect_CheckBattleTurn
	jr nz, .player_turn
	lb de, $00, $36
	jr .okay

.player_turn
	lb de, $2d, $5e
.okay
	ld a, d
	ldh [hLYOverrideStart], a
	ld a, e
	ldh [hLYOverrideEnd], a
	ret

BattleAnim_ResetLCDStatCustom: ; c8f0a (32:4f0a)
	xor a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	call BattleBGEffects_ClearLYOverrides
	xor a
	ldh [hLCDCPointer], a
	jp EndBattleBGEffect

BattleBGEffects_ResetVideoHRAM: ; c8f19 (32:4f19)
	xor a
	ldh [hLCDCPointer], a
	ld a, %11100100
	ldh [rBGP], a
	ld [wBGP], a
	ld [wOBP1], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	jp BattleBGEffects_ClearLYOverrides

Functionc8f2e: ; c8f2e (32:4f2e)
	push bc
	xor a
	ld [wBattleAnimTemp0], a
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	ld a, $80
	ld [wBattleAnimTemp3], a
	ld bc, wLYOverridesBackup
.loop
	ldh a, [hLYOverrideStart]
	cp c
	jr nc, .next
	ldh a, [hLYOverrideEnd]
	cp c
	jr c, .next
	ld a, [wBattleAnimTemp2]
	ld d, a
	ld a, [wBattleAnimTemp0]
	call Sine
	ld [bc], a
.next
	inc bc
	ld a, [wBattleAnimTemp1]
	ld hl, wBattleAnimTemp0
	add [hl]
	ld [hl], a
	ld hl, wBattleAnimTemp3
	dec [hl]
	jr nz, .loop
	pop bc
	ret

InitSurfWaves: ; c8f69 (32:4f69)
	push bc
	xor a
	ld [wBattleAnimTemp0], a
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	ld a, $40
	ld [wBattleAnimTemp3], a
	ld bc, wSurfWaveBGEffect
.loop
	ld a, [wBattleAnimTemp2]
	ld d, a
	ld a, [wBattleAnimTemp0]
	call Sine
	ld [bc], a
	inc bc
	ld a, [wBattleAnimTemp1]
	ld hl, wBattleAnimTemp0
	add [hl]
	ld [hl], a
	ld hl, wBattleAnimTemp3
	dec [hl]
	jr nz, .loop
	pop bc
	ret

Functionc8f9a: ; c8f9a (32:4f9a)
	push bc
	ld [wBattleAnimTemp3], a
	ld a, e
	ld [wBattleAnimTemp1], a
	ld a, d
	ld [wBattleAnimTemp2], a
	call .GetLYOverrideBackupAddrOffset
	ld hl, wLYOverridesBackup
	add hl, de
	ld c, l
	ld b, h
.loop
	ld a, [wBattleAnimTemp3]
	and a
	jr z, .done
	dec a
	ld [wBattleAnimTemp3], a
	push af
	ld a, [wBattleAnimTemp2]
	ld d, a
	ld a, [wBattleAnimTemp1]
	push hl
	call Sine
	ld e, a
	pop hl
	ldh a, [hLYOverrideEnd]
	cp c
	jr c, .skip1
	ld a, e
	ld [bc], a
	inc bc
.skip1
	ldh a, [hLYOverrideStart]
	cp l
	jr nc, .skip2
	ld [hl], e
	dec hl
.skip2
	ld a, [wBattleAnimTemp1]
	add $4
	ld [wBattleAnimTemp1], a
	pop af
	jr .loop

.done
	pop bc
	and a
	ret

.GetLYOverrideBackupAddrOffset:
	ldh a, [hLYOverrideStart]
	ld e, a
	ld a, [wBattleAnimTemp0]
	add e
	ld e, a
	ld d, $0
	ret

BattleBGEffect_WavyScreenFX: ; c8fef (32:4fef)
	push bc
	ldh a, [hLYOverrideStart]
	ld l, a
	inc a
	ld e, a
	ld h, $d2
	ld d, h
	ldh a, [hLYOverrideEnd]
	sub l
	and a
	jr z, .done
	ld c, a
	ld a, [hl]
	push af
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ld [hl], a
.done
	pop bc
	ret

BGEffect_FillLYOverridesBackup: ; c900b (32:500b)
	push af
	ld h, wLYOverridesBackup / $100
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	ld d, a
	pop af
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

BGEffect_DisplaceLYOverridesBackup: ; c901b (32:501b)
	; e = a; d = [hLYOverrideEnd] - [hLYOverrideStart] - a
	push af
	ld e, a
	ldh a, [hLYOverrideStart]
	ld l, a
	ldh a, [hLYOverrideEnd]
	sub l
	sub e
	ld d, a
	ld h, HIGH(wLYOverridesBackup)
	ldh a, [hLYOverrideStart]
	ld l, a
	ld a, $90
	inc e
	jr .first_iteration
.loop
	ld [hli], a
.first_iteration
	dec e
	jr nz, .loop
	pop af
	cpl
.loop2
	ld [hli], a
	dec d
	jr nz, .loop2
	ret

BGEffect_CheckBattleTurn: ; c9038 (32:5038)
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ldh a, [hBattleTurn]
	xor [hl]
	and $1
	ret

BGEffect_CheckFlyDigStatus: ; c9042 (32:5042)
	ld hl, BG_EFFECT_STRUCT_BATTLE_TURN
	add hl, bc
	ldh a, [hBattleTurn]
	and $1
	xor [hl]
	jr nz, .player
	ld a, [wEnemySubStatus3] ; EnemySubStatus3
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND | 1 << SUBSTATUS_UNDERWATER
	ret

.player
	ld a, [wPlayerSubStatus3] ; PlayerSubStatus3
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND | 1 << SUBSTATUS_UNDERWATER
	ret

; c906f (32:506f)
