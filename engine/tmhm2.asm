TMHMPocket: ; 2c76f (b:476f)
	ld a, $1
	ld [hInMenu], a
	call TMHM_PocketLoop
	ld a, 0 ; not xor a; preserve carry flag
	ld [hInMenu], a
	ret nc
	call PlaceHollowCursor
	ld a, [wCurTMHM]
	scf
	ret

TMHM_PocketLoop: ; 2c8d3 (b:48d3)
	xor a
	ld [hBGMapMode], a
	call TMHM_DisplayPocketItems
	ld a, 2
	ld [w2DMenuCursorInitY], a
	ld a, 7
	ld [w2DMenuCursorInitX], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, 5
	sub d
	inc a
	cp 6
	jr nz, .okay
	dec a
.okay
	ld [w2DMenuNumRows], a
	ld a, $c
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN | D_LEFT | D_RIGHT
	ld [wMenuJoypadFilter], a
	ld a, [wTMHMPocketCursor]
	inc a
	ld [wMenuCursorY], a
	ld a, $1
	ld [wMenuCursorX], a
	jr TMHM_ShowTMMoveDescription

TMHM_JoypadLoop: ; 2c915 (b:4915)
	call TMHM_DisplayPocketItems
	call DoMenuJoypadLoop
	ld b, a
	ld a, [wMenuCursorY]
	dec a
	ld [wTMHMPocketCursor], a
	xor a
	ld [hBGMapMode], a
	ld a, [w2DMenuFlags2]
	bit 7, a
	jp nz, TMHM_ScrollPocket
	ld a, b
	ld [wMenuJoypad], a
	bit A_BUTTON_F, a
	jp nz, TMHM_ChooseTMorHM
	bit B_BUTTON_F, a
	jp nz, TMHM_ExitPack
	bit D_RIGHT_F, a
	jp nz, TMHM_ExitPocket
	bit D_LEFT_F, a
	jp nz, TMHM_ExitPocket
TMHM_ShowTMMoveDescription: ; 2c946 (b:4946)
	call TMHM_GetCurrentTMHM
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
;	farcall LoadTMHMIconPalette
;	call SetPalettes
	ld a, [wCurTMHM]
	cp NUM_TMS + NUM_HMS + 1
	jr nc, .Cancel
	ld [wd265], a
	predef GetTMHMMove
	ld a, [wd265]
	ld [wCurSpecies], a
	hlcoord 1, 14
	call PrintMoveDesc
;	farcall LoadTMHMIcon
	jp TMHM_JoypadLoop

.Cancel:
;	farcall ClearTMHMIcon
	jp TMHM_JoypadLoop

TMHM_ChooseTMorHM: ; 2c974 (b:4974)
	call TMHM_PlaySFX_ReadText2
	call CountTMsHMs ; This stores the count to wd265.
	ld a, [wMenuCursorY]
	dec a
	ld b, a
	ld a, [wTMHMPocketScrollPosition]
	add b
	ld b, a
	ld a, [wd265]
	cp b
	jr z, _TMHM_ExitPack ; our cursor was hovering over CANCEL
TMHM_GetCurrentTMHM: ; 2c98a (b:498a)
	call TMHM_GetCurrentPocketPosition
	ld a, [wMenuCursorY]
	ld b, a
.loop
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jr nc, .okay
	call InnerCheckTMHM
	jr z, .loop
	dec b
	jr nz, .loop
	ld a, c
.okay
	ld [wCurTMHM], a
	ret

TMHM_ExitPack: ; 2c9a5 (b:49a5)
	call TMHM_PlaySFX_ReadText2
_TMHM_ExitPack: ; 2c9a8 (b:49a8)
	ld a, $2
	ld [wMenuJoypad], a
	and a
	ret

TMHM_ExitPocket: ; 2c9af (b:49af)
	and a
	ret

TMHM_ScrollPocket: ; 2c9b1 (b:49b1)
	ld a, b
	bit 7, a
	jr nz, .skip
	ld hl, wTMHMPocketScrollPosition
	ld a, [hl]
	and a
	jp z, TMHM_JoypadLoop
	dec [hl]
	call TMHM_DisplayPocketItems
	jp TMHM_ShowTMMoveDescription

.skip
	call TMHM_GetCurrentPocketPosition
	ld b, 5
.loop
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jp nc, TMHM_JoypadLoop
	call InnerCheckTMHM
	jr z, .loop
	dec b
	jr nz, .loop
	ld hl, wTMHMPocketScrollPosition
	inc [hl]
	call TMHM_DisplayPocketItems
	jp TMHM_ShowTMMoveDescription

