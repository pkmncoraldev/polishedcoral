	db  51,  52,  90, 100,  82, 110
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY
	db 60 ; catch rate
	db 170 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_75, 20 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db TRIAGE ; ability 1
	db TRIAGE ; ability 2
	db NATURAL_CURE ; hidden ability
	db FAST ; growth rate
	dn PLANT, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CHARM, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, SAFEGUARD, SOLAR_BEAM, FAKE_OUT, SUBSTITUTE, GIGA_IMPACT, TAUNT, GIGA_DRAIN, DAZZLINGLEAM, SAND_ATTACK_SMOKESCREEN_FLASH, ACROBATICS, CALM_MIND
	; end
