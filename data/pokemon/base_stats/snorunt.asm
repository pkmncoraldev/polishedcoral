	db  50,  50,  50,  50,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db ICE_BODY ; ability 2
	db MOODY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, INANIMATE ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, HAIL, CURSE, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, BLIZZARD
	; end
