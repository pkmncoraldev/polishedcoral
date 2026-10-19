LuminaGym_MapScriptHeader:
	db 5 ; scene scripts
	scene_script LuminaGymTrigger0
	scene_script LuminaGymTrigger1
	scene_script LuminaGymTrigger2
	scene_script LuminaGymTrigger3
	scene_script LuminaGymTrigger4

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
	person_event SPRITE_GRANNY,  6, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, LuminaTownNPC2, EVENT_LUMINA_LADIES_2_GONE
	person_event SPRITE_GRANNY,  6, 25, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LuminaTownNPC2, EVENT_LUMINA_LADIES_2_GONE
	

LuminaGymTrigger0:
LuminaGymTrigger1:
LuminaGymTrigger2:
LuminaGymTrigger3:
	end
	
LuminaGymTrigger4:
	priorityjump LuminaGymPostDragonShrine
	end

LuminaGymCallback:
	clearevent EVENT_LIGHTNING_ACTIVE
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
	dotrigger $2
	winlosstext LuminaGymDarcyTextWin, LuminaGymDarcyTextLoss
	loadtrainer DARCY, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	dotrigger $3
	setevent EVENT_BEAT_DARCY
	clearevent EVENT_HAVENT_BEAT_DARCY
	applymovement 3, Movement_LuminaGymElder2
	spriteface 3, UP
	spriteface PLAYER, DOWN
	opentext
	writetext Text_ReceivedEighthBadge
	playsound SFX_GET_BADGE
	waitsfx
	playmapmusic
	setflag ENGINE_EIGHTHBADGE
	setevent EVENT_POST_8_BADGE_PRE_LEAGUE_CALLS
	changetextboxspeaker TEXTBOX_ELDER
	writetext LuminaGymElderText2
	playsound SFX_2ND_PLACE
	waitsfx
	closetext
	applyonemovement 3, slow_step_right
	spriteface 3, LEFT
	pause 5
	applyonemovement PLAYER, turn_step_right
	opentext TEXTBOX_DARCY
	writetext LuminaGymDarcyTextAfterBattle
	buttonsound
	changetextboxspeaker
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	verbosegivetmhm TM_DARK_PULSE
	setevent EVENT_TM57
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
.not_leader_yet
	writetext LuminaGymDarcyPreSceneText
	waitbutton
	closetext
	end
	
.FightDone:	
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue DarcyTextLoop
	checkevent EVENT_CAN_REMATCH_DARCY
	iftrue LuminaGymDarcyRematch
DarcyTextLoop:
	checkevent EVENT_DRAGON_SHRINE_DONE
	iftrue .shrine_done
	writetext LuminaGymDarcyTextLoop
	waitbutton
	closetext
	spriteface 1, DOWN
	end
.shrine_done
	writetext LuminaGymDarcyTextLoop2
	waitbutton
	closetext
	end
	
LuminaGymDarcyRematch:
	writetext LuminaGymDarcyTextBeforeBattleRematch
	yesorno
	iffalse .end
	writetext LuminaGymDarcyTextBeforeBattleRematch2
	waitbutton
	closetext
	waitsfx
	dotrigger $2
	winlosstext LuminaGymDarcyTextWinRematch, LuminaGymDarcyTextLossRematch
	loadtrainer DARCY, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	dotrigger $3
	playmapmusic
	opentext TEXTBOX_DARCY
	checkevent EVENT_DECO_NATU_DOLL
	iftrue .skip_doll
	writetext LuminaGymDarcyTextDoll
	waitbutton
	setevent EVENT_DECO_NATU_DOLL
	writetext GiveNatuDollText
	playsound SFX_ITEM
	waitsfx
	writetext PutAwayNatuDollText
	waitbutton
.skip_doll
	writetext LuminaGymDarcyTextLoop
	waitbutton
	closetext
	clearevent EVENT_CAN_REMATCH_DARCY
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	spriteface 1, DOWN
	end
.end
	writetext LuminaGymDarcyTextNoRematch
	waitbutton
	closetext
	end
	
LuminaGymDarcyPreSceneText:
	text "Good. <WAIT_S>You're here."
	
	para "Let's get this"
	line "done!"
	done
	
LuminaGymDarcyTextBeforeBattleRematch:
	text "I know why youre"
	cont "here again."
	
	para "A rematch, right?"	
	done
	
