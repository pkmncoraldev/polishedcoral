	db  85,  60,  65, 100, 135, 105
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIRE
	db 15 ; catch rate
	db 248 ; base exp
	db SILVERPOWDER ; item 1
	db SILVERPOWDER ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db FLAME_BODY ; ability 1
	db FLAME_BODY ; ability 2
	db SWARM ; hidden ability
	db SLOW ; growth rate
	dn INSECT, INSECT ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   3,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, SUNNY_DAY, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM, FIRE_BLAST
	; end
