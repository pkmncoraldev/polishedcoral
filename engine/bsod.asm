BSOD:
	ld a, [hCGB]
	and a
	ret nz

	ld de, MUSIC_NONE
	call PlayMusic

	call ClearTileMap

	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld hl, .Palette
	ld de, wBGPals
	ld bc, 1 palettes
	rst CopyBytes
	pop af
	ld [rSVBK], a

	ld a, 1
	ld [hCGBPalUpdate], a

	xor a
	ld [hBGMapHalf], a
	call DelayFrame

	ld de, FontNormal
	ld hl, VTiles1
	lb bc, BANK(FontNormal), 111
	call Get2bpp

	ld de, .Message
	hlcoord 1, 1
	call PlaceString

	call ApplyTilemapInVBlank

.infiniteloop
	call DelayFrame
	jr .infiniteloop
; 4eac5

.Palette:
if !DEF(MONOCHROME)
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
else
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_BLACK
	RGB_MONOCHROME_WHITE
	RGB_MONOCHROME_WHITE
endc

.Message: ; 4eb38
	db   "      POKéMON"
	next "   CORAL VERSION  "
	next "    has CRASHED!  "
	next "------------------"
	next "Please report this"
	next "crash to coraldev."
	next "                  "
	next "                  @"
; 4eb76
