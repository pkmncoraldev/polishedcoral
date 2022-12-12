	db  55,  95, 115,  35,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 120 ; catch rate
	db 134 ; base exp
	db NO_ITEM ; item 1
	db EVERSTONE ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db ROCK_HEAD ; ability 1
	db STURDY ; ability 2
	db SAND_VEIL ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FIRE_PUNCH, THUNDERPUNCH, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, FIRE_BLAST
	; end
