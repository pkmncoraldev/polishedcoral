	db  70, 130, 100,  65,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL
	db 25 ; catch rate
	db 200 ; base exp
	db NO_ITEM ; item 1
	db METAL_COAT ; item 2
	dn FEMALE_50, 4 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SWARM ; ability 1
	db TECHNICIAN ; ability 2
	db SWARM ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CUT, FALSE_SWIPE, RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, STEEL_WING, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT
	; end
