LoadWildMonData: ; 29ff8
	call _GrassWildmonLookup
	jr c, .copy
	ld hl, wMornEncounterRate
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	jr .done_copy

.copy
	inc hl
	inc hl
	ld de, wMornEncounterRate
	ld bc, 3
	rst CopyBytes
.done_copy
	call _WaterWildmonLookup
	ld a, 0 ; not xor a; preserve carry flag
	jr nc, .no_copy
	inc hl
	inc hl
	ld a, [hl]
.no_copy
	ld [wWaterEncounterRate], a
	ret

FindNest: ; 2a01f
; Parameters:
; e: 0 = North Onwa, 1 = South Onwa
; wNamedObjectIndexBuffer: species
	ld a, [wCurSpecies]
	cp SMEARGLE
	jr nz, .not_smeargle
	ld a, BULBASAUR ;pokemon with no nest
	ld [wNamedObjectIndexBuffer], a
.not_smeargle
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	ld a, e
	cp SOUTH_ONWA_REGION
	jr z, .south
	decoord 0, 0
	ld hl, NorthOnwaGrassWildMons
	call .FindGrass
	ld hl, NorthOnwaWaterWildMons
	call .FindWater
	ld hl, SpecialCaseWildMons
	call .FindWater
	call .RoamMon1
	call .RoamMon2
	jp .RoamMon3

.south
	decoord 0, 0
	ld hl, SouthOnwaGrassWildMons
	call .FindGrass
	ld hl, SouthOnwaWaterWildMons
	jp .FindWater

.FindGrass: ; 2a052
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	inc hl
	inc hl
	ld a, NUM_GRASSMON * 3
	call .SearchMapForMon
	jr nc, .next_grass
	ld [de], a
	inc de

.next_grass
	pop hl
	ld bc, GRASS_WILDDATA_LENGTH
	add hl, bc
	jr .FindGrass
; 2a06e

.FindWater: ; 2a06e
	ld a, [hl]
	cp -1
	ret z
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	inc hl
	ld a, NUM_WATERMON; * 3
	call .SearchMapForMon
	jr nc, .next_water
	ld [de], a
	inc de

.next_water
	pop hl
	ld bc, WATER_WILDDATA_LENGTH
	add hl, bc
	jr .FindWater
; 2a088

.SearchMapForMon: ; 2a088
	inc hl
.ScanMapLoop:
	push af
	ld a, [wNamedObjectIndexBuffer]
	cp [hl]
	jr z, .found
	inc hl
	inc hl
	pop af
	dec a
	jr nz, .ScanMapLoop
	and a
	ret

.found
	pop af
	; fallthrough

.AppendNest: ; 2a09c
	push de
	call GetWorldMapLocation
	ld c, a
	hlcoord 0, 0
	ld de, SCREEN_WIDTH * SCREEN_HEIGHT
.AppendNestLoop:
	ld a, [hli]
	cp c
	jr z, .found_nest
	dec de
	ld a, e
	or d
	jr nz, .AppendNestLoop
	ld a, c
	pop de
	scf
	ret

.found_nest
	pop de
	and a
	ret
; 2a0b7

.RoamMon1: ; 2a0b7
	ld a, [wRoamMon1Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon1MapGroup]
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0cf

.RoamMon2: ; 2a0cf
	ld a, [wRoamMon2Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon2MapGroup]
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret
; 2a0e7

.RoamMon3: ; 2a0cf
	ld a, [wRoamMon3Species]
	ld b, a
	ld a, [wNamedObjectIndexBuffer]
	cp b
	ret nz
	ld a, [wRoamMon3MapGroup]
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call .AppendNest
	ret nc
	ld [de], a
	inc de
	ret

TryWildEncounter::
; Try to trigger a wild encounter.
	; Do this first, because this affects some abilities messing with encounter rate
	call ChooseWildEncounter
	jr nz, .no_battle
	call .EncounterRate
	jr nc, .no_battle
	call CheckRepelEffect
	jr nc, .no_battle
	xor a
	ret

.no_battle
	xor a ; BATTLETYPE_NORMAL
	ld [wTempWildMonSpecies], a
	ld [wBattleType], a
	ld a, 1
	and a
	ret

