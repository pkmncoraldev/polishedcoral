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
	db 50, EXEGGCUTE,	16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
	db 15, JOLTIK,		16
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
	db 50, EXEGGCUTE,	20
	db 15, NATU,		20
	db 15, NATU,		20
	db 10, SWABLU,		20
	db  5, SWABLU,		20
	db  5, SWABLU,		20
	db -1
	; rare
	db 50, EXEGGCUTE,	24
	db 15, NATU,		24
	db 15, NATU,		24
	db 10, SWABLU,		24
	db  5, SWABLU,		24
	db  5, SWABLU,		24
	db -1
	
TreeMonsSunbeam:
	db 50, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 15, EXEGGCUTE,	20
	db 10, TRUMBEAK,	20
	db  5, TRUMBEAK,	20
	db  5, TRUMBEAK,	20
	db -1
	; rare
	db 50, EXEGGCUTE,	24
	db 15, EXEGGCUTE,	24
	db 15, EXEGGCUTE,	24
	db 10, TRUMBEAK,	24
	db  5, TRUMBEAK,	24
	db  5, TRUMBEAK,	24
	db -1
	
TreeMonsEventide:
	db 50, MURKROW,		23
	db 15, EXEGGCUTE,	23
	db 15, EXEGGCUTE,	23
	db 10, DRIFLOON,	23
	db  5, DRIFLOON,	23
	db  5, DRIFLOON,	23
	db -1
	; rare
	db 50, MURKROW,		27
	db 15, EXEGGCUTE,	27
	db 15, EXEGGCUTE,	27
	db 10, DRIFLOON,	27
	db  5, DRIFLOON,	27
	db  5, DRIFLOON,	27
	db -1
	
TreeMonsTwinkle:
	db 50, SWABLU,		25
	db 15, SNORUNT,		25
	db 15, SNOVER,		25
	db 10, SNOVER,		25
	db  5, SNORUNT,		25
	db  5, SNORUNT,		25
	db -1
	; rare
	db 50, SWABLU,		28
	db 15, SNORUNT,		28
	db 15, SNOVER,		28
	db 10, SNOVER,		28
	db  5, SNORUNT,		28
	db  5, SNORUNT,		28
	db -1

TreeMonsLuster:
	db 50, MEOWTH,		28
	db 15, MEOWTH,		28
	db 15, MURKROW,		28
	db 10, DRIFLOON,	28
	db  5, MURKROW,		28
	db  5, DRIFLOON,	28
	db -1
	; rare
	db 50, MEOWTH,		32
	db 15, MEOWTH,		32
	db 15, MURKROW,		32
	db 10, DRIFLOON,	32
	db  5, MURKROW,		32
	db  5, DRIFLOON,	32
	db -1
	
TreeMonsShimmer:
	db 50, EXEGGCUTE,	31
	db 15, MURKROW,		31
	db 15, MURKROW,		31
	db 10, MUNCHLAX,	31
	db  5, MUNCHLAX,	31
	db  5, MURKROW,		31
	db -1
	; rare
	db 50, EXEGGCUTE,	35
	db 15, MURKROW,		35
	db 15, MURKROW,		35
	db 10, MUNCHLAX,	35
	db  5, MUNCHLAX,	35
	db  5, MURKROW,		35
	db -1
	
TreeMonsOasis:
	db 50, EXEGGCUTE,	33
	db 15, TOUCANNON,	33
	db 15, HERACROSS,	33
	db 10, HERACROSS,	33
	db  5, HERACROSS,	33
	db  5, TOUCANNON,	33
	db -1
	; rare
	db 50, EXEGGCUTE,	38
	db 15, TOUCANNON,	38
	db 15, HERACROSS,	38
	db 10, HERACROSS,	38
	db  5, HERACROSS,	38
	db  5, TOUCANNON,	38
	db -1
	
TreeMonsRadiant:
	db 50, EXEGGCUTE,	31
	db 15, CHERUBI,		31
	db 15, CHERUBI,		31
	db 10, VENONAT,		31
	db  5, VENONAT,		31
	db  5, CHERUBI,		31
	db -1
	; rare
	db 50, EXEGGCUTE,	35
	db 15, CHERUBI,		35
	db 15, CHERUBI,		35
	db 10, VENONAT,		35
	db  5, VENONAT,		35
	db  5, CHERUBI,		35
	db -1
	
TreeMonsKomore:
	db 50, MURKROW,		35
	db 15, EXEGGCUTE,	35
	db 15, EXEGGCUTE,	35
	db 10, DRIFLOON,	35
	db  5, DRIFLOON,	35
	db  5, DRIFLOON,	35
	db -1
	; rare
	db 50, MURKROW,		38
	db 15, EXEGGCUTE,	38
	db 15, EXEGGCUTE,	38
	db 10, DRIFLOON,	38
	db  5, DRIFLOON,	38
	db  5, DRIFLOON,	38
	db -1
	
TreeMonsBright:
	db 50, DITTO,		37
	db 15, PIDGEOTTO,	37
	db 15, PIDGEOTTO,	37
	db 10, PIDGEOTTO,	37
	db  5, PIDGEOTTO,	37
	db  5, PIDGEOTTO,	37
	db -1
	; rare
	db 50, DITTO,		40
	db 15, PIDGEOTTO,	40
	db 15, PIDGEOTTO,	40
	db 10, PIDGEOTTO,	40
	db  5, PIDGEOTTO,	40
	db  5, PIDGEOTTO,	40
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
