InitIntroGradient::
	; top stripe
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, $70
	call ByteFill
	; middle stripe
	; hlcoord 0, 1
	ld bc, SCREEN_WIDTH
	ld a, $71
	call ByteFill
	; bottom stripe
	; hlcoord 0, 2
	ld bc, SCREEN_WIDTH
	ld a, $72
	call ByteFill

	ld de, .IntroGradientGFX
	ld hl, VTiles2 tile $70
	lb bc, BANK(.IntroGradientGFX), 3
	jp Get2bpp

.IntroGradientGFX:
INCBIN "gfx/new_game/intro_gradient.2bpp"

_MainMenu: ; 5ae8
	farcall MainMenu
	farjp StartTitleScreen
; 5b04

PrintDayOfWeek: ; 5b05
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	jp PlaceString
; 5b1c

.Days: ; 5b1c
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
; 5b40

.Day: ; 5b40
	db "DAY@"
; 5b44

NewGame_ClearTileMapEtc: ; 5b44
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call Load1bppFrame
	call Load1bppFont
	jp ClearWindowData
; 5b54

OptionsMenu: ; 5b64
	farjp _OptionsMenu
; 5b6b

NewGamePlus:
	xor a
	ld [hBGMapMode], a
	farcall TryLoadSaveFile
	ret c
	jr _NewGame_FinishSetup

NewGame: ; 5b6b
	xor a
	ld [hBGMapMode], a
	call ResetWRAM_NotPlus
_NewGame_FinishSetup:
	call ResetWRAM
	call NewGame_ClearTileMapEtc
	call SetInitialOptions
	call CheckExtendedSpace
	farcall InitClock
	ld c, 31
	call FadeToBlack
	call ClearTileMap
	ld c, 40
	call DelayFrames
	ld c, 15
	call FadeToWhite
	farcall _DeveloperMessage
	call ClearTileMap
	
	ld c, 90
	call DelayFrames
	
	farcall ProfSpruceSpeech
	farcall InitializeWorld
	ld a, 1
	ld [wPreviousLandmark], a

	ld a, SPAWN_HOME
	ld [wDefaultSpawnpoint], a

	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	jp FinishContinueFunction
; 5b8f

ResetWRAM_NotPlus:
	xor a
	ld [wSavedAtLeastOnce], a

	ld [wBattlePoints], a

	ld [wCurBox], a

	call SetDefaultBoxNames

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call _ResetWRAM_InitList
	call CloseSRAM

DEF START_MONEY EQU 3000
	ld hl, wMoney
	ld [hl], START_MONEY / $10000
	inc hl
	ld [hl], START_MONEY / $100 % $100
	inc hl
	ld [hl], START_MONEY % $100
	ret

ResetWRAM: ; 5ba7
	ld hl, wSprites
	ld bc, wOptions1 - wSprites
	xor a
	call ByteFill

	ld hl, wRAM1Start
	ld bc, wGameData - wRAM1Start
	xor a
	call ByteFill

	; erase wGameData, but keep Money, wCurBox, wBoxNames, and wBattlePoints
	ld hl, wGameData
	ld bc, wMoney - wGameData
	xor a
	call ByteFill
	ld hl, MoneyEnd
	ld bc, wCurBox - MoneyEnd
	xor a
	call ByteFill
	ld hl, wBoxNamesEnd
	ld bc, wBattlePoints - wBoxNamesEnd
	xor a
	call ByteFill
	ld hl, wBattlePoints + 1
	ld bc, wGameDataEnd - (wBattlePoints + 1)
	xor a
	call ByteFill

	call Random
	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomSub]
	ld [wPlayerID], a
	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomAdd]
	ld [wPlayerID + 1], a

	call Random
	ld [wSecretID], a
	call DelayFrame
	call Random
	ld [wSecretID + 1], a

	ld hl, wPartyCount
	call _ResetWRAM_InitList

	xor a
	ld [wMonStatusFlags], a

	ld [wPlayerGender], a

	ld hl, wNumItems
	call _ResetWRAM_InitList

	ld hl, wNumMedicine
	call _ResetWRAM_InitList

	ld hl, wNumBalls
	call _ResetWRAM_InitList

	ld hl, wNumBerries
	call _ResetWRAM_InitList

	ld hl, wNumKeyItems
	call _ResetWRAM_InitList

	ld hl, wNumPCItems
	call _ResetWRAM_InitList

	ld hl, wTMsHMs
	xor a
