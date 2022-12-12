	db  55,  40,  85,  40,  80, 105
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FLYING
	db 75 ; catch rate
	db 114 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 1 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db HUSTLE ; ability 1
	db SERENE_GRACE ; ability 2
	db SUPER_LUCK ; hidden ability
	db FAST ; growth rate
	dn AVIAN, FAERY ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FALSE_SWIPE, RAIN_DANCE, ROOST, FLY, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, STEEL_WING, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM, FIRE_BLAST
	; end
