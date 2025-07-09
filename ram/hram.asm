DEF HRAM_START         EQU $ff80
DEF hPushOAM           EQU $ff80 ; 10 bytes

DEF hROMBankBackup     EQU $ff8a
DEF hBuffer            EQU $ff8b
DEF hLYOverrideStackCopyAmount EQU $ff8c

DEF hRTCDayHi          EQU $ff8d
DEF hRTCDayLo          EQU $ff8e
DEF hRTCHours          EQU $ff8f
DEF hRTCMinutes        EQU $ff90
DEF hRTCSeconds        EQU $ff91

DEF hHours             EQU $ff94
DEF hMinutes           EQU $ff96
DEF hSeconds           EQU $ff98

DEF hVBlankCounter     EQU $ff9b

DEF hROMBank           EQU $ff9d
DEF hVBlank            EQU $ff9e
DEF hMapEntryMethod    EQU $ff9f
DEF hMenuReturn        EQU $ffa0

DEF hJoypadReleased    EQU $ffa2
DEF hJoypadPressed     EQU $ffa3
DEF hJoypadDown        EQU $ffa4
DEF hJoypadSum         EQU $ffa5
DEF hJoyReleased       EQU $ffa6
DEF hJoyPressed        EQU $ffa7
DEF hJoyDown           EQU $ffa8
DEF hJoyLast           EQU $ffa9
DEF hInMenu            EQU $ffaa

DEF hGraphicStartTile        EQU $ffad
DEF hMoveMon                 EQU $ffae
DEF hMapObjectIndexBuffer    EQU $ffaf
DEF hObjectStructIndexBuffer EQU $ffb0

DEF hConnectionStripLength EQU $ffaf
DEF hConnectedMapWidth EQU $ffb0

DEF hMapBorderBlock     EQU $ffad
DEF hMapWidthPlus6      EQU $ffae

DEF hPredefTemp        EQU $ffb1

; can only use the bytes reserved for hPredefTemp in contained functions, unless you know what you're doing

DEF hLZAddress         EQU $ffb1

; Arithmetic addresses aren't seperate, to simplify
; chain usage. The exact format is (all big endian):
;  hDividend   hProduct
;  hDividend+1 hProduct+1 hQuotient   hMultiplicand
;  hDividend+2 hProduct+2 hQuotient+1 hMultiplicand+1
;  hDividend+3 hProduct+3 hQuotient+2 hMultiplicand+2
;  hDivisor hMultiplier hRemainder
DEF hDividend          EQU $ffb3 ; length in b register, before 'call Divide' (max 4 bytes)
DEF hDivisor           EQU $ffb7 ; 1 byte long
DEF hQuotient          EQU $ffb4 ; result (3 bytes long)
DEF hRemainder         EQU $ffb7

DEF hMultiplicand      EQU $ffb4 ; 3 bytes long
DEF hMultiplier        EQU $ffb7 ; 1 byte long
DEF hProduct           EQU $ffb3 ; result (4 bytes long)

DEF hMathBuffer        EQU $ffb8

DEF hTilesetPalettesHigh   EQU $ffb3

DEF hMetatileCountWidth    EQU $ffb3
DEF hMetatileCountHeight   EQU $ffb4

DEF hCurBitStream               EQU $ffb4
DEF hCurSampVal                 EQU $ffb5
DEF hDEDNR51Mask                EQU $ffb6

DEF hPrintNum1         EQU $ffb3
DEF hPrintNum2         EQU $ffb4
DEF hPrintNum3         EQU $ffb5
DEF hPrintNum4         EQU $ffb6
DEF hPrintNum5         EQU $ffb7
DEF hPrintNum6         EQU $ffb8
DEF hPrintNum7         EQU $ffb9
DEF hPrintNum8         EQU $ffba
DEF hPrintNum9         EQU $ffbb
DEF hPrintNum10        EQU $ffbc

DEF hUsedSpriteIndex   EQU $ffbd
DEF hUsedSpriteTile    EQU $ffbe

DEF hCurSpriteXCoord   EQU $ffbd
DEF hCurSpriteYCoord   EQU $ffbe

DEF hCurSpriteXPixel   EQU $ffbf
DEF hCurSpriteYPixel   EQU $ffc0
DEF hCurSpriteTile     EQU $ffc1
DEF hCurSpriteOAMFlags EQU $ffc2

DEF hMoneyTemp         EQU $ffc3

DEF hLCDCPointer       EQU $ffc6
DEF hLYOverrideStart   EQU $ffc7
DEF hLYOverrideEnd     EQU $ffc8

DEF hSerialReceivedNewData     EQU $ffca
DEF hSerialConnectionStatus    EQU $ffcb
DEF hSerialIgnoringInitialData EQU $ffcc
DEF hSerialSend                EQU $ffcd
DEF hSerialReceive             EQU $ffce

DEF hSCX               EQU $ffcf
DEF hSCY               EQU $ffd0
DEF hWX                EQU $ffd1
DEF hWY                EQU $ffd2
DEF hTilesPerCycle     EQU $ffd3
; 0 - no update
; 1 - VBGMap0 tiles
; 2 - VBGMap0 attributes
; 3 - VBGMap0 tiles
; 4 - VBGMap0 attributes
DEF hBGMapMode         EQU $ffd4
; 0 - top third
; 1 - middle third
; 2 - bottom third
DEF hBGMapHalf         EQU $ffd5
DEF hBGMapAddress      EQU $ffd6

DEF hOAMUpdate         EQU $ffd8
DEF hSPBuffer          EQU $ffd9

DEF hBGMapUpdate       EQU $ffdb
DEF hBGMapTileCount    EQU $ffdc

DEF hMapAnims          EQU $ffde
DEF hTileAnimFrame     EQU $ffdf

DEF hLastTalked        EQU $ffe0

DEF hRandom            EQU $ffe1
DEF hRandomAdd         EQU $ffe1
DEF hRandomSub         EQU $ffe2
DEF hSecondsBackup     EQU $ffe3
DEF hBattleTurn        EQU $ffe4 ; Which trainers turn is it? 0: Player, 1: Opponent Trainer

DEF hCGBPalUpdate      EQU $ffe5
DEF hCGB               EQU $ffe6
DEF hSGB               EQU $ffe7

DEF hDMATransfer       EQU $ffe8

DEF hFarCallSavedA     EQU $ffe9

DEF hDelayFrameLY      EQU $ffea

DEF hClockResetTrigger EQU $ffeb

DEF hLoopCounter       EQU $ffec

DEF hMPState           EQU $ffed
DEF hMPBuffer          EQU $ffee

DEF hDEDCryFlag EQU $ffef
DEF hDEDVBlankMode EQU $fff0

DEF hRequested2bpp         EQU $fff1
DEF hRequested1bpp         EQU $fff2
DEF hRequestedVTileDest    EQU $fff3
DEF hRequestedVTileSource  EQU $fff5

DEF hTmpd              EQU $fff7
DEF hTmpe              EQU $fff8

DEF hFastMusicUpdate   EQU $fff9

DEF hRequestOpaque1bpp EQU $fffb

DEF hTilesetGFXBank EQU $fffc

DEF hLCDTrain		   EQU $fffd

DEF HRAM_END EQU $ffff
