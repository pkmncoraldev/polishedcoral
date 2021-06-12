Special_BankOfMom: ; 16218
	call ATM_CheckCard
	ret c
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [wJumptableIndex], a
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call .RunJumptable
	jr .loop

.done
	pop af
	ld [hInMenu], a
	ret
; 16233

.RunJumptable: ; 16233
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 16242

.dw ; 16242

	dw .Start
	dw .BankMenu
	dw .StoreMoney
	dw .TakeMoney
	dw .Finish
	dw .BankMenu2
; 16254

.done2
	ld [wJumptableIndex], a
	ret
; 1626a

.Start: ; 16290
	ld de, SFX_BOOT_PC
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16658
	call PrintText
	call WaitSFX
	ld a, $1
	ld [wJumptableIndex], a
	ret
; 162a8

.BankMenu: ; 162a8
	ld hl, UnknownText_0x1665d
	jr .BankMenuCont
.BankMenu2:
	ld hl, UnknownText_0x1666c
.BankMenuCont:
	call PrintText
	call LoadStandardMenuDataHeader
	ld hl, MenuDataHeader_0x166b5
	call CopyMenuDataHeader
	call VerticalMenu
	call CloseWindow
	jr c, .cancel
	ld a, [wMenuCursorY]
	cp $1
	jr z, .withdraw
	cp $2
	jr z, .deposit

.cancel
	ld a, $4
	jr .done2

.withdraw
	ld a, $3
	jr .done2

.deposit
	ld a, $2
	jr .done2

.StoreMoney: ; 162e0
	ld de, SFX_CHOOSE_PC_OPTION
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16662
	call PrintText
	xor a
	ld hl, wStringBuffer2
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wcf64], a
	call LoadStandardMenuDataHeader
	call Mom_SetUpDepositMenu
	call WaitSFX
	call Mom_Wait10Frames
	call Mom_WithdrawDepositMenuJoypad
	call CloseWindow
	jp c, .CancelDeposit
	ld hl, wStringBuffer2
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .CancelDeposit
	ld de, wMoney
	ld bc, wStringBuffer2
	farcall CompareMoney
	jr c, .DontHaveThatMuchToDeposit
	ld hl, wStringBuffer2
	ld de, wStringBuffer2 + 3
	ld bc, 3
	rst CopyBytes
	ld bc, wMomsMoney
	ld de, wStringBuffer2
	farcall GiveMoney
	jr c, .CantDepositThatMuch
	ld bc, wStringBuffer2 + 3
	ld de, wMoney
	farcall TakeMoney
	ld hl, wStringBuffer2
	ld de, wMomsMoney
	ld bc, 3
	rst CopyBytes
	ld de, SFX_TRANSACTION
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x1668f
	call PrintText
	call WaitSFX
	ld c, 20
	call DelayFrames
	ld a, $5
	jp .done2

.DontHaveThatMuchToDeposit:
	ld de, SFX_WRONG
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x1667b
	call PrintText
	call WaitSFX
	ld c, 30
	jp DelayFrames

.CantDepositThatMuch:
	ld de, SFX_WRONG
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16680
	call PrintText
	call WaitSFX
	ld c, 30
	jp DelayFrames

.CancelDeposit:
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16653
	call PrintText
	call WaitSFX
	ld c, 30
	call DelayFrames
	ld a, $5
	jp .done2
; 16373

