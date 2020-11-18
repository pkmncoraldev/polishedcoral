PlaySlowCry: ; fb841
	ld a, [wScriptVar]
	call LoadCryHeader
	ret c

	ld hl, wCryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, -$140
	add hl, bc
	ld a, l
	ld [wCryPitch], a
	ld a, h
	ld [wCryPitch + 1], a
	ld hl, wCryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $60
	add hl, bc
	ld a, l
	ld [wCryLength], a
	ld a, h
	ld [wCryLength + 1], a
	farcall _PlayCryHeader
	jp WaitSFX
; fb877

; Low-pitched fainting cry routine from Pokémon TPP Anniversary Crystal 251
; https://github.com/TwitchPlaysPokemon/tppcrystal251pub/blob/public/main.asm
PlayFaintingCry::
	call PlayFaintingCry2
	jp WaitSFX

PlayFaintingCry2:: ; 37e2
	push hl
	push de
	push bc

	call LoadCryHeader
	jr c, .ded
	ld hl, wCryPitch
	ld a, 90 percent
	call .Multiply
	ld a, [hProduct + 2]
	ld [hli], a
	ld a, [hProduct + 1]
	ld [hli], a

	ld a, 11 percent
	call .Multiply
	ld a, [hProduct + 2]
	add [hl]
	ld [hli], a
	ld a, [hProduct + 1]
	adc [hl]
	ld [hl], a

	farcall _PlayCryHeader
	jp PlayCry_PopBCDEHLOff

.ded
	ld e, 1
	call PlayDEDCry
	jp PlayCry_PopBCDEHLOff

.Multiply
	ld [hMultiplier], a
	ld a, [hli]
	ld [hMultiplicand + 2], a
	ld a, [hld]
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand], a
	ld [hProduct], a
	jp Multiply
