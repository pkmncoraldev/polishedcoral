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
	jr .done
.not_tackle
	call CheckScratchUsers
	jr nc, .not_scratch
	ld hl, TackleNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_scratch
	ld hl, TackleNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameTackle:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckPoundUsers
	jr nc, .not_tackle
	ld hl, TackleNames
	ld a, 0
	jr .done
	
.not_tackle
	call CheckScratchUsers
	jr nc, .not_scratch
	ld hl, TackleNames
	ld a, 1
	jr .done
	
.not_scratch
	ld hl, TackleNames
	ld a, 2
	
.done
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
	jr .done
.not_withdraw
	call CheckHardenUsers
	jr nc, .not_harden
	ld hl, DefenseCurlNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_harden
	ld hl, DefenseCurlNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameDefenseCurl:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckWithdrawUsers
	jr nc, .not_withdraw
	ld hl, DefenseCurlNames
	ld a, 0
	jr .done
	
.not_withdraw
	call CheckHardenUsers
	jr nc, .not_harden
	ld hl, DefenseCurlNames
	ld a, 1
	jr .done
	
.not_harden
	ld hl, DefenseCurlNames
	ld a, 2
	
.done
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
	jr .done
.not_tailwhip
	ld hl, LeerNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameLeer:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckTailWhipUsers
	jr nc, .not_tailwhip
	ld hl, LeerNames
	ld a, 0
	jr .done
	
.not_tailwhip
	ld hl, LeerNames
	ld a, 1
	
.done
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
	jr .done
.not_iron_defense
	ld hl, BarrierNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameBarrier:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckIronDefenseUsers
	jr nc, .not_iron_defense
	ld hl, BarrierNames
	ld a, 0
	jr .done
	
.not_iron_defense
	ld hl, BarrierNames
	ld a, 1
	
.done
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
	jr .done
.not_mind_reader
	ld hl, LockOnNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameLockOn:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMindReaderUsers
	jr nc, .not_mind_reader
	ld hl, LockOnNames
	ld a, 0
	jr .done
	
.not_mind_reader
	ld hl, LockOnNames
	ld a, 1
	
.done
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
	jr .done
.not_meditate
	call CheckHowlUsers
	jr nc, .not_howl
	ld hl, SharpenNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_howl
	ld hl, SharpenNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameSharpen:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMeditateUsers
	jr nc, .not_meditate
	ld hl, SharpenNames
	ld a, 0
	jr .done
	
.not_meditate
	call CheckHowlUsers
	jr nc, .not_howl
	ld hl, SharpenNames
	ld a, 1
	jr .done
	
.not_howl
	ld hl, SharpenNames
	ld a, 2
	
.done
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
	jr .done
.not_fury_attack
	call CheckCometPunchUsers
	jr nc, .not_comet_punch
	ld hl, FurySwipesNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_comet_punch
	ld hl, FurySwipesNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameFurySwipes:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckFuryAttackUsers
	jr nc, .not_fury_attack
	ld hl, FurySwipesNames
	ld a, 0
	jr .done
	
.not_fury_attack
	call CheckCometPunchUsers
	jr nc, .not_comet_punch
	ld hl, FurySwipesNames
	ld a, 1
	jr .done
	
.not_comet_punch
	ld hl, FurySwipesNames
	ld a, 2
	
.done
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
	jr .done
.not_moonlight
	call CheckMorningSunUsers
	jr nc, .not_morning_sun
	ld hl, SynthesisNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_morning_sun
	ld hl, SynthesisNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameSynthesis:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMoonlightUsers
	jr nc, .not_moonlight
	ld hl, SynthesisNames
	ld a, 0
	jr .done
	
.not_moonlight
	call CheckMorningSunUsers
	jr nc, .not_morning_sun
	ld hl, SynthesisNames
	ld a, 1
	jr .done
	
.not_morning_sun
	ld hl, SynthesisNames
	ld a, 2
	
.done
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
	jr .done
.not_block
	call CheckSpiderWebUsers
	jr nc, .not_spider_web
	ld hl, MeanLookNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_spider_web
	ld hl, MeanLookNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameMeanLook:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckBlockUsers
	jr nc, .not_block
	ld hl, MeanLookNames
	ld a, 0
	jr .done
	
.not_block
	call CheckSpiderWebUsers
	jr nc, .not_spider_web
	ld hl, MeanLookNames
	ld a, 1
	jr .done
	
