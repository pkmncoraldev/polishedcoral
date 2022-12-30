	db  45,  63,  37,  95,  65,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 90 ; catch rate
	db 106 ; base exp
	db SITRUS_BERRY ; item 1
	db ELECTIRIZER ; item 2
	dn FEMALE_25, 4 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db STATIC ; ability 1
	db STATIC ; ability 2
	db VITAL_SPIRIT ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CURSE, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, THUNDER
	; end
