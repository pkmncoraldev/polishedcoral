	db  39,  52,  43,  65,  60,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 45 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db BLAZE ; ability 1
	db BLAZE ; ability 2
	db SOLAR_POWER ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, CUT, FALSE_SWIPE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, WILL_O_WISP, SUBSTITUTE, PROTECT, FIRE_BLAST
	; end
