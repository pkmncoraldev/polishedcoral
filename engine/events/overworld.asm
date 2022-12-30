FieldMoveJumptableReset: ; c6ea
	xor a
	ld hl, wBuffer1
	ld bc, 7
	jp ByteFill

FieldMoveJumptable: ; c6f5
	ld a, [wBuffer1]
	rst JumpTable
	ld [wBuffer1], a
	bit 7, a
	jr nz, .okay
	and a
	ret

.okay
	and $7f
	scf
	ret

GetPartyNick: ; c706
; write wCurPartyMon nickname to wStringBuffer1-3
	ld hl, wPartyMonNicknames
	ld a, BOXMON
	ld [wMonType], a
	ld a, [wCurPartyMon]
	call GetNick
	call CopyName1
; copy text from wStringBuffer2 to wStringBuffer3
	ld de, wStringBuffer2
	ld hl, wStringBuffer3
	jp CopyName2

CheckEngineFlag: ; c721
; Check engine flag de
; Return carry if flag is not set
	ld b, CHECK_FLAG
	farcall EngineFlagAction
	ld a, c
	and a
	jr nz, .isset
	scf
	ret
.isset
	xor a
	ret

CheckBadge: ; c731
; Check engine flag a (ENGINE_FIRSTBADGE thru ENGINE_EARTHBADGE)
; Display "Badge required" text and return carry if the badge is not owned
	call CheckEngineFlag
	ret nc
	ld hl, .BadgeRequiredText
	call MenuTextBoxBackup ; push text to queue
	scf
	ret

.BadgeRequiredText: ; c73d
	; Sorry! A new BADGE
	; is required.
	text_jump _BadgeRequiredText
	db "@"
	
CheckPartyCanLearnMove: ; c742
; Check if a monster in your party can learn move d.

    ld e, 0
    xor a
    ld [wCurPartyMon], a
.loop
    ld c, e
    ld b, 0
    ld hl, wPartySpecies
    add hl, bc
    ld a, [hl]
    and a
    jr z, .no
    cp a, -1
    jr z, .no
    cp a, EGG
    jr z, .next
    
    ld [wCurPartySpecies], a
    ld a, d
    ld [wPutativeTMHMMove], a
    push de
    farcall CanLearnTMHMMove
    pop de
.check

    ld a, c
    and a
    jr nz, .yes

.next
    inc e
    jr .loop

.yes
    ld a, e
    ld [wCurPartyMon], a ; which mon can learn the move
    xor a
    ret
.no
    scf
    ret

CheckPartyMove: ; c742
; Check if a monster in your party has move d.

	ld e, 0
	xor a
	ld [wCurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	call IsAPokemon
	jr c, .no

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Form
	ld a, e
	rst AddNTimes
	bit MON_IS_EGG_F, [hl]
	jr nz, .next
	ld bc, MON_MOVES - MON_FORM
	add hl, bc
	ld b, NUM_MOVES
.check
	ld a, [hli]
	cp d
	jr z, .yes
	dec b
	jr nz, .check

.next
	inc e
	jr .loop

.yes
	ld a, e
	ld [wCurPartyMon], a ; which mon has the move
	xor a
	ret
.no
	scf
	ret

CheckForSurfingPikachu:
	ld d, SURF
	call CheckPartyCanLearnMove
	jr c, .no
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	cp PIKACHU
	jr nz, .no
	ld a, TRUE
	ld [wScriptVar], a
	ret

.no:
	xor a ; FALSE
	ld [wScriptVar], a
	ret

FieldMovePokepicScript:
	copybytetovar wBuffer6
	refreshscreen
	pokepic 0, 0
	cry 0
	waitsfx
	closepokepic
	reloadmappart
	end

FieldMoveFailed: ; c779
	ld hl, .CantUseHere
	jp MenuTextBoxBackup

.CantUseHere: ; 0xc780
	; Can't use that here.
	text_jump UnknownText_0x1c05c8
	db "@"

CutFunction: ; c785
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable: ; c796 (3:4796)

	dw .CheckAble
	dw .DoCut
	dw .FailCut

.CheckAble: ; c79c (3:479c)
	ld de, ENGINE_SECONDBADGE
	call CheckBadge
	jr c, .nohivebadge
	call CheckMapForSomethingToCut
	jr c, .nothingtocut
	ld a, $1
	ret

.nohivebadge
	ld a, $80
	ret

.nothingtocut
	ld a, $2
	ret

.DoCut: ; c7b2 (3:47b2)
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, $81
	ret

.FailCut: ; c7bb (3:47bb)
	ld hl, Text_NothingToCut
	call MenuTextBoxBackup
	ld a, $80
	ret

Text_UsedCut: ; 0xc7c4
	; used CUT!
	text_jump UnknownText_0x1c05dd
	db "@"

Text_NothingToCut: ; 0xc7c9
	; There's nothing to CUT here.
	text_jump UnknownText_0x1c05ec
	db "@"

CheckMapForSomethingToCut: ; c7ce
	call GetFacingObject
	jr c, .no_tree
	ld a, d
	cp SPRITEMOVEDATA_CUTTABLE_TREE
	jr z, .tree
.no_tree
	; Does the collision data of the facing tile permit cutting?
	call GetFacingTileCoord
	ld c, a
	push de
	farcall CheckCutCollision
	pop de
	jr nc, .fail
	; Get the location of the current block in wOverworldMap.
	call GetBlockLocation
	ld c, [hl]
	; See if that block contains something that can be cut.
	push hl
	ld hl, CutGrassBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .fail
	; Back up the wOverworldMap address to wBuffer3
	ld a, l
	ld [wBuffer3], a
	ld a, h
	ld [wBuffer4], a
	; Back up the replacement tile to wBuffer5
	ld a, b
	ld [wBuffer5], a
	; Back up the animation index to wBuffer6
	ld a, $1
	ld [wBuffer6], a
	xor a
	ret

.tree
	xor a
	ld [wBuffer6], a
	ret

.fail
	scf
	ret

Script_CutFromMenu: ; c7fe
	reloadmappart
	special UpdateTimePals
	callasm GetBuffer6
	ifequal $0, Script_CutTree
;Script_CutGrass:
	callasm PrepareOverworldMove
	writetext Text_UsedCut
	closetext
	scall FieldMovePokepicScript
	callasm CutDownGrass
	endtext

GetBuffer6:
	ld a, [wBuffer6]
	ld [wScriptVar], a
	ret

CutDownGrass: ; c810
	ld hl, wBuffer3 ; OverworldMapTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wBuffer5] ; ReplacementTile
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call LoadMapPart
	call UpdateSprites
	call DelayFrame
	ld a, [wBuffer6] ; Animation type (always 1)
	ld e, a
	farcall OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	jp DelayFrame

CheckOverworldTileArrays: ; c840
	; Input: c contains the tile you're facing
	; Output: Replacement tile in b and effect on wild encounters in c, plus carry set.
	;         Carry is not set if the facing tile cannot be replaced, or if the tileset
	;         does not contain a tile you can replace.

	; Dictionary lookup for pointer to tile replacement table
	push bc
	ld a, [wTileset]
	ld de, 3
	call IsInArray
	pop bc
	jr nc, .nope
	; Load the pointer
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; Look up the tile you're facing
	ld de, 2
	ld a, c
	call IsInArray
	jr nc, .nope
	; Load the replacement to b
	inc hl
	ld b, [hl]
	scf
	ret

