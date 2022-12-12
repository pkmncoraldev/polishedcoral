	db  60,  40,  60,  35,  40,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS
	db 255 ; catch rate
	db 65 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db EFFECT_SPORE ; ability 1
	db POISON_HEAL ; ability 2
	db QUICK_FEET ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, PLANT ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CUT, FALSE_SWIPE, CURSE, SUNNY_DAY, SAFEGUARD, SUBSTITUTE, PROTECT, SOLAR_BEAM
	; end
