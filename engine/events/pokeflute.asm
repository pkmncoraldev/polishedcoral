_PokeFlute: ; 50730
	ld a, [wBattleMode]
	and a
	jr z, .not_in_battle
	xor a
	ld [wd002], a

	ld b, $ff ^ SLP

	ld hl, wPartyMon1Status
	call .CureSleep

	ld a, [wBattleMode]
	cp WILD_BATTLE
	jr z, .skip_otrainer
	ld hl, wOTPartyMon1Status
	call .CureSleep
.skip_otrainer

	ld hl, wBattleMonStatus
	ld a, [hl]
	and b
	ld [hl], a
	ld hl, wEnemyMonStatus
	ld a, [hl]
	and b
	ld [hl], a

	ld hl, .PlayedTheFlute
	call PrintText
	push de
	ld de, SFX_POKEFLUTE
	call WaitPlaySFX
	call WaitSFX
	pop de
	ld a, [wd002]
	and a
	jp nz, .sleeping

	ld hl, .CatchyTune
	call PrintText
	ret

.sleeping
	ld hl, .AllSleepingMonWokeUp
	jp PrintText

.CureSleep:
	ld de, PARTYMON_STRUCT_LENGTH
	ld c, PARTY_LENGTH

.loop
	ld a, [hl]
	push af
	and SLP
	jr z, .not_asleep
	ld a, 1
	ld [wd002], a
.not_asleep
	pop af
	and b
	ld [hl], a
	add hl, de
	dec c
	jr nz, .loop
	ret
; f56c

.not_in_battle:
	ld hl, .PokefluteScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret

.PokefluteScript:
	reloadmappart
	special UpdateTimePals
	callasm .CheckCanUsePokeflute
	iffalse .NothingHappenedScript

	checkcode VAR_SCRIPT_VAR
	if_equal 1, .snorlax_script
	if_equal 2, .sudowoodo_script
	if_equal 3, .sunbeam_sleepy_snare_script
	if_equal 4, .sunbeam_sleeping_beauty_script
.snorlax_script
	farjump Route4PlayedFluteForSnorlax
.sudowoodo_script
	farjump LakePlayedFluteForSudowoodo
.sunbeam_sleepy_snare_script
	checkevent EVENT_SNARE_ASLEEP
	iftrue .NothingHappenedScript
	farjump SunbeamPlayedFluteForSleepySnare
.sunbeam_sleeping_beauty_script
	checktime 1<<DUSK
	iftrue .beauty
	checktime 1<<NITE
	iffalse .NothingHappenedScript
.beauty
	farjump SunbeamPlayedFluteForSleepingBeauty

.NothingHappenedScript:
	opentext
	writetext PokefluteText1
	playsound SFX_POKEFLUTE
	waitsfx
	buttonsound
	writetext PokefluteText2
	waitbutton
	closetext
	end

.CheckCanUsePokeflute:
	callba GetFacingObject
	jr c, .nope

	ld a, d

	cp SPRITEMOVEDATA_SUDOWOODO
	jr z, .sudowoodo

	ld a, [wMapGroup]
	cp GROUP_SUNBEAM_ISLAND
	jr z, .sunbeamgroup
	
	callba GetFacingObjectSprite
	ld a, d
	
	cp SPRITE_BIG_SNORLAX
	jr z, .snorlax
	
.nope
	xor a
	ld [wScriptVar], a
	ret

.snorlax
	ld a, 1
	ld [wScriptVar], a
	ret

.sudowoodo
	ld a, 2
	ld [wScriptVar], a
	ret	

.sunbeamgroup
	callba GetFacingObject
	ld a, d
	cp SPRITEMOVEDATA_STANDING_LEFT
	jr nz, .nope

	ld a, [wMapNumber]
	cp MAP_SUNBEAM_ISLAND
	jr z, .sunbeam_sleepy_snare
	cp MAP_SUNBEAM_BEACH
	jr z, .sunbeam_sleeping_beauty
	jr .nope
	
.sunbeam_sleepy_snare
	ld a, 3
	ld [wScriptVar], a
	ret	

.sunbeam_sleeping_beauty
	ld a, 4
	ld [wScriptVar], a
	ret	
	
.CatchyTune: ; 0xf56c
	; Now, that's a catchy tune!
	text_jump PokefluteText2
	db "@"
; 0xf571

.AllSleepingMonWokeUp: ; 0xf571
	; All sleeping #MON woke up.
	text_jump PokefluteText3
	db "@"
; 0xf576

.PlayedTheFlute: ; 0xf576
	; played the # FLUTE.@ @
	text_jump PokefluteText1
	start_asm
	ld a, [wBattleMode]
	and a
	jr nz, .battle

	push de
	ld de, SFX_POKEFLUTE
	call WaitPlaySFX
	call WaitSFX
	pop de
	
.battle
	ld hl, .stop
	ret

.stop	db "@"
; f58f

PokefluteText1:
	text "<PLAYER> played the"
	line "# FLUTE."
	done
	
PokefluteText2:
	text "Now, that's a"
	line "catchy tune!"
	done
	
PokefluteText3:
	text "All sleeping"
	line "#MON woke up."
	prompt
