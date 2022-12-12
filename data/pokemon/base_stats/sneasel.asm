	db  55,  95,  55, 115,  35,  75
	;   hp  atk  def  spd  sat  sdf

	db DARK, ICE
	db 60 ; catch rate
	db 132 ; base exp
	db GRIP_CLAW ; item 1
	db RAZOR_CLAW ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db INNER_FOCUS ; ability 1
	db KEEN_EYE ; ability 2
	db PICKPOCKET ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, FAKE_OUT, METAL_CLAW, CUT, FALSE_SWIPE, ICE_PUNCH, RAIN_DANCE, HAIL, DIG, CURSE, SUNNY_DAY, ROCK_CLIMB, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, BLIZZARD
	; end
