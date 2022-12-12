	db  60,  62,  50,  40,  62,  60
	;   hp  atk  def  spd  sat  sdf

	db GRASS, ICE
	db 120 ; catch rate
	db 131 ; base exp
	db NEVERMELTICE ; item 1
	db NEVERMELTICE ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db SNOW_WARNING ; ability 1
	db SNOW_WARNING ; ability 2
	db SNOW_WARNING ; hidden ability
	db SLOW ; growth rate
	dn MONSTER, PLANT ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ICE_PUNCH, RAIN_DANCE, HAIL, CURSE, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, BLIZZARD, SOLAR_BEAM
	; end
