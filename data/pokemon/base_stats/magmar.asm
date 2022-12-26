	db  65,  95,  57,  93, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 167 ; base exp
	db ASPEAR_BERRY ; item 1
	db MAGMARIZER ; item 2
	dn FEMALE_25, 4 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db FLAME_BODY ; ability 1
	db FLAME_BODY ; ability 2
	db VITAL_SPIRIT ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FIRE_PUNCH, THUNDERPUNCH, CURSE, SUNNY_DAY, ROCK_CLIMB, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, FIRE_BLAST
	; end
