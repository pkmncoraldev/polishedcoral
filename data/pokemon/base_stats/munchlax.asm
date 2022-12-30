	db 135,  85,  40,   5,  40,  85
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 50 ; catch rate
	db 94 ; base exp
	db NO_ITEM ; item 1
	db LEFTOVERS ; item 2
	dn FEMALE_12_5, 7 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db PICKUP ; ability 1
	db THICK_FAT ; ability 2
	db GLUTTONY ; hidden ability
	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SURF, SUBSTITUTE, PROTECT, THUNDER, BLIZZARD, SOLAR_BEAM, FIRE_BLAST
	; end
