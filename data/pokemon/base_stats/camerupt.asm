	db  70, 100,  70,  40, 105,  75
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GROUND
	db 150 ; catch rate
	db 175 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db MAGMA_ARMOR ; ability 1
	db SOLID_ROCK ; ability 2
	db ANGER_POINT ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CHARM, DIG, CURSE, SUNNY_DAY, BULLDOZE, WILL_O_WISP, ROCK_CLIMB, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM, FIRE_BLAST
	; end
