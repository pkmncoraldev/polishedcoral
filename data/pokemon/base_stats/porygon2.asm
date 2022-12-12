	db  85,  80,  90,  60, 105,  95
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 45 ; catch rate
	db 180 ; base exp
	db NO_ITEM ; item 1
	db UP_GRADE ; item 2
	dn GENDERLESS, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db TRACE ; ability 1
	db DOWNLOAD ; ability 2
	db ANALYTIC ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn INANIMATE, INANIMATE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   2,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, RAIN_DANCE, CURSE, SUNNY_DAY, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, THUNDER, BLIZZARD, SOLAR_BEAM
	; end
