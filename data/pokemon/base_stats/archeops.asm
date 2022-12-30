	db  75, 140,  65, 110, 112,  65
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING
	db 45 ; catch rate
	db 177 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_12_5, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db NO_ABILITY ;DEFEATIST ; ability 1
	db NO_ABILITY ;DEFEATIST ; ability 2
	db NO_ABILITY ;DEFEATIST ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AVIAN, INVERTEBRATE ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, FAKE_OUT, CHARM, ROOST, DIG, CURSE, ROCK_CLIMB, STEEL_WING, BULLDOZE, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT
	; end
