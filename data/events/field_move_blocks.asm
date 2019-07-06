CutGrassBlockPointers:
; Which tileset are we in?
	dbw TILESET_GLINT, .glint
	dbw TILESET_MOUNTAIN, .mountain
	dbw TILESET_SPOOKY, .spooky
	dbw TILESET_JUNGLE, .jungle
	db -1

.glint
; Which meta tile are we facing, which should we replace it with, and which animation?
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $2f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1
	
.mountain
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $2f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1
	
.spooky
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $2f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1

.jungle
	db $03, $02, $01 ; grass
	db $4e, $68, $00 ; tree
	db $61, $60, $00 ; tree
	db $62, $69, $00 ; tree
	db $63, $6e, $00 ; tree
	db -1

RockSmashRockBlockPointers:
	dbw TILESET_STARGLOW_CAVERN, .starglowcavern
	db -1

.starglowcavern ; c8a8
	db $5f, $1c, $00
	db $60, $2b, $00
	db -1

WhirlpoolBlockPointers:
	dbw TILESET_GLINT, .glint
	db -1

.glint ; c8a8
	db $07, $36, $00
	db -1
