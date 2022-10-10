INCLUDE "constants.asm"


SECTION "Credits", ROMX

	const_def
	const CORAL
	const BY
	const CORALDEV
	const POLISHED
	const RANGI
	const FIQ
	const PROGRAMMING
	const PFERO
	const LUCKY
	const ADDPROGRAMMING
	const CHAMBER
	const GRAPHICS
	const NUUK
	const ADDGRAPHICS
	const STARGAZAAR
	const AHAB
	const LUNA
	const DAZ
	const ROOL_SOUR
	const PIA_SMALLS
	const PIK_VARMINTZ
	const QUIDOMEE
	const BATTLEANIM
	const SOUR
	const MOVESETS
	const DENIM
	const MENUSPRITES
	const MENU1
	const MENU2
	const MENU3
	const MENU4
	const MENU5
	const MENU6
	const MENU7
	const MENU8
	const MENU9
	const SPECIALTHANKS
	const SPECIAL1
	const SPECIAL2
	const SPECIAL3
	const SPECIAL4
	const SPECIAL5
	const ORIGINALGAME
	const COPYRIGHT
	const THANKS

	const_def -7
	const CREDITS_THEEND
	const CREDITS_WAIT2
	const CREDITS_MUSIC
	const CREDITS_CLEAR
	const CREDITS_SCENE
	const CREDITS_WAIT
	const CREDITS_END


SetCreditsSpawn::
	ld a, b
	ld [wCreditsSpawn], a
	ret


Credits:: ; 109847
	xor a
	bit 6, b ; Hall Of Fame
	jr z, .okay
	ld a, $40
.okay
	ld [wJumptableIndex], a

	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites

	ld hl, wCreditsFaux2bpp
	ld c, $80
	lb de, %11111111, %00000000 ; solid light gray hue

.load_loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .load_loop

	ld de, CreditsBorderGFX
	ld hl, VTiles2 tile $20
	lb bc, BANK(CreditsBorderGFX), $09
	call Request2bpp

	ld de, CopyrightGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(CopyrightGFX), $1d
	call Request2bpp

	ld de, TheEndGFX
	ld hl, VTiles2 tile $40
	lb bc, BANK(TheEndGFX), $10
	call Request2bpp

	ld a, $ff
	ld [wCreditsBorderFrame], a
	xor a
	ld [wCreditsBorderMon], a

	call Credits_LoadBorderGFX
	ld e, l
	ld d, h
	ld hl, VTiles2
	lb bc, BANK(CreditsMonsGFX), 16
	call Request2bpp

	call ConstructCreditsTilemap
	xor a
	ld [wCreditsLYOverride], a

	ld hl, wLYOverrides
	ld bc, $100
	xor a
	call ByteFill

	ld a, rSCX & $ff
	ld [hLCDCPointer], a

	ld hl, rIE
	set LCD_STAT, [hl]
	call GetCreditsPalette
	call SetPalettes
	ld a, [hVBlank]
	push af
	ld a, $5
	ld [hVBlank], a
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hBGMapMode], a
	ld [wCreditsPos], a
	ld [wCreditsPos+1], a
	ld [wCreditsTimer], a

.execution_loop
	call Credits_HandleBButton
	call Credits_HandleAButton
	jr nz, .exit_credits

	call Credits_Jumptable
	call DelayFrame
	jr .execution_loop

.exit_credits
	call ClearBGPalettes
	xor a
	ld [hLCDCPointer], a
	ld [hBGMapAddress], a
	ld hl, rIE
	res LCD_STAT, [hl]
	pop af
	ld [hVBlank], a
	pop af
	ld [rSVBK], a
	ret
; 1098fd

Credits_HandleAButton: ; 1098fd
	ld a, [hJoypadDown]
	and A_BUTTON
	ret z
	ld a, [wJumptableIndex]
	bit 7, a
	ret
; 109908

Credits_HandleBButton: ; 109908
	ld a, [hJoypadDown]
	and B_BUTTON
	ret z
	ld a, [wJumptableIndex]
	bit 6, a
	ret z
	ld hl, wCreditsPos
	ld a, [hli]
	cp $d
	jr nc, .okay
	ld a, [hli]
	and a
	ret z
