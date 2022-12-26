	db  75,  95,  67,  83, 125,  95
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 30 ; catch rate
	db 199 ; base exp
	db ASPEAR_BERRY ; item 1
	db ASPEAR_BERRY ; item 2
	dn FEMALE_25, 4 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db FLAME_BODY ; ability 1
	db FLAME_BODY ; ability 2
	db VITAL_SPIRIT ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   3,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FIRE_PUNCH, THUNDERPUNCH, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM, FIRE_BLAST
	; end
