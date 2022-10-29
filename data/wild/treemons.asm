TreeMons:
	dw TreeMons1
	dw TreeMons2
	dw TreeMons3
	dw TreeMons4
	dw TreeMons5
	dw TreeMons6
	dw RockMons
	dw PetalMons

; Two tables each (normal, rare).
; Structure:
;	db  %, species, level

TreeMons1:
	db 50, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 10, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db -1
	; rare
	db 50, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 10, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db -1

TreeMons2:
	db 50, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 10, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db -1
	; rare
	db 50, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 10, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db -1

TreeMons3:
	db 50, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 10, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db -1
	; rare
	db 50, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 10, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db -1

TreeMons4:
	db 50, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 10, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db -1
	; rare
	db 50, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 10, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db -1

TreeMons5:
	db 50, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 10, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db -1
	; rare
	db 50, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 10, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db -1

TreeMons6:
	db 50, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 15, BULBASAUR,	10
	db 10, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db  5, BULBASAUR,	10
	db -1
	; rare
	db 50, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 15, CHARMANDER,	10
	db 10, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db  5, CHARMANDER,	10
	db -1

RockMons:
	db 70, BULBASAUR,	15
	db 30, BULBASAUR,	15
	db -1
	
PetalMons:
	db 50, VENIPEDE,	5
	db 25, PIKACHU,		5
	db 25, PIKACHU,		5
	db -1
