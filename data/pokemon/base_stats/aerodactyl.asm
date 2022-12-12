	db  80, 105,  65, 130,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING
	db 45 ; catch rate
	db 202 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 6 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db ROCK_HEAD ; ability 1
	db PRESSURE ; ability 2
	db UNNERVE ; hidden ability
	db SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, CUT, RAIN_DANCE, FLY, ROOST, CURSE, SUNNY_DAY, STEEL_WING, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, FIRE_BLAST
	; end
