Facings:
	dw FacingStepDown0      ; FACING_STEP_DOWN_0
	dw FacingStepDown1      ; FACING_STEP_DOWN_1
	dw FacingStepDown2      ; FACING_STEP_DOWN_2
	dw FacingStepDown3      ; FACING_STEP_DOWN_3
	dw FacingStepUp0        ; FACING_STEP_UP_0
	dw FacingStepUp1        ; FACING_STEP_UP_1
	dw FacingStepUp2        ; FACING_STEP_UP_2
	dw FacingStepUp3        ; FACING_STEP_UP_3
	dw FacingStepLeft0      ; FACING_STEP_LEFT_0
	dw FacingStepLeft1      ; FACING_STEP_LEFT_1
	dw FacingStepLeft2      ; FACING_STEP_LEFT_2
	dw FacingStepLeft3      ; FACING_STEP_LEFT_3
	dw FacingStepRight0     ; FACING_STEP_RIGHT_0
	dw FacingStepRight1     ; FACING_STEP_RIGHT_1
	dw FacingStepRight2     ; FACING_STEP_RIGHT_2
	dw FacingStepRight3     ; FACING_STEP_RIGHT_3
	dw FacingFishDown       ; FACING_FISH_DOWN
	dw FacingFishUp         ; FACING_FISH_UP
	dw FacingFishLeft       ; FACING_FISH_LEFT
	dw FacingFishRight      ; FACING_FISH_RIGHT
	dw FacingEmote          ; FACING_EMOTE
	dw FacingShadow         ; FACING_SHADOW
	dw FacingBigDollAsym    ; FACING_BIG_DOLL_ASYM
	dw FacingBigDollSym     ; FACING_BIG_DOLL_SYM
	dw FacingWeirdTree0     ; FACING_WEIRD_TREE_0
	dw FacingWeirdTree1     ; FACING_WEIRD_TREE_1
	dw FacingWeirdTree2     ; FACING_WEIRD_TREE_2
	dw FacingWeirdTree3     ; FACING_WEIRD_TREE_3
	dw FacingBoulderDust1   ; FACING_BOULDER_DUST_1
	dw FacingBoulderDust2   ; FACING_BOULDER_DUST_2
	dw FacingGrass1         ; FACING_GRASS_1
	dw FacingGrass2         ; FACING_GRASS_2
	dw FacingSplash1        ; FACING_SPLASH_1
	dw FacingSplash2        ; FACING_SPLASH_2
	dw FacingCutTree        ; FACING_CUT_TREE
	dw FacingBigGyarados1   ; FACING_BIG_GYARADOS_1
	dw FacingBigGyarados2   ; FACING_BIG_GYARADOS_2
	dw FacingStepDownFlip   ; FACING_STEP_DOWN_FLIP
	dw FacingStepUpFlip     ; FACING_STEP_UP_FLIP
	dw FacingTileDown  		; FACING_TILE_DOWN
	dw FacingTileUp   		; FACING_TILE_UP
	dw FacingTileLeft  		; FACING_TILE_LEFT
	dw FacingTileRight	    ; FACING_TILE_RIGHT
	dw FacingArchTreeDown   ; FACING_ARCH_TREE_DOWN
	dw FacingArchTreeUp     ; FACING_ARCH_TREE_UP
	dw FacingArchTreeLeft   ; FACING_ARCH_TREE_LEFT
	dw FacingArchTreeRight  ; FACING_ARCH_TREE_RIGHT
	dw FacingSailboatTop    ; FACING_SAILBOAT_TOP
	dw FacingSailboatBottom ; FACING_SAILBOAT_BOTTOM
	dw FacingUmbrellaLeft
	dw FacingUmbrellaRight
	dw FacingBoatBob1
	dw FacingBoatBob2
	dw FacingValve1
	dw FacingMallSign1 		; FACING_MALL_SIGN_1
	dw FacingMallSign2 		; FACING_MALL_SIGN_2
	dw FacingMallSign3 		; FACING_MALL_SIGN_3
	dw FacingMallSign4 		; FACING_MALL_SIGN_4
	dw FacingHangarLeft 	; FACING_HANGAR_LEFT
	dw FacingHangarRight 	; FACING_HANGAR_RIGHT
	dw FacingLighthouse1
	dw FacingLighthouse2
	dw FacingLighthouse3
	dw FacingHalfpipe1
	dw FacingHalfpipe2
	dw FacingTopHalf
	dw FacingBottomHalf
	dw FacingSunbeamView1
	dw FacingSunbeamView2
	dw FacingSunbeamView3
	dw FacingSunbeamView4
	dw FacingSunbeamView5
	dw FacingSunbeamView6
	dw FacingCandle1
	dw FacingCandle2
	dw FacingBigMuk
	dw FacingBigMuk2
	dw FacingBigMuk3
	dw FacingStall
	dw FacingBinoculars1
	dw FacingBinoculars2
	dw FacingBalloons
	dw FacingFossilMachine
	dw FacingPCSign
	dw FacingCardTable1
	dw FacingCardTable2
	dw FacingCardTable3
	dw FacingCardTable4
	dw FacingPlaySign
	dw FacingDealerDown
	dw FacingDealerLeft
	dw FacingDealerRight
	dw FacingSailboatTopRight
