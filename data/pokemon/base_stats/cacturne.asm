	db  70, 115, 60,  55,  115, 60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, DARK
	db 60 ; catch rate
	db 177 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SAND_VEIL ; ability 1
	db SAND_VEIL ; ability 2
	db WATER_ABSORB ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn PLANT, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CUT, FAKE_OUT, SUNNY_DAY, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM
	; end
