FontTiles::
FontNormal:
INCBIN "gfx/font/normal.2bpp"
FontCommon:
INCBIN "gfx/font/common.2bpp"
FontNormal1bpp:
INCBIN "gfx/font/normal.1bpp"
FontCommon1bpp:
INCBIN "gfx/font/common.1bpp"
FontCheckMark:
INCBIN "gfx/font/check.2bpp"
FontChinese:
INCBIN "gfx/font/chinese_text.2bpp"

Frames:
INCBIN "gfx/frames/1.2bpp"
INCBIN "gfx/frames/2.2bpp"
INCBIN "gfx/frames/3.2bpp"
INCBIN "gfx/frames/4.2bpp"
INCBIN "gfx/frames/5.2bpp"
INCBIN "gfx/frames/6.2bpp"
INCBIN "gfx/frames/7.2bpp"
INCBIN "gfx/frames/8.2bpp"
INCBIN "gfx/frames/9.2bpp"

FramesBattle:
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
INCBIN "gfx/frames/9.1bpp"

; Various misc graphics here.

PackArrowsGFX:
INCBIN "gfx/font/pack.2bpp"

BattleExtrasGFX:
INCBIN "gfx/battle/hpexpbars.2bpp"

GFX_Stats: ; f89b0
INCBIN "gfx/stats/stats.2bpp"
; f8ac0

StatusIconGFX:
INCBIN "gfx/battle/status.2bpp"

EnemyStatusIconGFX:
INCBIN "gfx/battle/status-enemy.2bpp"

TypeIconGFX:
INCBIN "gfx/battle/types.1bpp"

CategoryIconGFX:
INCBIN "gfx/battle/categories.2bpp"

TownMapGFX: ; f8ba0
INCBIN "gfx/town_map/town_map.2bpp.lz"
; f8ea4

TextBoxSpaceGFX:: ; f9204
INCBIN "gfx/frames/space.2bpp"

TextBoxSpace1bppGFX::
INCBIN "gfx/frames/space.1bpp"
; f9214

MapEntryFrameTownGFX:
INCBIN "gfx/frames/map_entry_sign_town.2bpp"

MapEntryFrameRouteGFX:
INCBIN "gfx/frames/map_entry_sign_route.2bpp"

MapEntryFrameCaveGFX:
INCBIN "gfx/frames/map_entry_sign_cave.2bpp"

MapEntryFrameForestGFX:
INCBIN "gfx/frames/map_entry_sign_forest.2bpp"

PaintingFrameGFX:
INCBIN "gfx/frames/painting.2bpp"

_LoadStandardOpaqueFont::
	ld a, TRUE
	call _LoadStandardMaybeOpaqueFont
	ld hl, VTiles2 tile " "
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	jp Get2bpp

_LoadCheckMark::
	ld de, FontCheckMark
	ld hl, VTiles0 tile "″"
	lb bc, BANK(FontCheckMark), 1
	jp Get2bpp

_LoadChineseFont::
	ld de, FontChinese + 1 tiles
	ld hl, VTiles0 tile $97
	lb bc, BANK(FontChinese), $55
	jp Get2bpp

_LoadStandardFont::
	xor a
_LoadStandardMaybeOpaqueFont:
	call LoadStandardFontPointer
	ld d, h
	ld e, l
	ld hl, VTiles0 tile "A"
	ld de, FontNormal
	lb bc, BANK(FontNormal), 111
	call Get2bpp
	eventflagcheck EVENT_FAKE_BATTLE_INTO
	ret nz
	ld de, FontCommon
	ld hl, VTiles0 tile "▷"
	lb bc, BANK(FontCommon), 10
	jp Get2bpp
	
_Load1bppFont::
	ld de, FontNormal1bpp
	ld hl, VTiles0 tile "A"
	lb bc, BANK(FontNormal1bpp), 111
	call Get1bpp
	ld de, FontCommon1bpp
	ld hl, VTiles0 tile "▷"
	lb bc, BANK(FontCommon1bpp), 10
	jp Get1bpp

_LoadHexFont::
	ld hl, VTiles0 tile "¥"
	ld de, FontNormal
	lb bc, BANK(FontNormal), 6
	jp Get2bpp

