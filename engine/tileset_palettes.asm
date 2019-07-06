LoadBlindingFlashPalette:: ; 49409
	ld a, $5
	ld de, wUnknBGPals palette PAL_BG_TEXT
	ld hl, BlindingFlashPalette
	ld bc, 1 palettes
	jp FarCopyWRAM
; 49418

BlindingFlashPalette: ; 49418
if !DEF(MONOCHROME)
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
else
	MONOCHROME_RGB_FOUR
endc
; 49420

LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]
	cp TILESET_GLINT
	jp z, .outside
	cp TILESET_CAVE
	jr z, .cave
	cp TILESET_GROVE
	jp z, .grove
	jp .do_nothing
	
.outside
	ld a, [wMapGroup]
	cp GROUP_SUNSET_BAY
	jr z, .deepblueocean
	ld a, [hHours]
	cp 17 ; 5:00 PM to 5:59 PM = dusk
	jp nz, .do_nothing
	ld hl, OutsideDuskPalette
	jp LoadEightBGPalettes
	
.deepblueocean
	ld a, [wTimeOfDay]
	cp NITE
	jr z, .deepbluenite
	cp MORN
	jr z, .deepbluemorn
	ld a, [hHours]
	cp 17 ; 5:00 PM to 5:59 PM = dusk
	jr z, .deepbluedusk
	ld hl, OutsideDayDeepBluePalette
	jp LoadEightBGPalettes
	
.deepbluemorn
	ld hl, OutsideMornDeepBluePalette
	jp LoadEightBGPalettes
	
.deepbluenite
	ld hl, OutsideNitePalette
	jp LoadEightBGPalettes
	
.deepbluedusk
	ld hl, OutsideDuskPalette
	jp LoadEightBGPalettes
	
.cave
	ld hl, CavePalette
	jp LoadEightBGPalettes
	
.grove
	ld a, [wTimeOfDay]
	cp NITE
	jr z, .grovenite
	cp MORN
	jr z, .grovemorn
	ld a, [hHours]
	cp 17 ; 5:00 PM to 5:59 PM = dusk
	jr z, .grovedusk
	ld hl, OutsideDayGrovePalette
	jr LoadEightBGPalettes
	
.grovemorn
	ld hl, OutsideMornGrovePalette
	jr LoadEightBGPalettes
	
.grovenite
	ld hl, OutsideNiteGrovePalette
	jr LoadEightBGPalettes
	
.grovedusk
	ld hl, OutsideDuskGrovePalette
	jr LoadEightBGPalettes

.do_nothing
	and a
	ret
	
LoadEightBGPalettes: ; 494f2
	ld a, $5
	ld de, wUnknBGPals
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
	
MartBluePalette:
if !DEF(MONOCHROME)
	RGB 20, 27, 28
	RGB 06, 22, 25
	RGB 04, 17, 19
	RGB 07, 07, 07
else
	MONOCHROME_RGB_FOUR
endc

LinkTrade_Layout_FillBox: ; 49336
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 49346

InitLinkTradePalMap: ; 49856
	hlcoord 0, 0, wAttrMap
	lb bc, 16, 2
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	ldcoord_a 0, 1, wAttrMap
	ldcoord_a 0, 14, wAttrMap
	hlcoord 2, 0, wAttrMap
	lb bc, 8, 18
	ld a, $5
	call LinkTrade_Layout_FillBox
	hlcoord 2, 8, wAttrMap
	lb bc, 8, 18
	ld a, $6
	call LinkTrade_Layout_FillBox
	hlcoord 0, 16, wAttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, wAttrMap
	call LinkTrade_Layout_FillBox
	ld a, $2
	hlcoord 2, 16, wAttrMap
	ld [hli], a
	ld a, $7
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, wAttrMap
	ld a, $3
	ld bc, 6
	jp ByteFill
; 49811

LoadLinkTradePalette: ; 49811
	ret


LoadSpecialMapOBPalette:
	ret
	
OutsideMornDeepBluePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/deepblue/morndeepblue.pal"
	
OutsideDayDeepBluePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/deepblue/daydeepblue.pal"
	
OutsideDuskPalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/dusk.pal"

OutsideNitePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/nite.pal"

CavePalette:
INCLUDE "gfx/tilesets/palettes/cave.pal"

OutsideMornGrovePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/grove/morngrove.pal"

OutsideDayGrovePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/grove/daygrove.pal"

OutsideDuskGrovePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/grove/duskgrove.pal"

OutsideNiteGrovePalette:
INCLUDE "gfx/tilesets/palettes/outsidepals/grove/nitegrove.pal"
