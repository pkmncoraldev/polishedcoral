	db  55,  81,  60,  97,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 90 ; catch rate
	db 116 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDERLESS, 2 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db NO_ABILITY ; ability 1
	db NO_ABILITY ; ability 2
	db NO_ABILITY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, RAIN_DANCE, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD
	; end
