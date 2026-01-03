	db  30,  30,  30,  30,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 235 ; catch rate
	db 52 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CHLOROPHYLL ; ability 1
	db SOLAR_POWER ; ability 2
	db EARLY_BIRD ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn PLANT, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm SLUDGE_BOMB, DRAGONBREATH, ENERGY_BALL, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, TOXIC, FAKE_OUT, BULLDOZE, CUT, CHARM, SUNNY_DAY, CURSE, SAFEGUARD, SUBSTITUTE, PROTECT, REFLECT, LIGHT_SCREEN, SOLAR_BEAM, SAND_ATTACK_SMOKESCREEN_FLASH, GIGA_DRAIN, WEATHER_BALL
	; end
