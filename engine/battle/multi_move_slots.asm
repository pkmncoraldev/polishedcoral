GetTackleName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckPoundUsers
	jr nc, .not_tackle
	ld hl, TackleNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_tackle
	call CheckScratchUsers
	jr nc, .not_scratch
	ld hl, TackleNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_scratch
	ld hl, TackleNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameTackle:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckPoundUsers
	jr nc, .not_tackle
	ld hl, TackleNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_tackle
	call CheckScratchUsers
	jr nc, .not_scratch
	ld hl, TackleNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_scratch
	ld hl, TackleNames
	ld a, 2
	jp GetMoveNameDone2

GetDefenseCurlName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckWithdrawUsers
	jr nc, .not_withdraw
	ld hl, DefenseCurlNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_withdraw
	call CheckHardenUsers
	jr nc, .not_harden
	ld hl, DefenseCurlNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_harden
	ld hl, DefenseCurlNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameDefenseCurl:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckWithdrawUsers
	jr nc, .not_withdraw
	ld hl, DefenseCurlNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_withdraw
	call CheckHardenUsers
	jr nc, .not_harden
	ld hl, DefenseCurlNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_harden
	ld hl, DefenseCurlNames
	ld a, 2
	jp GetMoveNameDone2
	
GetLeerName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckTailWhipUsers
	jr nc, .not_tailwhip
	ld hl, LeerNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_tailwhip
	ld hl, LeerNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameLeer:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckTailWhipUsers
	jr nc, .not_tailwhip
	ld hl, LeerNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_tailwhip
	ld hl, LeerNames
	ld a, 1
	jp GetMoveNameDone2
	
GetBarrierName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckIronDefenseUsers
	jr nc, .not_iron_defense
	ld hl, BarrierNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_iron_defense
	call CheckAcidArmorUsers
	jr nc, .not_acid_armor
	ld hl, BarrierNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_acid_armor
	ld hl, BarrierNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameBarrier:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckIronDefenseUsers
	jr nc, .not_iron_defense
	ld hl, BarrierNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_iron_defense
	call CheckAcidArmorUsers
	jr nc, .not_acid_armor
	ld hl, BarrierNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_acid_armor
	ld hl, BarrierNames
	ld a, 2
	jp GetMoveNameDone2
	
GetLockOnName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckMindReaderUsers
	jr nc, .not_mind_reader
	ld hl, LockOnNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_mind_reader
	ld hl, LockOnNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameLockOn:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMindReaderUsers
	jr nc, .not_mind_reader
	ld hl, LockOnNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_mind_reader
	ld hl, LockOnNames
	ld a, 1
	jp GetMoveNameDone2
	
GetSharpenName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckMeditateUsers
	jr nc, .not_meditate
	ld hl, SharpenNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_meditate
	call CheckHowlUsers
	jr nc, .not_howl
	ld hl, SharpenNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_howl
	ld hl, SharpenNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameSharpen:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMeditateUsers
	jr nc, .not_meditate
	ld hl, SharpenNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_meditate
	call CheckHowlUsers
	jr nc, .not_howl
	ld hl, SharpenNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_howl
	ld hl, SharpenNames
	ld a, 2
	jp GetMoveNameDone2
	
GetFurySwipesName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckFuryAttackUsers
	jr nc, .not_fury_attack
	ld hl, FurySwipesNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_fury_attack
	call CheckCometPunchUsers
	jr nc, .not_comet_punch
	ld hl, FurySwipesNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_comet_punch
	call CheckDoubleSlapUsers
	jr nc, .not_doubleslap
	ld hl, FurySwipesNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_doubleslap
	call CheckBarrageUsers
	jr nc, .not_barrage
	ld hl, FurySwipesNames
	ld a, 3
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_barrage
	call CheckSpikeCannonUsers
	jr nc, .not_spike_cannon
	ld hl, FurySwipesNames
	ld a, 4
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_spike_cannon
	ld hl, FurySwipesNames
	ld a, 5
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameFurySwipes:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckFuryAttackUsers
	jr nc, .not_fury_attack
	ld hl, FurySwipesNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_fury_attack
	call CheckCometPunchUsers
	jr nc, .not_comet_punch
	ld hl, FurySwipesNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_comet_punch
	call CheckDoubleSlapUsers
	jr nc, .not_doubleslap
	ld hl, FurySwipesNames
	ld a, 2
	jp GetMoveNameDone2
	
.not_doubleslap
	call CheckBarrageUsers
	jr nc, .not_barrage
	ld hl, FurySwipesNames
	ld a, 3
	jp GetMoveNameDone2
	
.not_barrage
	call CheckSpikeCannonUsers
	jr nc, .not_spike_cannon
	ld hl, FurySwipesNames
	ld a, 4
	jp GetMoveNameDone2
	
.not_spike_cannon
	ld hl, FurySwipesNames
	ld a, 5
	jp GetMoveNameDone2
	
