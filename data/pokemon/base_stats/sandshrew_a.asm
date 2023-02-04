	db  50,  75,  90,  40,  10,  35
	;   hp  atk  def  spd  sat  sdf

	db ICE, STEEL
	db 255 ; catch rate
	db 93 ; base exp
	db NO_ITEM ; item 1
	db QUICK_CLAW ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SNOW_CLOAK ; ability 1
	db SNOW_CLOAK ; ability 2
	db SLUSH_RUSH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT
	; end
