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
INCBIN "gfx/tilesets/glint.2bpp.vram0.lz"

TilesetGlintGFX2::
INCBIN "gfx/tilesets/glint.2bpp.vram1.lz"

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
INCBIN "gfx/tilesets/house2.2bpp.vram0.lz"

TilesetHouse2GFX2::
INCBIN "gfx/tilesets/house2.2bpp.vram1.lz"

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
TilesetStarglowCavernGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetCaveGFX2 EQU 0
TilesetStarglowCavernGFX2 EQU 0

TilesetCaveMeta::
TilesetStarglowCavernMeta::
INCBIN "data/tilesets/cave_metatiles.bin.lz"

TilesetCaveAttr::
INCBIN "data/tilesets/cave_attributes.bin.lz"

TilesetCaveColl::
TilesetStarglowCavernColl:
INCLUDE "data/tilesets/cave_collision.asm"

TilesetStarglowCavernAttr::
INCBIN "data/tilesets/starglow_cavern_attributes.bin.lz"


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


SECTION "Tileset Data - mart", ROMX

TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartGFX2 EQU 0

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin.lz"

TilesetMartAttr::
INCBIN "data/tilesets/mart_attributes.bin.lz"

TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"


SECTION "Tileset Data - mountain", ROMX

TilesetMountainGFX::
INCBIN "gfx/tilesets/mountain.2bpp.lz"

TilesetMountainGFX2 EQU 0

TilesetMountainMeta::
INCBIN "data/tilesets/mountain_metatiles.bin.lz"

TilesetMountainAttr::
INCBIN "data/tilesets/mountain_attributes.bin.lz"

TilesetMountainColl::
INCLUDE "data/tilesets/mountain_collision.asm"


SECTION "Tileset Data - jungle", ROMX

TilesetJungleGFX::
INCBIN "gfx/tilesets/jungle.2bpp.lz"

TilesetJungleGFX2 EQU 0

TilesetJungleMeta::
INCBIN "data/tilesets/jungle_metatiles.bin.lz"

TilesetJungleAttr::
INCBIN "data/tilesets/jungle_attributes.bin.lz"

TilesetJungleColl::
INCLUDE "data/tilesets/jungle_collision.asm"


SECTION "Tileset Data - spooky", ROMX

TilesetSpookyGFX::
INCBIN "gfx/tilesets/spooky.2bpp.lz"

TilesetSpookyGFX2 EQU 0

TilesetSpookyMeta::
INCBIN "data/tilesets/spooky_metatiles.bin.lz"

TilesetSpookyAttr::
INCBIN "data/tilesets/spooky_attributes.bin.lz"

TilesetSpookyColl::
INCLUDE "data/tilesets/spooky_collision.asm"


SECTION "Tileset Data - haunted", ROMX

TilesetHauntedGFX::
TilesetHauntedTVGFX::
INCBIN "gfx/tilesets/haunted.2bpp.lz"

TilesetHauntedGFX2 EQU 0

TilesetHauntedTVGFX2 EQU 0

TilesetHauntedMeta::
TilesetHauntedTVMeta::
INCBIN "data/tilesets/haunted_metatiles.bin.lz"

TilesetHauntedAttr::
TilesetHauntedTVAttr::
INCBIN "data/tilesets/haunted_attributes.bin.lz"

TilesetHauntedColl::
TilesetHauntedTVColl::
INCLUDE "data/tilesets/haunted_collision.asm"


SECTION "Tileset Data - ranch", ROMX

TilesetRanchGFX::
INCBIN "gfx/tilesets/ranch.2bpp.vram0.lz"

TilesetRanchGFX2::
INCBIN "gfx/tilesets/ranch.2bpp.vram1.lz"

TilesetRanchMeta::
INCBIN "data/tilesets/ranch_metatiles.bin.lz"

TilesetRanchAttr::
INCBIN "data/tilesets/ranch_attributes.bin.lz"

TilesetRanchColl::
INCLUDE "data/tilesets/ranch_collision.asm"


SECTION "Tileset Data - luster", ROMX

TilesetLusterGFX::
INCBIN "gfx/tilesets/luster.2bpp.vram0.lz"

TilesetLusterGFX2::
INCBIN "gfx/tilesets/luster.2bpp.vram1.lz"

TilesetLusterMeta::
INCBIN "data/tilesets/luster_metatiles.bin.lz"

