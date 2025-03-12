	db  30,  35,  30,  75,  55,  30
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC
	db 120 ; catch rate
	db 51 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db ANTICIPATION ; ability 1
	db FRISK ; ability 2
	db SPEED_BOOST ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, REFLECT, FAKE_OUT, SUBSTITUTE, DAZZLINGLEAM, ROOST, WORK_UP_GROWTH, SAND_ATTACK_SMOKESCREEN_FLASH, ZAP_CANNON, ROCK_SMASH, SANDSTORM
	; end
