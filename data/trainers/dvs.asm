GetTrainerEVsDVsAndPersonality: ; 270c4
; Return the EVs, DVs and Personality of wOtherTrainerClass in bc
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerClassDVsAndPersonality
rept 6
	add hl, bc
endr

	ld a, [hli]
rept 6
	ld [de], a
	inc de
endr
	ld a, [hli]
	ld [wDVAndPersonalityBuffer], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 1], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 2], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 3], a
	ld a, [hli]
	ld [wDVAndPersonalityBuffer + 4], a
	ret
; 270d6

TrainerClassDVsAndPersonality: ; 270d6
	;  EVs  HP   Def  SAt  Ability  Gender
	;  *    Atk  Spd  SDf  Nature   Form
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; cory
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; cora
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; pippi
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; red
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; leaf
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; gold
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; kris
	db 252, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; stanley
	db 252, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; rodney
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; wendy
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; charlie
	db 252, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; chuck
	db 252, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; jasmine
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; pryce
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; clair
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; will
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; koga
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; bruno
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE ; karen
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; champion
	db   0, $99, $99, $99, ABILITY_1 | QUIRKY, MALE   ; rival
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; youngster
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; bug catcher
	db   8, $77, $77, $77, ABILITY_1 | QUIRKY, MALE   ; camper
	db   8, $77, $77, $77, ABILITY_1 | QUIRKY, FEMALE ; picnicker
	db   8, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; twins
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; fisher
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; bird keeper
	db  24, $99, $99, $99, ABILITY_1 | QUIRKY, MALE   ; hiker
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, MALE   ; gruntm
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE ; gruntf
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; kage
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; locke
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, MALE   ; pokefanm
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE ; pokefanf
	db  48, $DD, $BB, $DB, ABILITY_1 | QUIRKY, MALE   ; officerm
	db  48, $7B, $DB, $FF, ABILITY_1 | QUIRKY, FEMALE ; officerf
	db  48, $E5, $FA, $D6, ABILITY_1 | QUIRKY, FEMALE ; nurse
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; pokemaniac
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; super nerd
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; lass
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; beauty
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; firebreather
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; juggler
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; schoolboy
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; schoolgirl
	db  48, $AA, $CC, $EE, ABILITY_1 | QUIRKY, MALE   ; psychic
	db  48, $AA, $CC, $EE, ABILITY_1 | QUIRKY, FEMALE ; hex maniac
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; couple
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; gentleman
	db 100, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; rich boy (high EVs from vitamins)
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; lady
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; sailor
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; swimmerm
	db  48, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; swimmerf
	db  56, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; burglar
	db  56, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; scientist
	db  56, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; boarder
	db  56, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; skier
	db  64, $FF, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; blackbelt
	db  64, $FF, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; battle girl
	db  72, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; teacher
	db  72, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; guitaristm
	db  72, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; guitaristf
	db  72, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; biker
	db  72, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; roughneck
	db  64, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; cooltrainerm
	db  64, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; cooltrainerf
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; prof elm
	db   0, $DD, $DF, $DD, ABILITY_1 | TIMID, FEMALE  ; teacherfast
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; triobror
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; triobrob
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; triobroy
	db  48, $99, $99, $99, ABILITY_1 | QUIRKY, MALE   ; disguiseman
	db  72, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bikinip
	db  72, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bikinir
	db  72, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bikiniy
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, MALE   ; delinquentm
	db  32, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE ; delinquentf
	db  00, $00, $00, $00, ABILITY_1 | QUIRKY, MALE   ; bunearym
	db  48, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bunearyf
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; frankie
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; mall cop
	db  56, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; skater
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; towertycoon

; 2715c
