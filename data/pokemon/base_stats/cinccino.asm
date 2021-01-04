	db  75,  90,  60, 115,  65,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 60 ; catch rate
	db 165 ; base exp
	db CHESTO_BERRY ; item 1
	db CHESTO_BERRY ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CUTE_CHARM ; ability 1
	db TECHNICIAN ; ability 2
	db SKILL_LINK ; hidden ability
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm 
	; end
