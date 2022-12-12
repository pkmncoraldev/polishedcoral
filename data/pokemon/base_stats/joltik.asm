	db  50,  47,  50,  65,  57,  50
	;   hp  atk  def  spd  sat  sdf

	db BUG, ELECTRIC
	db 190 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db COMPOUND_EYES ; ability 1
	db UNNERVE ; ability 2
	db SWARM ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CUT, RAIN_DANCE, CURSE, ROCK_CLIMB, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT
	; end