GetSynthesisName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckMoonlightUsers
	jr nc, .not_moonlight
	ld hl, SynthesisNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_moonlight
	call CheckMorningSunUsers
	jr nc, .not_morning_sun
	ld hl, SynthesisNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_morning_sun
	ld hl, SynthesisNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameSynthesis:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMoonlightUsers
	jr nc, .not_moonlight
	ld hl, SynthesisNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_moonlight
	call CheckMorningSunUsers
	jr nc, .not_morning_sun
	ld hl, SynthesisNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_morning_sun
	ld hl, SynthesisNames
	ld a, 2
	jp GetMoveNameDone2
	
GetMeanLookName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckBlockUsers
	jr nc, .not_block
	ld hl, MeanLookNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_block
	call CheckSpiderWebUsers
	jr nc, .not_spider_web
	ld hl, MeanLookNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_spider_web
	ld hl, MeanLookNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameMeanLook:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckBlockUsers
	jr nc, .not_block
	ld hl, MeanLookNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_block
	call CheckSpiderWebUsers
	jr nc, .not_spider_web
	ld hl, MeanLookNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_spider_web
	ld hl, MeanLookNames
	ld a, 2
	jp GetMoveNameDone2
	
GetCharmName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckFeatherDanceUsers
	jr nc, .not_feather_dance
	ld hl, CharmNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_feather_dance
	ld hl, CharmNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameCharm:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckFeatherDanceUsers
	jr nc, .not_feather_dance
	ld hl, CharmNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_feather_dance
	ld hl, CharmNames
	ld a, 1
	jp GetMoveNameDone2
	
GetScaryFaceName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckCottonSporeUsers
	jr nc, .not_cotton_spore
	ld hl, ScaryFaceNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_cotton_spore
	call CheckStringShotUsers
	jr nc, .not_string_shot
	ld hl, ScaryFaceNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_string_shot
	ld hl, ScaryFaceNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameScaryFace:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckCottonSporeUsers
	jr nc, .not_cotton_spore
	ld hl, ScaryFaceNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_cotton_spore
	call CheckStringShotUsers
	jr nc, .not_string_shot
	ld hl, ScaryFaceNames
	ld a, 1
	jp GetMoveNameDone2
.not_string_shot
	ld hl, ScaryFaceNames
	ld a, 2
	jp GetMoveNameDone2
	
GetRoarName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckWhirlwindUsers
	jr nc, .not_whirlwind
	ld hl, RoarNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_whirlwind
	ld hl, RoarNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameRoar:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	call CheckWhirlwindUsers
	jr nc, .not_whirlwind
	ld hl, RoarNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_whirlwind
	ld hl, RoarNames
	ld a, 1
	jp GetMoveNameDone2
	
GetSandAttackName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckSmokescreenUsers
	jr nc, .not_smokescreen
	ld hl, SandAttackNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_smokescreen
	ld hl, SandAttackNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameSandAttack:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckSmokescreenUsers
	jr nc, .not_smokescreen
	ld hl, SandAttackNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_smokescreen
	ld hl, SandAttackNames
	ld a, 1
	jp GetMoveNameDone2
	
GetSoftboiledName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckMilkDrinkUsers
	jr nc, .not_milk_drink
	ld hl, SoftboiledNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_milk_drink
	call CheckSoftboiledUsers
	jr nc, .not_softboiled
	ld hl, SoftboiledNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_softboiled
	ld hl, SoftboiledNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameSoftboiled:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMilkDrinkUsers
	jr nc, .not_milk_drink
	ld hl, SoftboiledNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_milk_drink
	call CheckSoftboiledUsers
	jr nc, .not_softboiled
	ld hl, SoftboiledNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_softboiled
	ld hl, SoftboiledNames
	ld a, 2
	jp GetMoveNameDone2
	
GetForesightName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckOdorSleuthUsers
	jr nc, .not_odor_sleuth
	ld hl, ForesightNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_odor_sleuth
	call CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld hl, ForesightNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_miracle_eye
	ld hl, ForesightNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameForesight:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckOdorSleuthUsers
	jr nc, .not_odor_sleuth
	ld hl, ForesightNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_odor_sleuth
	call CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld hl, ForesightNames
	ld a, 1
	jp GetMoveNameDone2
	
.not_miracle_eye
	ld hl, ForesightNames
	ld a, 2
	jp GetMoveNameDone2
	
GetAgilityName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckRockPolishUsers
	jr nc, .not_rock_polish
	ld hl, AgilityNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_rock_polish
	ld hl, AgilityNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameAgility:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckRockPolishUsers
	jr nc, .not_rock_polish
	ld hl, AgilityNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_rock_polish
	ld hl, AgilityNames
	ld a, 1
	jp GetMoveNameDone2
	
GetWorkUpName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckGrowthUsers
	jr nc, .not_growth
	ld hl, WorkUpNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_growth
	ld hl, WorkUpNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone

GetMoveNameWorkUp:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckGrowthUsers
	jr nc, .not_growth
	ld hl, WorkUpNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_growth
	ld hl, WorkUpNames
	ld a, 1
	jp GetMoveNameDone2
	
	
