FarCall    EQU $08
Bankswitch EQU $10
AddNTimes  EQU $18
CopyBytes  EQU $20
JumpTable  EQU $28
Predef     EQU $30

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
	ld a, [hROMBank]
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
