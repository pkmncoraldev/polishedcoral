; permissions
	const_def 1
	const TOWN
	const ROUTE
	const INDOOR
	const CAVE
	const PERM_5
	const GATE
	const DUNGEON
	const FOREST

	const_def
	const PALETTE_AUTO
	const PALETTE_DAY
	const PALETTE_NITE
	const PALETTE_MORN
	const PALETTE_DARK

	const_def
	const FISHGROUP_NONE
	const FISHGROUP_DAYBREAK
	const FISHGROUP_GLINT
	const FISHGROUP_STARGLOW
	const FISHGROUP_LAKE
	const FISHGROUP_SUNBEAM
	const FISHGROUP_CAVE
	const FISHGROUP_JUNGLE
	const FISHGROUP_GROVE
	const FISHGROUP_ROUTE_3_POND

	const_def
	const EAST_F
	const WEST_F
	const SOUTH_F
	const NORTH_F

	const_def
	shift_const EAST
	shift_const WEST
	shift_const SOUTH
	shift_const NORTH


; Overcast indexes
	const_def
	const NOT_OVERCAST
	const AZALEA_OVERCAST
	const LAKE_OF_RAGE_OVERCAST
	const STORMY_BEACH_OVERCAST


; see engine/spawn_points.asm:SpawnPoints
const_value = -1
	const SPAWN_N_A

	const SPAWN_HOME

	const SPAWN_SUNSET
	const SPAWN_DAYBREAK
	const SPAWN_GLINT
	const SPAWN_STARGLOW
	const SPAWN_LAKE
	const SPAWN_SUNBEAM
	const SPAWN_EVENTIDE
	const SPAWN_FLICKER
	const SPAWN_TWINKLE
	const SPAWN_LUSTER
	const SPAWN_SHIMMER
	const SPAWN_LASTFLYPOINT
	const SPAWN_KANTO
NUM_SPAWNS EQU const_value
