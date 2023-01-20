	const_def
	const MARTTEXT_HOW_MANY
	const MARTTEXT_COSTS_THIS_MUCH
	const MARTTEXT_NOT_ENOUGH_MONEY
	const MARTTEXT_BAG_FULL
	const MARTTEXT_HERE_YOU_GO
	const MARTTEXT_SOLD_OUT

OpenMartDialog:: ; 15a45
	ld a, c
	ld [wEngineBuffer1], a
	call GetMart
	call LoadMartPointer
	ld a, [wEngineBuffer1]
	ld hl, .dialogs
	rst JumpTable
	ret
; 15a57

.dialogs
	dw MartDialog
	dw HerbShop
	dw RefreshmentsShop
	dw Pharmacist
	dw RooftopSale
	dw SilphMart
	dw AdventurerMart
	dw InformalMart
	dw BazaarMart
	dw TMMart
	dw BlueCardMart
	dw BTMart
	dw ElectronicsShop
	dw CoffeeShop
	dw StoneShop
	dw AntiqueShop
	dw ClothesShop
	dw BallShop
	dw BallShopDiscount
	dw FishMarket
	dw BerryMarket
	dw PasswordShop
	dw BuyOnly
; 15a61

MartDialog: ; 15a61
	xor a
	ld [wEngineBuffer1], a
	ld [wEngineBuffer5], a
	jp StandardMart
; 15a6e

BerryMarket:
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_BerryMarket_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_HerbShop_ComeAgain
	jp MartTextBox

HerbShop: ; 15a6e
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_HerbShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_HerbShop_ComeAgain
	jp MartTextBox
; 15a84

RefreshmentsShop: ; 15a84
	ld b, BANK(RefreshmentsShopData)
	ld de, RefreshmentsShopData
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_RefreshmentsShop_Intro
	call MartTextBox
	call BuyRefreshmentsMenu
	ld hl, Text_RefreshmentsShop_ComeAgain
	jp MartTextBox
; 15aae

INCLUDE "data/items/refreshments_shop.asm"

BallShop:
	ld b, BANK(BallShopData)
	ld de, BallShopData
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_BallMart_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_BallMart_ComeAgain
	jp MartTextBox
	
BallShopDiscount:
	ld b, BANK(BallShopDataDiscount)
	ld de, BallShopDataDiscount
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_InformalMart_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_InformalMart_ComeAgain
	jp MartTextBox

INCLUDE "data/items/ball_shop.asm"

ElectronicsShop: ; 15a6e
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_ElectronicsShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Mart_ComeAgain
	jp MartTextBox

CoffeeShop: ; 15a6e
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_CoffeeShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_CoffeeShop_ComeAgain
	jp MartTextBox

StoneShop: ; 15a6e
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_StoneShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_StoneShop_ComeAgain
	jp MartTextBox
	
AntiqueShop: ; 15a6e
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_AntiqueShop_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Mart_ComeAgain
	jp MartTextBox
	
ClothesShop: ; 15a6e
	call FarReadTMMart
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_Clothes_Intro
	call MartTextBox
	call BuyClothesMenu
	ld hl, Text_Mart_Clothes_ComeAgain
	jp MartTextBox

Pharmacist: ; 15aae
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_Pharmacist_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_Pharmacist_ComeAgain
	jp MartTextBox
; 15ac4

RooftopSale: ; 15ac4
	ld b, BANK(RooftopSaleData1) ; BANK(RooftopSaleData2)
	ld de, RooftopSaleData1
	ld hl, wStatusFlags
	bit 6, [hl] ; hall of fame
	jr z, .ok
	ld de, RooftopSaleData2
.ok
	call LoadMartPointer
	call ReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_HowMayIHelpYou
	call MartTextBox
	call BuyMenu
	ld hl, Text_Mart_ComeAgain
	jp MartTextBox
; 15aee

INCLUDE "data/items/rooftop_sale.asm"

SilphMart:
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_SilphMart_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_SilphMart_ComeAgain
	jp MartTextBox

AdventurerMart:
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_AdventurerMart_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_AdventurerMart_ComeAgain
	jp MartTextBox

InformalMart:
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_InformalMart_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_InformalMart_ComeAgain
	jp MartTextBox

BazaarMart:
	call FarReadMart
	call LoadStandardMenuDataHeader
	ld hl, Text_BazaarMart_Intro
	call MartTextBox
	call BuyMenu
	ld hl, Text_BazaarMart_ComeAgain
	jp MartTextBox

TMMart:
	call FarReadTMMart
	call LoadStandardMenuDataHeader
	ld hl, Text_TMMart_HowMayIHelpYou
	call MartTextBox
	call BuyTMMenu
	ld hl, Text_Mart_ComeAgain
	jp MartTextBox

BlueCardMart:
	ld b, BANK(BlueCardMartData)
	ld de, BlueCardMartData
	call LoadMartPointer
	call ReadBlueCardMart
	call LoadStandardMenuDataHeader
	ld hl, Text_BlueCardMart_HowMayIHelpYou
	call MartTextBox
	call BlueCardBuyMenu
	ld hl, Text_BlueCardMart_ComeAgain
	jp MartTextBox

INCLUDE "data/items/buena_prizes.asm"

BTMart:
	call FarReadBTMart
	call LoadStandardMenuDataHeader
	ld hl, Text_BTMart_HowMayIHelpYou
	call MartTextBox
	call BTBuyMenu
	ld hl, Text_BTMart_ComeAgain
	jp MartTextBox

LoadMartPointer: ; 15b10
	ld a, b
	ld [wMartPointerBank], a
	ld a, e
	ld [wMartPointer], a
	ld a, d
	ld [wMartPointer + 1], a
	ld hl, wCurMart
	xor a
	ld bc, wCurMartEnd - wCurMart
	call ByteFill
	xor a
	ld [wEngineBuffer5], a
	ld [wBargainShopFlags], a
	ld [wFacingDirection], a
	ret
; 15b31

GetMart: ; 15b31
	ld hl, Marts
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, BANK(Marts)
	ret
; 15b47

StandardMart: ; 15b47
.loop
	ld a, [wEngineBuffer5]
	ld hl, .MartFunctions
	rst JumpTable
	ld [wEngineBuffer5], a
	cp $ff
	jr nz, .loop
	ret

.MartFunctions:
	dw .HowMayIHelpYou
	dw .TopMenu
	dw .Buy
	dw .Sell
	dw .Quit
	dw .AnythingElse
; 15b62

.HowMayIHelpYou: ; 15b62
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_HowMayIHelpYou
	call PrintText
	ld a, $1 ; top menu
	ret
; 15b6e

