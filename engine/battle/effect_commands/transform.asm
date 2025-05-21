BattleCommand_transform:
	farcall CheckTransformThing
	ld [wKickCounter], a
	cp $2
	jp z, BattleCommand_sketch
	cp $3
	jp z, BattleCommand_mimic
	cp $9
	jp z, BattleCommand_splash
	cp $14
	jp z, BattleCommand_metronome

;transform
	call ClearLastMove

	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, BattleEffect_ButItFailed

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonSpecies
	ld de, wEnemyMonItem
	jr z, .got_mon_item
	ld hl, wBattleMonSpecies
	ld de, wBattleMonItem
.got_mon_item

	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp INFILTRATOR
	jr z, .bypass_sub
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	jp nz, BattleEffect_ButItFailed
.bypass_sub
	call CheckHiddenOpponent
	jp nz, BattleEffect_ButItFailed

	xor a
	ld [wNumHits], a
	ld [wFXAnimIDHi], a
	ld a, $1
	ld [wKickCounter], a
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_SUBSTITUTE, [hl]
	push af
	jr z, .mimic_substitute
	call CheckUserIsCharging
	jr nz, .mimic_substitute
	ld a, SUBSTITUTE
	call LoadAnim
.mimic_substitute
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_TRANSFORMED, [hl]
	call ResetActorDisable
	ld hl, wBattleMonSpecies
	ld de, wEnemyMonSpecies
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_mon_species
	ld hl, wEnemyMonSpecies
	ld de, wBattleMonSpecies
	xor a
	ld [wCurMoveNum], a
.got_mon_species
	push hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	inc de
	ld bc, NUM_MOVES
	rst CopyBytes

	; copy DVs and personality
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
; move pointer to stats
	ld bc, wBattleMonStats - wBattleMonPP
	add hl, bc
	push hl
	ld h, d
	ld l, e
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld bc, wBattleMonStructEnd - wBattleMonStats
	rst CopyBytes
; init the power points
	ld bc, wBattleMonMoves - wBattleMonStructEnd
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, wBattleMonPP - wBattleMonStructEnd
	add hl, bc
	ld b, NUM_MOVES
.pp_loop
	ld a, [de]
	inc de
	and a
	jr z, .done_move
	cp TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	ld a, 1
	jr z, .done_move
	ld a, 5
.done_move
	ld [hli], a
	dec b
	jr nz, .pp_loop
	pop hl
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wEnemyStatLevels
	ld de, wPlayerStatLevels
	ld bc, 8
	call BattleSideCopy
;	call _CheckBattleEffects
	call CheckBattleEffects
	jr c, .mimic_anims
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerMinimized]
	jr z, .got_byte
	ld a, [wEnemyMinimized]
.got_byte
	and a
	jr nz, .mimic_anims
	; Animation is done "raw" to allow Imposter
	; to use the correct animation
	ld de, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	call FarPlayBattleAnimation
	jr .after_anim

.mimic_anims
	call BattleCommand_movedelay
	call BattleCommand_raisesubnoanim
.after_anim
	xor a
	ld [wNumHits], a
	ld [wFXAnimIDHi], a
	ld a, $2
	ld [wKickCounter], a
	pop af
	ld a, SUBSTITUTE
	call nz, LoadAnim
	ld hl, TransformedText
	call StdBattleTextBox

	; Update revealed moves if player transformed: the AI knows what its own moves are...
	ldh a, [hBattleTurn]
	and a
	jr nz, .move_reveal_done
	ld hl, wBattleMonMoves
	ld de, wPlayerUsedMoves
	ld bc, NUM_MOVES
	rst CopyBytes

.move_reveal_done
	; Copy ability
	ldh a, [hBattleTurn]
	and a
	jr nz, .copy_player_ability
	ld a, [wEnemyAbility]
	ld [wPlayerAbility], a
	jr .done_ability_copy
.copy_player_ability
	ld a, [wPlayerAbility]
	ld [wEnemyAbility], a
