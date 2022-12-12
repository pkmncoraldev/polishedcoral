	db 140,  70,  45,  45,  85,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY
	db 50 ; catch rate
	db 109 ; base exp
	db ORAN_BERRY ; item 1
	db ORAN_BERRY ; item 2
	dn FEMALE_75, 1 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db CUTE_CHARM ; ability 1
	db COMPETITIVE ; ability 2
	db FRISK ; hidden ability
	db FAST ; growth rate
	dn FAERY, FAERY ; egg groups

	; ev_yield
	ev_yield   3,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, THUNDER, SOLAR_BEAM, FIRE_BLAST
	; end
