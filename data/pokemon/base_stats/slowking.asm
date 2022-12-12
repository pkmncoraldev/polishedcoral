	db  95,  75,  80,  30, 100, 110
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC
	db 70 ; catch rate
	db 164 ; base exp
	db NO_ITEM ; item 1
	db KINGS_ROCK ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db OBLIVIOUS ; ability 1
	db OWN_TEMPO ; ability 2
	db REGENERATOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   3
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FALSE_SWIPE, ICE_PUNCH, RAIN_DANCE, HAIL, DIG, CURSE, SUNNY_DAY, BULLDOZE, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, BLIZZARD, FIRE_BLAST
	; end
