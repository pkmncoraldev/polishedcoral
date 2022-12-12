	db  70,  45,  48,  35,  60,  65
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 150 ; catch rate
	db 68 ; base exp
	db LEPPA_BERRY ; item 1
	db MOON_STONE ; item 2
	dn FEMALE_75, 1 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CUTE_CHARM ; ability 1
	db MAGIC_GUARD ; ability 2
	db CUTE_CHARM ; hidden ability
	db FAST ; growth rate
	dn FAERY, FAERY ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, THUNDER, BLIZZARD, SOLAR_BEAM, FIRE_BLAST
	; end
