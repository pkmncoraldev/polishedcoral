	db  90,  92,  87,  76,  75,  85
	;   hp  atk  def  spd  sat  sdf

	db POISON, GROUND
	db 45 ; catch rate
	db 194 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn ALL_FEMALE, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db POISON_POINT ; ability 1
	db RIVALRY ; ability 2
	db SHEER_FORCE ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, FIELD ; egg groups

	; ev_yield
	ev_yield   3,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SURF, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD, FIRE_BLAST
	; end
