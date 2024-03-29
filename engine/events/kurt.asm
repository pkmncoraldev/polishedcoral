Kurt_PrintTextWhichApricorn: ; 88000
	ld hl, .Text
	jp PrintText
; 88007

.Text: ; 0x88007
	; Which APRICORN should I use?
	text_jump UnknownText_0x1bc06b
	db "@"
; 0x8800c

Kurt_PrintTextHowMany: ; 8800c
	ld hl, .Text
	jp PrintText
; 88013

.Text: ; 0x88013
	; How many should I make?
	text_jump UnknownText_0x1bc089
	db "@"
; 0x88018

Special_SelectApricornForKurt: ; 88018
	call LoadStandardMenuDataHeader
	ld c, $1
	xor a
	ld [wMenuScrollPosition], a
	ld [wKurtApricornQuantity], a
.loop
	push bc
	call Kurt_PrintTextWhichApricorn
	pop bc
	ld a, c
	ld [wMenuSelection], a
	call Kurt_SelectApricorn
	ld a, c
	ld [wScriptVar], a
	and a
	jr z, .done
	ld [wCurItem], a
	ld a, [wMenuCursorY]
	ld c, a
	push bc
	call Kurt_PrintTextHowMany
	call Kurt_SelectQuantity
	pop bc
	jr nc, .loop
	ld a, [wItemQuantityChangeBuffer]
	ld [wKurtApricornQuantity], a
	call Kurt_GiveUpSelectedQuantityOfSelectedApricorn

.done
	jp ExitMenu
; 88055

Kurt_SelectApricorn: ; 88055
	call Kurt_FindApricornsInBag
	jr c, .nope
	ld hl, .MenuDataHeader
	call CopyMenuDataHeader
	ld a, [wMenuSelection]
	ld [wMenuCursorBuffer], a
	xor a
	ld [hBGMapMode], a
	call InitScrollingMenu
	call UpdateSprites
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .nope
	ld a, [wMenuSelection]
	cp -1
	jr nz, .done

.nope
	xor a

.done
	ld c, a
	ret
; 88086

.MenuDataHeader: ; 0x88086
	db $40 ; flags
	db 01, 01 ; start coords
	db 10, 13 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x8808e

	db 0

.MenuData2: ; 0x8808f
	db $10 ; flags
	db 4, 7
	db 1
	dbw 0, wBuffer1
	dba .Name
	dba .Quantity
	dba NULL

.Name: ; 8809f
	ret
; 880ab

.Quantity: ; 880ab
	ret
; 880c2

Kurt_SelectQuantity: ; 880c2
	ld a, [wCurItem]
	ld [wMenuSelection], a
	call Kurt_GetQuantityOfApricorn
	jr z, .done
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
.loop
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call .PlaceApricornName
	call PlaceApricornQuantity
	call ApplyTilemap
	farcall BuySellToss_InterpretJoypad
	ld b, a
	jr nc, .loop

	push bc
	call PlayClickSFX
	pop bc
	ld a, b
	cp -1
	jr z, .done
	scf

.done
	jp CloseWindow
; 8810d

.MenuDataHeader: ; 0x8810d
	db $40 ; flags
	db 09, 06 ; start coords
	db 12, 19 ; end coords

.PlaceApricornName: ; 88116
	ret
; 88126

PlaceApricornQuantity: ; 88126
	call MenuBoxCoord2Tile
	ld de, 2 * SCREEN_WIDTH + 10
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
; 88139

Kurt_GetQuantityOfApricorn: ; 88139
	ret
; 88161

Kurt_GiveUpSelectedQuantityOfSelectedApricorn: ; 88161
	ret

Kurt_FindApricornsInBag: ; 24c64
	ret
