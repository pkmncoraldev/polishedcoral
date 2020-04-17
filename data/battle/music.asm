PlayBattleMusic: ; 2ee6c
	push hl
	push de
	push bc

	call SaveMusic
	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	; Are we fighting a trainer?
	ld a, [wOtherTrainerClass]
	and a
	jr nz, .trainermusic

	ld a, [wTempEnemyMonSpecies]
	ld hl, .legendaries
	call .loadfromarray
	jr c, .done

	ld de, MUSIC_WILD_BATTLE
	jr .done

.trainermusic
	ld a, [wOtherTrainerClass]
	ld hl, .trainers
	call .loadfromarray
	jr c, .done

	ld de, MUSIC_TRAINER_BATTLE
	
.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret

.loadfromarray
	ld e, 3
	call IsInArray
	ret nc
	inc hl
	jr .found

.getregionmusicfromarray
	push hl
	call RegionCheck
	pop hl
	ld a, e
	and a ; Johto
	jr nz, .ok
	ld a, [wTimeOfDay]
	cp NITE
	jr nz, .ok
	ld e, 3 ; Johto at night
.ok
	ld d, 0
	add hl, de
	add hl, de
.found
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

.trainers
	dbw RIVAL,            MUSIC_RIVAL_BATTLE
	dbw GRUNTM,           MUSIC_SNARE_BATTLE
	dbw GRUNTF,           MUSIC_SNARE_BATTLE
	dbw STANLEY,		  MUSIC_GYM_BATTLE
	dbw RODNEY,		  	  MUSIC_GYM_BATTLE
	db -1

.legendaries
	dbw ARTICUNO, MUSIC_EVOLUTION
	dbw ZAPDOS,   MUSIC_EVOLUTION
	dbw MOLTRES,  MUSIC_EVOLUTION
	dbw MEWTWO,   MUSIC_EVOLUTION
	dbw MEW,      MUSIC_EVOLUTION
	dbw RAIKOU,   MUSIC_EVOLUTION
	dbw ENTEI,    MUSIC_EVOLUTION
	dbw SUICUNE,  MUSIC_EVOLUTION
	dbw HO_OH,    MUSIC_EVOLUTION
	dbw LUGIA,    MUSIC_EVOLUTION
	dbw CELEBI,   MUSIC_EVOLUTION
	db -1
