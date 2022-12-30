	db  60,  82,  45,  74,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, DARK
	db 90 ; catch rate
	db 123 ; base exp
	db BLACKGLASSES ; item 1
	db BLACKGLASSES ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db INTIMIDATE ; ability 1
	db MOXIE ; ability 2
	db ANGER_POINT ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, DIG, CURSE, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT
	; end
