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
	dw TreeMonsRadiant
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
	; rare
	db 50, EXEGGCUTE,	15
	db 15, PIKIPEK,		15
	db 15, PIKIPEK,		15
	db 10, LEDYBA,		15
	db  5, LEDYBA,		15
	db  5, LEDYBA,		15
	db -1
	
TreeMonsGrove:
	db 50, CHERUBI,		10
	db 15, VENIPEDE,	10
	db 15, VENIPEDE,	10
	db 10, VENIPEDE,	10
	db  5, VENIPEDE,	10
	db  5, VENIPEDE,	10
	db -1
	; rare
	db 50, CHERUBI,		15
	db 15, VENIPEDE,	15
	db 15, VENIPEDE,	15
	db 10, VENIPEDE,	15
	db  5, VENIPEDE,	15
	db  5, VENIPEDE,	15
	db -1

TreeMonsStarglow:
	db 50, EXEGGCUTE,	13
	db 15, JOLTIK,		13
	db 15, JOLTIK,		13
	db 15, JOLTIK,		13
	db 15, JOLTIK,		13
	db 15, JOLTIK,		13
	db -1
	; rare
	db 50, CHERUBI,		18
	db 15, VENIPEDE,	18
	db 15, VENIPEDE,	18
	db 10, VENIPEDE,	18
	db  5, VENIPEDE,	18
	db  5, VENIPEDE,	18
	db -1
	
TreeMonsMountainTop:
	db 50, EXEGGCUTE,	15
	db 15, NATU,		15
	db 15, NATU,		15
	db 10, SWABLU,		15
	db  5, SWABLU,		15
	db  5, SWABLU,		15
	db -1
	; rare
	db 50, EXEGGCUTE,	20
	db 15, NATU,		20
	db 15, NATU,		20
	db 10, SWABLU,		20
	db  5, SWABLU,		20
	db  5, SWABLU,		20
	db -1
	
TreeMonsSunbeam:
	db 50, EXEGGCUTE,	15
	db 15, EXEGGCUTE,	15
	db 15, EXEGGCUTE,	15
	db 10, TRUMBEAK,	15
	db  5, TRUMBEAK,	15
	db  5, TRUMBEAK,	15
	db -1
	; rare
	db 50, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 10, TRUMBEAK,	20
	db  5, TRUMBEAK,	20
	db  5, TRUMBEAK,	20
	db -1
	
TreeMonsEventide:
	db 50, MURKROW,		20
	db 15, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 10, DRIFLOON,	20
	db  5, DRIFLOON,	20
	db  5, DRIFLOON,	20
	db -1
	; rare
	db 50, MURKROW,		25
	db 15, EXEGGCUTE,	25
	db 15, EXEGGCUTE,	25
	db 10, DRIFLOON,	25
	db  5, DRIFLOON,	25
	db  5, DRIFLOON,	25
	db -1
	
TreeMonsTwinkle:
	db 50, SWABLU,		20
	db 15, SNORUNT,		20
	db 15, SNOVER,		20
	db 10, SNOVER,		20
	db  5, SNORUNT,		20
	db  5, SNORUNT,		20
	db -1
	; rare
	db 50, SWABLU,		25
	db 15, SNORUNT,		25
	db 15, SNOVER,		25
	db 10, SNOVER,		25
	db  5, SNORUNT,		25
	db  5, SNORUNT,		25
	db -1

TreeMonsLuster:
	db 50, MEOWTH,		26
	db 15, MEOWTH,		26
	db 15, MURKROW,		26
	db 10, DRIFLOON,	26
	db  5, MURKROW,		26
	db  5, DRIFLOON,	26
	db -1
	; rare
	db 50, MEOWTH,		31
	db 15, MEOWTH,		31
	db 15, MURKROW,		31
	db 10, DRIFLOON,	31
	db  5, MURKROW,		31
	db  5, DRIFLOON,	31
	db -1
	
TreeMonsShimmer:
	db 50, EXEGGCUTE,	26
	db 15, MURKROW,		26
	db 15, MURKROW,		26
	db 10, MUNCHLAX,	26
	db  5, MUNCHLAX,	26
	db  5, MURKROW,		26
	db -1
	; rare
	db 50, EXEGGCUTE,	31
	db 15, MURKROW,		31
	db 15, MURKROW,		31
	db 10, MUNCHLAX,	31
	db  5, MUNCHLAX,	31
	db  5, MURKROW,		31
	db -1
	
TreeMonsRadiant:
	db 50, EXEGGCUTE,	26
	db 15, CHERUBI,		26
	db 15, CHERUBI,		26
	db 10, VENONAT,		26
	db  5, VENONAT,		26
	db  5, CHERUBI,		26
	db -1
	; rare
	db 50, EXEGGCUTE,	31
	db 15, CHERUBI,		31
	db 15, CHERUBI,		31
	db 10, VENONAT,		31
	db  5, VENONAT,		31
	db  5, CHERUBI,		31
	db -1

RockMons:
	db 70, BULBASAUR,	15
	db 30, BULBASAUR,	15
	db -1
	
PetalMons:
	db 50, CHERUBI,		7
	db 25, VENIPEDE,	7
	db 25, CHERUBI,		7
	db -1
