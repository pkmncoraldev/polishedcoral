	db  54,  78,  103,  22, 53,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, ROCK
	db 45 ; catch rate
	db 71 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SOLID_ROCK ; ability 1
	db STURDY ; ability 2
	db SWIFT_SWIM ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, RAIN_DANCE, ICE_PUNCH, DIG, CURSE, BULLDOZE, SURF, SUBSTITUTE, PROTECT, BLIZZARD
	; end
