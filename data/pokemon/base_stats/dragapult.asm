	db  88, 120,  75, 142, 100,  75
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, GHOST
	db 45 ; catch rate
	db 255 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db CLEAR_BODY ; ability 1
	db INFILTRATOR ; ability 2
	db CURSED_BODY ; hidden ability
	db SLOW ; growth rate
	dn AMORPHOUS, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   3,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, SUNNY_DAY, REFLECT, LIGHT_SCREEN, WILL_O_WISP, FIRE_BLAST, THUNDER, SOLAR_BEAM, PROTECT, SUBSTITUTE, SURF, FLY, HYPER_BEAM, GIGA_IMPACT, DIVE
	; end
