	db  85, 110,  76,  56,  65,  82
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GRASS
	db 60 ; catch rate
	db 166 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db NATURAL_CURE ; ability 1
	db FRISK ; ability 2
	db HARVEST ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn PLANT, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CUT, FALSE_SWIPE, DIG, CURSE, SUNNY_DAY, BULLDOZE, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM
	; end
