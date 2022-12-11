	db  50,  70, 100,  30,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db STEEL, ROCK
	db 180 ; catch rate
	db 96 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db STURDY ; ability 1
	db ROCK_HEAD ; ability 2
	db STURDY ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, BULLDOZE, SUBSTITUTE, PROTECT
	; end