.TopMenu: ; 15b6e
	ld hl, MenuDataHeader_BuySell
	call CopyMenuDataHeader
	call VerticalMenu
	jr c, .quit
	ld a, [wMenuCursorY]
	cp $1
	jr z, .buy
	cp $2
	jr z, .sell
.quit
	ld a, $4 ;  Come again!
	ret
.buy
	ld a, $2 ; buy
	ret
.sell
	ld a, $3 ; sell
	ret
; 15b8d

.Buy: ; 15b8d
	call ExitMenu
	call FarReadMart
	call BuyMenu
	and a
	ld a, $5 ; Anything else?
	ret
; 15b9a

.Sell: ; 15b9a
	call ExitMenu
	call SellMenu
	ld a, $5 ; Anything else?
	ret
; 15ba3

.Quit: ; 15ba3
	call ExitMenu
	ld hl, Text_Mart_ComeAgain
	call MartTextBox
	ld a, $ff ; exit
	ret
	
.AnythingElse: ; 15baf
	call LoadStandardMenuDataHeader
	ld hl, Text_Mart_AnythingElse
	call PrintText
	ld a, $1 ; top menu
	ret

FishMarket: ; 15b47
.loop
	ld a, [wEngineBuffer5]
	ld hl, .MartFunctions
	rst JumpTable
	ld [wEngineBuffer5], a
	cp $ff
	jr nz, .loop
	ret

.MartFunctions:
	dw .HowMayIHelpYou
	dw .TopMenu
	dw .Buy
	dw .Sell
	dw .Quit
	dw .AnythingElse
; 15b62

.HowMayIHelpYou: ; 15b62
	call LoadStandardMenuDataHeader
	ld hl, Text_FishMarket_Intro
	call PrintText
	ld a, $1 ; top menu
	ret
; 15b6e

.TopMenu: ; 15b6e
	ld hl, MenuDataHeader_BuySell
	call CopyMenuDataHeader
	call VerticalMenu
	jr c, .quit
	ld a, [wMenuCursorY]
	cp $1
	jr z, .buy
	cp $2
	jr z, .sell
.quit
	ld a, $4 ;  Come again!
	ret
.buy
	ld a, $2 ; buy
	ret
.sell
	ld a, $3 ; sell
	ret
; 15b8d

.Buy: ; 15b8d
	call ExitMenu
	call FarReadTMMart
	call BuyPokemonMenu
	and a
	ld a, $5 ; Anything else?
	ret
; 15b9a

.Sell: ; 15b9a
	call ExitMenu
.Sell2
	farcall SelectFishMarketSellMon
	jr c, .cancel
	ld a, [wCurPartySpecies]
	ld [wCurItem], a
	farcall GetFishMarketPrice
	ld a, [wScriptVar]
	cp FALSE
	jr z, .wrong
	
	ld a, [wPartyCount]
	cp 1
	jr z, .lastmon
	ld hl, Text_Mart_ICanPayThisMuch
	call PrintText
	call YesNoBox
	jr c, .cancel
	farcall Give_hMoneyTemp
	call PlayTransactionSound
	farcall RemoveMonFromPartyOrBox
	ld hl, Text_InformalMart_HereYouGo
	call PrintText
	call JoyWaitAorB
	ld a, $ff ; Anything else?
	ret
.lastmon
	ld hl, Text_FishMarket_Last_Mon
	call PrintText
	call JoyWaitAorB
	ld a, $ff ; Anything else?
	ret
.wrong
	ld hl, Text_FishMarket_Cant_Buy_That_Mon
	call MartTextBox
	jr .Sell2
	ret
.cancel
	ld a, $5 ; Anything else?
	ret

.Quit: ; 15ba3
	call ExitMenu
	ld hl, Text_InformalMart_HereYouGo
	call MartTextBox
	ld a, $ff ; exit
	ret

.AnythingElse: ; 15baf
	call LoadStandardMenuDataHeader
	ld hl, Text_FishMarket_AnythingElse
	call PrintText
	ld a, $1 ; top menu
	ret
; 15bbb

INCLUDE "data/items/coins_shop.asm"

PasswordShop: ; 15b47
	
	ld b, BANK(CoinsShopData)
	ld de, CoinsShopData
	call LoadMartPointer
	call ReadMart
	ld hl, Text_BrilloMartSecret1
	call MartTextBox
	ld hl, Text_BrilloMartSecret2
	call MartTextBox
	call BuyMenuCoins
	and a
	ret
	
BuyOnly:
	call FarReadMart
	call BuyMenu
	and a
	ret

