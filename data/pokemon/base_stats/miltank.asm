	db  95,  80, 105, 100,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 200 ; base exp
	db MOOMOO_MILK ; item 1
	db MOOMOO_MILK ; item 2
	dn ALL_FEMALE, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db THICK_FAT ; ability 1
	db SCRAPPY ; ability 2
	db SAP_SIPPER ; hidden ability
	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, RAIN_DANCE, CHARM, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, SAFEGUARD, SUBSTITUTE, PROTECT, THUNDER, BLIZZARD, SOLAR_BEAM
	; end
