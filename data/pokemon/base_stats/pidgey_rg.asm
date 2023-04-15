	db  40,  45,  40,  56,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 255 ; catch rate
	db 55 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDERLESS, 2 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db NO_ABILITY ; ability 1
	db NO_ABILITY ; ability 2
	db NO_ABILITY ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, WORK_UP_GROWTH, STEEL_WING, SUBSTITUTE, PROTECT
	; end