GetTransformName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckTransformUsers
	jr c, .transform
	call CheckSketchUsers
	jr c, .sketch
	call CheckMimicUsers
	jr c, .mimic
	call CheckMetronomeUsers
	jr c, .metronome
	ld hl, TransformNames
	ld a, 4
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
.transform
	ld hl, TransformNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
.sketch
	ld hl, TransformNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
.mimic
	ld hl, TransformNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
.metronome
	ld hl, TransformNames
	ld a, 3
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameTransform:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckTransformUsers
	jr c, .transform
	call CheckSketchUsers
	jr c, .sketch
	call CheckMimicUsers
	jr c, .mimic
	call CheckMetronomeUsers
	jr c, .metronome
	ld hl, TransformNames
	ld a, 3
	jp GetMoveNameDone2
	
.transform
	ld hl, TransformNames
	ld a, 0
	jp GetMoveNameDone2

.sketch
	ld hl, TransformNames
	ld a, 1
	jp GetMoveNameDone2
	
.mimic
	ld hl, TransformNames
	ld a, 2
	jp GetMoveNameDone2
	
.metronome
	ld hl, TransformNames
	ld a, 3
	jp GetMoveNameDone2

	
GetSingName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckHypnosisUsers
	jr nc, .not_hypnosis
	ld hl, SingNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
.not_hypnosis
	ld hl, SingNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jp GetMoveNameDone
	
GetMoveNameSing:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckHypnosisUsers
	jr nc, .not_hypnosis
	ld hl, SingNames
	ld a, 0
	jp GetMoveNameDone2
	
.not_hypnosis
	ld hl, SingNames
	ld a, 1
	jp GetMoveNameDone2

GetMoveNameDone:
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameDone2:
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	ld de, wStringBuffer1
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

CheckDitto:
	cp DITTO
	ret nz
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	ret z
	ld a, [wEnemyMonSpecies]
	ret
	
CheckPoundUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckPoundUsers2::
	ld hl, PoundUsers
	ld de, 1
	call IsInArray
	ret
	
CheckScratchUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckScratchUsers2::
	ld hl, ScratchUsers
	ld de, 1
	call IsInArray
	ret

CheckWithdrawUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckWithdrawUsers2::
	ld hl, WithdrawUsers
	ld de, 1
	call IsInArray
	ret
	
CheckHardenUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckHardenUsers2::
	ld hl, HardenUsers
	ld de, 1
	call IsInArray
	ret
	
CheckTailWhipUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckTailWhipUsers2::
	ld hl, TailWhipUsers
	ld de, 1
	call IsInArray
	ret
	
CheckIronDefenseUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckIronDefenseUsers2::
	ld hl, IronDefenseUsers
	ld de, 1
	call IsInArray
	ret
	
CheckAcidArmorUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckAcidArmorUsers2::
	ld hl, AcidArmorUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMindReaderUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMindReaderUsers2::
	ld hl, MindReaderUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMeditateUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMeditateUsers2::
	ld hl, MeditateUsers
	ld de, 1
	call IsInArray
	ret
	
CheckHowlUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckHowlUsers2::
	ld hl, HowlUsers
	ld de, 1
	call IsInArray
	ret
	
CheckFuryAttackUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckFuryAttackUsers2::
	ld hl, FuryAttackUsers
	ld de, 1
	call IsInArray
	ret
	
CheckCometPunchUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckCometPunchUsers2::
	ld hl, CometPunchUsers
	ld de, 1
	call IsInArray
	ret
	
CheckDoubleSlapUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckDoubleSlapUsers2::
	ld hl, DoubleSlapUsers
	ld de, 1
	call IsInArray
	ret
	
CheckBarrageUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckBarrageUsers2::
	ld hl, BarrageUsers
	ld de, 1
	call IsInArray
	ret

CheckSpikeCannonUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckSpikeCannonUsers2::
	ld hl, SpikeCannonUsers
	ld de, 1
	call IsInArray
	ret

CheckMoonlightUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMoonlightUsers2::
	ld hl, MoonlightUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMorningSunUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMorningSunUsers2::
	ld hl, MorningSunUsers
	ld de, 1
	call IsInArray
	ret
	
CheckBlockUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckBlockUsers2::
	ld hl, BlockUsers
	ld de, 1
	call IsInArray
	ret
	
CheckSpiderWebUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckSpiderWebUsers2::
	ld hl, SpiderWebUsers
	ld de, 1
	call IsInArray
	ret
	
CheckFeatherDanceUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckFeatherDanceUsers2::
	ld hl, FeatherDanceUsers
	ld de, 1
	call IsInArray
	ret
	
CheckCottonSporeUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckCottonSporeUsers2::
	ld hl, CottonSporeUsers
	ld de, 1
	call IsInArray
	ret
	
CheckStringShotUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckStringShotUsers2::
	ld hl, CottonSporeUsers
	ld de, 2
	call IsInArray
	ret
	
CheckWhirlwindUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckWhirlwindUsers2::
	ld hl, WhirlwindUsers
	ld de, 1
	call IsInArray
	ret
	
CheckSmokescreenUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckSmokescreenUsers2::
	ld hl, SmokescreenUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMilkDrinkUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMilkDrinkUsers2::
	ld hl, MilkDrinkUsers
	ld de, 1
	call IsInArray
	ret
	
CheckSoftboiledUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckSoftboiledUsers2::
	ld hl, SoftboiledUsers
	ld de, 1
	call IsInArray
	ret
	
CheckOdorSleuthUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckOdorSleuthUsers2::
	ld hl, OdorSleuthUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMiracleEyeUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMiracleEyeUsers2::
	ld hl, MiracleEyeUsers
	ld de, 1
	call IsInArray
	ret
	
CheckRockPolishUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckRockPolishUsers2::
	ld hl, RockPolishUsers
	ld de, 1
	call IsInArray
	ret
	
CheckGrowthUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckGrowthUsers2::
	ld hl, GrowthUsers
	ld de, 1
	call IsInArray
	ret
	
CheckTransformUsers::
	ld a, [wCurPartySpecies]
CheckTransformUsers2::
	ld hl, TransformUsers
	ld de, 1
	call IsInArray
	ret
	
CheckSketchUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckSketchUsers2::
	ld hl, SketchUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMimicUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMimicUsers2::
	ld hl, MimicUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMetronomeUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckMetronomeUsers2::
	ld hl, MetronomeUsers
	ld de, 1
	call IsInArray
	ret
	
CheckHypnosisUsers::
	ld a, [wCurPartySpecies]
	call CheckDitto
CheckHypnosisUsers2::
	ld hl, HypnosisUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMultiMoveSlot::
	ld a, [wCurMove]
CheckMultiMoveSlot2::
	ld hl, MultiSlotMoves
	ld de, 1
	call IsInArray
	ret
	
GetMultiMoveSlotName::
	ld a, [wCurMove]
GetMultiMoveSlotName2::
	cp TACKLE_SCRATCH_POUND
	jr z, .tackle
	cp DEFENSE_CURL_HARDEN_WITHDRAW
	jr z, .defense_curl
	cp LEER_TAIL_WHIP
	jr z, .leer
	cp BARRIER_IRON_DEFENSE_ACID_ARMOR
	jr z, .barrier
	cp LOCK_ON_MIND_READER
	jr z, .lock_on
	cp SHARPEN_HOWL_MEDITATE
	jr z, .sharpen
	cp MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	jr z, .fury_swipes
	cp SYNTHESIS_MOONLIGHT_MORNING_SUN
	jr z, .synthesis
	cp MEAN_LOOK_BLOCK_SPIDER_WEB
	jr z, .mean_look
	cp CHARM_FEATHER_DANCE
	jr z, .charm
	cp SCARY_FACE_COTTON_SPORE_STRING_SHOT
	jr z, .scary_face
	cp ROAR_WHIRLWIND
	jr z, .roar
	cp SAND_ATTACK_SMOKESCREEN
	jr z, .sand_attack
	cp SOFTBOILED_MILK_DRINK_RECOVER
	jr z, .softboiled
	cp FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	jr z, .foresight
	cp AGILITY_ROCK_POLISH
	jr z, .agility
	cp WORK_UP_GROWTH
	jr z, .workup
	cp TRANSFORM_SKETCH_MIMIC_SPLASH
	jr z, .transform
	cp SING_HYPNOSIS
	jr z, .sing
	jr .end
.tackle
	call GetMoveNameTackle
	jr .end
.defense_curl
	call GetMoveNameDefenseCurl
	jr .end
.leer
	call GetMoveNameLeer
	jr .end
.barrier
	call GetMoveNameBarrier
	jr .end
.lock_on
	call GetMoveNameLockOn
	jr .end
.sharpen
	call GetMoveNameSharpen
	jr .end
.fury_swipes
	call GetMoveNameFurySwipes
	jr .end
.synthesis
	call GetMoveNameSynthesis
	jr .end
.mean_look
	call GetMoveNameMeanLook
	jr .end
.charm
	call GetMoveNameCharm
	jr .end
.scary_face
	call GetMoveNameScaryFace
	jr .end
.roar
	call GetMoveNameRoar
	jr .end
.sand_attack
	call GetMoveNameSandAttack
	jr .end
.softboiled
	call GetMoveNameSoftboiled
	jr .end
.foresight
	call GetMoveNameForesight
	jr .end
.agility
	call GetMoveNameAgility
	jr .end
.workup
	call GetMoveNameWorkUp
	jr .end
.transform
	call GetMoveNameTransform
	jr .end
.sing
	call GetMoveNameSing
.end
	ret

CheckTackleThing::
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckPoundUsers2
	pop de
	jr nc, .not_pound
	ld a, $2
	ld [wKickCounter], a
	ret
.not_pound
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2

.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckScratchUsers2
	pop de
	jr nc, .not_scratch
	ld a, $3
	ld [wKickCounter], a
	ret

.not_scratch
	ld a, $1
	ld [wKickCounter], a
	ret

CheckFuryStrikesThing::
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckFuryAttackUsers2
	pop de
	jr nc, .not_fury_attack
	ld a, $2
	ld [wKickCounter], a
	ret
