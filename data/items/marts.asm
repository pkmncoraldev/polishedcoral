Marts: ; 160a9
	dw SunsetMart
	dw GlintMart
	dw StarglowMart
	dw Route5GateMart
	dw LakeOnwaMart
	dw SunbeamMart
	dw EventideMart
	dw FlickerMart
	dw TwinkleMart
	dw LusterMart
	dw LusterMallElectronics
	dw LusterMallElectronics2
	dw LusterMallElectronics3
	dw LusterMallElectronics4
	dw LusterMallElectronicsTM
	dw LusterMallCoffee
	dw LusterMallCoffee2
	dw LusterMallAntique
	dw LusterMallHerb
	dw LusterMallStone
	dw LusterMallStone2
	dw LusterMallClothes
	dw LusterMallBall1
	dw LusterMallBall2
	dw LusterMallBall3
	dw LusterMallBall4
	dw ShimmerFishMarket
	dw ShimmerBerryMarket
	dw ShimmerMart
	dw BrilloMart
	dw BrilloMart
	dw CoinsMart
	dw RadiantMart
	dw DuskMart
	dw KomoreMart
	dw ObscuraMart
	dw LusterMallElectronicsDeco
	dw LusterMallFurniture
	dw MooMoos1
	dw MooMoos2
	dw ShimmerCafe
	dw PollenMart
	dw OttoMart
	dw HealerMart
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
	db 7 ; # items
	db POKE_BALL
	db POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db -1
	
Route5GateMart: ; 160fa
	db 5
	dbw BERRY_JUICE,   800
	dbw FRESH_WATER,   700
	dbw SODA_POP,      800
	dbw LEMONADE,      900
	dbw RAGECANDYBAR,  800
	db -1

LakeOnwaMart:
	db 9 ; # items
	db POKE_BALL
	db POTION
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db BURN_HEAL
	db -1

SunbeamMart: ; 16106
	db 10 ; # items
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
	db -1

EventideMart: ; 16118
	db 12 ; # items
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
	db -1
	
FlickerMart:
	db 12 ; # items
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
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db ESCAPE_ROPE
	db REPEL
	db SUPER_REPEL
	db ANTIDOTE
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
LusterMallElectronics:
	db 5 ; # items
	db UP_GRADE
	db LINK_CABLE
	db WIDE_LENS
	db ZOOM_LENS
	db LIGHT_BALL
	db -1
	
LusterMallElectronics2:
	db 6 ; # items
	db UP_GRADE
	db LINK_CABLE
	db WIDE_LENS
	db ZOOM_LENS
	db LIGHT_BALL
	db ELECTIRIZER
	db -1
	
LusterMallElectronics3:
	db 6 ; # items
	db UP_GRADE
	db LINK_CABLE
	db WIDE_LENS
	db ZOOM_LENS
	db LIGHT_BALL
	db MAGMARIZER
	db -1
	
LusterMallElectronics4:
	db 7 ; # items
	db UP_GRADE
	db LINK_CABLE
	db WIDE_LENS
	db ZOOM_LENS
	db LIGHT_BALL
	db ELECTIRIZER
	db MAGMARIZER
	db -1
	
LusterMallElectronicsTM:
	db 13 ; # items
	dbw TM_SAFEGUARD, 		6000
	dbw TM_SUBSTITUTE, 		6000
	dbw TM_PROTECT, 		6000
	dbw TM_LIGHT_SCREEN, 	8000
	dbw TM_REFLECT,		 	8000
	dbw TM_REST,		 	8000
	dbw TM_TOXIC,		 	8000
	dbw TM_SOLAR_BEAM, 		12000
	dbw TM_THUNDERPUNCH, 	12000
	dbw TM_FIRE_PUNCH, 		12000
	dbw TM_ICE_PUNCH,	 	12000
	dbw TM_HYPER_BEAM, 		14000
	dbw TM_GIGA_IMPACT,		14000
	db -1
	
LusterMallElectronicsDeco:
	db 2 ; # items
	dbw POTION, 		5
	dbw POKE_BALL, 		10
	db -1
	
LusterMallFurniture:
	db 3 ; # items
	dbw FEATHERY_BED_BUY, 	5000
	dbw YELLOW_CARPET_BUY, 	5000
	dbw MAGNAPLANT_BUY, 	5000
	db -1
	
LusterMallCoffee:
	db 5 ; # items
	db FRESH_WATER
	db BERRY_JUICE
	db SODA_POP
	db RAGECANDYBAR
	db BIG_MALASADA
	db SWEET_HONEY
	db -1
	
LusterMallCoffee2:
	db 6 ; # items
	db BLOSSOM_TEA
	db FRESH_WATER
	db BERRY_JUICE
	db SODA_POP
	db RAGECANDYBAR
	db BIG_MALASADA
	db SWEET_HONEY
	db -1
	
LusterMallAntique:
	db 8 ; # items
	db KINGS_ROCK
	db DRAGON_SCALE
	db METAL_COAT
	db RAZOR_CLAW
	db RAZOR_FANG
	db PAINTBRUSH
	db FOCUS_BAND
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
	db 9 ; # items
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db DUSK_STONE
	db DAWN_STONE
	db EVERSTONE
	db -1
	