rept ((NUM_TMS + NUM_HMS) + 7) / 8
	ld [hli], a
endr

	xor a
	ld [wRoamMon1Species], a
	ld [wRoamMon2Species], a
	ld [wRoamMon3Species], a
	ld a, -1
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon2MapGroup], a
	ld [wRoamMon3MapGroup], a
	ld [wRoamMon1MapNumber], a
	ld [wRoamMon2MapNumber], a
	ld [wRoamMon3MapNumber], a
	ld [wBikeUpgradeSteps], a
	ld [wBikeUpgradeSteps + 1], a

	call LoadOrRegenerateLuckyIDNumber
;	call InitializeMagikarpHouse

	xor a
	ld [wMonType], a

	ld [wOnwaBadges], a

	ld [wCoins], a
	ld [wCoins + 1], a

	ld [wRegisteredItems], a
	ld [wRegisteredItems + 1], a
	ld [wRegisteredItems + 2], a
	ld [wRegisteredItems + 3], a

	ld [wWhichMomItem], a

DEF START_ITEM_TRIGGER_BALANCE EQU 2300
	ld hl, wMomItemTriggerBalance
	ld [hl], START_ITEM_TRIGGER_BALANCE / $10000
	inc hl
	ld [hl], START_ITEM_TRIGGER_BALANCE / $100 % $100
	inc hl
	ld [hl], START_ITEM_TRIGGER_BALANCE % $100

	call InitializeNPCNames

	farcall InitDecorations

	farcall DeletePartyMonMail

	jp ResetGameTime
; 5ca1

_ResetWRAM_InitList: ; 5ca1
; Loads 0 in the count and -1 in the first item or mon slot.
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret
; 5ca6

SetDefaultBoxNames: ; 5ca6
	ld hl, wBoxNames
	ld c, 0
.loop
	push hl
	ld de, .Box
	call CopyName2
	dec hl
	ld a, c
	inc a
	cp 10
	jr c, .less
	sub 10
	ld [hl], "1"
	inc hl

.less
	add "0"
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld de, 9
	add hl, de
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .loop
	ret

.Box:
	db "Box@"
; 5cd3

;InitializeMagikarpHouse:
;	ld hl, wBestMagikarpLengthMmHi
;	ld a, $3
;	ld [hli], a
;	ld a, $6
;	ld [hli], a
;	ld de, .Ralph
;	jp CopyName2

;.Ralph:
;	db "Ralph@"

InitializeNPCNames: ; 5ce9
	ld hl, .Rival
	ld de, wRivalName
	call .Copy

	ld hl, .Backup
	ld de, wBackupName
	call .Copy

	ld hl, .Trendy
	ld de, wTrendyPhrase

.Copy:
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret

.Rival:
.Backup: db "???@"
.Trendy: db "┐@@@@@@@@@@"
; 5d23


; 5d33

LoadOrRegenerateLuckyIDNumber: ; 5d33
	ld a, BANK(sLuckyIDNumber)
	call GetSRAMBank
	ld a, [wCurDay]
	inc a
	ld b, a
	ld a, [sLuckyNumberDay]
	cp b
	ld a, [sLuckyIDNumber + 1]
	ld c, a
	ld a, [sLuckyIDNumber]
	jr z, .skip
	ld a, b
	ld [sLuckyNumberDay], a
	call Random
	ld c, a
	call Random

.skip
	ld [wLuckyIDNumber], a
	ld [sLuckyIDNumber], a
	ld a, c
	ld [wLuckyIDNumber + 1], a
	ld [sLuckyIDNumber + 1], a
	jp CloseSRAM
; 5d65

Continue: ; 5d65
	farcall TryLoadSaveFile
	ret c

	call LoadStandardMenuDataHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jr nc, .Check1Pass
	jp CloseWindow

.Check1Pass:
	call Continue_CheckRTC_RestartClock
	jr nc, .Check2Pass
	jp CloseWindow

