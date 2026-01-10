	db  60,  55, 100,  35,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST
	db 60 ; catch rate
	db 128 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db WEAK_ARMOR ; ability 1
	db WEAK_ARMOR ; ability 2
	db CURSED_BODY ; hidden ability
	db FAST ; growth rate
	dn AMPHIBIAN, INVERTEBRATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   1,   0,   0,   1
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm STONE_EDGE, PSYCHIC, ICE_BEAM, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, MUD_SLAP, TOXIC, HEADBUTT, STRENGTH, ROCK_SMASH, FAKE_OUT, RAIN_DANCE, CHARM, HAIL, DIG, CURSE, BULLDOZE, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, LIGHT_SCREEN, REFLECT, BLIZZARD, DESTINY_BOND, GIGA_DRAIN, ZAP_CANNON, ANCIENTPOWER, SANDSTORM, SHADOW_BALL, EARTHQUAKE, SELFDESTRUCT, CALM_MIND
	; end