.okay
	ld hl, wCreditsTimer
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
; 109926

Credits_Jumptable: ; 109926
	ld a, [wJumptableIndex]
	and $f
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 109937


.Jumptable: ; 109937 (42:5937)

	dw ParseCredits
	dw Credits_Next
	dw Credits_Next
	dw Credits_PrepBGMapUpdate
	dw Credits_UpdateGFXRequestPath
	dw Credits_RequestGFX
	dw Credits_LYOverride
	dw Credits_Next
	dw Credits_Next
	dw Credits_Next
	dw Credits_UpdateGFXRequestPath
	dw Credits_RequestGFX
	dw Credits_LoopBack


Credits_Next: ; 109951 (42:5951)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Credits_LoopBack: ; 109956 (42:5956)
	ld hl, wJumptableIndex
	ld a, [hl]
	and $f0
	ld [hl], a
	ret

Credits_PrepBGMapUpdate: ; 10995e (42:595e)
	xor a
	ld [hBGMapMode], a
	jp Credits_Next

Credits_UpdateGFXRequestPath: ; 109964 (42:5964)
	call Credits_LoadBorderGFX
	ld a, l
	ld [hRequestedVTileSource], a
	ld a, h
	ld [hRequestedVTileSource + 1], a
	ld a, VTiles2 % $100
	ld [hRequestedVTileDest], a
	ld a, VTiles2 / $100
	ld [hRequestedVTileDest + 1], a
	; fallthrough

Credits_RequestGFX: ; 10997b (42:597b)
	xor a
	ld [hBGMapMode], a
	ld a, $8
	ld [hRequested2bpp], a
	jp Credits_Next

Credits_LYOverride: ; 109986 (42:5986)
	jp Credits_Next
	ld a, [rLY]
	cp $30
	jr c, Credits_LYOverride
	ld a, [wCreditsLYOverride]
	dec a
	dec a
	ld [wCreditsLYOverride], a
	ld hl, wLYOverrides + $1f
	call .Fill
	ld hl, wLYOverrides + $87
	call .Fill
	jp Credits_Next

.Fill: ; 1099a3 (42:59a3)
	ld c, $8
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 1099aa


ParseCredits: ; 1099aa
	ld hl, wJumptableIndex
	bit 7, [hl]
	jp nz, .done

; Wait until the timer has run out to parse the next command.
	ld hl, wCreditsTimer
	ld a, [hl]
	and a
	jr z, .parse

; One tick has passed.
	dec [hl]
	jp .done

.parse
; First, let's clear the current text display,
; starting from line 5.
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill

; Then read the script.

.loop
	call .get

; Commands:
	cp CREDITS_END
	jp z, .end
	cp CREDITS_WAIT
	jp z, .wait
	cp CREDITS_SCENE
	jr z, .scene
	cp CREDITS_CLEAR
	jr z, .clear
	cp CREDITS_MUSIC
	jr z, .music
	cp CREDITS_WAIT2
	jr z, .wait2
	cp CREDITS_THEEND
	jr z, .theend

; If it's not a command, it's a string identifier.

	push af
	ld e, a
	ld d, 0
	ld hl, CreditsStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af

; Strings spanning multiple lines have special cases.

	cp COPYRIGHT
	jr z, .copyright

	cp CORAL
	jr c, .coral

; The rest start from line 6.

	hlcoord 0, 2
	jr .print

.copyright
	hlcoord 2, 2
	jr .print

.coral
	hlcoord 0, 2

.print
; Print strings spaced every two lines.
	call .get
	ld bc, 20 * 2
	rst AddNTimes
	call PlaceString
	jr .loop

.theend
; Display "The End" graphic.
	call Credits_TheEnd
	jr .loop

.scene
; Update the scene number and corresponding palette.

	ld a, [wCreditsSpawn]
	cp SPAWN_LEAF
	jr z, .leaf_scene
	call .get
	ld [wCreditsBorderMon], a ; scene
	jr .got_scene
.leaf_scene
	call .get
	add 4
	ld [wCreditsBorderMon], a ; scene
