	db  60,  90,  55, 100,  90,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 75 ; catch rate
	db 122 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDERLESS, 1 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db NO_ABILITY ; ability 1
	db NO_ABILITY ; ability 2
	db NO_ABILITY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FAERY ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   3,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, THUNDER
	; end
