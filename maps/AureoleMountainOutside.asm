AureoleMountainOutside_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def 49, 10, 10, AUREOLE_MOUNTAIN_1F
	warp_def 43, 36, 3, AUREOLE_MOUNTAIN_OUTSIDE
	warp_def 23, 30, 2, AUREOLE_MOUNTAIN_OUTSIDE

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


AureoleMountainOutsideWell:
	opentext
	callasm Movement_AureoleMountainOutsideCheckMurkrowAsm
	if_equal 2, .done_for_today
	writetext AureoleMountainOutsideWellText1
	yesorno
	iffalse .no
	special FadeOutPalettes
	special Special_ChooseItem
	pause 5
	iffalse .no
	callasm AureoleMountainOutsideWellAsm1
	takeitem ITEM_FROM_MEM
	callasm AureoleMountainOutsideWellAsm2
	writetext AureoleMountainOutsideWellText2
	playsound SFX_KINESIS
	waitsfx
	closetext
	callasm AureoleMountainOutsideWellPaletteAsm
	special FadeInPalettes
	pause 25
	playsound SFX_MOVE_PUZZLE_PIECE
	waitsfx
	pause 40
	cry MURKROW
	waitsfx
	pause 20
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
	pause 30
	playsound SFX_CHANGE_DEX_MODE
	appear 1
	priority 1, HIGH_PRIORITY
	applymovement 1, Movement_AureoleMountainOutsideWell
	pause 5
	applyonemovement PLAYER, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	disappear 1
	opentext
	verbosegiveitem ITEM_FROM_MEM
	closetext
	callasm Movement_AureoleMountainOutsideCheckMurkrowAsm
	if_not_equal 2, .end
	pause 10
	cry MURKROW
	waitsfx
	pause 20
	playsound SFX_UNKNOWN_63
	playsound SFX_FLY
	appear 3
	applymovement 3, Movement_AureoleMountainOutsideWellFly
	disappear 3
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
	
	para "Throw something"
	line "inside?"
	done
	
AureoleMountainOutsideWellText2:
	text "<PLAYER> threw in"
	line "the @"
	text_from_ram wStringBuffer1
	text "."
	done
	
AureoleMountainOutsideWellText3:
	text "An old, dried-out"
	line "well."
	done
	
AureoleMountainOutsideWellTextNo:
	text "Better not…"
	done
	
AureoleMountainOutsideWellAsm1:
	ld a, [wCurItem]
	ld [wScriptVar], a
	ret
	
AureoleMountainOutsideWellAsm2:
	ld a, [wCurItem]
	push af
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call CopyName1
	pop af
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
	