.not_spider_web
	ld hl, MeanLookNames
	ld a, 2
	
.done
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
	jr .done
.not_feather_dance
	ld hl, CharmNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameCharm:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckFeatherDanceUsers
	jr nc, .not_feather_dance
	ld hl, CharmNames
	ld a, 0
	jr .done
	
.not_feather_dance
	ld hl, CharmNames
	ld a, 1
	
.done
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
	jr .done
.not_cotton_spore
	ld hl, ScaryFaceNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameScaryFace:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckCottonSporeUsers
	jr nc, .not_cotton_spore
	ld hl, ScaryFaceNames
	ld a, 0
	jr .done
	
.not_cotton_spore
	ld hl, ScaryFaceNames
	ld a, 1
	
.done
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
	jr .done
.not_whirlwind
	ld hl, RoarNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameRoar:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckWhirlwindUsers
	jr nc, .not_whirlwind
	ld hl, RoarNames
	ld a, 0
	jr .done
	
.not_whirlwind
	ld hl, RoarNames
	ld a, 1
	
.done
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
	jr .done
.not_smokescreen
	ld hl, SandAttackNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameSandAttack:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckSmokescreenUsers
	jr nc, .not_smokescreen
	ld hl, SandAttackNames
	ld a, 0
	jr .done
	
.not_smokescreen
	ld hl, SandAttackNames
	ld a, 1
	
.done
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
	
GetSoftboiledName::
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de

	call CheckMilkDrinkUsers
	jr nc, .not_milkdrink
	ld hl, SoftboiledNames
	ld a, 0
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_milkdrink
	ld hl, SoftboiledNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameSoftboiled:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckMilkDrinkUsers
	jr nc, .not_milkdrink
	ld hl, SoftboiledNames
	ld a, 0
	jr .done
	
.not_milkdrink
	ld hl, SoftboiledNames
	ld a, 1
	
.done
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
	jr .done
.not_odor_sleuth
	call CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld hl, ForesightNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	jr .done
.not_miracle_eye
	ld hl, ForesightNames
	ld a, 2
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetMoveNameForesight:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckOdorSleuthUsers
	jr nc, .not_odor_sleuth
	ld hl, ForesightNames
	ld a, 0
	jr .done
	
.not_odor_sleuth
	call CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld hl, ForesightNames
	ld a, 1
	jr .done
	
.not_miracle_eye
	ld hl, ForesightNames
	ld a, 2
	
.done
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
	jr .done
.not_rock_polish
	ld hl, AgilityNames
	ld a, 1
	call GetNthString
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	rst CopyBytes
	
.done
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret
	
GetMoveNameAgility:: ; 34f8
	ld a, [hROMBank]
	push af
	push hl
	push bc

	
	call CheckRockPolishUsers
	jr nc, .not_rock_polish
	ld hl, AgilityNames
	ld a, 0
	jr .done
	
.not_rock_polish
	ld hl, AgilityNames
	ld a, 1
	
.done
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
	
CheckPoundUsers::
	ld a, [wCurPartySpecies]
CheckPoundUsers2::
	ld hl, PoundUsers
	ld de, 1
	call IsInArray
	ret
	
CheckScratchUsers::
	ld a, [wCurPartySpecies]
CheckScratchUsers2::
	ld hl, ScratchUsers
	ld de, 1
	call IsInArray
	ret
	
CheckWithdrawUsers::
	ld a, [wCurPartySpecies]
	ld hl, WithdrawUsers
	ld de, 1
	call IsInArray
	ret
	
CheckHardenUsers::
	ld a, [wCurPartySpecies]
	ld hl, HardenUsers
	ld de, 1
	call IsInArray
	ret
	
CheckTailWhipUsers::
	ld a, [wCurPartySpecies]
	ld hl, TailWhipUsers
	ld de, 1
	call IsInArray
	ret
	
CheckIronDefenseUsers::
	ld a, [wCurPartySpecies]
	ld hl, IronDefenseUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMindReaderUsers::
	ld a, [wCurPartySpecies]
	ld hl, MindReaderUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMeditateUsers::
	ld a, [wCurPartySpecies]
	ld hl, MeditateUsers
	ld de, 1
	call IsInArray
	ret
	
CheckHowlUsers::
	ld a, [wCurPartySpecies]
	ld hl, HowlUsers
	ld de, 1
	call IsInArray
	ret
	