TMHM_DisplayPocketItems: ; 2c9e2 (b:49e2)
	ld a, [wBattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, Tutorial_TMHMPocket

	hlcoord 5, 2
	lb bc, 10, 15
	ld a, " "
	call ClearBox
	call TMHM_GetCurrentPocketPosition
	ld d, $5
.loop2
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jr nc, .NotTMHM
	call InnerCheckTMHM
	jr z, .loop2
	ld b, a
	ld a, c
	ld [wd265], a
	ld [wPlaceBallsY], a
	push hl
	push de
	push bc
	call TMHMPocket_GetCurrentLineCoord
	push hl
	ld a, [wd265]
	cp NUM_TMS + 1
	jr nc, .HM
;	ld de, wd265
;	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
;	call PrintNum

	call GetTMIconDisc
	call GetTMIconLeft
	call GetTMIconRight
	jr .okay

.HM:
	push af
	sub NUM_TMS
	add 90
	ld [wd265], a
	ld [wPlaceBallsY], a
;	ld [hl], "H"
;	inc hl
;	ld de, wd265
;	lb bc, PRINTNUM_LEFTALIGN | 1, 2
;	call PrintNum
	
	call GetTMIconDisc
	call GetTMIconLeft
	call GetTMIconRight
	pop af
	ld [wd265], a
.okay
	predef GetTMHMMove
	ld a, [wd265]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	pop hl
	ld bc, 3
	add hl, bc
	push hl
	call PlaceString
	farcall Pack_Draw_Sprites
	pop hl
	pop bc
	pop de
	pop hl
	dec d
	jr nz, .loop2
	ret

.NotTMHM:
	push de
	call TMHMPocket_GetCurrentLineCoord
	inc hl
	inc hl
	inc hl
	push de
	ld de, TMHM_String_Cancel
	call PlaceString
	pop de
	ld a, -1
	ld [wd265], a
	ld [wPlaceBallsY], a
	call GetTMIconDisc
	call GetTMIconLeft
	call GetTMIconRight
	farcall Pack_Draw_Sprites
	pop de
	ret

TMHMPocket_GetCurrentLineCoord: ; 2ca86 (b:4a86)
	hlcoord 5, 0
	ld bc, 2 * SCREEN_WIDTH
	ld a, 6
	sub d
	ld e, a
	; AddNTimes
.loop
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 2ca95 (b:4a95)

TMHM_String_Cancel: ; 2caae
	db "CANCEL@"
; 2cab5

TMHM_GetCurrentPocketPosition: ; 2cab5 (b:4ab5)
	ld a, [wTMHMPocketScrollPosition]
	ld b, a
	inc b
	ld c, -1
.loop
	inc c
	ld a, c
	call InnerCheckTMHM
	jr z, .loop
	dec b
	jr nz, .loop
	dec c
	ret

Tutorial_TMHMPocket: ; 2caca (b:4aca)
	hlcoord 9, 3
	push de
	ld de, TMHM_String_Cancel
	call PlaceString
	pop de
	ret

TMHM_PlaySFX_ReadText2: ; 2cad6 (b:4ad6)
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 2cadf (b:4adf)

CountTMsHMs: ; 2cb2a (b:4b2a)
	ld hl, wTMsHMs
	ld b, wTMsHMsEnd - wTMsHMs
	jp CountSetBits

InnerCheckTMHM:
	and a
	ret z
	push bc
	push de
	dec a
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	ld hl, wTMsHMs
	call FlagAction
	ld a, c
	pop de
	pop bc
	and a
	ret

PrintMoveDesc: ; 2cb3e
	push hl
	ld hl, MoveDescriptions
	ld a, [wCurSpecies]
	cp TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	jr z, .transform_multimove
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld e, a
	ld d, [hl]
.return
	pop hl
	jp PlaceString
.transform_multimove
	farcall CheckTransformUsers
	jr c, .transform
	farcall CheckSketchUsers
	jr c, .sketch
	farcall CheckMimicUsers
	jr c, .mimic
	farcall CheckMetronomeUsers
	jr c, .metronome
	ld de, SplashDescription
	jr .return
.transform
	ld de, TransformDescription
	jr .return
.sketch
	ld de, SketchDescription
	jr .return
.mimic
	ld de, MimicDescription
	jr .return
.metronome
	ld de, MetronomeDescription
	jr .return

AskTeachTMHM: ; 2c7bf (b:47bf)
	ld hl, wOptions1
	ld a, [hl]
	push af
	res NO_TEXT_SCROLL, [hl]
	ld hl, wForgettingMove
	set LEARNING_TM_F, [hl]
	ld a, [wCurTMHM]
	ld [wCurTMHMBuffer], a
	predef GetTMHMMove
	ld a, [wCurTMHMBuffer]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	call CopyName1
	ld hl, Text_BootedTM ; Booted up a TM
	ld a, [wCurTMHM]
	cp HM01 + 1 ; off by one error?
	jr c, .TM

	; allow full PP restore for HMs
	ld hl, wForgettingMove
	res LEARNING_TM_F, [hl]
	ld hl, Text_BootedHM ; Booted up an HM
.TM:
	call PrintText
	ld de, SFX_CHOOSE_PC_OPTION
	call WaitPlaySFX
	call Text_WaitButton
	ld hl, Text_ItContained
	call PrintText
	call YesNoBox
	pop bc
	ld a, b
	ld [wOptions1], a
	ld hl, wForgettingMove
	res LEARNING_TM_F, [hl]
	ret

ChooseMonToLearnTMHM: ; 2c7fb
	ld hl, wStringBuffer2
	ld de, wTMHMMoveNameBackup
	ld bc, 12
	rst CopyBytes
	call ClearBGPalettes
ChooseMonToLearnTMHM_NoRefresh: ; 2c80a
	farcall LoadPartyMenuGFX
	farcall InitPartyMenuWithCancel
	farcall InitPartyMenuGFX
	ld a, [wPutativeTMHMMove]
	and a
	ld a, 3 ; TeachWhichPKMNString
	jr nz, .got_text
	ld a, 9 ; TutorWhichPKMNString
.got_text
	ld [wPartyMenuActionText], a
.loopback
	farcall WritePartyMenuTilemap
	farcall PrintPartyMenuText
	call ApplyTilemapInVBlank
	call SetPalettes
	call DelayFrame
	farcall PartyMenuSelect
	ret c
	push af
	ld a, MON_IS_EGG
	call GetPartyParamLocation
	bit MON_IS_EGG_F, [hl]
	pop bc ; now contains the former contents of af
	jr nz, .egg
	push bc
	ld hl, wTMHMMoveNameBackup
	ld de, wStringBuffer2
	ld bc, 12
	rst CopyBytes
	pop af ; now contains the original contents of af
	ret

.egg
	push hl
	push de
	push bc
	push af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	pop af
	pop bc
	pop de
	pop hl
	jr .loopback
; 2c867

TeachTMHM: ; 2c867
	predef CanLearnTMHMMove

	push bc
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .compatible
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld hl, Text_TMHMNotCompatible
	call PrintText
	jr .nope

.compatible
	call KnowsMove
	jr c, .nope

	predef LearnMove
	ld a, b
	and a
	jr z, .nope

	ld a, [wCurTMHM]
	call IsHM
	ret c

	ld c, HAPPINESS_LEARNMOVE
	farcall ChangeHappiness
	jr .learned_move

.nope
	and a
	ret

.learned_move
	scf
	ret
; 2c8bf (b:48bf)

KnowsMove: ; f9ea
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wPutativeTMHMMove]
	ld b, a
	ld c, NUM_MOVES
