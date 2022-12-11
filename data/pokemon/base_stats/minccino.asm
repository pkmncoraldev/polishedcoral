	db  55,  50,  40,  75,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL
	db 255 ; catch rate
	db 60 ; base exp
	db CHESTO_BERRY ; item 1
	db CHESTO_BERRY ; item 2
	dn FEMALE_75, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CUTE_CHARM ; ability 1
	db TECHNICIAN ; ability 2
	db SKILL_LINK ; hidden ability
	db FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm FAKE_OUT, RAIN_DANCE, CHARM, DIG, CURSE, SUNNY_DAY, WORK_UP_GROWTH, SAFEGUARD, SUBSTITUTE, PROTECT
	; end
