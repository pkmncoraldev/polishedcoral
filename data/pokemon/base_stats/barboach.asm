	db  50,  48,  43,  60,  46,  41
	;   hp  atk  def  spd  sat  sdf

	db WATER, GROUND
	db 190 ; catch rate
	db 92 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db OBLIVIOUS ; ability 1
	db ANTICIPATION ; ability 2
	db HYDRATION ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FISH, FISH ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm BULLDOZE, RAIN_DANCE, HAIL, CURSE, SUBSTITUTE, PROTECT, SURF, BLIZZARD
	; end
