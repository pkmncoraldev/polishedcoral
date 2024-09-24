	db  50,  75,  70,  48,  35,  70
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIGHTING
	db 180 ; catch rate
	db 70 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SHED_SKIN ; ability 1
	db MOXIE ; ability 2
	db INTIMIDATE ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, SUBSTITUTE, PROTECT
	; end
