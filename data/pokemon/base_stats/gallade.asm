	db  68, 125,  65,  80,  65, 115
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FIGHTING
	db 45 ; catch rate
	db 233 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn ALL_MALE, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db STEADFAST ; ability 1
	db JUSTIFIED ; ability 2
	db INNER_FOCUS ; hidden ability
	db SLOW ; growth rate
	dn HUMANSHAPE, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   3,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, CUT, FALSE_SWIPE, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT
	; end
