; Save/Restore Music code by TPP Anniversary Crystal 251
; https://github.com/TwitchPlaysPokemon/tppcrystal251pub/blob/public/misc/restoremusic.asm

SaveMusic::
	; back up old music state
	ld a, BANK(wSoundEngineBackup)
	call StackCallInWRAMBankA

.Function:
	push hl
	push de
	push bc
	push af

	ld de, wSoundEngineBackup
	ld a, [de]
	and a
	jr nz, HomeRestoreMusic_PopAFBCDEHL
	call DelayFrame

	di
	ld bc, wChannelsEnd - wMusic
	ld hl, wMusic
	rst CopyBytes
	ei

HomeRestoreMusic_PopAFBCDEHL:
	jp _PopAFBCDEHL

RestoreMusic::
	ld a, BANK(wSoundEngineBackup)
	call StackCallInWRAMBankA

.Function:
	push hl
	push de
	push bc
	push af

	ld hl, wSoundEngineBackup
	ld a, [hl]
	and a
	jr nz, .copy
	ld a, $1
	ld [rSVBK], a
	call PlayMapMusic
	jr HomeRestoreMusic_PopAFBCDEHL

.copy
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame

	di
	ld hl, wSoundEngineBackup
	ld bc, wChannelsEnd - wMusic
	ld de, wMusic
	rst CopyBytes
	ei

;	xor a
;	ld [wSoundEngineBackup], a

	jr HomeRestoreMusic_PopAFBCDEHL

DeleteSavedMusic::
	ld a, BANK(wSoundEngineBackup)
	call StackCallInWRAMBankA

.Function:
	xor a
	ld [wSoundEngineBackup], a
	ret
