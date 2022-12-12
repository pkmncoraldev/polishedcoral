	db 100,  50,  80,  50,  60,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY
	db 75 ; catch rate
	db 153 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db THICK_FAT ; ability 1
	db HUGE_POWER ; ability 2
	db SAP_SIPPER ; hidden ability
	db FAST ; growth rate
	dn AMPHIBIAN, FAERY ; egg groups

	; ev_yield
	ev_yield   3,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, ICE_PUNCH, RAIN_DANCE, CHARM, HAIL, DIG, CURSE, WORK_UP_GROWTH, BULLDOZE, SURF, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, BLIZZARD
	; end
