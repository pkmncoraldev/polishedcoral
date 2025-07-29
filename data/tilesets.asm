INCLUDE "constants.asm"


MACRO tilecoll
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM

SECTION "Tileset Data - player_room", ROMX

TilesetPlayerRoomGFX0::
INCBIN "gfx/tilesets/player_room.2bpp.lz"

DEF TilesetPlayerRoomGFX1 EQU 0

DEF TilesetPlayerRoomGFX2 EQU 0

TilesetPlayerRoomMeta::
INCBIN "data/tilesets/player_room_metatiles.bin.lz"

TilesetPlayerRoomAttr::
INCBIN "data/tilesets/player_room_attributes.bin.lz"

TilesetPlayerRoomColl::
INCLUDE "data/tilesets/player_room_collision.asm"


SECTION "Tileset Data - playerhouse", ROMX

TilesetPlayerHouseGFX0::
INCBIN "gfx/tilesets/playerhouse.2bpp.vram0.lz"

TilesetPlayerHouseGFX1::
INCBIN "gfx/tilesets/playerhouse.2bpp.vram1.lz"

DEF TilesetPlayerHouseGFX2 EQU 0

TilesetPlayerHouseMeta::
INCBIN "data/tilesets/playerhouse_metatiles.bin.lz"

TilesetPlayerHouseAttr::
INCBIN "data/tilesets/playerhouse_attributes.bin.lz"

TilesetPlayerHouseColl::
INCLUDE "data/tilesets/playerhouse_collision.asm"


SECTION "Tileset Data - sunset", ROMX

TilesetSunsetGFX0::
INCBIN "gfx/tilesets/sunset.2bpp.vram0.lz"

TilesetSunsetGFX1::
INCBIN "gfx/tilesets/sunset.2bpp.vram1.lz"

TilesetSunsetGFX2::
INCBIN "gfx/tilesets/sunset.2bpp.vram2.lz"

TilesetSunsetMeta::
INCBIN "data/tilesets/sunset_metatiles.bin.lz"

TilesetSunsetAttr::
INCBIN "data/tilesets/sunset_attributes.bin.lz"

TilesetSunsetColl::
INCLUDE "data/tilesets/sunset_collision.asm"


SECTION "Tileset Data - glint", ROMX

TilesetGlintGFX0::
TilesetStarglowGFX0::
INCBIN "gfx/tilesets/glint.2bpp.vram0.lz"

TilesetGlintGFX1::
TilesetStarglowGFX1::
INCBIN "gfx/tilesets/glint.2bpp.vram1.lz"

DEF TilesetGlintGFX2 EQU 0
TilesetStarglowGFX2::
INCBIN "gfx/tilesets/glint.2bpp.vram2.lz"

TilesetGlintMeta::
INCBIN "data/tilesets/glint_metatiles.bin.lz"

TilesetGlintAttr::
INCBIN "data/tilesets/glint_attributes.bin.lz"

TilesetGlintColl::
INCLUDE "data/tilesets/glint_collision.asm"


SECTION "Tileset Data - starglow", ROMX

TilesetStarglowMeta::
INCBIN "data/tilesets/starglow_metatiles.bin.lz"

TilesetStarglowAttr::
INCBIN "data/tilesets/starglow_attributes.bin.lz"

TilesetStarglowColl::
INCLUDE "data/tilesets/starglow_collision.asm"


SECTION "Tileset Data - house1", ROMX

TilesetHouse1GFX0::
INCBIN "gfx/tilesets/house1.2bpp.vram0.lz"

TilesetHouse1GFX1::
INCBIN "gfx/tilesets/house1.2bpp.vram1.lz"

TilesetHouse1GFX2::
INCBIN "gfx/tilesets/house1.2bpp.vram2.lz"

TilesetHouse1Meta::
INCBIN "data/tilesets/house1_metatiles.bin.lz"

TilesetHouse1Attr::
INCBIN "data/tilesets/house1_attributes.bin.lz"