.not_fury_attack
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckCometPunchUsers2
	pop de
	jr nc, .not_comet_punch
	ld a, $3
	ld [wKickCounter], a
	ret
.not_comet_punch
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip3
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species3
	ld a, [wBattleMonSpecies]
	jr .got_user_species3
	
.skip3
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species3
	ld a, [wEnemyMonSpecies]
.got_user_species3
	farcall CheckDoubleSlapUsers2
	pop de
	jr nc, .not_doubleslap
	ld a, $4
	ld [wKickCounter], a
	ret
.not_doubleslap
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip4
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species4
	ld a, [wBattleMonSpecies]
	jr .got_user_species4
	
.skip4
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species4
	ld a, [wEnemyMonSpecies]
.got_user_species4
	farcall CheckBarrageUsers2
	pop de
	jr nc, .not_barrage
	ld a, $5
	ld [wKickCounter], a
	ret
.not_barrage
	push de
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip5
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species4
	ld a, [wBattleMonSpecies]
	jr .got_user_species5
	
.skip5
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species5
	ld a, [wEnemyMonSpecies]
.got_user_species5
	farcall CheckSpikeCannonUsers2
	pop de
	jr nc, .not_spike_cannon
	ld a, $6
	ld [wKickCounter], a
	ret

.not_spike_cannon
	ld a, $1
	ld [wKickCounter], a
	ret
	
CheckDefenseCurlThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckWithdrawUsers2
	jr nc, .not_withdraw
	ld a, $1
	ret
.not_withdraw
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckHardenUsers2
	jr nc, .not_harden
	ld a, $2
	ret
.not_harden
	ret
	
CheckLeerThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckTailWhipUsers2
	jr nc, .not_tailwhip
	ld a, $1
	ret
.not_tailwhip
	ret
	
CheckBarrierThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckIronDefenseUsers2
	jr nc, .not_iron_defense
	ld a, $1
	ret
.not_iron_defense
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckAcidArmorUsers2
	jr nc, .not_acid_armor
	ld a, $2
	ret
.not_acid_armor
	ret
	
CheckSharpenThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckMeditateUsers2
	jr nc, .not_meditate
	ld a, $1
	ret
.not_meditate
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckHowlUsers2
	jr nc, .not_howl
	ld a, $2
	ret
.not_howl
	ret
	
CheckCharmThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckFeatherDanceUsers2
	jr nc, .not_feather_dance
	ld a, $1
	ret
.not_feather_dance
	ret
	
CheckScaryFaceThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckCottonSporeUsers2
	jr nc, .not_scary_face
	ld a, $1
	ret
.not_scary_face
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckStringShotUsers2
	jr nc, .not_string_shot
	ld a, $2
	ret
.not_string_shot
	ret
	
CheckRoarThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckWhirlwindUsers2
	jr nc, .not_whirlwind
	ld a, $2
	ret
.not_whirlwind
	ld a, $1
	ret
	
CheckSandAttackThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckSmokescreenUsers2
	jr nc, .not_smokescreen
	ld a, $1
	ret
.not_smokescreen
	ret
	
CheckSoftboiledThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckMilkDrinkUsers2
	jr nc, .not_milk_drink
	ld a, $1
	ret
.not_milk_drink
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckSoftboiledUsers2
	jr nc, .not_softboiled
	ld a, $2
	ret
.not_softboiled
	ret
	
CheckForesightThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckOdorSleuthUsers2
	jr nc, .not_odor_sleuth
	ld a, $1
	ret
.not_odor_sleuth
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckMiracleEyeUsers2
	jr nc, .not_miracle_eye
	ld a, $2
	ret
.not_miracle_eye
	ret
	
CheckAgilityThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckRockPolishUsers2
	jr nc, .not_rock_polish
	ld a, $1
	ret
.not_rock_polish
	ret
	
CheckWorkUpThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckGrowthUsers2
	jr nc, .not_growth
	ld a, $1
	ret
.not_growth
	ret
	
CheckTransformThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species1
	ld a, [wBattleMonSpecies]
	jr .got_user_species1
	
.skip1
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species1
	ld a, [wEnemyMonSpecies]
.got_user_species1
	farcall CheckTransformUsers2
	jr nc, .not_transform
	ld a, $1
	ret
.not_transform
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
	jr .got_user_species2
	
.skip2
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species2
	ld a, [wEnemyMonSpecies]
.got_user_species2
	farcall CheckSketchUsers2
	jr nc, .not_sketch
	ld a, $2
	ret
.not_sketch
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip3
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species3
	ld a, [wBattleMonSpecies]
	jr .got_user_species3
	
.skip3
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species3
	ld a, [wEnemyMonSpecies]
.got_user_species3
	farcall CheckMimicUsers2
	jr nc, .not_mimic
	ld a, $3
	ret
.not_mimic
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip4
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species4
	ld a, [wBattleMonSpecies]
	jr .got_user_species4
	
.skip4
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species4
	ld a, [wEnemyMonSpecies]
.got_user_species4
	farcall CheckMetronomeUsers2
	jr nc, .not_metronome
	ld a, $14
	ret
