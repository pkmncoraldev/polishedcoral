	db  68,  65,  65,  80, 125, 115
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY
	db 45 ; catch rate
	db 233 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SYNCHRONIZE ; ability 1
	db TRACE ; ability 2
	db TRACE ; hidden ability
	db SLOW ; growth rate
	dn HUMANSHAPE, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   3,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT
	; end
