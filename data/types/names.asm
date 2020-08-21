PrintMonTypes: ; 5090d
; Print one or both types of [wCurSpecies]
; on the stats screen at hl.

	push hl
	call GetBaseData
	
	ld a, [wBaseType1]
	call .Print

	; Single-typed monsters really
	; have two of the same type.
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	pop hl
	ret z

	ld bc, SCREEN_WIDTH
	add hl, bc

.Print:
	ld b, a

	push hl
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString
; 50964


GetTypeName: ; 50964
; Copy the name of type [wNamedObjectIndexBuffer] to StringBuffer1.

	ld a, [wNamedObjectIndexBuffer]
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer1
	ld bc, 13
	rst CopyBytes
	ret
; 5097b


TypeNames: ; 5097b
	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Bug
	dw Ghost
	dw Steel
	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	dw Fairy
	dw UnknownType

Normal:      db "NORMAL@"
Fighting:    db "FIGHTING@"
Flying:      db "FLYING@"
Poison:      db "POISON@"
Ground:      db "GROUND@"
Rock:        db "ROCK@"
Bug:         db "BUG@"
Ghost:       db "GHOST@"
Steel:       db "STEEL@"
Fire:        db "FIRE@"
Water:       db "WATER@"
Grass:       db "GRASS@"
Electric:    db "ELECTRIC@"
Psychic:     db "PSYCHIC@"
Ice:         db "ICE@"
Dragon:      db "DRAGON@"
Dark:        db "DARK@"
Fairy:       db "FAIRY@"
UnknownType: db "???@"

; 50a28
