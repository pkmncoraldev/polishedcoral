	db  50,  64,  50,  41,  45,  50
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 45 ; catch rate
	db 67 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 7 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db GUTS ; ability 1
	db GUTS ; ability 2
	db SAND_VEIL ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, SUBSTITUTE, PROTECT
	; end
