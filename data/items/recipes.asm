CookableItems:
    dbw THUNDERSTONE, ThunderStoneRecipes
    dbw FIRE_STONE, FireStoneRecipes
	dbw WATER_STONE, WaterStoneRecipes
	dbw LEAF_STONE, -1
	db -1

ThunderStoneRecipes:
	dbw THUNDERSTONE,    MASTER_BALL
	dbw FIRE_STONE,    MASTER_BALL
	dbw WATER_STONE, MASTER_BALL
	db -1
	
FireStoneRecipes:
	dbw THUNDERSTONE,    RAGECANDYBAR
	dbw FIRE_STONE,    RAGECANDYBAR
	dbw WATER_STONE, RAGECANDYBAR
	db -1
	
WaterStoneRecipes:
	dbw THUNDERSTONE,    LUCKY_EGG
	dbw FIRE_STONE,    POTION
	dbw WATER_STONE, LUCKY_EGG
	db -1