.got_scene
	xor a
	ld [wCreditsBorderFrame], a ; frame
	call GetCreditsPalette
	call SetPalettes ; update hw pal registers
	jr .loop

.clear
; Clear the banner.
	ld a, $ff
	ld [wCreditsBorderFrame], a ; frame
	jp .loop

.music
; Play the credits music.
	ld de, MUSIC_CREDITS
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	call PlayMusic
	jp .loop

.wait2
; Wait for some amount of ticks.
	call .get
	ld [wCreditsTimer], a
	jr .done

.wait
; Wait for some amount of ticks, and do something else.
	call .get
	ld [wCreditsTimer], a

	xor a
	ld [hBGMapHalf], a
	ld a, 1
	ld [hBGMapMode], a

.done
	jp Credits_Next

.end
; Stop execution.
	ld hl, wJumptableIndex
	set 7, [hl]
	ld a, 32
	ld [wMusicFade], a
	ld a, MUSIC_POST_CREDITS % $100
	ld [wMusicFadeID], a
	ld a, MUSIC_POST_CREDITS / $100
	ld [wMusicFadeIDHi], a
	ret

.get
; Get byte wCreditsPos from CreditsScript
	push hl
	push de
	ld a, [wCreditsPos]
	ld e, a
	ld a, [wCreditsPos+1]
	ld d, a
	ld hl, CreditsScript
	add hl, de

	inc de
	ld a, e
	ld [wCreditsPos], a
	ld a, d
	ld [wCreditsPos+1], a
	ld a, [hl]
	pop de
	pop hl
	ret
; 109a95


ConstructCreditsTilemap: ; 109a95 (42:5a95)
	xor a
	ld [hBGMapMode], a
	ld a, $c
	ld [hBGMapAddress], a

	ld a, $28
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill

;	ld a, $7f
;	hlcoord 0, 2
;	ld bc, (SCREEN_HEIGHT - 4) * SCREEN_WIDTH
;	call ByteFill

;	hlcoord 0, 2
;	ld a, $24
;	call DrawCreditsBorder

;	hlcoord 0, 17
;	ld a, $20
;	call DrawCreditsBorder

	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill

;	hlcoord 0, 2, wAttrMap
;	ld bc, SCREEN_WIDTH
;	ld a, $1
;	call ByteFill

;	hlcoord 0, 5, wAttrMap
;	ld bc, 12 * SCREEN_WIDTH
;	ld a, $2
;	call ByteFill

;	hlcoord 0, 17, wAttrMap
;	ld bc, SCREEN_WIDTH
;	ld a, $1
;	call ByteFill

	call ApplyAttrAndTilemapInVBlank
	xor a
	ld [hBGMapMode], a
	ld [hBGMapAddress], a
	hlcoord 0, 0
	call .InitTopPortion
	jp ApplyAttrAndTilemapInVBlank

.InitTopPortion: ; 109aff (42:5aff)
	ld b, 5
.outer_loop
	push hl
	ld de, SCREEN_WIDTH - 3
	ld c, 4
	xor a
.inner_loop
rept 3
	ld [hli], a
	inc a
endr
	ld [hl], a
	inc a
	add hl, de
	dec c
	jr nz, .inner_loop
	pop hl
rept 4
	inc hl
endr
	dec b
	jr nz, .outer_loop
	ret

DrawCreditsBorder: ; 109b1d (42:5b1d)
	ret
	ld c, SCREEN_WIDTH / 4
.loop
	push af
rept 3
	ld [hli], a
	inc a
endr
	ld [hli], a
	pop af
	dec c
	jr nz, .loop
	ret

GetCreditsPalette: ; 109b2c
	call .GetPalAddress

	push hl
	xor a
	call .UpdatePals
	pop hl
	ret

.GetPalAddress:
; Each set of palette data is 24 bytes long.
	ld a, [wCreditsBorderMon] ; scene
	and 7
	add a
	add a
	add a
	ld e, a
	ld d, 0
	ld hl, CreditsPalettes
	add hl, de
	add hl, de
	add hl, de
	ret

