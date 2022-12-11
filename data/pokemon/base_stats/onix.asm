	db  35,  45, 160,  70,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 45 ; catch rate
	db 108 ; base exp
	db NO_ITEM ; item 1
	db HARD_STONE ; item 2
	dn FEMALE_50, 4 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db ROCK_HEAD ; ability 1
	db STURDY ; ability 2
	db WEAK_ARMOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT
	; end
