_ReplaceKrisSprite:: ; 14135
	call GetPlayerSprite
	ld a, [wPlayerSprite]
	ld [hUsedSpriteIndex], a
	xor a
	ld [hUsedSpriteTile], a
	ld hl, wSpriteFlags
	res 5, [hl]
	jp GetUsedSpritePlayer
; 14146

GetPlayerSprite: ; 14183
; Get Chris or Kris's sprite.
;	ld hl, .Chris
;	ld a, [wPlayerSpriteSetupFlags]
;	bit 2, a
;	jr nz, .go
	call CheckExtendedSpace
	ld a, [wPlayerGender]
	cp CORY
	jr z, .loadcory
	cp CORA
	jr z, .loadcora
	cp PIPPI
	jr z, .loadpippi
	cp RED
	jr z, .loadred
	cp LEAF
	jr z, .loadleaf
	cp GOLD
	jr z, .loadgold
	cp KRIS
	jr z, .loadkris
	
.loadcory
	ld hl, .Cory
	jr .go
	
.loadcora
	ld hl, .Cora
	jr .go
	
.loadpippi
	ld hl, .Pippi
	jr .go
	
.loadred
	ld hl, .Red
	jr .go
	
.loadleaf
	ld hl, .Leaf
	jr .go
	
.loadgold
	ld hl, .Gold
	jr .go
	
.loadkris
	ld hl, .Kris

.go
	ld a, [wPlayerState]
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr z, .good
	inc hl
	cp $ff
	jr nz, .loop

; Any player state not in the array defaults to Chris's sprite.
	ld a, [wPlayerState]
	cp $fe
	jr z, .skip
	xor a ; ld a, PLAYER_NORMAL
	ld [wPlayerState], a
.skip
	ld a, SPRITE_GENERAL_VARIABLE_1
	jr .finish

.good
	ld a, [hl]

.finish
	ld [wPlayerSprite], a
	ld [wPlayerObjectSprite], a
	ret

.Cory:
	db PLAYER_NORMAL,    PLAYER_SPRITE_CORY
	db PLAYER_BIKE,      PLAYER_SPRITE_CORY_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_CORY_SURF
	db PLAYER_DIVE, 	 PLAYER_SPRITE_CORY_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_CORY_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_CORY_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_CORY_MISC
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORY_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORY_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORY_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORY_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff
	
.Cora:
	db PLAYER_NORMAL,    PLAYER_SPRITE_CORA
	db PLAYER_BIKE,      PLAYER_SPRITE_CORA_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_CORA_SURF
	db PLAYER_DIVE, 	 PLAYER_SPRITE_CORA_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_CORA_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_CORA_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_CORA_MISC
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORA_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORA_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORA_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORA_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORA_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORA_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff

.Pippi:
	db PLAYER_NORMAL,    PLAYER_SPRITE_PIPPI
	db PLAYER_BIKE,      PLAYER_SPRITE_PIPPI_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_PIPPI_SURF
	db PLAYER_DIVE, 	 PLAYER_SPRITE_PIPPI_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_PIPPI_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_PIPPI_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_PIPPI
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORY_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORY_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORY_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORY_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff
	
.Red:
	db PLAYER_NORMAL,    PLAYER_SPRITE_RED
	db PLAYER_BIKE,      PLAYER_SPRITE_RED_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_RED_SURF
	db PLAYER_DIVE, 	 PLAYER_SPRITE_RED_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_RED_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_RED_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_RED_MISC
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORY_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORY_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORY_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORY_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff
	
.Leaf:
	db PLAYER_NORMAL,    PLAYER_SPRITE_LEAF
	db PLAYER_BIKE,      PLAYER_SPRITE_LEAF_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_LEAF_SURF
	db PLAYER_DIVE,		 PLAYER_SPRITE_LEAF_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_LEAF_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_LEAF_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_LEAF_MISC
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORA_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORA_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORA_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORA_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORA_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORA_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff
	
.Gold:
	db PLAYER_NORMAL,    PLAYER_SPRITE_GOLD
	db PLAYER_BIKE,      PLAYER_SPRITE_GOLD_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_GOLD_SURF
	db PLAYER_DIVE, 	 PLAYER_SPRITE_GOLD_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_GOLD_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_GOLD_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_GOLD_MISC
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORY_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORY_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORY_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORY_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORY_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff
	
