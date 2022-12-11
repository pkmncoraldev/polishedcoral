	db  55, 112,  45,  70, 74,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING
	db 45 ; catch rate
	db 71 ; base exp
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
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, FAKE_OUT, CHARM, ROOST, DIG, CURSE, STEEL_WING, BULLDOZE, SUBSTITUTE, PROTECT
	; end
