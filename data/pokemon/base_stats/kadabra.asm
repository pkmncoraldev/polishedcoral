	db  40,  35,  30, 105, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 100 ; catch rate
	db 145 ; base exp
	db NO_ITEM ; item 1
	db TWISTEDSPOON ; item 2
	dn FEMALE_25, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SYNCHRONIZE ; ability 1
	db INNER_FOCUS ; ability 2
	db MAGIC_GUARD ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CURSE, SUNNY_DAY, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT
	; end
