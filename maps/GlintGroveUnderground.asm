GlintGroveUnderground_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 3 ; warp events
	warp_def  7, 31, 2, GLINT_GROVE_EAST
	warp_def  5, 43, 3, GLINT_GROVE_UNDERGROUND
	warp_def 40, 31, 2, GLINT_GROVE_UNDERGROUND

	db 6 ; coord events
	coord_event 10,  7, 0, GlintGroveUndergroundClefScene1
	coord_event 11,  7, 0, GlintGroveUndergroundClefScene2
	coord_event 12,  7, 0, GlintGroveUndergroundClefScene3
	coord_event 13,  7, 0, GlintGroveUndergroundClefScene4
	coord_event 28, 38, 2, GlintGroveUndergroundIntroScene
	coord_event 29, 38, 2, GlintGroveUndergroundIntroScene
	

	db 6 ; bg events
	signpost  4, 11, SIGNPOST_READ, GlintGroveUndergroundMoonStone
	signpost  4, 12, SIGNPOST_READ, GlintGroveUndergroundMoonStone
	signpost  4, 10, SIGNPOST_READ, GlintGroveUndergroundRoots
	signpost  4, 13, SIGNPOST_READ, GlintGroveUndergroundRoots
	signpost 32, 38, SIGNPOST_ITEM + REVIVE, EVENT_GLINT_GROVE_UNDERGROUND_HIDDEN_ITEM_1
	signpost 34, 11, SIGNPOST_ITEM + REVIVE, EVENT_GLINT_GROVE_UNDERGROUND_HIDDEN_ITEM_2

	db 15 ; object events
	person_event SPRITE_CLEFAIRY_WALK,  5, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundClefairy, EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	person_event SPRITE_CLEFAIRY_WALK,  5, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundClefairy, EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	person_event SPRITE_CLEFAIRY_WALK, 36, 28, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundClefairy, EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_3
	person_event SPRITE_CLEFAIRY_WALK, 36, 29, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundClefairy, EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_4
	person_event SPRITE_CLEFAIRY_WALK, 42,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundClefairy1, EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_5
	person_event SPRITE_CLEFAIRY_WALK, 19, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, GlintGroveUndergroundClefairy2, EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_6
	person_event SPRITE_CLEFABLE_WALK,  2, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_PLAYER_CUTSCENE,  6, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	person_event SPRITE_PLAYER_CUTSCENE,  7, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	person_event SPRITE_PLAYER_CUTSCENE, -5, -5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	person_event SPRITE_PLAYER_CUTSCENE, -5, -5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, -1, EVENT_PLAYER_CUTSCENE_SILVER
	person_event SPRITE_TEACHER, 28, 31, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 5, GlintGroveUndergroundTrainer1, -1
	person_event SPRITE_SCIENTIST, 34,  5, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 2, GlintGroveUndergroundTrainer2, -1
	tmhmball_event 35, 27, TM_DAZZLINGLEAM, EVENT_GLINT_GROVE_UNDERGROUND_TM
	tapeball_event  8, 40, MUSIC_WILD_VICTORY, 2, EVENT_MUSIC_WILD_VICTORY
	
	
	const_def 1 ; object constants
	const GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	const GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	const GLINT_GROVE_UNDERGROUND_CLEFAIRY_3
	const GLINT_GROVE_UNDERGROUND_CLEFAIRY_4
	const GLINT_GROVE_UNDERGROUND_CLEFAIRY_5
	const GLINT_GROVE_UNDERGROUND_CLEFAIRY_6
	const GLINT_GROVE_UNDERGROUND_CLEFABLE
	const GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE
	const GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2
	const GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_3
	const GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_4
	
GlintGroveUndergroundTrainer1:
	generictrainer TEACHER, MARIE, EVENT_BEAT_GLINT_GROVE_UNDERGROUND_TRAINER_1, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
GlintGroveUndergroundTrainer2:
	generictrainer SCIENTIST, HERBERT, EVENT_BEAT_GLINT_GROVE_UNDERGROUND_TRAINER_2, .SeenText, .BeatenText

	text "NORMAL TEXT"
	done

.SeenText:
	text "SEEN TEXT"
	done