FarReadMart: ; 15bbb
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wCurMart
.CopyMart:
	ld a, [wMartPointerBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp -1
	jr nz, .CopyMart
	ld hl, wMartItem1BCD
	ld de, wCurMart + 1
.ReadMartItem:
	ld a, [de]
	inc de
	cp -1
	ret z
	push de
	call GetMartItemPrice
	pop de
	jr .ReadMartItem
; 15be5

; FarReadTMMart needs to use GetFarByte from wMartPointerBank.
; ReadMart could just load from hl directly.
; But their structures are identical, so here they both use GetFarByte.
FarReadTMMart:
ReadMart: ; 15c25
; Load the mart pointer.  Mart data is local (no need for bank).
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
; set hl to the first item
	inc hl
	ld bc, wMartItem1BCD
	ld de, wCurMart + 1
.loop
; copy the item to wCurMart + (ItemIndex)
	ld a, [wMartPointerBank]
	call GetFarByte
	inc hl
	ld [de], a
	inc de
; -1 is the terminator
	cp -1
	jr z, .done

	push de
; copy the price to de
	ld a, [wMartPointerBank]
	call GetFarByte
	inc hl
	ld e, a
	ld a, [wMartPointerBank]
	call GetFarByte
	inc hl
	ld d, a
; convert the price to 3-byte BCD at [bc]
	push hl
	ld h, b
	ld l, c
	call GetMartPrice
	ld b, h
	ld c, l
	pop hl

	pop de
	jr .loop

.done
	pop hl
	ld a, [wMartPointerBank]
	call GetFarByte
	ld [wCurMart], a
	ret

; FarReadBTMart needs to use GetFarByte from wMartPointerBank.
; ReadBlueCardMart could just load from hl directly.
; But their structures are identical, so here they both use GetFarByte.
FarReadBTMart:
ReadBlueCardMart:
; Load the mart pointer.  Mart data is local (no need for bank).
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
; set hl to the first item
	inc hl
	ld bc, wMartItem1BCD
	ld de, wCurMart + 1
.loop
; copy the item to wCurMart + (ItemIndex)
	ld a, [wMartPointerBank]
	call GetFarByte
	inc hl
	ld [de], a
	inc de
; -1 is the terminator
	cp -1
	jr z, .done

; copy the point cost to [bc]
	ld a, [wMartPointerBank]
	call GetFarByte
	inc hl
	ld [bc], a

	inc bc
	jr .loop

.done
	pop hl
	ld a, [wMartPointerBank]
	call GetFarByte
	ld [wCurMart], a
	ret

GetMartItemPrice: ; 15be5
; Return the price of item a in BCD at hl and in tiles at wStringBuffer1.
	push hl
	ld [wCurItem], a
	farcall GetItemPrice
	pop hl

GetMartPrice: ; 15bf0
; Return price de in BCD at hl and in tiles at wStringBuffer1.
	push hl
	ld a, d
	ld [wStringBuffer2], a
	ld a, e
	ld [wStringBuffer2 + 1], a
	ld hl, wStringBuffer1
	ld de, wStringBuffer2
	lb bc, PRINTNUM_LEADINGZEROS | 2, 6 ; 6 digits
	call PrintNum
	pop hl

	ld de, wStringBuffer1
	ld c, 6 / 2 ; 6 digits
.loop
	call .CharToNybble
	swap a
	ld b, a
	call .CharToNybble
	or b
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 15c1a

.CharToNybble: ; 15c1a
	ld a, [de]
	inc de
	cp " "
	jr nz, .not_space
	ld a, "0"

.not_space
	sub "0"
	ret
; 15c25

BuyMenu: ; 15c62
	call BuyMenu_InitGFX
.loop
	call BuyMenuLoop ; menu loop
	jr nc, .loop
BuyMenu_Finish:
	call SFXDelay2
	call ReturnToMapWithSpeechTextbox
	and a
	ret
; 15c7d

BuyRefreshmentsMenu:
	call BuyMenu_InitGFX
.loop
	call BuyRefreshmentsMenuLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish
	
BuyPokemonMenu:
	call BuyMenu_InitGFX
.loop
	call BuyPokemonMenuLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish
	
BuyClothesMenu:
	call BuyMenu_InitGFX
.loop
	call BuyClothesMenuLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish

BuyTMMenu:
	call BuyMenu_InitGFX
.loop
	call BuyTMMenuLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish

BlueCardBuyMenu:
	call BuyMenu_InitGFX
.loop
	call BlueCardBuyMenuLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish

BTBuyMenu:
	call BuyMenu_InitGFX
.loop
	call BTBuyMenuLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish

BuyMenuCoins: ; 15c62
	call BuyMenu_InitGFX
.loop
	call BuyMenuCoinsLoop ; menu loop
	jr nc, .loop
	jr BuyMenu_Finish

BuyMenu_InitGFX::
	xor a
	ld [hBGMapMode], a
	farcall FadeOutPalettes
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableSpriteUpdates
	call DisableLCD
	call Load1bppFont
	call Load1bppFrame
	ld hl, PackLeftColumnGFX
	ld de, VTiles2 tile $15
	ld bc, 18 tiles
	ld a, BANK(PackLeftColumnGFX)
	call FarCopyBytes
; This is where the items themselves will be listed.
;	hlcoord 5, 3
;	lb bc, 9, 15
;	call ClearBox
; Place the text box for bag quantity
	hlcoord 0, 0
	lb bc, 1, 8
	call TextBox
; Place the left column
	hlcoord 0, 3
	ld de, .BuyLeftColumnTilemapString
	ld bc, SCREEN_WIDTH - 5
.loop
	ld a, [de]
	and a
	jr nz, .continue
	add hl, bc
	jr .next
.continue
	cp $ff
	jr z, .ok
	ld [hli], a
.next
	inc de
	jr .loop
.ok
; Place the textbox for displaying the item description
;	hlcoord 0, SCREEN_HEIGHT - 4 - 2
;	lb bc, 4, SCREEN_WIDTH - 2
;	call TextBox
	call EnableLCD
	call ApplyTilemapInVBlank
	ld b, CGB_BUYMENU_PALS
	call GetCGBLayout
	call SetPalettes
; Not graphics-related, but common to all BuyMenu_InitGFX callers
	xor a
	ld [wMenuScrollPositionBackup], a
	ld a, 1
	ld [wMenuCursorBufferBackup], a
	jp DelayFrame

.BuyLeftColumnTilemapString:
	db $15, $15, $15, $15, $15, 0
	db $15, $15, $15, $15, $15, 0
	db $15, $15, $15, $15, $15, 0
	db $15, $15, $15, $15, $15, 0
	db $16, $17, $17, $17, $18, 0
	db $19, $1e, $1f, $20, $1a, 0
	db $19, $21, $22, $23, $1a, 0
	db $19, $24, $25, $26, $1a, 0
	db $1b, $1c, $1c, $1c, $1d, -1

LoadBuyMenuText: ; 15c7d
; load text from a nested table
; which table is in wEngineBuffer1
; which entry is in register a
	push af
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText
; 15c91

MartAskPurchaseQuantity: ; 15c91
	ld a, [wCurItem]
	call GetMartDialogGroup ; gets a pointer from GetMartDialogGroup.MartTextFunctionPointers
	inc hl
	inc hl
	ld a, [hl]
	and a
	jp z, StandardMartAskPurchaseQuantity
	cp 1
	jp z, RefreshmentsShopAskPurchaseQuantity
	jp RooftopSaleAskPurchaseQuantity
; 15ca3

GetMartDialogGroup: ; 15ca3
	ld a, [wEngineBuffer1]
	ld e, a
	ld d, 0
	ld hl, .MartTextFunctionPointers
	add hl, de
	add hl, de
	add hl, de
	ret
; 15cb0

.MartTextFunctionPointers: ; 15cb0
	dwb .StandardMartPointers, 0
	dwb .HerbShopPointers, 0
	dwb .RefreshmentsShopPointers, 1
	dwb .PharmacyPointers, 0
	dwb .StandardMartPointers, 2
	dwb .SilphMartPointers, 0
	dwb .AdventurerMartPointers, 0
	dwb .InformalMartPointers, 0
	dwb .BazaarMartPointers, 0
	dwb .TMMartPointers, 0
	dwb .BlueCardMartPointers, 0
	dwb .BTMartPointers, 0
	dwb .StandardMartPointers, 0
	dwb .CoffeeShopPointers, 0
	dwb .StoneShopPointers, 0
	dwb .StandardMartPointers, 0
	dwb .ClothesMartPointers, 0
	dwb .StandardMartPointers, 2
	dwb .BallMartDiscountPointers, 2
	dwb .FishMarketPointers, 0
	dwb .BerryMarketPointers, 0
	dwb .CoinsMartPointers, 1
	dwb .StandardMartPointers, 0
; 15cbf

.StandardMartPointers: ; 15cbf
	dw Text_Mart_HowMany
	dw Text_Mart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyMenuLoop

.HerbShopPointers: ; 15ccb
	dw Text_HerbShop_HowMany
	dw Text_HerbShop_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyMenuLoop

.RefreshmentsShopPointers: ; 15cd7
	dw Text_RefreshmentsShop_HowMany
	dw Text_RefreshmentsShop_CostsThisMuch
	dw Text_RefreshmentsShop_InsufficientFunds
	dw Text_RefreshmentsShop_BagFull
	dw Text_RefreshmentsShop_HereYouGo
	dw BuyRefreshmentsMenuLoop

.PharmacyPointers: ; 15ce3
	dw Text_Pharmacy_HowMany
	dw Text_Pharmacy_CostsThisMuch
	dw Text_Pharmacy_InsufficientFunds
	dw Text_Pharmacy_BagFull
	dw Text_Pharmacy_HereYouGo
	dw BuyMenuLoop
; 15cef

.SilphMartPointers:
	dw Text_SilphMart_HowMany
	dw Text_SilphMart_CostsThisMuch
	dw Text_SilphMart_InsufficientFunds
	dw Text_SilphMart_BagFull
	dw Text_SilphMart_HereYouGo
	dw BuyMenuLoop

.AdventurerMartPointers:
	dw Text_AdventurerMart_HowMany
	dw Text_AdventurerMart_CostsThisMuch
	dw Text_AdventurerMart_InsufficientFunds
	dw Text_AdventurerMart_BagFull
	dw Text_AdventurerMart_HereYouGo
	dw BuyMenuLoop

.InformalMartPointers:
	dw Text_InformalMart_HowMany
	dw Text_InformalMart_CostsThisMuch
	dw Text_InformalMart_InsufficientFunds
	dw Text_InformalMart_BagFull
	dw Text_InformalMart_HereYouGo
	dw BuyMenuLoop

.BazaarMartPointers:
	dw Text_BazaarMart_HowMany
	dw Text_BazaarMart_CostsThisMuch
	dw Text_BazaarMart_InsufficientFunds
	dw Text_BazaarMart_BagFull
	dw Text_BazaarMart_HereYouGo
	dw BuyMenuLoop

.TMMartPointers:
	dw Text_Mart_HowMany
	dw Text_TMMart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyTMMenuLoop

.BlueCardMartPointers:
	dw BlueCardBuyMenuLoop
	dw Text_BlueCardMart_CostsThisMuch
	dw Text_BlueCardMart_InsufficientFunds
	dw Text_BlueCardMart_BagFull
	dw Text_BlueCardMart_HereYouGo
	dw BlueCardBuyMenuLoop

.BTMartPointers:
	dw Text_BTMart_HowMany
	dw Text_BTMart_CostsThisMuch
	dw Text_BTMart_InsufficientFunds
	dw Text_BTMart_BagFull
	dw Text_BTMart_HereYouGo
	dw BlueCardBuyMenuLoop
	
.CoffeeShopPointers:
	dw Text_Mart_HowMany
	dw Text_Mart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_CoffeeShop_HereYouGo
	dw BuyMenuLoop
	
.StoneShopPointers: ; 15cbf
	dw Text_Mart_HowMany
	dw Text_Mart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_StoneShop_HereYouGo
	dw BuyMenuLoop
	
.ClothesMartPointers:
	dw Text_Mart_HowMany
	dw Text_ClothesMart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyClothesMenuLoop
	
.BallMartDiscountPointers: ; 15cbf
	dw Text_InformalMart_HowMany
	dw Text_BallDiscount_CostsThisMuch
	dw Text_InformalMart_InsufficientFunds
	dw Text_InformalMart_BagFull
	dw Text_InformalMart_HereYouGo
	dw BuyMenuLoop

.FishMarketPointers: ; 15cbf
	dw Text_Mart_HowMany
	dw Text_ClothesMart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyPokemonMenuLoop
	
.BerryMarketPointers
	dw Text_HerbShop_HowMany
	dw Text_HerbShop_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyMenuLoop
	
.BrilloMartPointers
	dw Text_Mart_HowMany
	dw Text_Mart_CostsThisMuch
	dw Text_Mart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_Mart_HereYouGo
	dw BuyMenuCoinsLoop
	
.CoinsMartPointers
	dw Text_Mart_HowMany
	dw Text_CoinMart_CostsThisMuch
	dw Text_CoinMart_InsufficientFunds
	dw Text_Mart_BagFull
	dw Text_CoinMart_HereYouGo
	dw BuyMenuLoop

BuyMenuLoop: ; 15cef
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, MenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call MartAskPurchaseQuantity
	jr c, .cancel
	call MartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	call CompareMoney
	jp c, MartMenuLoop_InsufficientFunds
	ld hl, wNumItems
	call ReceiveItem
	jp nc, MartMenuLoop_InsufficientBagSpace
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld b, SET_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
	farcall CheckItemPocket
	ld a, [wItemAttributeParamBuffer]
	cp BALL
	jr nz, .cancel
	ld a, [wItemQuantityChangeBuffer]
	cp 10
	jr c, .cancel
	ld a, PREMIER_BALL
	ld [wCurItem], a
	ld a, [wItemQuantityChangeBuffer]
	ld c, 10
	call SimpleDivide
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .cancel
	ld hl, .PremierBallText
	call PrintText
	call WaitSFX
	ld de, SFX_LEVEL_UP
	call PlaySFX
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret

.PremierBallText
	text_jump MartPremierBallText
	db "@"
	
BuyMenuCoinsLoop: ; 15cef
	farcall Special_DisplayCoinCaseBalance
	call UpdateSprites
	ld hl, CoinsMenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call MartAskPurchaseQuantity
	jr c, .cancel
	call MartConfirmPurchase
	jr c, .cancel
	ld de, wCoins
	ld bc, hMoneyTemp + 1
	call CheckCoins
	jp c, MartMenuLoop_InsufficientFunds
	ld hl, wNumItems
	call ReceiveItem
	jp nc, MartMenuLoop_InsufficientBagSpace
	ld de, wCoins
	ld bc, hMoneyTemp + 1
	call TakeCoins
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall Special_DisplayCoinCaseBalance
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret

BuyRefreshmentsMenuLoop: ; 15cef
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, MenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call MartAskPurchaseQuantity
	jr c, .cancel
	call MartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	call CompareMoney
	jp c, MartMenuLoop_InsufficientFunds
	ld hl, wNumItems
	call ReceiveItem
	jp nc, MartMenuLoop_InsufficientBagSpace
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
	call Random
	cp $3f ; 25 percent
	jr nc, .cancel
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	ld hl, .ExtraItemText
	call PrintText
	call WaitSFX
	ld de, SFX_LEVEL_UP
	call PlaySFX
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret
	
.ExtraItemText
	text_jump RefreshmentsMartExtraItemText
	db "@"
	
BuyTMMenuLoop:
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, TMMenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call TMMartAskPurchaseQuantity
	jr c, .cancel
	call TMMartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	call CompareMoney
	jp c, MartMenuLoop_InsufficientFunds
	call ReceiveTMHM
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret

BlueCardBuyMenuLoop:
	farcall PlaceBlueCardPointsTopRight
	call UpdateSprites
	ld hl, BlueCardMenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call MartConfirmPurchase
	jr c, .cancel
	call BlueCardMartComparePoints
	jp c, MartMenuLoop_InsufficientFunds
	ld hl, wNumItems
	call ReceiveItem
	jp nc, MartMenuLoop_InsufficientBagSpace
	ld a, [wBlueCardBalance]
	ld hl, hMoneyTemp
	sub [hl]
	ld [wBlueCardBalance], a
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret

BTBuyMenuLoop:
	farcall PlaceBattlePointsTopRight
	call UpdateSprites
	ld hl, BTMenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call BTMartAskPurchaseQuantity
	jr c, .cancel
	call BTMartConfirmPurchase
	jr c, .cancel
	call BTMartCompareBP
	jp c, MartMenuLoop_InsufficientFunds
	ld hl, wNumItems
	call ReceiveItem
	jp nc, MartMenuLoop_InsufficientBagSpace
	ld a, [wBattlePoints]
	ld hl, hMoneyTemp + 2
	sub [hl]
	ld [wBattlePoints], a
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret

BuyClothesMenuLoop:
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, ClothesMenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call ClothesMartAskPurchaseQuantity
	jr c, .cancel
	call ClothesMartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	call CompareMoney
	jp c, MartMenuLoop_InsufficientFunds
	call ReceiveClothes
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
.cancel
	call SpeechTextBox
	and a
	ret
	
BuyPokemonMenuLoop: ; 15cef
	farcall PlaceMoneyTopRight
	call UpdateSprites
	ld hl, PokemonMenuDataHeader_Buy
	call CopyMenuDataHeader
	call DoMartScrollingMenu
	call SpeechTextBox
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jp z, MartMenuLoop_SetCarry
	call ClothesMartAskPurchaseQuantity
	jr c, .cancel
	call ClothesMartConfirmPurchase
	jr c, .cancel
	ld de, wMoney
	ld bc, hMoneyTemp
	call CompareMoney
	jp c, MartMenuLoop_InsufficientFunds
	ld de, wMoney
	ld bc, hMoneyTemp
	call TakeMoney
	ld a, MARTTEXT_HERE_YOU_GO
	call LoadBuyMenuText
	call PlayTransactionSound
	farcall PlaceMoneyTopRight
	call JoyWaitAorB
	
	ld a, 1
	ld [wPlaceBallsX], a
	
	ld a, [wCurItem]
	ld [wCurPartySpecies], a
	ld a, 5
	ld [wCurPartyLevel], a
	ld a, NO_ITEM
	ld [wCurItem], a
	ld a, 0
	and a
	ld b, a
	jr z, .ok
	ld hl, wScriptPos
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
	call GetScriptByte
.ok
	farcall GivePoke
	ld a, b
	ld [wScriptVar], a
	xor a
	ld [wPlaceBallsX], a
.cancel
	call SpeechTextBox
	and a
	ret
		
DoMartScrollingMenu:
	ld a, [wMenuCursorBufferBackup]
	ld [wMenuCursorBuffer], a
	ld a, [wMenuScrollPositionBackup]
	ld [wMenuScrollPosition], a
	call ScrollingMenu
	ld a, [wMenuScrollPosition]
	ld [wMenuScrollPositionBackup], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorBufferBackup], a
	ret

