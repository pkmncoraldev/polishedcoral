Marts: ; 160a9
	dw SunsetMart
	dw GlintMart
	dw StarglowMart
	dw SunbeamMart
	dw FlickerMart
MartsEnd
; 160ed


SunsetMart: ; 160ed
	db 5 ; # items
	db BERRY_JUICE
	db FRESH_WATER 
	db ORAN_BERRY
	db PECHA_BERRY
	db CHERI_BERRY
	db -1
; 160f3

GlintMart: ; 160f3
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARALYZEHEAL
	db AWAKENING
	db -1
; 160fa

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
; 16106

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
; 16111

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
; 16121