LuminaGymDarcyTextBeforeBattleRematch2:
	text "Ok, <PLAYER>!"
	
	para "Here we go."
	
	para "I won't hold"
	line "anything back!"
	done
	
LuminaGymDarcyTextWinRematch:
	text "As expected."
	
	para "I still have a"
	line "lot to learn."
	done
	
LuminaGymDarcyTextLossRematch:
	text "Am I improving?"
	done
	
LuminaGymDarcyTextNoRematch:
	text "I see."
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
	spriteface 3, UP
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
	text "That BADGE is my"
	line "blessing to enter"
	cont "the DRAGON SHRINE."
	
	para "It also allows"
	line "your #MON to"
	cont "use WATERFALL"
	cont "outside of battle."
	
	para "I believe that"
	line "brings your BADGE"
	cont "total to eight."
	
	para "You now officially"
	line "qualify for the"
	cont "#MON LEAGUE"
	cont "TOURNAMENT!"
	done
	
LuminaGymElderText3:
	text "Let us begin."
	
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
	cont "moved on and"
	cont "mostly given up"
	cont "#MON training."
	
	para "The youth have"
	line "grown tired of our"
	cont "sacred traditions,"
	cont "it seems."
	
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
	
	para "though I am long"
	line "past my prime, I"
	cont "have been forced"
	cont "to continue acting"
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
	text "More importantly,"
	line "now you can stop"
	cont "that TEAM SNARE"
	cont "troublemaker!"
	
	para "Before you go, I"
	line "want you to take"
	cont "this."
	done
	
LuminaGymDarcyTextTMSpeech:
	text "That TM contains"
	line "DARK PULSE."
	
	para "It does really"
	line "good damage, and"
	cont "can even make"
	cont "the foe flinch!"
	
	para "…"
	
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
	
LuminaGymDarcyTextLoop2:
	text "As the village's"
	line "champion and the"
	cont "GYM LEADER,"
	
	para "I have to stay"
	line "vigilant and keep"
	cont "training."
	
	para "I'll become a"
	line "TRAINER worthy of"
	cont "making the DRAGON"
	cont "appear for real!"
	done
	
LuminaGymDarcyTextDoll:
	text "You should take"
	line "this with you."
	done
	
GiveNatuDollText:
	text "<PLAYER> received"
	line "NATU DOLL!"
	done
	
PutAwayNatuDollText:
	text "NATU DOLL was"
	line "sent to the PC in"
	cont "<PLAYER>'s room."
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
	dotrigger $3
	callasm FadeToMapMusic
	end
	
StopLuminaGymMusic:
	dotrigger $2
	callasm FadeToMapMusic
	end

LuminaGymSign:
	text "CLIFFSIDE"
	line "BATTLEGROUND"
	done
	
LuminaGymPostDragonShrine:
	applyonemovement PLAYER, step_down
	pause 20
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, 6, 15
	dotrigger $2
	playnewmapmusic
	spriteface PLAYER, LEFT
	opentext
	writetext LuminaTownNPC2Text2
	waitbutton
	closetext
	domaptrigger LUMINA_HEALER_HOUSE, $1
	clearevent EVENT_SALOON_DARCY_GONE
	clearevent EVENT_SALOON_ELDER_GONE
	end	
	
LuminaGymPostDragonShrineDarcyText1:
	text "<PLAYER>!"
	
	para "What happened?"
	
	para "Did the DRAGON"
	line "appear?"
	
	para "Did you get the"
	line "DRAGON STONE back?"
	done
	
LuminaGymPostDragonShrineDarcyText2:
	text "Oh, thank"
	line "goodness!"
	
	para "MWAH! MWAH!"
	
	para "I'm never gonna let"
	line "you outta my sight"
	cont "again!"
	done
	
LuminaGymPostDragonShrineDarcyText3:
	text "That's right!"
	
	para "Where is that"
	line "little twerp?"
	
	para "I'll pound him into"
	line "the ground!"
	done
	
LuminaGymPostDragonShrineDarcyText4:
	text "Wait, what?"
	
	para "That kid…"
	
	para "He didn't…?"
	done
	
LuminaGymPostDragonShrineDarcyText5:
	text "G-<WAIT_S>GRANDPA?"
	done
	
LuminaGymPostDragonShrineDarcyText6:
	text "I…"
	
	para "…<WAIT_L>I understand,"
	line "GRANDPA."
	done
	
