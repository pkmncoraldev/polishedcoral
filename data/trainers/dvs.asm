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
	db 100, $99, $99, $99, ABILITY_1 | QUIRKY, MALE   ; rodney
	db 252, $77, $7A, $77, ABILITY_1 | QUIRKY, FEMALE ; wendy
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
	db   0, $33, $33, $33, ABILITY_1 | QUIRKY, MALE   ; youngster
	db   0, $33, $33, $33, ABILITY_1 | QUIRKY, MALE   ; bug catcher
	db   0, $55, $55, $55, ABILITY_1 | QUIRKY, MALE   ; camper
	db   0, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE ; picnicker
	db   0, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE ; twins
	db   8, $55, $55, $55, ABILITY_1 | QUIRKY, MALE   ; fisher
	db   8, $77, $77, $77, ABILITY_1 | QUIRKY, MALE   ; bird keeper
	db  16, $77, $77, $77, ABILITY_1 | QUIRKY, MALE   ; hiker
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; gruntm
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; gruntf
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; kage
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; locke
	db   8, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; pokefanm
	db   8, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; pokefanf
	db  24, $DD, $BB, $DB, ABILITY_1 | QUIRKY, MALE   ; officerm
	db  24, $7B, $DB, $FF, ABILITY_1 | QUIRKY, FEMALE ; officerf
	db  24, $E5, $FA, $D6, ABILITY_1 | QUIRKY, FEMALE ; nurse
	db  20, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; pokemaniac
	db  20, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE   ; super nerd
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE ; lass
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE ; beauty
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, MALE   ; firebreather
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, MALE   ; juggler
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, MALE   ; schoolboy
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE ; schoolgirl
	db  24, $AA, $CC, $EE, ABILITY_1 | QUIRKY, MALE   ; psychic
	db  24, $AA, $CC, $EE, ABILITY_1 | QUIRKY, FEMALE ; hex maniac
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; couple
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; gentleman
	db 100, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; rich boy (high EVs from vitamins)
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; lady
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; sailor
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE   ; swimmerm
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE ; swimmerf
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; burglar
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; scientist
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; boarder
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; skier
	db  48, $FF, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; blackbelt
	db  48, $FF, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; battle girl
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE ; teacher
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; guitaristm
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; guitaristf
	db  48, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; biker
	db  48, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; roughneck
	db  48, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE   ; cooltrainerm
	db  48, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE ; cooltrainerf
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; prof elm
	db   0, $DD, $DF, $DD, ABILITY_1 | TIMID, FEMALE  ; teacherfast
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; triobror
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; triobrob
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; triobroy
	db  24, $99, $99, $99, ABILITY_1 | QUIRKY, MALE   ; disguiseman
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bikinip
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bikinir
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE ; bikiniy
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, MALE   ; delinquentm
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE ; delinquentf
	db  24, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; bunearym
	db  24, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; bunearyf
	db  32, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; frankie
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE   ; mall cop
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE   ; skater
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE   ; spatrainer
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE ; spatrainerf
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE   ; towertycoon

; 2715c
