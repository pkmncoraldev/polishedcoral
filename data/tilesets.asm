INCLUDE "constants.asm"


tilecoll: MACRO
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM

SECTION "Tileset Data - player_room", ROMX

TilesetPlayerRoomGFX::
INCBIN "gfx/tilesets/player_room.2bpp.lz"

TilesetPlayerRoomGFX2 EQU 0

TilesetPlayerRoomMeta::
INCBIN "data/tilesets/player_room_metatiles.bin.lz"

TilesetPlayerRoomAttr::
INCBIN "data/tilesets/player_room_attributes.bin.lz"

TilesetPlayerRoomColl::
INCLUDE "data/tilesets/player_room_collision.asm"


SECTION "Tileset Data - playerhouse", ROMX

TilesetPlayerHouseGFX::
INCBIN "gfx/tilesets/playerhouse.2bpp.lz"

TilesetPlayerHouseGFX2 EQU 0

TilesetPlayerHouseMeta::
INCBIN "data/tilesets/playerhouse_metatiles.bin.lz"

TilesetPlayerHouseAttr::
INCBIN "data/tilesets/playerhouse_attributes.bin.lz"

TilesetPlayerHouseColl::
INCLUDE "data/tilesets/playerhouse_collision.asm"


SECTION "Tileset Data - glint", ROMX

TilesetGlintGFX::
INCBIN "gfx/tilesets/glint.2bpp.lz"

TilesetGlintGFX2 EQU 0

TilesetGlintMeta::
INCBIN "data/tilesets/glint_metatiles.bin.lz"

TilesetGlintAttr::
INCBIN "data/tilesets/glint_attributes.bin.lz"

TilesetGlintColl::
INCLUDE "data/tilesets/glint_collision.asm"


SECTION "Tileset Data - house1", ROMX

TilesetHouse1GFX::
INCBIN "gfx/tilesets/house1.2bpp.lz"

TilesetHouse1GFX2 EQU 0

TilesetHouse1Meta::
INCBIN "data/tilesets/house1_metatiles.bin.lz"

TilesetHouse1Attr::
INCBIN "data/tilesets/house1_attributes.bin.lz"

TilesetHouse1Coll::
INCLUDE "data/tilesets/house1_collision.asm"


SECTION "Tileset Data - house2", ROMX

TilesetHouse2GFX::
INCBIN "gfx/tilesets/house2.2bpp.lz"

TilesetHouse2GFX2 EQU 0

TilesetHouse2Meta::
INCBIN "data/tilesets/house2_metatiles.bin.lz"

TilesetHouse2Attr::
INCBIN "data/tilesets/house2_attributes.bin.lz"

TilesetHouse2Coll::
INCLUDE "data/tilesets/house2_collision.asm"


SECTION "Tileset Data - pokecenter", ROMX

TilesetPokeCenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokeCenterGFX2 EQU 0

TilesetPokeCenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin.lz"

TilesetPokeCenterAttr::
INCBIN "data/tilesets/pokecenter_attributes.bin.lz"

TilesetPokeCenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"


SECTION "Tileset Data - cafe", ROMX

TilesetCafeGFX::
INCBIN "gfx/tilesets/cafe.2bpp.lz"

TilesetCafeGFX2 EQU 0

TilesetCafeMeta::
INCBIN "data/tilesets/cafe_metatiles.bin.lz"

TilesetCafeAttr::
INCBIN "data/tilesets/cafe_attributes.bin.lz"

TilesetCafeColl::
INCLUDE "data/tilesets/cafe_collision.asm"


SECTION "Tileset Data - lighthouse", ROMX

TilesetLighthouseGFX::
INCBIN "gfx/tilesets/lighthouse.2bpp.lz"

TilesetLighthouseGFX2 EQU 0

TilesetLighthouseMeta::
INCBIN "data/tilesets/lighthouse_metatiles.bin.lz"

TilesetLighthouseAttr::
INCBIN "data/tilesets/lighthouse_attributes.bin.lz"

TilesetLighthouseColl::
INCLUDE "data/tilesets/lighthouse_collision.asm"


SECTION "Tileset Data - gate", ROMX

TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGateGFX2 EQU 0

TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin.lz"

TilesetGateAttr::
INCBIN "data/tilesets/gate_attributes.bin.lz"

TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"


SECTION "Tileset Data - lab", ROMX

TilesetLabGFX::
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabGFX2 EQU 0

TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin.lz"

TilesetLabAttr::
INCBIN "data/tilesets/lab_attributes.bin.lz"

TilesetLabColl::
INCLUDE "data/tilesets/lab_collision.asm"


SECTION "Tileset Data - cave", ROMX

TilesetCaveGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveGFX2 EQU 0

TilesetCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin.lz"

TilesetCaveAttr::
INCBIN "data/tilesets/cave_attributes.bin.lz"

TilesetCaveColl::
INCLUDE "data/tilesets/cave_collision.asm"


SECTION "Tileset Data - grove", ROMX

TilesetGroveGFX::
INCBIN "gfx/tilesets/grove.2bpp.lz"

TilesetGroveGFX2 EQU 0

TilesetGroveMeta::
INCBIN "data/tilesets/grove_metatiles.bin.lz"

TilesetGroveAttr::
INCBIN "data/tilesets/grove_attributes.bin.lz"

TilesetGroveColl::
INCLUDE "data/tilesets/grove_collision.asm"


SECTION "Tileset Headers", ROMX

tileset: macro
	dba \1GFX
	dw \1GFX2
	dba \1Meta, \1Coll, \1Attr
	dw \1Anim
endm

Tilesets::
	tileset TilesetPlayerRoom
	tileset TilesetPlayerHouse
	tileset TilesetGlint
	tileset TilesetHouse1
	tileset TilesetHouse2
	tileset TilesetPokeCenter
	tileset TilesetCafe
	tileset TilesetLighthouse
	tileset TilesetGate
	tileset TilesetLab
	tileset TilesetCave
	tileset TilesetGrove
