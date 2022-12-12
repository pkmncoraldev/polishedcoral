	db 250,  05,  05,  50,  35, 105
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 30 ; catch rate
	db 255 ; base exp
	db NO_ITEM ; item 1
	db LUCKY_EGG ; item 2
	dn ALL_FEMALE, 7 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db NATURAL_CURE ; ability 1
	db SERENE_GRACE ; ability 2
	db NATURAL_CURE ; hidden ability
	db FAST ; growth rate
	dn FAERY, FAERY ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, RAIN_DANCE, CHARM, HAIL, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, THUNDER, BLIZZARD, SOLAR_BEAM, FIRE_BLAST
	; end
