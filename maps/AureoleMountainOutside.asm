AureoleMountainOutside_MapScriptHeader:
	db 4 ; scene scripts
	scene_script AureoleMountainOutsideTrigger0
	scene_script AureoleMountainOutsideTrigger1
	scene_script AureoleMountainOutsideTrigger2
	scene_script AureoleMountainOutsideTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AureoleMountainOutsideChangeBlocks

	db 4 ; warp events
	warp_def 21, 10, 10, AUREOLE_MOUNTAIN_1F
	warp_def 15, 36, 1, AUREOLE_MOUNTAIN_4F
	warp_def -1, -1, 4, AUREOLE_MOUNTAIN_5F
	warp_def  5, 20, 3, LUMINA_TOWN_CAVE

	db 4 ; coord events
	coord_event  4, 10, 0, AureoleMountainOutsideBridgeUp
	coord_event  5, 10, 0, AureoleMountainOutsideBridgeUp
	coord_event  4, 11, 1, AureoleMountainOutsideBridgeDown
	coord_event  5, 11, 1, AureoleMountainOutsideBridgeDown

	db 3 ; bg events
	signpost  4, 27, SIGNPOST_JUMPTEXT, AureoleMountainOutsideBarrelText
	signpost  5, 27, SIGNPOST_JUMPTEXT, AureoleMountainOutsideBarrelText
	signpost  4, 25, SIGNPOST_READ, AureoleMountainOutsideWell

	db 5 ; object events
	object_event 25,  6, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, AureoleMountainOutsideItemBall, EVENT_WELL_ITEM_GONE
	object_event 25,  4, SPRITE_SPARKLE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event 25,  4, SPRITE_SPARKLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event 25,  6, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, AureoleMountainOutsideTapeBall, EVENT_WELL_TAPE_GONE
	object_event 25,  4, SPRITE_CORY_NPC, SPRITEMOVEDATA_NO_RENDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1


AureoleMountainOutsideTrigger0:
AureoleMountainOutsideTrigger1:
AureoleMountainOutsideTrigger2:
	end
	
AureoleMountainOutsideTrigger3:
	priorityjump AureoleMountainOutsideWellEvent
	end

AureoleMountainOutsideChangeBlocks:
	checkscene
	ifequal $1, .changeblocks
	return
.changeblocks
	changeblock $16, $c, $b1
	changeblock $18, $c, $b2
	changeblock $1a, $c, $b3
	return

AureoleMountainOutsideItemBall:
	callasm AureoleMountainOutsideWellRamIntoCurItemBallContents
	farscall FindItemInBallScript
	end
	
AureoleMountainOutsideTapeBall:
	callasm AureoleMountainOutsideWellRamIntoCurItemBallContents
	farscall FindTapeInBallScript
	end

AureoleMountainOutsideWell:
	jumptext AureoleMountainOutsideWellText1

AureoleMountainOutsideWellEvent:
	dotrigger $0
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .done_for_today
	callasm AureoleMountainOutsideCheckMurkrowAsm
	if_equal 3, .done_for_today
	checkevent EVENT_WELL_ITEM_GONE
	iffalse .done_for_today
	checkevent EVENT_WELL_TAPE_GONE
	iffalse .done_for_today
	callasm AureoleMountainOutsideWellAsm1
	if_equal GOLD_COIN, .gold_coin
	if_equal SILVER_COIN, .silver_coin
	jump .normal
.gold_coin
	checkevent EVENT_MUSIC_LUMINA_TOWN
	iftrue .normal
	setevent EVENT_GET_MUSIC_LUMINA_TOWN
	jump .normal
.silver_coin
	checkevent EVENT_MUSIC_AUREOLE_MOUNTAIN
	iftrue .normal
	setevent EVENT_GET_MUSIC_AUREOLE_MOUNTAIN
.normal
	writetext AureoleMountainOutsideWellText2
	playsound SFX_KINESIS
	pause 20
	closetext
	copybytetovar wCurItem
	takeitem ITEM_FROM_MEM
	waitsfx
	callasm AureoleMountainOutsideWellPaletteAsm
	special FadeInPalettes
	pause 25
	playsound SFX_MOVE_PUZZLE_PIECE
	waitsfx
	pause 40
	setevent EVENT_DONT_ADJUST_CRY_VOLUME
	loadvar wVolume, $33
	cry MURKROW
	waitsfx
	loadvar wVolume, $77
	clearevent EVENT_DONT_ADJUST_CRY_VOLUME
	pause 45
	playsound SFX_FORESIGHT
	appear 2
	pause 2
	spriteface 2, LEFT
	pause 2
	applyonemovement 2, turn_step_up
	pause 4
	spriteface 2, LEFT
	pause 2
	spriteface 2, UP
	pause 2
	disappear 2
	waitsfx
	callasm LoadMapPals
	special FadeInPalettes
	pause 15
	playsound SFX_CHANGE_DEX_MODE
	checkevent EVENT_GET_MUSIC_LUMINA_TOWN
	iftrue .tape
	checkevent EVENT_GET_MUSIC_AUREOLE_MOUNTAIN
	iftrue .tape
;item
	moveperson 1, 25, 4
	appear 1
	priority 1, HIGH_PRIORITY
	applymovement 1, Movement_AureoleMountainOutsideWell
	setlasttalked 1
	jump .done_ball_appear
.tape
	moveperson 4, 25, 4
	appear 4
	priority 4, HIGH_PRIORITY
	applymovement 4, Movement_AureoleMountainOutsideWell
	setlasttalked 4
.done_ball_appear
	pause 5
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	if_equal RIGHT, .YouAreFacingRight
	jump .done_move
.YouAreFacingLeft
	applymovement PLAYER, Movement_AureoleMountainOutsideWellPlayerLeft
	jump .done_move