TilesetLusterAttr::
INCBIN "data/tilesets/luster_attributes.bin.lz"

TilesetLusterColl::
INCLUDE "data/tilesets/luster_collision.asm"


SECTION "Tileset Data - snow", ROMX

TilesetSnowGFX::
INCBIN "gfx/tilesets/snow.2bpp.lz"

TilesetSnowGFX2 EQU 0

TilesetSnowMeta::
INCBIN "data/tilesets/snow_metatiles.bin.lz"

TilesetSnowAttr::
INCBIN "data/tilesets/snow_attributes.bin.lz"

TilesetSnowColl::
INCLUDE "data/tilesets/snow_collision.asm"


SECTION "Tileset Data - park", ROMX

TilesetParkGFX::
INCBIN "gfx/tilesets/park.2bpp.lz"

TilesetParkGFX2 EQU 0

TilesetParkMeta::
INCBIN "data/tilesets/park_metatiles.bin.lz"

TilesetParkAttr::
INCBIN "data/tilesets/park_attributes.bin.lz"

TilesetParkColl::
INCLUDE "data/tilesets/park_collision.asm"


SECTION "Tileset Data - mall1", ROMX

TilesetMall1GFX::
INCBIN "gfx/tilesets/mall1.2bpp.vram0.lz"

TilesetMall1GFX2::
INCBIN "gfx/tilesets/mall1.2bpp.vram1.lz"

TilesetMall1Meta::
INCBIN "data/tilesets/mall1_metatiles.bin.lz"

TilesetMall1Attr::
INCBIN "data/tilesets/mall1_attributes.bin.lz"

TilesetMall1Coll::
INCLUDE "data/tilesets/mall1_collision.asm"


SECTION "Tileset Data - mall2", ROMX

TilesetMall2GFX::
INCBIN "gfx/tilesets/mall2.2bpp.vram0.lz"

TilesetMall2GFX2::
INCBIN "gfx/tilesets/mall2.2bpp.vram1.lz"

TilesetMall2Meta::
INCBIN "data/tilesets/mall2_metatiles.bin.lz"

TilesetMall2Attr::
INCBIN "data/tilesets/mall2_attributes.bin.lz"

TilesetMall2Coll::
INCLUDE "data/tilesets/mall2_collision.asm"


SECTION "Tileset Data - sewer", ROMX

TilesetSewerGFX::
INCBIN "gfx/tilesets/sewer.2bpp.lz"

TilesetSewerGFX2 EQU 0

TilesetSewerMeta::
INCBIN "data/tilesets/sewer_metatiles.bin.lz"

TilesetSewerAttr::
INCBIN "data/tilesets/sewer_attributes.bin.lz"

TilesetSewerColl::
INCLUDE "data/tilesets/sewer_collision.asm"


SECTION "Tileset Data - train", ROMX

TilesetTrainGFX::
INCBIN "gfx/tilesets/train.2bpp.lz"

TilesetTrainGFX2 EQU 0

TilesetTrainMeta::
INCBIN "data/tilesets/train_metatiles.bin.lz"

TilesetTrainAttr::
INCBIN "data/tilesets/train_attributes.bin.lz"

TilesetTrainColl::
INCLUDE "data/tilesets/train_collision.asm"


SECTION "Tileset Data - icetemple", ROMX

TilesetIceTempleGFX::
INCBIN "gfx/tilesets/ice_temple.2bpp.lz"

TilesetIceTempleGFX2 EQU 0

TilesetIceTempleMeta::
INCBIN "data/tilesets/ice_temple_metatiles.bin.lz"

TilesetIceTempleAttr::
INCBIN "data/tilesets/ice_temple_attributes.bin.lz"

TilesetIceTempleColl::
INCLUDE "data/tilesets/ice_temple_collision.asm"


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
	tileset TilesetMart
	tileset TilesetCafe
	tileset TilesetLighthouse
	tileset TilesetGate
	tileset TilesetLab
	tileset TilesetCave
	tileset TilesetStarglowCavern
	tileset TilesetGrove
	tileset TilesetMountain
	tileset TilesetJungle
	tileset TilesetSpooky
	tileset TilesetHaunted
	tileset TilesetHauntedTV
	tileset TilesetRanch
	tileset TilesetLuster
	tileset TilesetSnow
	tileset TilesetPark
	tileset TilesetMall1
	tileset TilesetMall2
	tileset TilesetSewer
	tileset TilesetTrain
