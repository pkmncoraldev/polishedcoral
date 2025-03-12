	db  95,  60,  60, 105, 101,  60
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 60 ; catch rate
	db 168 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db NO_ABILITY ; OPPORTUNIST ; ability 1
	db FRISK ; ability 2
	db SPEED_BOOST ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, REFLECT, FAKE_OUT, SUBSTITUTE, DAZZLINGLEAM, ROOST, WORK_UP_GROWTH, SAND_ATTACK_SMOKESCREEN_FLASH, HYPER_BEAM, GIGA_IMPACT, ZAP_CANNON, ROCK_SMASH, FLY, SANDSTORM
	; end