TilesetHouse1Coll::
INCLUDE "data/tilesets/house1_collision.asm"


SECTION "Tileset Data - house2", ROMX

TilesetHouse2GFX0::
INCBIN "gfx/tilesets/house2.2bpp.vram0.lz"

TilesetHouse2GFX1::
INCBIN "gfx/tilesets/house2.2bpp.vram1.lz"

TilesetHouse2GFX2::
INCBIN "gfx/tilesets/house2.2bpp.vram2.lz"

TilesetHouse2Meta::
INCBIN "data/tilesets/house2_metatiles.bin.lz"

TilesetHouse2Attr::
INCBIN "data/tilesets/house2_attributes.bin.lz"

TilesetHouse2Coll::
INCLUDE "data/tilesets/house2_collision.asm"


SECTION "Tileset Data - pokecenter", ROMX

TilesetPokeCenterGFX0::
INCBIN "gfx/tilesets/pokecenter.2bpp.vram0.lz"

TilesetPokeCenterGFX1::
INCBIN "gfx/tilesets/pokecenter.2bpp.vram1.lz"

DEF TilesetPokeCenterGFX2 EQU 0

TilesetPokeCenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin.lz"

TilesetPokeCenterAttr::
INCBIN "data/tilesets/pokecenter_attributes.bin.lz"

TilesetPokeCenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"


SECTION "Tileset Data - lighthouse", ROMX

TilesetLighthouseGFX0::
INCBIN "gfx/tilesets/lighthouse.2bpp.vram0.lz"

TilesetLighthouseGFX1::
INCBIN "gfx/tilesets/lighthouse.2bpp.vram1.lz"

DEF TilesetLighthouseGFX2 EQU 0

TilesetLighthouseMeta::
INCBIN "data/tilesets/lighthouse_metatiles.bin.lz"

TilesetLighthouseAttr::
INCBIN "data/tilesets/lighthouse_attributes.bin.lz"

TilesetLighthouseColl::
INCLUDE "data/tilesets/lighthouse_collision.asm"


SECTION "Tileset Data - gate", ROMX

TilesetGateGFX0::
INCBIN "gfx/tilesets/gate.2bpp.vram0.lz"

TilesetGateGFX1::
INCBIN "gfx/tilesets/gate.2bpp.vram1.lz"

TilesetGateGFX2::
INCBIN "gfx/tilesets/gate.2bpp.vram2.lz"

TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin.lz"

TilesetGateAttr::
INCBIN "data/tilesets/gate_attributes.bin.lz"

TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"


SECTION "Tileset Data - lab", ROMX

TilesetLabGFX0::
INCBIN "gfx/tilesets/lab.2bpp.vram0.lz"

TilesetLabGFX1::
INCBIN "gfx/tilesets/lab.2bpp.vram1.lz"

TilesetLabGFX2::
INCBIN "gfx/tilesets/lab.2bpp.vram2.lz"

TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin.lz"

TilesetLabAttr::
INCBIN "data/tilesets/lab_attributes.bin.lz"

TilesetLabColl::
INCLUDE "data/tilesets/lab_collision.asm"


SECTION "Tileset Data - cave", ROMX

TilesetCaveGFX0::
TilesetStarglowCavernGFX0::
TilesetLavaCaveGFX0::
INCBIN "gfx/tilesets/cave.2bpp.vram0.lz"

TilesetCaveGFX1::
TilesetStarglowCavernGFX1::
TilesetLavaCaveGFX1::
INCBIN "gfx/tilesets/cave.2bpp.vram1.lz"

TilesetCaveGFX2::
TilesetStarglowCavernGFX2::
TilesetLavaCaveGFX2::
INCBIN "gfx/tilesets/cave.2bpp.vram2.lz"

TilesetCaveMeta::
TilesetStarglowCavernMeta::
TilesetLavaCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin.lz"

TilesetCaveAttr::
TilesetLavaCaveAttr::
INCBIN "data/tilesets/cave_attributes.bin.lz"

