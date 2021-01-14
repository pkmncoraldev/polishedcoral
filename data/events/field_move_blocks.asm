CutGrassBlockPointers:
; Which tileset are we in?
	dbw TILESET_SUNSET, .glint
	dbw TILESET_GLINT, .glint
	dbw TILESET_STARGLOW, .glint
	dbw TILESET_MOUNTAIN, .glint
	dbw TILESET_SPOOKY, .glint
	dbw TILESET_JUNGLE, .glint ;TODO - Jungle tileset cut stuff
	db -1

.glint
; Which meta tile are we facing, which should we replace it with, and which animation?
	db $03, $02, $01 ; grass
	db -1

WhirlpoolBlockPointers:
	dbw TILESET_GLINT, .glint
	db -1

.glint ; c8a8
	db $00, $00, $00
	db -1
