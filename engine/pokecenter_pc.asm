PokemonCenterPC: ; 1559a
	eventflagcheck EVENT_YOU_CHEATED
	ret nz
	call PC_CheckPartyForPokemon
	ret c
	call PC_PlayBootSound
	ld hl, PokeCenterPCText_BootedUpPC
	call PC_DisplayText
	call WaitSFX
	ld hl, PokeCenterPCText_AccessWhosePC
	call PC_DisplayTextWaitMenu
	ld hl, .TopMenu
	call LoadMenuDataHeader
.loop
	xor a
	ld [wFlowerPileFlags], a
	ldh [hBGMapMode], a
	call .ChooseWhichPCListToUse
	ld [wWhichIndexSet], a
	call DoNthMenu
	jr c, .shutdown
	ld a, [wMenuSelection]
	ld hl, .JumpTable
	call MenuJumptable
	jr nc, .loop

.shutdown
	call PC_PlayShutdownSound
	call ExitMenu
	jp CloseWindow

.TopMenu:
	db $48 ; flags
	db 00, 00 ; start coords
	db 12, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $a0 ; flags
	db 0 ; items
	dw .WhichPC
	dw PlaceNthMenuStrings
	dw .JumpTable

.JumpTable:
	dw PlayersPC, .String_PlayersPC
	dw BillsPC, .String_BillsPC
	dw HallOfFamePC, .String_HallOfFame
	dw TurnOffPC, .String_TurnOff

.String_PlayersPC:  db "<PLAYER>'s PC@"
.String_BillsPC:    db "BILL's PC@"
.String_HallOfFame: db "HALL OF FAME@"
.String_TurnOff:    db "TURN OFF@"

.WhichPC:
	; before Hall Of Fame
	db  3 ; items
	db  1, 0, 3 ; bill's, player's, turn off
	db -1

	; postgame
	db  4 ; items
	db  1, 0, 2, 3 ; bill's, player's, oak's, turn off
	db -1

.ChooseWhichPCListToUse:
	ld a, [wHallOfFameCount]
	and a
	ld a, $0
	ret z
	ld a, $1
	ret
; 15650

PC_CheckPartyForPokemon: ; 15650
	ld a, [wPartyCount]
	and a
	ret nz
	ld de, SFX_CHOOSE_PC_OPTION
	call PlaySFX
	ld hl, .MustHavePokemonToUse
	call PC_DisplayText
	scf
	ret

.MustHavePokemonToUse:
	; Bzzzzt! You must have a #MON to use this!
	text_jump UnknownText_0x1c1328
	db "@"
; 0x15668

BillsPC: ; 15668
	ld a, [wTileset]
	cp TILESET_MALL_2
	jr z, MallPC
	call PC_PlayChoosePCSound
	ld hl, PokeCenterPCText_AccessedBillsPC
	call PC_DisplayText
	farcall _BillsPC
	and a
	ret
; 15679 (5:5679)

PlayersPC: ; 15679
	ld a, [wTileset]
	cp TILESET_MALL_2
	jr z, MallPC
	call PC_PlayChoosePCSound
	ld hl, PokeCenterPCText_AccessedOwnPC
	call PC_DisplayText
	ld b, $0
	call _PlayersPC
	and a
	ret
; 15689

HallOfFamePC: ; 1569a
	ld a, [wTileset]
	cp TILESET_MALL_2
	jr z, MallPC
	call PC_PlayChoosePCSound
	call FadeToMenu
	farcall _HallOfFamePC
	call CloseSubmenu
	and a
	ret
; 156ab

TurnOffPC: ; 156ab
	ld a, [wTileset]
	cp TILESET_MALL_2
	jr z, MallPC
	ld hl, PokeCenterPCText_LinkClosed
	call PrintText
	scf
	ret
; 156b3

MallPC:
	call PC_PlayChoosePCSoundMall
	ld hl, PokeCenterPCText_MallPC
	call PrintText
	scf
	ret

PC_PlayBootSound: ; 156b3
	ld de, SFX_BOOT_PC
	jr PC_WaitPlaySFX

PC_PlayShutdownSound: ; 156b8
	ld de, SFX_SHUT_DOWN_PC
	call PC_WaitPlaySFX
	jp WaitSFX

PC_PlayChoosePCSound: ; 156c2
	ld de, SFX_CHOOSE_PC_OPTION
	jr PC_WaitPlaySFX

