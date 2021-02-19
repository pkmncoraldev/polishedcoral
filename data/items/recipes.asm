CookableItems:
	dbw THUNDERSTONE, 0
	dbw FIRE_STONE, 1
	dbw WATER_STONE, 2
	dbw LEAF_STONE, 3
	db -1
	
Recipies:
	db ThunderStoneRecipes
	db FireStoneRecipes
	db WaterStoneRecipes
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
	dbw FIRE_STONE,    LUCKY_EGG
	dbw WATER_STONE, LUCKY_EGG
	db -1
