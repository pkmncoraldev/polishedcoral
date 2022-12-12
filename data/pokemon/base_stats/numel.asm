	db  60,  60,  40,  35,  65,  45
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GROUND
	db 255 ; catch rate
	db 88 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db OBLIVIOUS ; ability 1
	db OBLIVIOUS ; ability 2
	db OWN_TEMPO ; hidden ability
	db MEDIUM_FAST ; growth rate
	dn FIELD, FIELD ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   1,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm ROCK_SMASH, CHARM, DIG, CURSE, SUNNY_DAY, BULLDOZE, WILL_O_WISP, ROCK_CLIMB, SUBSTITUTE, PROTECT, FIRE_BLAST
	; end