TilesetCaveColl::
TilesetStarglowCavernColl:
TilesetLavaCaveColl::
INCLUDE "data/tilesets/cave_collision.asm"

TilesetStarglowCavernAttr::
INCBIN "data/tilesets/starglow_cavern_attributes.bin.lz"


SECTION "Tileset Data - grove", ROMX

TilesetGroveGFX0::
INCBIN "gfx/tilesets/grove.2bpp.vram0.lz"

TilesetGroveGFX1::
INCBIN "gfx/tilesets/grove.2bpp.vram1.lz"

DEF TilesetGroveGFX2 EQU 0

TilesetGroveMeta::
INCBIN "data/tilesets/grove_metatiles.bin.lz"

TilesetGroveAttr::
INCBIN "data/tilesets/grove_attributes.bin.lz"

TilesetGroveColl::
INCLUDE "data/tilesets/grove_collision.asm"


SECTION "Tileset Data - mart", ROMX

TilesetMartGFX0::
INCBIN "gfx/tilesets/mart.2bpp.vram0.lz"

TilesetMartGFX1::
INCBIN "gfx/tilesets/mart.2bpp.vram1.lz"

DEF TilesetMartGFX2 EQU 0

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin.lz"

TilesetMartAttr::
INCBIN "data/tilesets/mart_attributes.bin.lz"

TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"


SECTION "Tileset Data - mountain", ROMX

TilesetMountainGFX0::
INCBIN "gfx/tilesets/mountain.2bpp.vram0.lz"

TilesetMountainGFX1::
INCBIN "gfx/tilesets/mountain.2bpp.vram1.lz"

DEF TilesetMountainGFX2 EQU 0

TilesetMountainMeta::
INCBIN "data/tilesets/mountain_metatiles.bin.lz"

TilesetMountainAttr::
INCBIN "data/tilesets/mountain_attributes.bin.lz"

TilesetMountainColl::
INCLUDE "data/tilesets/mountain_collision.asm"


SECTION "Tileset Data - jungle", ROMX

TilesetJungleGFX0::
INCBIN "gfx/tilesets/jungle.2bpp.vram0.lz"

TilesetJungleGFX1::
INCBIN "gfx/tilesets/jungle.2bpp.vram1.lz"

TilesetJungleGFX2::
INCBIN "gfx/tilesets/jungle.2bpp.vram2.lz"

TilesetJungleMeta::
INCBIN "data/tilesets/jungle_metatiles.bin.lz"

TilesetJungleAttr::
INCBIN "data/tilesets/jungle_attributes.bin.lz"

TilesetJungleColl::
INCLUDE "data/tilesets/jungle_collision.asm"


SECTION "Tileset Data - spooky", ROMX

TilesetSpookyGFX0::
INCBIN "gfx/tilesets/spooky.2bpp.vram0.lz"

TilesetSpookyGFX1::
INCBIN "gfx/tilesets/spooky.2bpp.vram1.lz"

DEF TilesetSpookyGFX2 EQU 0

TilesetSpookyMeta::
INCBIN "data/tilesets/spooky_metatiles.bin.lz"

TilesetSpookyAttr::
INCBIN "data/tilesets/spooky_attributes.bin.lz"

TilesetSpookyColl::
INCLUDE "data/tilesets/spooky_collision.asm"


SECTION "Tileset Data - haunted", ROMX

TilesetHauntedGFX0::
TilesetHauntedTVGFX0::
INCBIN "gfx/tilesets/haunted.2bpp.vram0.lz"

TilesetHauntedGFX1::
TilesetHauntedTVGFX1::
INCBIN "gfx/tilesets/haunted.2bpp.vram1.lz"

TilesetHauntedGFX2::
TilesetHauntedTVGFX2::
INCBIN "gfx/tilesets/haunted.2bpp.vram2.lz"

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

TilesetRanchGFX0::
INCBIN "gfx/tilesets/ranch.2bpp.vram0.lz"

TilesetRanchGFX1::
INCBIN "gfx/tilesets/ranch.2bpp.vram1.lz"