.Check2Pass:
	ld a, $8
	ld [wMusicFade], a
	ld a, MUSIC_NONE % $100
	ld [wMusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [wMusicFadeIDHi], a
	call ClearBGPalettes
	call CloseWindow
	call ClearTileMap
	ld c, 20
	call DelayFrames
	farcall JumpRoamMons
	farcall Function140ae ; time-related
	xor a
	ld [wJukeboxSong], a
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	ld a, MAPSETUP_CONTINUE
	ld [hMapEntryMethod], a
	jp FinishContinueFunction

.SpawnAfterE4:
	ld a, SPAWN_SUNSET
	ld [wDefaultSpawnpoint], a
	call PostCreditsSpawn
	jp FinishContinueFunction
; 5de2

SpawnAfterLeaf: ; 5de2
	ld a, SPAWN_HOME
	ld [wDefaultSpawnpoint], a
; 5de7

PostCreditsSpawn: ; 5de7
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ret
; 5df0

ConfirmContinue: ; 5e34
.loop
	call DelayFrame
	call GetJoypad
	ld hl, hJoyPressed
	bit A_BUTTON_F, [hl]
	ret nz
	bit B_BUTTON_F, [hl]
	jr z, .loop
	scf
	ret
; 5e48

Continue_CheckRTC_RestartClock: ; 5e48
	call CheckRTCStatus
	and %10000000 ; Day count exceeded 16383
	jr z, .pass
	farcall RestartClock
	ld a, c
	and a
	jr z, .pass
	scf
	ret

.pass
	xor a
	ret
; 5e5d

FinishContinueFunction: ; 5e5d
.loop
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld [wLinkMode], a
	ld hl, wGameTimerPause
	set 0, [hl]
	res 7, [hl]
	ld hl, wEnteredMapFromContinue
	set 1, [hl]
	farcall OverworldLoop
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LEAF
	jr z, .AfterLeaf
	jp SoftReset

.AfterLeaf:
	call SpawnAfterLeaf
	jr .loop
; 5e85

DisplaySaveInfoOnContinue: ; 5e85
	call CheckRTCStatus
	and %10000000
	jr z, .clock_ok
	lb de, 4, 8
	jr DisplayContinueDataWithRTCError

.clock_ok
	lb de, 4, 8
	jr DisplayNormalContinueData
; 5e9a

DisplaySaveInfoOnSave: ; 5e9a
	lb de, 0, 0
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	jp UpdateSprites

DisplayNormalContinueData: ; 5e9f
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	call Load1bppFrame
	jp UpdateSprites
; 5eaf

DisplayContinueDataWithRTCError: ; 5eaf
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_UnknownGameTime
	call Load1bppFrame
	jp UpdateSprites
; 5ebf

Continue_LoadMenuHeader: ; 5ebf
	xor a
	ld [hBGMapMode], a
	ld hl, .MenuDataHeader_Dex
	ld a, [wStatusFlags]
	bit 0, a ; pokedex
	jr nz, .pokedex_header
	ld hl, .MenuDataHeader_NoDex

.pokedex_header
	call _OffsetMenuDataHeader
	call MenuBox
	jp PlaceVerticalMenuItems
; 5ed9

.MenuDataHeader_Dex: ; 5ed9
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_Dex
	db 1 ; default option
; 5ee1

.MenuData2_Dex: ; 5ee1
	db $00 ; flags
	db 4 ; items
	db "PLAYER@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"
; 5efb

.MenuDataHeader_NoDex: ; 5efb
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_NoDex
	db 1 ; default option
; 5f03

.MenuData2_NoDex: ; 5f03
	db $00 ; flags
	db 4 ; items
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"
; 5f1c


Continue_DisplayBadgesDexPlayerName: ; 5f1c
	call MenuBoxCoord2Tile
	push hl
	decoord 13, 4, 0
	add hl, de
	call Continue_DisplayBadgeCount
	pop hl
	push hl
	decoord 12, 6, 0
	add hl, de
	call Continue_DisplayPokedexNumCaught
	pop hl
	push hl
	decoord 8, 2, 0
	add hl, de
	ld de, .Player
	call PlaceString
	pop hl
	ret

.Player:
	db "<PLAYER>@"
; 5f40

Continue_PrintGameTime: ; 5f40
	decoord 9, 8, 0
	add hl, de
	jp Continue_DisplayGameTime
; 5f48

Continue_UnknownGameTime: ; 5f48
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	jp PlaceString

.three_question_marks
	db " ???@"
; 5f58

Continue_DisplayBadgeCount: ; 5f58
	push hl
	ld hl, wOnwaBadges
	ld b, 1
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 2
	jp PrintNum
; 5f6b

Continue_DisplayPokedexNumCaught: ; 5f6b
	ld a, [wStatusFlags]
	bit 0, a ; Pokedex
	ret z
	push hl
	ld hl, wPokedexCaught
IF NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
ELSE
	ld b, NUM_POKEMON / 8
ENDC
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 3
	jp PrintNum
; 5f84

Continue_DisplayGameTime: ; 5f84
	ld de, wGameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], ":"
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
; 5f99

