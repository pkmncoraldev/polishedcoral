LoadMapGroupRoof::
	ld a, [wMapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofs
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld hl, Roofs
	ld bc, 9 tiles
	rst AddNTimes
	ld d, h
	ld e, l
	lb bc, BANK(Roofs), 9
	ld hl, VTiles2 tile $0a
	jp Get2bpp
	
CheckIfTilesetHasRoof::
	ld a, [wTileset]
	cp TILESET_SUNSET
	jr z, .load_roof
	cp TILESET_GLINT
	jr z, .load_roof
	cp TILESET_STARGLOW
	jr z, .load_roof
	cp TILESET_SPOOKY
	jr z, .load_roof
	cp TILESET_RANCH
	jr z, .load_roof
	cp TILESET_SHIMMER
	jr z, .load_roof
	cp TILESET_HIGHWAY
	jr z, .load_roof
	cp TILESET_HIGHWAY_2
	jr z, .load_roof
	cp TILESET_SOUTH_TOWNS
	jr z, .load_roof
	cp TILESET_AUTUMN
	jr z, .load_roof
	xor a
	ret
.load_roof
	scf
	ret

INCLUDE "data/maps/roofs.asm"
