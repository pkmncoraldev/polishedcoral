	db  65,  90, 120,  60,  85,  70
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON
	db 60 ; catch rate
	db 173 ; base exp
	db NO_ITEM ; item 1
	db SMOKE_BALL ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db LEVITATE ; ability 1
	db LEVITATE ; ability 2
	db LEVITATE ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, CURSE, SUNNY_DAY, WILL_O_WISP, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, FIRE_BLAST
	; end
