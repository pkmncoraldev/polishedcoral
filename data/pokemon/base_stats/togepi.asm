	db  35,  20,  65,  20,  40,  65
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 1 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db HUSTLE ; ability 1
	db SERENE_GRACE ; ability 2
	db SUPER_LUCK ; hidden ability
	db FAST ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FALSE_SWIPE, RAIN_DANCE, ROOST, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM, FIRE_BLAST
	; end
