	db 160, 110,  65,  30,  65, 110
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 25 ; catch rate
	db 154 ; base exp
	db LEFTOVERS ; item 1
	db LEFTOVERS ; item 2
	dn FEMALE_12_5, 7 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db IMMUNITY ; ability 1
	db THICK_FAT ; ability 2
	db GLUTTONY ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SURF, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD, SOLAR_BEAM, FIRE_BLAST
	; end
