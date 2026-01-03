	db  28,  60,  30,  82,  40,  30
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, GHOST
	db 45 ; catch rate
	db 54 ; base exp
	db NO_ITEM ; item 1
	db NO_ITEM ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 5, 5 ; frontpic dimensions
	db CLEAR_BODY ; ability 1
	db INFILTRATOR ; ability 2
	db CURSED_BODY ; hidden ability
	db SLOW ; growth rate
	dn AMORPHOUS, REPTILE ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   1,   0,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm DRAGONBREATH, DOUBLE_TEAM, ENDURE, REST, ATTRACT, RETURN, TOXIC, HEADBUTT, PROTECT, SUBSTITUTE
	; end
