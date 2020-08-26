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
	
GetMultiMoveSlotName::
	ld a, [wCurMove]
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
.end
	ret


WithdrawUsers:
	db SQUIRTLE
	db WARTORTLE
	db BLASTOISE
	db SLOWBRO
	db -1

HardenUsers:
	db KAKUNA
	db ONIX
	db STEELIX
	db STARYU
	db STARMIE
	db HERACROSS
	db GLIGAR
	db GLISCOR
	db SLUGMA
	db MAGCARGO
	db CORSOLA
	db PUPITAR
	db TYRANITAR
	db -1

TailWhipUsers:
	db STANTLER
	db -1
	
IronDefenseUsers:
	db STANTLER
	db -1
	
MeditateUsers:
	db STANTLER
	db -1
	
HowlUsers:
	db SQUIRTLE
	db -1
	
FuryAttackUsers:
	db BEEDRILL
	db NIDORAN_M
	db NIDORINO
	db NIDOKING
	db DODUO
	db DODRIO
	db RHYHORN
	db RHYDON
	db RHYPERIOR
	db PINSIR
	db HERACROSS
	db PILOSWINE
	db MAMOSWINE
	db SKARMORY
	db DONPHAN
	db STANTLER
	db -1
	
CometPunchUsers:
	db SQUIRTLE
	db -1
	
MoonlightUsers:
	db STANTLER
	db -1
	
MorningSunUsers:
	db SQUIRTLE
	db -1
	
BlockUsers:
	db STANTLER
	db -1
	
SpiderWebUsers:
	db SQUIRTLE
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
	
MultiSlotMoves:
	db DEFENSE_CURL_HARDEN_WITHDRAW
	db LEER_TAIL_WHIP
	db BARRIER_IRON_DEFENSE
	db LOCK_ON_MIND_READER
	db SHARPEN_HOWL_MEDITATE
	db FURY_SWIPES_FURY_ATTACK_COMET_PUNCH
	db SYNTHESIS_MOONLIGHT_MORNING_SUN
	db MEAN_LOOK_BLOCK_SPIDER_WEB
	db -1
	

	