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

_NettSpecs:
	ld hl, .NettSpecsScript
	call QueueScript
	ld a, $1
	ld [wItemEffectSucceeded], a
	ret
	
.NettSpecsScript
	special UpdateTimePals
	opentext
	writetext NettSpecsPutOnText
	waitbutton
	closetext
	wait 10
	callasm .CheckCanUseNettSpecs
	iffalse .NothingHappenedScript
	if_equal 1, .ditto_script
	if_equal 2, .youngster_script
	if_equal 3, .nurse_script
	if_equal 4, .chansey_script
.NothingHappenedScript
	opentext
	special Special_DotDotDot
	writetext NettSpecsNormalText4
	waitbutton
	closetext
	end
	
.ditto_script
	opentext
	special Special_DotDotDot
	callasm DittoExclamationAsm
;	writetext NettSpecsDittoText
	playmusic MUSIC_NONE
	pause 60
	closetext
	callasm BrightburgDittoDisguiseSpriteAsm
	spriteface LAST_TALKED, DOWN
	variablesprite2 SPRITE_GENERAL_VARIABLE_1
	special MapCallbackSprites_LoadUsedSpritesGFX
	disappear 1 ;brightburg ditto
	callasm BrightburgMoveDittoAsm
	appear 1 ;brightburg ditto
	closetext
	disappear LAST_TALKED
	pause 45
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_DITTO_OW
	special MapCallbackSprites_LoadUsedSpritesGFX
	variablesprite2 SPRITE_GENERAL_VARIABLE_1
	special MapCallbackSprites_LoadUsedSpritesGFX
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_DITTO_OW
	special MapCallbackSprites_LoadUsedSpritesGFX
	variablesprite2 SPRITE_GENERAL_VARIABLE_1
	special MapCallbackSprites_LoadUsedSpritesGFX
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_DITTO_OW
	special MapCallbackSprites_LoadUsedSpritesGFX
	pause 40
	spriteface 1, UP
	opentext
	writetext NettSpecsDittoText
	cry DITTO
	waitbutton
	closetext
	waitsfx
	setlasttalked 1
	loadwildmon DITTO, 50
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	callasm ForceGhostTownAsm
	reloadmapafterbattle
	playnewmapmusic
	setevent EVENT_BRIGHTBURG_REVEALED
	setevent EVENT_UNIQUE_ENCOUNTER_DITTO_BOSS
	setevent EVENT_BRIGHT_CENTER_MART_EMPTY
	checkcode VAR_MONJUSTCAUGHT
	if_equal DITTO, .CaughtDitto
	opentext
	writetext NettSpecsDittoTextGone
	waitbutton
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	dotrigger $1
	callasm BrightburgClearwPlaceBallsYAsm
	end
.CaughtDitto
	opentext
	writetext NettSpecsDittoTextGone2
	waitbutton
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	dotrigger $1
	callasm BrightburgClearwPlaceBallsYAsm
	end
	
.youngster_script
	setlasttalked 7 ;brightburg youngster
	jumptextfaceplayer NettSpecsYoungsterText
	
.nurse_script
	checkevent EVENT_BRIGHTBURG_REVEALED
	iffalse .ditto_script
	jumptextfaceplayer NettSpecsNurseText
	
.chansey_script
	checkevent EVENT_BRIGHTBURG_REVEALED
	iffalse .ditto_script
	opentext
	writetext NettSpecsChanseyText1
	cry CHANSEY
	waitsfx
	buttonsound
	writetext NettSpecsChanseyText2
	waitbutton
	closetext
	end
	
.CheckCanUseNettSpecs
	ld a, [wMapGroup]
	cp GROUP_BRIGHTBURG
	jr nz, .not_in_brightburg

	callba GetFacingObject
	jr c, .nope
	
	callba GetFacingObjectSprite
	ld a, d
	cp SPRITE_YOUNGSTER
	jr z, .youngster
	cp SPRITE_BOWING_NURSE
	jr z, .nurse
	cp SPRITE_MON_ICON
	jr z, .chansey
	
.ditto
	ld a, 1
	ld [wScriptVar], a
	ret

.youngster
	ld a, 2
	ld [wScriptVar], a
	ret
	
.nurse
	ld a, 3
	ld [wScriptVar], a
	ret
	
.chansey
	ld a, 4
	ld [wScriptVar], a
	ret

.not_in_brightburg
.nope
	xor a
	ld [wScriptVar], a
	ret
	
ForceGhostTownAsm:
	farjp LoadMapAttributes
	
BrightburgDittoDisguiseSpriteAsm:
	farcall GetFacingObjectSprite
	ld a, d
	ld [wPlaceBallsY], a
	ret
	
BrightburgClearwPlaceBallsYAsm:
	xor a
	ld [wPlaceBallsY], a
	ret
	
DittoExclamationAsm:
	call MenuBoxCoord2Tile
	ld de, $0e * SCREEN_WIDTH + 7
	add hl, de
	ld [hl], "!"
	jp ApplyTilemapInVBlank
	
BrightburgMoveDittoAsm:
	call GetFacingTileCoord
	ld c, a
	ld a, 1 ;brightburg ditto
	ld b, a
	ld a, [wPlayerFacing]
	cp $08
	jr z, .left
	cp $0c
	jr z, .right
	ld a, [wXCoord]
	jr .done_x
.right
	ld a, [wXCoord]
	add 1
	push af
	ld a, c
	cp COLL_COUNTER
	jr nz, .pop_done_x
	pop af
	add 1
	jr .done_x
.left
	ld a, [wXCoord]
	sub 1
	push af
	ld a, c
	cp COLL_COUNTER
	jr nz, .pop_done_x
	pop af
	sub 1
	jr .done_x
.pop_done_x
	pop af
.done_x
	add 4
	ld d, a
	ld a, [wPlayerFacing]
	cp $04
	jr z, .up
	cp $00
	jr z, .down
	ld a, [wYCoord]
	jr .done_y
.down
	ld a, [wYCoord]
	add 1
	push af
	ld a, c
	cp COLL_COUNTER
	jr nz, .pop_done_y
	pop af
	add 1
	jr .done_y
.up
	ld a, [wYCoord]
	sub 1
	push af
	ld a, c
	cp COLL_COUNTER
	jr nz, .pop_done_y
	pop af
	sub 1
	jr .done_y
.pop_done_y
	pop af
.done_y
	add 4
	ld e, a
	farjp CopyDECoordsToMapObject
	
NettSpecsPutOnText:
	text "<PLAYER> put on"
	line "the NETT SPECS."
	done
	
NettSpecsNormalText4:
	text "Everything looks"
	line "the same…"
	done
	
NettSpecsYoungsterText:
	text "Woah!"
	
	para "Funky looking"
	line "shades, dude!"
	done
	
NettSpecsNurseText:
	text "Um…"
	
	para "Can I help you?"
	
	para "You're staring…"
	
	para "What?"
	
	para "Of course I'm"
	line "real!"
	done
	
NettSpecsChanseyText1:
	text "CHANSEY: …Sii?"
	done
	
NettSpecsChanseyText2:
	text "It looks curious"
	line "about the SPECS."
	done
	
NettSpecsDittoText:
	text "DITTO revealed"
	line "itself!"
	done
	
NettSpecsDittoTextGone:
	text "DITTO and its"
	line "disguised cohorts"
	cont "fled."
	done
	
NettSpecsDittoTextGone2:
	text "The rest of the"
	line "disguised DITTO"
	cont "fled."
	done
	