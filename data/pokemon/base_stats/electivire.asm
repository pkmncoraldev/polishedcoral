	db  75, 123,  67,  95,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC
	db 30 ; catch rate
	db 199 ; base exp
	db SITRUS_BERRY ; item 1
	db SITRUS_BERRY ; item 2
	dn FEMALE_25, 4 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db MOTOR_DRIVE ; ability 1
	db MOTOR_DRIVE ; ability 2
	db VITAL_SPIRIT ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   3,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, THUNDER
	; end
