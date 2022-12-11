	db  45,  50,  45,  95, 115,  55
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON
	db 90 ; catch rate
	db 126 ; base exp
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db LEVITATE ; ability 1
	db LEVITATE ; ability 2
	db LEVITATE ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CURSE, SUNNY_DAY, WILL_O_WISP, SUBSTITUTE, PROTECT
	; end
