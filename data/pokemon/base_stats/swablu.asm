	db  45,  40,  60,  50,  40,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 255 ; catch rate
	db 74 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db NATURAL_CURE ; ability 1
	db NATURAL_CURE ; ability 2
	db CLOUD_NINE ; hidden ability
	db FAST ; growth rate
	dn AVIAN, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, STEEL_WING, SAFEGUARD, SUBSTITUTE, PROTECT, SOLAR_BEAM
	; end
