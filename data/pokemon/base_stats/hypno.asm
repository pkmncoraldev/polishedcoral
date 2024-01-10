	db  85,  73,  70,  67,  73, 115
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 75 ; catch rate
	db 165 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INSOMNIA ; ability 1
	db FOREWARN ; ability 2
	db INNER_FOCUS ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn HUMANSHAPE, HUMANSHAPE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, FAKE_OUT, SUBSTITUTE, FLASH, THUNDERPUNCH, FIRE_PUNCH, ICE_PUNCH, HYPER_BEAM, GIGA_IMPACT
	; end
