	db  60,  48,  45,  42,  43,  90
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, PSYCHIC
	db 190 ; catch rate
	db 102 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db INSOMNIA ; ability 1
	db FOREWARN ; ability 2
	db INNER_FOCUS ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FALSE_SWIPE, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB
	; end
