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
	dw LusterMallElectronics
	dw LusterMallCoffee
	dw LusterMallAntique
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
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
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
	db 10 ; # items
	db POKE_BALL
	db GREAT_BALL
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
	db 1 ; # items
	db POTION
	db -1
	
LusterMart:
	db 1 ; # items
	db POTION
	db -1
	
LusterMallElectronics:
	db 1 ; # items
	db POTION
	db -1
	
LusterMallCoffee:
	db 1 ; # items
	db POTION
	db -1
	
LusterMallAntique:
	db 1 ; # items
	db POTION
	db -1