LusterMallStone2:
	db 10 ; # items
	db LEAF_STONE
	db FIRE_STONE
	db WATER_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db DUSK_STONE
	db DAWN_STONE
	db SHINY_STONE
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
	
LusterMallBall1:
	db 10
	dbw POKE_BALL,     400
	dbw GREAT_BALL,    800
	dbw ULTRA_BALL,   1000
	dbw LEVEL_BALL,    800
	dbw LURE_BALL,     800
	dbw MOON_BALL,     800
	dbw FRIEND_BALL,   800
	dbw FAST_BALL,     800
	dbw HEAVY_BALL,    800
	dbw LOVE_BALL,     800
	db -1
	
LusterMallBall2:
	db 10
	dbw POKE_BALL,     150
	dbw GREAT_BALL,    400
	dbw ULTRA_BALL,    500
	dbw LEVEL_BALL,    400
	dbw LURE_BALL,     400
	dbw MOON_BALL,     400
	dbw FRIEND_BALL,   400
	dbw FAST_BALL,     400
	dbw HEAVY_BALL,    400
	dbw LOVE_BALL,     400
	db -1
	
LusterMallBall3:
	db 9
	dbw HEAL_BALL,     500
	dbw REPEAT_BALL,  1000
	dbw TIMER_BALL,   1000
	dbw NEST_BALL,	  1000
	dbw NET_BALL,	  1000
	dbw DIVE_BALL,	  1000
	dbw LUXURY_BALL,  1000
	dbw QUICK_BALL,	  1000
	dbw DUSK_BALL,    1000
	db -1
	
LusterMallBall4:
	db 9
	dbw HEAL_BALL,     250
	dbw REPEAT_BALL,   750
	dbw TIMER_BALL,    750
	dbw NEST_BALL,	   750
	dbw NET_BALL,	   750
	dbw DIVE_BALL,	   750
	dbw LUXURY_BALL,   750
	dbw QUICK_BALL,	   750
	dbw DUSK_BALL,     750
	db -1
	
ShimmerFishMarket:
	db 5 ; # items
	dbw MAGIKARP, 	500
	dbw CHINCHOU, 	3000
	dbw HORSEA, 	5000
	dbw CARVANHA, 	5000
	dbw STARYU, 	3000
	db -1
	
ShimmerBerryMarket:
	db 8 ; # items
	dbw ORAN_BERRY, 200
	dbw SITRUS_BERRY, 600
	dbw CHERI_BERRY, 600
	dbw CHESTO_BERRY, 500
	dbw PECHA_BERRY, 500
	dbw RAWST_BERRY, 500
	dbw ASPEAR_BERRY, 500
	dbw PERSIM_BERRY, 700
	db -1
	
ShimmerMart:
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ESCAPE_ROPE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db -1
	
BrilloMart:
	db 14 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db ESCAPE_ROPE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
CoinsMart:
	db 16 ; # items
	dbw ABILITY_CAP,  2000
	dbw THICK_CLUB,  1500
	dbw LUCKY_PUNCH,  500
	dbw MACHO_BRACE, 500
	dbw TOXIC_ORB, 1000
	dbw FLAME_ORB, 1000
	dbw CHOICE_BAND, 1000
	dbw CHOICE_SCARF, 1000
	dbw CHOICE_SPECS, 1000
	dbw RARE_CANDY,  750
	dbw HP_UP,  200
	dbw PROTEIN,  200
	dbw IRON,  200
	dbw CARBOS,  200
	dbw CALCIUM,  200
	dbw ZINC,  200
	db -1
	
RadiantMart:
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
DuskMart:
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db REVIVE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
KomoreMart:
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db REVIVE
	db ESCAPE_ROPE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
ObscuraMart:
	db 14 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db REVIVE
	db ESCAPE_ROPE
	db SUPER_REPEL
	db MAX_REPEL
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db X_SPEED
	db X_SPCL_ATK
	db X_SPCL_DEF
	db -1
	
MooMoos1:
	db 4 ; # items
	db MOOMOO_MILK
	db FRESH_WATER
	db BERRY_JUICE
	db SODA_POP
	db -1
	
MooMoos2:
	db 5 ; # items
	db MOOMOO_BREW
	db MOOMOO_MILK
	db FRESH_WATER
	db BERRY_JUICE
	db SODA_POP
	db -1
	
ShimmerCafe:
	db 4 ; # items
	db BERRY_JUICE
	db FRESH_WATER 
	db SODA_POP
	db RAGECANDYBAR
	db -1
	
PollenMart:
	db 7 ; # items
	dbw NUGGET,				 500
	dbw SUNSHINE_TEA,		 100
	dbw CHLOROPHIAL,		  75
	dbw BLOSSOM_TEA,		  50
	dbw SWEET_HONEY,		  40
	dbw BERRY_JUICE,		  30
	dbw BOTTLE_CAP,			  25
	db -1
	
OttoMart:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1
	
HealerMart:
	db 7 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db MENTAL_HERB
	db POWER_HERB
	db WHITE_HERB
	db -1
