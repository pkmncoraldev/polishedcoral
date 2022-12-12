	db  91, 134,  95,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING
	db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	dn FEMALE_50, 7 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db INNER_FOCUS ; ability 2
	db MULTISCALE ; hidden ability
	db SLOW ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   3,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, ROOST, FLY, HAIL, CURSE, SUNNY_DAY, STEEL_WING, BULLDOZE, ROCK_CLIMB, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, THUNDER, BLIZZARD, FIRE_BLAST
	; end
