	db  45,  35,  45,  35,  62,  53
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 190 ; catch rate
	db 68 ; base exp
	db NO_ITEM ; item 1
	db MIRACLE_SEED ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CHLOROPHYLL ; ability 1
	db CHLOROPHYLL ; ability 2
	db CHLOROPHYLL ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, SOLAR_BEAM, SAFEGUARD, PROTECT, SUNNY_DAY, SUBSTITUTE, SAND_ATTACK_SMOKESCREEN_FLASH, GIGA_DRAIN, DAZZLINGLEAM, WEATHER_BALL
	; end
