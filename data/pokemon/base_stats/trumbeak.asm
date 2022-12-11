	db  55,  85,  50,  75,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 120 ; catch rate
	db 124 ; base exp
	db SITRUS_BERRY ; item 1
	db SITRUS_BERRY ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db KEEN_EYE ; ability 1
	db SKILL_LINK ; ability 2
	db PICKUP ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   2,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, WORK_UP_GROWTH, STEEL_WING, SUBSTITUTE, PROTECT
	; end
