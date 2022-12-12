	db  60,  50, 120,  30,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, ROCK
	db 75 ; catch rate
	db 154 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db MAGMA_ARMOR ; ability 1
	db FLAME_BODY ; ability 2
	db WEAK_ARMOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CURSE, SUNNY_DAY, BULLDOZE, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM, FIRE_BLAST
	; end
