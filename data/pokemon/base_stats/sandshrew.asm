	db  50,  75,  85,  40,  20,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 255 ; catch rate
	db 93 ; base exp
	db NO_ITEM ; item 1
	db QUICK_CLAW ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SAND_VEIL ; ability 1
	db SAND_VEIL ; ability 2
	db SAND_RUSH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT
	; end