CrystalIntroSequence: ; 620b
	farcall Copyright_GFPresents
;	jr c, StartTitleScreen
;	farcall CrystalIntro

StartTitleScreen: ; 6219
	ld hl, rIE
	set LCD_STAT, [hl]
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
;	ld a, [hVBlank]
;	push af
;	ld a, $1
;	ld [hVBlank], a

	farcall _TitleScreen
	call DelayFrame
	
.loop
	farcall RunTitleScreen
	jr nc, .loop

	call ClearSprites
	call ClearBGPalettes

;	pop af
;	ld [hVBlank], a
	pop af
	ld [rSVBK], a

	ld hl, rIE
	res LCD_STAT, [hl]
	ld hl, rLCDC
	res 2, [hl] ; 8x8 sprites
	call ClearScreen
	call ApplyAttrAndTilemapInVBlank
	xor a
	ld [hLCDCPointer], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld b, CGB_DIPLOMA
	call GetCGBLayout
	call UpdateTimePals
	ld a, [wIntroSceneFrameCounter]
	cp $6
	jr c, .ok
	xor a
.ok
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 626a

.dw
	dw _MainMenu
	dw DeleteSaveData
	dw CrystalIntroSequence
	dw CrystalIntroSequence
	dw ResetClock
; 6274
	
DeleteSaveData: ; 6389
	farcall _DeleteSaveData
	jp Init
; 6392

ResetClock: ; 6392
	farcall _ResetClock
	jp Init
; 639b

Copyright: ; 63e2
	call ClearTileMap
	ld de, CopyrightGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(CopyrightGFX), $1d
	call Request2bpp
	
	ld de, OriginalGameByGFX
	ld hl, VTiles2 tile $01
	lb bc, BANK(OriginalGameByGFX), $0c
	call Request2bpp
	
	hlcoord 2, 5
	ld de, CopyrightString
	call PlaceString
	
	hlcoord 2, 7
	lb bc, 1, 13
	lb de, $60, 0
	farcall DrawTitleGraphic
	
	hlcoord 2, 9
	lb bc, 1, 7
	lb de, $60, 0
	farcall DrawTitleGraphic
	
	hlcoord 9, 9
	lb bc, 1, 6
	lb de, $6d, 0
	farcall DrawTitleGraphic
	
	hlcoord 15, 9
	lb bc, 1, 3
	lb de, $7a, 0
	farcall DrawTitleGraphic
	
	hlcoord 2, 11
	lb bc, 1, 7
	lb de, $60, 0
	farcall DrawTitleGraphic
	
	hlcoord 9, 11
	lb bc, 1, 10
	lb de, $73, 0
	farcall DrawTitleGraphic
	
	ret
; 63fd

CopyrightString: ; 63fd
	; ©1995-2001 Nintendo
	db   $01, $02, $03, $04, $05, $06, $07
	db   $08, $09

	db "@"
; 642e