TilesetRanchGFX2::
INCBIN "gfx/tilesets/ranch.2bpp.vram2.lz"

TilesetRanchMeta::
INCBIN "data/tilesets/ranch_metatiles.bin.lz"

TilesetRanchAttr::
INCBIN "data/tilesets/ranch_attributes.bin.lz"

TilesetRanchColl::
INCLUDE "data/tilesets/ranch_collision.asm"


SECTION "Tileset Data - luster", ROMX

TilesetLusterGFX0::
INCBIN "gfx/tilesets/luster.2bpp.vram0.lz"

TilesetLusterGFX1::
INCBIN "gfx/tilesets/luster.2bpp.vram1.lz"

TilesetLusterGFX2::
INCBIN "gfx/tilesets/luster.2bpp.vram2.lz"

TilesetLusterMeta::
INCBIN "data/tilesets/luster_metatiles.bin.lz"

TilesetLusterAttr::
INCBIN "data/tilesets/luster_attributes.bin.lz"

TilesetLusterColl::
INCLUDE "data/tilesets/luster_collision.asm"


SECTION "Tileset Data - snow", ROMX

TilesetSnowGFX0::
INCBIN "gfx/tilesets/snow.2bpp.vram0.lz"

TilesetSnowGFX1::
INCBIN "gfx/tilesets/snow.2bpp.vram1.lz"

DEF TilesetSnowGFX2 EQU 0

TilesetSnowMeta::
INCBIN "data/tilesets/snow_metatiles.bin.lz"

TilesetSnowAttr::
INCBIN "data/tilesets/snow_attributes.bin.lz"

TilesetSnowColl::
INCLUDE "data/tilesets/snow_collision.asm"


SECTION "Tileset Data - park", ROMX

TilesetParkGFX0::
INCBIN "gfx/tilesets/park.2bpp.vram0.lz"

TilesetParkGFX1::
INCBIN "gfx/tilesets/park.2bpp.vram1.lz"

TilesetParkGFX2::
INCBIN "gfx/tilesets/park.2bpp.vram2.lz"

TilesetParkMeta::
INCBIN "data/tilesets/park_metatiles.bin.lz"

TilesetParkAttr::
INCBIN "data/tilesets/park_attributes.bin.lz"

TilesetParkColl::
INCLUDE "data/tilesets/park_collision.asm"


SECTION "Tileset Data - mall1", ROMX

TilesetMall1GFX0::
INCBIN "gfx/tilesets/mall1.2bpp.vram0.lz"

TilesetMall1GFX1::
INCBIN "gfx/tilesets/mall1.2bpp.vram1.lz"

TilesetMall1GFX2::
INCBIN "gfx/tilesets/mall1.2bpp.vram2.lz"

TilesetMall1Meta::
INCBIN "data/tilesets/mall1_metatiles.bin.lz"

TilesetMall1Attr::
INCBIN "data/tilesets/mall1_attributes.bin.lz"

TilesetMall1Coll::
INCLUDE "data/tilesets/mall1_collision.asm"


SECTION "Tileset Data - mall2", ROMX

TilesetMall2GFX0::
INCBIN "gfx/tilesets/mall2.2bpp.vram0.lz"

TilesetMall2GFX1::
INCBIN "gfx/tilesets/mall2.2bpp.vram1.lz"

TilesetMall2GFX2::
INCBIN "gfx/tilesets/mall2.2bpp.vram2.lz"

TilesetMall2Meta::
INCBIN "data/tilesets/mall2_metatiles.bin.lz"

TilesetMall2Attr::
INCBIN "data/tilesets/mall2_attributes.bin.lz"

TilesetMall2Coll::
INCLUDE "data/tilesets/mall2_collision.asm"


SECTION "Tileset Data - sewer", ROMX

TilesetSewerGFX0::
INCBIN "gfx/tilesets/sewer.2bpp.vram0.lz"

