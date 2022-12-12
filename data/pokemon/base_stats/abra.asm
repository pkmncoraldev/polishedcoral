	db  25,  20,  15,  90, 105,  55
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 200 ; catch rate
	db 73 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_25, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SYNCHRONIZE ; ability 1
	db INNER_FOCUS ; ability 2
	db MAGIC_GUARD ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CURSE, SUNNY_DAY, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT
	; end
