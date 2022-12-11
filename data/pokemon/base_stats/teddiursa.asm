	db  60,  80,  50,  40,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 120 ; catch rate
	db 124 ; base exp
	db ORAN_BERRY ; item 1
	db SITRUS_BERRY ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db PICKUP ; ability 1
	db QUICK_FEET ; ability 2
	db PICKUP ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, CUT, FALSE_SWIPE, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, SUBSTITUTE, PROTECT
	; end