FacingsEnd: dw 0

NUM_FACINGS EQU (FacingsEnd - Facings) / 2


; Tables used as a reference to transform OAM data.

; Format:
;	db y, x, attributes, tile index

FacingStepDown0:
FacingStepDown2:
FacingWeirdTree0:
FacingWeirdTree2:
	db 4 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 2, $02
	db  8,  8, 2, $03
; 409c

FacingStepDown1:
	db 4 ; #
	db  0,  0, 0, $80
	db  0,  8, 0, $81
	db  8,  0, 2, $82
	db  8,  8, 2, $83
; 40ad

FacingStepDown3:
	db 4 ; #
	db  0,  8, 0 | X_FLIP, $80
	db  0,  0, 0 | X_FLIP, $81
	db  8,  8, 2 | X_FLIP, $82
	db  8,  0, 2 | X_FLIP, $83
; 40be

FacingStepUp0:
FacingStepUp2:
	db 4 ; #
	db  0,  0, 0, $04
	db  0,  8, 0, $05
	db  8,  0, 2, $06
	db  8,  8, 2, $07
; 40cf

FacingStepUp1:
	db 4 ; #
	db  0,  0, 0, $84
	db  0,  8, 0, $85
	db  8,  0, 2, $86
	db  8,  8, 2, $87
; 40e0

FacingStepUp3:
	db 4 ; #
	db  0,  8, 0 | X_FLIP, $84
	db  0,  0, 0 | X_FLIP, $85
	db  8,  8, 2 | X_FLIP, $86
	db  8,  0, 2 | X_FLIP, $87
; 40f1

FacingStepLeft0:
FacingStepLeft2:
	db 4 ; #
	db  0,  0, 0, $08
	db  0,  8, 0, $09
	db  8,  0, 2, $0a
	db  8,  8, 2, $0b
; 4102

FacingStepRight0:
FacingStepRight2:
	db 4 ; #
	db  0,  8, 0 | X_FLIP, $08
	db  0,  0, 0 | X_FLIP, $09
	db  8,  8, 2 | X_FLIP, $0a
	db  8,  0, 2 | X_FLIP, $0b
; 4113

FacingStepLeft1:
FacingStepLeft3:
	db 4 ; #
	db  0,  0, 0, $88
	db  0,  8, 0, $89
	db  8,  0, 2, $8a
	db  8,  8, 2, $8b
; 4124

FacingStepRight1:
FacingStepRight3:
	db 4 ; #
	db  0,  8, 0 | X_FLIP, $88
	db  0,  0, 0 | X_FLIP, $89
	db  8,  8, 2 | X_FLIP, $8a
	db  8,  0, 2 | X_FLIP, $8b
; 4135

FacingFishDown:
	db 5 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 2, $02
	db  8,  8, 2, $03
	db 16,  0, 4, $7c
; 414a

FacingFishUp:
	db 5 ; #
	db  0,  0, 0, $04
	db  0,  8, 0, $05
	db  8,  0, 2, $06
	db  8,  8, 2, $07
	db -8,  0, 4, $7c
; 415f

FacingFishLeft:
	db 5 ; #
	db  0,  0, 0, $08
	db  0,  8, 0, $09
	db  8,  0, 2, $0a
	db  8,  8, 2, $0b
	db  5, -8, 4 | X_FLIP, $7d