CheckFuryAttackUsers::
	ld a, [wCurPartySpecies]
CheckFuryAttackUsers2::
	ld hl, FuryAttackUsers
	ld de, 1
	call IsInArray
	ret
	
CheckCometPunchUsers::
	ld a, [wCurPartySpecies]
CheckCometPunchUsers2::
	ld hl, CometPunchUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMoonlightUsers::
	ld a, [wCurPartySpecies]
	ld hl, MoonlightUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMorningSunUsers::
	ld a, [wCurPartySpecies]
	ld hl, MorningSunUsers
	ld de, 1
	call IsInArray
	ret
	
CheckBlockUsers::
	ld a, [wCurPartySpecies]
	ld hl, BlockUsers
	ld de, 1
	call IsInArray
	ret
	
CheckSpiderWebUsers::
	ld a, [wCurPartySpecies]
	ld hl, SpiderWebUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMultiMoveSlot::
	ld a, [wCurMove]
	ld hl, MultiSlotMoves
	ld de, 1
	call IsInArray
	ret
	
CheckFeatherDanceUsers::
	ld a, [wCurPartySpecies]
	ld hl, FeatherDanceUsers
	ld de, 1
	call IsInArray
	ret
	
CheckCottonSporeUsers::
	ld a, [wCurPartySpecies]
	ld hl, CottonSporeUsers
	ld de, 1
	call IsInArray
	ret
	
CheckWhirlwindUsers::
	ld a, [wCurPartySpecies]
	ld hl, WhirlwindUsers
	ld de, 1
	call IsInArray
	ret
	
CheckSmokescreenUsers::
	ld a, [wCurPartySpecies]
	ld hl, SmokescreenUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMilkDrinkUsers::
	ld a, [wCurPartySpecies]
	ld hl, MilkDrinkUsers
	ld de, 1
	call IsInArray
	ret
	
CheckOdorSleuthUsers::
	ld a, [wCurPartySpecies]
	ld hl, OdorSleuthUsers
	ld de, 1
	call IsInArray
	ret
	
CheckMiracleEyeUsers::
	ld a, [wCurPartySpecies]
	ld hl, MiracleEyeUsers
	ld de, 1
	call IsInArray
	ret
	
CheckRockPolishUsers::
	ld a, [wCurPartySpecies]
	ld hl, RockPolishUsers
	ld de, 1
	call IsInArray
	ret
	
GetMultiMoveSlotName::
	ld a, [wCurMove]
	cp TACKLE_SCRATCH_POUND
	jr z, .tackle
	cp DEFENSE_CURL_HARDEN_WITHDRAW
	jr z, .defense_curl
	cp LEER_TAIL_WHIP
	jr z, .leer
	cp BARRIER_IRON_DEFENSE
	jr z, .barrier
	cp LOCK_ON_MIND_READER
	jr z, .lock_on
	cp SHARPEN_HOWL_MEDITATE
	jr z, .sharpen
	cp FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	jr z, .fury_swipes
	cp SYNTHESIS_MOONLIGHT_MORNING_SUN
	jr z, .synthesis
	cp MEAN_LOOK_BLOCK_SPIDER_WEB
	jr z, .mean_look
	cp CHARM_FEATHER_DANCE
	jr z, .charm
	cp SCARY_FACE_COTTON_SPORE
	jr z, .scary_face
	cp ROAR_WHIRLWIND
	jr z, .roar
	cp SAND_ATTACK_SMOKESCREEN
	jr z, .sand_attack
	cp SOFTBOILED_MILK_DRINK
	jr z, .softboiled
	cp FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	jr z, .foresight
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
.end
	ret

CheckTackleThing::  ;moved here because out of room oops
	push de
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	farcall CheckPoundUsers2
	pop de
	jr nc, .not_pound
	ld a, $2
	ld [wKickCounter], a
	ret
.not_pound
	push de
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

CheckFuryStrikesThing::  ;moved here because out of room oops
	push de
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species3
	ld a, [wEnemyMonSpecies]
.got_user_species3
	farcall CheckFuryAttackUsers2
	pop de
	jr nc, .not_fury_attack
	ld a, $2
	ld [wKickCounter], a
	ret
.not_fury_attack
	push de
	ld a, [hBattleTurn]
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species4
	ld a, [wEnemyMonSpecies]
