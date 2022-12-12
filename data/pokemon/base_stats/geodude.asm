	db  40,  80, 100,  20,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 255 ; catch rate
	db 86 ; base exp
	db NO_ITEM ; item 1
	db EVERSTONE ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db ROCK_HEAD ; ability 1
	db STURDY ; ability 2
	db SAND_VEIL ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FIRE_PUNCH, THUNDERPUNCH, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, FIRE_BLAST
	; end
