EvolvePokemon:
	ld hl, wEvolvableFlags
	xor a
	ld [hl], a
	ld a, [wCurPartyMon]
	ld c, a
	ld b, SET_FLAG
	call EvoFlagAction
EvolveAfterBattle:
	call Load1bppFont
	xor a
	ld [wMonTriedToEvolve], a
	dec a
	ld [wCurPartyMon], a
	push hl
	push bc
	push de
	ld hl, wPartyCount

	push hl

EvolveAfterBattle_MasterLoop:
	ld hl, wCurPartyMon
	inc [hl]

	pop hl

	inc hl
	ld a, [hl]
	cp $ff
	jp z, .ReturnToMap

	ld [wEvolutionOldSpecies], a

	push hl
	ld a, [wCurPartyMon]
	ld c, a
	ld hl, wEvolvableFlags
	ld b, CHECK_FLAG
	call EvoFlagAction
	ld a, c
	and a
	jp z, EvolveAfterBattle_MasterLoop

	ld a, [wEvolutionOldSpecies]
	ld c, a
	ld a, [wCurForm]
	ld b, a
	call GetEvosAttacksPointer

	push hl
	xor a
	ld [wMonType], a
	predef CopyPkmnToTempMon
	pop hl

.loop
	ld a, [hli]
	and a
	jr z, EvolveAfterBattle_MasterLoop

	ld b, a
	
	cp EVOLVE_TRADE
	jp z, .trade

	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_ITEM
	jp z, .item
	cp EVOLVE_ITEM_MALE
	jp z, .item_m
	cp EVOLVE_ITEM_FEMALE
	jp z, .item_f

	ld a, [wForceEvolution]
	and a
	jp nz, .dont_evolve_2

	ld a, b
	cp EVOLVE_HOLDING
	jp z, .holding
	cp EVOLVE_HOLDING_DAY
	jp z, .holding_day
	cp EVOLVE_HOLDING_NITE
	jp z, .holding_nite
	cp EVOLVE_LOCATION
	jp z, .location
	cp EVOLVE_LOCATION_SPECIFIC
	jp z, .location_specific
	cp EVOLVE_MOVE
	jp z, .move
	cp EVOLVE_EVS
	jp z, .evs
	cp EVOLVE_LEVEL
	jp z, .level
	cp EVOLVE_CUBONE
	jp z, .cubone
	cp EVOLVE_HAPPINESS
	jp z, .happiness

; EVOLVE_STAT
	ld a, [wTempMonLevel]
	cp [hl]
	jp c, .dont_evolve_1

	call IsMonHoldingEverstone
	jp z, .dont_evolve_1

	push hl
	ld de, wTempMonAttack
	ld hl, wTempMonDefense
	ld c, 2
	call StringCmp
	ld a, ATK_EQ_DEF
	jr z, .got_tyrogue_evo
	ld a, ATK_LT_DEF
	jr c, .got_tyrogue_evo
	ld a, ATK_GT_DEF
.got_tyrogue_evo
	pop hl

	inc hl
	cp [hl]
	jp nz, .dont_evolve_2

	inc hl
	jp .proceed


.happiness
	ld a, [wTempMonHappiness]
	cp HAPPINESS_TO_EVOLVE
	jp c, .dont_evolve_2

	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	cp TR_ANYTIME
	jp z, .proceed
	cp TR_MORNDAY
	jp z, .happiness_daylight

; TR_NITE
	ld a, [wTimeOfDay]
	cp DUSK
	jp z, .proceed
	cp NITE
	jp nz, .dont_evolve_3
	jp .proceed

.happiness_daylight
	ld a, [wTimeOfDay]
	cp DUSK
	jp z, .dont_evolve_3
	cp NITE
	jp z, .dont_evolve_3
	jp .proceed

.trade
	ld a, [wLinkMode]
	and a
	jr nz, .trading
	ld a, [wCurItem]
	cp LINK_CABLE
	jp nz, .dont_evolve_2
