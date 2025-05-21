Route3StarglowCavernTop_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, Route3StarglowCavernTopCallback

	db 2 ; warp events
	warp_def 12,  8, 1, STARGLOW_CAVERN_DEPTHS
	warp_def  3,  4, 8, STARGLOW_CAVERN_DEPTHS

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_GENERAL_VARIABLE_1, 14,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route3StarglowCavernTopPatches, EVENT_HAVE_FLASH
	
	const_def 1 ; object constants
	const ROUTE_3_TOP_PATCHES

Route3StarglowCavernTopCallback:
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_PATCHES
	return

Route3StarglowCavernTopPatches:
	checkevent EVENT_FORGAVE_PATCHES
	iftrue .forgave
	checkevent EVENT_PATCHES_MODE
	iftrue .darkcavedone
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
	callasm PatchesTurnOnPatchesModeAsm
	setevent EVENT_PATCHES_MODE
	domaptrigger STARGLOW_CAVERN_DEPTHS, $1
	clearflag ENGINE_TRAINER_CARD
	clearflag ENGINE_POKEDEX
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
	blackoutmod STARGLOW_CAVERN_DEPTHS
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

.forgave
	jumptextfaceplayer Route3StarglowCavernTopPatchesDoneCaveText5

.darkcavedone
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	if_equal LEFT, .YouAreFacingLeft
	jump .cont2
.YouAreFacingRight
	applymovement PLAYER, Movement_Route3StarglowCavernTopPlayer3
	jump .cont2
.YouAreFacingLeft
	applymovement PLAYER, Movement_Route3StarglowCavernTopPlayer1
.cont2
	spriteface PLAYER, UP
	wait 3
	playsound SFX_PAY_DAY
	spriteface ROUTE_3_TOP_PATCHES, DOWN
	showemote EMOTE_SHOCK, ROUTE_3_TOP_PATCHES, 15
	opentext
	writetext Route3StarglowCavernTopPatchesDoneCaveText1
	buttonsound
	writetext Route3StarglowCavernTopPatchesReturnItemText
	waitsfx
	specialsound
	waitbutton
	callasm PatchesPutMonInContest
	callasm PatchesSwapPokemonAsm
	callasm PatchesPutContestInParty
	ifequal $0, .turn_off_patches_mode
	ifequal $2, .no_room_in_box
	farwritetext ContestResults_PartyFullText
	jump .turn_off_patches_mode
.no_room_in_box
	farwritetext ContestResults_BoxFullText
.turn_off_patches_mode
	callasm PatchesTurnOffPatchesModeAsm
	clearevent EVENT_PATCHES_MODE
	setflag ENGINE_TRAINER_CARD
	setflag ENGINE_POKEDEX
	writetext Route3StarglowCavernTopPatchesDoneCaveText2
	waitbutton
	blackoutmod GLINT_CITY
	verbosegivetmhm TM_SAND_ATTACK_SMOKESCREEN_FLASH
	setevent EVENT_HAVE_FLASH
	setevent EVENT_UNIQUE_ENCOUNTER_PATCHES
	writetext Route3StarglowCavernTopPatchesDoneCaveText3
	yesorno
	iffalse .pushthatbitch
	writetext Route3StarglowCavernTopPatchesDoneCaveText4
	buttonsound
	farwritetext StdBlankText
	pause 6
	writetext Route3StarglowCavernTopPatchesDoneCaveText5
	waitbutton
	closetext
	setevent EVENT_FORGAVE_PATCHES
	end
	
.pushthatbitch
	closetext
	applyonemovement PLAYER, fix_facing
	applymovement PLAYER, Movement_Route3StarglowCavernTopPatches
	playsound SFX_BUMP
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_PATCHES_FALL
	spriteface ROUTE_3_TOP_PATCHES, LEFT
	applymovement ROUTE_3_TOP_PATCHES, Movement_Route3StarglowCavernTopPatchesFall
	playsound SFX_KINESIS
	spriteface ROUTE_3_TOP_PATCHES, DOWN
	wait 4
	spriteface ROUTE_3_TOP_PATCHES, UP
	wait 4
	disappear ROUTE_3_TOP_PATCHES
	closetext
	clearevent EVENT_BOTTOM_PATCHES_GONE
	end
	
