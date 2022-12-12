	db  60,  62,  63,  60,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON
	db 45 ; catch rate
	db 141 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db OVERGROW ; ability 1
	db OVERGROW ; ability 2
	db CHLOROPHYLL ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn MONSTER, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, CUT, FALSE_SWIPE, CHARM, CURSE, SUNNY_DAY, BULLDOZE, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM
	; end
