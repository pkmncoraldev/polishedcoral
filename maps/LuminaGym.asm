LuminaGym_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, LuminaGymCallback

	db 2 ; warp events
	warp_def  5, 23, 1, DRAGON_SHRINE_INTERIOR
	warp_def  5, 24, 2, DRAGON_SHRINE_INTERIOR

	db 4 ; coord events
	coord_event  9,  9, 2, StartLuminaGymMusic
	coord_event 10,  9, 2, StartLuminaGymMusic
	coord_event  9, 10, 3, StopLuminaGymMusic
	coord_event 10, 10, 3, StopLuminaGymMusic

	db 7 ; bg events
	signpost 10, 11, SIGNPOST_JUMPTEXT, LuminaGymSign
	signpost  7, 22, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  7, 25, SIGNPOST_JUMPTEXT, LuminaTownSmallStatueText
	signpost  6, 15, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText
	signpost  7, 15, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText
	signpost 10,  6, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText
	signpost 10,  7, SIGNPOST_JUMPTEXT, LuminaTownBarrelsText

	db 7 ; object events
	person_event SPRITE_DARCY,  5, 10, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, LuminaGymDarcy, EVENT_LUMINA_GYM_DARCY_GONE
	person_event SPRITE_ELDER,  5,  9, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaGymElder, EVENT_LUMINA_GYM_ELDER_GONE
	person_event SPRITE_ELDER,  8,  7, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LuminaGymElder, EVENT_LUMINA_GYM_ELDER_2_GONE
	person_event SPRITE_GRANNY,  7, 23, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaTownNPC1, EVENT_LUMINA_LADIES_1_GONE
	person_event SPRITE_GRANNY,  7, 24, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPC1, EVENT_LUMINA_LADIES_1_GONE
	person_event SPRITE_GRANNY,  8, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaTownNPC2, EVENT_LUMINA_LADIES_2_GONE
	person_event SPRITE_GRANNY,  8, 25, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPC2, EVENT_LUMINA_LADIES_2_GONE


LuminaGymCallback:
	checkevent EVENT_BEAT_DARCY
	iffalse .end
	moveperson 3, $a, $6
.end
	return

LuminaGymDarcy:
	faceplayer
	opentext TEXTBOX_DARCY
	checkevent EVENT_BEAT_DARCY
	iftrue .FightDone
	checkevent EVENT_LUMINA_GYM_SCENE
	iffalse .not_leader_yet
	writetext LuminaGymDarcyTextBeforeBattle
	waitbutton
	closetext
	waitsfx
	winlosstext LuminaGymDarcyTextWin, LuminaGymDarcyTextLoss
	loadtrainer DARCY, 1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DARCY
	clearevent EVENT_HAVENT_BEAT_DARCY
	applymovement 3, Movement_LuminaGymElder2
	spriteface 3, UP
	spriteface PLAYER, DOWN
	opentext
	writetext Text_ReceivedEighthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EIGHTHBADGE
	changetextboxspeaker TEXTBOX_ELDER
	writetext LuminaGymElderTextAfterBattle
	waitbutton
	closetext
	applyonemovement 3, slow_step_right
	spriteface 3, LEFT
	pause 5
	applyonemovement PLAYER, turn_step_right
	opentext TEXTBOX_DARCY
	writetext LuminaGymDarcyTextAfterBattle
	buttonsound
	changetextboxspeaker
	verbosegivetmhm TM_RAIN_DANCE
	setevent EVENT_GOT_TM_FROM_DARCY
	changetextboxspeaker TEXTBOX_DARCY
	writetext LuminaGymDarcyTextTMSpeech
	waitbutton
	closetext
	moveperson 3, $a, $6
	disappear 4
	disappear 5
	appear 6
	appear 7
	end
	
.FightDone:	
	checkevent EVENT_DARCY_REMATCH_AVAILABLE
	iftrue LuminaGymDarcyRematch
	checkevent EVENT_DRAGON_SHRINE_DONE
	iftrue .shrine_done
	writetext LuminaGymDarcyTextLoop
	waitbutton
	closetext
	end
.shrine_done
	writetext LuminaGymDarcyTextLoop2
	waitbutton
	closetext
	end
	
.not_leader_yet
	writetext LuminaGymDarcyPreSceneText
	waitbutton
	closetext
	end
	
LuminaGymDarcyRematch:		;TODO
	end
	