.not_metronome
;splash
	ld a, $9
	ret
	
CheckSingThing::
	ld a, [wMirrorMoveUsed]
	and a
	jr z, .skip
	ld a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species
	ld a, [wBattleMonSpecies]
	jr .got_user_species
	
.skip
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckHypnosisUsers2
	jr nc, .not_hypnosis
	ld a, $1
	ret
.not_hypnosis
	ret

PoundUsers:
	db CLEFAIRY
	db CLEFABLE
	db JIGGLYPUFF
	db WIGGLYTUFF
	db POLIWAG
	db POLIWHIRL
	db POLIWRATH
	db GRIMER
	db MUK
	db CHANSEY
	db DRATINI
	db DRAGONAIR
	db DRAGONITE
	db POLITOED
	db SUDOWOODO
	db SNOVER
	db ABOMASNOW
	db SNORUNT
	db GLALIE
	db FROSLASS
	db -1
	
ScratchUsers:
	db CHARMANDER
	db CHARMELEON
	db CHARIZARD
	db TOTODILE
	db CROCONAW
	db FERALIGATR
	db BUIZEL
	db FLOATZEL
	db NIDORAN_F
	db NIDORINA
	db NIDOQUEEN
	db TEDDIURSA
	db URSARING
	db SNEASEL
	db WEAVILE
	db -1

WithdrawUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db SLOWPOKE
	db SLOWBRO
	db SLOWKING
	db DWEBBLE
	db CRUSTLE
	db -1

HardenUsers:
	db ONIX
	db STEELIX
	db STARYU
	db STARMIE
	db SLUGMA
	db MAGCARGO
	db CORSOLA
	db ARON
	db LAIRON
	db AGGRON
	db GLIGAR
	db GLISCOR
	db GRIMER
	db MUK
	db -1

TailWhipUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db RATTATA
	db RATICATE
	db SNUBBULL
	db GRANBULL
	db NIDORAN_F
	db NIDORINA
	db NIDOQUEEN
	db WOOPER
	db QUAGSIRE
	db MARILL
	db AZUMARILL
	db EEVEE
	db VAPOREON
	db JOLTEON
	db FLAREON
	db ESPEON
	db UMBREON
	db LEAFEON
	db GLACEON
	db SYLVEON
	db TAUROS
	db -1
	
IronDefenseUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db VENIPEDE
	db WHIRLIPEDE
	db SCOLIPEDE
	db PINECO
	db FORRETRESS
	db SCYTHER
	db SCIZOR
	db CORSOLA
	db LARVITAR
	db PUPITAR
	db TYRANITAR
	db -1
	
AcidArmorUsers:
	db VAPOREON
	db GRIMER
	db MUK
	db -1
	
MeditateUsers:
	db MEDITITE
	db MEDICHAM
	db -1
	
HowlUsers:
	db GROWLITHE
	db ARCANINE
	db HOUNDOUR
	db HOUNDOOM
	db SNEASEL
	db WEAVILE
	db -1
	
FuryAttackUsers:
	db SMEARGLE
	db NIDORAN_M
	db NIDORINO
	db NIDOKING
	db DODUO
	db DODRIO
	db HERACROSS
	db SWINUB
	db PILOSWINE
	db MAMOSWINE
	db PIKIPEK
	db TRUMBEAK
	db TOUCANNON
	db -1

BarrageUsers:
	db EXEGGCUTE
	db EXEGGUTOR
	db -1

CometPunchUsers:
	db LEDYBA
	db LEDIAN
	db -1
	
SpikeCannonUsers:
	db CORSOLA
	db -1
	
DoubleSlapUsers:
	db CLEFAIRY
	db CLEFABLE
	db JIGGLYPUFF
	db WIGGLYTUFF
	db POLIWAG
	db POLIWHIRL
	db POLIWRATH
	db POLITOED
	db -1
	
MoonlightUsers:
	db CLEFAIRY
	db CLEFABLE
	db ODDISH
	db GLOOM
	db VILEPLUME
	db BELLOSSOM
	db UMBREON
	db SYLVEON
	db -1
	
MorningSunUsers:
	db ESPEON
	db -1
	
BlockUsers:
	db SMEARGLE
	db MUNCHLAX
	db SNORLAX
	db SUDOWOODO
	db -1
	
SpiderWebUsers:
	db JOLTIK
	db GALVANTULA
	db -1
	
FeatherDanceUsers:
	db PIDGEY
	db PIDGEOTTO
	db PIDGEOT
	db -1
	
CottonSporeUsers:
	db MAREEP
	db FLAAFFY
	db AMPHAROS
	db COTTONEE
	db WHIMSICOTT
	db -1
	
StringShotUsers:
	db JOLTIK
	db GALVANTULA
	db LARVESTA
	db VOLCARONA
	db -1
	
WhirlwindUsers:
	db PIDGEY
	db PIDGEOTTO
	db PIDGEOT
	db NOIBAT
	db NOIVERN
	db -1
	
SmokescreenUsers:
	db CHARMANDER
	db CHARMELEON
	db CHARIZARD
	db KOFFING
	db WEEZING
	db MAGMAR
	db MAGBY
	db MAGMORTAR
	db CYNDAQUIL
	db QUILAVA
	db TYPHLOSION
	db -1
	