TilesetSewerGFX1::
INCBIN "gfx/tilesets/sewer.2bpp.vram1.lz"

DEF TilesetSewerGFX2 EQU 0

TilesetSewerMeta::
INCBIN "data/tilesets/sewer_metatiles.bin.lz"

TilesetSewerAttr::
INCBIN "data/tilesets/sewer_attributes.bin.lz"

TilesetSewerColl::
INCLUDE "data/tilesets/sewer_collision.asm"


SECTION "Tileset Data - train", ROMX

TilesetTrainGFX0::
INCBIN "gfx/tilesets/train.2bpp.vram0.lz"

TilesetTrainGFX1::
INCBIN "gfx/tilesets/train.2bpp.vram1.lz"

DEF TilesetTrainGFX2 EQU 0

TilesetTrainMeta::
INCBIN "data/tilesets/train_metatiles.bin.lz"

TilesetTrainAttr::
INCBIN "data/tilesets/train_attributes.bin.lz"

TilesetTrainColl::
INCLUDE "data/tilesets/train_collision.asm"


SECTION "Tileset Data - icecave", ROMX

TilesetIceCaveGFX0::
INCBIN "gfx/tilesets/ice_temple.2bpp.vram0.lz"

TilesetIceCaveGFX1::
INCBIN "gfx/tilesets/ice_temple.2bpp.vram1.lz"

TilesetIceCaveGFX2::
INCBIN "gfx/tilesets/ice_temple.2bpp.vram2.lz"

TilesetIceCaveMeta::
INCBIN "data/tilesets/ice_temple_metatiles.bin.lz"

TilesetIceCaveAttr::
INCBIN "data/tilesets/ice_temple_attributes.bin.lz"

TilesetIceCaveColl::
INCLUDE "data/tilesets/ice_temple_collision.asm"


SECTION "Tileset Data - nettbuilding", ROMX

TilesetNettBuildingGFX0::
INCBIN "gfx/tilesets/nett_building.2bpp.vram0.lz"

TilesetNettBuildingGFX1::
INCBIN "gfx/tilesets/nett_building.2bpp.vram1.lz"

TilesetNettBuildingGFX2::
INCBIN "gfx/tilesets/nett_building.2bpp.vram2.lz"

TilesetNettBuildingMeta::
INCBIN "data/tilesets/nett_building_metatiles.bin.lz"

TilesetNettBuildingAttr::
INCBIN "data/tilesets/nett_building_attributes.bin.lz"

TilesetNettBuildingColl::
INCLUDE "data/tilesets/nett_building_collision.asm"

SECTION "Tileset Data - shimmer", ROMX

TilesetShimmerGFX0::
INCBIN "gfx/tilesets/shimmer.2bpp.vram0.lz"

TilesetShimmerGFX1::
INCBIN "gfx/tilesets/shimmer.2bpp.vram1.lz"

TilesetShimmerGFX2::
INCBIN "gfx/tilesets/shimmer.2bpp.vram2.lz"

TilesetShimmerMeta::
INCBIN "data/tilesets/shimmer_metatiles.bin.lz"

TilesetShimmerAttr::
INCBIN "data/tilesets/shimmer_attributes.bin.lz"

TilesetShimmerColl::
INCLUDE "data/tilesets/shimmer_collision.asm"

SECTION "Tileset Data - desert", ROMX

TilesetDesertGFX0::
INCBIN "gfx/tilesets/desert.2bpp.vram0.lz"

TilesetDesertGFX1::
INCBIN "gfx/tilesets/desert.2bpp.vram1.lz"

TilesetDesertGFX2::
INCBIN "gfx/tilesets/desert.2bpp.vram2.lz"

TilesetDesertMeta::
INCBIN "data/tilesets/desert_metatiles.bin.lz"

TilesetDesertAttr::
INCBIN "data/tilesets/desert_attributes.bin.lz"

TilesetDesertColl::
INCLUDE "data/tilesets/desert_collision.asm"

SECTION "Tileset Data - airport", ROMX

