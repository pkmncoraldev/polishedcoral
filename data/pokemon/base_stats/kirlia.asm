	db  38,  35,  35,  50,  65,  55
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY
	db 120 ; catch rate
	db 140 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SYNCHRONIZE ; ability 1
	db TRACE ; ability 2
	db TRACE ; hidden ability
	db SLOW ; growth rate
	dn HUMANSHAPE, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT
	; end