LuminaGymDarcyPreSceneText:
	text "Good. <WAIT_S>You're here."
	
	para "Let's get this"
	line "done!"
	done
	
LuminaGymElder:
	checkevent EVENT_LUMINA_GYM_SCENE
	iffalse .do_scene
	faceplayer
	opentext TEXTBOX_ELDER
	checkevent EVENT_BEAT_DARCY
	iftrue .won
	writetext LuminaGymElderText1
	waitbutton
	closetext
	end
.won
	writetext LuminaGymElderText2
	waitbutton
	closetext
	end
.do_scene
	checkcode VAR_FACING
	if_equal DOWN, .YouAreFacingDown
	if_equal RIGHT, .YouAreFacingRight
	jump .cont
.YouAreFacingDown
	applymovement PLAYER, Movement_LuminaGymPlayer1
	jump .cont
.YouAreFacingRight
	applymovement PLAYER, Movement_LuminaGymPlayer2
.cont
	spriteface PLAYER, UP
	spriteface 1, DOWN
	opentext TEXTBOX_ELDER
	writetext LuminaGymElderText3
	waitbutton
	closetext
	spriteface 1, LEFT
	opentext TEXTBOX_DARCY
	writetext LuminaGymDarcySceneText1
	waitbutton
	closetext
	pause 5
	spriteface 2, RIGHT
	opentext TEXTBOX_ELDER
	writetext LuminaGymElderText4
	waitbutton
	closetext
	pause 5
	spriteface 1, DOWN
	spriteface 2, DOWN
	opentext TEXTBOX_ELDER
	writetext LuminaGymElderText5
	waitbutton
	closetext
	pause 10
	spriteface 1, LEFT
	opentext TEXTBOX_DARCY
	writetext LuminaGymDarcySceneText2
	special Special_FadeOutMusic
	pause 20
	waitbutton
	closetext
	pause 40
	spriteface 2, RIGHT
	opentext TEXTBOX_ELDER
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	writetext LuminaGymElderText7
	waitbutton
	closetext
	pause 5
	applymovement 1, Movement_LuminaGymDarcy1
	opentext TEXTBOX_DARCY
	writetext LuminaGymDarcySceneText3
	waitbutton
	closetext
	pause 10
	opentext TEXTBOX_ELDER
	writetext LuminaGymElderText8
	waitbutton
	closetext
	pause 5
	applyonemovement 1, step_left
	opentext TEXTBOX_DARCY
	writetext LuminaGymDarcySceneText4
	waitbutton
	closetext
	pause 10
	opentext TEXTBOX_ELDER
	writetext LuminaGymElderText9
	waitbutton
	closetext
	pause 10
	applymovement 2, Movement_LuminaGymElder1
	spriteface 2, UP
	appear 3
	setevent EVENT_LUMINA_GYM_SCENE
	pause 5
	applyonemovement PLAYER, step_up
	spriteface PLAYER, RIGHT
	disappear 2
	stopfollow
	setlasttalked 1
	jump LuminaGymDarcy
	
LuminaGymElderText1:
	text "Please, battle"
	line "DARCY with all of"
	cont "your might."
	
	para "Now's the time for"
	line "you both to prove"
	cont "yourselves."
	done
	
LuminaGymElderText2:
	text "You've done well."
	
	para "You now have my"
	line "permission to"
	cont "enter the shrine."
	
	para "Go now. <WAIT_M>Quickly."
	done
	
LuminaGymElderText3:
	text "Good of you to"
	line "come. <WAIT_S>Let's begin."
	
	para "To gain access to"
	line "the DRAGON SHRINE,"
	
	para "one must earn the"
	line "blessing of the"
	cont "village's elder."
	
	para "Historically, this"
	line "is done by besting"
	cont "the village's"
	cont "strongest warrior:"
	
	para "Our village"
	line "champion."
	
	para "In recent years,"
	line "our strongest"
	cont "TRAINERS have all"
	cont "decided to leave"
	cont "town and seek out"
	cont "glory elsewhere"
	cont "in the world."
	
	para "The youth have"
	line "grown tired of our"
	cont "sacred traditions."
	
	para "Such a shame."
	
	para "Perhaps it is just"
	line "a product of our"
	cont "modern age…"
	done
	
LuminaGymElderText4:
	text "Yes, yes."
	
	para "All things in due"
	line "time, my dear."
	done
	
