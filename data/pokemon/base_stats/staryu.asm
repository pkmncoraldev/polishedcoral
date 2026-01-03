	db  30,  45,  55,  85,  70,  55
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER
	db 225 ; catch rate
	db 106 ; base exp
	db STARDUST ; item 1
	db STAR_PIECE ; item 2
	dn GENDERLESS, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db ILLUMINATE ; ability 1
	db NATURAL_CURE ; ability 2
	db ANALYTIC ; hidden ability
	db SLOW ; growth rate
	dn INVERTEBRATE, INVERTEBRATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm WATERFALL, PSYCHIC, THUNDERBOLT, ICE_BEAM, DOUBLE_TEAM, ENDURE, REST, RETURN, TOXIC, RAIN_DANCE, HAIL, CURSE, SURF, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, THUNDER, BLIZZARD, SAND_ATTACK_SMOKESCREEN_FLASH, DIVE, ZAP_CANNON, DAZZLINGLEAM, SCALD, RAPID_SPIN
	; end