; 4174

FacingFishRight:
	db 5 ; #
	db  0,  8, 0 | X_FLIP, $08
	db  0,  0, 0 | X_FLIP, $09
	db  8,  8, 2 | X_FLIP, $0a
	db  8,  0, 2 | X_FLIP, $0b
	db  5, 16, 4, $7d
; 4189

FacingEmote:
	db 4 ; #
	db  0,  0, 4, $78
	db  0,  8, 4, $79
	db  8,  0, 4, $7a
	db  8,  8, 4, $7b
; 419a

FacingShadow:
	db 2 ; #
	db  0,  0, 4, $7c
	db  0,  8, 4 | X_FLIP, $7c
; 41a3

FacingBigDollSym: ; big snorlax or lapras doll
	db 16 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 0, $02
	db  8,  8, 0, $03
	db 16,  0, 0, $04
	db 16,  8, 0, $05
	db 24,  0, 0, $06
	db 24,  8, 0, $07
	db  0, 24, 0 | X_FLIP, $00
	db  0, 16, 0 | X_FLIP, $01
	db  8, 24, 0 | X_FLIP, $02
	db  8, 16, 0 | X_FLIP, $03
	db 16, 24, 0 | X_FLIP, $04
	db 16, 16, 0 | X_FLIP, $05
	db 24, 24, 0 | X_FLIP, $06
	db 24, 16, 0 | X_FLIP, $07
; 41e4

FacingWeirdTree1:
	db 4 ; #
	db  0,  0, 0, $04
	db  0,  8, 0, $05
	db  8,  0, 0, $06
	db  8,  8, 0, $07
; 41f5

FacingWeirdTree3:
	db 4 ; #
	db  0,  8, 0 | X_FLIP, $04
	db  0,  0, 0 | X_FLIP, $05
	db  8,  8, 0 | X_FLIP, $06
	db  8,  0, 0 | X_FLIP, $07
; 4206

FacingBigDollAsym: ; big doll other than snorlax or lapras
	db 14 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 0, $04
	db  8,  8, 0, $05
	db 16,  8, 0, $07
	db 24,  8, 0, $0a
	db  0, 24, 0, $03
	db  0, 16, 0, $02
	db  8, 24, 0 | X_FLIP, $02
	db  8, 16, 0, $06
	db 16, 24, 0, $09
	db 16, 16, 0, $08
	db 24, 24, 0 | X_FLIP, $04
	db 24, 16, 0, $0b
; 423f

FacingBoulderDust1:
	db 4 ; #
	db  0,  0, 4, $7e
	db  0,  8, 4, $7e
	db  8,  0, 4, $7e
	db  8,  8, 4, $7e
; 4250

FacingBoulderDust2:
	db 4 ; #
	db  0,  0, 4, $7f
	db  0,  8, 4, $7f
	db  8,  0, 4, $7f
	db  8,  8, 4, $7f
; 4261

FacingGrass1:
	db 2 ; #
	db  8,  0, 4, $7e
	db  8,  8, 4 | X_FLIP, $7e
; 426a

FacingGrass2:
	db 2 ; #
	db  9, -1, 4, $7e
	db  9,  9, 4 | X_FLIP, $7e
; 4273

FacingSplash1:
	db 2 ; #
	db  8,  0, 4, $7f
	db  8,  8, 4 | X_FLIP, $7f

FacingSplash2:
	db 2 ; #
	db  9, -1, 4, $7f
	db  9,  9, 4 | X_FLIP, $7f

FacingCutTree:
	db 4 ; #
	db  4,  0, 0, $04
	db  4,  8, 0, $05
	db 12,  0, 2, $06
	db 12,  8, 2, $07

FacingBigGyarados1:
	db 16 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 0, $02
	db  8,  8, 0, $03
	db  0, 16, 0, $04
	db  0, 24, 0, $05
	db  8, 16, 0, $06
	db  8, 24, 0, $07
	db 16,  0, 0, $08
	db 16,  8, 0, $09
	db 24,  0, 0, $0a
	db 24,  8, 0, $0b
	db 16, 16, 0, $0c
	db 16, 24, 0, $0d
	db 24, 16, 0, $0e
	db 24, 24, 0, $80

