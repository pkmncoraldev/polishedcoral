AddSkateparkScore::
	xor a
	ld b, a
	ld a, [wSkateparkCurTrick]
	dec a
	ld c, a
	ld a, 1
	ld hl, SkateparkScoreTable
	rst AddNTimes
	ld a, [hl]
	ld b, a
	ld a, [wSkateparkCombo]
	dec a
	ld c, a
	ld a, [wSkateparkScore]
	add b
	jr nc, .loop
	push af
	ld a, $ff
	ld [wSkateparkScore], a
	pop af
	jr .finish
.loop
	inc a
	inc a
	push af
	ld a, c
	cp 0
	jr z, .cont
	dec a
	ld c, a
	pop af
	jr .loop
.cont
	pop af
	dec a
	dec a
	ld [wSkateparkScore], a
	ld a, [wSkateparkCurTrick]
	ld b, a
	ld a, [wSkateparkStaleTrick1]
	cp b
	jr z, .stale
	ld a, [wSkateparkStaleTrick2]
	cp b
	jr z, .stale
	ld a, [wSkateparkStaleTrick3]
	cp b
	jr z, .stale
	ld a, [wSkateparkStaleTrick4]
	cp b
	jr z, .stale
.finish
	ld a, [wSkateparkStaleTrick3]
	ld [wSkateparkStaleTrick4], a
	ld a, [wSkateparkStaleTrick2]
	ld [wSkateparkStaleTrick3], a
	ld a, [wSkateparkStaleTrick1]
	ld [wSkateparkStaleTrick2], a
	ld a, [wSkateparkCurTrick]
	ld [wSkateparkStaleTrick1], a
	xor a
	ld [wSkateparkCurTrick], a
	ld [wSkateparkCombo], a
	ret
.stale
	xor a
	ld b, a
	ld a, [wSkateparkCurTrick]
	dec a
	ld c, a
	ld a, 1
	ld hl, SkateparkScoreTable
	rst AddNTimes
	ld a, [hl]
	rra
	ld c, a
	ld a, [wSkateparkScore]
	sub c
	ld [wSkateparkScore], a
	jr .finish
	
IncreaseSkateboardCombo::
	ld a, [wSkateparkCombo]
	cp 6
	ret z
	inc a
	ld [wSkateparkCombo], a
	ret
	
HalveSkateparkScore::
	ld hl, wSkateparkScore
	ld a, [hl]
	rra
	ld [hl], a
	ret
	
SkateparkScoreTable:
	db 9  ;SKATEPARK_RAIL_1
	db 9  ;SKATEPARK_RAIL_2
	db 13 ;SKATEPARK_RAIL_3
	db 9 ;SKATEPARK_RAIL_4
	db 9  ;SKATEPARK_RAIL_5
	db 7  ;SKATEPARK_FLOWERBED_1
	db 7  ;SKATEPARK_FLOWERBED_2
	db 7  ;SKATEPARK_FLOWERBED_3
	db 7  ;SKATEPARK_FLOWERBED_4
	db 7  ;SKATEPARK_FLOWERBED_5
	db 7  ;SKATEPARK_FLOWERBED_6
	db 12 ;SKATEPARK_FLOWERBED_7
	db 9  ;SKATEPARK_FOUNTAIN
	db -1
	