TilesetAirportGFX0::
INCBIN "gfx/tilesets/airport.2bpp.vram0.lz"

TilesetAirportGFX1::
INCBIN "gfx/tilesets/airport.2bpp.vram1.lz"

TilesetAirportGFX2::
INCBIN "gfx/tilesets/airport.2bpp.vram2.lz"

TilesetAirportMeta::
INCBIN "data/tilesets/airport_metatiles.bin.lz"

TilesetAirportAttr::
INCBIN "data/tilesets/airport_attributes.bin.lz"

TilesetAirportColl::
INCLUDE "data/tilesets/airport_collision.asm"

SECTION "Tileset Data - orphanage", ROMX

TilesetOrphanageGFX0::
INCBIN "gfx/tilesets/orphanage.2bpp.vram0.lz"

TilesetOrphanageGFX1::
INCBIN "gfx/tilesets/orphanage.2bpp.vram1.lz"

TilesetOrphanageGFX2::
INCBIN "gfx/tilesets/orphanage.2bpp.vram2.lz"

TilesetOrphanageMeta::
INCBIN "data/tilesets/orphanage_metatiles.bin.lz"

TilesetOrphanageAttr::
INCBIN "data/tilesets/orphanage_attributes.bin.lz"

TilesetOrphanageColl::
INCLUDE "data/tilesets/orphanage_collision.asm"

SECTION "Tileset Data - highway", ROMX

TilesetHighwayGFX0::
INCBIN "gfx/tilesets/highway.2bpp.vram0.lz"

TilesetHighwayGFX1::
INCBIN "gfx/tilesets/highway.2bpp.vram1.lz"

TilesetHighwayGFX2::
INCBIN "gfx/tilesets/highway.2bpp.vram2.lz"

TilesetHighwayMeta::
INCBIN "data/tilesets/highway_metatiles.bin.lz"

TilesetHighwayAttr::
INCBIN "data/tilesets/highway_attributes.bin.lz"

TilesetHighwayColl::
INCLUDE "data/tilesets/highway_collision.asm"

SECTION "Tileset Data - highway2", ROMX

TilesetHighway2GFX0::
INCBIN "gfx/tilesets/highway2.2bpp.vram0.lz"

TilesetHighway2GFX1::
INCBIN "gfx/tilesets/highway2.2bpp.vram1.lz"

TilesetHighway2GFX2::
INCBIN "gfx/tilesets/highway2.2bpp.vram2.lz"

TilesetHighway2Meta::
INCBIN "data/tilesets/highway2_metatiles.bin.lz"

TilesetHighway2Attr::
INCBIN "data/tilesets/highway2_attributes.bin.lz"

TilesetHighway2Coll::
INCLUDE "data/tilesets/highway2_collision.asm"

SECTION "Tileset Data - dive", ROMX

TilesetDiveGFX0::
INCBIN "gfx/tilesets/dive.2bpp.vram0.lz"

TilesetDiveGFX1::
INCBIN "gfx/tilesets/dive.2bpp.vram1.lz"

TilesetDiveGFX2::
INCBIN "gfx/tilesets/dive.2bpp.vram2.lz"

TilesetDiveMeta::
INCBIN "data/tilesets/dive_metatiles.bin.lz"

TilesetDiveAttr::
INCBIN "data/tilesets/dive_attributes.bin.lz"

TilesetDiveColl::
INCLUDE "data/tilesets/dive_collision.asm"

SECTION "Tileset Data - bar", ROMX

TilesetBarGFX0::
INCBIN "gfx/tilesets/bar.2bpp.lz"

DEF TilesetBarGFX1 EQU 0

DEF TilesetBarGFX2 EQU 0

TilesetBarMeta::
INCBIN "data/tilesets/bar_metatiles.bin.lz"

TilesetBarAttr::
INCBIN "data/tilesets/bar_attributes.bin.lz"

TilesetBarColl::
INCLUDE "data/tilesets/bar_collision.asm"

SECTION "Tileset Data - autumn", ROMX