.BeatenText:
	text "YOU WIN"
	done
	
GlintGroveUndergroundMoonStone:
	jumptext GlintGroveUndergroundMoonStoneText
	
GlintGroveUndergroundMoonStoneText:
	text "A giant rock."
	
	para "It looks similar"
	line "to a MOON STONE."
	done
	
GlintGroveUndergroundRoots:
	jumptext GlintGroveUndergroundRootsText
	
GlintGroveUndergroundRootsText:
	text "Thick tree roots"
	line "descend from the"
	cont "surface."
	done
	
GlintGroveUndergroundClefairy:
	faceplayer
	opentext
	writetext GlintGroveUndergroundClefairyText1
	cry CLEFAIRY
	waitsfx
	buttonsound
	writetext GlintGroveUndergroundClefairyText2
	waitbutton
	closetext
	spriteface GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, DOWN
	spriteface GLINT_GROVE_UNDERGROUND_CLEFAIRY_2, DOWN
	end
	
GlintGroveUndergroundClefairyText1:
	text "CLEFAIRY: Pii!"
	done
	
GlintGroveUndergroundClefairyText2:
	text "It looks like it's"
	line "waiting for you to"
	cont "find its friend."
	done
	
GlintGroveUndergroundClefairy1:
	faceplayer
	waitsfx
	checkcode VAR_FACING
	if_not_equal LEFT, .NotFacingLeft
	moveperson GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_3, 5, 42
	stopfollow
	appear GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_3
	stopfollow
	applyonemovement PLAYER, hide_person
.NotFacingLeft
	cry CLEFAIRY
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_5, jump_step_right
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_5, jump_step_right
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_5, jump_step_right
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_5, jump_step_right
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_5
	appear GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	checkevent EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	iftrue .end
	dotrigger $0
.end
	applyonemovement PLAYER, show_person
	stopfollow
	disappear GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_3
	jumptext GlintGroveUndergroundClefairyFoundText
	
GlintGroveUndergroundClefairy2:
	faceplayer
	waitsfx
	cry CLEFAIRY
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_6, jump_step_left
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_6, jump_step_left
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_6, jump_step_left
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_6, jump_step_left
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_6
	appear GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	checkevent EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	iftrue .end
	dotrigger $0
.end
	jumptext GlintGroveUndergroundClefairyFoundText
	
GlintGroveUndergroundClefairyFoundText:
	text "CLEFAIRY happily"
	line "hopped home!"
	done
	
GlintGroveUndergroundIntroScene:
	special Special_StopRunning
	stopfollow
	pause 10
	spriteface GLINT_GROVE_UNDERGROUND_CLEFAIRY_3, RIGHT
	cry CLEFAIRY
	waitsfx
	pause 15
	spriteface GLINT_GROVE_UNDERGROUND_CLEFAIRY_4, LEFT
	cry CLEFAIRY
	waitsfx
	pause 15
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_3, jump_step_left
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_3, jump_step_left
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_3, jump_step_left
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_4, jump_step_up
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_4, jump_step_up
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_3
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_4
	dotrigger $1
	jumptext GlintGroveUndergroundIntroSceneText
	
GlintGroveUndergroundIntroSceneText:
	text "It seems like"
	line "they want to play"
	cont "hide-and-go-seek!"
	done
	
GlintGroveUndergroundClefScene1:
	special Special_StopRunning
	applyonemovement PLAYER, step_up
	applyonemovement PLAYER, step_right
	jump GlintGroveUndergroundClefScene
GlintGroveUndergroundClefScene2:
	special Special_StopRunning
	applyonemovement PLAYER, step_up
	jump GlintGroveUndergroundClefScene
GlintGroveUndergroundClefScene3:
	special Special_StopRunning
	applyonemovement PLAYER, step_up
	applyonemovement PLAYER, step_left
	jump GlintGroveUndergroundClefScene
GlintGroveUndergroundClefScene4:
	special Special_StopRunning
	applyonemovement PLAYER, step_up
	applyonemovement PLAYER, step_left
	applyonemovement PLAYER, step_left
