	db  60,  95,  50,  30, 145, 130
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST
	db 30 ; catch rate
	db 179 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db WEAK_ARMOR ; ability 1
	db WEAK_ARMOR ; ability 2
	db PERISH_BODY ; hidden ability
	db FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm STRENGTH, ROCK_SMASH, FAKE_OUT, RAIN_DANCE, CHARM, HAIL, DIG, CURSE, BULLDOZE, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, BLIZZARD, DESTINY_BOND, GIGA_DRAIN, ZAP_CANNON
	; end
