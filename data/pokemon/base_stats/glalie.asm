	db  80,  80,  80,  80,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE
	db 75 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db ICE_BODY ; ability 2
	db MOODY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, INANIMATE ; egg groups

	; ev_yield
	ev_yield   2,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, HAIL, CURSE, BULLDOZE, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, BLIZZARD
	; end
