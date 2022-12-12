	db  40,  30,  30,  85,  55,  30
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 190 ; catch rate
	db 64 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db KEEN_EYE ; ability 1
	db HYDRATION ; ability 2
	db RAIN_DISH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, ROOST, FLY, HAIL, CURSE, STEEL_WING, SURF, SUBSTITUTE, PROTECT, BLIZZARD
	; end
