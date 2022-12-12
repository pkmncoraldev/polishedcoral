	db  60,  80,  50,  30,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 190 ; catch rate
	db 63 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db INTIMIDATE ; ability 1
	db RUN_AWAY ; ability 2
	db RATTLED ; hidden ability
	db FAST ; growth rate
	dn FIELD, FAERY ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, ROCK_CLIMB, SUBSTITUTE, PROTECT, THUNDER, SOLAR_BEAM, FIRE_BLAST
	; end
