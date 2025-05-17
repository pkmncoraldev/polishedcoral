DEF FarCall    EQU $08
DEF Bankswitch EQU $10
DEF AddNTimes  EQU $18
DEF CopyBytes  EQU $20
DEF JumpTable  EQU $28
DEF Predef     EQU $30

macro anonbankpush
	call AnonBankPush
	db BANK(\1)
endm

macro farcall ; bank, address
	rst FarCall
	dbw BANK(\1), \1
endm

macro farjp ; bank, address
	rst FarCall
	dbw BANK(\1) | $80, \1
endm

macro homecall ; bank, address
	ldh a, [hROMBank]
	push af
if _NARG == 2
	ld a, \2
else
	ld a, BANK(\1)
endc
	rst Bankswitch
	call \1
	pop af
	rst Bankswitch
endm