.Kris:
	db PLAYER_NORMAL,    PLAYER_SPRITE_KRIS
	db PLAYER_BIKE,      PLAYER_SPRITE_KRIS_BIKE
	db PLAYER_SURF,      PLAYER_SPRITE_KRIS_SURF
	db PLAYER_DIVE, 	 PLAYER_SPRITE_KRIS_DIVE
	db PLAYER_RUN,       PLAYER_SPRITE_KRIS_RUN
	db PLAYER_SURF_LAVA, PLAYER_SPRITE_KRIS_SURF
	db PLAYER_DODRIO,	 PLAYER_SPRITE_DODRIO_RUN
	db PLAYER_SITTING,   PLAYER_SPRITE_KRIS_MISC
	db PLAYER_SKATEBOARD,	PLAYER_SPRITE_CORA_SKATEBOARD
	db PLAYER_SKATEBOARD_MOVING,	PLAYER_SPRITE_CORA_SKATEBOARD_2
	db PLAYER_SKATEBOARD_GRINDING,	PLAYER_SPRITE_CORA_SKATEBOARD_GRINDING
	db PLAYER_FALLING,	PLAYER_SPRITE_CORA_SKATEBOARD_FALLING
	db PLAYER_BATHING,	PLAYER_SPRITE_CORA_BATHING
	db PLAYER_SAND,	PLAYER_SPRITE_CORA_BATHING
	db PLAYER_CLOWN,    PLAYER_SPRITE_CLOWN
	db PLAYER_SCIENTIST,	PLAYER_SPRITE_SCIENTIST
	db PLAYER_COLBY,	PLAYER_SPRITE_COLBY
	db $ff

; 141c9


MapCallbackSprites_LoadUsedSpritesGFX: ; 14209
	ld a, MAPCALLBACK_SPRITES
	call RunMapCallback
ReloadVisibleSprites::
	push hl
	push de
	push bc
	call GetPlayerSprite
	xor a
	ld [hUsedSpriteIndex], a
	call ReloadSpriteIndex
	call LoadEmoteGFX
	pop bc
	pop de
	pop hl
	ret

ReloadSpriteIndex::
; Reloads sprites using hUsedSpriteIndex.
; Used to reload variable sprites
	ld hl, wObjectStructs
	ld de, OBJECT_STRUCT_LENGTH
	ld a, [hUsedSpriteIndex]
	ld b, a
	xor a
	ld [wMoogoo], a
.loop
	ld [hObjectStructIndexBuffer], a
	ld a, [hl]
	and a
	jr z, .done
	bit 7, b
	jr z, .continue
	cp b
	jr nz, .done
.continue
	push hl
	; hl points to an object_struct; we want bc to point to a map_object,
	; to get the radius (actually the SPRITE_MON_ICON species).
	push bc
	ld bc, OBJECT_RADIUS - MAPOBJECT_RADIUS
	add hl, bc
	ld b, h
	ld c, l
	push af
	ld a, [wMoogoo]
	and a
	jr nz, .not_player
	pop af
	call GetSpriteVTilePlayer
	jr .cont
.not_player
	pop af
	call GetSpriteVTile
.cont
	pop bc
	pop hl
	push hl
	inc hl ; skip OBJECT_SPRITE
	inc hl ; skip OBJECT_MAP_OBJECT_INDEX
	ld [hl], a ; OBJECT_SPRITE_TILE
	pop hl
.done
	add hl, de
	ld a, [wMoogoo]
	inc a
	ld [wMoogoo], a
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

GetSpriteVTilePlayer:: ; 180e
	push hl
	push de
	push bc
	ld [hUsedSpriteIndex], a
	push bc
	farcall GetSpritePlayer
	pop bc
	ld hl, wSpriteFlags
	res 5, [hl]
	; SPRITE_BIG_GYARADOS and SPRITE_SAILBOAT use the last object_struct
	; (SPRITE_BIG_GYARADOS has more than 12 tiles, and SPRITE_SAILBOAT
	; needs to be in VRAM1)
	ld a, [hUsedSpriteIndex]
	ld a, [hObjectStructIndexBuffer]
	cp FIRST_VRAM1_OBJECT_STRUCT
	jr c, .continue
	set 5, [hl]
	sub FIRST_VRAM1_OBJECT_STRUCT
