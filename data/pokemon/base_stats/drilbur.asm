	db  60,  85,  40,  68,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 120 ; catch rate
	db 66 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SAND_RUSH ; ability 1
	db SAND_FORCE ; ability 2
	db MOLD_BREAKER ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, DIG, CURSE, ROCK_CLIMB, SUBSTITUTE, PROTECT
	; end
