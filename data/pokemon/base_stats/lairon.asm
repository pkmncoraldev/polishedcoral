	db  60,  90, 140,  40,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db STEEL, ROCK
	db 90 ; catch rate
	db 152 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db STURDY ; ability 1
	db ROCK_HEAD ; ability 2
	db STURDY ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, BULLDOZE, SUBSTITUTE, PROTECT
	; end