.continue
	add a, a
	add a, a
	ld d, a
	add a, d
	add a, d
	ld [hUsedSpriteTile], a
	push af
	farcall GetUsedSpritePlayer
	pop af
	ld d, a
	xor a
	ld a, d
	ld hl, wSpriteFlags
	bit 5, [hl]
	jr nz, .using_vbk1
	or $80
.using_vbk1
	pop bc
	pop de
	pop hl
	ret

LoadEmoteGFX::
	ld a, [wSpriteFlags]
	bit 6, a
	ret nz

	ld c, EMOTE_SHADOW
	call LoadEmote
	ld a, [wTileset]
	cp TILESET_SUNSET
	jp z, .outdoor
	cp TILESET_GLINT
	jp z, .outdoor
	cp TILESET_STARGLOW
	jp z, .outdoor
	cp TILESET_JUNGLE
	jp z, .outdoor
	cp TILESET_SPOOKY
	jp z, .outdoor
	cp TILESET_SNOW
	jp z, .snow
	cp TILESET_SHIMMER
	jp z, .flowers
	cp TILESET_DESERT
	jp z, .desert
	cp TILESET_PLAYER_HOUSE
	jp z, .playerhouse
	call GetMapPermission
	call CheckOutdoorMapOrPerm5
	jr z, .outdoor
	ld c, EMOTE_BOULDER_DUST
	jp LoadEmote

.playerhouse
	ld c, EMOTE_PUDDLE_SPLASH_2
	jp LoadEmote
	
.flowers
	ld c, EMOTE_POLLEN_PUFF
	call LoadEmote
.outdoor
	ld c, EMOTE_SHAKING_GRASS
	call LoadEmote
	ld c, EMOTE_PUDDLE_SPLASH
	jp LoadEmote
; 14236
.desert
	ld a, [wMapNumber]
	cp MAP_DESERT_WASTELAND_OASIS
	jr z, .outdoor
.snow
	ld c, EMOTE_SHAKING_SNOW
	call LoadEmote
	ld c, EMOTE_PUDDLE_SPLASH
	jp LoadEmote


SafeGetSprite: ; 14236
	push hl
	call GetSprite
	pop hl
	ret
; 1423c

GetSprite:: ; 1423c
	call GetMonSprite
	ret c

	ld hl, SpriteHeaders ; address
	dec a
	ld c, a
	ld b, 0
	ld a, NUM_SPRITEHEADER_FIELDS
	rst AddNTimes
	; load the address into de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; load the sprite bank into both b and h
	ld a, [hli]
	ld b, a
	; load the sprite type into l
	ld l, [hl]
	ld h, a
	; load the length into c
	ld c, 15
	ld a, l
	cp BIG_MUK_SPRITE
	jr z, .muk
	cp BIG_GYARADOS_SPRITE
	ret z
	ld c, 12
	ret
.muk
	ld c, 17
	ret

GetUsedSpritePlayer:: ; 143c8
	ld a, [hUsedSpriteIndex]
	call SafeGetSpritePlayer
	ld a, [hUsedSpriteTile]
	call .GetTileAddr
	push hl
	push de
	push bc
	ld a, [wSpriteFlags]
	bit 7, a
	jr nz, .skip
	call .CopyToVram

.skip
	pop bc
	ld l, c
	ld h, $0
rept 4
	add hl, hl
endr
	pop de
	add hl, de
	ld d, h
	ld e, l
	pop hl

	ld a, [wSpriteFlags]
	bit 6, a
	ret nz

	ld a, [hUsedSpriteIndex]
	call _DoesSpriteHaveFacings
	ret c

	ld a, [wSpriteFlags]
	bit 5, a
	ld a, h
	jr nz, .vram1
	add $4
.vram1
	add $4
	ld h, a

.CopyToVram:
	ld a, [rVBK]
	push af
	ld a, [wSpriteFlags]
	bit 5, a
	ld a, $0
	jr z, .bankswitch
	inc a
.bankswitch
	ld [rVBK], a
	
	ld a, [hUsedSpriteTile]
	and a
	jr nz, .noLYCheck

	ld a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .noLYCheck

