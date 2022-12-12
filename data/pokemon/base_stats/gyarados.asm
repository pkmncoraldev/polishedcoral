	db  95, 125,  79,  81,  60, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING
	db 45 ; catch rate
	db 214 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 0 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db INTIMIDATE ; ability 1
	db MOLD_BREAKER ; ability 2
	db MOXIE ; hidden ability
	db SLOW ; growth rate
	dn FISH, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, RAIN_DANCE, HAIL, CURSE, BULLDOZE, SURF, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD, FIRE_BLAST
	; end
