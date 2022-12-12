	db  40,  50,  45,  70,  70,  45
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING
	db 190 ; catch rate
	db 73 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db SYNCHRONIZE ; ability 1
	db EARLY_BIRD ; ability 2
	db MAGIC_BOUNCE ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, STEEL_WING, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, LIGHT_SCREEN, REFLECT, SOLAR_BEAM
	; end