.trading
	call IsMonHoldingEverstone
	jp z, .dont_evolve_2

	ld a, [hli]
	ld b, a
	inc a
	jp z, .proceed

	ld a, [wTempMonItem]
	cp b
	jp nz, .dont_evolve_3

	xor a
	ld [wTempMonItem], a
	jp .proceed
	
.item_f
	ld a, $3
	ld [wMonType], a
	push hl
	predef GetGender
	pop hl
	jr z, .item
.notMale
	jp .dont_evolve_2
.item_m
	ld a, $3
	ld [wMonType], a
	push hl
	predef GetGender
	pop hl
	jr z, .notMale
.item
	ld a, [hli]
	ld b, a
	ld a, [wCurItem]
	cp b
	jp nz, .dont_evolve_3

	ld a, [wForceEvolution]
	and a
	jp z, .dont_evolve_3
	ld a, [wLinkMode]
	and a
	jp nz, .dont_evolve_3
	
	ld a, [wCurItem]
	cp BIG_MALASADA
	jp nz, .proceed
	call SetAlolanFormOnEvo
	jp .proceed

.holding_day
	ld a, [wTimeOfDay]
	cp DUSK
	jp z, .dont_evolve_3
	cp NITE
	jp z, .dont_evolve_3
	jr .holding
.holding_nite
	ld a, [wTimeOfDay]
	cp DUSK
	jp .holding
	cp NITE
	jp nz, .dont_evolve_3
	
.holding
	ld a, [hli]
	ld b, a
	ld a, [wTempMonItem]
	cp b
	jp nz, .dont_evolve_3
	xor a
	ld [wTempMonItem], a
	jp .proceed
.location_specific
	ld a, [wMapGroup]
	cp GROUP_ICE_CAVE_ICE_ROCK_ROOM		;first map in location evo specific map group
	jp nz, .dont_evolve_2
;fallthru
.location
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	push hl
	call GetWorldMapLocation
	pop hl
	ld b, a
	ld a, [hli]
	cp b
	jp nz, .dont_evolve_3
	jp .proceed

.move
	ld a, [hli]
	push hl
	push bc
	ld b, a
	ld hl, wTempMonMoves
rept 4
	ld a, [hli]
	cp b
	jp z, .move_proceed
endr
	pop bc
	pop hl
	jp .dont_evolve_3

.move_proceed
	pop bc
	pop hl
	jp .proceed

.evs
	ld a, [hli]
	push hl
	push bc
	ld hl, wTempMonSpecies
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	cp EVS_TO_EVOLVE
	jp c, .dont_evolve_3
	jp .proceed

.cubone
	ld a, [wTempMonLevel]
	cp 28
	jp c, .dont_evolve_3

	call IsMonHoldingEverstone
	jp z, .dont_evolve_3

	ld a, [hli]
	cp TR_ANYTIME
	jp z, .proceed
	cp TR_MORNDAY
	jp z, .cubone_daylight

; TR_NITE
	ld a, [wTimeOfDay]
	cp DUSK
	jp z, .set_cubone_form
	cp NITE
	jp nz, .dont_evolve_3
.set_cubone_form
	call SetAlolanFormOnEvo
	jp .proceed

.cubone_daylight
	ld a, [wTimeOfDay]
	cp DUSK
	jp z, .dont_evolve_3
	cp NITE
	jp z, .dont_evolve_3
	jp .proceed
.level
	ld a, [hli]
	ld b, a
	ld a, [wTempMonLevel]
	cp b
	jp c, .dont_evolve_3
	call IsMonHoldingEverstone
	jp z, .dont_evolve_3

