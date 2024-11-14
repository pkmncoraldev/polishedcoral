	db  65,  60,  60, 115,  75,  65
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK
	db 90 ; catch rate
	db 148 ; base exp
	db NO_ITEM ; item 1
	db QUICK_CLAW ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db FUR_COAT ; ability 1
	db TECHNICIAN ; ability 2
	db RATTLED ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, METAL_CLAW, FALSE_SWIPE, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, SAND_ATTACK_SMOKESCREEN_FLASH, TAUNT, ZAP_CANNON
	; end
