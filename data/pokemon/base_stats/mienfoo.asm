	db  45,  85,  50,  65,  55,  50
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 180 ; catch rate
	db 70 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db REGENERATOR ; ability 2
	db RECKLESS ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn FIELD, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm STONE_EDGE, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, TOXIC, HEADBUTT, STRENGTH, ROCK_SMASH, FAKE_OUT, METAL_CLAW, ICE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, SUBSTITUTE, PROTECT, BULK_UP, TAUNT, ZAP_CANNON, BRICK_BREAK, ACROBATICS, CALM_MIND
	; end
