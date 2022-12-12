	db 105, 105,  75,  50,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, DARK
	db 75 ; catch rate
	db 157 ; base exp
	db NO_ITEM ; item 1
	db NUGGET ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db STENCH ; ability 1
	db STICKY_HOLD ; ability 2
	db POISON_TOUCH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   1,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, FAKE_OUT, CUT, DIG, CURSE, SUNNY_DAY, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, FIRE_BLAST
	; end
