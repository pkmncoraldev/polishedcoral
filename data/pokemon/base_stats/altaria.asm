	db  75,  70,  90,  80,  70, 105
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING
	db 45 ; catch rate
	db 188 ; base exp
	db DRAGON_FANG ; item 1
	db DRAGON_FANG ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db NATURAL_CURE ; ability 1
	db NATURAL_CURE ; ability 2
	db CLOUD_NINE ; hidden ability
	db FAST ; growth rate
	dn AVIAN, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, RAIN_DANCE, ROOST, FLY, CHARM, CURSE, SUNNY_DAY, STEEL_WING, BULLDOZE, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM, FIRE_BLAST
	; end
