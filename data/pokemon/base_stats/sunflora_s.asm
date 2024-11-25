	db  75,  75,  55,  30, 105,  85
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIRE
	db 120 ; catch rate
	db 250 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db CHLOROPHYLL ; ability 1
	db SOLAR_POWER ; ability 2
	db EARLY_BIRD ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, BULLDOZE, CUT, CHARM, SUNNY_DAY, CURSE, SAFEGUARD, SUBSTITUTE, PROTECT, REFLECT, LIGHT_SCREEN, SOLAR_BEAM, HYPER_BEAM, GIGA_IMPACT, GIGA_DRAIN, SAND_ATTACK_SMOKESCREEN_FLASH, GIGA_DRAIN, DAZZLINGLEAM, WEATHER_BALL
	; end
