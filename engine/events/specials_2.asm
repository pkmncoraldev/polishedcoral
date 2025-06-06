SpecialGiveShinyDitto:

; Adding to the party.
	xor a
	ld [wMonType], a

; Level 5 Ditto.
	ld a, DITTO
	ld [wCurPartySpecies], a
	ld a, 5
	ld [wCurPartyLevel], a

	predef TryAddMonToParty
	jr nc, .NotGiven

; Caught data.
	lb bc, MALE, PREMIER_BALL
	farcall SetGiftPartyMonCaughtData

; Holding an Everstone for breeding natures.
	ld hl, wPartyMon1Item
	call _GetLastPartyMonAttribute
	ld [hl], EVERSTONE

; OT ID. Guaranteed to not be the same as the player's for Masuda method breeding.
	ld hl, wPartyMon1ID + 1
	call _GetLastPartyMonAttribute
	ld a, [wPlayerID + 1]
	add %01100101
	ld [hld], a
	ld a, [wPlayerID]
	adc %10100110
	ld [hl], a

; DVs and personality.
	ld hl, wPartyMon1DVs
	call _GetLastPartyMonAttribute
; Max IVs.
rept 3
	ld a, $ff
	ld [hli], a
endr
; Shiny with hidden ability.
	ld a, SHINY_MASK | HIDDEN_ABILITY | QUIRKY
	ld [hli], a
	ld a, MALE
	ld [hl], a

; Recalculate stats after changing DVs and Nature
	ld hl, wPartyMon1MaxHP
	call _GetLastPartyMonAttribute
	ld d, h
	ld e, l
	ld hl, wPartyMon1EVs - 1
	call _GetLastPartyMonAttribute
	ld b, TRUE
	predef CalcPkmnStats

; Nickname.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, .Nickname
	call CopyName2

; OT.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, .OT
	call CopyName2

	ld a, TRUE
	ld [wScriptVar], a
	ret

.NotGiven:
	xor a ; ld a, FALSE
	ld [wScriptVar], a
	ret

.OT:
	db "Mr.<PK><MN>@"
.Nickname:
	db "Masuda@"

DEF KIRK_BUFFY_ID EQU 00518

SpecialGiveWobbuffet: ; 7305

; Adding to the party.
	xor a
	ld [wMonType], a

; Level 20 Wobbuffet.
	ld a, BULBASAUR
	ld [wCurPartySpecies], a
	ld a, 20
	ld [wCurPartyLevel], a

	predef TryAddMonToParty
	jr nc, .NotGiven

; Caught data.
	lb bc, MALE, DUSK_BALL
	farcall SetGiftPartyMonCaughtData

; Holding a Berry.
	ld hl, wPartyMon1Item
	call _GetLastPartyMonAttribute
	ld [hl], SITRUS_BERRY

; OT ID.
	ld hl, wPartyMon1ID
	call _GetLastPartyMonAttribute
	ld a, KIRK_BUFFY_ID / $100
	ld [hli], a
	ld [hl], KIRK_BUFFY_ID % $100

; Nickname.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, SpecialWobbuffetNick
	call CopyName2

; OT.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialWobbuffetOT
	call CopyName2

; Engine flag for this event.
	ld hl, wDailyFlags
	set 5, [hl] ; ENGINE_WOBBUFFET_GIVEN
	ld a, TRUE
	ld [wScriptVar], a
	ret

.NotGiven:
	xor a ; ld a, FALSE
	ld [wScriptVar], a
	ret

_GetLastPartyMonAttribute:
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ret

SpecialReturnWobbuffet: ; 737e
	farcall SelectMonFromParty
	jr c, .refused

	ld a, [wCurPartySpecies]
	cp BULBASAUR
	jr nz, .DontReturn

	ld a, [wCurPartyMon]
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes

; OT ID
	ld a, [hli]
	cp KIRK_BUFFY_ID / $100
	jr nz, .DontReturn
	ld a, [hl]
	cp KIRK_BUFFY_ID % $100
	jr nz, .DontReturn

; OT
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialWobbuffetOT
.CheckOT:
	ld a, [de]
	cp [hl]
	jr nz, .DontReturn
	cp "@"
	jr z, .done
	inc de
	inc hl
	jr .CheckOT

.done
	farcall CheckCurPartyMonFainted
	jr c, .fainted
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	cp 150
	ld a, $3
	jr nc, .HappyToStayWithYou
	xor a ; take from pc
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ld a, $2
.HappyToStayWithYou:
	ld [wScriptVar], a
	ret

.refused
	ld a, $1
	ld [wScriptVar], a
	ret

.DontReturn:
	xor a
	ld [wScriptVar], a
	ret

.fainted
	ld a, $4
	ld [wScriptVar], a
	ret

SpecialWobbuffetOT:
	db "Kirk@"
SpecialWobbuffetNick:
	db "Buffy@"

Special_BillsGrandfather: ; 73f7
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

.cancel
	xor a
	ld [wScriptVar], a
	ret

