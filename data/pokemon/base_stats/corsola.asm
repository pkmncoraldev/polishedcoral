if DEF(FAITHFUL)
	db  65,  55,  95,  35,  65,  95
	;   hp  atk  def  spd  sat  sdf
else
	db  65,  55, 115,  35, 105, 115
	;   hp  atk  def  spd  sat  sdf
endc

	db WATER, ROCK
	db 60 ; catch rate
if DEF(FAITHFUL)
	db 113 ; base exp
else
	db 128 ; base exp
endc
	db NO_ITEM ; item 1
	db HARD_STONE ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db HUSTLE ; ability 1
	db NATURAL_CURE ; ability 2
	db REGENERATOR ; hidden ability
	db FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CUT, FLY
	; end
