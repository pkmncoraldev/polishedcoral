	db  60,  55,  50,  45,  40,  55
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON
	db 190 ; catch rate
	db 75 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 1 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db COMPOUND_EYES ; ability 1
	db TINTED_LENS ; ability 2
	db RUN_AWAY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm VENOSHOCK, SUNNY_DAY, PROTECT, GIGA_DRAIN, DESTINY_BOND, FAKE_OUT, ROOST, SAND_ATTACK_SMOKESCREEN_FLASH
	; end
