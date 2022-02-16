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

	ld a, [wBattleType]
	cp BATTLETYPE_LEGENDARY
	jr z, .legendary
	cp BATTLETYPE_SHINY_LEGENDARY
	jr z, .legendary
	cp BATTLETYPE_SHINY
	jr z, .legendary

	ld de, MUSIC_WILD_BATTLE
	jr .done

.legendary
	ld de, MUSIC_WILD_BOSS_BATTLE
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
	dbw TEACHERFAST,	  MUSIC_MINIBOSS_BATTLE
	dbw DISGUISE,	  	  MUSIC_MINIBOSS_BATTLE
	dbw FRANKIE,	  	  MUSIC_MINIBOSS_BATTLE
	dbw MALL_COP,		  MUSIC_MINIBOSS_BATTLE
	dbw TRIOBROR,	  	  MUSIC_MINIBOSS_BATTLE
	dbw TRIOBROB,	  	  MUSIC_MINIBOSS_BATTLE
	dbw TRIOBROY,	  	  MUSIC_MINIBOSS_BATTLE
	dbw GRUNTM,           MUSIC_SNARE_BATTLE
	dbw GRUNTF,           MUSIC_SNARE_BATTLE
	dbw KAGE,			  MUSIC_SNARE_ADMIN_BATTLE
	dbw LOCKE,			  MUSIC_SNARE_ADMIN_BATTLE
	dbw STANLEY,		  MUSIC_GYM_BATTLE
	dbw RODNEY,		  	  MUSIC_GYM_BATTLE
	dbw WENDY,			  MUSIC_GYM_BATTLE
	dbw CHARLIE,		  MUSIC_GYM_BATTLE
	db -1
