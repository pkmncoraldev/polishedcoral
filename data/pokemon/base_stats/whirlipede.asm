	db  40,  55,  99,  47,  40,  79
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 120 ; catch rate
	db 126 ; base exp
	db POISON_BARB ; item 1
	db POISON_BARB ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db POISON_POINT ; ability 1
	db SWARM ; ability 2
	db SPEED_BOOST ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CUT, FALSE_SWIPE, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, SOLAR_BEAM
	; end
