BossWildInfo:
	; species, form/battle, stat levels, moves
	; stat levels replace enemy's level for calculation of specific stats. HP skipped.
	; example: defense level 30 applied to a level 20 mon would mean def is calculated as if it were level 30. 0 = no adjustment.
	; used to adjust wild bosses' stats without effecting their real level when caught.
	; atk, def, spd, sat, sdf
	
	db LEDIAN, PLAIN_FORM, 0, 0, 0, 0, 0, LIGHT_SCREEN, REFLECT, SWIFT, PSYBEAM
	db MAGMAR, PLAIN_FORM, 0, 0, 0, 0, 0,  FIERY_DANCE, FLAME_BURST, CLEAR_SMOG, FEINT_ATTACK
	db ELECTABUZZ, PLAIN_FORM, 0, 0, 0, 0, 0,  BELLY_DRUM, THUNDERPUNCH, ROCK_SMASH, SWIFT
	db SNORLAX, FIRST_BATTLE, 0, 0, 0, 0, 0,  REST, SNORE, HEADBUTT, BITE
	db SUDOWOODO, PLAIN_FORM, 0, 0, 0, 0, 0,  MEAN_LOOK_BLOCK_SPIDER_WEB, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO, WOOD_HAMMER, ROCK_THROW
	db SPIRITOMB, PLAIN_FORM, 0, 0, 0, 0, 0,  SHADOW_BALL, PSYCHIC_M, CALM_MIND, DISABLE
	db MAMOSWINE, PLAIN_FORM, 0, 0, 0, 0, 0,  TAKE_DOWN, HAIL, ICE_FANG, HAZE
	db MUK, ALOLAN_FORM, 0, 0, 0, 0, 0,  CRUNCH, BARRIER_IRON_DEFENSE_ACID_ARMOR, POISON_FANG, MINIMIZE
	db PORYGON, PLAIN_FORM, 0, 0, 0, 0, 0,  TRI_ATTACK, THUNDERBOLT, SOFTBOILED_MILK_DRINK_RECOVER, CONVERSION
	db CLEFABLE, PLAIN_FORM, 0, 0, 0, 0, 0,  MOONBLAST, COSMIC_POWER, TRANSFORM_SKETCH_MIMIC_SPLASH_METRO, SYNTHESIS_MOONLIGHT_MORNING_SUN
	db LAPRAS, PLAIN_FORM, 0, 0, 0, 0, 0,  HYDRO_PUMP, CONFUSE_RAY, ICE_BEAM, PERISH_SONG
	db DRAKLOAK, PLAIN_FORM, 0, 0, 0, 0, 0,  SHADOW_CLAW, DRAGON_CLAW, DRAGON_DANCE, PURSUIT
	db MIMIKYU, PLAIN_FORM, 0, 0, 0, 0, 0,  FAKE_OUT, SHADOW_CLAW, SWORDS_DANCE, PLAY_ROUGH
	db DITTO, PLAIN_FORM, 0, 0, 0, 0, 0,  TRANSFORM_SKETCH_MIMIC_SPLASH_METRO, 0, 0, 0
	db VOLCARONA, PLAIN_FORM, 0, 0, 0, 0, 0,  FIERY_DANCE, LEECH_LIFE, QUIVER_DANCE, AMNESIA
	db CURSOLA, PLAIN_FORM, 0, 0, 0, 0, 0,  CURSE, SOFTBOILED_MILK_DRINK_RECOVER, POWER_GEM, SHADOW_BALL
	db NOIVERN, PLAIN_FORM, 0, 0, 0, 0, 0,  DRAGON_PULSE, CRUNCH, LEECH_LIFE, HYPER_VOICE
	db SNORLAX, SECOND_BATTLE, 0, 0, 0, 0, 0,  REST, GIGA_IMPACT, BULK_UP, CRUNCH
	db MAROWAK, ALOLAN_FORM, 0, 0, 0, 0, 0,  SHADOW_BONE, FLARE_BLITZ, BONEMERANG, TAUNT
	db -1
	
BoostStatLevels::
	push hl
	push de
	push bc
	
	ld a, [wTempEnemyMonSpecies]
	ld c, a
	ld a, [wEnemyMonForm]
	and FORM_MASK
	ld b, a
	ld hl, BossWildInfo
.loop
	ld a, [hli] ; species
	cp -1
	jr z, .no_adjustment
	cp c
	jr nz, .inc10andloop
	ld a, [hli] ; form
	and FORM_MASK
	cp b
	jr nz, .inc9andloop
	
	pop bc
	ld a, c
	push bc
	cp 1	;skip HP
	jr z, .no_adjustment
	dec a
.loop2
	dec a
	cp 0
	jr z, .found_stat
	inc hl
	jr .loop2
	
.found_stat
	ld a, [hl]
	cp 0
	jr z, .no_adjustment
;	ld a, c
	ld [wCurPartyLevel], a
.no_adjustment
	pop bc
	pop de
	pop hl
	ret
.inc10andloop
	inc hl
.inc9andloop
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	jr .loop