.EncounterRate:
	call GetMapEncounterRate
	call ApplyLongGrassEffectOnEncounterRate
	call ApplyMusicEffectOnEncounterRate
	call ApplyCleanseTagEffectOnEncounterRate
	call SetBattlerLevel
	call ApplyAbilityEffectsOnEncounterMon
	call Random
	cp b
	ret

GetMapEncounterRate: ; 2a111
	ld hl, wMornEncounterRate
	ld a, [wTileset]
	cp TILESET_DIVE
	jr z, .skip
	call CheckOnWater
	ld a, 3
	jr z, .ok
.skip
	ld a, [wTimeOfDay]
	cp DUSK
	jr nz, .ok
	ld a, NITE
.ok
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	ret
; 2a124

ApplyLongGrassEffectOnEncounterRate:
	ld a, [wPlayerStandingTile]
	cp COLL_LONG_GRASS
	ret nz
;double
	sla b
	ret

ApplyMusicEffectOnEncounterRate:: ; 2a124
; Pokemon March and Ruins of Alph signal double encounter rate.
; Pokemon Lullaby halves encounter rate.
;	ld a, [wMapMusic]
;	cp MUSIC_POKEMON_MARCH
;	jr z, .double
;	cp MUSIC_RUINS_OF_ALPH_RADIO
;	jr z, .double
;	cp MUSIC_POKEMON_LULLABY
;	ret nz
;	srl b
;	ret

;.double
;	sla b
	ret
; 2a138

ApplyCleanseTagEffectOnEncounterRate::
; Cleanse Tag halves encounter rate.
	ld hl, wPartyMon1Item
	ld de, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	ld c, a
.loop
	ld a, [hl]
	cp CLEANSE_TAG
	jr z, .cleansetag
	add hl, de
	dec c
	jr nz, .loop
	ret

.cleansetag
	srl b
	ret

SetBattlerLevel:
; Sets c to the level of the first nonfainted mon (to be sent first into wild fights)
	push bc
	ld hl, wPartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .ok
	add hl, bc
	jr .loop

.ok
	pop bc
	; Set hl to level of said mon
rept 4
	dec hl
endr
	ld c, [hl]
	ret

ChooseWildEncounter: ; 2a14f
	ld c, $ff
_ChooseWildEncounter:
	push bc
	call LoadWildMonDataPointer
	pop bc
	jp nc, .nowildbattle
	push bc
	call CheckEncounterRoamMon
	pop bc
	jp c, .startwildbattle

	inc hl
	inc hl
	inc hl
	ld a, [wTileset]
	cp TILESET_DIVE
	jr z, .skip
	push bc
	call CheckOnWater
	pop bc
	ld de, WaterMonProbTable
	ld b, $4
	jr z, .got_table
.skip
	inc hl
	inc hl
	ld a, [wTimeOfDay]
	cp DUSK
	jr nz, .not_dusk
	ld a, NITE
.not_dusk
	push bc
	ld bc, $e
	rst AddNTimes
	pop bc
	ld de, GrassMonProbTable
	ld b, $c

.got_table
	; Check if we want to force a type
	inc c
	jr z, .get_random_mon
	dec c

	; Check if we can actually encounter a valid species of the given type
	push de
	push hl
.force_loop
	inc hl ; We don't care about level
	ld a, [hli]
	ld [wCurSpecies], a
	push bc
	push hl
	call GetBaseData
	pop hl
	pop bc
	ld a, [wBaseType1]
	cp c
	jr z, .can_force_type
	ld a, [wBaseType2]
	cp c
	jr z, .can_force_type
	dec b
	dec b
	jr nz, .force_loop
	ld c, $ff
.can_force_type
	inc c
	pop hl
	pop de
.get_random_mon
	dec c
	push hl ; wild mon data pointer
	ld a, 100
	call RandomRange
	inc a ; 1 <= a <= 100
	ld b, a
	ld h, d
	ld l, e
; This next loop chooses which mon to load up.
.prob_bracket_loop
	ld a, [hli]
	cp b
	jr nc, .got_it
	inc hl
	jr .prob_bracket_loop