LuminaGymElderText5:
	text "Regardless,"
	
	para "in their absence,"
	line "I have been forced"
	cont "to continue to act"
	cont "as the village's"
	cont "champion."
	
	para "That is, until"
	line "today."
	done
	
LuminaGymElderText6:
	text "You see, you will"
	line "not be facing me"
	cont "in battle…"
	done
	
LuminaGymElderText7:
	text "DARCY!"
	
	para "You've been tire-"
	line "lessly training"
	cont "for quite a while."
	
	para "The time has come,"
	line "for you to take"
	cont "your place as the"
	cont "village champion."
	done
	
LuminaGymElderText8:
	text "What have I always"
	line "told you, silly"
	cont "girl?"
	
	para "All things…"
	done
	
LuminaGymElderText9:
	text "I know you will."
	
	para "I hearby bestow to"
	line "you the titles of"
	cont "village champion"
	cont "and GYM LEADER."
	done
	
LuminaGymElderTextAfterBattle:
	text "That BADGE is my"
	line "blessing to enter"
	cont "the DRAGON SHRINE."
	
	para "It also allows"
	line "your #MON to"
	cont "use WATERFALL"
	cont "outside of battle."
	done
	
LuminaGymDarcySceneText1:
	text "GRANDPA!"
	
	para "We need to get"
	line "a move on here!"
	done
	
LuminaGymDarcySceneText2:
	text "What?"
	done
	
LuminaGymDarcySceneText3:
	text "WH<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_M>T!?"
	
	para "But I-"
	
	para "And you-"
	
	para "I…<WAIT_M> I don't think"
	line "I'm ready!"
	done
	
LuminaGymDarcySceneText4:
	text "…<WAIT_S>in due time."
	
	para "…<WAIT_L>Ok.<WAIT_M> I trust you."
	
	para "I'll make you"
	line "proud, GRANDPA!"
	done
	
LuminaGymDarcyTextBeforeBattle:
	text "Ok, <PLAYER>!"
	
	para "Here we go."
	
	para "For GRANDPA,"
	
	para "For the people"
	line "of LUMINA TOWN,"
	
	para "and even for the"
	line "DRAGON itself!"
	
	para "I won't hold"
	line "anything back!"
	done
	
LuminaGymDarcyTextWin:
	text "You won…"
	
	para "Surely you've"
	line "earned GRANDPA's"
	cont "blessing."
	done
	
LuminaGymDarcyTextLoss:
	text "Maybe you aren't"
	line "worthy after all…"
	done
	
Text_ReceivedEighthBadge:
	text "<PLAYER> received"
	line "the DRAKEBADGE."
	done
	
LuminaGymDarcyTextAfterBattle:
	text "Great!"
	
	para "Now you can stop"
	line "that TEAM SNARE"
	cont "troublemaker!"
	
	para "Before you go, I"
	line "want you to take"
	cont "this."
	done
	
LuminaGymDarcyTextTMSpeech:
	text "TM SPEECH"
	
	para "Ok, now what are"
	line "you waiting for?"
	
	para "You gotta convince"
	line "that kid to leave"
	cont "the shrine!"
	done
	
LuminaGymDarcyTextLoop:
	text "What are you"
	line "waiting for?"
	
	para "You gotta convince"
	line "that kid to leave"
	cont "the shrine!"
	done
	
LuminaGymDarcyTextLoop2:		;TODO
	text "TEXT LOOP"
	done
	
Movement_LuminaGymPlayer1:
	step_left
	step_down
	
Movement_LuminaGymPlayer2:
	step_down
	step_right
	step_end
	
Movement_LuminaGymElder1:
	slow_step_left
	slow_step_left
	slow_step_down
	slow_step_down
	slow_step_down
	step_end
	
Movement_LuminaGymElder2:
	slow_step_up
	slow_step_up
	slow_step_right
	slow_step_right
	step_end
	
Movement_LuminaGymDarcy1:
	fix_facing
	turn_step_left
	turn_step_left
	turn_step_left
	fast_step_right
	remove_fixed_facing
	step_end

StartLuminaGymMusic:
	setevent EVENT_LUMINA_GYM_MUSIC
	callasm FadeToMapMusic
	dotrigger $3
	end
	
StopLuminaGymMusic:
	clearevent EVENT_LUMINA_GYM_MUSIC
	callasm FadeToMapMusic
	dotrigger $2
	end

LuminaGymSign:
	text "CLIFFSIDE"
	line "BATTLEGROUND"
	done