.UpdatePals:
; Update the first three colors in both palette buffers.

	push af
	push hl
	add wUnknBGPals % $100
	ld e, a
	ld a, 0 ; not xor a; preserve carry flag?
	adc wUnknBGPals / $100
	ld d, a
	ld bc, 24
	rst CopyBytes

	pop hl
	pop af
	add wBGPals % $100
	ld e, a
	ld a, 0 ; not xor a; preserve carry flag?
	adc wBGPals / $100
	ld d, a
	ld bc, 24
	rst CopyBytes
	ret


CreditsPalettes:

if !DEF(MONOCHROME)
; Pichu
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Sentret
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Ditto
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Togepi
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Smoochum
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Munchlax
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Elekid
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

; Bellossom
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 31, 31, 31
else
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR

	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
	MONOCHROME_RGB_FOUR
endc
; 109bca

Credits_LoadBorderGFX: ; 109bca (42:5bca)
	ld hl, wCreditsBorderFrame
	ld a, [hl]
	cp $ff
	jr z, .init

	and 7
	ld e, a
	inc a
	and 7
	ld [hl], a
	ld a, [wCreditsBorderMon]
	and 7
	add a
	add a
	add a
	add e
	add a
	ld e, a
	ld d, 0
	ld hl, .Frames
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.init
	ld hl, wCreditsFaux2bpp
	ret
; 109bf1 (42:5bf1)

.Frames: ; 109bf1
	dw CreditsPichuGFX
	dw CreditsPichuGFX     + 16 tiles
	dw CreditsPichuGFX     + 32 tiles
	dw CreditsPichuGFX     + 48 tiles
	dw CreditsPichuGFX
	dw CreditsPichuGFX     + 16 tiles
	dw CreditsPichuGFX     + 32 tiles
	dw CreditsPichuGFX     + 48 tiles
	dw CreditsSentretGFX
	dw CreditsSentretGFX
	dw CreditsSentretGFX   + 16 tiles
	dw CreditsSentretGFX   + 16 tiles
	dw CreditsSentretGFX   + 32 tiles
	dw CreditsSentretGFX   + 32 tiles
	dw CreditsSentretGFX   + 48 tiles
	dw CreditsSentretGFX   + 48 tiles
	dw CreditsDittoGFX
	dw CreditsDittoGFX     + 16 tiles
	dw CreditsDittoGFX     + 32 tiles
	dw CreditsDittoGFX     + 48 tiles
	dw CreditsDittoGFX
	dw CreditsDittoGFX     + 16 tiles
	dw CreditsDittoGFX     + 32 tiles
	dw CreditsDittoGFX     + 48 tiles
	dw CreditsTogepiGFX
	dw CreditsTogepiGFX
	dw CreditsTogepiGFX    + 16 tiles
	dw CreditsTogepiGFX    + 16 tiles
	dw CreditsTogepiGFX    + 32 tiles
	dw CreditsTogepiGFX    + 32 tiles
	dw CreditsTogepiGFX    + 48 tiles
	dw CreditsTogepiGFX    + 48 tiles
	dw CreditsSmoochumGFX
	dw CreditsSmoochumGFX  + 16 tiles
	dw CreditsSmoochumGFX  + 32 tiles
	dw CreditsSmoochumGFX  + 48 tiles
	dw CreditsSmoochumGFX
	dw CreditsSmoochumGFX  + 16 tiles
	dw CreditsSmoochumGFX  + 32 tiles
	dw CreditsSmoochumGFX  + 48 tiles
	dw CreditsMunchlaxGFX
	dw CreditsMunchlaxGFX
	dw CreditsMunchlaxGFX  + 16 tiles
	dw CreditsMunchlaxGFX  + 16 tiles
	dw CreditsMunchlaxGFX  + 32 tiles
	dw CreditsMunchlaxGFX  + 32 tiles
	dw CreditsMunchlaxGFX  + 48 tiles
	dw CreditsMunchlaxGFX  + 48 tiles
	dw CreditsElekidGFX
	dw CreditsElekidGFX
	dw CreditsElekidGFX    + 16 tiles
	dw CreditsElekidGFX    + 16 tiles
	dw CreditsElekidGFX    + 32 tiles
	dw CreditsElekidGFX    + 32 tiles
	dw CreditsElekidGFX    + 48 tiles
	dw CreditsElekidGFX    + 48 tiles
	dw CreditsBellossomGFX
	dw CreditsBellossomGFX
	dw CreditsBellossomGFX + 16 tiles
	dw CreditsBellossomGFX + 16 tiles
	dw CreditsBellossomGFX + 32 tiles
	dw CreditsBellossomGFX + 32 tiles
	dw CreditsBellossomGFX + 48 tiles
	dw CreditsBellossomGFX + 48 tiles
