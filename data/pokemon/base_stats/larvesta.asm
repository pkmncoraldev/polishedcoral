	db  55,  85,  55,  60,  50,  55
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIRE
	db 45 ; catch rate
	db 72 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db FLAME_BODY ; ability 1
	db FLAME_BODY ; ability 2
	db SWARM ; hidden ability
	db SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, SUNNY_DAY, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM, FIRE_BLAST
	; end