.got_user_species4
	farcall CheckCometPunchUsers2
	pop de
	jr nc, .not_comet_punch
	ld a, $3
	ld [wKickCounter], a
	ret
.not_comet_punch
	ld a, $1
	ld [wKickCounter], a
	ret
	
CheckDefenseCurlThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckWithdrawUsers
	jr nc, .not_withdraw
	ld a, $1
	ret
.not_withdraw
	farcall CheckHardenUsers
	jr nc, .not_harden
	ld a, $2
	ret
.not_harden
	ret
	
CheckLeerThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckTailWhipUsers
	jr nc, .not_tailwhip
	ld a, $1
	ret
.not_tailwhip
	ret
	
CheckBarrierThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckIronDefenseUsers
	jr nc, .not_iron_defense
	ld a, $1
	ret
.not_iron_defense
	ret
	
CheckSharpenThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckMeditateUsers
	jr nc, .not_meditate
	ld a, $1
	ret
.not_meditate
	farcall CheckHowlUsers
	jr nc, .not_howl
	ld a, $2
	ret
.not_howl
	ret
	
CheckCharmThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckFeatherDanceUsers
	jr nc, .not_feather_dance
	ld a, $1
	ret
.not_feather_dance
	ret
	
CheckScaryFaceThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckCottonSporeUsers
	jr nc, .not_scary_face
	ld a, $1
	ret
.not_scary_face
	ret
	
CheckRoarThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckWhirlwindUsers
	jr nc, .not_whirlwind
	ld a, $2
	ret
.not_whirlwind
	ld a, $1
	ret
	
CheckSandAttackThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckSmokescreenUsers
	jr nc, .not_smokescreen
	ld a, $1
	ret
.not_smokescreen
	ret
	
CheckSoftboiledThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckMilkDrinkUsers
	jr nc, .not_milk_drink
	ld a, $1
	ret
.not_milk_drink
	ret
	
CheckForesightThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckOdorSleuthUsers
	jr nc, .not_odor_sleuth
	ld a, $1
	ret
.not_odor_sleuth
	farcall CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld a, $2
	ret
.not_miracle_eye
	ret
	
CheckAgilityThing::
	ld a, [hBattleTurn]
	and a
	farcall CheckRockPolishUsers
	jr nc, .not_rock_polish
	ld a, $1
	ret
.not_rock_polish
	ret

PoundUsers:
	db CLEFAIRY
	db CLEFABLE
	db JIGGLYPUFF
	db WIGGLYTUFF
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
	db CUBONE
	db MAROWAK
	db MAROWAK_A
	db -1
	
WithdrawUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db -1

HardenUsers:
	db SMEARGLE
	db -1

TailWhipUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db RATTATA
	db RATICATE
	db -1
	
IronDefenseUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db -1
	
MeditateUsers:
	db MEDITITE
	db MEDICHAM
	db -1
	
HowlUsers:
	db GROWLITHE
	db ARCANINE
	db -1
	
FuryAttackUsers:
	db SMEARGLE
	db -1
	
CometPunchUsers:
	db LEDYBA
	db LEDIAN
	db -1
	
MoonlightUsers:
	db CLEFAIRY
	db CLEFABLE
	db -1
	
MorningSunUsers:
	db SMEARGLE
	db -1
	
BlockUsers:
	db SMEARGLE
	db -1
	
SpiderWebUsers:
	db SMEARGLE
	db -1
	
FeatherDanceUsers:
	db PIDGEY
	db PIDGEOTTO
	db PIDGEOT
	db -1
	
CottonSporeUsers:
	db COTTONEE
	db WHIMSICOTT
	db -1
	
WhirlwindUsers:
	db PIDGEY
	db PIDGEOTTO
	db PIDGEOT
	db -1
	
SmokescreenUsers:
	db CHARMANDER
	db CHARMELEON
	db CHARIZARD
	db CYNDAQUIL
	db QUILAVA
	db TYPHLOSION
	db -1
	
MilkDrinkUsers:
	db SMEARGLE
	db -1
	
OdorSleuthUsers:
	db GROWLITHE
	db ARCANINE
	db -1
	
MiracleEyeUsers:
	db SMEARGLE
	db -1
	
RockPolishUsers:
	db GEODUDE
	db GRAVELER
	db GOLEM
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
	