LoadStandardFontPointer::
	ld hl, .FontPointers
	ld a, [wOptions2]
	and FONT_MASK
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld h, d
	ld l, e
	ret

.FontPointers:
	dw FontNormal
	
LoadPackFont::
	xor a
	call LoadStandardFontPointer
	ld d, h
	ld e, l
	ld hl, VTiles0 tile "A"
	ld de, FontNormal
	lb bc, BANK(FontNormal), 107
	call Get2bpp
	ld de, PackArrowsGFX
	ld hl, VTiles0 tile "▲"
	lb bc, BANK(PackArrowsGFX), 15
	jp Get2bpp

_LoadFontsPackArrows:: ; fb4be
	ld hl, VTiles0 tile "▲"
	ld de, PackArrowsGFX
	lb bc, BANK(PackArrowsGFX), 12
	jp Get2bpp

_LoadFontsBattleExtra:: ; fb4be
	call LoadStandardFontPointer
	ld d, h
	ld e, l
	ld hl, VTiles0 tile "A"
	ld de, BattleExtrasGFX
	ld hl, VTiles2 tile BATTLEEXTRA_GFX_START
	lb bc, BANK(BattleExtrasGFX), 32
	call Get2bpp
	jp LoadFrame1bpp

LoadFrame:: ; fb4cc
	ld a, [wMapGroup]
	cp GROUP_FAKE_ROUTE_1
	jr nz, .normal
	ld a, 8
	jr .cont
.normal
	ld a, [wTextBoxFrame]
.cont
	ld bc, TILES_PER_FRAME * LEN_2BPP_TILE
	ld hl, Frames
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles0 tile "<UPDN>"
	lb bc, BANK(Frames), TILES_PER_FRAME
	call Get2bpp
	ld hl, VTiles2 tile " "
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	jp Get2bpp

LoadFrame1bpp:: ; fb4cc
	ld a, [wMapGroup]
	cp GROUP_FAKE_ROUTE_1
	jr nz, .normal
	ld a, 8
	jr .cont
.normal
	ld a, [wTextBoxFrame]
.cont
	ld bc, TILES_PER_FRAME * LEN_1BPP_TILE
	ld hl, FramesBattle
	rst AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles0 tile "<UPDN>"
	lb bc, BANK(FramesBattle), TILES_PER_FRAME
	call Get1bpp
	ld hl, VTiles2 tile " "
	ld de, TextBoxSpace1bppGFX
	lb bc, BANK(TextBoxSpace1bppGFX), 1
	jp Get1bpp

LoadBattleFontsHPBar: ; fb4f2
	call _LoadFontsBattleExtra

LoadStatusIcons:
	call LoadPlayerStatusIcon
	jp LoadEnemyStatusIcon

LoadPlayerStatusIcon:
	push de
	ld a, [wPlayerSubStatus2]
	ld de, wBattleMonStatus
	farcall GetStatusConditionIndex
	ld hl, StatusIconGFX
	ld de, 2 tiles
.loop
	and a
	jr z, .done
	add hl, de
	dec a
	jr .loop
.done
	ld d, h
	ld e, l
	ld hl, VTiles2 tile $55
	lb bc, BANK(StatusIconGFX), 2
	call Request2bpp
	farcall LoadPlayerStatusIconPalette
	pop de
	ret

LoadEnemyStatusIcon:
	push de
	ld a, [wEnemySubStatus2]
	ld de, wEnemyMonStatus
	farcall GetStatusConditionIndex
	ld hl, EnemyStatusIconGFX
	ld de, 2 tiles
.loop
	and a
	jr z, .done
	add hl, de
	dec a
	jr .loop
.done
	ld d, h
	ld e, l
	ld hl, VTiles2 tile $57
	lb bc, BANK(EnemyStatusIconGFX), 2
	call Request2bpp
	farcall LoadEnemyStatusIconPalette
	pop de
	ret

LoadStatsScreenGFX: ; fb53e
	call _LoadFontsBattleExtra

LoadStatsGFX: ; fb571
	ld de, GFX_Stats
	ld hl, VTiles2 tile $31
	lb bc, BANK(GFX_Stats), 14
	jp Get2bpp
; fb57e
