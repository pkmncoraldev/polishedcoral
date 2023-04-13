PorygonPreEncounterMon::
	ld a, [wWalkingOnBridge]
	inc a
	ld [wWalkingOnBridge], a
	ld a, [wBattleType]
	ld [wTileDown], a
	xor a
	ld [wBattleEnded], a
	call WaitSFX
	ld a, [wWalkingOnBridge]
	cp 1
	jr z, .first_or_last_time
	cp 5
	jr nz, .others
.first_or_last_time
	ld c, 128
	call DelayFrames
	call DeterminePorygonEncounterMon
	ret
.others
	ld c, 2
	call DelayFrames
	call DeterminePorygonEncounterMon
	ret
	
PorygonPreEncounterMon2::
	call LoadTileMapToTempTileMap	
	
	ld a, [wWalkingOnBridge]
	cp 1
	jr z, .first_or_last_time
	cp 5
	jr nz, .others
.first_or_last_time
	ld c, 50
	call DelayFrames
	ld de, MUSIC_WILD_BATTLE_2
	call PlayMusic
	ld hl, QuestionAppearedText
	call StdBattleTextBox
	ld c, 100
	jp DelayFrames
.others
	ld hl, WildPokemonAppearedText
	call StdBattleTextBox
	ld c, 50
	jp DelayFrames
	
PorygonEncounter::
	ld a, [wWalkingOnBridge]
	inc a
	ld [wWalkingOnBridge], a
	ld a, [wBattleType]
	ld [wTileDown], a
	xor a
	ld [wBattleEnded], a
	call WaitSFX
	ld c, 120
	call DelayFrames
	ld a, 50	;porygon level
	ld [wCurPartyLevel], a
	ld a, PORYGON
	ld [wTempEnemyMonSpecies], a
	ld [wCurPartySpecies], a
	ret
	
PorygonEncounter2::
	call LoadTileMapToTempTileMap	
	ld hl, RevealedItselfText
	call StdBattleTextBox
	
	ld de, MUSIC_WILD_BOSS_BATTLE
	call PlayMusic
	call StartBattleFlash
	ld c, 2
	call DelayFrames
	call StartBattleFlash
	ld c, 2
	call DelayFrames
	call StartBattleFlash
	ld c, 90
	jp DelayFrames

DeterminePorygonEncounterMon:
	ld a, [wWalkingOnBridge]
	cp 1
	jr z, .mon2
	cp 2
	jr z, .mon3
	cp 3
	jr z, .mon4
	cp 4
	jr z, .mon5
.mon2
	ld a, RATTATA
	ld [wTempEnemyMonSpecies], a
	ld [wCurPartySpecies], a
	ld a, 30
	ld [wCurPartyLevel], a
	ret
.mon3
	ld a, RATTATA
	ld [wTempEnemyMonSpecies], a
	ld [wCurPartySpecies], a
	ld a, 35
	ld [wCurPartyLevel], a
	ret
.mon4
	ld a, RATTATA
	ld [wTempEnemyMonSpecies], a
	ld [wCurPartySpecies], a
	ld a, 40
	ld [wCurPartyLevel], a
	ret
.mon5
	ld a, RATTATA
	ld [wTempEnemyMonSpecies], a
	ld [wCurPartySpecies], a
	ld a, 45
	ld [wCurPartyLevel], a
	ret

	