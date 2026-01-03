	db  95,  75, 110,  30, 100,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM ; item 1
	db KINGS_ROCK ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db OBLIVIOUS ; ability 1
	db OWN_TEMPO ; ability 2
	db REGENERATOR ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn MONSTER, AMPHIBIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   2,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm WATERFALL, FLAMETHROWER, PSYCHIC, ICE_BEAM, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, MUD_SLAP, TOXIC, HEADBUTT, STRENGTH, ROCK_SMASH, FALSE_SWIPE, ICE_PUNCH, RAIN_DANCE, HAIL, DIG, CURSE, SUNNY_DAY, BULLDOZE, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, BLIZZARD, FIRE_BLAST, SAND_ATTACK_SMOKESCREEN_FLASH, DIVE, ZAP_CANNON, BRICK_BREAK, SCALD, WEATHER_BALL, SHADOW_BALL, EARTHQUAKE, CALM_MIND
	; end