.loop
	ld a, [hli]
	cp b
	jr z, .knows_move
	dec c
	jr nz, .loop
	and a
	ret

.knows_move
	ld hl, .Text_knows
	call PrintText
	scf
	ret

.Text_knows: ; 0xfa06
	; knows @ .
	text_jump UnknownText_0x1c5ea8
	db "@"

Text_BootedTM: ; 0x2c8bf
	; Booted up a TM.
	text_jump UnknownText_0x1c0373
	db "@"
; 0x2c8c4

Text_BootedHM: ; 0x2c8c4
	; Booted up an HM.
	text_jump UnknownText_0x1c0384
	db "@"
; 0x2c8c9

Text_ItContained: ; 0x2c8c9
	; It contained @ . Teach @ to a #MON?
	text_jump UnknownText_0x1c0396
	db "@"
; 0x2c8ce

Text_TMHMNotCompatible: ; 0x2c8ce
	; is not compatible with @ . It can't learn @ .
	text_jump UnknownText_0x1c03c2
	db "@"
; 0x2c8d3

Text_ReminderNotCompatible: ; 0x2c8ce
	; It can't remember anything...
	text_jump UnknownText_ReminderNotCompatible
	db "@"

GetTMIconDisc:
	ld a, [wd265]
	cp a, -1
	jr z, .clear
	ld de, TMDiscIcon
	lb bc, BANK(TMDiscIcon), 2
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	jr .fifth
.first
	ld hl, VTiles0 tile $68
	jp Get2bpp
.second
	ld hl, VTiles0 tile $6c
	jp Get2bpp
.third
	ld hl, VTiles0 tile $70
	jp Get2bpp
.forth
	ld hl, VTiles0 tile $74
	jp Get2bpp
.fifth
	ld hl, VTiles0 tile $78
	jp Get2bpp
.clear
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first2
	cp 1
	jr z, .second2
	cp 2
	jr z, .third2
	cp 3
	jr z, .forth2
	jr .fifth2
