	db  90,  60,  60,  40,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND
	db 120 ; catch rate
	db 124 ; base exp
	db NO_ITEM ; item 1
	db ORAN_BERRY ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db PICKUP ; ability 1
	db PICKUP ; ability 2
	db SAND_VEIL ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CHARM, DIG, CURSE, SUNNY_DAY, BULLDOZE, SUBSTITUTE, PROTECT
	; end
