	db  60, 100,  89, 112,  55,  69
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 45 ; catch rate
	db 218 ; base exp
	db POISON_BARB ; item 1
	db POISON_BARB ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db POISON_POINT ; ability 1
	db SWARM ; ability 2
	db SPEED_BOOST ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   3
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, CUT, FALSE_SWIPE, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM
	; end