FacingBigGyarados2:
	db 16 ; #
	db  0,  0, 0, $00
	db  0,  8, 0, $01
	db  8,  0, 0, $81
	db  8,  8, 0, $82
	db  0, 16, 0, $83
	db  0, 24, 0, $84
	db  8, 16, 0, $85
	db  8, 24, 0, $86
	db 16,  0, 0, $87
	db 16,  8, 0, $88
	db 24,  0, 0, $89
	db 24,  8, 0, $8a
	db 16, 16, 0, $8b
	db 16, 24, 0, $8c
	db 24, 16, 0, $8d
	db 24, 24, 0, $8e

FacingStepDownFlip:
	db 4 ; #
	db  0,  0, 0 | X_FLIP, $01
	db  0,  8, 0 | X_FLIP, $00
	db  8,  0, 2 | X_FLIP, $03
	db  8,  8, 2 | X_FLIP, $02

FacingStepUpFlip:
	db 4 ; #
	db  0,  0, 0 | X_FLIP, $05
	db  0,  8, 0 | X_FLIP, $04
	db  8,  0, 2 | X_FLIP, $07
	db  8,  8, 2 | X_FLIP, $06

FacingTileDown:
	db 4 ; #
	db  4,  0, 0, $00
	db  4,  8, 0, $01
	db 12,  0, 0, $02
	db 12,  8, 0, $03
	
FacingTileUp:
	db 4 ; #
	db  4,  0, 0, $04
	db  4,  8, 0, $05
	db 12,  0, 0, $06
	db 12,  8, 0, $07
	
FacingTileLeft:
	db 4 ; #
	db  4,  0, 0, $08
	db  4,  8, 0, $09
	db 12,  0, 0, $0a
	db 12,  8, 0, $0b
	
FacingTileRight:
	db 4 ; #
	db  4,  0, 0 | X_FLIP, $09
	db  4,  8, 0 | X_FLIP, $08
	db 12,  0, 0 | X_FLIP, $0b
	db 12,  8, 0 | X_FLIP, $0a

FacingMallSign1:
	db 1 ; #
	db 12, 8, 0, $00
	
FacingMallSign2:
	db 1 ; #
	db 12, 0, 0, $01
	
FacingMallSign3:
	db 1 ; #
	db 4, 8, 0, $00
	
FacingMallSign4:
	db 1 ; #
	db 4, 0, 0, $01
	
FacingHangarLeft:
	db 6 ; #
	db 12,  0, 0, $00
	db 12,  8, 0, $01
	db  4, 16, 0, $04
	db  4, 24, 0, $05
	db  4, 32, 0, $06
	db  4, 40, 0, $07
	
FacingHangarRight:
	db 6 ; #
	db  4,  0, 0, $08
	db  4,  8, 0, $09
	db  4, 16, 0, $0a
	db  4, 24, 0, $0b
	db 12, 32, 0, $02
	db 12, 40, 0, $03
	
FacingLighthouse1:
	db 2 ; #
	db 12,  8, 0 | X_FLIP, $08
	db 12,  -32, 0, $08
	
FacingLighthouse2:
	db 2 ; #
	db 12,  8, 0 | X_FLIP, $09
	db 12,  -32, 0, $09
	
FacingLighthouse3:
	db 4 ; #
	db -36, 0, 0 ,$09
	db -20, 0, 0, $08
	db  -4, 0, 0, $09
	db  12, 0, 0, $08
	
FacingHalfpipe1:
	db 2 ; #
	db -4, 8,  0, $04
	db  4, 8,  0, $05
	
FacingHalfpipe2:
	db 2 ; #
	db -4, 0,  0, $06
	db  4, 0,  0, $07
	
FacingArchTreeDown:
	db 2 ; #
	db 12, 0, 0, $08
	db 12, 8, 0, $0b

FacingArchTreeUp:
	db 2 ; #
	db 12, 0, 0, $0a
	db 12, 8, 0, $09

FacingArchTreeLeft:
	db 1 ; #
	db 12, 8, 0, $09

FacingArchTreeRight:
	db 1 ; #
	db 12, 0, 0, $08