LuminaGymPostDragonShrineDarcyText7:
	text "In that case…"
	
	para "Here, <PLAYER>."
	
	para "I want you to take"
	line "it with you."
	done
	
LuminaGymPostDragonShrineDarcyText8:
	text "Wait!"
    
    para "That kid was with"
    line "TEAM SNARE, right?"
    
    para "What about their"
    line "part in all this?"
	
	para "Did he tell you"
	line "anything about"
	cont "them?"
	done
    
LuminaGymPostDragonShrineDarcyText9:
    text "WH<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_S>A<WAIT_M>T!?"
	done
    
LuminaGymPostDragonShrineDarcyText10:
    text "He said their boss"
    line "is MR. ELI?"
    
    para "CEO of NETT CORP."
    line "in LUSTER CITY?"
    
    para "Why would someone"
    line "like him be work-"
    cont "ing with thugs"
    cont "like TEAM SNARE?"
	
	para "Well,<WAIT_S> either way,"
	line "something's gotta"
	cont "be done about"
	cont "those guys."
	
	para "It's time someone"
	line "went and dealt"
	cont "with them,"
	
	para "don't you think,"
	line "<PLAYER>?"
    done
	
LuminaGymPostDragonShrineElderText1:
	text "…<WAIT_L>And the child who"
	line "took the stone…"
	
	para "Where is he?"
	done
	
LuminaGymPostDragonShrineElderText2:
	text "<PLAYER>?"
	
	para "…"
	done
	
LuminaGymPostDragonShrineElderText3:
	text "A child so young"
	line "and so brash."
	
	para "He must have felt"
	line "he had so much to"
	cont "prove."
	
	para "But to throw his"
	line "life away over a"
	cont "fairy tale…"
	
	para "It's…"
	done
	
LuminaGymPostDragonShrineElderText4:
	text "I am to blame."
	
	para "That legend…"
	
	para "I clung onto it"
	line "because I felt the"
	cont "people of LUMINA"
	cont "TOWN needed it."
	
	para "That we needed"
	line "something to"
	cont "believe in."
	
	para "…"
	
	para "The world is "
	line "changing so fast."
	
	para "It's leaving us"
	line "behind."
	
	para "Our traditions…"
	
	para "They're all we"
	line "have left."
	
	para "…<WAIT_M>or so I thought."
	done
	
LuminaGymPostDragonShrineElderText5:
	text "I see now that I"
	line "was wrong."
	
	para "We can no longer"
	line "cling to the past."
	
	para "Not if it comes at"
	line "the expense of the"
	cont "future."
	done
	
LuminaGymPostDragonShrineElderText6:
	text "DARCY."
	
	para "It's time we let"
	line "this legend die."
	
	para "We can't let some-"
	line "thing like this"
	cont "happen in the name"
	cont "of tradition ever"
	cont "again."
	done
	
LuminaGymPostDragonShrineElderText7:
	text "Very good, DARCY."
	
	para "You'll make a fine"
	line "village head one"
	cont "day."
	
	para "Now if you'll"
	line "excuse me."
	
	para "I'll be on my way."
	done
	
LuminaGymPostDragonShrineElderText8:
	text "I see…"
	
	para "This didn't have"
	line "to happen…"
	done
	
LuminaGymPostDragonShrineGiveText:
	text "<PLAYER> handed"
	line "over DRAGON STONE."
	done
	
Movement_LuminaGymCutscene1:
	step_down
	step_down
	step_end
	
Movement_LuminaGymCutscene2:
	turn_step_down
	turn_step_down
	turn_step_down
	step_end
	
Movement_LuminaGymCutscene3:
	step_up
	step_up
	step_right
	step_end
	
Movement_LuminaGymCutscene4:
	turn_step_up
	turn_step_up
	turn_step_up
	step_end
	
Movement_LuminaGymCutscene5:
	slow_step_left
	slow_step_down
	slow_step_down
	step_end
	
Movement_LuminaGymCutscene6:
	fix_facing
	turn_step_up
	turn_step_up
	turn_step_up
	fast_step_down
	remove_fixed_facing
	step_end
	
Movement_LuminaGymCutscene7:
	step_left
	step_left
	step_down
	step_down
	step_end

Movement_LuminaGymCutscene8:
	step_up
	step_right
	step_end
	
Movement_LuminaGymCutscene9:
	slow_step_left
	slow_step_down
	slow_step_down
	step_end