PC_PlaySwapItemsSound: ; 156c7
	ld de, SFX_SWITCH_POKEMON
	call PC_WaitPlaySFX
	ld de, SFX_SWITCH_POKEMON

PC_PlayChoosePCSoundMall: ; 156c2
	ld de, SFX_READ_TEXT
	jr PC_WaitPlaySFX
	
PC_WaitPlaySFX: ; 156d0
	push de
	call WaitSFX
	pop de
	jp PlaySFX
; 156d9

_PlayerHousePC: ; 156d9
	call PC_PlayBootSound
	ld hl, UnknownText_0x156ff
	call PC_DisplayText
	ld b, $1
	call _PlayersPC
	and a
	jr nz, .asm_156f9
	call LoadMapPart
	call ApplyTilemap
	call UpdateSprites
	call PC_PlayShutdownSound
	ld c, $0
	ret

.asm_156f9
	call ClearBGPalettes
	ld c, $1
	ret
; 156ff

UnknownText_0x156ff: ; 0x156ff
	; turned on the PC.
	text_jump UnknownText_0x1c1353
	db "@"
; 0x15704

_PlayersPC: ; 15704
	ld a, b
	ld [wWhichIndexSet], a
	ld hl, UnknownText_0x157cc
	call PC_DisplayTextWaitMenu
	call Function15715
	jp ExitMenu
; 15715

Function15715: ; 15715
	xor a
	ld [wPCItemsCursor], a
	ld [wPCItemsScrollPosition], a
	ld hl, KrissPCMenuData
	call LoadMenuDataHeader
.asm_15722
	call UpdateTimePals
	ld a, [wFlowerPileFlags]
	ld [wMenuCursorBuffer], a
	call DoNthMenu
	jr c, .asm_15731
	call MenuJumptable
	jr nc, .asm_15722
	jr .asm_15732

.asm_15731
	xor a

.asm_15732
	jp ExitMenu
; 15736

KrissPCMenuData: ; 0x15736
	db %01000000
	db  0,  0 ; top left corner coords (y, x)
	db 12, 15 ; bottom right corner coords (y, x)
	dw .KrissPCMenuData2
	db 1 ; default selected option

.KrissPCMenuData2:
	db %10100000 ; bit7
	db 0 ; # items?
	dw .KrissPCMenuList1
	dw PlaceNthMenuStrings
	dw .KrissPCMenuPointers

.KrissPCMenuPointers: ; 0x15746
	dw KrisWithdrawItemMenu, .WithdrawItem
	dw KrisDepositItemMenu,  .DepositItem
	dw KrisTossItemMenu,     .TossItem
	dw KrisMailBoxMenu,      .MailBox
	dw KrisDecorationMenu,   .Decoration
	dw KrisLogOffMenu,       .LogOff
	dw KrisLogOffMenu,       .TurnOff

.WithdrawItem: db "WITHDRAW ITEM@"
.DepositItem:  db "DEPOSIT ITEM@"
.TossItem:     db "TOSS ITEM@"
.MailBox:      db "MAIL BOX@"
.Decoration:   db "DECORATION@"
.TurnOff:      db "TURN OFF@"
.LogOff:       db "LOG OFF@"

DEF WITHDRAW_ITEM EQU 0
DEF DEPOSIT_ITEM  EQU 1
DEF TOSS_ITEM     EQU 2
DEF MAIL_BOX      EQU 3
DEF DECORATION    EQU 4
DEF TURN_OFF      EQU 5
DEF LOG_OFF       EQU 6

.KrissPCMenuList1:
	db 4
	db WITHDRAW_ITEM
	db DEPOSIT_ITEM
	db TOSS_ITEM
;	db MAIL_BOX
	db TURN_OFF
	db -1
;.KrissPCMenuList2:
	db 5
	db WITHDRAW_ITEM
	db DEPOSIT_ITEM
	db TOSS_ITEM
;	db MAIL_BOX
	db DECORATION
	db LOG_OFF
	db -1

PC_DisplayTextWaitMenu: ; 157bb
	ld a, [wOptions1]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions1], a
	call MenuTextBox
	pop af
	ld [wOptions1], a
	ret
; 157cc

UnknownText_0x157cc: ; 0x157cc
	; What do you want to do?
	text_jump UnknownText_0x1c1368
	db "@"
; 0x157d1

KrisWithdrawItemMenu: ; 0x157d1
	farcall FadeOutPalettes
	ld a, [wMenuCursorY]
	ld [wFlowerPileFlags], a
	call LoadStandardMenuDataHeader
	farcall ClearPCItemScreen
	eventflagset EVENT_IN_PLAYERS_PC
	farcall LoadBlindingFlashPalette
	call ApplyAttrAndTilemapInVBlank
	call SetPalettes
