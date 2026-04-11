AureoleMountainOutside_MapScriptHeader:
	db 4 ; scene scripts
	scene_script AureoleMountainOutsideTrigger0
	scene_script AureoleMountainOutsideTrigger1
	scene_script AureoleMountainOutsideTrigger2
	scene_script AureoleMountainOutsideTrigger3

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, AureoleMountainOutsideChangeBlocks

	db 3 ; warp events
	warp_def 49, 10, 10, AUREOLE_MOUNTAIN_1F
	warp_def 43, 36, 1, AUREOLE_MOUNTAIN_4F
	warp_def 23, 30, 4, AUREOLE_MOUNTAIN_5F

	db 4 ; coord events
	coord_event  4, 38, 0, AureoleMountainOutsideBridgeUp
	coord_event  5, 38, 0, AureoleMountainOutsideBridgeUp
	coord_event  4, 39, 1, AureoleMountainOutsideBridgeDown
	coord_event  5, 39, 1, AureoleMountainOutsideBridgeDown

	db 3 ; bg events
	signpost 32, 27, SIGNPOST_JUMPTEXT, AureoleMountainOutsideBarrelText
	signpost 33, 27, SIGNPOST_JUMPTEXT, AureoleMountainOutsideBarrelText
	signpost 32, 25, SIGNPOST_READ, AureoleMountainOutsideWell

	db 3 ; object events
	object_event 25, 32, SPRITE_BALL_CUT_FRUIT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event 25, 32, SPRITE_SPARKLE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	object_event 25, 32, SPRITE_SPARKLE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET


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
	changeblock $16, $28, $b1
	changeblock $18, $28, $b2
	changeblock $1a, $28, $b3
	return

AureoleMountainOutsideWell:
	jumptext AureoleMountainOutsideWellText1

AureoleMountainOutsideWellEvent:
	dotrigger $0
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .done_for_today
	callasm Movement_AureoleMountainOutsideCheckMurkrowAsm
	if_equal 3, .done_for_today
	callasm AureoleMountainOutsideWellAsm1
	writetext AureoleMountainOutsideWellText2
	playsound SFX_KINESIS
	pause 20
	closetext
	takeitem ITEM_FROM_MEM
	waitsfx
	callasm AureoleMountainOutsideWellPaletteAsm
	special FadeInPalettes
	pause 25
	playsound SFX_MOVE_PUZZLE_PIECE
	waitsfx
	pause 40
	cry MURKROW
	waitsfx
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
	appear 1
	priority 1, HIGH_PRIORITY
	applymovement 1, Movement_AureoleMountainOutsideWell
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
	disappear 1
	opentext
	callasm AureoleMountainOutsideWellAsm2
	verbosegiveitem ITEM_FROM_MEM
	closetext
	callasm Movement_AureoleMountainOutsideCheckMurkrowAsm
	if_not_equal 3, .end
	pause 10
	cry MURKROW
	waitsfx
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
	
Movement_AureoleMountainOutsideCheckMurkrowAsm:
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
	ld [wScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call CopyName1
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
	ret

AureoleMountainOutsideBarrelText:
	text "Big empty barrels."
	done
	
AureoleMountainOutsideBridgeUp:
	changeblock $16, $28, $b1
	changeblock $18, $28, $b2
	changeblock $1a, $28, $b3
	dotrigger $1
	end
	
AureoleMountainOutsideBridgeDown:
	changeblock $16, $28, $b5
	changeblock $18, $28, $b6
	changeblock $1a, $28, $b7
	dotrigger $0
	end
	
INCLUDE "data/items/well_item_trades.asm"
	