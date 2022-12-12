	db  55,  70,  45,  60,  70,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db 91 ; base exp
	db ASPEAR_BERRY ; item 1
	db ASPEAR_BERRY ; item 2
	dn FEMALE_25, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db INTIMIDATE ; ability 1
	db FLASH_FIRE ; ability 2
	db JUSTIFIED ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, METAL_CLAW, CHARM, DIG, CURSE, SUNNY_DAY, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, FIRE_BLAST
	; end
