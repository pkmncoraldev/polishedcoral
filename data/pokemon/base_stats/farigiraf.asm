	db 120,  90,  70,  60, 110,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC
	db 45 ; catch rate
	db 255 ; base exp
	db NO_ITEM ; item 1
	db PERSIM_BERRY  ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db CUD_CHEW ; ability 1
	db ARMOR_TAIL ; ability 2
	db SAP_SIPPER ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   3,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, BULLDOZE, RAIN_DANCE, CHARM, SUNNY_DAY, CURSE, WORK_UP_GROWTH, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT
	; end
