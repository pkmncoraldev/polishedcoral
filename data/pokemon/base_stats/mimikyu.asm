	db  55,  90,  80,  96,  50, 105
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FAIRY
	db 45 ; catch rate
	db 167 ; base exp
	db NO_ITEM ; item 1
	db CHESTO_BERRY ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db DISGUISE_A ; ability 1
	db DISGUISE_A ; ability 2
	db DISGUISE_A ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm 
	; end
