	db  50,  53,  62,  45,  43,  52
	;   hp  atk  def  spd  sat  sdf

	db POISON, WATER
	db 190 ; catch rate
	db 61 ; base exp
	db POISON_BARB ; item 1
	db POISON_BARB ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db MERCILESS ; ability 1
	db LIMBER ; ability 2
	db REGENERATOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, AMPHIBIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, FALSE_SWIPE, RAIN_DANCE, HAIL, CURSE, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, BLIZZARD
	; end
