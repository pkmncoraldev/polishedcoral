	db  55,  35,  50,  85,  55, 110
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING
	db 90 ; catch rate
	db 134 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SWARM ; ability 1
	db EARLY_BIRD ; ability 2
	db IRON_FIST ; hidden ability
	db FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, ICE_PUNCH, FIRE_PUNCH, THUNDERPUNCH, ROOST, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, BULLDOZE, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM
	; end
