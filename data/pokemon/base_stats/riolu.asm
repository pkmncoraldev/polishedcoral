	db  40,  70,  40,  60,  35,  40
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING
	db 75 ; catch rate
	db 72 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db STEADFAST ; ability 1
	db INNER_FOCUS ; ability 2
	db PRANKSTER ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, ICE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, SUBSTITUTE, PROTECT
	; end
