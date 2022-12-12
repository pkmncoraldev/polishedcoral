	db  75,  86,  67,  60, 106,  67
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 255 ; catch rate
	db 161 ; base exp
	db MIRACLE_SEED ; item 1
	db MIRACLE_SEED ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db WATER_ABSORB ; ability 1
	db CHLOROPHYLL ; ability 2
	db STORM_DRAIN ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn PLANT, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, CUT, FALSE_SWIPE, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM
	; end
