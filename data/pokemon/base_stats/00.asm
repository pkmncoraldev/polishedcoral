	db 100, 100, 100, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 200 ; catch rate
	db 73 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db NO_ABILITY ; ability 1
	db NO_ABILITY ; ability 2
	db NO_ABILITY ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm 
	; end
