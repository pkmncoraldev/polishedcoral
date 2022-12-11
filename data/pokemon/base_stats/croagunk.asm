	db  48,  61,  40,  50,  61,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FIGHTING
	db 140 ; catch rate
	db 83 ; base exp
	db BLACK_SLUDGE ; item 1
	db BLACK_SLUDGE ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db ANTICIPATION ; ability 1
	db DRY_SKIN ; ability 2
	db POISON_TOUCH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, CUT, ICE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT
	; end