.proceed
	ld a, [wTempMonLevel]
	ld [wCurPartyLevel], a
	ld a, [wTempMonForm]
	and FORM_MASK
	ld [wCurForm], a
	ld a, $1
	ld [wMonTriedToEvolve], a

	push hl

	ld a, [hl]
	ld [wBuffer2], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	call CopyName1
	ld hl, Text_WhatEvolving
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ldh [hBGMapMode], a
	call ClearSprites

	farcall EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jp c, CancelEvolution

	ld hl, Text_CongratulationsYourPokemon
	call PrintText

	pop hl

	ld a, [hl]
	ld [wCurSpecies], a
	ld [wTempMonSpecies], a
	ld [wBuffer2], a
	ld [wd265], a
	call GetPokemonName

	push hl
	ld hl, Text_EvolvedIntoPKMN
	call PrintTextBoxText

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTileMapEvo
	call UpdateSpeciesNameIfNotNicknamed
	call GetBaseData

	ld hl, wTempMonEVs - 1
	ld de, wTempMonMaxHP
	ld b, TRUE
	predef CalcPkmnStats

	ld a, [wCurPartyMon]
	ld hl, wPartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wTempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, wTempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes

	ld a, [wCurSpecies]
	ld [wd265], a
	dec a
	call SetSeenAndCaughtMon

	pop de
	pop hl
	ld a, [wTempMonSpecies]
	ld [hl], a
	push hl
	push de
	call LearnEvolutionMove
	call LearnLevelMoves
	pop de
	ld l, e
	ld h, d
	jp EvolveAfterBattle_MasterLoop
; 423f8

.dont_evolve_1
	inc hl
.dont_evolve_2
	inc hl
.dont_evolve_3
	inc hl
	jp .loop

.ReturnToMap:
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wMonTriedToEvolve]
	and a
	call nz, RestartMapMusic
	ret
; 42414

