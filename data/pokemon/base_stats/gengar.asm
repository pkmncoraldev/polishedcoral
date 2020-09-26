	db  60,  65,  60, 110, 130,  75
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON
	db 45 ; catch rate
	db 190 ; base exp
	db NO_ITEM ; item 1
	db SPELL_TAG ; item 2
	dn FEMALE_50, 3 ; gender, step cycles to hatch
	dn 6, 6 ; frontpic dimensions
	db CURSED_BODY ; ability 1
if DEF(FAITHFUL)
	db CURSED_BODY ; ability 2
else
	db LEVITATE ; ability 2
endc
	db SHADOW_TAG ; hidden ability
	db MEDIUM_SLOW ; growth rate
	dn AMORPHOUS, AMORPHOUS ; egg groups

	; ev_yield
	ev_yield   0,   0,   0,   0,   3,   0
	;         hp, atk, def, spd, sat, sdf

	; tmhm
	tmhm
	; end
