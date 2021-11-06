; Functions to fade the screen in and out.

SetWhitePals::
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

.Function:
	ld hl, wUnknBGPals
	ld a, $ff
	ld bc, 16 palettes
	jp ByteFill

StartBattleFlash::
	eventflagcheck EVENT_SPOOKHOUSE_SHITSBOUTAGODOWN
	jr nz, .skip
	ld a, PALFADE_BG | PALFADE_FLASH | PALFADE_SKIP_LAST
	jr .cont
.skip
	ld a, PALFADE_BG | PALFADE_FLASH
.cont
	ld [wPalFadeMode], a
	ld c, 10
	jr DoFadePalettes

SetBlackPals::
	ld a, BANK(wUnknBGPals)
	call StackCallInWRAMBankA

.Function:
	ld hl, wUnknBGPals
	xor a
	ld bc, 16 palettes
	jp ByteFill

FadeToWhite::
	push bc
	call SetWhitePals
	pop bc
	jr FadePalettes

FadeToBlack::
	push bc
	call SetBlackPals
	pop bc

FadePalettes::
; Fades active palettes in wBGPals/wOBPals to new ones in
; wUnknBGPals/wUnknOBPals in c frames
	xor a
	ld [wPalFadeMode], a
	jr DoFadePalettes

FadeBGPalettes::
	ld a, PALFADE_BG
	ld [wPalFadeMode], a
	jr DoFadePalettes

FadeOBPalettes::
	ld a, PALFADE_OBJ
	ld [wPalFadeMode], a
DoFadePalettes:
	farjp _DoFadePalettes

