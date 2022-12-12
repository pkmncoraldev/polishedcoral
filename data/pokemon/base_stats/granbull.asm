	db  90, 120,  75,  45,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 75 ; catch rate
	db 178 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db INTIMIDATE ; ability 1
	db QUICK_FEET ; ability 2
	db RATTLED ; hidden ability
	db FAST ; growth rate
	dn FIELD, FAERY ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, ROCK_CLIMB, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, SOLAR_BEAM, FIRE_BLAST
	; end