MilkDrinkUsers:
	db MILTANK
	db TAUROS
	db -1
	
SoftboiledUsers:
	db CHANSEY
	db BLISSEY
	db CLEFAIRY
	db CLEFABLE
	db TOGEPI
	db TOGETIC
	db TOGEKISS
	db -1
	
OdorSleuthUsers:
	db GROWLITHE
	db ARCANINE
	db MUNCHLAX
	db SNORLAX
	db SWINUB
	db PILOSWINE
	db MAMOSWINE
	db PHANPY
	db DONPHAN
	db -1
	
MiracleEyeUsers:
	db ABRA
	db KADABRA
	db ALAKAZAM
	db -1
	
RockPolishUsers:
	db GEODUDE
	db GRAVELER
	db GOLEM
	db DWEBBLE
	db CRUSTLE
	db ONIX
	db STEELIX
	db -1
	
GrowthUsers:
	db BULBASAUR
	db IVYSAUR
	db VENUSAUR
	db ODDISH
	db GLOOM
	db VILEPLUME
	db BELLOSSOM
	db COTTONEE
	db WHIMSICOTT
	db -1
	
HealBellUsers:
	db MILTANK
	db CORSOLA
	db -1
	
TransformUsers:
	db DITTO
	db -1
	
SketchUsers:
	db SMEARGLE
	db -1
	
MimicUsers:
	db JIGGLYPUFF
	db WIGGLYTUFF
	db EEVEE
	db VAPOREON
	db JOLTEON
	db FLAREON
	db SUDOWOODO
	db ESPEON
	db UMBREON
	db LEAFEON
	db GLACEON
	db SYLVEON
	db MIMIKYU
	db SNUBBULL
	db GRANBULL
	db -1
	
MetronomeUsers:
	db DREEPY
	db CLEFAIRY
	db CLEFABLE
	db MUNCHLAX
	db SNORLAX
	db TOGEPI
	db TOGETIC
	db TOGEKISS
	db -1
	
HypnosisUsers:
	db SMEARGLE
	db POLIWAG
	db POLIWHIRL
	db POLIWRATH
	db POLITOED
	db SLOWPOKE
	db SLOWBRO
	db SLOWKING
	db GASTLY
	db HAUNTER
	db GENGAR
	db EXEGGCUTE
	db EXEGGUTOR
	db STANTLER
	db WYRDEER
	db RALTS
	db KIRLIA
	db GARDEVOIR
	db GALLADE
	db SPIRITOMB
	db -1
	
TackleNames:
	db "POUND@"
	db "SCRATCH@"
	db "TACKLE@"
	db -1
	
DefenseCurlNames:
	db "WITHDRAW@"
	db "HARDEN@"
	db "DEFENSE CURL@"
	db -1
	
LeerNames:
	db "TAIL WHIP@"
	db "LEER@"
	db -1
	
BarrierNames:
	db "IRON DEFENSE@"
	db "ACID ARMOR@"
	db "BARRIER@"
	db -1
	
LockOnNames:
	db "MIND READER@"
	db "LOCK ON@"
	db -1
	
SharpenNames:
	db "MEDITATE@"
	db "HOWL@"
	db "SHARPEN@"
	db -1
	
FurySwipesNames:
	db "FURY ATTACK@"
	db "COMET PUNCH@"
	db "DOUBLESLAP@"
	db "BARRAGE@"
	db "SPIKE CANNON@"
	db "FURY SWIPES@"
	db -1
	
SynthesisNames:
	db "MOONLIGHT@"
	db "MORNING SUN@"
	db "SYNTHESIS@"
	db -1
	
MeanLookNames:
	db "BLOCK@"
	db "SPIDER WEB@"
	db "MEAN LOOK@"
	db -1
	
CharmNames:
	db "FEATHERDANCE@"
	db "CHARM@"
	db -1
	
ScaryFaceNames:
	db "COTTON SPORE@"
	db "STRING SHOT@"
	db "SCARY FACE@"
	db -1
	
RoarNames:
	db "WHIRLWIND@"
	db "ROAR@"
	db -1
	
SandAttackNames:
	db "SMOKESCREEN@"
	db "SAND ATTACK@"
	db -1
	
SoftboiledNames:
	db "MILK DRINK@"
	db "SOFTBOILED@"
	db "RECOVER@"
	db -1
	
ForesightNames:
	db "ODOR SLEUTH@"
	db "MIRACLE EYE@"
	db "FORESIGHT@"
	db -1
	
AgilityNames:
	db "ROCK POLISH@"
	db "AGILITY@"
	db -1
	
WorkUpNames:
	db "GROWTH@"
	db "WORK UP@"
	db -1
	
TransformNames:
	db "TRANSFORM@"
	db "SKETCH@"
	db "MIMIC@"
	db "METRONOME@"
	db "SPLASH@"
	db -1
	
SingNames:
	db "HYPNOSIS@"
	db "SING@"
	db -1
	