PatchesPutMonInContest:
	ld a, [wPartyMon1Species]
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	ld a, [wPartyMon1Form]
	ld [wCurForm], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [wMonType], a
	ld hl, wPartyMon1
	ld de, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	rst CopyBytes
	ret
	
PatchesPutContestInParty:
	ld a, POKE_BALL
	ld [wCurItem], a
	farcall CheckPartyFullAfterContest
	ret
	
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
	ret
	
PatchesTurnOnPatchesModeAsm:
; turn patches mode on
	ld hl, wStatusFlags2
	set 6, [hl] ; ENGINE_PATCHES_MODE
	ret
	
PatchesTurnOffPatchesModeAsm:
; turn patches mode off
	ld hl, wStatusFlags2
	res 6, [hl] ; ENGINE_PATCHES_MODE
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
	text "Well, <WAIT_S>hi there."
	
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
	
	para "Well listen, <WAIT_S>I saw"
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
	
	para "Go on, <WAIT_S>take a"
	line "look!"
	done
	
Route3StarglowCavernTopPatchesText2No:
	text "Good!"
	
	para "Kids your age"
	line "should leave the"
	cont "training to the"
	cont "adults!"
	
	para "Well listen, <WAIT_S>I saw"
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
	
	para "Go on, <WAIT_S>take a"
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
	line "down there…"
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
	
Route3StarglowCavernTopPatchesDoneCaveText1::
	text "Ah!"
	
	para "It's you!"
	
	para "Um…"
	
	para "L-<WAIT_S>let's just talk"
	line "about this for a"
	cont "second…"
	
	para "I uh…"
	
	para "Joking!"
	
	para "I was just joking"
	line "around!"
	
	para "I waited for you"
	line "to come back up"
	cont "so I could uh…"
	
	para "Give you all of"
	line "your stuff back!"
	
	para "Here!"
	done
	
Route3StarglowCavernTopPatchesDoneCaveText2:
	text "See?"
	
	para "No harm no foul!"
	
	para "And just to show"
	line "that there's no"
	cont "ill will."
	done
	
Route3StarglowCavernTopPatchesDoneCaveText3:
	text "That TM contains"
	line "the move FLASH."
	
	para "You can use it"
	line "to light up dark"
	cont "caves."
	
	para "…but you already"
	line "knew that, hehe…"
	
	para "Since it isn't an"
	line "HM, you do need to"
	cont "teach it to your"
	cont "#MON to use it"
	cont "outside of battle."
	
	para "But at least you"
	line "don't need a badge!"
	
	para "Anyway…"
	
	para "…<WAIT_L>You'll forgive me,"
	line "right?"
	done
	
Route3StarglowCavernTopPatchesDoneCaveText4:
	text "Oh goody!"
	
	para "I knew you had it"
	line "in you, kiddo!"
	done
	
Route3StarglowCavernTopPatchesDoneCaveText5:
	text "I'll turn over a"
	line "new leaf, honest."
	
	para "I won't be causing"
	line "anymore trouble"
	cont "for anyone else."
	done
	
Route3StarglowCavernTopPatchesReturnItemText:
	text "He returned your"
	line "BAG and #MON!"
	done
	
Movement_Route3StarglowCavernTopPatches:
	fast_step_down
	fast_step_up
	remove_fixed_facing
	step_end
	
Movement_Route3StarglowCavernTopPatchesFall:
	fix_facing
	jump_step_up
	step_down
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
	
Movement_Route3StarglowCavernTopPlayer3:
	step_down
	step_right
	step_end