Special_HiddenPowerGuru:
	farcall SelectMonFromParty
	jr c, .cancel
	ld a, MON_IS_EGG
	call GetPartyParamLocation
	bit MON_IS_EGG_F, [hl]
	jr nz, .egg
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	call CopyPokemonName_Buffer1_Buffer3
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1DVs
	call GetPartyLocation
	farcall GetHiddenPowerType
	ld [wNamedObjectIndexBuffer], a
	farcall GetTypeName
	ld a, $2
.done
	ld [wScriptVar], a
	ret

.cancel
	ld a, $0
	jr .done

.egg
	ld a, $1
	jr .done

Special_YoungerHaircutBrother: ; 7413
	ld hl, Data_YoungerHaircutBrother
	jr MassageOrHaircut

Special_OlderHaircutBrother: ; 7418
	ld hl, Data_OlderHaircutBrother
	jr MassageOrHaircut

Special_DaisyMassage: ; 741d
	ld hl, Data_DaisyMassage
	jr MassageOrHaircut

Special_CianwoodPhotograph:
	ld hl, Data_CianwoodPhotograph
	jr MassageOrHaircut

Special_ReiBlessing:
	ld hl, Data_ReiBlessing

MassageOrHaircut: ; 7420
	push hl
	farcall SelectMonFromParty
	pop hl
	jr c, .nope
	ld a, MON_IS_EGG
	push hl
	call GetPartyParamLocation
	bit MON_IS_EGG_F, [hl]
	pop hl
	jr nz, .egg
	push hl
	call GetCurNick
	call CopyPokemonName_Buffer1_Buffer3
	pop hl
	call Random
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [wScriptVar], a
	ld c, [hl]
	jp ChangeHappiness

.nope
	xor a
	ld [wScriptVar], a
	ret

.egg
	ld a, 1
	ld [wScriptVar], a
	ret

INCLUDE "data/events/happiness_probabilities.asm"

CopyPokemonName_Buffer1_Buffer3: ; 746e
	ld hl, wStringBuffer1
	ld de, wStringBuffer3
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	ret

SpecialGiveShinyTogepi:

; Adding to the party.
	xor a
	ld [wMonType], a

; Level 10 Togepi
	ld a, TOGEPI
	ld [wCurPartySpecies], a
	ld a, 18
	ld [wCurPartyLevel], a

	predef TryAddMonToParty
	jp nc, .NotGiven

; Caught data.
	lb bc, FEMALE, POKE_BALL
	farcall SetGiftPartyMonCaughtData

; Holding an Lucky Egg.
	ld hl, wPartyMon1Item
	call _GetLastPartyMonAttribute
	ld [hl], RARE_CANDY

; OT ID. Guaranteed to not be the same as the player's for Masuda method breeding.
	ld hl, wPartyMon1ID + 1
	call _GetLastPartyMonAttribute
	ld a, [wPlayerID + 1]
	add %01100101
	ld [hld], a
	ld a, [wPlayerID]
	adc %10100110
	ld [hl], a

; DVs and personality.
	ld hl, wPartyMon1DVs
	call _GetLastPartyMonAttribute
; Max IVs.
rept 3
	ld a, $ff
	ld [hli], a
endr
; Shiny with hidden ability.
	ld a, SHINY_MASK | HIDDEN_ABILITY | BASHFUL
	ld [hli], a
	ld a, MALE
	ld [hl], a

; Recalculate stats after changing DVs and Nature
	ld hl, wPartyMon1MaxHP
	call _GetLastPartyMonAttribute
	ld d, h
	ld e, l
	ld hl, wPartyMon1EVs - 1
	call _GetLastPartyMonAttribute
	ld b, TRUE
	predef CalcPkmnStats

; Nickname.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, .Nickname
	call CopyName2

; OT.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, .OT
	call CopyName2

	ld a, TRUE
	ld [wScriptVar], a
	
; Happiness
	ld a, [wPartyCount]
	cp 2
	jr z, .two_mons
	cp 3
	jr z, .three_mons
	cp 4
	jr z, .four_mons
	cp 5
	jr z, .five_mons
	cp 6
	jr z, .six_mons
;one_mon (shouldn't be possible)
	ld a, 140
	ld [wPartyMon1Happiness], a
	jr .end
.two_mons
	ld a, 140
	ld [wPartyMon2Happiness], a
	jr .end
.three_mons
	ld a, 140
	ld [wPartyMon3Happiness], a
	jr .end
.four_mons
	ld a, 140
	ld [wPartyMon4Happiness], a
	jr .end
.five_mons
	ld a, 140
	ld [wPartyMon5Happiness], a
	jr .end
.six_mons
	ld a, 140
	ld [wPartyMon6Happiness], a
.end
	ret

.NotGiven:
	xor a ; ld a, FALSE
	ld [wScriptVar], a
	ret

.OT:
	db "CINDY@"
.Nickname:
	db "EGGY@"
	
Special_StartRanchRaceTimer: ; 11490
	farjp StartRanchRaceTimer
	
Special_StopLandmarkTimer:
	xor a
	ld [wLandmarkSignTimer], a
	ret
	
Special_StartLandmarkTimer:
	ld a, $6f
	ld [wLandmarkSignTimer], a
	ret
	