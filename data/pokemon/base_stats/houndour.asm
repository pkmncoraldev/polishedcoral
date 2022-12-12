	db  45,  60,  30,  65,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE
	db 120 ; catch rate
	db 114 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db EARLY_BIRD ; ability 1
	db FLASH_FIRE ; ability 2
	db UNNERVE ; hidden ability
	db SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CHARM, DIG, CURSE, SUNNY_DAY, WILL_O_WISP, SUBSTITUTE, PROTECT, SOLAR_BEAM, FIRE_BLAST
	; end