FacingSailboatTop:
	db 5 ; #
	db  4,  0, 0, $80
	db  4,  8, 0, $81
	db 12,  0, 0, $82
	db 12,  8, 0, $83
	db -4,  0, 0, $84

FacingSailboatBottom:
	db 8 ; #
	db  4, 8, 0 | X_FLIP, $00
	db  4, 0, 0 | X_FLIP, $01
	db  12, 8, 0 | X_FLIP, $02
	db  12, 0, 0 | X_FLIP, $03
	db  4,  -8, 0 | X_FLIP, $04
	db  4, -16, 0 | X_FLIP, $05
	db  12, -8, 0 | X_FLIP, $06
	db  12, -16, 0 | X_FLIP, $07
	
FacingSailboatTopRight:
	db 8 ; #
	db  4, -8, 0 | X_FLIP, $80
	db  4,  -16, 0 | X_FLIP, $81
	db  12, -8, 0 | X_FLIP, $82
	db  12,  -16, 0 | X_FLIP, $83
	db -4, -8, 0 | X_FLIP, $84
	db  4, 0, 0 | X_FLIP, $09
	db  12, 8, 0 | X_FLIP, $0a
	db  12, 0, 0 | X_FLIP, $0b

FacingUmbrellaLeft:
	db 5 ; #
	db  0,  8, 0, $08
	db  8,  0, 0, $00
	db  8,  8, 0, $01
	db 16,  0, 0, $02
	db 16,  8, 0, $03

FacingUmbrellaRight:
	db 5 ; #
	db  0,  0, 0, $09
	db  8,  0, 0, $04
	db  8,  8, 0, $05
	db 16,  0, 0, $06
	db 16,  8, 0, $07
	
FacingBoatBob1:
	db 8 ; #
	db  4,  0, 0, $04
	db  4,  8, 0, $05
	db 12,  0, 0, $06
	db 12,  8, 0, $07
	db  4, -8, 0, $01
	db  4, -16, 0, $00
	db 12, -8, 0, $03
	db 12, -16, 0, $02
	
FacingBoatBob2:
	db 8 ; #
	db  5,  0, 0, $04
	db  5,  8, 0, $05
	db 13,  0, 0, $06
	db 13,  8, 0, $07
	db  5, -8, 0, $01
	db  5, -16, 0, $00
	db 13, -8, 0, $03
	db 13, -16, 0, $02
	
FacingValve1:
	db 4 ; #
	db  8,  0, 0, $00
	db  8,  8, 0, $01
	db 16,  0, 0, $02
	db 16,  8, 0, $03
	
FacingTopHalf:
	db 2 ; #
	db  4,  8, 0, $08
	db 12,  8, 0, $09
	
FacingBottomHalf:
	db 2 ; #
	db  4,  0, 0, $0a
	db 12,  0, 0, $0b
	
FacingSunbeamView1:
	db 4 ; #
	db  5,  1, 0, $07
	db  5,  9, 0, $00
	db  5, 16, 0, $01
	db  5, 67, 0, $02
	
FacingSunbeamView2:
	db 9 ; #
	db  4,  8, 0, $03
	db  5, 43, 0, $04
	db  5, 80, 0, $08
	db -28, -48, 0, $0a
	db -20, -48, 0, $0a
	db -12, -48, Y_FLIP | 0, $09
	db -28, 104, 0 | X_FLIP, $0a
	db -20, 104, 0 | X_FLIP, $0a
	db -12, 104, Y_FLIP | X_FLIP, $09
	
FacingSunbeamView3:
	db 2 ; #
	db 12, 16, 0, $05
	db 12, 24, 0, $06
	
FacingSunbeamView4:
	db 9 ; #
	db  4,  8, 0, $00
	db  4, 16, 0, $01
	db  4, 24, 0, $02
	db  4, 32, 0, $03
	db 12,  0, 0, $04
	db 12,  8, 0, $05
	db 12, 16, 0, $06
	db 12, 24, 0, $07
	db 12, 32, 0, $08
	
FacingSunbeamView5:
	db 9 ; #
	db -4,  0, 0, $81
	db -4,  8, 0, $82
	db -4, 16, 0 | X_FLIP, $81
	db  4,  0, 0, $83
	db  4,  8, 0, $84
	db  4, 16, 0 | X_FLIP, $83
	db 12,  0, Y_FLIP | 0, $81
	db 12,  8, Y_FLIP | 0, $82
	db 12, 16, Y_FLIP | X_FLIP, $81
	
