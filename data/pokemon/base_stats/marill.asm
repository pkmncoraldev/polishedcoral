	db  70,  20,  50,  40,  20,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY
	db 190 ; catch rate
	db 58 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db THICK_FAT ; ability 1
	db HUGE_POWER ; ability 2
	db SAP_SIPPER ; hidden ability
	db FAST ; growth rate
	dn AMPHIBIAN, FAERY ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, ICE_PUNCH, RAIN_DANCE, CHARM, HAIL, DIG, CURSE, WORK_UP_GROWTH, SURF, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, BLIZZARD
	; end