MartMenuLoop_InsufficientBagSpace:
	ld a, MARTTEXT_BAG_FULL
	jr MartMenuLoop_Continue

MartMenuLoop_InsufficientFunds:
	ld a, MARTTEXT_NOT_ENOUGH_MONEY
MartMenuLoop_Continue:
	call LoadBuyMenuText
	call JoyWaitAorB
	and a
	ret

MartMenuLoop_SetCarry:
	scf
	ret

StandardMartAskPurchaseQuantity:
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	farcall SelectQuantityToBuy
	jp ExitMenu
; 15d97

MartConfirmPurchase: ; 15d97
BTMartConfirmPurchase:
	predef PartyMonItemName
ClothesMartConfirmPurchase:
	ld a, MARTTEXT_COSTS_THIS_MUCH
	call LoadBuyMenuText
	jp YesNoBox
; 15da5

TMMartConfirmPurchase:
	ld a, [wCurTMHM]
	ld [wd265], a
	farcall GetTMHMName
	call CopyName1

	; off by one error?
	ld a, [wd265]
	inc a
	ld [wd265], a

	predef GetTMHMMove
	ld a, [wd265]
	ld [wPutativeTMHMMove], a
	call GetMoveName

	ld a, MARTTEXT_COSTS_THIS_MUCH
	call LoadBuyMenuText
	jp YesNoBox
	