; 109c11

Credits_TheEnd: ; 109c11 (42:5c11)
	ld a, $40
	hlcoord 6, 5
	call .Load
	hlcoord 6, 6
.Load: ; 109c1c (42:5c1c)
	ld c, 8
.loop
	ld [hli], a
	inc a
	dec c
	jr nz, .loop
	ret
; 109c24 (42:5c24)


CreditsBorderGFX:    INCBIN "gfx/credits/border.2bpp"

CreditsMonsGFX:
CreditsPichuGFX:     INCBIN "gfx/credits/pichu.2bpp"
CreditsSentretGFX:   INCBIN "gfx/credits/sentret.2bpp"
CreditsDittoGFX:     INCBIN "gfx/credits/ditto.2bpp"
CreditsTogepiGFX:    INCBIN "gfx/credits/togepi.2bpp"
CreditsSmoochumGFX:  INCBIN "gfx/credits/smoochum.2bpp"
CreditsMunchlaxGFX:  INCBIN "gfx/credits/munchlax.2bpp"
CreditsElekidGFX:    INCBIN "gfx/credits/elekid.2bpp"
CreditsBellossomGFX: INCBIN "gfx/credits/bellossom.2bpp"

TheEndGFX::          INCBIN "gfx/credits/theend.2bpp"


CreditsScript: ; 10acb4

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                CORAL, 1

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 0 ; Pichu or Smoochum

	db                 BY, 2
	db           CORALDEV, 3

	db CREDITS_WAIT, 9

	db           POLISHED, 1
	db              RANGI, 3
	db                FIQ, 4

	db CREDITS_WAIT, 9
	
	db		  PROGRAMMING, 1
	db           CORALDEV, 3
	db              PFERO, 4
	db              LUCKY, 5
	
	db CREDITS_WAIT, 9
	
	db	   ADDPROGRAMMING, 1
	db              RANGI, 3
	db                FIQ, 4
	db            CHAMBER, 5

	db CREDITS_WAIT, 9
	
	db	   		 GRAPHICS, 1
	db               NUUK, 3
	db           CORALDEV, 4

	db CREDITS_WAIT, 9
	
	db	       ADDGRAPHICS, 0
	db 			STARGAZAAR, 2
	db 				  AHAB, 3
	db 				  LUNA, 4
	db 				   DAZ, 5
	
	db CREDITS_WAIT, 9
	
	db	       ADDGRAPHICS, 0
	db 			 ROOL_SOUR, 2
	db 			PIA_SMALLS, 3
	db 	  	  PIK_VARMINTZ, 4
	db			  QUIDOMEE, 5
	
	db CREDITS_WAIT, 12
	
	db			BATTLEANIM, 2
	db 				  SOUR, 4
	
	db CREDITS_WAIT, 9
	
	db 			  MOVESETS, 1
	db 				  SOUR, 3
	db 				 DENIM, 4
	
	db CREDITS_WAIT, 9
	
	db 		   MENUSPRITES, 0
	db 				 MENU1, 2
	db 				 MENU2, 3
	db 				 MENU3, 4
	db 				 MENU4, 5
	db 				 MENU5, 6
	
	db CREDITS_WAIT, 12
	
	db 		   MENUSPRITES, 0
	db 				 MENU6, 2
	db 				 MENU7, 3
	db 				 MENU8, 4
	db 				 MENU9, 5
	
	db CREDITS_WAIT, 12
	
	db 		 SPECIALTHANKS, 0
	db 			  SPECIAL1, 2
	db 			  SPECIAL2, 3
	db 			  SPECIAL3, 4
	db 			  SPECIAL4, 5
	db 			  SPECIAL5, 6
	
	db CREDITS_WAIT, 12

	db 		   ORIGINALGAME, 2
	db            COPYRIGHT, 3

	db CREDITS_WAIT, 9