.YouAreFacingRight
	applymovement PLAYER, Movement_AureoleMountainOutsideWellPlayerRight
.done_move
	applyonemovement PLAYER, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	checkevent EVENT_GET_MUSIC_LUMINA_TOWN
	iftrue .lumina
	checkevent EVENT_GET_MUSIC_AUREOLE_MOUNTAIN
	iftrue .aureole
;item
	callasm AureoleMountainOutsideWellAsm2
	callasm AureoleMountainOutsideWellLoadItemIntoWellItemRamAsm
	callasm AureoleMountainOutsideWellRamIntoCurItemBallContents
	farscall FindItemInBallScript
	jump .done_get_item
.lumina
	clearevent EVENT_GET_MUSIC_LUMINA_TOWN
	loadvar wCurItemBallQuantity, 1
	loadvar wCurItemBallContents, MUSIC_LUMINA_TOWN
	loadvar wWellItem, MUSIC_LUMINA_TOWN
	farscall FindTapeInBallScript
	iffalse .done_get_item
	setevent EVENT_MUSIC_LUMINA_TOWN
	jump .done_get_item
.aureole
	clearevent EVENT_GET_MUSIC_AUREOLE_MOUNTAIN
	loadvar wCurItemBallQuantity, 1
	loadvar wCurItemBallContents, MUSIC_AUREOLE_MOUNTAIN
	loadvar wWellItem, MUSIC_AUREOLE_MOUNTAIN
	farscall FindTapeInBallScript
	iffalse .done_get_item
	setevent EVENT_MUSIC_AUREOLE_MOUNTAIN
.done_get_item
	callasm AureoleMountainOutsideCheckMurkrowAsm
	if_not_equal 3, .end
	pause 10
	setevent EVENT_DONT_ADJUST_CRY_VOLUME
	loadvar wVolume, $33
	cry MURKROW
	waitsfx
	loadvar wVolume, $77
	clearevent EVENT_DONT_ADJUST_CRY_VOLUME
	pause 20
	playsound SFX_UNKNOWN_63
	waitsfx
	applyonemovement PLAYER, turn_step_up
	playsound SFX_FLY
	appear 3
	applymovement 3, Movement_AureoleMountainOutsideWellFly
	disappear 3
	pause 5
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	jumptext AureoleMountainOutsideWellText4
.end
	end
.no
	writetext AureoleMountainOutsideWellTextNo
	waitbutton
	closetext
	end
.done_for_today
	writetext AureoleMountainOutsideWellText3
	waitbutton
	closetext
	end
	
AureoleMountainOutsideWellRamIntoCurItemBallContents:
	ld a, [wWellItem]
	ld [wCurItemBallContents], a
	ld a, 1
	ld [wCurItemBallQuantity], a
	ret
	
AureoleMountainOutsideWellLoadItemIntoWellItemRamAsm:
	ld a, [wCurItem]
	ld [wWellItem], a
	ret
	
AureoleMountainOutsideCheckMurkrowAsm:
	ld a, [wMurkrowWell]
	ld [wScriptVar], a
	ret
	
AureoleMountainOutsideWellPaletteAsm:
	ld a, [wMurkrowWell]
	inc a
	ld [wMurkrowWell], a
	ld hl, AureoleMountainOutsideWhitePalette
	ld de, wUnknOBPals + 7 palettes
	ld bc, 1 palettes
	ld a, $5 ; BANK(UnknOBPals)
	jp FarCopyWRAM
	
AureoleMountainOutsideWhitePalette:
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	
Movement_AureoleMountainOutsideWell:
	fix_facing
	set_sliding
	jump_step_down
	remove_sliding
	remove_fixed_facing
	step_end
	
Movement_AureoleMountainOutsideWellPlayerLeft:
	step_down
	step_left
	step_end
	
Movement_AureoleMountainOutsideWellPlayerRight:
	step_down
	step_right
	step_end
	
Movement_AureoleMountainOutsideWellFly:
	fix_facing
	fast_step_up
	fast_step_up
	fast_step_up
	fast_step_up
	remove_fixed_facing
	step_end
	
AureoleMountainOutsideWellText1:
	text "An old, dried-out"
	line "well."
	done
	
AureoleMountainOutsideWellText2:
	text "<PLAYER> tossed down"
	line "the @"
	text_from_ram wStringBuffer1
	text "."
	done
	
AureoleMountainOutsideWellText3:
	text "Better not throw"
	line "anything else in"
	cont "for now."
	done
	
AureoleMountainOutsideWellText4:
	text "A #MON flew"
	line "away!"
	done
	
AureoleMountainOutsideWellTextNo:
	text "Better not…"
	done
	
AureoleMountainOutsideWellAsm1:
	ld a, [wCurItem]
	push af
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call CopyName1
	pop af
	ld [wScriptVar], a
	ret
	
AureoleMountainOutsideWellAsm2:
	ld a, [wCurItem]
	dec a
	ld e, a
	xor a
	ld d, a
	ld hl, WellItemTrades
	add hl, de
	ld a, [hl]
	ld [wScriptVar], a
	ld [wCurItem], a
	ret

AureoleMountainOutsideBarrelText:
	text "Big empty barrels."
	done
	
AureoleMountainOutsideBridgeUp:
	changeblock $16, $c, $b1
	changeblock $18, $c, $b2
	changeblock $1a, $c, $b3
	dotrigger $1
	end
	
AureoleMountainOutsideBridgeDown:
	changeblock $16, $c, $b5
	changeblock $18, $c, $b6
	changeblock $1a, $c, $b7
	dotrigger $0
	end
	
INCLUDE "data/items/well_item_trades.asm"
	