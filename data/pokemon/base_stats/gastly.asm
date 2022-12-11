	db  30,  35,  30,  80, 100,  35
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON
	db 190 ; catch rate
	db 95 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db LEVITATE ; ability 1
	db LEVITATE ; ability 2
	db LEVITATE ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CURSE, SUNNY_DAY, WILL_O_WISP, SUBSTITUTE, PROTECT
	; end
