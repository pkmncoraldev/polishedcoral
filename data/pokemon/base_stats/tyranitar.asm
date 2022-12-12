	db 100, 134, 110,  61,  95, 100
	;   hp  atk  def  spd  sat  sdf

	db ROCK, DARK
	db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 7 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SAND_STREAM ; ability 1
	db SAND_STREAM ; ability 2
	db UNNERVE ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   3,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD, FIRE_BLAST
	; end