;	ld a, MARTTEXT_COSTS_THIS_MUCH
;	call LoadBuyMenuText
;	jp YesNoBox

RefreshmentsShopAskPurchaseQuantity:
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld b, CHECK_FLAG
	ld hl, wBargainShopFlags
	call FlagAction
	ld a, c
	and a
	jr nz, .SoldOut
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld a, [hli]
	ld [hMoneyTemp + 2], a
	ld a, [hl]
	ld [hMoneyTemp + 1], a
	xor a
	ld [hMoneyTemp], a
	and a
	ret

.SoldOut:
	ld a, MARTTEXT_SOLD_OUT
	call LoadBuyMenuText
	call JoyWaitAorB
	scf
	ret
; 15de2

RooftopSaleAskPurchaseQuantity:
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
	call .GetSalePrice
	farcall RooftopSale_SelectQuantityToBuy
	jp ExitMenu
; 15df9

.GetSalePrice: ; 15df9
	ld a, [wMartItemID]
	ld e, a
	ld d, 0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	ret
; 15e0e

TMMartAskPurchaseQuantity:
	ld a, [wCurTMHM]
	call CheckTMHM
	jr c, .AlreadyHaveTM

	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld a, [hli]
	ld [hMoneyTemp + 2], a
	ld a, [hl]
	ld [hMoneyTemp + 1], a
	xor a
	ld [hMoneyTemp], a
	and a
	ret

.AlreadyHaveTM
	ld hl, .AlreadyHaveTMText
	call PrintText
	call JoyWaitAorB
	scf
	ret

