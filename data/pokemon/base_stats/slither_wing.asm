	db  85,  60,  65, 100, 135, 105
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIGHTING
	db 30 ; catch rate
	db 248 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn GENDERLESS, 3 ; gender, step cycles to hatch
	dn 7, 7 ; frontpic dimensions
	db NO_ABILITY;PROTOSYNTHESIS ; ability 1
	db NO_ABILITY;PROTOSYNTHESIS ; ability 2
	db NO_ABILITY;PROTOSYNTHESIS ; hidden ability
	db SLOW ; growth rate
	dn NO_EGGS, NO_EGGS ; egg groups

	; ev_yield
	ev_yield   0,   3,   0,   0,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm CURSE, SUNNY_DAY, WILL_O_WISP, SAFEGUARD, SUBSTITUTE, PROTECT, HYPER_BEAM, GIGA_IMPACT, RAIN_DANCE, BULLDOZE, DIG, BULK_UP, GIGA_DRAIN, BRICK_BREAK, ANCIENTPOWER
	; end