FacingSunbeamView6:
	db 13 ; #
	db  4,  8, 0, $00
	db  4, 16, 0, $01
	db  4, 24, 0, $02
	db  4, 32, 0, $03
	db 12,  0, 0, $04
	db 12,  8, 0, $05
	db 12, 16, 0, $06
	db 12, 24, 0, $07
	db 12, 32, 0, $08
	db 20,  0, 0, $09
	db 20,  8, 0, $0a
	db 20, 16, 0, $0b
	db 20, 24, 0, $80

FacingCandle1:
	db 4 ; #
	db  7,  5, 0, $00
	db  7, 13, 0, $01
	db 15,  5, 0, $02
	db 15, 13, 0, $03
	
FacingCandle2:
	db 4 ; #
	db  7,  5, 0, $04
	db  7, 13, 0, $05
	db 15,  5, 0, $06
	db 15, 13, 0, $07
	
FacingBigMuk:
	db 10 ; #
	db  8,  0, 0, $00
	db  8,  8, 0, $01
	db  8,  16, 0, $02
	db  16,  0, 0, $03
	db  16,  8, 0, $04
	db  16,  16, 0, $05
	db  16,  24, 0, $06
	db  24,  0, 0, $07
	db  24,  8, 0, $08
	db  24,  16, 0, $09
	
FacingBigMuk2:
	db 11 ; #
	db  8,  8, 0, $0a
	db  8,  16, 0, $0b
	db  8,  24, 0, $0c
	db  16,  0, 0, $0d
	db  16,  8, 0, $0e
	db  16,  16, 0, $0f
	db  16,  24, 0, $10
	db  24,  0, 0, $80
	db  24,  8, 0, $81
	db  24,  16, 0, $82
	db  24,  24, 0, $83
	
FacingBigMuk3:
	db 11 ; #
	db   8, -2, 0, $84
	db   8,  6, 0, $85
	db   8, 14, 0, $86
	db   8, 22, 0, $87
	db  16, -2, 0, $88
	db  16,  6, 0, $89
	db  16, 14, 0, $8a
	db  16, 22, 0, $8b
	db  24, -2, 0, $8c
	db  24,  6, 0, $8d
	db  24, 14, 0, $8e
	
FacingStall:
	db 1 ; #
	db   4,  0, 0, $05
	
FacingBinoculars1:
	db 2 ; #
	db 12,  0, 0, $06
	db 12,  8, 0, $06
	
FacingBinoculars2:
	db 2 ; #
	db 12,  0, 0, $07
	db 12,  8, 0, $07

FacingBalloons:
	db 4 ; #
	db  4,  0, 0, $80
	db  4,  8, 0, $81
	db 12,  0, 0, $82
	db 12,  8, 0, $83
	
FacingFossilMachine:
	db 1 ; #
	db -1, 12, 0, $04
	
FacingPCSign:
	db 1 ; #
	db 4, 0, 0, $02
	
FacingCardTable1:
	db 1 ; #
	db 4, 0, 0, $00
	
FacingCardTable2:
	db 1 ; #
	db 4, 8, 0 | X_FLIP, $00
	
FacingCardTable3:
	db 1 ; #
	db 12, 0, 0, $01
	
FacingCardTable4:
	db 1 ; #
	db 12, 8, 0 | X_FLIP, $01
	
FacingPlaySign:
	db 2 ; #
	db 4,  0, 0, $02
	db 4,  8, 0, $03
	
FacingDealerDown:
	db 4 ; #
	db  0, -8, 0, $00
	db  0,  0, 0, $01
	db  8, -8, 2, $02
	db  8,  0, 2, $03
	
FacingDealerLeft:
	db 4 ; #
	db  0, -8, 0, $08
	db  0,  0, 0, $09
	db  8, -8, 2, $0a
	db  8,  0, 2, $0b
	
FacingDealerRight:
	db 4 ; #
	db  0, -8, 0 | X_FLIP, $09
	db  0,  0, 0 | X_FLIP, $08
	db  8, -8, 2 | X_FLIP, $0b
	db  8,  0, 2 | X_FLIP, $0a
