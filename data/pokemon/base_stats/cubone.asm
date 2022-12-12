	db  50,  50,  95,  35,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 190 ; catch rate
	db 87 ; base exp
	db NO_ITEM ; item 1
	db THICK_CLUB ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db ROCK_HEAD ; ability 1
	db LIGHTNING_ROD ; ability 2
	db BATTLE_ARMOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn MONSTER, MONSTER ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, FALSE_SWIPE, FIRE_PUNCH, THUNDERPUNCH, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, BLIZZARD, FIRE_BLAST
	; end
