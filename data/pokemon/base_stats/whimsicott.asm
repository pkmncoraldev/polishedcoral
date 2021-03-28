	db  60,  67,  85, 116,  77,  75
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FAIRY
	db 75 ; catch rate
	db 168 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db PRANKSTER ; ability 1
	db INFILTRATOR ; ability 2
	db CHLOROPHYLL ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn PLANT, FAERY ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT
	; end
