	db  70,  80,  65,  85,  90,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC
	db 60 ; catch rate
	db 159 ; base exp
	db NO_ITEM ; item 1
	db PERSIM_BERRY  ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db EARLY_BIRD ; ability 2
	db SAP_SIPPER ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm STRENGTH, ROCK_SMASH, FAKE_OUT, BULLDOZE, RAIN_DANCE, CHARM, SUNNY_DAY, CURSE, WORK_UP_GROWTH, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SAND_ATTACK_SMOKESCREEN_FLASH
	; end