.got_it
	ld a, c
	ld c, [hl]
	ld b, 0
	pop hl
	push hl
	add hl, bc ; this selects our mon
	ld c, a
	ld a, [hli]
	ld b, a
; If the Pokemon is encountered in a special way, skip randomizing level.
	push bc
	ld a, [wBattleType]
	cp BATTLETYPE_LEGENDARY
	jr z, .ok
	cp BATTLETYPE_SHINY_LEGENDARY
	jr z, .ok
	pop bc
;	jr nz, .ok
; Check if we buff the wild mon, and by how much.
	call Random
	cp 45 percent
	jr c, .ok
	inc b
	cp 65 percent
	jr c, .ok
	inc b
	cp 85 percent
	jr c, .ok
	inc b
; Store the level
.ok
	ld a, b
	ld [wCurPartyLevel], a
	ld b, [hl]
	ld a, b
	pop hl
	call ValidateTempWildMonSpecies
	jr c, .nowildbattle


	; Check if we're forcing type
	ld [wCurSpecies], a
	push bc
	push hl
	call GetBaseData
	pop hl
	pop bc
	ld a, [wBaseType1]
	cp c
	jr z, .type_ok
	ld a, [wBaseType2]
	cp c
	jr z, .type_ok
	inc c
	jr nz, .get_random_mon

.type_ok
	jr .loadwildmon

.nowildbattle
	ld a, 1
	and a
	ret

.loadwildmon
	ld hl, wEncounterHouse
	bit 0, [hl] ; ENGINE_ENCOUNTER_HOUSE
	jr z, .skipencounterhouse

	call Random
	cp 50 percent
	jr c, .skipencounterhouse
	
	ld a, [wEncounterHouseMon]
	ld b, a

.skipencounterhouse
	ld a, b
	ld [wTempWildMonSpecies], a

.startwildbattle
	xor a
	ret
; 2a1cb

INCLUDE "data/wild/probabilities.asm"

CheckRepelEffect::
; If there is no active Repel, there's no need to be here.
	ld a, [wRepelEffect]
	and a
	jr z, .encounter
	call SetBattlerLevel

	ld a, [wCurPartyLevel]
	cp c
.encounter
	ccf
	ret

ApplyAbilityEffectsOnEncounterMon:
	ret

LoadWildMonDataPointer: ; 2a200
	ld a, [wTileset]
	cp TILESET_DIVE
	jr z, _GrassWildmonLookup
	call CheckOnWater
	jr z, _WaterWildmonLookup

_GrassWildmonLookup: ; 2a205
	ld hl, SwarmGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	eventflagcheck EVENT_ON_DODRIO_RANCH
	jr nz, .on_ranch
	ld a, [wStuckInSandCounter]
	cp 0
	jr nz, .in_sand
	ld de, ENGINE_WINDY_DAY
	farcall CheckEngineFlag
	ld a, c
	and a
	jr z, .normal
	
	ld a, [wMapGroup]
	cp GROUP_ROUTE_23
	jr nz, .normal
	ld a, [wMapNumber]
	cp MAP_ROUTE_23
	jr z, .windy
	cp MAP_ROUTE_24_NORTH
	jr z, .windy
	cp MAP_ROUTE_24_SOUTH
	jr z, .windy
	cp MAP_ROUTE_25
	jr z, .windy
	cp MAP_ROUTE_26
	jr nz, .normal
.windy
	call _GetGrassWildmonPointer
	ld bc, GRASS_WILDDATA_LENGTH
	jp _WindyWildmonOK
.normal
	call _GetGrassWildmonPointer
	ld bc, GRASS_WILDDATA_LENGTH
	jr _NormalWildmonOK
.on_ranch
	call _GetGrassWildmonPointer
	ld bc, GRASS_WILDDATA_LENGTH
	jr _RanchWildmonOK
.in_sand
	call _GetGrassWildmonPointer
	ld bc, GRASS_WILDDATA_LENGTH
	jr _SandWildmonOK

