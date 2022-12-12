	db  61,  84,  65,  70,  70,  70
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON
	db 45 ; catch rate
	db 144 ; base exp
	db NO_ITEM ; item 1
	db DRAGON_SCALE ; item 2
	dn FEMALE_50, 7 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SHED_SKIN ; ability 1
	db SHED_SKIN ; ability 2
	db MARVEL_SCALE ; hidden ability
	db SLOW ; growth rate
	dn AMPHIBIAN, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, HAIL, CURSE, SUNNY_DAY, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, THUNDER, BLIZZARD, FIRE_BLAST
	; end