; player sprite is (supposed) to be between [60, 76)
; copying 1 tile takes 1 LY
; each set has 12 tiles
; so, ensure that the copy doesn't happen while in LY=[60, 76)
; check a few LYs earlier to be safe
; i.e. [60 - 12 - 4, 76)
; assumes that only one copy will happen per frame
; 	ld a, [rLY]
; 	cp (60 - 6 - 12) ; 42
; 	jr c, .noLYCheck

; dumb hack fix later
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .noLYCheck
; otherwise, we must wait until we pass LY=76
.lyWaitLoop
	ld a, [rLY]
	cp 76
	jr c, .lyWaitLoop
.noLYCheck	
	call Get2bpp
	pop af
	ld [rVBK], a
	ret

.GetTileAddr:
; Return the address of tile (a) in (hl).
	and $7f
	ld l, a
	ld h, 0
rept 4
	add hl, hl
endr
	ld a, l
	add VTiles0 % $100
	ld l, a
	ld a, h
	adc VTiles0 / $100
	ld h, a
	ret

SafeGetSpritePlayer: ; 14236
	push hl
	call GetSpritePlayer
	pop hl
	ret
; 1423c

GetSpritePlayer:: ; 1423c
;	call GetMonSprite
;	ret c

	ld hl, SpriteHeadersPlayers ; address
	dec a
	ld c, a
	ld b, 0
	ld a, NUM_SPRITEHEADER_FIELDS
	rst AddNTimes
	; load the address into de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	; load the sprite bank into both b and h
	ld a, [hli]
	ld b, a
	; load the sprite type into l
	ld l, [hl]
	ld h, a
	; load the length into c
	ld c, 12
	ret

GetMonSprite: ; 14259
; Return carry if a monster sprite was loaded.
	cp SPRITE_MON_ICON
	jr z, .MonIcon
	cp SPRITE_MON_DOLL_1
	jr z, .MonDoll1
	cp SPRITE_MON_DOLL_2
	jr z, .MonDoll2
	cp SPRITE_DAYCARE_MON_1
	jr z, .BreedMon1
	cp SPRITE_DAYCARE_MON_2
	jr z, .BreedMon2
	cp SPRITE_GROTTO_MON
	jr z, .GrottoMon

	cp SPRITE_VARS
	jr c, .Normal
	sub SPRITE_VARS
	ld e, a
	ld d, 0
	ld hl, wVariableSprites
	add hl, de
	ld a, [hl]
	and a
	jr nz, GetMonSprite
	; fallthrough

.NoSprite:
	ld a, 1
	lb hl, 0, MON_SPRITE
.Normal:
	and a
	ret

.MonIcon:
; Everything that calls GetMonSprite either points to a map_object struct in bc,
; or will not be used for Pokémon icons, so this SPRITE_MON_ICON can assume
; that bc takes MAPOBJECT_* offsets.
; (That means the player, Battle Tower trainers, and variable sprites cannot
;  use Pokémon icons.)
	ld hl, MAPOBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	jr .Mon

.BreedMon1:
	ld a, [wBreedMon1Species]
	jr .Mon

.BreedMon2:
	ld a, [wBreedMon2Species]
	jr .Mon

.GrottoMon:
	farcall GetHiddenGrottoContents
	ld a, [hl]
	jr .Mon

.MonDoll1:
	ld a, [wLeftOrnament]
	jr .MonDoll

.MonDoll2:
	ld a, [wRightOrnament]
.MonDoll:
	farcall GetDecorationSpecies
	; fallthrough

.Mon:
	and a
	jr z, .NoSprite
	farcall LoadOverworldMonIcon
	lb hl, 0, MON_SPRITE
	scf
	ret
; 142a7


_DoesSpriteHaveFacings:: ; 142a7
; Checks to see whether we can apply a facing to a sprite.
; Returns zero for Pokémon sprites, carry for the rest.
	cp SPRITE_POKEMON
	jr c, .facings
	cp SPRITE_VARS
	jr nc, .facings
	scf
	ret

.facings
	and a
	ret
; 142c4