.loop
	call PCItemsJoypad
	jr c, .quit
	call .Submenu
	jr .loop

.quit
	eventflagreset EVENT_IN_PLAYERS_PC
	call WaitSFX
	call CloseSubmenu
	xor a
	ret

.Submenu:
	; check if the item has a quantity
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .askquantity

	; items without quantity are always ×1
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	jr .withdraw

.askquantity
	ld hl, .HowManyText
	call MenuTextBox
	farcall SelectQuantityToToss
	call ExitMenu
	call ExitMenu
	ret c

.withdraw
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a ; quantity
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .PackFull
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumPCItems
	call TossItem
	predef PartyMonItemName
	ld hl, .WithdrewText
	call MenuTextBox
	xor a
	ldh [hBGMapMode], a
	jp ExitMenu

.PackFull:
	ld hl, .NoRoomText
	jp MenuTextBoxBackup

.HowManyText: ; 0x15850
	text_jump _KrissPCHowManyWithdrawText
	db "@"

.WithdrewText: ; 0x15855
	text_jump _KrissPCWithdrewItemsText
	db "@"

.NoRoomText: ; 0x1585a
	text_jump _KrissPCNoRoomWithdrawText
	db "@"

KrisTossItemMenu: ; 0x1585f
	farcall FadeOutPalettes
	ld a, [wMenuCursorY]
	ld [wFlowerPileFlags], a
	call LoadStandardMenuDataHeader
	farcall ClearPCItemScreen
	eventflagset EVENT_IN_PLAYERS_PC
	farcall LoadBlindingFlashPalette
	call ApplyAttrAndTilemapInVBlank
	call SetPalettes
.loop
	call PCItemsJoypad
	jr c, .quit
	ld de, wNumPCItems
	farcall TossItemFromPC
	jr .loop

.quit
	eventflagreset EVENT_IN_PLAYERS_PC
	call WaitSFX
	call CloseSubmenu
	xor a
	ret
; 0x1587d

KrisDecorationMenu: ; 0x1587d
	ld a, [wMenuCursorY]
	ld [wFlowerPileFlags], a
	farcall _KrisDecorationMenu
	ld a, c
	and a
	ret z
	scf
	ret
; 0x15888

KrisLogOffMenu: ; 0x15888
	xor a
	ld [wFlowerPileFlags], a
	scf
	ret
; 0x1588b

KrisDepositItemMenu: ; 0x1588b
	farcall FadeOutPalettes
	ld a, [wMenuCursorY]
	ld [wFlowerPileFlags], a
	call .CheckItemsInBag
	jr c, .nope
	call DisableSpriteUpdates
	call LoadStandardMenuDataHeader
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wcf66]
	and a
	jr z, .close
	call .TryDepositItem
	farcall CheckRegisteredItem
	jr .loop

.close
	call WaitSFX
	call CloseSubmenu

.nope
	xor a
	ret

.CheckItemsInBag:
	farcall HasNoItems
	ret nc
	ld hl, .NoItemsInBag
	call MenuTextBoxBackup
	scf
	ret

.NoItemsInBag:
	; No items here!
	text_jump UnknownText_0x1c13df
	db "@"

.TryDepositItem:
	ld a, [wCurrPocket]
	cp TM_HM - 1
	jr z, .CantDepositItem
	cp KEY_ITEM - 1
	jr z, .CantDepositItem
	ld a, [wSpriteUpdatesEnabled]
	push af
	xor a
	ld [wSpriteUpdatesEnabled], a
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .dw
	rst JumpTable
	pop af
	ld [wSpriteUpdatesEnabled], a
	ret

.CantDepositItem
	ld hl, .CantDepositItemText
	call PrintText
	ld [wSpriteUpdatesEnabled], a
	ret

.dw
	dw .tossable
	dw .no_toss
	dw .no_toss
	dw .no_toss
	dw .tossable
	dw .tossable
	dw .tossable

.tossable
	ld a, [wBuffer1]
	push af
	ld a, [wBuffer2]
	push af
	call .DepositItem_
	pop af
	ld [wBuffer2], a
	pop af
	ld [wBuffer1], a
.no_toss
	ret

.DepositItem_:
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .AskQuantity
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	jr .DepositItem

