	db  80,  80,  50,  25,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 190 ; catch rate
	db 90 ; base exp
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db POISON_TOUCH ; ability 1
	db GLUTTONY ; ability 2
	db POISON_TOUCH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, CUT, DIG, CURSE, SUNNY_DAY, SUBSTITUTE, PROTECT, THUNDER, FIRE_BLAST
	; end