MultiSlotMoves:
	db TACKLE_SCRATCH_POUND
	db DEFENSE_CURL_HARDEN_WITHDRAW
	db LEER_TAIL_WHIP
	db BARRIER_IRON_DEFENSE
	db LOCK_ON_MIND_READER
	db SHARPEN_HOWL_MEDITATE
	db FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db SYNTHESIS_MOONLIGHT_MORNING_SUN
	db MEAN_LOOK_BLOCK_SPIDER_WEB
	db CHARM_FEATHER_DANCE
	db SCARY_FACE_COTTON_SPORE
	db ROAR_WHIRLWIND
	db SAND_ATTACK_SMOKESCREEN
	db SOFTBOILED_MILK_DRINK
	db FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	db AGILITY_ROCK_POLISH
	db -1
	
MultiSlotMoveTypes::
	push hl
	push bc
	push de
	push af
	ld a, [wCurMove]
	cp DEFENSE_CURL_HARDEN_WITHDRAW
	jr z, .defense_curl
	cp BARRIER_IRON_DEFENSE
	jr z, .barrier
	cp SHARPEN_HOWL_MEDITATE
	jr z, .sharpen
	cp SYNTHESIS_MOONLIGHT_MORNING_SUN
	jr z, .synthesis
	cp MEAN_LOOK_BLOCK_SPIDER_WEB
	jr z, .mean_look
	cp SAND_ATTACK_SMOKESCREEN
	jr z, .sand_attack
	cp SCARY_FACE_COTTON_SPORE
	jp z, .scary_face
	cp FORESIGHT_ODOR_SLEUTH_MIRACLE_EYE
	jp z, .foresight
	cp CHARM_FEATHER_DANCE
	jp z, .charm
	cp AGILITY_ROCK_POLISH
	jp z, .agility
	pop af
	pop de
	pop bc
	pop hl
	ret
.defense_curl
	pop af
	call CheckWithdrawUsers
	jr nc, .not_withdraw
	ld a, WATER
	pop de
	pop bc
	pop hl
	ret
.not_withdraw
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
	
.barrier
	pop af
	call CheckIronDefenseUsers
	jr nc, .not_iron_defense
	ld a, STEEL
	pop de
	pop bc
	pop hl
	ret
.not_iron_defense
	ld a, PSYCHIC
	pop de
	pop bc
	pop hl
	ret
	
.sharpen
	pop af
	call CheckMeditateUsers
	jr nc, .not_meditate
	ld a, PSYCHIC
	pop de
	pop bc
	pop hl
	ret
.not_meditate
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
	
.synthesis
	pop af
	call CheckMoonlightUsers
	jr nc, .not_moonlight
	ld a, FAIRY
	pop de
	pop bc
	pop hl
	ret
.not_moonlight
	call CheckMorningSunUsers
	jr nc, .not_morning_sun
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
.not_morning_sun
	ld a, GRASS
	pop de
	pop bc
	pop hl
	ret
	
.mean_look
	pop af
	call CheckSpiderWebUsers
	jr nc, .not_spider_web
	ld a, BUG
	pop de
	pop bc
	pop hl
	ret
.not_spider_web
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
	
.sand_attack
	pop af
	call CheckSmokescreenUsers
	jr nc, .not_smokescreen
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
.not_smokescreen
	ld a, GROUND
	pop de
	pop bc
	pop hl
	ret
	
.scary_face
	pop af
	call CheckCottonSporeUsers
	jr nc, .not_cotton_spore
	ld a, GRASS
	pop de
	pop bc
	pop hl
	ret
.not_cotton_spore
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
	
.foresight
	pop af
	call CheckMiracleEyeUsers
	jr nc, .not_miracle_eye
	ld a, PSYCHIC
	pop de
	pop bc
	pop hl
	ret
.not_miracle_eye
	ld a, NORMAL
	pop de
	pop bc
	pop hl
	ret
	
.charm
	pop af
	call CheckFeatherDanceUsers
	jr nc, .not_feather_dance
	ld a, FLYING
	pop de
	pop bc
	pop hl
	ret
.not_feather_dance
	ld a, FAIRY
	pop de
	pop bc
	pop hl
	ret
	
.agility
	pop af
	call CheckRockPolishUsers
	jr nc, .not_rock_polish
	ld a, ROCK
	pop de
	pop bc
	pop hl
	ret
.not_rock_polish
	ld a, PSYCHIC
	pop de
	pop bc
	pop hl
	ret
	