Route3StarglowCavernTop_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 1 ; warp events
	warp_def 12,  8, 1, ROUTE_1

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