CoralSplashScreen:
	call ClearTileMap
	ld de, DisclaimerScreenGFX
	ld hl, VTiles1 tile $00
	lb bc, BANK(DisclaimerScreenGFX), $7f
	call Request2bpp
	ld de, DisclaimerScreenGFX2
	ld hl, VTiles2 tile $00
	lb bc, BANK(DisclaimerScreenGFX2), $7f
	call Request2bpp
	
	hlcoord 7, 1
	lb bc, 1, 6
	lb de, $80, 0
	farcall DrawTitleGraphic
	hlcoord 7, 2
	lb bc, 1, 6
	lb de, $90, 0
	farcall DrawTitleGraphic
	
	hlcoord 1, 4
	lb bc, 1, SCREEN_WIDTH
	lb de, $a9, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 5
	lb bc, 1, SCREEN_WIDTH
	lb de, $bc, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 6
	lb bc, 1, SCREEN_WIDTH
	lb de, $d0, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 7
	lb bc, 1, SCREEN_WIDTH
	lb de, $e4, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 8
	lb bc, 1, 7
	lb de, $f8, 0
	farcall DrawTitleGraphic
	
	hlcoord 7, 8
	lb bc, 1, 1
	lb de, $73, 0
	farcall DrawTitleGraphic
	
	hlcoord 8, 8
	lb bc, 1, 12
	lb de, $00, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 9
	lb bc, 1, SCREEN_WIDTH
	lb de, $0c, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 10
	lb bc, 1, SCREEN_WIDTH
	lb de, $20, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 11
	lb bc, 1, SCREEN_WIDTH
	lb de, $34, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 12
	lb bc, 1, SCREEN_WIDTH
	lb de, $48, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 13
	lb bc, 1, SCREEN_WIDTH
	lb de, $5c, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 14
	lb bc, 1, 1
	lb de, $70, 1
	farcall DrawTitleGraphic
	
	hlcoord 1, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 2, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 3, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 4, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 5, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 6, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 7, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 8, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 9, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 10, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 11, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 12, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 13, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 14, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 15, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 16, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 17, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 18, 14
	lb bc, 1, 1
	lb de, $71, 1
	farcall DrawTitleGraphic
	
	hlcoord 19, 14
	lb bc, 1, 1
	lb de, $72, 1
	farcall DrawTitleGraphic
	
	hlcoord 0, 15
	lb bc, 1, 10
	lb de, $86, 0
	farcall DrawTitleGraphic
	
	hlcoord 10, 15
	lb bc, 1, 8
	lb de, $a0, 0
	farcall DrawTitleGraphic
	
	hlcoord 18, 15
	lb bc, 1, 2
	lb de, $7d, 0
	farcall DrawTitleGraphic
	
	hlcoord 0, 16
	lb bc, 1, 10
	lb de, $96, 0
	farcall DrawTitleGraphic
	
	hlcoord 10, 16
	lb bc, 1, 1
	lb de, $a8, 0
	farcall DrawTitleGraphic
	
	hlcoord 11, 16
	lb bc, 1, 9
	lb de, $74, 0
	farcall DrawTitleGraphic
	
; set PRESS A TO CONTINUE palette
	ld a, 1
	ld [rVBK], a
	
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	
	hlcoord 0, $0f, wAttrMap
	ld bc, 2 * SCREEN_WIDTH
	ld a, 1
	call ByteFill
	
	xor a
	ld [rVBK], a
	ret
	
ClearSplashScreenPalettes:
	ld a, 1
	ld [rVBK], a
	
	hlbgcoord 0, 15
	ld bc, SCREEN_WIDTH
	xor a
	call ByteFill
	
	hlbgcoord 0, 16
	ld bc, SCREEN_WIDTH
	xor a
	call ByteFill
	
	xor a
	ld [rVBK], a
	ret
	
BusterScreenTilemapAndAttrMap::
	ld hl, CoralDevScreenTilemap
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	
	ld a, 1
	ld [rVBK], a
	
	ld hl, CoralDevScreenAttrmap
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	rst CopyBytes
	ret
	
BusterScreenTilemap2::
	ld hl, CoralDevScreenTilemap2
	decoord $08, $06
	ld bc, 4 * 1
	rst CopyBytes
	
	ld hl, CoralDevScreenTilemap2 + 4
	decoord $08, $07
	ld bc, 4 * 1
	rst CopyBytes
	
	ld hl, CoralDevScreenTilemap2 + 8
	decoord $08, $08
	ld bc, 4 * 1
	rst CopyBytes
	
	ld hl, CoralDevScreenTilemap2 + 12
	decoord $08, $09
	ld bc, 4 * 1
	rst CopyBytes
	ret
	
GameInit:: ; 642e
	farcall TryLoadSaveData
	call ClearWindowData
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call ApplyTilemapInVBlank
	jp CrystalIntroSequence
; 6454
	
CoralDevScreenBusterPalette:
	RGB 31, 00, 31
	RGB 31, 31, 31
	RGB 14, 17, 30
	RGB 00, 00, 00
	
	RGB 31, 00, 31
	RGB 31, 08, 23
	RGB 15, 07, 00
	RGB 00, 00, 00
	
CoralDevScreenTilemap:
INCBIN "gfx/intro/splash/coraldev.tilemap"

CoralDevScreenTilemap2:
INCBIN "gfx/intro/splash/coraldev2.tilemap"

CoralDevScreenAttrmap:
INCBIN "gfx/intro/splash/coraldev.attrmap"
	
	
CoralDevScreenPalette1:
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00
	
CoralDevScreenPalette2:
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 31, 31
	
	RGB 31, 31, 31
	RGB 31, 30, 25
	RGB 31, 25, 27
	RGB 00, 00, 00