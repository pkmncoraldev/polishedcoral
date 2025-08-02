Route11_2_MapScriptHeader:
	db 3 ; scene scripts
	scene_script Route11_2Trigger0
	scene_script Route11_2Trigger1
	scene_script Route11_2Trigger2

	db 0 ; callbacks

	db 2 ; warp events
	warp_def  3, 19, 3, ROUTE_11_GATE
	warp_def 55, 15, 2, ROUTE_11_2

	db 1 ; coord events
	coord_event 21, 54, 0, Route11_2SnubbullJump

	db 6 ; bg events
	signpost 56, 19, SIGNPOST_JUMPTEXT, Route11_2DogSign
	signpost 51, 22, SIGNPOST_JUMPTEXT, Route11_2DogHouse
	signpost 53, 19, SIGNPOST_JUMPTEXT, Route11_2Tire
	signpost 51,  7, SIGNPOST_JUMPTEXT, Route11_2BridgeSign
	signpost 23, 13, SIGNPOST_JUMPTEXT, Route11_2BridgeSign2
	signpost 37, 12, SIGNPOST_JUMPTEXT, Route11_2BorderSign

	db 19 ; object events
	object_event 21, 52, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, SNUBBULL, -1, -1, PAL_NPC_PINK, PERSONTYPE_SCRIPT, 0, Route11_2Snubbull, -1
	person_event SPRITE_ARTIFACTS, 52, 21, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_11_2_BONE
	person_event SPRITE_BAGGAGE, -5, -5, SPRITEMOVEDATA_TILE_DOWN_PRIORITY, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_POKEFAN_F, 41, 12, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route11_2EggLady, -1
	person_event SPRITE_FLOATING_BALL, 41, 14, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11_2FloatingBall, EVENT_ROUTE_11_2_FLOATING_BALL
	person_event SPRITE_SCHOOLGIRL, 38,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route11_2Kid1, -1
	person_event SPRITE_CHILD, 36,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Route11_2Kid2, -1
	person_event SPRITE_POKEFAN_M, 37,  8, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11_2NPC1, -1
	person_event SPRITE_REDS_MOM, 29,  8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Route11_2NPC2, -1
	person_event SPRITE_CUTE_GIRL, 31,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Route11_2NPC3, -1
	person_event SPRITE_SUPER_NERD, 54,  8, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Route11_2NPC4, -1
	person_event SPRITE_PONYTAIL, 34, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Route11_2NPC5, -1
	person_event SPRITE_ROCKER, 45,  8, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, Route11_2NPC6, -1
	person_event SPRITE_BEAUTY, 23, 10, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Route11_2NPC7, -1
	person_event SPRITE_COOLTRAINER_M,  9, 20, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_1_2, -1
	person_event SPRITE_COOLTRAINER_F, 18, 18, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_GENERICTRAINER, 4, TrainerRoute11_2_2, -1
	person_event SPRITE_ENGINEER, 21,  7, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11NPC2, -1
	object_event  6, 21, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MACHOKE, -1, -1, PAL_NPC_BLUE, PERSONTYPE_SCRIPT, 0, Route11Machoke, -1
	itemball_event 16, 17, MAX_REPEL, 1, EVENT_ROUTE_11_POKE_BALL_1
	tapeball_event 16, 27, MUSIC_GENTLEMAN_ENCOUNTER, 2, EVENT_MUSIC_GENTLEMAN_ENCOUNTER
	

	const_def 1 ; object constants
	const ROUTE_11_2_SNUBBULL
	const ROUTE_11_2_BONE
	const ROUTE_11_2_BALL
	const ROUTE_11_2_EGG_LADY
	const ROUTE_11_2_FLOATING_BALL
	const ROUTE_11_2_KID1
	const ROUTE_11_2_KID2
	const ROUTE_11_2_NPC1
	const ROUTE_11_2_NPC2
	const ROUTE_11_2_NPC3
	const ROUTE_11_2_NPC4
	const ROUTE_11_2_NPC5
	const ROUTE_11_2_NPC6
	const ROUTE_11_2_NPC7
	
Route11_2Trigger0:
Route11_2Trigger2:
	special Special_UpdatePalsInstant
	end
	
Route11_2Trigger1:
	pause 10
	opentext TEXTBOX_POKEMON, SNUBBULL
	writetext Route11_2SnubbullText5
	cry SNUBBULL
	waitbutton
	changetextboxspeaker
	writetext Route11_2SnubbullText4
	playsound SFX_LEVEL_UP
	waitsfx
	waitbutton
	closetext
	dotrigger $2
	end
	
Route11_2BridgeSign:
	text "NORTH ONWA ahead."
	done
	
Route11_2BridgeSign2:
	text "SOUTH ONWA ahead."
	done
	
Route11_2BorderSign:
	text "NORTH/SOUTH ONWA"
	line "border."
	done
	
Route11_2NPC1:
	scall Route11_2Kid2
	pause 5
	scall Route11_2Kid1
	pause 5
	faceplayer
	opentext
	writetext Route11_2NPC1Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_NPC1, LEFT
	end
	
