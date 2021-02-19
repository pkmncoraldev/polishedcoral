Marts: ; 160a9
	dw SunsetMart
	dw GlintMart
	dw StarglowMart
	dw SunbeamMart
	dw EventideMart
	dw FlickerMart
	dw TwinkleMart
	dw LusterMart
	dw LusterMallElectronics
	dw LusterMallCoffee
MartsEnd


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
	
FlickerMart: ; 16118
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
	
TwinkleMart: ; 16118
	db 1 ; # items
	db POTION
	db -1
	
LusterMart: ; 16118
	db 1 ; # items
	db POTION
	db -1
	
LusterMallElectronics: ; 16118
	db 1 ; # items
	db POTION
	db -1
	
LusterMallCoffee: ; 16118
	db 1 ; # items
	db POTION
	db -1
