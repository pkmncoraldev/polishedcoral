	db  70,  60,  70,  85,  87,  78
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 75 ; catch rate
	db 158 ; base exp
	db NO_ITEM ; item 1
	db MIRACLE_SEED ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db FLOWER_GIFT ; ability 1
	db FLOWER_GIFT ; ability 2
	db FLOWER_GIFT ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, SOLAR_BEAM, SAFEGUARD, PROTECT, SUNNY_DAY, SUBSTITUTE, HYPER_BEAM, GIGA_IMPACT, SAND_ATTACK_SMOKESCREEN_FLASH
	; end
