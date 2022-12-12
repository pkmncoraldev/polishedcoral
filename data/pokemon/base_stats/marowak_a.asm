	db  60,  80, 110,  45,  50,  80
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GHOST
	db 75 ; catch rate
	db 124 ; base exp
	db NO_ITEM ; item 1
	db THICK_CLUB ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db CURSED_BODY ; ability 1
	db LIGHTNING_ROD ; ability 2
	db ROCK_HEAD ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FALSE_SWIPE, FIRE_PUNCH, THUNDERPUNCH, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD, FIRE_BLAST
	; end