.nope
	xor a
	ret

INCLUDE "data/events/field_move_blocks.asm"

Script_CutTree:
	callasm PrepareOverworldMove
	writetext Text_UsedCut
	closetext
	waitsfx
	scall FieldMovePokepicScript
	setflag ENGINE_AUTOCUT_ACTIVE
	disappear -2
	callasm CutDownTree
	endtext

AutoCutTreeScript:
	callasm RefreshScreenFast
	disappear -2
	callasm CutDownTree
	endtext

CutDownTree:
	xor a
	ld [hBGMapMode], a
	call LoadMapPart
	call UpdateSprites
	call DelayFrame
	xor a ; Animation type
	ld e, a
	farcall OWCutAnimation
	call BufferScreen
	call GetMovementPermissions
	call UpdateSprites
	call DelayFrame
	jp LoadStandardFont

OWFlash: ; c8ac
	call .CheckUseFlash
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.CheckUseFlash: ; c8b5
; Flash
	push hl
	farcall SpecialAerodactylChamber
	pop hl
	jr c, .useflash
	ld a, [wTimeOfDayPalset]
	cp %11111111 ; 3, 3, 3, 3
	jr nz, .notadarkcave
.useflash
	call UseFlash
	ld a, $81
	ret

.notadarkcave
	call FieldMoveFailed
	ld a, $80
	ret

UseFlash: ; c8e0
	ld hl, Script_UseFlash
	jp QueueScript

Script_UseFlash: ; 0xc8e6
	reloadmappart
	special UpdateTimePals
	callasm PrepareOverworldMove
	scall FieldMovePokepicScript
	opentext
	writetext UnknownText_0xc8f3
	callasm BlindingFlash
	endtext

UnknownText_0xc8f3: ; 0xc8f3
	text_jump UnknownText_0x1c0609
	start_asm
	call WaitSFX
	ld de, SFX_FLASH
	call PlaySFX
	call WaitSFX
	ld hl, .BlankText
	ret

.BlankText: ; 0xc908
	db "@"

SurfFunction: ; c909
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable: ; c91a (3:491a)
	dw .TrySurf
	dw .DoSurf
	dw .FailSurf
	dw .AlreadySurfing

.TrySurf: ; c922 (3:4922)
	ld de, ENGINE_FOURTHBADGE
	call CheckBadge
	jr c, .asm_c956
	ld hl, wOWState
	bit OWSTATE_BIKING_FORCED, [hl]
	jr nz, .cannotsurf
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .alreadyfail
	cp PLAYER_SURF_PIKA
	jr z, .alreadyfail
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr nz, .cannotsurf
	call CheckDirection
	jr c, .cannotsurf
	farcall CheckFacingObject
	jr c, .cannotsurf
	ld a, $1
	ret
.asm_c956
	ld a, $80
	ret
.alreadyfail
	ld a, $3
	ret
.cannotsurf
	ld a, $2
	ret

.DoSurf: ; c95f (3:495f)
	call GetSurfType
	ld [wBuffer2], a
	call GetPartyNick
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, $81
	ret

.FailSurf: ; c971 (3:4971)
	ld hl, CantSurfText
	call MenuTextBoxBackup
	ld a, $80
	ret

.AlreadySurfing: ; c97a (3:497a)
	ld hl, AlreadySurfingText
	call MenuTextBoxBackup
	ld a, $80
	ret

SurfFromMenuScript: ; c983
	special UpdateTimePals

UsedSurfScript: ; c986
	callasm PrepareOverworldMove
	writetext UsedSurfText ; "used SURF!"
	waitbutton
	closetext

	setflag ENGINE_AUTOSURF_ACTIVE
	scall FieldMovePokepicScript
	jump AutoSurfScript

UsedLavaSurfScript: ; c986
	callasm PrepareOverworldMove
	writetext UsedLavaSurfText
	waitbutton
	closetext

	setflag ENGINE_AUTOSURF_ACTIVE
	scall FieldMovePokepicScript
	
AutoSurfScript:
;	playsound SFX_READ_TEXT
	copybytetovar wBuffer2
	writevarcode VAR_MOVEMENT

	special ReplaceKrisSprite
	special PlayMapMusic
; step into the water
	special Special_SurfStartStep ; (slow_step_x, step_end)
	applymovement PLAYER, wMovementBuffer ; PLAYER, MovementBuffer
	end

DebugSurfScript:
	opentext
	writetext DebugFieldMoveText
	closetext
	jump AutoSurfScript
	
UsedSurfText: ; c9a9
	text_jump _UsedSurfText
	db "@"

UsedLavaSurfText: ; c9a9
	text_jump _UsedLavaSurfText
	db "@"
	
CantSurfText: ; c9ae
	text_jump _CantSurfText
	db "@"

AlreadySurfingText: ; c9b3
	text_jump _AlreadySurfingText
	db "@"

DebugFieldMoveText:
	text_jump _DebugFieldMoveText
	db "@"
	
UsedFlyText: ; c9a9
	text_jump _UsedFlyText
	db "@"
	
GetSurfType: ; c9b8
; Surfing on Pikachu uses an alternate sprite.
; This is done by using a separate movement type.

	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de

	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret

CheckDirection: ; c9cb
; Return carry if a tile permission prevents you
; from moving in the direction you're facing.

; Get player direction
	ld a, [wPlayerDirection]
	and a, %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .Directions
	add hl, de

