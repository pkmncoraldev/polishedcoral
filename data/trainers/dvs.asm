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
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; cory
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; cora
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; pippi
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; red
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; leaf
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; gold
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; kris
	db 252, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; stanley
	db 100, $99, $99, $99, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; rodney
	db 252, $77, $7A, $77, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; wendy
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; charlie
	db 252, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; polly
	db 252, $EE, $EE, $EE, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; leilani
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; pryce
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; clair
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; will
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; koga
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; bruno
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; karen
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; champion
	db   0, $99, $99, $99, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; rival
	db   0, $99, $99, $99, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; rival_s
	db   0, $33, $33, $33, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; youngster
	db   0, $33, $33, $33, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; bug catcher
	db   0, $55, $55, $55, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; camper
	db   0, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; picnicker
	db   0, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; twins
	db   8, $55, $55, $55, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; fisher
	db   8, $77, $77, $77, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; bird keeper
	db  16, $77, $77, $77, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; hiker
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; gruntm
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; gruntf
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; kage
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; locke
	db   8, $88, $88, $88, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; pokefanm
	db   8, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; pokefanf
	db  24, $DD, $BB, $DB, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; officer
	db  20, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; pokemaniac
	db  20, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; super nerd
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; lass
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; beauty
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; firebreather
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; juggler
	db  12, $55, $55, $55, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; schoolboy
	db  24, $AA, $CC, $EE, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; psychic
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; couple
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; gentleman
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; lady
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; sailor
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; swimmerm
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; swimmerf
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; burglar
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; scientist
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; boarder
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; skier
	db  48, $BB, $88, $88, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; blackbelt
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; teacher
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; guitarist
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; biker
	db  48, $EE, $EE, $EE, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; cueball
	db  48, $BB, $BB, $BB, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; cooltrainerm
	db  48, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; cooltrainerf
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; prof spruce
	db   0, $DD, $DF, $DD, ABILITY_1 | TIMID, FEMALE | PLAIN_FORM  ; teacherfast
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; triobror
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; triobrob
	db 252, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; triobroy
	db  24, $99, $99, $99, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; disguiseman
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; bikinip
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; bikinir
	db  40, $BB, $BB, $BB, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; bikiniy
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; delinquentm
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; delinquentf
	db  24, $88, $88, $88, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; bunearym
	db  24, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; bunearyf
	db  32, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; frankie
	db   0, $66, $66, $66, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; mall cop
	db  24, $DD, $DD, $DD, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; skater
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; spatrainer
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; spatrainerf
	db  16, $88, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; aromalady
	db  24, $CC, $CC, $CC, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; tuber
	db  48, $BB, $88, $88, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; shaolin
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; rose
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; lily
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; iris
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; poppy
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; felicia
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; violet
	db  24, $AA, $AA, $AA, ABILITY_1 | QUIRKY, FEMALE | PLAIN_FORM ; clover
	db 252, PERFECT_DVS,   ABILITY_1 | QUIRKY, MALE | PLAIN_FORM   ; towertycoon

; 2715c
