	db  40,  35,  35,  90,  50,  40
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK
	db 255 ; catch rate
	db 69 ; base exp
	db NO_ITEM ; item 1
	db AMULET_COIN ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db PICKUP ; ability 1
	db TECHNICIAN ; ability 2
	db RATTLED ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, METAL_CLAW, CUT, FALSE_SWIPE, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SUBSTITUTE, PROTECT, THUNDER, SAND_ATTACK_SMOKESCREEN_FLASH, TAUNT, ZAP_CANNON
	; end
