	db  95,  65, 110,  65,  60, 130
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK
	db 45 ; catch rate
	db 197 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 6 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SYNCHRONIZE ; ability 1
	db SYNCHRONIZE ; ability 2
	db INNER_FOCUS ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FALSE_SWIPE, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT
	; end