GlintGroveUndergroundClefScene:
	spriteface PLAYER, UP
	appear GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE
	stopfollow
	applyonemovement PLAYER, hide_person
	pause 10
	special Special_FadeOutMusic
	pause 35
	spriteface GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, RIGHT
	cry CLEFAIRY
	waitsfx
	pause 15
	spriteface GLINT_GROVE_UNDERGROUND_CLEFAIRY_2, LEFT
	cry CLEFAIRY
	waitsfx
	pause 15
	follow GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, step_left
	pause 10
	playmusic MUSIC_CLEFAIRY_DANCE
	pause 10
rept 2
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE, LEFT
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, slow_jump_step_down
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE, DOWN
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, slow_jump_step_right
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE, RIGHT
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, slow_jump_step_up
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE, UP
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, slow_jump_step_left
endr
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, step_up
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, slow_jump_step_up
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_1, slow_jump_step_right
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	stopfollow
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_2, remove_fixed_facing
	pause 5
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_2, turn_step_down
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_2, remove_fixed_facing
	pause 10
	cry CLEFAIRY
	waitsfx
	pause 10
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFAIRY_2, slow_jump_step_right
	disappear GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	applyonemovement PLAYER, show_person
	stopfollow
	disappear GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE
	pause 30
	special Special_FadeOutMusic
	pause 35
	clearevent EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	clearevent EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	callasm GlintGroveUndergroundWalkAwayAsm
	applyonemovement PLAYER, step_down
	appear GLINT_GROVE_UNDERGROUND_CLEFABLE
	appear GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2
	setevent EVENT_ALWAYS_SET
	cry CLEFABLE
	waitsfx
	applyonemovement PLAYER, hide_person
	pause 40
	applyonemovement PLAYER, slow_step_up
	pause 20
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2, UP
	pause 40
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_jump_step_left
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_jump_step_down
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_jump_step_down
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2, LEFT
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_jump_step_down
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2, DOWN
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_jump_step_right
	pause 5
	playsound SFX_JUMP_OVER_LEDGE
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2, RIGHT
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_jump_step_up
	pause 5
	spriteface GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2, UP
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, slow_step_left
	pause 5
	applyonemovement GLINT_GROVE_UNDERGROUND_CLEFABLE, turn_step_down
	stopfollow
	pause 10
	applyonemovement PLAYER, slow_step_down
	spriteface PLAYER, UP
	stopfollow
	applyonemovement PLAYER, show_person
	stopfollow
	disappear GLINT_GROVE_UNDERGROUND_PLAYER_CUTSCENE_2
	pause 20
	opentext
	writetext GlintGroveUndergroundClefableText
	cry CLEFABLE
	waitsfx
	waitbutton
	closetext
	waitsfx
	setlasttalked GLINT_GROVE_UNDERGROUND_CLEFABLE
	loadwildmon CLEFABLE, 45
	writecode VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	disappear GLINT_GROVE_UNDERGROUND_CLEFABLE
	reloadmapafterbattle
	playmapmusic
	setevent EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_1
	setevent EVENT_GLINT_GROVE_UNDERGROUND_CLEFAIRY_2
	setevent EVENT_GLINT_GROVE_UNDERGROUND_BEAT_CLEFABLE
	checkcode VAR_MONJUSTCAUGHT
	if_equal CLEFABLE, .CaughtClefable
	opentext
	writetext GlintGroveUndergroundClefableText2
	waitbutton
	closetext
.CaughtClefable
	dotrigger $1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	end

GlintGroveUndergroundClefableText:
	text "CLEFABLE: Piii!"
	done

GlintGroveUndergroundClefableText2:
	text "With a waggle of a"
	line "finger, CLEFABLE"
	cont "took its leave."
	done

GlintGroveUndergroundWalkAwayAsm:
	.loop
	call DelayFrame
	call GetJoypad
	ld a, [hJoyPressed]
	cp D_DOWN
	jr z, .down
	call RTC
	jr .loop
.down
	ret

GlintGroveUndergroundTestMovement:
	step_down
	step_end
GlintGroveUndergroundTestMovement2:
	jump_step_up
	turn_step_down
	step_sleep 75
	jump_step_right
	step_end
