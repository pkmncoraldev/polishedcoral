Route3StarglowCavernTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 12,  8, 1, STARGLOW_CAVERN_DEPTHS
	warp_def  3,  4, 1, GLINT_POKECENTER

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_PATCHES, 14,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route3StarglowCavernTopPatches, -1
	
	const_def 1 ; object constants
	const ROUTE_3_TOP_PATCHES


Route3StarglowCavernTopPatches:
	faceplayer
	opentext
	writetext Route3StarglowCavernTopPatchesText1
	yesorno
	iffalse .saidno1
	writetext Route3StarglowCavernTopPatchesText2Yes
	yesorno
	iffalse .saidno2
.return
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .cont
	if_equal UP, .YouAreFacingUp
	applymovement PLAYER, Movement_Route3StarglowCavernTopPlayer1
.YouAreFacingUp
	applymovement PLAYER, Movement_Route3StarglowCavernTopPlayer2
.cont
	spriteface PLAYER, UP
	spriteface ROUTE_3_TOP_PATCHES, LEFT
	callasm PatchesSwapPokemonAsm
	setevent EVENT_PATCHES_MODE
	wait 10
	opentext
	writetext Route3StarglowCavernTopPatchesText3
	waitbutton
	closetext
	wait 10
	spriteface ROUTE_3_TOP_PATCHES, UP
	applyonemovement ROUTE_3_TOP_PATCHES, fix_facing
	applyonemovement ROUTE_3_TOP_PATCHES, slow_step_down
	opentext
	writetext Route3StarglowCavernTopPatchesText4
	waitbutton
	closetext
	wait 10
	applyonemovement ROUTE_3_TOP_PATCHES, slow_step_left
	wait 5
	opentext
	writetext Route3StarglowCavernTopPatchesText5
	waitbutton
	closetext
	applymovement ROUTE_3_TOP_PATCHES, Movement_Route3StarglowCavernTopPatches
	playsound SFX_BUMP
	callasm PatchesFallAsm
	applyonemovement PLAYER, jump_step_up
	warpcheck
	end
.saidno1
	writetext Route3StarglowCavernTopPatchesText2No
	yesorno
	iftrue .return
.saidno2
	writetext Route3StarglowCavernTopPatchesTextSaidNo
	waitbutton
	closetext
	spriteface ROUTE_3_TOP_PATCHES, UP
	end
	
PatchesFallAsm:
	ld a, PLAYER_FALLING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
PatchesSwapPokemonAsm: ;taken from leafcrytal by atma
; open sram
	ld a, BANK(sScratch)
	call OpenSRAM
; copy party data to scratch
	ld hl, wPokemonData
	ld bc, wPartyMonNicknamesEnd - wPokemonData
	ld de, sScratch
	call CopyBytes
; swap backup party with scratch
	ld a, BANK(wBackupPartyData)
	ldh [rSVBK], a
	ld hl, sScratch
	ld de, wBackupPartyData
	ld bc, wPartyMonNicknamesEnd - wPokemonData
	call SwapBytes
	ld a, BANK(wPokemonData)
	ldh [rSVBK], a
; copy backup party from scratch to main party
	ld hl, sScratch
	ld bc, wPartyMonNicknamesEnd - wPokemonData
	ld de, wPokemonData
	call CopyBytes
; close sram
	call CloseSRAM	
; turn patches mode on
	ld hl, wStatusFlags2
	set 6, [hl] ; ENGINE_PATCHES_MODE
	ret

SwapBytes::
; swap bc bytes between hl and de
.Loop:
	; stash [hl] away on the stack
	ld a, [hl]
	push af

	; copy a byte from [de] to [hl]
	ld a, [de]
	ld [hli], a

	; retrieve the previous value of [hl]; put it in [de]
	pop af
	ld [de], a
	inc de

	; handle loop stuff
	dec bc
	ld a, b
	or c
	jr nz, .Loop
	ret

;	farcall SaveBox
;	ld a, [wCurBox]
;	ld [wMoogoo], a
;	ld a, 13
;	ld [wCurBox], a
;	farcall LoadBox
;.loop
;	xor a
;	ld [wCurPartyMon], a
;	ld a, [wPartyMon1Species]
;	ld [wCurPartySpecies], a
;	farcall DepositPokemonPatches
;	ld a, [wPartyCount]
;	cp 1
;	jr nz, .loop
;	ld a, [wMoogoo]
;	ld [wCurBox], a
;	farcall LoadBox
;	ret
	
Route3StarglowCavernTopPatchesText1:
	text "Well, hi there."
	
	para "What's someone like"
	line "you doing up here?"
	
	para "Are you a TRAINER"
	line "looking for some"
	cont "#MON to catch?"
	done
	
Route3StarglowCavernTopPatchesText2Yes:
	text "Of course you are!"
	
	para "And probably a"
	line "really great one,"
	cont "too!"
	
	para "Well listen, I saw"
	line "a real strong"
	cont "#MON down this"
	cont "hole."
	
	para "I was thinking of"
	line "maybe going down"
	cont "and catching it"
	cont "myself."
	
	para "But maybe it's best"
	line "left for a tough"
	cont "TRAINER like you!"
	
	para "Go on, take a"
	line "look!"
	done
	
Route3StarglowCavernTopPatchesText2No:
	text "Good!"
	
	para "Kids your age"
	line "should leave the"
	cont "training to the"
	cont "adults!"
	
	para "Well listen, I saw"
	line "a real valuable"
	cont "treasure down this"
	cont "hole."
	
	para "I was thinking of"
	line "maybe going down"
	cont "and grabbing it"
	cont "myself."
	
	para "But you're such a"
	line "good kid, maybe"
	cont "you could have it."
	
	para "Go on, take a"
	line "look!"
	done
	
Route3StarglowCavernTopPatchesText3:
	text "See it?"
	
	para "Pretty cool, huh?"
	done
	
Route3StarglowCavernTopPatchesText4:
	text "Oh?"
	
	para "You don't see it?"
	
	para "Keep looking!"
	
	para "It's definitely"
	line "down there."
	done
	
Route3StarglowCavernTopPatchesText5:
	text "Still don't see"
	line "it, huh?"
	
	para "Well…"
	
	para "Maybe you should"
	line "get a closer look!"
	done
	
Route3StarglowCavernTopPatchesTextSaidNo:
	text "Suit yourself"
	line "then…"
	done
	
Movement_Route3StarglowCavernTopPatches:
	fast_step_down
	fast_step_up
	remove_fixed_facing
	step_end
	
Movement_Route3StarglowCavernTopPlayer1:
	step_down
	step_left
	step_end
	
Movement_Route3StarglowCavernTopPlayer2:
	step_left
	step_up
	step_end