.TakeMoney: ; 16373
	ld de, SFX_CHOOSE_PC_OPTION
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16667
	call PrintText
	xor a
	ld hl, wStringBuffer2
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, $6
	ld [wcf64], a
	call LoadStandardMenuDataHeader
	call Mom_SetUpWithdrawMenu
	call WaitSFX
	call Mom_Wait10Frames
	call Mom_WithdrawDepositMenuJoypad
	call CloseWindow
	jr c, .CancelDeposit
	ld hl, wStringBuffer2
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr z, .CancelDeposit
	ld hl, wStringBuffer2
	ld de, wStringBuffer2 + 3
	ld bc, 3
	rst CopyBytes
	ld de, wMomsMoney
	ld bc, wStringBuffer2
	farcall CompareMoney
	jr c, .InsufficientFundsInBank
	ld bc, wMoney
	ld de, wStringBuffer2
	farcall GiveMoney
	jr c, .NotEnoughRoomInWallet
	ld bc, wStringBuffer2 + 3
	ld de, wMomsMoney
	farcall TakeMoney
	ld hl, wStringBuffer2
	ld de, wMoney
	ld bc, 3
	rst CopyBytes
	ld de, SFX_TRANSACTION
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x1668f
	call PrintText
	call WaitSFX
	ld c, 20
	call DelayFrames
	ld a, $5
	jp .done2

.InsufficientFundsInBank:
	ld de, SFX_WRONG
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16671
	call PrintText
	call WaitSFX
	ld c, 30
	jp DelayFrames

.NotEnoughRoomInWallet:
	ld de, SFX_WRONG
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16676
	call PrintText
	call WaitSFX
	ld c, 30
	jp DelayFrames
; 16406

.Finish:
	ld de, SFX_SHUT_DOWN_PC
	call ATM_WaitPlaySFX
	ld hl, UnknownText_0x16694
	call PrintText
	call WaitSFX
	ld c, 40
	call DelayFrames
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 16439

ATM_CheckCard:
	ld hl, wPokegearFlags
	bit 7, [hl]
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, .MustHavePokemonToUse
	call PC_DisplayText
	scf
	ret

.MustHavePokemonToUse:
	; Bzzzzt! You must have a #MON to use this!
	text_jump UnknownText_0x1c13282
	db "@"

ATM_WaitPlaySFX:
	push de
	call WaitSFX
	pop de
	jp PlaySFX

Mom_SetUpWithdrawMenu: ; 16512
	ld de, Mom_WithdrawString
	jr Mom_ContinueMenuSetup

Mom_SetUpDepositMenu: ; 16517
	ld de, Mom_DepositString

Mom_ContinueMenuSetup: ; 1651a
	push de
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 6, 18
	call TextBox
	hlcoord 1, 2
	ld de, Mom_SavedString
	call PlaceString
	hlcoord 11, 2
	ld de, wMomsMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	call PrintNum
	hlcoord 1, 4
	ld de, Mom_HeldString
	call PlaceString
	hlcoord 11, 4
	ld de, wMoney
	lb bc, PRINTNUM_MONEY | 3, 7
	call PrintNum
	hlcoord 1, 6
	pop de
	call PlaceString
	hlcoord 11, 6
	ld de, wStringBuffer2
	lb bc, PRINTNUM_MONEY | PRINTNUM_LEADINGZEROS | 3, 7
	call PrintNum
	call UpdateSprites
	jp CopyTilemapAtOnce
; 1656b

Mom_Wait10Frames: ; 1656b
	ld c, 10
	jp DelayFrames
; 16571

Mom_WithdrawDepositMenuJoypad: ; 16571
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call .dpadaction
	xor a
	ld [hBGMapMode], a
	hlcoord 11, 6
	ld bc, 8
	ld a, " "
	call ByteFill
	hlcoord 11, 6
	ld de, wStringBuffer2
	lb bc, PRINTNUM_MONEY | PRINTNUM_LEADINGZEROS | 3, 7
	call PrintNum
	ld a, [hVBlankCounter]
	and $10
	jr nz, .skip
	hlcoord 12, 6
	ld a, [wMomBankDigitCursorPosition]
	ld c, a
	ld b, 0
	add hl, bc
	ld [hl], " "

.skip
	call ApplyTilemapInVBlank
	jr .loop

.pressedB
	scf
	ret

.pressedA
	and a
	ret
; 165b9

.dpadaction ; 165b9
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .incrementdigit
	ld a, [hl]
	and D_DOWN
	jr nz, .decrementdigit
	ld a, [hl]
	and D_LEFT
	jr nz, .movecursorleft
	ld a, [hl]
	and D_RIGHT
	jr nz, .movecursorright
	and a
	ret