TilesetAutumnGFX0::
INCBIN "gfx/tilesets/autumn.2bpp.vram0.lz"

TilesetAutumnGFX1::
INCBIN "gfx/tilesets/autumn.2bpp.vram1.lz"

TilesetAutumnGFX2::
INCBIN "gfx/tilesets/autumn.2bpp.vram2.lz"

TilesetAutumnMeta::
INCBIN "data/tilesets/autumn_metatiles.bin.lz"

TilesetAutumnAttr::
INCBIN "data/tilesets/autumn_attributes.bin.lz"

TilesetAutumnColl::
INCLUDE "data/tilesets/autumn_collision.asm"

SECTION "Tileset Data - south towns", ROMX

TilesetSouthTownsGFX0::
INCBIN "gfx/tilesets/south_towns.2bpp.vram0.lz"

TilesetSouthTownsGFX1::
INCBIN "gfx/tilesets/south_towns.2bpp.vram1.lz"

TilesetSouthTownsGFX2::
INCBIN "gfx/tilesets/south_towns.2bpp.vram2.lz"

TilesetSouthTownsMeta::
INCBIN "data/tilesets/south_towns_metatiles.bin.lz"

TilesetSouthTownsAttr::
INCBIN "data/tilesets/south_towns_attributes.bin.lz"

TilesetSouthTownsColl::
INCLUDE "data/tilesets/south_towns_collision.asm"

SECTION "Tileset Data - green cave", ROMX

TilesetGreenCaveGFX0::
INCBIN "gfx/tilesets/green_cave.2bpp.vram0.lz"

TilesetGreenCaveGFX1::
INCBIN "gfx/tilesets/green_cave.2bpp.vram1.lz"

TilesetGreenCaveGFX2::
INCBIN "gfx/tilesets/green_cave.2bpp.vram2.lz"

TilesetGreenCaveMeta::
INCBIN "data/tilesets/green_cave_metatiles.bin.lz"

TilesetGreenCaveAttr::
INCBIN "data/tilesets/green_cave_attributes.bin.lz"

TilesetGreenCaveColl::
INCLUDE "data/tilesets/green_cave_collision.asm"

SECTION "Tileset Data - south buildings", ROMX

TilesetSouthBuildingsGFX0::
INCBIN "gfx/tilesets/south_buildings.2bpp.vram0.lz"

TilesetSouthBuildingsGFX1::
INCBIN "gfx/tilesets/south_buildings.2bpp.vram1.lz"

TilesetSouthBuildingsGFX2::
INCBIN "gfx/tilesets/south_buildings.2bpp.vram2.lz"

TilesetSouthBuildingsMeta::
INCBIN "data/tilesets/south_buildings_metatiles.bin.lz"

TilesetSouthBuildingsAttr::
INCBIN "data/tilesets/south_buildings_attributes.bin.lz"

TilesetSouthBuildingsColl::
INCLUDE "data/tilesets/south_buildings_collision.asm"

SECTION "Tileset Headers", ROMX

macro tileset
	dba \1GFX0
	dw \1GFX1, \1GFX2
	dba \1Meta, \1Coll, \1Attr
	dw \1Anim
endm

Tilesets::
	tileset TilesetPlayerRoom
	tileset TilesetPlayerHouse
	tileset TilesetSunset
	tileset TilesetGlint
	tileset TilesetStarglow
	tileset TilesetHouse1
	tileset TilesetHouse2
	tileset TilesetPokeCenter
	tileset TilesetMart
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
	tileset TilesetIceCave
	tileset TilesetNettBuilding
	tileset TilesetShimmer
	tileset TilesetDesert
	tileset TilesetAirport
	tileset TilesetOrphanage
	tileset TilesetHighway
	tileset TilesetHighway2
	tileset TilesetDive
	tileset TilesetBar
	tileset TilesetAutumn
	tileset TilesetSouthTowns
	tileset TilesetGreenCave
	tileset TilesetSouthBuildings
	tileset TilesetLavaCave