Route11_2NPC1Text:
	text "I'm in hell…"
	done
	
Route11_2NPC2:
	faceplayer
	opentext
	writetext Route11_2NPC2Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_NPC2, DOWN
	end
	
Route11_2NPC2Text:
	text "It's been so long"
	line "since we've been"
	cont "face to face."
	done

Route11_2NPC3:
	faceplayer
	opentext
	writetext Route11_2NPC3Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_NPC3, UP
	end
	
Route11_2NPC3Text:
	text "I live down SOUTH"
	line "and my girlfriend"
	cont "lives up NORTH."
	
	para "This bridge means"
	line "we can see each"
	cont "other more easily!"
	done
	
Route11_2NPC4:
	jumptextfaceplayer Route11_2NPC4Text
	
Route11_2NPC4Text:
	text "I've heard crazy"
	line "things have been"
	cont "happening at the"
	cont "nearby ranch."
	
	para "Weird sounds,"
	line "#MON going"
	cont "missing overnight."
	
	para "Could it be…<WAIT_M>"
	line "g-<WAIT_S>g-<WAIT_S>g-<WAIT_S>ghosts?"
	done

Route11_2NPC5:
	faceplayer
	opentext
	writetext Route11_2NPC5Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_NPC5, RIGHT
	end
	
Route11_2NPC5Text:
	text "I wanna swim in"
	line "the river!"
	
	para "It looks too rocky"
	line "below to jump,"
	cont "though."
	
	para "There's gotta be"
	line "another way down"
	cont "there…"
	done
	
Route11_2NPC6:
	faceplayer
	opentext
	writetext Route11_2NPC6Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_NPC6, UP
	end
	
Route11_2NPC6Text:
	text "There's a spot in"
	line "AUREOLE MOUNTAIN"
	cont "to the SOUTH known"
	cont "as “BONE CAVERN”."
	
	para "Why do you think"
	line "they call it that?"
	
	para "Freaky…"
	done
	
Route11_2NPC7:
	jumptextfaceplayer Route11_2NPC7Text
	
Route11_2NPC7Text:
	text "Gulp…"
	
	para "I know it's safe,"
	line "but I just can't"
	cont "get up the courage"
	cont "to step onto the"
	cont "bridge!"
	
	para "Come on!<WAIT_S>"
	line "Get it together!"
	done
	
Route11_2Kid1:
	priority ROUTE_11_2_NPC1, LOW_PRIORITY
	applyonemovement ROUTE_11_2_KID1, fix_facing
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_11_2_KID1, jump_in_place
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_11_2_KID1, jump_in_place
	applyonemovement ROUTE_11_2_KID1, remove_fixed_facing
	opentext
	writetext Route11_2Kid1Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_KID1, UP
	end
	
Route11_2Kid1Text:
	text "I'm in SOUTH ONWA!"
	done
	
Route11_2Kid2:
	applyonemovement ROUTE_11_2_KID2, fix_facing
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_11_2_KID2, jump_in_place
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_11_2_KID2, jump_in_place
	applyonemovement ROUTE_11_2_KID2, remove_fixed_facing
	opentext
	writetext Route11_2Kid2Text
	waitbutton
	closetext
	spriteface ROUTE_11_2_KID2, DOWN
	end
	
Route11_2Kid2Text:
	text "I'm in NORTH ONWA!"
	done
	
Route11_2EggLady:
	faceplayer
	opentext
	checkevent EVENT_ROUTE_11_2_TALKED_TO_EGG_LADY
	iftrue .talked
	priority ROUTE_11_2_EGG_LADY, HIGH_PRIORITY
	writetext Route11_2EggLadyText1
	waitbutton
	closetext
	pause 15
	variablesprite SPRITE_BAGGAGE, SPRITE_BALL_CUT_FRUIT
	moveperson ROUTE_11_2_BALL, 12, 41
	applymovement ROUTE_11_2_EGG_LADY, Movement_Route11_2_Slip
	opentext
	writetext Route11_2EggLadyText2
	waitbutton
	closetext
	pause 5
	applyonemovement ROUTE_11_2_EGG_LADY, turn_step_right
	appear ROUTE_11_2_BALL
	playsound SFX_JUMP_OVER_LEDGE
	applymovement ROUTE_11_2_BALL, Movement_Route11_2_Throw_Ball
	variablesprite SPRITE_BAGGAGE, SPRITE_FLOATING_BALL
	appear ROUTE_11_2_FLOATING_BALL
	playsound SFX_FAINT
	pause 15
	spriteface ROUTE_11_2_EGG_LADY, RIGHT
	opentext
	writetext Route11_2EggLadyText3
	waitbutton
	closetext
	disappear ROUTE_11_2_BALL
	priority ROUTE_11_2_EGG_LADY, NORMAL_PRIORITY
	faceplayer
	opentext
.dropped
	writetext Route11_2EggLadyText4
	waitbutton
	closetext
	setevent EVENT_ROUTE_11_2_TALKED_TO_EGG_LADY
	end