.first2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 2
	ld hl, VTiles0 tile $68
	call Get2bpp
.second2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 2
	ld hl, VTiles0 tile $6c
	call Get2bpp
.third2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 2
	ld hl, VTiles0 tile $70
	call Get2bpp
.forth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 2
	ld hl, VTiles0 tile $74
	call Get2bpp
.fifth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 2
	ld hl, VTiles0 tile $78
	jp Get2bpp

GetTMIconLeft:
	ld a, [wd265]
	cp a, -1
	jr z, .clear
	
	ld a, [wd265]
	dec a
	ld e, a
	ld d, 0
	ld hl, TMHMTilesLeft
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, 1
	ld c, a
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	jr .fifth
.first
	ld hl, VTiles0 tile $6a
	jp Get2bpp
.second
	ld hl, VTiles0 tile $6e
	jp Get2bpp
.third
	ld hl, VTiles0 tile $72
	jp Get2bpp
.forth
	ld hl, VTiles0 tile $76
	jp Get2bpp
.fifth
	ld hl, VTiles0 tile $7a
	jp Get2bpp
.clear
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first2
	cp 1
	jr z, .second2
	cp 2
	jr z, .third2
	cp 3
	jr z, .forth2
	jr .fifth2
.first2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $6a
	call Get2bpp
.second2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $6e
	call Get2bpp
.third2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $72
	call Get2bpp
.forth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $76
	call Get2bpp
.fifth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $7a
	call Get2bpp
	ret
	
GetTMIconRight:
	ld a, [wd265]
	cp a, -1
	jr z, .clear
	dec a
	ld e, a
	ld d, 0
	ld hl, TMHMTilesRight
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, 1
	ld c, a
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	jr .fifth
.first
	ld hl, VTiles0 tile $6b
	jr .finish
.second
	ld hl, VTiles0 tile $6f
	jr .finish
.third
	ld hl, VTiles0 tile $73
	jr .finish
.forth
	ld hl, VTiles0 tile $77
.finish
	push af
	call Get2bpp
	farcall LoadTMHMIconPalette
	call SetPalettes
	pop af
	inc a
	ld [wPlaceBallsX], a
	ret
.fifth
	ld hl, VTiles0 tile $7b
	call Get2bpp
	farcall LoadTMHMIconPalette
	call SetPalettes
	xor a
	ld [wPlaceBallsX], a
	ret
.clear
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first2
	cp 1
	jr z, .second2
	cp 2
	jr z, .third2
	cp 3
	jr z, .forth2
	jr .fifth2
.first2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $6b
	call Get2bpp
.second2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $6f
	call Get2bpp
.third2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $73
	call Get2bpp
.forth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $77
	call Get2bpp
.fifth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 1
	ld hl, VTiles0 tile $7b
	call Get2bpp
	xor a
	ld [wPlaceBallsX], a
	ret

INCLUDE "data/tmhm_tiles.asm"

TMDiscIcon:	INCBIN "gfx/tmhm/disc.2bpp"

TMLeft0:	INCBIN "gfx/tmhm/L_0.2bpp"
TMLeft1:	INCBIN "gfx/tmhm/L_1.2bpp"
TMLeft2:	INCBIN "gfx/tmhm/L_2.2bpp"
TMLeft3:	INCBIN "gfx/tmhm/L_3.2bpp"
TMLeft4:	INCBIN "gfx/tmhm/L_4.2bpp"
TMLeft5:	INCBIN "gfx/tmhm/L_5.2bpp"
TMLeft6:	INCBIN "gfx/tmhm/L_6.2bpp"
TMLeft7:	INCBIN "gfx/tmhm/L_7.2bpp"
TMLeft8:	INCBIN "gfx/tmhm/L_8.2bpp"
TMLeft9:	INCBIN "gfx/tmhm/L_9.2bpp"
TMLeftH:	INCBIN "gfx/tmhm/L_H.2bpp"

TMRight0:	INCBIN "gfx/tmhm/R_0.2bpp"
TMRight1:	INCBIN "gfx/tmhm/R_1.2bpp"
TMRight2:	INCBIN "gfx/tmhm/R_2.2bpp"
TMRight3:	INCBIN "gfx/tmhm/R_3.2bpp"
TMRight4:	INCBIN "gfx/tmhm/R_4.2bpp"
TMRight5:	INCBIN "gfx/tmhm/R_5.2bpp"
TMRight6:	INCBIN "gfx/tmhm/R_6.2bpp"
TMRight7:	INCBIN "gfx/tmhm/R_7.2bpp"
TMRight8:	INCBIN "gfx/tmhm/R_8.2bpp"
TMRight9:	INCBIN "gfx/tmhm/R_9.2bpp"