.movecursorleft
	ld hl, wMomBankDigitCursorPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.movecursorright
	ld hl, wMomBankDigitCursorPosition
	ld a, [hl]
	cp 6
	ret nc
	inc [hl]
	ret

.incrementdigit
	ld hl, .DigitQuantities
	call .getdigitquantity
	ld c, l
	ld b, h
	ld de, wStringBuffer2
	farjp GiveMoney

.decrementdigit
	ld hl, .DigitQuantities
	call .getdigitquantity
	ld c, l
	ld b, h
	ld de, wStringBuffer2
	farjp TakeMoney
; 16607

.getdigitquantity ; 16607
	ld a, [wMomBankDigitCursorPosition]
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	add hl, de
	pop de
	ret
; 16613

.DigitQuantities: ; 16613
	dt 1000000
	dt 100000
	dt 10000
	dt 1000
	dt 100
	dt 10
	dt 1

	dt 1000000
	dt 100000
	dt 10000
	dt 1000
	dt 100
	dt 10
	dt 1

	dt 9000000
	dt 900000
	dt 90000
	dt 9000
	dt 900
	dt 90
	dt 9
; 16649

UnknownText_0x16653: ; 0x16653
	text_jump UnknownText_0x1bd88e
	db "@"
; 0x16658

UnknownText_0x16658: ; 0x16658
	text_jump UnknownText_0x1bd8da
	db "@"
; 0x1665d

UnknownText_0x1665d: ; 0x1665d
	; What do you want to do?
	text_jump UnknownText_0x1bd942
	db "@"
; 0x16662

UnknownText_0x16662: ; 0x16662
	; How much do you want to save?
	text_jump UnknownText_0x1bd95b
	db "@"
; 0x16667

UnknownText_0x16667: ; 0x16667
	; How much do you want to take?
	text_jump UnknownText_0x1bd97a
	db "@"
; 0x1666c

UnknownText_0x1666c: ; 0x1666c
	text_jump UnknownText_0x1bd999
	db "@"
; 0x16671

UnknownText_0x16671: ; 0x16671
	; You haven't saved that much.
	text_jump UnknownText_0x1bd9ba
	db "@"
; 0x16676

UnknownText_0x16676: ; 0x16676
	; You can't take that much.
	text_jump UnknownText_0x1bd9d7
	db "@"
; 0x1667b

UnknownText_0x1667b: ; 0x1667b
	; You don't have that much.
	text_jump UnknownText_0x1bd9f1
	db "@"
; 0x16680

UnknownText_0x16680: ; 0x16680
	; You can't save that much.
	text_jump UnknownText_0x1bda0b
	db "@"
; 0x16685

UnknownText_0x16685: ; 0x16685
	; OK, I'll save your money. Trust me! , stick with it!
	text_jump UnknownText_0x1bda25
	db "@"
; 0x1668a

UnknownText_0x1668a: ; 0x1668a
	; Your money's safe here! Get going!
	text_jump UnknownText_0x1bda5b
	db "@"
; 0x1668f

UnknownText_0x1668f: ; 0x1668f
	text_jump UnknownText_0x1bda7e
	db "@"
; 0x16694

UnknownText_0x16694: ; 0x16694
	text_jump UnknownText_0x1bda90
	db "@"
; 0x16699

Mom_SavedString: ; 16699
	db "BANK@"
; 1669f

Mom_WithdrawString: ; 1669f
	db "WITHDRAW@"
; 166a8

Mom_DepositString: ; 166a8
	db "DEPOSIT@"
; 166b0

Mom_HeldString: ; 166b0
	db "POCKET@"
; 166b5

MenuDataHeader_0x166b5: ; 0x166b5
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 10 ; end coords
	dw MenuData2_0x166bd
	db 1 ; default option
; 0x166bd

MenuData2_0x166bd: ; 0x166bd
	db $80 ; flags
	db 3 ; items
	db "WITHDRAW@"
	db "DEPOSIT@"
	db "CANCEL@"
; 0x166d6
