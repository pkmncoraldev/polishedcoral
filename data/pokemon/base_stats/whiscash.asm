	db 110,  78,  73,  60,  76,  71
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db OBLIVIOUS ; ability 1
	db ANTICIPATION ; ability 2
	db HYDRATION ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm BULLDOZE, RAIN_DANCE, HAIL, CURSE, SUBSTITUTE, PROTECT, SURF, BLIZZARD, HYPER_BEAM, GIGA_IMPACT
	; end