_WaterWildmonLookup: ; 2a21d
	ld hl, SwarmWaterWildMons
	ld bc, WATER_WILDDATA_LENGTH
	call _SwarmWildmonCheck
	ret c
	call _GetWaterWildmonPointer
	ld bc, WATER_WILDDATA_LENGTH
	jr _NormalWildmonOK

_GetGrassWildmonPointer:
	call RegionCheck
	ld a, e
	ld hl, NorthOnwaGrassWildMons
	and a ; cp NORTH_ONWA_REGION
	ret z
	ld hl, SouthOnwaGrassWildMons
	ret

_GetWaterWildmonPointer:
	call RegionCheck
	ld a, e
	ld hl, NorthOnwaWaterWildMons
	and a ; cp NORTH_ONWA_REGION
	ret z
	ld hl, SouthOnwaWaterWildMons
	ret

_SwarmWildmonCheck:
	call CopyCurrMapDE
	push hl
	ld hl, wSwarmFlags
	bit 2, [hl]
	pop hl
	jr z, .CheckYanma
	ld a, [wDunsparceMapGroup]
	cp d
	jr nz, .CheckYanma
	ld a, [wDunsparceMapNumber]
	cp e
	jr nz, .CheckYanma
	call LookUpWildmonsForMapDE
	jr nc, _NoSwarmWildmon
	scf
	ret

.CheckYanma:
	push hl
	ld hl, wSwarmFlags
	bit 3, [hl]
	pop hl
	jr z, _NoSwarmWildmon
	ld a, [wYanmaMapGroup]
	cp d
	jr nz, _NoSwarmWildmon
	ld a, [wYanmaMapNumber]
	cp e
	jr nz, _NoSwarmWildmon
	call LookUpWildmonsForMapDE
	jr nc, _NoSwarmWildmon
	scf
	ret

_NoSwarmWildmon:
	and a
	ret

_NormalWildmonOK:
	call CopyCurrMapDE
	jr LookUpWildmonsForMapDE
	
_RanchWildmonOK:
	call CopyRanchMapDE
	jr LookUpWildmonsForMapDE
	
_SandWildmonOK:
	call CopySandMapDE
	jr LookUpWildmonsForMapDE
	
_WindyWildmonOK:
	call CopyWindyMapDE
	jr LookUpWildmonsForMapDE

CopyCurrMapDE: ; 2a27f
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
	ret
; 2a288

CopyRanchMapDE:
	ld a, GROUP_DODRIO_RANCH_RACETRACK
	ld d, a
	ld a, MAP_DODRIO_RANCH_RACETRACK
	ld e, a
	ret
	
CopySandMapDE:
	ld a, GROUP_BRILLO_BOAT_HOUSE
	ld d, a
	ld a, MAP_BRILLO_BOAT_HOUSE
	ld e, a
	ret

CopyWindyMapDE:
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	inc a
	ld e, a
	ret

LookUpWildmonsForMapDE: ; 2a288
.loop
	push hl
	ld a, [hl]
	inc a
	jr z, .nope
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr z, .yup

.next
	pop hl
	add hl, bc
	jr .loop

.nope
	pop hl
	and a
	ret

.yup
	pop hl
	scf
	ret
; 2a2a0

InitRoamArticuno:
	ld a, ARTICUNO
	ld [wRoamMon1Species], a
	ld a, ZAPDOS
	ld [wRoamMon2Species], a
	ld a, MOLTRES
	ld [wRoamMon3Species], a
	jr InitRoamMons

InitRoamZapdos:
	ld a, ZAPDOS
	ld [wRoamMon1Species], a
	ld a, ARTICUNO
	ld [wRoamMon2Species], a
	ld a, MOLTRES
	ld [wRoamMon3Species], a
	jr InitRoamMons

InitRoamMoltres:
	ld a, MOLTRES
	ld [wRoamMon1Species], a
	ld a, ARTICUNO
	ld [wRoamMon2Species], a
	ld a, ZAPDOS
	ld [wRoamMon3Species], a

InitRoamMons:
; level
	ld a, 40
	ld [wRoamMon1Level], a
	ld [wRoamMon2Level], a
	ld [wRoamMon3Level], a

