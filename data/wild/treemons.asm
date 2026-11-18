TreeMons:
	dw -1
	dw TreeMonsGlint
	dw TreeMonsGrove
	dw TreeMonsStarglow
	dw TreeMonsMountainTop
	dw TreeMonsSunbeam
	dw TreeMonsEventide
	dw TreeMonsTwinkle
	dw TreeMonsLuster
	dw TreeMonsShimmer
	dw TreeMonsOasis
	dw TreeMonsRadiant
	dw TreeMonsKomore
	dw TreeMonsBright
	dw TreeMonsObscura
	dw RockMons
	dw PetalMons

; Two tables each (normal, rare).
; Structure:
;	db  %, species, level

TreeMonsGlint:
	db 50, EXEGGCUTE,	10
	db 15, PIKIPEK,		10
	db 15, PIKIPEK,		10
	db 10, LEDYBA,		10
	db  5, LEDYBA,		10
	db  5, LEDYBA,		10
	db -1
	
TreeMonsGrove:
	db 50, CHERUBI,		10
	db 15, CHERUBI,		10
	db 15, VENIPEDE,	10
	db 10, CHERUBI,		10
	db  5, VENIPEDE,	10
	db  5, VENIPEDE,	10
	db -1

TreeMonsStarglow:
	db 50, EXEGGCUTE,	16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db -1
	
TreeMonsMountainTop:
	db 50, EXEGGCUTE,	20
	db 15, SWABLU,		20
	db 15, SWABLU,		20
	db 10, SWABLU,		20
	db  5, SWABLU,		20
	db  5, SWABLU,		20
	db -1
	
TreeMonsSunbeam:
	db 50, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 10, TRUMBEAK,	20
	db  5, TRUMBEAK,	20
	db  5, TRUMBEAK,	20
	db -1
	
TreeMonsEventide:
	db 50, MURKROW,		23
	db 15, EXEGGCUTE,	23
	db 15, EXEGGCUTE,	23
	db 10, DRIFLOON,	23
	db  5, DRIFLOON,	23
	db  5, DRIFLOON,	23
	db -1
	
TreeMonsTwinkle:
	db 50, SNORUNT,		25
	db 15, SNOVER,		25
	db 15, SNOVER,		25
	db 10, SNOVER,		25
	db  5, SNOVER,		25
	db  5, SNOVER,		25
	db -1

TreeMonsLuster:
	db 50, MEOWTH,		28
	db 15, MEOWTH,		28
	db 15, MEOWTH,		28
	db 10, VENONAT,		28
	db  5, MEOWTH,		28
	db  5, VENONAT,		28
	db -1
	
TreeMonsShimmer:
	db 50, EXEGGCUTE,	31
	db 15, MURKROW,		31
	db 15, MURKROW,		31
	db 10, MEOWTH,		31
	db  5, MEOWTH,		31
	db  5, MURKROW,		31
	db -1
	
TreeMonsOasis:
	db 50, HERACROSS,	33
	db 15, HERACROSS,	33
	db 15, HERACROSS,	33
	db 10, TOUCANNON,	33
	db  5, TOUCANNON,	33
	db  5, TOUCANNON,	33
	db -1
	
TreeMonsRadiant:
	db 50, EXEGGCUTE,	31
	db 15, CHERUBI,		31
	db 15, CHERUBI,		31
	db 10, SUNKERN,		31
	db  5, SUNKERN,		31
	db  5, SUNKERN,		31
	db -1
	
TreeMonsKomore:
	db 50, MURKROW,		35
	db 15, EXEGGCUTE,	35
	db 15, EXEGGCUTE,	35
	db 10, DRIFLOON,	35
	db  5, DRIFLOON,	35
	db  5, DRIFLOON,	35
	db -1
	
TreeMonsBright:
	db 50, DITTO,		37
	db 15, EXEGGCUTE,	37
	db 15, EXEGGCUTE,	37
	db 10, EXEGGCUTE,	37
	db  5, EXEGGCUTE,	37
	db  5, EXEGGCUTE,	37
	db -1
	
TreeMonsObscura:
	db 50, EXEGGCUTE,	37
	db 15, MURKROW,		37
	db 15, MURKROW,		37
	db 10, MURKROW,		37
	db  5, MURKROW,		37
	db  5, MURKROW,		37
	db -1

RockMons:
	db 70, BULBASAUR,	15
	db 30, BULBASAUR,	15
	db -1
	
PetalMons:
	db 50, COTTONEE,	7
	db 25, CHERUBI,		7
	db 25, COTTONEE,	7
	db -1
