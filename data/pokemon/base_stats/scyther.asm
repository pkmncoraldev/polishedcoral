	db  70, 110,  80, 105,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 4 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SWARM ; ability 1
	db TECHNICIAN ; ability 2
	db STEADFAST ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, STEEL_WING, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT
	; end
