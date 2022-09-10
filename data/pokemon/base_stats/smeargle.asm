	db  55,  20,  35,  75,  20,  45
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 106 ; base exp
	db NO_ITEM ; item 1
	db PAINTBRUSH ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db OWN_TEMPO ; ability 1
	db TECHNICIAN ; ability 2
	db MOODY ; hidden ability
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm
	; end
