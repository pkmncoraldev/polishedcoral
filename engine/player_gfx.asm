GetPlayerIcon: ; 8832c
; Get the player icon corresponding to gender

	ld a, [wPlayerGender]
	cp CORY
	jr z, .cory
	cp CORA
	jr z, .cora
	cp PIPPI
	jr z, .pippi
	cp RED
	jr z, .red
	cp LEAF
	jr z, .leaf
	cp GOLD
	jr z, .gold
	cp KRIS
	jr z, .kris
	
.cory
	ld de, CorySpriteGFX
	ld b, BANK(CorySpriteGFX)
	ret
.cora
	ld de, CoraSpriteGFX
	ld b, BANK(CoraSpriteGFX)
	ret
.pippi
	ld de, PippiSpriteGFX
	ld b, BANK(PippiSpriteGFX)
	ret
.red
	ld de, RedSpriteGFX
	ld b, BANK(RedSpriteGFX)
	ret
.leaf
	ld de, LeafSpriteGFX
	ld b, BANK(LeafSpriteGFX)
	ret
.gold
	ld de, GoldSpriteGFX
	ld b, BANK(GoldSpriteGFX)
	ret
.kris
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)
	ret

GetCardPic: ; 8833e
	ld a, [wPlayerGender]
	cp PIPPI
	jr nz, .notpippi
	ld hl, PippiCardPic
	jr .GotClass
.notpippi
	ld hl, ChrisCardPic
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .GotClass
	ld hl, KrisCardPic
.GotClass:
	ld de, VTiles2 tile $00
	ld bc, $23 tiles
	ld a, BANK(ChrisCardPic) ; BANK(KrisCardPic)
	jp FarCopyBytes

ChrisCardPic: ; 88365
INCBIN "gfx/trainer_card/chris_card.5x7.2bpp"

KrisCardPic: ; 88595
INCBIN "gfx/trainer_card/kris_card.5x7.2bpp"

PippiCardPic:
INCBIN "gfx/trainer_card/pippi_card.5x7.2bpp"


GetPlayerBackpic: ; 88825
	ld a, [wPlayerGender]
	cp CORY
	jr z, .cory
	cp CORA
	jr z, .cora
	cp PIPPI
	jr z, .pippi
.cory
	ld hl, CoryBackpic
	jr .ok
.cora
	ld hl, CoraBackpic
	jr .ok
.pippi
	ld hl, PippiBackpic
	jr .ok
.ok
	ld de, VTiles2 tile $31
	lb bc, BANK(CoryBackpic), 6 * 6 ; dimensions
	predef DecompressPredef
	ret

CoryBackpic: ; 2ba1a
INCBIN "gfx/player/chris_back.6x6.2bpp.lz"

CoraBackpic: ; 88ed6
INCBIN "gfx/player/kris_back.6x6.2bpp.lz"

PippiBackpic: ; 2bbaa
INCBIN "gfx/battle/pippi_back.6x6.2bpp.lz"


HOF_LoadTrainerFrontpic: ; 88840
	call ApplyTilemapInVBlank
	xor a
	ld [hBGMapMode], a
	ld e, 0
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, 1

.GotClass:
	ld a, e
	ld [wTrainerClass], a
	ld a, [wPlayerGender]
	cp PIPPI
	jr nz, .notpippi
	ld de, PippiCardPic
	jr .GotPic
.notpippi
	ld de, ChrisCardPic
	ld a, [wPlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisCardPic

.GotPic:
	ld hl, VTiles2
	lb bc, BANK(ChrisCardPic), 5 * 7 ; BANK(KrisCardPic)
	call Get2bpp
	call ApplyTilemapInVBlank
	ld a, $1
	ld [hBGMapMode], a
	ret