.AlreadyHaveTMText
	text_jump AlreadyHaveTMText
	db "@"
	
ClothesMartAskPurchaseQuantity:
	ld a, [wCurTMHM]
	call CheckClothes
	jr c, .AlreadyHaveClothes

	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	add hl, de
	inc hl
	ld a, [hli]
	ld [hMoneyTemp + 2], a
	ld a, [hl]
	ld [hMoneyTemp + 1], a
	xor a
	ld [hMoneyTemp], a
	and a
	ret

.AlreadyHaveClothes
	ld hl, .AlreadyHaveClothesText
	call PrintText
	call JoyWaitAorB
	scf
	ret

.AlreadyHaveClothesText
	text_jump AlreadyHaveClothesText
	db "@"

BTMartAskPurchaseQuantity:
	ld a, MARTTEXT_HOW_MANY
	call LoadBuyMenuText
; store point cost in c
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	inc hl
	ld a, [hl]
	ld c, a
	ld [wBuffer2], a
	xor a
	ld [wBuffer1], a
; divide BP balance by cost to get maximum quantity
	ld a, [wBattlePoints]
	call SimpleDivide
	ld a, b
	and a
	jr nz, .ok
	ld a, 1
.ok
	ld [wItemQuantityBuffer], a
	farcall BT_SelectQuantityToBuy
	jp ExitMenu

BlueCardMartComparePoints:
; no need for a "BlueCardMartAskPurchaseQuantity"
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
; store point cost in [hMoneyTemp]
	ld a, [wMartItemID]
	ld e, a
	ld d, $0
	ld hl, wMartPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	add hl, de
	add hl, de
	inc hl
	ld a, [hl]
	ld [hMoneyTemp], a
; compare point balance with cost
	ld d, a
	ld a, [wBlueCardBalance]
	cp d
	ret

BTMartCompareBP:
; compare BP balance with cost
	ld a, [hMoneyTemp + 2]
	ld d, a
	ld a, [wBattlePoints]
	cp d
	ret
	
BrilloMartCompareCoins:
	ld a, [hMoneyTemp]
	ld d, a
	ld a, [wCoins]
	cp d
	ret

Text_Mart_HowMany: ; 0x15e0e
Text_BTMart_HowMany:
	; How many?
	text_jump UnknownText_0x1c4bfd
	db "@"
; 0x15e13

Text_Mart_CostsThisMuch: ; 0x15e13
Text_AdventurerMart_CostsThisMuch:
	; @ (S) will be ¥@ .
	text_jump UnknownText_0x1c4c08
	db "@"

Text_BallDiscount_CostsThisMuch:
	text_jump BallMartEmployeeDiscountText
	db "@"

MenuDataHeader_Buy: ; 0x15e18
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMartItemName
	dba MartMenu_PrintBCDPrices
	dba UpdateItemIconAndDescriptionAndBagQuantity
; 15e30

CoinsMenuDataHeader_Buy: ; 0x15e18
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMartItemName
	dba CoinMenu_PrintBCDPrices
	dba UpdateItemIconAndDescriptionAndBagQuantity

TMMenuDataHeader_Buy:
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMenuTMHMName
	dba MartMenu_PrintBCDPrices
	dba UpdateTMHMIconAndDescriptionAndOwnership
; 15e30

ClothesMenuDataHeader_Buy:
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMartClothesName
	dba MartMenu_PrintBCDPrices
	dba UpdateClothesIconAndDescriptionAndOwnership
	
PokemonMenuDataHeader_Buy:
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMartPokemonName
	dba MartMenu_PrintBCDPrices
	dba UpdateMonIconAndDescriptionAndOwnership

MartMenu_PrintBCDPrices: ; 15e30
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld b, 0
	ld hl, wMartItem1BCD
	add hl, bc
	add hl, bc
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
	ld c, PRINTNUM_LEADINGZEROS | PRINTNUM_MONEY | 3
	jp PrintBCDNumber

CoinMenu_PrintBCDPrices:
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld b, 0
	ld hl, wMartItem1BCD
	add hl, bc
	add hl, bc
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ld bc, SCREEN_WIDTH - 8
	add hl, bc
	ld c, PRINTNUM_LEADINGZEROS | 3
	call PrintBCDNumber
	ld de, .CoinsString
	jp PlaceString

.CoinsString:
	db " COINs@"
	
BlueCardMenuDataHeader_Buy:
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMartItemName
	dba .PrintPointCosts
	dba UpdateItemIconAndDescriptionAndBagQuantity

.PrintPointCosts:
	call GetCursorItemPointCost
	ld bc, SCREEN_WIDTH - 4
	add hl, bc
	lb bc, 1, 3
	call PrintNum
	ld de, .PointsString
	jp PlaceString

.PointsString:
	db " PTS.@"

BTMenuDataHeader_Buy:
	db $40 ; flags
	db 03, 06 ; start coords
	db 11, 19 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15e20

.menudata2 ; 0x15e20
	db $30 ; pointers
	db 4, 8 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wCurMart
	dba PlaceMartItemName
	dba .PrintPointCosts
	dba UpdateItemIconAndDescriptionAndBagQuantity

.PrintPointCosts:
	call GetCursorItemPointCost
	ld bc, SCREEN_WIDTH - 3
	add hl, bc
	lb bc, 1, 3
	call PrintNum
	ld de, .PointsString
	jp PlaceString

.PointsString:
	db " BP@"

GetCursorItemPointCost:
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld b, 0
	ld hl, wMartItem1BCD
	add hl, bc
	push de
	ld d, h
	ld e, l
	pop hl
	ret

Text_StoneShop_Intro:
	text_jump UnknownText_StoneShop_Intro
	db "@"
	
Text_StoneShop_ComeAgain:
	text_jump UnknownText_StoneShop_ComeAgain
	db "@"
	
Text_StoneShop_HereYouGo:
	text_jump UnknownText_StoneShop_HereYouGo
	db "@"
	
Text_AntiqueShop_Intro:
	text_jump UnknownText_AntiqueShop_Intro
	db "@"
	
Text_ElectronicsShop_Intro:
	text_jump UnknownText_ElectronicsShop_Intro
	db "@"
	
Text_BerryMarket_Intro:
	text_jump UnknownText_BerryMarket_Intro
	db "@"
	
Text_HerbShop_Intro: ; 0x15e4a
	; Hello, dear. I sell inexpensive herbal medicine. They're good, but a trifle bitter. Your #MON may not like them. Hehehehe…
	text_jump UnknownText_0x1c4c28
	db "@"
; 0x15e4f

Text_HerbShop_CostsThisMuch: ; 0x15e54
	; @ (S) will be ¥@ .
	text_jump UnknownText_0x1c4cae
	db "@"
