	db  60,  50, 100,  65,  95,  70
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 45 ; catch rate
	db 164 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db KEEN_EYE ; ability 1
	db HYDRATION ; ability 2
	db RAIN_DISH ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMPHIBIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, ROOST, FLY, HAIL, CURSE, STEEL_WING, SURF, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, BLIZZARD
	; end