; mon1 starting map
	ld a, GROUP_ROUTE_29
	ld [wRoamMon1MapGroup], a
	ld a, MAP_ROUTE_29
	ld [wRoamMon1MapNumber], a

; hp
	xor a ; generate new stats
	ld [wRoamMon1HP], a
	ld [wRoamMon2HP], a
	ld [wRoamMon3HP], a

	ret
; 2a2ce


CheckEncounterRoamMon: ; 2a2ce
	push hl
	eventflagcheck EVENT_YOU_CHEATED
	jr nz, .DontEncounterRoamMon
	eventflagcheck EVENT_ENCOUNTERED_FIRST_BIRD_ONCE
	jr nz, .skip
	
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .DontEncounterRoamMon
	
	ld a, [wPermission]
	cp ROUTE
	jr nz, .DontEncounterRoamMon
	
	ld a, [wBirdEncounterCounter]
	cp 50
	jr nz, .skip
	
	ld hl, wRoamMon1MapGroup
	jr .do_it
	
.skip
; Load the current map group and number to de
	call CopyCurrMapDE
; Randomly select a beast.
	call Random
	cp 100 ; 25/64 chance
	jr nc, .DontEncounterRoamMon
	and %00000011 ; Of that, a 3/4 chance.  Running total: 75/256, or around 29.3%.
	jr z, .DontEncounterRoamMon
	dec a ; 1/3 chance that it's Entei, 1/3 chance that it's Raikou
; Compare its current location with yours
	ld hl, wRoamMon1MapGroup
	ld c, a
	ld b, 0
	ld a, wRoamMon1End - wRoamMon1 ; length of the RoamMon struct
	rst AddNTimes
	ld a, d
	cp [hl]
	jr nz, .DontEncounterRoamMon
	inc hl
	ld a, e
	cp [hl]
	jr nz, .DontEncounterRoamMon
; We've decided to take on a beast, so stage its information for battle.
	dec hl
.do_it
	dec hl
	dec hl
	ld a, [hli]
	ld [wTempWildMonSpecies], a
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, BATTLETYPE_ROAMING
	ld [wBattleType], a

	pop hl
	scf
	ret

.DontEncounterRoamMon:
	pop hl
	and a
	ret
; 2a30d