; Can you walk in this direction?
	ld a, [wTilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

.Directions:
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT

TrySurfOW:: ; c9e7
; Checking a tile in the overworld.
; Return carry if fail is allowed.

; Don't ask to surf if already fail.
	ld a, [wPlayerState]
	cp PLAYER_SURF_PIKA
	jp z, .quit
	cp PLAYER_SURF
	jp z, .quit

; Must be facing water.
	ld a, [wEngineBuffer1]
	call GetTileCollision
	cp WATERTILE ; surfable
	jp nz, .quit

; Check tile permissions.
	call CheckDirection
	jp c, .quit

	ld a, [wOptions1]
	bit DEBUG_MODE, a
	jp nz, .debugsurf
	
	ld a, [wMapMusic]
	cp MUSIC_LAVA
	jr nz, .skip_lava
	
	ld a, [wMapGroup]
	cp GROUP_MT_ONWA_1F
	jr z, .lava

.skip_lava
	ld de, ENGINE_GOT_SURF
	call CheckEngineFlag
	jr c, .quit

	ld d, SURF
	call CheckPartyCanLearnMove
	jr c, .quit

	ld hl, wOWState
	bit OWSTATE_BIKING_FORCED, [hl]
	jr nz, .quit

	call GetSurfType
	ld [wBuffer2], a
	call GetPartyNick
	
	ld a, [wTileset]
	cp TILESET_SEWER
	jr z, .sewer
	
.regular_surf
	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call CallScript

	scf
	ret

.lava
	ld e, 0
	xor a
	ld [wCurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .quit
	cp a, -1
	jr z, .quit
	dec a
	ld hl, BaseData + 6
	ld bc, BaseData1 - BaseData0
	call AddNTimes
	ld a, BANK(BaseData)
	call GetFarHalfword
	ld a, FIRE
	cp h
	jr z, .cont
	cp l
	jr z, .cont
	
.next
	inc e
	jr .loop
.no
	scf
	ret

.cont
	ld a, e
	ld [wCurPartyMon], a
	xor a

	ld hl, wOWState
	bit OWSTATE_BIKING_FORCED, [hl]
	jr nz, .quit

	call GetSurfType
	ld [wBuffer2], a
	call GetPartyNick

	ld a, BANK(AskLavaSurfScript)
	ld hl, AskLavaSurfScript
	call CallScript

	scf
	ret
	
.quit
	xor a
	ret
	
.debugsurf
	ld a, PLAYER_SURF
	ld [wBuffer2], a
	ld a, BANK(DebugSurfScript)
	ld hl, DebugSurfScript
	call CallScript

	scf
	ret

.cantsurflavayet
	scf
	ret
	
.sewer
	ld a, [wMapNumber]
	cp MAP_LUSTER_SEWERS_MUK_ROOM
	jr z, .muk_room
	eventflagcheck EVENT_CLEARED_LUSTER_SEWERS
	jp nz, .regular_surf
	ld a, BANK(SewerSurfScript)
	ld hl, SewerSurfScript
	call CallScript
	scf
	ret
	
.muk_room
	eventflagcheck EVENT_LUSTER_SEWERS_BEAT_MUK
	jp nz, .regular_surf
	ld a, BANK(SewerSurf2Script)
	ld hl, SewerSurf2Script
	call CallScript
	scf
	ret
	
	
AskSurfScript: ; ca2c
	checkflag ENGINE_AUTOSURF_ACTIVE
	iftrue AutoSurfScript
	opentext
	writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	endtext

AskSurfText: ; ca36
	text_jump _AskSurfText ; The water is calm.
	db "@"              ; Want to SURF?
	
AskLavaSurfScript: ; ca2c
	checkflag ENGINE_AUTOSURF_ACTIVE
	iftrue AutoSurfScript
	opentext
	writetext AskLavaSurfText
	yesorno
	iftrue UsedLavaSurfScript
	endtext

AskLavaSurfText: ; ca36
	text_jump _AskLavaSurfText ; The lava is bubbling.
	db "@"              ; Want to ride?

SewerSurfScript:
	opentext
	writetext SewerSurfText
	waitbutton
	endtext
	
SewerSurfText:
	text_jump _SewerSurfText
	db "@"
	
SewerSurf2Script:
	opentext
	writetext SewerSurf2Text
	waitbutton
	endtext
	
SewerSurf2Text:
	text_jump _SewerSurf2Text
	db "@"
	
CheckFlyAllowedOnMap:
; returns z is fly is allowed
	call GetMapPermission
	call CheckOutdoorMap
	ret

FlyFunction: ; ca3b
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable:
	dw .TryFly
	dw .DoFly
	dw .FailFly

.TryFly: ; ca52
; Fly
	ld de, ENGINE_THIRDBADGE		;debug
	call CheckBadge					;debug
	jr c, .nobadge					;debug
	ld a, [wTileset]
	cp TILESET_SPOOKY
	jr z, .outdoors
	call CheckFlyAllowedOnMap
	jr nz, .indoors
.outdoors
	xor a
	ld [hMapAnims], a
	call LoadStandardMenuDataHeader
	call ClearSprites
	farcall _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp NUM_SPAWNS
	jr nc, .illegal

	ld [wDefaultSpawnpoint], a
	call CloseWindow
	ld a, $1
	ret

.nobadge
	ld a, $82
	ret

.indoors
	ld a, $2
	ret

.illegal
	call CloseWindow
	call ApplyTilemapInVBlank
	ld a, $80
	ret

.DoFly: ; ca94
	ld hl, .FlyScript
	call QueueScript
	ld a, $81
	ret

.FailFly: ; ca9d
	call FieldMoveFailed
	ld a, $82
	ret

.FlyScript: ; 0xcaa3
	scall HandleEventsFly
	reloadmappart
;	callasm HideSprites
	special UpdateTimePals
	callasm PrepareOverworldMove
	opentext
	writetext UsedFlyText ; "used FLY!"
	wait 5
	closetext
	scall FieldMovePokepicScript
;	callasm FlyFromAnim
	farscall Script_AbortBugContest
	special FadeOutPalettes
	playsound SFX_FLY
	special WaitSFX
	special WarpToSpawnPoint
;	callasm DelayLoadingNewSprites
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
;	callasm FlyToAnim
	special WaitSFX
	callasm .ReturnFromFly
	end

.ReturnFromFly: ; cacb
;	farcall ReturnFromFly_SpawnOnlyPlayer
	call DelayFrame
	jp ReplaceKrisSprite

WaterfallFunction: ; cade
	call .TryWaterfall
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryWaterfall: ; cae7
; Waterfall
	ld de, ENGINE_EIGHTHBADGE
	farcall CheckBadge
	ld a, $80
	ret c
	call CheckMapCanWaterfall
	jr c, .failed
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, $81
	ret

.failed
	call FieldMoveFailed
	ld a, $80
	ret

CheckMapCanWaterfall: ; cb07
	ld a, [wPlayerDirection]
	and FACE_UP | FACE_DOWN
	cp FACE_UP
	jr nz, .failed
	ld a, [wTilePermissions]
	and FACE_UP
	jr nz, .failed
	ld a, [wTileUp]
	cp COLL_WATERFALL
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret

Script_WaterfallFromMenu: ; 0xcb1c
	reloadmappart
	special UpdateTimePals

Script_UsedWaterfall: ; 0xcb20
	callasm PrepareOverworldMove
	writetext .Text_UsedWaterfall
	waitbutton
	closetext
	scall FieldMovePokepicScript
	setflag ENGINE_AUTOWATERFALL_ACTIVE
	jump Script_AutoWaterfall

.Text_UsedWaterfall:
	; used WATERFALL!
	text_jump UnknownText_0x1c068e
	db "@"

Script_AutoWaterfall:
	playsound SFX_BUBBLE_BEAM
.loop
	applymovement PLAYER, .WaterfallStep
	callasm .CheckContinueWaterfall
	iffalse .loop
	end

.CheckContinueWaterfall: ; cb38
	xor a
	ld [wScriptVar], a
	ld a, [wPlayerStandingTile]
	cp COLL_WATERFALL
	ret z
	ld a, $1
	ld [wScriptVar], a
	ret

.WaterfallStep: ; cb4f
	turn_waterfall_up
	step_end

TryWaterfallOW:: ; cb56
	ld d, WATERFALL
	call CheckPartyCanLearnMove
	jr c, .failed
	ld de, ENGINE_EIGHTHBADGE
	call CheckEngineFlag
	jr c, .failed
	call CheckMapCanWaterfall
	jr c, .failed
	ld a, BANK(Script_AskWaterfall)
	ld hl, Script_AskWaterfall
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret

Script_CantDoWaterfall: ; 0xcb7e
	jumptext .Text_CantDoWaterfall

.Text_CantDoWaterfall: ; 0xcb81
	; Wow, it's a huge waterfall.
	text_jump UnknownText_0x1c06a3
	db "@"

Script_AskWaterfall: ; 0xcb86
	checkflag ENGINE_AUTOWATERFALL_ACTIVE
	iftrue Script_AutoWaterfall
	opentext
	writetext .AskUseWaterfall
	yesorno
	iftrue Script_UsedWaterfall
	endtext

.AskUseWaterfall: ; 0xcb90
	; Do you want to use WATERFALL?
	text_jump UnknownText_0x1c06bf
	db "@"

EscapeRopeFunction: ; cb95
	call FieldMoveJumptableReset
	ld a, $1
	jr dig_incave

DigFunction: ; cb9c
	call FieldMoveJumptableReset
	ld a, $2

dig_incave:
	ld [wBuffer2], a
.loop
	ld hl, .DigTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.DigTable: ; cbb2
	dw .CheckCanDig
	dw .DoDig
	dw .FailDig

.CheckCanDig: ; cbb8
	ld a, [wTileset]
	cp TILESET_SPOOKY
	jr z, .fail
	call GetMapPermission
	cp CAVE
	jr z, .incave
	cp DUNGEON
	jr z, .incave
.fail
	ld a, $2
	ret

.incave
	ld hl, wDigWarp
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	ld a, $1
	ret

.DoDig: ; cbd8
	ld hl, wDigWarp
	ld de, wNextWarp
	ld bc, 3
	rst CopyBytes
	call GetPartyNick
	ld a, [wBuffer2]
	cp $2
	jr nz, .escaperope
	ld hl, .UsedDigScript
	call QueueScript
	ld a, $81
	ret

.escaperope
	farcall SpecialKabutoChamber
	ld hl, .UsedEscapeRopeScript
	call QueueScript
	ld a, $81
	ret

.FailDig: ; cc06
	ld a, [wBuffer2]
	cp $2
	jr nz, .failescaperope
	ld hl, .Text_CantUseHere
	call MenuTextBox
	call WaitPressAorB_BlinkCursor
	call CloseWindow

.failescaperope
	ld a, $80
	ret

.Text_UsedDig: ; 0xcc1c
	; used DIG!
	text_jump UnknownText_0x1c06de
	db "@"

.Text_UsedEscapeRope: ; 0xcc21
	; used an ESCAPE ROPE.
	text_jump UnknownText_0x1c06ed
	db "@"

.Text_CantUseHere: ; 0xcc26
	; Can't use that here.
	text_jump UnknownText_0x1c0705
	db "@"

.UsedEscapeRopeScript: ; 0xcc2b
	reloadmappart
	special UpdateTimePals
	writetext .Text_UsedEscapeRope
	waitbutton
	closetext
	jump .UsedDigOrEscapeRopeScript

.UsedDigScript: ; 0xcc35
	reloadmappart
	special UpdateTimePals
	callasm PrepareOverworldMove
	writetext .Text_UsedDig
	waitbutton
	closetext
	scall FieldMovePokepicScript

.UsedDigOrEscapeRopeScript: ; 0xcc3c
	scall HandleEventsFly
	playsound SFX_WARP_TO
	applymovement PLAYER, .DigOut
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, .DigReturn
	end

.DigOut: ; 0xcc59
	step_dig 32
	hide_person
	step_end

.DigReturn: ; 0xcc5d
	show_person
	return_dig 32
	step_end

TeleportFunction: ; cc61
	call FieldMoveJumptableReset
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.Jumptable: ; cc72
	dw .TryTeleport
	dw .DoTeleport
	dw .FailTeleport

.TryTeleport: ; cc78
	call CheckFlyAllowedOnMap
	jr nz, .nope
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	jr nc, .nope
	ld a, c
	ld [wDefaultSpawnpoint], a
	ld a, $1
	ret

.nope
	ld a, $2
	ret

.DoTeleport: ; cc9c
	call GetPartyNick
	ld hl, .TeleportScript
	call QueueScript
	ld a, $81
	ret

.FailTeleport: ; cca8
	ld hl, .Text_CantUseHere
	call MenuTextBoxBackup
	ld a, $80
	ret

.Text_CantUseHere: ; 0xccb6
	; Can't use that here.
	text_jump UnknownText_0x1c073b
	db "@"

.TeleportScript: ; 0xccbb
	scall HandleEventsFly
	reloadmappart
	special UpdateTimePals
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end

.TeleportFrom: ; cce1
	teleport_from
	step_end

.TeleportTo: ; cce3
	teleport_to
	step_end

StrengthFunction: ; cce5
	call .TryStrength
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryStrength: ; ccee
; Strength
	ld de, ENGINE_THIRDBADGE
	call CheckBadge
	jr c, .Failed
	jr .UseStrength

.Failed: ; cd06
	ld a, $80
	ret

.UseStrength: ; cd09
	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, $81
	ret

SetStrengthFlag: ; cd12
	ld hl, wOWState
	set OWSTATE_STRENGTH, [hl]
PrepareOverworldMove: ; cd1d
	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wBuffer6], a
	jp GetPartyNick

Script_StrengthFromMenu: ; 0xcd29
	reloadmappart
	special UpdateTimePals

Script_UsedStrength: ; 0xcd2d
	callasm SetStrengthFlag
	writetext .UsedStrength
	waitbutton
	closetext
	scall FieldMovePokepicScript
	opentext
	writetext .StrengthAllowedItToMoveBoulders
	endtext

.UsedStrength: ; 0xcd41
	text_jump UnknownText_0x1c0774
	db "@"

.StrengthAllowedItToMoveBoulders: ; 0xcd46
	text_jump UnknownText_0x1c0788
	db "@"

AskStrengthScript:
	callasm TryStrengthOW
	iffalse .AskStrength
	ifequal $1, .DontMeetRequirements
	jump .AlreadyUsedStrength

.DontMeetRequirements: ; 0xcd59
	jumptext UnknownText_0xcd73

.AlreadyUsedStrength: ; 0xcd5c
	jumptext UnknownText_0xcd6e

.AskStrength: ; 0xcd5f
	opentext
	writetext UnknownText_0xcd69
	yesorno
	iftrue Script_UsedStrength
	endtext

UnknownText_0xcd69: ; 0xcd69
	; A #MON may be able to move this. Want to use STRENGTH?
	text_jump UnknownText_0x1c07a0
	db "@"

UnknownText_0xcd6e: ; 0xcd6e
	; Boulders may now be moved!
	text_jump UnknownText_0x1c07d8
	db "@"

UnknownText_0xcd73: ; 0xcd73
	; A #MON may be able to move this.
	text_jump UnknownText_0x1c07f4
	db "@"

TryStrengthOW: ; cd78
	ld d, STRENGTH
	call CheckPartyCanLearnMove
	jr c, .nope

;	ld de, ENGINE_THIRDBADGE
;	call CheckEngineFlag
;	jr c, .nope

	ld hl, wOWState
	bit OWSTATE_STRENGTH, [hl]
	jr z, .already_using

	ld a, 2
	jr .done

.nope
	ld a, 1
	jr .done

.already_using
	xor a
	; fallthrough

.done
	ld [wScriptVar], a
	ret

WhirlpoolFunction: ; cd9d
	call FieldMoveJumptableReset
.loop
	ld hl, Jumptable_cdae
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

Jumptable_cdae: ; cdae
	dw .TryWhirlpool
	dw .DoWhirlpool
	dw .FailWhirlpool

.TryWhirlpool: ; cdb4
	ld de, ENGINE_SEVENTHBADGE
	call CheckBadge
	jr c, .noglacierbadge
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, $1
	ret

.failed
	ld a, $2
	ret

.noglacierbadge
	ld a, $80
	ret

.DoWhirlpool: ; cdca
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, $81
	ret

.FailWhirlpool: ; cdd3
	call FieldMoveFailed
	ld a, $80
	ret

Text_UsedWhirlpool: ; 0xcdd9
	; used WHIRLPOOL!
	text_jump UnknownText_0x1c0816
	db "@"

TryWhirlpoolMenu: ; cdde
	call GetFacingTileCoord
	ld c, a
	cp COLL_WHIRLPOOL
	jr nz, .failed
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .failed
	ld a, l
	ld [wBuffer3], a
	ld a, h
	ld [wBuffer4], a
	ld a, b
	ld [wBuffer5], a
	xor a
	ld [wBuffer6], a
	ret

.failed
	scf
	ret

Script_WhirlpoolFromMenu: ; 0xce0b
	reloadmappart
	special UpdateTimePals

Script_UsedWhirlpool: ; 0xce0f
	callasm PrepareOverworldMove
	writetext Text_UsedWhirlpool
	closetext
	scall FieldMovePokepicScript
	setflag ENGINE_AUTOWHIRLPOOL_ACTIVE
	waitsfx

Script_AutoWhirlpool:
	playsound SFX_SURF
	checkcode VAR_FACING
	ifequal UP, .Up
	ifequal DOWN, .Down
	ifequal RIGHT, .Right
	applymovement PLAYER, .LeftMovementData
	end

.Up:
	applymovement PLAYER, .UpMovementData
	end

.Right:
	applymovement PLAYER, .RightMovementData
	end

.Down:
	applymovement PLAYER, .DownMovementData
	end

.UpMovementData:
	slow_step_up
	slow_step_up
	step_end

.RightMovementData:
	slow_step_right
	slow_step_right
	step_end

.DownMovementData:
	slow_step_down
	slow_step_down
	step_end

.LeftMovementData:
	slow_step_left
	slow_step_left
	step_end

TryWhirlpoolOW:: ; ce3e
;	ld d, WHIRLPOOL
;	call CheckPartyCanLearnMove
;	jr c, .failed
;	ld de, ENGINE_SEVENTHBADGE
;	call CheckEngineFlag
;	jr c, .failed
;	call TryWhirlpoolMenu
;	jr c, .failed
;	ld a, BANK(Script_AskWhirlpoolOW)
;	ld hl, Script_AskWhirlpoolOW
;	call CallScript
;	scf
	ret

.failed
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool
	call CallScript
	scf
	ret

Script_MightyWhirlpool: ; 0xce66
	jumptext .MightyWhirlpoolText

.MightyWhirlpoolText: ; 0xce69
	text_jump UnknownText_0x1c082b
	db "@"

Script_AskWhirlpoolOW: ; 0xce6e
	checkflag ENGINE_AUTOWHIRLPOOL_ACTIVE
	iftrue Script_AutoWhirlpool
	opentext
	writetext UnknownText_0xce78
	yesorno
	iftrue Script_UsedWhirlpool
	endtext

UnknownText_0xce78: ; 0xce78
	text_jump UnknownText_0x1c0864
	db "@"

HeadbuttFunction: ; ce7d
	call TryHeadbuttFromMenu
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryHeadbuttFromMenu: ; ce86
	jr .no_tree	;TODO undummy
	call GetFacingTileCoord
	cp COLL_HEADBUTT_TREE
	jr nz, .no_tree

	ld hl, HeadbuttFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_tree
	call FieldMoveFailed
	ld a, $80
	ret

UnknownText_0xce9d: ; 0xce9d
	; did a HEADBUTT!
	text_jump UnknownText_0x1c0897
	db "@"

UnknownText_0xcea2: ; 0xcea2
	; Nope. Nothing…
	text_jump UnknownText_0x1c08ac
	db "@"

HeadbuttFromMenuScript: ; 0xcea7
	reloadmappart
	special UpdateTimePals

HeadbuttScript: ; 0xceab
	callasm PrepareOverworldMove
	writetext UnknownText_0xce9d
	closetext

	scall FieldMovePokepicScript
	setflag ENGINE_HEADBUTT_ACTIVE

AutoHeadbuttScript:
	refreshscreen
	callasm ShakeHeadbuttTree

	callasm TreeMonEncounter
	iffalse .no_battle
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

.no_battle
	callasm TreeItemEncounter
	iffalse .no_item
	opentext
	verbosegiveitem ITEM_FROM_MEM
	endtext

.no_item
	jumptext UnknownText_0xcea2

TryHeadbuttOW:: ; cec9
	jr .no	;TODO undummy
	ld d, HEADBUTT
	call CheckPartyCanLearnMove
	jr c, .no

	ld a, BANK(AskHeadbuttScript)
	ld hl, AskHeadbuttScript
	call CallScript
	scf
	ret

.no
	xor a
	ret

AskHeadbuttScript: ; 0xcedc
	checkflag ENGINE_HEADBUTT_ACTIVE
	iftrue AutoHeadbuttScript
	opentext
	writetext UnknownText_0xcee6
	yesorno
	iftrue HeadbuttScript
	endtext

UnknownText_0xcee6: ; 0xcee6
	; A #MON could be in this tree. Want to HEADBUTT it?
	text_jump UnknownText_0x1c08bc
	db "@"
	
RockClimbFunction: ; cade
	call .TryRockClimb
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryRockClimb: ; cae7
; RockClimb
	ld de, ENGINE_FOURTHBADGE
	farcall CheckBadge
	ld a, $80
	ret c
	call CheckMapCanRockClimb
	jr c, .failed
	ld hl, Script_RockClimbFromMenu
	call QueueScript
	ld a, $81
	ret

.failed
	call FieldMoveFailed
	ld a, $80
	ret

CheckMapCanRockClimb: ; cb07
	ld a, [wPlayerDirection]
	and FACE_UP | FACE_DOWN
	cp FACE_UP
	jr nz, .failed
	ld a, [wTilePermissions]
	and FACE_UP
	jr nz, .failed
	ld a, [wTileUp]
	cp COLL_WATERFALL
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret

Script_RockClimbFromMenu: ; 0xcb1c
	reloadmappart
	special UpdateTimePals

Script_UsedRockClimb: ; 0xcb20
	callasm PrepareOverworldMove
	writetext .Text_UsedRockClimb
	waitbutton
	closetext
	scall FieldMovePokepicScript
	setflag ENGINE_ROCK_CLIMB_ACTIVE
	jump Script_AutoRockClimb

.Text_UsedRockClimb:
	text_jump UsedRockClimbText
	db "@"

Script_AutoRockClimb:
	callasm .RockClimbSurf
.loop
	playsound SFX_BITE
	checkcode VAR_FACING
	if_equal DOWN, .youarefacingdown
	applyonemovement PLAYER, fast_step_up
	callasm .CheckContinueRockClimb
	iffalse .loop
	special Special_ForcePlayerStateNormal
	end
.youarefacingdown
	applyonemovement PLAYER, fast_step_down
	callasm .CheckContinueRockClimb
	iffalse .loop
	special Special_ForcePlayerStateNormal
	end

.CheckContinueRockClimb: ; cb38
	xor a
	ld [wScriptVar], a
	ld a, [wPlayerStandingTile]
	cp COLL_ROCK_CLIMB
	ret z
	ld a, $1
	ld [wScriptVar], a
	ret
	
.RockClimbSurf:
	ld a, PLAYER_SURF
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret

TryRockClimbOW:: ; cb56
	ld a, [wOptions1]
	bit DEBUG_MODE, a
	jr nz, .debugrockclimb

	call HasRockClimb
	jr z, .no
	ld a, BANK(Script_AskRockClimb)
	ld hl, Script_AskRockClimb
	call CallScript
	scf
	ret
	
.no
	xor a
	ret
	
.debugrockclimb
	ld a, BANK(DebugRockClimb)
	ld hl, DebugRockClimb
	call CallScript
	scf
	ret

Script_CantDoRockClimb: ; 0xcb7e
	jumptext .Text_CantDoRockClimb

.Text_CantDoRockClimb: ; 0xcb81
	text_jump CantDoRockClimbText
	db "@"

Script_AskRockClimb: ; 0xcb86
	checkflag ENGINE_ROCK_CLIMB_ACTIVE
	iftrue Script_AutoRockClimb
	opentext
	writetext .AskUseRockClimb
	yesorno
	iftrue Script_UsedRockClimb
	endtext
.no
	end

.AskUseRockClimb: ; 0xcb90
	text_jump AskUseRockClimbText
	db "@"
	
DebugRockClimb:
	opentext
	writetext DebugFieldMoveText
	closetext
	jump Script_AutoRockClimb
	
HasRockClimb: ; cf7c
	ld d, ROCK_CLIMB
	call CheckPartyCanLearnMove
	jr c, .no
	
	ld de, ENGINE_GOT_ROCK_CLIMB
	call CheckEngineFlag
	jr c, .no
	
	ld de, ENGINE_FOURTHBADGE
	call CheckEngineFlag
	jr c, .no
	
	call CheckMapCanRockClimb
	jr c, .no
	
.yes
	xor a
	jr .done

.no
	ld a, 1
.done
	ld [wScriptVar], a
	ret
	
TryDodrioJumpOW:: ; cec9
	ld a, [wPlayerState]
	cp PLAYER_DODRIO
	jr nz, .no

	ld a, BANK(DodrioJumpScript)
	ld hl, DodrioJumpScript
	call CallScript
	scf
	ret

.no
	xor a
	ret
	
DodrioJumpScript:
	killsfx
	playsound SFX_JUMP_OVER_LEDGE
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	if_equal UP, .YouAreFacingUp
	if_equal RIGHT, .YouAreFacingRight
	applyonemovement PLAYER, jump_step_left
	jump .end
.YouAreFacingDown
	applyonemovement PLAYER, jump_step_down
	jump .end
.YouAreFacingUp
	applyonemovement PLAYER, jump_step_up
	jump .end
.YouAreFacingRight
	applyonemovement PLAYER, jump_step_right
.end
	end

TryDodrioJump2OW:: ; cec9
	ld a, [wPlayerState]
	cp PLAYER_DODRIO
	jr nz, .no

	ld a, BANK(DodrioJump2Script)
	ld hl, DodrioJump2Script
	call CallScript
	scf
	ret

.no
	xor a
	ret
	
DodrioJump2Script:
	killsfx
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	if_equal UP, .YouAreFacingUp
	jump .end
.YouAreFacingDown
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement PLAYER, jump_step_down
	jump .end
.YouAreFacingUp
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement PLAYER, jump_step_up
	jump .end
	
.end
	end	
	
RockSmashFunction: ; ceeb
	call TryRockSmashFromMenu
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

TryRockSmashFromMenu: ; cef4
	call GetFacingObject
	jr c, .no_rock
	ld a, d
	cp SPRITEMOVEDATA_SMASHABLE_ROCK
	jr nz, .no_rock

	ld hl, RockSmashFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_rock
	call FieldMoveFailed
	ld a, $80
	ret
	
GetFacingObject:: ; cf0d
	farcall CheckFacingObject
	jr nc, .fail

	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret
	
GetFacingObjectSprite:: ; cf0d
	farcall CheckFacingObject
	jr nc, .fail

	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret

RockSmashFromMenuScript: ; 0xcf2e
	reloadmappart
	special UpdateTimePals

RockSmashScript: ; cf32
	callasm PrepareOverworldMove
	writetext UnknownText_0xcf58
	closetext
	waitsfx
	scall FieldMovePokepicScript
	setflag ENGINE_ROCK_SMASH_ACTIVE
AutoRockSmashScript:
	playsound SFX_STRENGTH
	earthquake 84
	applymovement2 MovementData_0xcf55
	disappear -2
	end

;possibly undummy later
;	callasm RockMonEncounter
;	copybytetovar wTempWildMonSpecies
;	iffalse .no_battle
;	randomwildmon
;	startbattle
;	reloadmapafterbattle
;	end

;.no_battle
;	callasm RockItemEncounter
;	iffalse .no_item
;	opentext
;	verbosegiveitem ITEM_FROM_MEM
;	closetext
;.no_item
;	end

MovementData_0xcf55: ; 0xcf55
	rock_smash 10
	step_end

UnknownText_0xcf58: ; 0xcf58
	text_jump UnknownText_0x1c08f0
	db "@"

AskRockSmashScript: ; 0xcf5d
	checkdebugmode
	iftrue .debugrocksmash
	callasm HasRockSmash
	ifequal 1, .no
	playsound SFX_READ_TEXT_2
	checkflag ENGINE_ROCK_SMASH_ACTIVE
	iftrue AutoRockSmashScript
	opentext
	writetext UnknownText_0xcf77
	yesorno
	iftrue RockSmashScript
	endtext
.no
	end
	
.debugrocksmash
	playsound SFX_READ_TEXT_2
	opentext
	writetext DebugFieldMoveText
	closetext
	jump AutoRockSmashScript

UnknownText_0xcf72: ; 0xcf72
	; Maybe a #MON can break this.
	text_jump UnknownText_0x1c0906
	db "@"

UnknownText_0xcf77: ; 0xcf77
	; This rock looks breakable. Want to use ROCK SMASH?
	text_jump UnknownText_0x1c0924
	db "@"

HasRockSmash: ; cf7c
	ld d, ROCK_SMASH
	call CheckPartyCanLearnMove
	jr c, .no
	
	ld de, ENGINE_GOT_ROCK_SMASH
	call CheckEngineFlag
	jr c, .no
	
	ld de, ENGINE_FIRSTBADGE
	call CheckEngineFlag
	jr c, .no
	
.yes
	xor a
	jr .done

.no
	ld a, 1
.done
	ld [wScriptVar], a
	ret

FishFunction: ; cf8e
	ld a, e
	push af
	call FieldMoveJumptableReset
	pop af
	ld [wBuffer2], a
.loop
	ld hl, .FishTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.FishTable: ; cfa5
	dw .TryFish
	dw .FishNoBite
	dw .FishGotSomething
	dw .FailFish
	dw .FishNoFish
	dw .FishGotItem

.TryFish: ; cfaf
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .fail
	cp PLAYER_SURF_PIKA
	jr z, .fail
	ld a, [wMapMusic]
	cp MUSIC_LAVA
	jr nz, .skip_lava
	ld a, [wMapGroup]
	cp GROUP_MT_ONWA_1F
	jr z, .fail
.skip_lava
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr z, .facingwater
.fail
	ld a, $3
	ret

.facingwater
	call GetFishingGroup
	and a
	jr nz, .goodtofish
	ld a, $4
	ret

.goodtofish
	ld d, a
	ld a, [wBuffer2]
	ld e, a

	; Suction Cups and Sticky Hold boost bite rate. This is done
	; by having these abilities result in 2 attempts being made
	; for getting an encounter.
	call GetLeadAbility
	cp SUCTION_CUPS
	jr z, .fish_attempt1
	cp STICKY_HOLD
	jr nz, .fish_attempt2
.fish_attempt1
	push de
	farcall Fish
	ld a, d
	and a
	jr nz, .gotabite1
	pop de
.fish_attempt2
	farcall Fish
	ld a, d
	and a
	jr nz, .gotabite2
	ld a, e
	and a
	jr z, .nonibble
.gotanitem
	ld a, e
	ld [wCurItem], a
	ld a, $5
	ret

.gotabite1
	ld [wTempWildMonSpecies], a
	ld a, e
	pop de
	ld e, a
	ld a, [wTempWildMonSpecies]
.gotabite2
	ld [wTempWildMonSpecies], a
	; Check if we buff the wild mon, and by how much.
	call Random
	cp 45 percent
	jr c, .ok
	inc e
	cp 65 percent
	jr c, .ok
	inc e
	cp 85 percent
	jr c, .ok
	inc e
; Store the level
.ok	
	ld a, e
	ld [wCurPartyLevel], a
	ld a, BATTLETYPE_FISH
	ld [wBattleType], a
	ld a, $2
	ret

.nonibble
	ld a, $1
	ret

.FailFish: ; cff1
	ld a, $80
	ret

.FishGotSomething: ; cff4
	ld a, $1
	ld [wBuffer6], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, $81
	ret

.FishNoBite: ; d002
	ld a, $2
	ld [wBuffer6], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, $81
	ret

.FishNoFish: ; d010
	xor a
	ld [wBuffer6], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, $81
	ret

.FishGotItem:
	ld a, $1
	ld [wBuffer6], a
	ld hl, Script_GotAnItem
	call QueueScript
	ld a, $81
	ret

Script_NotEvenANibble: ; 0xd01e
	scall Script_FishCastRod
	opentext
	writetext UnknownText_0xd0a9
	loademote EMOTE_SHADOW
	closetext
	callasm PutTheRodAway
	end

Script_GotAnItem:
	scall Script_FishCastRod
;	callasm MakePalGray
	iffalse .NotFacingUp
	applymovement PLAYER, Movement_HookedItemFacingUp
	jump .GetTheHookedItem
.NotFacingUp:
	applymovement PLAYER, Movement_HookedItemNotFacingUp
.GetTheHookedItem:
	pause 40
	applymovement PLAYER, Movement_RestoreRod
	callasm PutTheRodAway
	callasm CurItemToScriptVar
	opentext
	verbosegiveitem ITEM_FROM_MEM
	endtext

Script_GotABite: ; 0xd035
	scall Script_FishCastRod
;	callasm MakePalGray
	callasm Fishing_CheckFacingUp
	iffalse .NotFacingUp
	applymovement PLAYER, Movement_BiteFacingUp
	jump .FightTheHookedPokemon
.NotFacingUp: ; 0xd046
	applymovement PLAYER, Movement_BiteNotFacingUp
.FightTheHookedPokemon: ; 0xd04a
	pause 40
	applymovement PLAYER, Movement_RestoreRod
	opentext
	writetext UnknownText_0xd0a4
	closetext
	callasm PutTheRodAway
	randomwildmon
	startbattle
	reloadmapafterbattle
	end

Movement_BiteNotFacingUp: ; d05c
	fish_got_bite
	fish_got_bite
	fish_got_bite
Movement_HookedItemNotFacingUp:
	fish_got_bite
;	show_emote
	step_end

Movement_BiteFacingUp: ; d062
	fish_got_bite
	fish_got_bite
	fish_got_bite
Movement_HookedItemFacingUp:
	fish_got_bite
	step_sleep_1
;	show_emote
	step_end

Movement_RestoreRod: ; d069
;	hide_emote
	fish_cast_rod
	step_end

Fishing_CheckFacingUp: ; d06c
	ld a, [wPlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .up
	xor a

.up
	ld [wScriptVar], a
	ret

Script_FishCastRod: ; 0xd07c
;	reloadmappart
	loadvar hBGMapMode, $0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
;	loademote EMOTE_SHOCK
	applymovement PLAYER, MovementData_0xd093
	pause 40
	end

MovementData_0xd093: ; d093
	fish_cast_rod
	step_end

PutTheRodAway: ; d095
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [wPlayerAction], a
	call UpdateSprites
	jp ReplaceKrisSprite

CurItemToScriptVar:
	ld a, [wCurItem]
	ld [wScriptVar], a
	ret

UnknownText_0xd0a4: ; 0xd0a4
	; Oh! A bite!
	text_jump UnknownText_0x1c0958
	db "@"

UnknownText_0xd0a9: ; 0xd0a9
	; Not even a nibble!
	text_jump UnknownText_0x1c0965
	db "@"

BikeFunction: ; d0b3
	call .TryBike
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TryBike: ; d0bc
	ld hl, wHaveFollower
	bit 0, [hl] ; ENGINE_BIKE_GEAR
	jr nz, .CannotUseBike ;set
	ld a, [wPlayerStandingTile]
	cp COLL_NO_BIKE
	jp z, .floortoobumpy
	
	call .CheckEnvironment
	jr c, .CannotUseBike
	ld a, [wPlayerState]
	and a ; cp PLAYER_NORMAL
	jr z, .GetOnBike
	cp PLAYER_RUN
	jr z, .GetOnBike
	cp PLAYER_SKATEBOARD
	jr z, .GetOnBike
	cp PLAYER_SKATEBOARD_MOVING
	jr z, .GetOnBike
	cp PLAYER_BIKE
	jr z, .GetOffBike
	jr .CannotUseBike

.GetOnBike:
	ld a, 1
	ld [wOnBike], a
	xor a
	ld [wOnSkateboard], a
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call .CheckIfRegistered
	jr .done

.GetOffBike:
	ld hl, wOWState
	bit OWSTATE_BIKING_FORCED, [hl]
	jr nz, .CantGetOffBike
	xor a
	ld [wOnBike], a
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call .CheckIfRegistered
	jr .done

.CantGetOffBike:
	ld hl, Script_CantGetOffBike
	jr .done

.CannotUseBike:
	xor a
	ret

.floortoobumpy
	call RefreshScreen
	ld hl, Script_FloorTooBumpyBike
	jr .done
	
.done
	call QueueScript
	ld a, $1
	ret

.CheckIfRegistered: ; d119
	ld a, [wUsingItemWithSelect]
	and a
	ret z
	ld h, d
	ld l, e
	ret

.CheckEnvironment: ; d121
	ld a, [wPlayerStandingTile]
	cp COLL_SAND
	jr z, .nope
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	cp PERM_5
	jr z, .ok
	jr .nope

.ok
	call GetPlayerStandingTile
	and $f ; cp LANDTILE ; can't use our bike in a wall or on water
	jr nz, .nope
	xor a
	ret

.nope
	scf
	ret

Script_GetOnBike: ; 0xd13e
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_BIKE
	writetext GotOnTheBikeText
	waitbutton
	closetext
FinishGettingOnBike:
	special ReplaceKrisSprite
;	special PlayMapMusic
	end

Script_GetOnBike_Register: ; 0xd14e
	writecode VAR_MOVEMENT, PLAYER_BIKE
	jump FinishGettingOnBike

Script_GetOffBike: ; 0xd158
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	writetext GotOffTheBikeText
	waitbutton
	closetext
FinishGettingOffBike:
	special ReplaceKrisSprite
;	special PlayMapMusic
	end

Script_GetOffBike_Register: ; 0xd16b
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	jump FinishGettingOffBike

Script_CantGetOffBike: ; 0xd171
	writetext .CantGetOffBikeText
	waitendtext

.CantGetOffBikeText: ; 0xd177
	; You can't get off here!
	text_jump UnknownText_0x1c099a
	db "@"

GotOnTheBikeText: ; 0xd17c
	; got on the @ .
	text_jump UnknownText_0x1c09b2
	db "@"

GotOffTheBikeText: ; 0xd181
	; got off the @ .
	text_jump UnknownText_0x1c09c7
	db "@"

Script_FloorTooBumpyBike: ; 0xd171
	writetext .FloorTooBumpyBikeText
	waitendtext

.FloorTooBumpyBikeText
	text_jump _NoBikeText
	db "@"
	
SkateboardFunction: ; d0b3
	call .TrySkateboard
	and $7f
	ld [wFieldMoveSucceeded], a
	ret

.TrySkateboard: ; d0bc
	ld hl, wHaveFollower
	bit 0, [hl] ; ENGINE_BIKE_GEAR
	jr nz, .CannotUseSkateboard ;set
	ld a, [wPlayerStandingTile]
	cp COLL_NO_BIKE
	jp z, .floortoobumpy
	
	call .CheckEnvironmentSkateboard
	jr c, .CannotUseSkateboard
	ld a, [wPlayerState]
	and a ; cp PLAYER_NORMAL
	jr z, .GetOnSkateboard
	cp PLAYER_RUN
	jr z, .GetOnSkateboard
	cp PLAYER_BIKE
	jr z, .GetOnSkateboard
	cp PLAYER_SKATEBOARD
	jr z, .GetOffSkateboard
	cp PLAYER_SKATEBOARD_MOVING
	jr z, .GetOffSkateboard
	jr .CannotUseSkateboard

.GetOnSkateboard:
	ld a, 1
	ld [wOnSkateboard], a
	xor a
	ld [wOnBike], a
	ld hl, Script_GetOnSkateboard
	ld de, Script_GetOnSkateboard_Register
	call .CheckIfRegistered
	jr .done

.GetOffSkateboard:
	ld hl, wOWState
	bit OWSTATE_BIKING_FORCED, [hl]
	jr nz, .CantGetOffSkateboard
	xor a
	ld [wOnSkateboard], a
	ld hl, Script_GetOffSkateboard
	ld de, Script_GetOffSkateboard_Register
	call .CheckIfRegistered
	jr .done

.CantGetOffSkateboard:
	ld hl, Script_CantGetOffSkateboard
	jr .done

.CannotUseSkateboard:
	xor a
	ret

.floortoobumpy
	call RefreshScreen
	ld hl, Script_FloorTooBumpySkateboard
	jr .done
	
.done
	call QueueScript
	ld a, $1
	ret

.CheckIfRegistered: ; d119
	ld a, [wUsingItemWithSelect]
	and a
	ret z
	ld h, d
	ld l, e
	ret
.CheckEnvironmentSkateboard:
	ld a, [wMapGroup]
	cp GROUP_LUSTER_MALL
	jr nz, .CheckEnvironment
	ld a, [wMapNumber]
	cp MAP_LUSTER_MALL_SKATE_TEST
	jr z, .ok

.CheckEnvironment: ; d121
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	cp PERM_5
	jr z, .ok
	jr .nope

.ok
	call GetPlayerStandingTile
	and $f ; cp LANDTILE ; can't use our skateboard in a wall or on water
	jr nz, .nope
	xor a
	ret

.nope
	scf
	ret

Script_GetOnSkateboard: ; 0xd13e
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_SKATEBOARD
	writetext GotOnTheSkateboardText
	waitbutton
	closetext
FinishGettingOnSkateboard:
	special ReplaceKrisSprite
	end

Script_GetOnSkateboard_Register: ; 0xd14e
	writecode VAR_MOVEMENT, PLAYER_SKATEBOARD
	jump FinishGettingOnSkateboard

Script_GetOffSkateboard: ; 0xd158
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	writetext GotOffTheSkateboardText
	waitbutton
	closetext
FinishGettingOffSkateboard:
	special ReplaceKrisSprite
;	special PlayMapMusic
	end

Script_GetOffSkateboard_Register: ; 0xd16b
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	jump FinishGettingOffSkateboard

Script_CantGetOffSkateboard: ; 0xd171
	writetext .CantGetOffSkateboardText
	waitendtext

.CantGetOffSkateboardText: ; 0xd177
	; You can't get off here!
	text_jump UnknownText_0x1c099a
	db "@"

GotOnTheSkateboardText: ; 0xd17c
	; got on the @ .
	text_jump UnknownText_0x1c09b2
	db "@"

GotOffTheSkateboardText: ; 0xd181
	; got off the @ .
	text_jump UnknownText_0x1c09c7
	db "@"

Script_FloorTooBumpySkateboard: ; 0xd171
	writetext .FloorTooBumpySkateboardText
	waitendtext

.FloorTooBumpySkateboardText
	text_jump _NoBikeText                                          ;TODO: change this
	db "@"

HasCutAvailable:: ; d186
	ld d, CUT
	call CheckPartyCanLearnMove
	jr c, .no
	
	ld de, ENGINE_GOT_CUT
	call CheckEngineFlag
	jr c, .no

	ld de, ENGINE_SECONDBADGE
	call CheckEngineFlag
	jr c, .no

.yes
	xor a
	jr .done

.no
	ld a, 1
.done
	ld [wScriptVar], a
	ret

AskCutTreeScript: ; 0xd1a9
	checkdebugmode
	iftrue .debugcut
	callasm HasCutAvailable
	ifequal 1, .no
	playsound SFX_READ_TEXT_2
	checkflag ENGINE_AUTOCUT_ACTIVE
	iftrue AutoCutTreeScript
	opentext
	writetext UnknownText_0xd1c8
	yesorno
	iftrue Script_CutTree
	endtext

.no ; 0xd1cd
	end

.debugcut
	playsound SFX_READ_TEXT_2
	opentext
	writetext DebugFieldMoveText
	jump AutoCutTreeScript
	
UnknownText_0xd1c8: ; 0xd1c8
	; This tree can be CUT! Want to use CUT?
	text_jump UnknownText_0x1c09dd
	db "@"

UnknownText_0xd1d0: ; 0xd1d0
	; This tree can be CUT!
	text_jump UnknownText_0x1c0a05
	db "@"

HandleEventsFly:
	clearevent EVENT_SNOWSTORM_HAPPENING
	clearevent EVENT_SANDSTORM_HAPPENING
	clearevent EVENT_AIRPORT_FENCE
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger SUNSET_CAPE, $0
	domaptrigger ROUTE_10, $0
	domaptrigger DESERT_ROUTE_NORTH, $0
	domaptrigger DESERT_WASTELAND_1, $0
	clearevent EVENT_ON_DODRIO_RANCH
	clearevent EVENT_AT_AIRPORT
	clearflag ENGINE_NEAR_CAMPFIRE
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_BEAT_SUNSET_CAPE_LIGHTHOUSE_SPRITES
	clearevent EVENT_LAKE_ROCKS_BROWN
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	clearflag ENGINE_ENCOUNTER_HOUSE
	end
	