; 0x15e59

Text_HerbShop_ComeAgain: ; 0x15e68
	; Come back anytime, sweetie.
	text_jump UnknownText_0x1c4d2a
	db "@"
; 0x15e6d

Text_RefreshmentsShop_Intro: ; 0x15e6d
	text_jump UnknownText_0x1c4d47
	db "@"
; 0x15e72

Text_RefreshmentsShop_CostsThisMuch: ; 0x15e72
	; costs ¥@ . Want it?
	text_jump UnknownText_0x1c4db0
	db "@"
; 0x15e77

Text_RefreshmentsShop_HereYouGo: ; 0x15e77
	text_jump UnknownText_0x1c4dcd2
	db "@"
	
Text_SilphMart_HereYouGo:
Text_AdventurerMart_HereYouGo:
Text_BazaarMart_HereYouGo:
	; Thanks.
	text_jump UnknownText_0x1c4dcd
	db "@"
; 0x15e7c

Text_RefreshmentsShop_BagFull: ; 0x15e7c
Text_AdventurerMart_BagFull:
	; Uh-oh, your PACK is chock-full.
	text_jump UnknownText_0x1c4dd6
	db "@"
; 0x15e81

Text_BargainShop_SoldOut: ; 0x15e81
	; You bought that already. I'm all sold out of it.
	text_jump UnknownText_0x1c4df7
	db "@"
; 0x15e86

Text_RefreshmentsShop_InsufficientFunds: ; 0x15e86
Text_AdventurerMart_InsufficientFunds:
	; Uh-oh, you're short on funds.
	text_jump UnknownText_0x1c4e28
	db "@"
; 0x15e8b

Text_RefreshmentsShop_ComeAgain: ; 0x15e8b
	; Come by again sometime.
	text_jump UnknownText_0x1c4e46
	db "@"
; 0x15e90

Text_Pharmacist_Intro: ; 0x15e90
	; What's up? Need some medicine?
	text_jump UnknownText_0x1c4e5f
	db "@"
; 0x15e95

Text_RefreshmentsShop_HowMany:
Text_HerbShop_HowMany: ; 0x15e4f
Text_Pharmacy_HowMany: ; 0x15e95
Text_SilphMart_HowMany:
Text_AdventurerMart_HowMany:
Text_InformalMart_HowMany:
Text_BazaarMart_HowMany:
	; How many?
	text_jump UnknownText_0x1c4e7e
	db "@"
; 0x15e9a

Text_Pharmacy_CostsThisMuch: ; 0x15e9a
Text_SilphMart_CostsThisMuch:
Text_InformalMart_CostsThisMuch:
Text_BazaarMart_CostsThisMuch:
	; @ (S) will cost ¥@ .
	text_jump UnknownText_0x1c4e89
	db "@"
; 0x15e9f

Text_FishMarket_Intro:
	text_jump UnknownText_FishMarket_Intro
	db "@"

Text_Pharmacy_HereYouGo: ; 0x15e9f
Text_InformalMart_HereYouGo:
	; Thanks much!
	text_jump UnknownText_0x1c4eab
	db "@"
	
Text_FishMarket_Cant_Buy_That_Mon:
	text_jump UnknownText_FishMarket_Cant_Buy_That_Mon
	db "@"

Text_CoffeeShop_HereYouGo:
	text_jump UnknownText_CoffeeShop_HereYouGo
	db "@"

Text_Pharmacy_BagFull: ; 0x15ea4
Text_SilphMart_BagFull:
Text_InformalMart_BagFull:
Text_BazaarMart_BagFull:
	; You don't have any more space.
	text_jump UnknownText_0x1c4eb9
	db "@"
; 0x15ea9

Text_Pharmacy_InsufficientFunds: ; 0x15ea9
Text_SilphMart_InsufficientFunds:
Text_InformalMart_InsufficientFunds:
Text_BazaarMart_InsufficientFunds:
	; Huh? That's not enough money.
	text_jump UnknownText_0x1c4ed8
	db "@"
; 0x15eae

Text_Pharmacist_ComeAgain: ; 0x15eae
Text_InformalMart_ComeAgain:
	; All right. See you around.
	text_jump UnknownText_0x1c4ef6
	db "@"

Text_BallMart_Intro:
	text_jump UnknownText_BallMart_Intro
	db "@"
	
Text_SilphMart_Intro:
	; Employees like me have access to company swag! Want to buy some?
	text_jump SilphMartIntroText
	db "@"

Text_SilphMart_ComeAgain:
	; Come again! I could use the side income.
	text_jump SilphMartComeAgainText
	db "@"

Text_AdventurerMart_Intro:
	; I picked up some rare items abroad!
	text_jump AdventurerMartIntroText
	db "@"

Text_AdventurerMart_ComeAgain:
Text_BazaarMart_ComeAgain:
Text_BallMart_ComeAgain:
	; Come by again!
	text_jump AdventurerMartComeAgainText
	db "@"

Text_InformalMart_Intro:
	; What's up? Need some supplies?
	text_jump InformalMartIntroText
	db "@"

Text_BazaarMart_Intro:
	; Come take a look at my wares!
	text_jump BazaarMartIntroText
	db "@"

Text_TMMart_CostsThisMuch:
	; @  @  will be ¥@ .
	text_jump TMMartCostsThisMuchText
	db "@"
	
Text_ClothesMart_CostsThisMuch:
	; That will be ¥@ .
	text_jump ClothesMartCostsThisMuchText
	db "@"

Text_BlueCardMart_HowMayIHelpYou: ; 0x8b072
	; Which prize would you like?
	text_jump UnknownText_0x1c589f
	db "@"
; 0x8b077

Text_BlueCardMart_CostsThisMuch: ; 0x8b077
	; ? Is that right?
	text_jump UnknownText_0x1c58bc
	db "@"
; 0x8b07c

Text_BlueCardMart_InsufficientFunds: ; 0x8b081
	; You don't have enough points.
	text_jump UnknownText_0x1c58e0
	db "@"
; 0x8b086

Text_BlueCardMart_BagFull: ; 0x8b086
	; You have no room for it.
	text_jump UnknownText_0x1c58ff
	db "@"
; 0x8b08b

Text_BlueCardMart_HereYouGo:
	; Here you go!
	text_jump UnknownText_0x1c58d1
	db "@"
; 0x8b081

Text_BlueCardMart_ComeAgain: ; 0x8b08b
	; Oh. Please come back again!
	text_jump UnknownText_0x1c591a
	db "@"
; 0x8b090

Text_BTMart_HowMayIHelpYou:
	; Welcome to the Exchange Service Corner! You can trade in your BP for prizes.
	text_jump BTMartHowMayIHelpYouText
	db "@"

