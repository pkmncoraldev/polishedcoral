	db  85,  70,  80, 123,  97,  80
	;   hp  atk  def  spd  sat  sdf

	db FLYING, DRAGON
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db FRISK ; ability 1
	db INFILTRATOR ; ability 2
	db INFILTRATOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AVIAN, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   2,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CUT, ROOST, FLY, CURSE, SUNNY_DAY, STEEL_WING, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, SOLAR_BEAM
	; end