; Display "The End" graphic.
	db 				 THANKS, 4
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
; 10ae13


CreditsStrings:
	dw .coral
	dw .by
	dw .coraldev
	dw .polished
	dw .rangi
	dw .fiq
	dw .programming
	dw .pfero
	dw .lucky
	dw .addprogramming
	dw .chamber
	dw .graphics
	dw .nuuk
	dw .addgraphics
	dw .stargazaar
	dw .ahab
	dw .luna
	dw .daz
	dw .rool_sour
	dw .pia_smalls
	dw .pik_varmintz
	dw .quidomee
	dw .battleanim
	dw .sour
	dw .movesets
	dw .denim
	dw .menusprites
	dw .menu1
	dw .menu2
	dw .menu3
	dw .menu4
	dw .menu5
	dw .menu6
	dw .menu7
	dw .menu8
	dw .menu9
	dw .specialthanks
	dw .special1
	dw .special2
	dw .special3
	dw .special4
	dw .special5
	dw .originalgame
	dw .Copyright
	dw .thanks
	

.coral:			  db "      #MON"
				next "   CORAL VERSION"
				next "       DEMO 3@"

.by:		 	  db "         By@"
.coraldev:		  db "      coraldev@"

.polished:		  db "  Polished Engine@"
.rangi:			  db "        Rangi@"
.fiq:			  db "         FIQ@"

.programming:	  db "     Programing@"
.pfero:			  db "        Pfero@"
.lucky:			  db "   luckytyphlosion@"

.addprogramming:  db "   Add. Programing@"
.chamber:		  db "      Chamber",$01,"@"

.graphics:		  db "      Graphics@"
.nuuk:			  db "        Nuuk@"

.addgraphics:	  db "   Add. Graphics@"
.stargazaar:	  db "    Star★Gazaar@"
.ahab:			  db "    Ahab Studios@"
.luna:			  db "   Luna Maddalena@"
.daz:			  db "        Daz@"

.rool_sour:		  db " Rool     SourApple@"
.pia_smalls:	  db " PiaCRT   Smalls@"
.pik_varmintz:	  db " Pik      Varmintz@"
.quidomee:		  db " Quidomee@"

.battleanim:	  db "  Battle Animation@"
.sour:			  db "      SourApple@"

.movesets:		  db "  Moves and Balance@"
.denim:			  db "      BigDenim@"

.menusprites:	  db "    Menu Sprites@"
.menu1:			  db " Gargoyle   Molk@"
.menu2:			  db " Kedoshim   Goose@"
.menu3:			  db " Sadfish    Snak@"
.menu4:			  db " Turner     EeVeeEe@"
.menu5:			  db " Soloo993   Ayinai@"

.menu6:			  db "  CuervoTerras@"
.menu7:			  db "  Megaman-Omega@"
.menu8:			  db "  peach-n-key@"
.menu9:			  db "  Internet",$01,"Goblin@"

.specialthanks:	  db "    Add.  Thanks@"
.special1:		  db "   FroggestSpirit@"
.special2:		  db "    StarMagician@"
.special3:		  db "       gmerc@"
.special4:		  db "   SheerSt   Padz@"
.special5:		  db "      /yehaw/@"

.originalgame:	  db "   Original Game:@"

.Copyright:
	;    (C) 1  9  9  5 - 2  0  0  1     N  i  n  t  e  n  d  o
	db   $60,$61,$62,$63,$64,$65,$66, $67, $68, $69, $6a, $6b, $6c
	;    (C) 1  9  9  5 - 2  0  0  1    C  r  e  a  t  u  r  e  s      i  n  c .
	next $60,$61,$62,$63,$64,$65,$66, $6d, $6e, $6f, $70, $71, $72,  $7a, $7b, $7c
	;    (C) 1  9  9  5 - 2  0  0  1  G   A   M   E   F   R   E   A   K     i  n  c .
	next $60,$61,$62,$63,$64,$65,$66, $73, $74, $75, $76, $77, $78, $79,  $7a, $7b, $7c
	db "@"

.thanks:		  db "     Thanks for"
				next "      playing!@"  
