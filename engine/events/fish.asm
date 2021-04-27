Fish: ; 92402
; Using a fishing rod.
; Fish for monsters with rod e in encounter group d.
; Return monster e at level d.

	push af
	push bc
	push hl

	ld b, e
	call GetFishGroupIndex

	ld hl, FishGroups
rept 7
	add hl, de
endr
	call .Fish

	pop hl
	pop bc
	pop af
	ret
; 9241a


.Fish: ; 9241a
; Fish for monsters with rod b from encounter data in FishGroup at hl.
; Return monster e at level d; or item e if d = 0; or nothing if de = 0.

	call Random
	cp [hl]
	jr c, .bite
	call Random
	cp $7f ; 50 percent
	jr c, .no_bite

	; Get item by rod
	; 0: Old
	; 1: Good
	; 2: Super
	ld a, [wTileset]
	cp TILESET_GROVE
	jr nz, .normal
	ld a, FLOWER_PETAL
	jr .got_items
.normal
	call Random
	cp $7f ; 50 percent
	jr c, .not_bottle_cap
	ld a, BOTTLE_CAP
	jr .got_items
.not_bottle_cap
	ld hl, FishItems
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
.got_items
	ld e, a
	ret

.bite
	; Get encounter data by rod:
	; 0: Old
	; 1: Good
	; 2: Super
	inc hl
;	inc hl
	ld e, b
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Compare the encounter chance to select a Pokemon.
	call Random
.loop
	cp [hl]
	jr z, .ok
	jr c, .ok
	inc hl
	inc hl
	inc hl
	jr .loop
.ok
	inc hl

	; Species 0 reads from a time-based encounter table.
	ld a, [hli]
	ld d, a
	ld e, [hl]
	ret

.no_bite
	ld de, 0
	ret

GetFishGroupIndex: ; 9245b
; Return the index of fishgroup d in de.

	ld a, [wMapGroup]
	cp GROUP_ROUTE_3
	jp nz, .not_route_3
	ld a, [wMapNumber]
	cp MAP_ROUTE_3
	jp nz, .not_route_3
	eventflagcheck EVENT_ROUTE_3_ROCKS_BROWN
	jp nz, .not_route_3
	ld d, FISHGROUP_ROUTE_3_POND
.not_route_3
	dec d
	ld e, d
	ld d, 0
	ret


INCLUDE "data/wild/fish.asm"
