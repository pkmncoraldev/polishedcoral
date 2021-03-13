	db  77,  59,  50,  67,  63,  46
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ICE
	db 45 ; catch rate
	db 72 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db REFRIGERATE ; ability 1
	db REFRIGERATE ; ability 2
	db SNOW_WARNING ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm
	; end
