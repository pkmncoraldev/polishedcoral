Marts: ; 160a9
	dw SunsetMart
	dw GlintMart
	dw StarglowMart
	dw Route5GateMart
	dw SunbeamMart
	dw EventideMart
	dw FlickerMart
	dw TwinkleMart
	dw LusterMart
	dw LusterMallElectronicsTM
	dw LusterMallElectronics
	dw LusterMallCoffee
	dw LusterMallAntique
	dw LusterMallHerb
	dw LusterMallStone
	dw LusterMallClothes
	dw ShimmerFishMarket
	dw ShimmerBerryMarket
	dw ShimmerMart
	dw BrilloMart
MartsEnd:


SunsetMart: ; 160ed
	db 5 ; # items
	db BERRY_JUICE
	db FRESH_WATER 
	db ORAN_BERRY
	db PECHA_BERRY
	db CHERI_BERRY
	db -1

GlintMart: ; 160f3
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db -1

StarglowMart: ; 160fa
	db 8 ; # items
	db POKE_BALL
	db REPEAT_BALL
	db POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db -1
	
Route5GateMart: ; 160fa
	db 4 ; # items
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db RAGECANDYBAR
	db -1

SunbeamMart: ; 16106
	db 9 ; # items
	db POKE_BALL
	db GREAT_BALL
	db REPEAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db -1

EventideMart: ; 16118
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1
	
FlickerMart:
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1
	
TwinkleMart:
	db 17 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
LusterMart:
	db 17 ; # items
	db POKE_BALL
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
LusterMallElectronics:
	db 4 ; # items
	db UP_GRADE
	db LINK_CABLE
	db ELECTIRIZER
	db MAGMARIZER
	db -1
	
LusterMallElectronicsTM:
	db 11 ; # items
	dbw TM_SAFEGUARD, 		6000
	dbw TM_SUBSTITUTE, 		6000
	dbw TM_PROTECT, 		8000
	dbw TM_LIGHT_SCREEN, 	8000
	dbw TM_REFLECT,		 	8000
	dbw TM_THUNDER, 		12000
	dbw TM_BLIZZARD, 		12000
	dbw TM_FIRE_BLAST, 		12000
	dbw TM_SOLAR_BEAM, 		12000
	dbw TM_HYPER_BEAM, 		14000
	dbw TM_GIGA_IMPACT,		14000
	db -1
	
LusterMallCoffee:
	db 7 ; # items
	db FRESH_WATER
	db BERRY_JUICE
	db SODA_POP
	db LEMONADE
	db MOOMOO_MILK
	db RAGECANDYBAR
	db BIG_MALASADA
	db -1
	
LusterMallAntique:
	db 9 ; # items
	db KINGS_ROCK
	db DRAGON_SCALE
	db METAL_COAT
	db RAZOR_CLAW
	db RAZOR_FANG
	db THICK_CLUB
	db LIGHT_BALL
	db PAINTBRUSH
	db FOCUS_SASH
	db -1
	
LusterMallHerb:
	db 7 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db MENTAL_HERB
	db POWER_HERB
	db WHITE_HERB
	db -1
	
LusterMallStone:
	db 10 ; # items
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db DUSK_STONE
	db SHINY_STONE
	db DAWN_STONE
	db EVERSTONE
	db -1
	
LusterMallClothes:
	db 7 ; # items
	dbw RED_CLOTHES, 	5000
	dbw BLUE_CLOTHES, 	5000
	dbw GREEN_CLOTHES, 	5000
	dbw BROWN_CLOTHES,	5000
	dbw PURPLE_CLOTHES, 5000
	dbw TEAL_CLOTHES, 	5000
	dbw PINK_CLOTHES, 	5000
	db -1
	
ShimmerFishMarket:
	db 4 ; # items
	dbw MAGIKARP, 	200
	dbw CHINCHOU, 	200
	dbw CARVANHA, 	200
	dbw HORSEA, 	200
	db -1
	
ShimmerBerryMarket:
	db 1 ; # items
	db ORAN_BERRY
	db -1
	
ShimmerMart:
	db 1 ; # items
	db POTION
	db -1
	
BrilloMart:
	db 1 ; # items
	db POTION
	db -1
