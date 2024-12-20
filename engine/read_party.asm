ReadTrainerParty: ; 39771
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz ; populated elsewhere

	ld hl, wOTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, wOTPartyMons
	ld bc, wOTPartyMonsEnd - wOTPartyMons
	xor a
	call ByteFill

	call FindTrainerData

	call GetNextTrainerDataByte
	ld [wOtherTrainerType], a

.loop2
; level
	call GetNextTrainerDataByte
	cp $ff
	ret z
	push af
	ld a, [wOtherTrainerClass]
	cp MINA
	jr nz, .not_mina
	pop af
	call CheckMinaMons
	jr z, .loop2
	call MinaLevels
	jr .mina_done
.not_mina
	pop af
.mina_done
	ld [wCurPartyLevel], a

; species
	call GetNextTrainerDataByte
	ld [wCurPartySpecies], a

	ld a, OTPARTYMON
	ld [wMonType], a

	push hl
	predef TryAddMonToParty
	pop hl

; item?
	ld a, [wOtherTrainerType]
	bit TRNTYPE_ITEM, a
	jr z, .not_item

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	ld [de], a

.not_item
; EVs?
	ld a, [wOtherTrainerType]
	bit TRNTYPE_EVS, a
	jr z, .not_evs
	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1EVs
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	push hl
	ld h, d
	ld l, e
rept 6
	ld [hli], a
endr
	pop hl

.not_evs
; DVs?
	ld a, [wOtherTrainerType]
	bit TRNTYPE_DVS, a
	jr z, .not_dvs

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl

	; when reading DVs, $00 means $ff, since $ff is the end-of-trainer marker
	call GetNextTrainerDataByte
	and a
	jr nz, .dv1_ok
	ld a, $ff
.dv1_ok
	ld [de], a
	inc de
	call GetNextTrainerDataByte
	and a
	jr nz, .dv2_ok
	ld a, $ff
.dv2_ok
	ld [de], a
	inc de
	call GetNextTrainerDataByte
	and a
	jr nz, .dv3_ok
	ld a, $ff
.dv3_ok
	ld [de], a

.not_dvs
; personality?
	ld a, [wOtherTrainerType]
	bit TRNTYPE_PERSONALITY, a
	jr z, .not_personality

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Personality
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl

	call GetNextTrainerDataByte
	ld [de], a
	inc de
	call GetNextTrainerDataByte
	ld [de], a

.not_personality
; nickname?
	ld a, [wOtherTrainerType]
	bit TRNTYPE_NICKNAME, a
	jr z, .not_nickname

	push de
	ld de, wStringBuffer2
.copy
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, wStringBuffer2
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	pop hl
	pop de

.not_nickname
; moves?
	ld a, [wOtherTrainerType]
	bit TRNTYPE_MOVES, a
	jp z, .not_moves

	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	call GetNextTrainerDataByte
	ld [de], a
	inc de
	cp RETURN
	jr z, .return
	cp GYRO_BALL
	jr nz, .done_special_moves

	; Set speed EVs and IVs to 0
	push hl
	push de
	push bc
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1SpdEV
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld [hl], 0
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1DefSpdDV
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	; $f1, not $f0, to leave Hidden Power type alone
	and $f1
	ld [hl], a
	pop bc
	pop de
	pop hl
	jr .done_special_moves

.return
	; Maximize happiness
	push hl
	push de
	push bc
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld [hl], 255
	pop bc
	pop de
	pop hl

.done_special_moves
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp
	pop hl

.not_moves
	; custom DVs or nature may alter stats
	ld a, [wOtherTrainerType]
	and TRAINERTYPE_EVS | TRAINERTYPE_DVS | TRAINERTYPE_PERSONALITY
	jr z, .no_stat_recalc
	push hl
	ld a, [wOTPartyCount]
	dec a
	ld hl, wOTPartyMon1MaxHP
	ld bc, PARTYMON_STRUCT_LENGTH
	push af
	rst AddNTimes
	pop af
	push hl
	ld hl, wOTPartyMon1EVs - 1
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	pop de
	ld b, TRUE
	push de
	predef CalcPkmnStats
	pop hl
	inc hl
	ld c, [hl]
	dec hl
	ld b, [hl]
	dec hl
	ld [hl], c
	dec hl
	ld [hl], b
	pop hl
.no_stat_recalc
	jp .loop2

Battle_GetTrainerName:: ; 39939
	ld a, [wInBattleTowerBattle]
	bit 0, a
	ld hl, wOTPlayerName
	ld a, BANK(Battle_GetTrainerName) ; make FarCopyBytes act like CopyBytes
	ld [wTrainerGroupBank], a
	jp nz, CopyTrainerName

	ld a, [wOtherTrainerID]
	ld b, a
	ld a, [wOtherTrainerClass]
	ld c, a

GetTrainerName:: ; 3994c
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	call GetNextTrainerDataByte
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName: ; 39984
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	ld a, [wTrainerGroupBank]
	call FarCopyBytes
	pop de
	ret
; 39990

SetTrainerBattleLevel:
	ld a, 255
	ld [wCurPartyLevel], a

	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	call FindTrainerData

	inc hl
	call GetNextTrainerDataByte
	ld [wCurPartyLevel], a
	ret

FindTrainerData:
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wTrainerGroupBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop1
	call GetNextTrainerDataByte
	cp $ff
	jr nz, .loop1
	jr .skip_trainer
.got_trainer

.skip_name
	call GetNextTrainerDataByte
	cp "@"
	jr nz, .skip_name
	ret

GetNextTrainerDataByte:
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret
	
CheckMinaMons:
	cp MINA_MON_ROUTE_6
	jp z, .mina_mon_1
	cp MINA_MON_ROUTE_11
	jp z, .mina_mon_2
	cp MINA_MON_RADIANT_FIELD
	jp z, .mina_mon_3
	cp MINA_MON_ROUTE_29
	jp z, .mina_mon_4
	cp MINA_MON_ROUTE_10
	jp z, .mina_mon_5
	ret
.mina_mon_1
	push hl
	ld hl, wMinaFlags
	bit 1, [hl] ; ENGINE_MINA_ROUTE_6
	jr nz, .do_mina_mon
	jr .next_mina_mon
.mina_mon_2
	push hl
	ld hl, wMinaFlags
	bit 2, [hl] ; ENGINE_MINA_ROUTE_11
	jr nz, .do_mina_mon
	jr .next_mina_mon
.mina_mon_3
	push hl
	ld hl, wMinaFlags
	bit 3, [hl] ; ENGINE_MINA_RADIANT_FIELD
	jr nz, .do_mina_mon
	jr .next_mina_mon
.mina_mon_4
	push hl
	ld hl, wMinaFlags
	bit 4, [hl] ; ENGINE_MINA_ROUTE_29
	jr nz, .do_mina_mon
	jr .next_mina_mon
.mina_mon_5
	push hl
	ld hl, wMinaFlags
	bit 5, [hl] ; ENGINE_MINA_ROUTE_10
	jr nz, .do_mina_mon
	
.next_mina_mon
	pop hl
	ld a, 12
	ld e, a
.mina_mon_loop
	inc hl
	dec e
	ld a, e
	cp 0
	jr nz, .mina_mon_loop
	ld a, 0
	ret
.do_mina_mon
	pop hl
	jp GetNextTrainerDataByte
	
MinaLevels:
	push af
	ld a, [wMinaEncounters]
	ld e, a
.mina_mon_level_loop
	ld a, e
	cp 0
	jr z, .end
	ld e, a
	pop af
	add 4
	push af
	dec e
	jr .mina_mon_level_loop
.end
	pop af
	ret
