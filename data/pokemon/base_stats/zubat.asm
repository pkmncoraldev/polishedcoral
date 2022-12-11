	db  40,  45,  35,  55,  30,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db INNER_FOCUS ; ability 2
	db INFILTRATOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, STEEL_WING, SUBSTITUTE, PROTECT
	; end
