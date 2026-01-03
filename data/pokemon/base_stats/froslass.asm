	db  70,  80,  70, 110,  80,  70
	;   hp  atk  def  spd  sat  sdf

	db ICE, GHOST
	db 75 ; catch rate
	db 187 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn ALL_FEMALE, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SNOW_CLOAK ; ability 1
	db SNOW_CLOAK ; ability 2
	db CURSED_BODY ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FAERY, INANIMATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   0,   2
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm PSYCHIC, SHOCK_WAVE, THUNDERBOLT, ICE_BEAM, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, MUD_SLAP, TOXIC, HEADBUTT, ICE_PUNCH, RAIN_DANCE, CHARM, HAIL, CURSE, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, THUNDER, BLIZZARD, SAND_ATTACK_SMOKESCREEN_FLASH, TAUNT, DESTINY_BOND, WEATHER_BALL, SHADOW_BALL, RAPID_SPIN
	; end
