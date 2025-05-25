GenerateWildForm::
	push hl
	push de
	push bc
	ld a, [wMapGroup]
	cp GROUP_ROUTE_8_GARDEN
	jr nz, .not_encounter_house
	ld a, [wMapNumber]
	cp MAP_ROUTE_8_GARDEN
	jr z, .encounter_house
.not_encounter_house
	ld a, [wWildMonForm]
	and a
	jr nz, .done
	ld a, [wTempEnemyMonSpecies]
	ld b, a
	ld hl, WildSpeciesForms
.loop
	ld a, [hli]
	and a
	jr z, .ok
	cp b
	jr z, .ok
	inc hl
	inc hl
	jr .loop
.ok
	call IndirectHL
.done
	ld [wCurForm], a
	jp PopBCDEHL
	
.encounter_house
	ld a, [wTempEnemyMonSpecies]
	ld b, a
	ld a, [wEncounterHouseMon]
	cp b
	jr nz, .not_encounter_house
	ld a, [wEncounterHouseMonForm]
	jr .done

WildSpeciesForms:
	dbw PIDGEY,		.PidgeyForm
	dbw RATTATA,	.PidgeyForm
	dbw RATICATE,	.PidgeyForm
	dbw RAICHU,		.ExeggcuteForm
	dbw MEOWTH,		.MeowthForm
	dbw EXEGGCUTE,	.ExeggcuteForm
	dbw EXEGGUTOR,	.ExeggcuteForm
	dbw GYARADOS,	.PidgeyForm
	dbw WOOPER,		.WooperForm
	dbw GRIMER,		.GrimerForm
	dbw SMEARGLE,	.SmeargleForm
	dbw 0,			.Default

.CheckGen1: ; used for mons that have an alt for in addition to a gen 1 form
	ld a, [wTempEnemyMonSpecies]
	ld hl, Gen1Form3Mons
	ld de, 1
	call IsInArray
	jr nc, .Default
	ld a, [wCurrentLandmark]
	cp FAKE_ROUTE_1
	jr nz, .Default
	ld a, GEN_1_FORM_2
	ret
.Default:
	ld a, PLAIN_FORM
	ret
	
.Gen1Form
	ld a, [wCurrentLandmark]
	cp FAKE_ROUTE_1
	ret nz
	ld a, 3 ; raichu gen 1 form
	ret
.GrimerForm
	ld a, [wMapNumber]
	cp MAP_LUSTER_SEWERS_MUK_ROOM
	jr z, .a_muk_room
	jr .normal_sewer
.a_muk_room
	call Random
	cp 80 percent + 1
	jr nc, .Default
	jr .AlolanForm
.normal_sewer
	call Random
	cp 20 percent + 1
	jr nc, .Default
	jr .AlolanForm
.SmeargleForm
	ld a, 9
	call RandomRange
	inc a
	ret
.WooperForm
	ld hl, WooperLandmarks
	jr .LandmarkForm
.PidgeyForm
	ld hl, FakeRoute1Landmarks
	jr .LandmarkForm
.MeowthForm
	ld hl, MeowthLandmarks
	jr .LandmarkForm
.ExeggcuteForm:
	ld hl, ExeggcuteLandmarks
	ld a, [wCurrentLandmark]
	cp DESERT_WASTELAND
	jr z, .AlolanForm
	ld de, 1
	call IsInArray
	jr nc, .CheckGen1
	call Random
	cp 50 percent + 1
	jr nc, .Default
	jr .AlolanForm
.LandmarkForm:
	ld a, [wCurrentLandmark]
	ld de, 1
	call IsInArray
	jr nc, .CheckGen1
.AlolanForm:
	ld a, ALOLAN_FORM ; most alt forms
	ret

WooperLandmarks:
	db ROUTE_12
	db -1

MeowthLandmarks:
	db RESIDENTIAL_DISTRICT
	db DUSK_TURNPIKE
	db -1

ExeggcuteLandmarks:
	db ROUTE_16
	db SUNBEAM_ISLAND
	db SUNBEAM_JUNGLE
	db -1
	
FakeRoute1Landmarks:
	db FAKE_ROUTE_1
	db -1
	
Gen1Form3Mons:
	db RAICHU
	db EXEGGUTOR
	db -1