UpdateSpeciesNameIfNotNicknamed: ; 42414
	ld a, [wEvolutionOldSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
.loop
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .loop

	ld a, [wCurPartyMon]
	ld bc, PKMN_NAME_LENGTH
	ld hl, wPartyMonNicknames
	rst AddNTimes
	push hl
	ld a, [wCurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	ret
; 42454

CancelEvolution: ; 42454
	ld hl, Text_StoppedEvolving
	call PrintText
	call ClearTileMapEvo
	pop hl
	jp EvolveAfterBattle_MasterLoop
; 42461

IsMonHoldingEverstone: ; 42461
	push hl
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	cp EVERSTONE
	pop hl
	ret
; 42473

Text_CongratulationsYourPokemon: ; 0x42473
	; Congratulations! Your @ @
	text_jump UnknownText_0x1c4b92
	db "@"
; 0x42478

Text_EvolvedIntoPKMN: ; 0x42478
	; evolved into @ !
	text_jump UnknownText_0x1c4baf
	db "@"
; 0x4247d

Text_StoppedEvolving: ; 0x4247d
	; Huh? @ stopped evolving!
	text_jump UnknownText_0x1c4bc5
	db "@"
; 0x42482

Text_WhatEvolving: ; 0x42482
	; What? @ is evolving!
	text_jump UnknownText_0x1c4be3
	db "@"
; 0x42487


LearnEvolutionMove:
	; c = species
	ld a, [wTempMonSpecies]
	ld [wCurPartySpecies], a
	ld c, a
	; b = form
	ld a, [wCurForm]
	ld b, a
	; bc = index
	call GetSpeciesAndFormIndex
	dec bc
	ld hl, EvolutionMoves
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld d, a
	ld hl, wPartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	ret z
	dec b
	jr nz, .check_move

	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	
	push hl
	push de
	farcall CheckMultiMoveSlot2
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	farcall GetMultiMoveSlotName2
	jr .done_multi_move
.not_multi_move_slot
	pop de
	pop hl
	call GetMoveName
.done_multi_move
	call CopyName1
	ld a, [wCurPartySpecies]
	push af
	predef LearnMove
	pop af
	ld [wCurPartySpecies], a
	ld [wTempMonSpecies], a
	ret

LearnLevelMoves:
	ld a, [wTempMonSpecies]
	ld [wCurPartySpecies], a
	ld c, a
	ld a, [wCurForm]
	ld b, a
	call GetEvosAttacksPointer

.skip_evos
	ld a, [hli]
	and a
	jr nz, .skip_evos

.find_move
	ld a, [hli]
	and a
	ret z

	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	ld a, [hli]
	jr nz, .find_move

	push hl
	ld d, a
	ld hl, wPartyMon1Moves
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move

	ld a, d
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	
	push hl
	push de
	farcall CheckMultiMoveSlot2
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	farcall GetMultiMoveSlotName2
	jr .done_multi_move
.not_multi_move_slot
	pop de
	pop hl
	call GetMoveName
.done_multi_move
	call CopyName1
	ld a, [wCurPartySpecies]
	push af
	predef LearnMove
	pop af
	ld [wCurPartySpecies], a
	ld [wTempMonSpecies], a
.has_move
	pop hl
	jr .find_move


FillMoves: ; 424e1
; Fill in moves at de for wCurPartySpecies at wCurPartyLevel

	push hl
	push de
	push bc
	ld a, [wCurPartySpecies]
	ld c, a
	ld a, [wCurForm]
	ld b, a
	call GetEvosAttacksPointer
	
.GoToAttacks:
	ld a, [hli]
	and a
	jr nz, .GoToAttacks
	jr .GetLevel

.NextMove:
	pop de
.GetMove:
	inc hl
.GetLevel:
	ld a, [hli]
	and a
	jp z, .done
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jp c, .done
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .CheckMove
	ld a, [wd002]
	cp b
	jr nc, .GetMove

.CheckMove:
	push de
	ld c, NUM_MOVES
.CheckRepeat:
	ld a, [de]
	inc de
	cp [hl]
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot:
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call ShiftMoves
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, wPartyMon1PP - (wPartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	call ShiftMoves
	pop de

.ShiftedMove:
	pop hl

.LearnMove:
	ld a, [hl]
	ld [de], a
	ld a, [wEvolutionOldSpecies]
	and a
	jr z, .NextMove
	push hl
	ld a, [hl]
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	rst AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl
	ld [hl], a
	pop hl
	jr .NextMove

.done
	pop bc
	pop de
	pop hl
	ret
; 4256e

ShiftMoves: ; 4256e
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 42577


EvoFlagAction: ; 42577
	push de
	ld d, $0
	predef FlagPredef
	pop de
	ret
; 42581

GetPreEvolution:: ; 42581
; Find the first mon to evolve into wCurPartySpecies.

; Return carry and the new species in wCurPartySpecies
; if a pre-evolution is found.

	ld c, 0
.loop ; For each Pokemon...
	ld hl, EvosAttacksPointers
	; this does not need to use the extended GetSpeciesAndFormIndex
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop2 ; For each evolution...
	ld a, [hli]
	and a
	jr z, .no_evolve ; If we jump, this Pokemon does not evolve into wCurPartySpecies.
	cp EVOLVE_STAT ; This evolution type has the extra parameter of stat comparison.
	jr nz, .not_tyrogue
	inc hl

.not_tyrogue
	inc hl
	ld a, [wCurPartySpecies]
	cp [hl]
	jr z, .found_preevo
	inc hl
	ld a, [hl]
	and a
	jr nz, .loop2

.no_evolve
	inc c
	ld a, c
	cp NUM_POKEMON
	jr c, .loop
	and a
	ret

.found_preevo
	inc c
	ld a, c
	ld [wCurPartySpecies], a
	scf
	ret
; 425b1

ClearTileMapEvo:
	; Fill wTileMap with blank tiles.
	hlcoord 0, 0
	ld a, $7f
	ld bc, wTileMapEnd - wTileMap
	call ByteFill

	; Update the BG Map.
	ldh a, [rLCDC]
	bit 7, a
	ret z
	jp ApplyTilemapInVBlank
	
GetEvosAttacksPointer:
; input: b = form, c = species
	; bc = index
	call GetSpeciesAndFormIndex
	dec bc
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
	
SetAlolanFormOnEvo:
	ld a, ALOLAN_FORM
	ld b, a
	ld a, [wTempMonForm]
	and $ff - FORM_MASK
	or b
	ld [wTempMonForm], a
	
	push hl
	ld hl, wPartyMon1Form
	ld a, [wCurPartyMon]
	call GetPartyLocation
	ld a, [wTempMonForm]
	ld [hl], a
	pop hl
	ret