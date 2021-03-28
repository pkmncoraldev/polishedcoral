	db  82, 121, 119,  71,  69,  59
	;   hp  atk  def  spd  sat  sdf

	db ROCK, DRAGON
	db 45 ; catch rate
	db 182 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db STRONG_JAW ; ability 1
	db STRONG_JAW ; ability 2
	db STURDY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn MONSTER, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT
	; end
