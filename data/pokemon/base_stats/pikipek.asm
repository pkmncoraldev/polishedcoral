	db  35,  75,  30,  65,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING
	db 255 ; catch rate
	db 53 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 2 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db KEEN_EYE ; ability 1
	db SKILL_LINK ; ability 2
	db PICKUP ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn AVIAN, AVIAN ; egg groups

	; ev_yield
	ev_yield   0,   1,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, RAIN_DANCE, ROOST, FLY, CURSE, SUNNY_DAY, WORK_UP_GROWTH, STEEL_WING, SUBSTITUTE, PROTECT
	; end
