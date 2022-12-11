	db  70,  84,  70,  51,  65,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND
	db 45 ; catch rate
	db 144 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 7 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SHED_SKIN ; ability 1
	db SHED_SKIN ; ability 2
	db SHED_SKIN ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, BULLDOZE, SUBSTITUTE, PROTECT
	; end