.AskQuantity:
	ld hl, .HowManyText
	call MenuTextBox
	farcall SelectQuantityToToss
	push af
	call ExitMenu
	call ExitMenu
	pop af
	jr c, .DeclinedToDeposit

.DepositItem:
	ld a, [wItemQuantityChangeBuffer]
	ld [wBuffer1], a
	ld a, [wCurItemQuantity]
	ld [wBuffer2], a
	ld hl, wNumPCItems
	call ReceiveItem
	jr nc, .NoRoomInPC
	ld a, [wBuffer1]
	ld [wItemQuantityChangeBuffer], a
	ld a, [wBuffer2]
	ld [wCurItemQuantity], a
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	ld hl, .DepositText
	jp PrintText

.NoRoomInPC:
	ld hl, .NoRoomText
	jp PrintText

.DeclinedToDeposit:
	and a
	ret

.CantDepositItemText:
	text_jump _KrissPCCantDepositItemText
	db "@"

.HowManyText: ; 0x1596e
	text_jump _KrissPCHowManyDepositText
	db "@"

.DepositText: ; 0x15973
	text_jump _KrissPCDepositItemsText
	db "@"

.NoRoomText: ; 0x15978
	text_jump _KrissPCNoRoomDepositText
	db "@"

KrisMailBoxMenu: ; 0x1597d
	farcall _KrisMailBoxMenu
	xor a
	ret
; 0x15985

PCItemsJoypad: ; 0x15985
	xor a
	ld [wSwitchItem], a
.loop
	ld a, [wSpriteUpdatesEnabled]
	push af
	xor a
	ld [wSpriteUpdatesEnabled], a
	ld hl, .PCItemsMenuData
	call CopyMenuDataHeader
	hlcoord 0, 0
	lb bc, 10, 18
	call TextBox
	ld a, [wPCItemsCursor]
	ld [wMenuCursorBuffer], a
	ld a, [wPCItemsScrollPosition]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wPCItemsScrollPosition], a
	ld a, [wMenuCursorY]
	ld [wPCItemsCursor], a
	pop af
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSwitchItem]
	and a
	jr nz, .moving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_1
	cp A_BUTTON
	jr z, .a_1
	cp SELECT
	jr z, .select_1
	jr .next

.moving_stuff_around
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_2
	cp A_BUTTON
	jr z, .a_select_2
	cp SELECT
	jr z, .a_select_2
	jr .next

.b_2
	xor a
	ld [wSwitchItem], a
	jr .next

.a_select_2
	call PC_PlaySwapItemsSound
.select_1
	farcall SwitchItemsInBag
.next
	jp .loop

.a_1
	farcall ScrollingMenu_ClearLeftColumn
	call PlaceHollowCursor
	and a
	ret

.b_1
	scf
	ret

.PCItemsMenuData:
	db %01000000
	db  1,  4 ; start coords
	db 10, 18 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db %10110000
	db 4, 8 ; rows/cols?
	db 2 ; horizontal spacing?
	dbw 0, wNumPCItems
	dba PlaceMenuItemName
	dba PlaceMenuItemQuantity
	dba UpdateItemDescription

PC_DisplayText: ; 15a20
	call MenuTextBox
	jp ExitMenu
; 15a27

PokeCenterPCText_BootedUpPC: ; 0x15a27
	; turned on the PC.
	text_jump UnknownText_0x1c144d
	db "@"
; 0x15a2c

PokeCenterPCText_AccessWhosePC: ; 0x15a2c
	; Access whose PC?
	text_jump UnknownText_0x1c1462
	db "@"
; 0x15a31

PokeCenterPCText_AccessedBillsPC: ; 0x15a31
	; BILL's PC accessed. #MON Storage System opened.
	text_jump UnknownText_0x1c1474
	db "@"
; 0x15a36

PokeCenterPCText_AccessedOwnPC: ; 0x15a36
	; Accessed own PC. Item Storage System opened.
	text_jump UnknownText_0x1c14a4
	db "@"
; 0x15a3b

PokeCenterPCText_AccessedOaksPC: ; 0x15a3b
	; PROF.OAK's PC accessed. #DEX Rating System opened.
	text_jump UnknownText_0x1c14d2
	db "@"
; 0x15a40

PokeCenterPCText_LinkClosed: ; 0x15a40
	; … Link closed…
	text_jump UnknownText_0x1c1505
	db "@"
; 0x15a45

PokeCenterPCText_MallPC: ; 0x15a36
	; Accessed own PC. Item Storage System opened.
	text_jump UnknownText_MallPC
	db "@"
