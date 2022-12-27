	db  75,  38,  38,  67,  56,  56
	;   hp  atk  def  spd  sat  sdf

	db WATER, ELECTRIC
	db 190 ; catch rate
	db 90 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db ILLUMINATE ; ability 1
	db VOLT_ABSORB ; ability 2
	db WATER_ABSORB ; hidden ability
	db SLOW ; growth rate
	dn FISH, FISH ; egg groups

	; ev_yield
	ev_yield   1,   0,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, HAIL, CURSE, SURF, SUBSTITUTE, PROTECT, THUNDER, BLIZZARD
	; end