.done_ability_copy
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp IMPOSTER
	ret z ; avoid infinite loop
	farjp RunActivationAbilitiesInner

BattleCommand_mimic:
	farcall MimicCommand
	ret

BattleCommand_sketch: ; 35a74
; sketch

	call ClearLastMove
; Don't sketch during a link battle
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	call AnimateFailedMove
	jp PrintNothingHappened

.not_linked
; If the opponent has a substitute up, fail.
	call CheckSubstituteOpp
	jp nz, .fail
; If the opponent is transformed, fail.
	ld a, BATTLE_VARS_SUBSTATUS2_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, .fail
; If the user is transformed, fail.
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, .fail
; Get the user's moveset in its party struct.
; This move replacement shall be permanent.
; Pointer will be in de.
	ld a, MON_MOVES
	call UserPartyAttr
	ld d, h
	ld e, l
; Get the battle move structs.
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .get_last_move
	ld hl, wEnemyMonMoves
.get_last_move
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [wTypeMatchup], a
	ld b, a
; Fail if move is invalid or is Struggle.
	and a
	jp z, .fail
	cp STRUGGLE
	jp z, .fail
	cp TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	jp z, .fail
; Fail if user already knows that move
	ld c, NUM_MOVES
.does_user_already_know_move
	ld a, [hli]
	cp b
	jp z, .fail
	dec c
	jr nz, .does_user_already_know_move
; Find Sketch in the user's moveset.
; Pointer in hl, and index in c.
	dec hl
	ld c, NUM_MOVES
.find_sketch
	dec c
	ld a, [hld]
	cp TRANSFORM_SKETCH_MIMIC_SPLASH_METRO
	jr nz, .find_sketch
	inc hl
; The Sketched move is loaded to that slot.
	ld a, b
	ld [hl], a
; Copy the base PP from that move.
	push bc
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	call GetMoveAttr
	pop hl
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], a
	pop bc

	ldh a, [hBattleTurn]
	and a
	jr z, .user_trainer
	ld a, [wBattleMode]
	dec a
	jr nz, .user_trainer
; wildmon
	ld a, [hl]
	push bc
	ld hl, wWildMonPP
	ld b, 0
	add hl, bc
	ld [hl], a
	ld hl, wWildMonMoves
	add hl, bc
	pop bc
	ld [hl], b
	jr .done_copy

.user_trainer
	ld a, [hl]
	push af
	ld l, c
	ld h, 0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a
.done_copy
	ldh a, [hBattleTurn] ; Get opponent move name information. wStringBuffer2
	and a
	ld a, [wBattleMonSpecies]
	jr z, .got_user_species
	ld a, [wEnemyMonSpecies]
.got_user_species
	ld [wCurPartySpecies], a
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurMove], a
	push hl
	push de
	farcall CheckMultiMoveSlot
	jr nc, .not_multi_move_slot
	pop de
	pop hl
	farcall GetMultiMoveSlotName
	call CopyName1
	
	
	ldh a, [hBattleTurn] ; Get user move name information. wStringBuffer1
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_user_species2
	ld a, [wBattleMonSpecies]
.got_user_species2
	ld [wCurPartySpecies], a
	ld a, [wNamedObjectIndexBuffer]
	ld [wCurMove], a
	farcall GetMultiMoveSlotName
	
	jr .done
.not_multi_move_slot
	pop de
	pop hl
	ld a, [wCurMove]
	call GetMoveName
	call AnimateCurrentMove

	ld hl, SketchedText
	jp StdBattleTextBox
.done
	call AnimateCurrentMove

	ld hl, SketchedText
	call StdBattleTextBox
	
	ld hl, wStringBuffer1
	ld a, [hli]
	ld b, a
	ld hl, wStringBuffer2
	ld a, [hli]
	cp b
	ret z
	
	ld hl, SketchedText2
	jp StdBattleTextBox

.fail
	call AnimateFailedMove
	jp PrintDidntAffect

BattleCommand_splash:
	call AnimateCurrentMove
	jp PrintNothingHappened