MultiSlotMoves:
	db TACKLE_SCRATCH_POUND
	db DEFENSE_CURL_HARDEN_WITHDRAW
	db LEER_TAIL_WHIP
	db BARRIER_IRON_DEFENSE_ACID_ARMOR
	db LOCK_ON_MIND_READER
	db SHARPEN_HOWL_MEDITATE
	db MULTI_MOVE_FURY_COMET_BARRAGE_SLAP_CANNON
	db SYNTHESIS_MOONLIGHT_MORNING_SUN
	db MEAN_LOOK_BLOCK_SPIDER_WEB
	db CHARM_FEATHER_DANCE
	db SCARY_FACE_COTTON_SPORE_STRING_SHOT
	db ROAR_WHIRLWIND
	db SAND_ATTACK_SMOKESCREEN
	db SOFTBOILED_MILK_DRINK_RECOVER
	db FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db AGILITY_ROCK_POLISH
	db WORK_UP_GROWTH
	db TRANSFORM_SKETCH_MIMIC_SPLASH
	db SING_HYPNOSIS
	db -1
	
MultiSlotMoveTypes::
	push hl
	push bc
	push de
	push af
	ld a, [wCurMove]
	cp DEFENSE_CURL_HARDEN_WITHDRAW
	jr z, .defense_curl
	cp BARRIER_IRON_DEFENSE_ACID_ARMOR
	jr z, .barrier
	cp SHARPEN_HOWL_MEDITATE
	jr z, .sharpen
	cp SYNTHESIS_MOONLIGHT_MORNING_SUN
	jr z, .synthesis
	cp MEAN_LOOK_BLOCK_SPIDER_WEB
	jp z, .mean_look
	cp SAND_ATTACK_SMOKESCREEN
	jp z, .sand_attack
	cp SCARY_FACE_COTTON_SPORE_STRING_SHOT
	jp z, .scary_face
	cp FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	jp z, .foresight
	cp CHARM_FEATHER_DANCE
	jp z, .charm
	cp AGILITY_ROCK_POLISH
	jp z, .agility
	cp SING_HYPNOSIS
	jp z, .sing
	pop af
	jp MultiSlotMoveTypesFinish
.defense_curl
	pop af
	call CheckWithdrawUsers
	jr nc, .not_withdraw
	ld a, WATER
	jp MultiSlotMoveTypesFinish
.not_withdraw
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
	
.barrier
	pop af
	call CheckIronDefenseUsers
	jr nc, .not_iron_defense
	ld a, STEEL
	jp MultiSlotMoveTypesFinish
.not_iron_defense
	call CheckAcidArmorUsers
	jr nc, .not_acid_armor
	ld a, POISON
	jp MultiSlotMoveTypesFinish
.not_acid_armor
	ld a, PSYCHIC
	jp MultiSlotMoveTypesFinish
	
.sharpen
	pop af
	call CheckMeditateUsers
	jr nc, .not_meditate
	ld a, PSYCHIC
	jp MultiSlotMoveTypesFinish
.not_meditate
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
	
.synthesis
	pop af
	call CheckMoonlightUsers
	jr nc, .not_moonlight
	ld a, FAIRY
	jp MultiSlotMoveTypesFinish
.not_moonlight
	call CheckMorningSunUsers
	jr nc, .not_morning_sun
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
.not_morning_sun
	ld a, GRASS
	jp MultiSlotMoveTypesFinish
	
.mean_look
	pop af
	call CheckSpiderWebUsers
	jr nc, .not_spider_web
	ld a, BUG
	jp MultiSlotMoveTypesFinish
.not_spider_web
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
	
.sand_attack
	pop af
	call CheckSmokescreenUsers
	jr nc, .not_smokescreen
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
.not_smokescreen
	ld a, GROUND
	jp MultiSlotMoveTypesFinish
	
.scary_face
	pop af
	call CheckCottonSporeUsers
	jr nc, .not_cotton_spore
	ld a, GRASS
	jp MultiSlotMoveTypesFinish
.not_cotton_spore
	call CheckStringShotUsers
	jr nc, .not_string_shot
	ld a, BUG
.not_string_shot
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
	
.foresight
	pop af
	call CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld a, PSYCHIC
	jp MultiSlotMoveTypesFinish
.not_miracle_eye
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish
	
.charm
	pop af
	call CheckFeatherDanceUsers
	jr nc, .not_feather_dance
	ld a, FLYING
	jp MultiSlotMoveTypesFinish
.not_feather_dance
	ld a, FAIRY
	jp MultiSlotMoveTypesFinish
	
.agility
	pop af
	call CheckRockPolishUsers
	jr nc, .not_rock_polish
	ld a, ROCK
	jp MultiSlotMoveTypesFinish
.not_rock_polish
	ld a, PSYCHIC
	jp MultiSlotMoveTypesFinish
	
.sing
	pop af
	call CheckHypnosisUsers
	jr nc, .not_hypnosis
	ld a, PSYCHIC
	jp MultiSlotMoveTypesFinish
.not_hypnosis
	ld a, NORMAL
	jp MultiSlotMoveTypesFinish

MultiSlotMoveTypesFinish:
	pop de
	pop bc
	pop hl
	ret