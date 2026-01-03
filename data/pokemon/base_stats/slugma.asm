	db  40,  40,  40,  20,  70,  40
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE
	db 190 ; catch rate
	db 78 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db MAGMA_ARMOR ; ability 1
	db FLAME_BODY ; ability 2
	db WEAK_ARMOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm STONE_EDGE, FLAME_CHARGE, FLAMETHROWER, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, MUD_SLAP, TOXIC, ROCK_SMASH, CURSE, SUNNY_DAY, BULLDOZE, WILL_O_WISP, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, FIRE_BLAST, ANCIENTPOWER, EARTHQUAKE, SELFDESTRUCT, RAPID_SPIN, WEATHER_BALL
	; end
