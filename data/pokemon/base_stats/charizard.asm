	db  78,  84,  78, 100, 109,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING
	db 45 ; catch rate
	db 209 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db BLAZE ; ability 1
	db BLAZE ; ability 2
	db SOLAR_POWER ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   3,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, CUT, FALSE_SWIPE, FIRE_PUNCH, ROOST, FLY, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, STEEL_WING, BULLDOZE, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM, FIRE_BLAST
	; end