Text_BTMart_CostsThisMuch:
	; @  @(s)  will cost @ BP.
	text_jump BTMartCostsThisMuchText
	db "@"

Text_BTMart_InsufficientFunds:
	; I'm sorry, but you don’t have enough BP.
	text_jump BTMartInsufficientFundsText
	db "@"

Text_BTMart_BagFull:
	; I'm sorry, but your Bag is full.
	text_jump BTMartBagFullText
	db "@"

Text_BTMart_ComeAgain:
	; Please come back any time you want!
	text_jump BTMartComeAgainText
	db "@"
	
Text_BrilloMartSecret1: ; 0x15e6d
	text_jump UnknownText_BrilloMartSecret1
	db "@"
	
Text_BrilloMartSecret2: ; 0x15e6d
	text_jump UnknownText_BrilloMartSecret2
	db "@"

SellMenu:: ; 15eb3
	call DisableSpriteUpdates
	farcall DepositSellInitPackBuffers
.loop
	farcall DepositSellPack
	ld a, [wcf66]
	and a
	jp z, .quit
	call .TryToSellItem
	jr .loop

.quit
	call SFXDelay2
	call ReturnToMapWithSpeechTextbox
	and a
	ret
; 15ed3

.TryToSellItem: ; 15ee0
	ld a, [wCurrPocket]
	cp TM_HM - 1
	jr z, .cant_sell_tm
	farcall CheckItemMenu
	ld a, [wItemAttributeParamBuffer]
	ld hl, .dw
	rst JumpTable
	ret
; 15eee

.dw ; 15eee
	dw .try_sell
	dw .cant_buy
	dw .cant_buy
	dw .cant_buy
	dw .try_sell
	dw .try_sell
	dw .try_sell
; 15efc

.try_sell ; 15efd
	farcall _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	and a
	jr z, .okay_to_sell
.cant_sell_tm
	ld hl, TextMart_CantBuyFromYou
	call PrintText
	and a
.cant_buy ; 15efc
	ret

.okay_to_sell
	ld hl, Text_Mart_SellHowMany
	call PrintText
	farcall PlaceMoneyAtTopLeftOfTextbox
	farcall SelectQuantityToSell
	call ExitMenu
	jr c, .declined
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, Text_Mart_ICanPayThisMuch
	call PrintTextBoxText
	call YesNoBox
	jr c, .declined
	ld de, wMoney
	ld bc, hMoneyTemp
	call GiveMoney
	ld a, [wMartItemID]
	ld hl, wNumItems
	call TossItem
	predef PartyMonItemName
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, Text_Mart_SoldForAmount
	call PrintTextBoxText
	call PlayTransactionSound
	farcall PlaceMoneyBottomLeft
	call JoyWaitAorB

.declined
	call ExitMenu
	and a
	ret
; 15f73

Text_Mart_SellHowMany: ; 0x15f73
	; How many?
	text_jump UnknownText_0x1c4f33
	db "@"
; 0x15f78

Text_Mart_ICanPayThisMuch: ; 0x15f78
	; I can pay you ¥@ . Is that OK?
	text_jump UnknownText_0x1c4f3e
	db "@"

Text_FishMarket_Last_Mon:
	text_jump UnknownText_FishMarket_Last_Mon
	db "@"

Text_Mart_HowMayIHelpYou: ; 0x15f83
	; Welcome! How may I help you?
	text_jump UnknownText_0x1c4f62
	db "@"
; 0x15f88

Text_TMMart_HowMayIHelpYou:
	text_jump UnknownText_TMMart_HowMayIHelpYou
	db "@"
	
Text_Mart_Clothes_Intro: ; 0x15f83
	text_jump UnknownText_Mart_Clothes_Intro
	db "@"
	
Text_Mart_Clothes_ComeAgain:
	text_jump UnknownText_Mart_Clothes_ComeAgain
	db "@"

MenuDataHeader_BuySell: ; 0x15f88
	db $40 ; flags
	db 00, 00 ; start coords
	db 08, 07 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15f90

.menudata2 ; 0x15f90
	db $80 ; strings
	db 3 ; items
	db "BUY@"
	db "SELL@"
	db "QUIT@"

MenuDataHeader_Secret: ; 0x15f88
	db $40 ; flags
	db 00, 00 ; start coords
	db 10, 09 ; end coords
	dw .menudata2
	db 1 ; default option
; 0x15f90

.menudata2 ; 0x15f90
	db $80 ; strings
	db 4 ; items
	db "BUY@"
	db "SELL@"
	db "COINS@"
	db "QUIT@"

Text_Mart_HereYouGo: ; 0x15fa0
Text_BTMart_HereYouGo:
	; Here you are. Thank you!
	text_jump UnknownText_0x1c4f80
	db "@"
; 0x15fa5

Text_CoinMart_HereYouGo:
	text_jump UnknownText_CoinMart_HereYouGo
	db "@"

Text_CoinMart_InsufficientFunds:
	text_jump UnknownText_CoinMart_InsufficientFunds
	db "@"
	
Text_CoinMart_CostsThisMuch:
	text_jump UnknownText_CoinMart_CostsThisMuch
	db "@"
	
Text_Mart_InsufficientFunds: ; 0x15fa5
	; You don't have enough money.
	text_jump UnknownText_0x1c4f9a
	db "@"
; 0x15faa

Text_Mart_BagFull: ; 0x15faa
	; You can't carry any more items.
	text_jump UnknownText_0x1c4fb7
	db "@"
; 0x15faf

TextMart_CantBuyFromYou: ; 0x15faf
	; Sorry, I can't buy that from you.
	text_jump UnknownText_0x1c4fd7
	db "@"
; 0x15fb4

Text_Mart_ComeAgain: ; 0x15fb4
Text_CoffeeShop_ComeAgain:
	; Please come again!
	text_jump UnknownText_0x1c4ff9
	db "@"
; 0x15fb9

Text_CoffeeShop_Intro:
	text_jump UnknownText_CoffeeShop_Intro
	db "@"

Text_Mart_AnythingElse: ; 0x15fb9
	text_jump UnknownText_0x1c500d
	db "@"
; 0x15fbe

Text_FishMarket_AnythingElse:
	text_jump UnknownText_FishMarket_AnythingElse
	db "@"

Text_Mart_SoldForAmount: ; 0x15fbe
	text_jump UnknownText_0x1c502e
	db "@"
; 0x15fc3

PlayTransactionSound: ; 15fc3
	call WaitSFX
	ld de, SFX_TRANSACTION
	jp PlaySFX
; 15fcd

MartTextBox: ; 15fcd
	call MenuTextBox
	call JoyWaitAorB
	jp ExitMenu
; 15fd7
