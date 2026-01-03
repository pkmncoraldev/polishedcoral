	db  70,  65,  60,  90,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 75 ; catch rate
	db 158 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 1 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db SHIELD_DUST ; ability 1
	db TINTED_LENS ; ability 2
	db WONDER_SKIN ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm SLUDGE_BOMB, DRAGONBREATH, ENERGY_BALL, PSYCHIC, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, TOXIC, VENOSHOCK, SUNNY_DAY, PROTECT, GIGA_DRAIN, DESTINY_BOND, FAKE_OUT, ROOST, SAND_ATTACK_SMOKESCREEN_FLASH
	; end
