	db  65, 125,  60, 104,  95,  60
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 45 ; catch rate
	db 179 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db REGENERATOR ; ability 2
	db RECKLESS ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn FIELD, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm STRENGTH, ROCK_SMASH, FAKE_OUT, METAL_CLAW, ICE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, BULK_UP, TAUNT, ZAP_CANNON, BRICK_BREAK
	; end