UpdateRoamMons: ; 2a30d
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	ld b, a
	ld a, [wRoamMon1MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a

.SkipRaikou:
	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	ld b, a
	ld a, [wRoamMon2MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a

.SkipEntei:
	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .SkipSuicune
	ld b, a
	ld a, [wRoamMon3MapNumber]
	ld c, a
	call .Update
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a

.SkipSuicune:
	jp _BackUpMapIndices
; 2a355


.Update: ; 2a355
	ld hl, RoamMaps
.loop
; Are we at the end of the table?
	ld a, [hl]
	cp -1
	ret z
; Is this the correct entry?
	ld a, b
	cp [hl]
	jr nz, .next
	inc hl
	ld a, c
	cp [hl]
	jr z, .yes
; We don't have the correct entry yet, so let's continue.  A 0 terminates each entry.
.next
	ld a, [hli]
	and a
	jr nz, .next
	jr .loop

; We have the correct entry now, so let's choose a random map from it.
.yes
	inc hl
	ld d, h
	ld e, l
.update_loop
	ld h, d
	ld l, e
; Choose which map to warp to.
	call Random
	cp 5 percent ; 5% chance it moves to a completely random map.
	jr c, JumpRoamMon
	and 3
	cp [hl]
	jr nc, .update_loop ; invalid index, try again
	inc hl
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [wRoamMons_LastMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wRoamMons_LastMapNumber]
	cp [hl]
	jr z, .update_loop
	dec hl

.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret

JumpRoamMons: ; 2a394
	ld a, [wRoamMon1MapGroup]
	cp GROUP_N_A
	jr z, .SkipRaikou
	call JumpRoamMon
	ld a, b
	ld [wRoamMon1MapGroup], a
	ld a, c
	ld [wRoamMon1MapNumber], a
.SkipRaikou:

	ld a, [wRoamMon2MapGroup]
	cp GROUP_N_A
	jr z, .SkipEntei
	call JumpRoamMon
	ld a, b
	ld [wRoamMon2MapGroup], a
	ld a, c
	ld [wRoamMon2MapNumber], a
.SkipEntei:

	ld a, [wRoamMon3MapGroup]
	cp GROUP_N_A
	jr z, .SkipSuicune
	call JumpRoamMon
	ld a, b
	ld [wRoamMon3MapGroup], a
	ld a, c
	ld [wRoamMon3MapNumber], a
.SkipSuicune:

	jp _BackUpMapIndices

JumpRoamMon: ; 2a3cd
.loop
	ld hl, RoamMaps
	call Random ; Choose a random number
	cp NUM_ROAMMON_MAPS
	jr nc, .loop
	inc a
	ld b, a
.innerloop ; Loop to get hl to the address of the chosen roam map.
	dec b
	jr z, .ok
.innerloop2 ; Loop to skip the current roam map, which is terminated by a 0.
	ld a, [hli]
	and a
	jr nz, .innerloop2
	jr .innerloop
; Check to see if the selected map is the one the player is currently in.  If so, try again.
.ok
	ld a, [wMapGroup]
	cp [hl]
	jr nz, .done
	inc hl
	ld a, [wMapNumber]
	cp [hl]
	jr z, .loop
	dec hl
; Return the map group and number in bc.
.done
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ret
; 2a3f6

_BackUpMapIndices: ; 2a3f6
	ld a, [wRoamMons_CurrentMapNumber]
	ld [wRoamMons_LastMapNumber], a
	ld a, [wRoamMons_CurrentMapGroup]
	ld [wRoamMons_LastMapGroup], a
	ld a, [wMapNumber]
	ld [wRoamMons_CurrentMapNumber], a
	ld a, [wMapGroup]
	ld [wRoamMons_CurrentMapGroup], a
	ret
; 2a40f

INCLUDE "data/wild/roammon_maps.asm"

ValidateTempWildMonSpecies: ; 2a4a0
; Due to a development oversight, this function is called with the wild Pokemon's level, not its species, in a.
	and a
	jr z, .nowildmon ; = 0
	cp NUM_POKEMON + 1 ; 252
	jr nc, .nowildmon ; >= 252
	and a ; 1 <= Species <= 251
	ret

.nowildmon
	scf
	ret
; 2a4ab

RandomPhoneRareWildMon: ; 2a4ab
; Related to the phone?
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, NorthOnwaGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .GetGrassmon
	ld hl, SouthOnwaGrassWildMons
	call LookUpWildmonsForMapDE
	jr nc, .done

.GetGrassmon:
	push hl
	ld bc, 5 + 4 * 2 ; Location of the level of the 5th wild Pokemon in that map
	add hl, bc
	ld a, [wTimeOfDay]
	cp DUSK
	jr nz, .not_dusk
	ld a, NITE
.not_dusk
	ld bc, 7 * 2
	rst AddNTimes
.randloop1
	call Random
	and $3
	jr z, .randloop1
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
; We now have the pointer to one of the last (rarest) three wild Pokemon found in that area.
	inc hl
	ld c, [hl] ; Contains the species index of this rare Pokemon
	pop hl
	ld de, 5 + 0 * 2
	add hl, de
	inc hl ; Species index of the most common Pokemon on that route
	ld b, 4
.loop2
	ld a, [hli]
	cp c ; Compare this most common Pokemon with the rare one stored in c.
	jr z, .done
	inc hl
	dec b
	jr nz, .loop2
; This Pokemon truly is rare.
	push bc
	dec c
	ld a, c
	call CheckSeenMon
	pop bc
	jr nz, .done
; Since we haven't seen it, have the caller tell us about it.
	ld de, wStringBuffer1
	call CopyName1
	ld a, c
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .SawRareMonText
	call PrintText
	xor a
	ld [wScriptVar], a
	ret

.done
	ld a, $1
	ld [wScriptVar], a
	ret

.SawRareMonText:
	; I just saw some rare @  in @ . I'll call you if I see another rare #MON, OK?
	text_jump UnknownText_0x1bd34b
	db "@"
; 0x2a51f

RandomPhoneWildMon: ; 2a51f
	farcall GetCallerLocation
	ld d, b
	ld e, c
	ld hl, NorthOnwaGrassWildMons
	ld bc, GRASS_WILDDATA_LENGTH
	call LookUpWildmonsForMapDE
	jr c, .ok
	ld hl, SouthOnwaGrassWildMons
	call LookUpWildmonsForMapDE

.ok
	ld bc, 5 + 0 * 2
	add hl, bc
	ld a, [wTimeOfDay]
	cp DUSK
	jr nz, .not_dusk
	ld a, NITE
.not_dusk
	inc a
	ld bc, 7 * 2
.loop
	dec a
	jr z, .done
	add hl, bc
	jr .loop

.done
	call Random
	and $3
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	inc hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	ret
; 2a567

RandomPhoneMon: ; 2a567
; Get a random monster owned by the trainer who's calling.
	farcall GetCallerLocation
	ld hl, TrainerGroups
	ld a, d
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, BANK(TrainerGroups)
	call GetFarByte
	inc hl
	ld [wTrainerGroupBank], a
	ld a, BANK(TrainerGroups)
	call GetFarHalfword

.skip_trainer
	dec e
	jr z, .skipped
.skip
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	cp -1
	jr nz, .skip
	jr .skip_trainer
.skipped

.skip_name
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .skip_name

	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl

	; get trainer type
	ld b, a
	; nicknames have uneven length, so always use the first mon
	bit TRNTYPE_NICKNAME, b
	jr nz, .got_mon
	; TRAINERTYPE_NORMAL uses 2 bytes per mon
	ld c, 2
	; TRAINERTYPE_ITEM uses 1 more byte
	bit TRNTYPE_ITEM, b
	jr z, .no_item
	inc c
.no_item
	; TRAINERTYPE_EVs uses 1 more byte
	bit TRNTYPE_EVS, b
	jr z, .no_evs
	inc c
.no_evs
	; TRAINERTYPE_DVS uses 3 more bytes
	bit TRNTYPE_DVS, b
	jr z, .no_dvs
	inc c
	inc c
	inc c
.no_dvs
	; TRAINERTYPE_PERSONALITY uses 2 more bytes
	bit TRNTYPE_PERSONALITY, b
	jr z, .no_personality
	inc c
	inc c
.no_personality
	; TRAINERTYPE_MOVES uses 4 more bytes
	bit TRNTYPE_MOVES, b
	jr z, .no_moves
	inc c
	inc c
	inc c
	inc c
.no_moves
	; bc == size of mon sub-struct
	xor a
	ld b, a

	ld e, 0
	push hl
.count_mon
	inc e
	add hl, bc
	ld a, [wTrainerGroupBank]
	call GetFarByte
	cp -1
	jr nz, .count_mon
	pop hl

.rand
	call Random
	and 7
	cp e
	jr nc, .rand

	inc a
.get_mon
	dec a
	jr z, .got_mon
	add hl, bc
	jr .get_mon
.got_mon

	inc hl ; species
	ld a, [wTrainerGroupBank]
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wStringBuffer4
	ld bc, PKMN_NAME_LENGTH
	rst CopyBytes
	ret
; 2a5e9


NorthOnwaGrassWildMons: ; 0x2a5e9
INCLUDE "data/wild/north_onwa_grass.asm"

NorthOnwaWaterWildMons: ; 0x2b11d
INCLUDE "data/wild/north_onwa_water.asm"

SouthOnwaGrassWildMons: ; 0x2b274
INCLUDE "data/wild/south_onwa_grass.asm"

SouthOnwaWaterWildMons: ; 0x2b7f7
INCLUDE "data/wild/south_onwa_water.asm"

SwarmGrassWildMons: ; 0x2b8d0
INCLUDE "data/wild/swarm_grass.asm"

SwarmWaterWildMons: ; 0x2b92f
INCLUDE "data/wild/swarm_water.asm"

SpecialCaseWildMons:
INCLUDE "data/wild/special_cases.asm"
