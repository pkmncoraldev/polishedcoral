	db 150,  80,  44,  80,  90,  54
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FLYING
	db 60 ; catch rate
	db 204 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db AFTERMATH ; ability 1
	db UNBURDEN ; ability 2
	db FLARE_BOOST ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CUT, RAIN_DANCE, FLY, CURSE, SUNNY_DAY, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, SAND_ATTACK_SMOKESCREEN_FLASH, DESTINY_BOND, ZAP_CANNON, WEATHER_BALL
	; end
