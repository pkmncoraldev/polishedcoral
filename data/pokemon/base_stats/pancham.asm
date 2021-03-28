	db  67,  82,  62,  43,  46,  48
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 220 ; catch rate
	db 70 ; base exp
	db NO_ITEM ; item 1
	db MENTAL_HERB ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db IRON_FIST ; ability 1
	db MOLD_BREAKER ; ability 2
	db SCRAPPY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH 
	; end