_GetSpritePalette:: ; 142c4
	ld a, c
	call GetMonSprite
	jr c, .is_pokemon

	ld hl, SpriteHeaders + SPRITEHEADER_PALETTE
	dec a
	ld c, a
	ld b, 0
	ld a, NUM_SPRITEHEADER_FIELDS
	rst AddNTimes
	ld c, [hl]
	ret

.is_pokemon
	ld a, [wMapGroup]
	cp GROUP_PLAYER_HOUSE_2F
	jr nz, .not_doll
	ld a, [wMapNumber]
	cp MAP_PLAYER_HOUSE_2F
	jr nz, .not_doll
	farcall GetMonIconPalette
	ld c, a
	ret

.not_doll
;	cp GROUP_ROUTE_34
;	jr nz, .not_daycare
;	ld a, [wMapNumber]
;	cp MAP_ROUTE_34
;	jr nz, .not_daycare
;	farcall GetMonIconPalette
;	cp PAL_OW_PINK
;	ld c, PAL_OW_BROWN
;	ret z
;	cp PAL_OW_PINK
;	ld c, PAL_OW_RED
;	ret z
;	cp PAL_OW_TEAL
;	ld c, PAL_OW_GREEN
;	ret z
;	ld c, a
;	ret

;.not_daycare
	ld c, PAL_OW_RED
	ret
; 142db


GetUsedSprite:: ; 143c8
	ld a, [hUsedSpriteIndex]
	call SafeGetSprite
	ld a, [hUsedSpriteTile]
	call .GetTileAddr
	push hl
	push de
	push bc
	ld a, [wSpriteFlags]
	bit 7, a
	jr nz, .skip
	call .CopyToVram

.skip
	pop bc
	ld l, c
	ld h, $0
rept 4
	add hl, hl
endr
	pop de
	add hl, de
	ld d, h
	ld e, l
	pop hl

	ld a, [wSpriteFlags]
	bit 6, a
	ret nz

	ld a, [hUsedSpriteIndex]
	call _DoesSpriteHaveFacings
	ret c

	ld a, [wSpriteFlags]
	bit 5, a
	ld a, h
	jr nz, .vram1
	add $4
.vram1
	add $4
	ld h, a

.CopyToVram:
	ld a, [rVBK]
	push af
	ld a, [wSpriteFlags]
	bit 5, a
	ld a, $0
	jr z, .bankswitch
	inc a
.bankswitch
	ld [rVBK], a
	
	ld a, [hUsedSpriteTile]
	and a
	jr nz, .noLYCheck

	ld a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr z, .noLYCheck

; player sprite is (supposed) to be between [60, 76)
; copying 1 tile takes 1 LY
; each set has 12 tiles
; so, ensure that the copy doesn't happen while in LY=[60, 76)
; check a few LYs earlier to be safe
; i.e. [60 - 12 - 4, 76)
; assumes that only one copy will happen per frame
; 	ld a, [rLY]
; 	cp (60 - 6 - 12) ; 42
; 	jr c, .noLYCheck

; dumb hack fix later
	ld a, [wPlayerState]
	cp PLAYER_RUN
	jr nz, .noLYCheck
; otherwise, we must wait until we pass LY=76
.lyWaitLoop
	ld a, [rLY]
	cp 76
	jr c, .lyWaitLoop
.noLYCheck	
	call Get2bpp
	pop af
	ld [rVBK], a
	ret

.GetTileAddr:
; Return the address of tile (a) in (hl).
	and $7f
	ld l, a
	ld h, 0
rept 4
	add hl, hl
endr
	ld a, l
	add VTiles0 % $100
	ld l, a
	ld a, h
	adc VTiles0 / $100
	ld h, a
	ret

LoadEmote:: ; 1442f
; Get the address of the pointer to emote c.
	ld a, c
	ld bc, 6
	ld hl, EmotesPointers
	rst AddNTimes
; Load the emote address into de
	ld e, [hl]
	inc hl
	ld d, [hl]
; load the length of the emote (in tiles) into c
	inc hl
	ld c, [hl]
	swap c
; load the emote pointer bank into b
	inc hl
	ld b, [hl]
; load the VRAM destination into hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
; if the emote has a length of 0, do not proceed (error handling)
	ld a, c
	and a
	ret z
; load into vram0
	jp Get2bpp


INCLUDE "data/sprites/emotes.asm"

INCLUDE "data/sprites/sprites.asm"