.talked
	checkevent EVENT_GOT_LUCKY_EGG
	iffalse .dropped
	writetext Route11_2EggLadyText5
	waitbutton
	closetext
	end
	
Route11_2EggLadyText1:
	text "Hey there!"
	
	para "Want something"
	line "good?"
	
	para "Well then, it's"
	line "your lucky day!"
	
	para "Here you go."
	done
	
Route11_2EggLadyText2:
	text "Whoops!"
	done
	
Route11_2EggLadyText3:
	text "Oh shoot!"
	
	para "It slipped out of"
	line "my hand!"
	done
	
Route11_2EggLadyText4:
	text "I'm so sorry!"
	
	para "Of all the rotten"
	line "luck…"
	
	para "Maybe you can get"
	line "down there and get"
	cont "it back somehow."
	done
	
Route11_2EggLadyText5:
	text "Eheheh…"
	
	para "I'm sorry about"
	line "all the trouble."
	done
	
Route11_2FloatingBall:
	callasm Route11_2FloatingBallSetItemAsm
	farscall FindItemInBallScript
	iffalse .end
	setevent EVENT_GOT_LUCKY_EGG
	setevent EVENT_ROUTE_11_2_FLOATING_BALL
.end
	end
	
Route11_2FloatingBallSetItemAsm:
	ld a, LUCKY_EGG
	ld [wCurItemBallContents], a
	ld a, 1
	ld [wCurItemBallQuantity], a
	ret
	
Route11_2DogSign:
	text "BEWARE OF DOG"
	done
	
Route11_2DogHouse:
	text "A little dog"
	line "house and water"
	cont "bowl."
	done
	
Route11_2Tire:
	text "An old tire."
	
	para "There's bite marks"
	line "in the rubber."
	done
	
Route11_2Snubbull:
	opentext TEXTBOX_POKEMON, SNUBBULL
	checkscene
	if_not_equal $0, .bone
	writetext Route11_2SnubbullText3
	cry SNUBBULL
	waitbutton
	changetextboxspeaker
	writetext Route11_2SnubbullText1
	waitbutton
	closetext
	end
.bone
	writetext Route11_2SnubbullText5
	cry SNUBBULL
	waitbutton
	changetextboxspeaker
	writetext Route11_2SnubbullText4
	waitbutton
	closetext
	end
	
Route11_2SnubbullText1:
	text "It looks mad…"
	done
	text "It's happily"
	line "chewing its bone."
	done
	
Route11_2SnubbullText2:
	text "Grrrrrr…"
	done
	
Route11_2SnubbullText3:
	text "Bark! Bark!"
	done

Route11_2SnubbullText4:
	text "It's happily"
	line "chewing its bone."
	done

Route11_2SnubbullText5:
	text "Gnaw. Gnaw."
	done
	
Route11_2SnubbullText6:
	text "Does it want"
	line "something?"
	done
	
Route11_2ThrowText:
	text "<PLAYER> tried"
	line "throwing the bone."
	done
	
Route11_2WrongText:
	text "That'll never work!"
	done
	
Route11_2SnubbullJump:
	opentext TEXTBOX_POKEMON, SNUBBULL
	writetext Route11_2SnubbullText2
	cry SNUBBULL
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_11_2_SNUBBULL, jump_in_place
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement ROUTE_11_2_SNUBBULL, jump_in_place
	
	opentext
	writetext Route11_2SnubbullText6
	waitbutton
	special FadeOutPalettes
	special Special_ChooseItem
	pause 5
	iffalse .no
	callasm Route11_2CheckBoneAsm
	if_not_equal CORAL_SHARD, .wont_work
	writetext Route11_2ThrowText
	waitbutton
	closetext
	dotrigger $1
	moveperson ROUTE_11_2_BONE, 21, 54
	appear ROUTE_11_2_BONE
	playsound SFX_THROW_BALL
	applymovement ROUTE_11_2_BONE, Movement_Route11_2_Throw_Bone
	moveperson ROUTE_11_2_BONE, 21, 52
	end
.wont_work
	writetext Route11_2WrongText
	waitbutton
	closetext
	pause 10
	opentext TEXTBOX_POKEMON, SNUBBULL
.no
	changetextboxspeaker TEXTBOX_POKEMON, SNUBBULL
	writetext Route11_2SnubbullText3
	cry SNUBBULL
	waitbutton
	closetext
	applyonemovement PLAYER, fix_facing
	applyonemovement ROUTE_11_2_SNUBBULL, fast_jump_step_down
	playsound SFX_DAMAGE
	earthquake 1
	applymovement PLAYER, Movement_Route11_2_StepBack
	end
	
Movement_Route11_2_Slip:
	turn_step_down
	turn_step_down
	turn_step_down
	step_end
	
Movement_Route11_2_StepBack:
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_Route11_2_Throw_Ball:
	fix_facing
	jump_step_right
	remove_fixed_facing
	step_end
	
Movement_Route11_2_Throw_Bone:
	fix_facing
	jump_step_up
	remove_fixed_facing
	step_end
	
Route11_2CheckBoneAsm:
	ld a, [wCurItem]
	ld [wScriptVar], a
	ret
