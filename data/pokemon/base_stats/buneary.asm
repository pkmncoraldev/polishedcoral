	db  55,  66,  44,  85,  44,  56
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 190 ; catch rate
	db 84 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db RUN_AWAY ; ability 1
	db RUN_AWAY ; ability 2
	db LIMBER ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, CUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, SUBSTITUTE, PROTECT, SOLAR_BEAM
	; end
