GlintGrove_MapScriptHeader:
	db 3 ; scene scripts
	scene_script GlintGroveTrigger0
	scene_script GlintGroveTrigger1
	scene_script GlintGroveTrigger2

	db 0 ; callbacks

	db 4 ; warp events
	warp_def 57, 27, 1, GLINT_GROVE_ENTRANCE
	warp_def 57, 26, 2, GLINT_GROVE_ENTRANCE
	warp_def 46, 49, 1, GLINT_GROVE_DEEP
	warp_def 46, 48, 2, GLINT_GROVE_DEEP

	db 2 ; coord events
	xy_trigger 0, 47, 48, 0, GlintGroveTrioTrigger1, 0, 0
	xy_trigger 0, 47, 49, 0, GlintGroveTrioTrigger2, 0, 0

	db 0 ; bg events
;	signpost 50, 22, SIGNPOST_READ, GlintGroveClue

	db 15 ; object events
	person_event SPRITE_LASS, 40, 34, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_1, -1
	person_event SPRITE_PICNICKER, 46, 6, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainerGlintGrove_2, -1
	person_event SPRITE_CAMPER, 17, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 4, TrainerGlintGrove_3, -1
	person_event SPRITE_TWIN, 17, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_4, -1
	person_event SPRITE_TWIN, 16, 31, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_GENERICTRAINER, 1, TrainerGlintGrove_5, -1
	person_event SPRITE_BUG_CATCHER, 8, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_GENERICTRAINER, 3, TrainerGlintGrove_6, -1
	person_event SPRITE_STANLEY, 9, 17, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintGroveStanley, EVENT_GLINT_GROVE_STANLEY
	person_event SPRITE_BATTLE_GIRL, 50, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveNPC1, -1
	person_event SPRITE_CHILD, 53, 22, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveNPC2, -1
	person_event SPRITE_BATTLE_GIRL, 33, 16, SPRITEMOVEDATA_WANDER, 1, 3, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GlintGroveNPC3, -1
	person_event SPRITE_POKEMANIAC, 52, 31, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, GlintGroveNPC4, -1
	person_event SPRITE_ROCKER, 50, 48, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, GlintGroveTrioRed, EVENT_TRIO_BROS
	person_event SPRITE_ROCKER, 48, 51, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GlintGroveTrioBlue, EVENT_TRIO_BROS
	person_event SPRITE_ROCKER, 48, 46, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, GlintGroveTrioYellow, EVENT_TRIO_BROS
	itemball_event  11, 17, PARALYZEHEAL, 1, EVENT_GLINT_GROVE_POKE_BALL
	
	const_def 1 ; object constants
	const GLINTGROVE_TRAINER1
	const GLINTGROVE_TRAINER2
	const GLINTGROVE_TRAINER3
	const GLINTGROVE_TRAINER4
	const GLINTGROVE_TRAINER5
	const GLINTGROVE_TRAINER6
	const GLINTGROVE_STANLEY
	const GLINTGROVE_NPC1
	const GLINTGROVE_NPC2
	const GLINTGROVE_NPC3
	const GLINTGROVE_NPC4
	const GLINTGROVE_TRIO_RED
	const GLINTGROVE_TRIO_BLUE
	const GLINTGROVE_TRIO_YELLOW
	const GLINTGROVE_POKEBALL
	
GlintGroveTrigger0:
	end
	
GlintGroveTrigger1:
	end
	
GlintGroveTrigger2:
	end
	
TrainerGlintGrove_1:
	generictrainer LASS, VERONICA, EVENT_BEAT_GLINT_GROVE_TRAINER_1, .SeenText, .BeatenText
	
	text "Even when it"
	line "loses, my CLEFAIRY"
	
	para "is still super"
	line "cute."
	done

.SeenText:
	text "My CLEFAIRY is so"
	line "cute!"
	
	para "Look!"
	done

.BeatenText:
	text "Aww…"
	
	para "Why didn't you let"
	line "me win?"
	done
	
TrainerGlintGrove_2:
	generictrainer PICNICKER, MOLLY, EVENT_BEAT_GLINT_GROVE_TRAINER_2, .SeenText, .BeatenText
	
	text "I hope my boy-"
	line "friend is alright."
	done

.SeenText:
	text "Have you seen my"
	line "boyfriend?"
	
	para "He wandered off by"
	line "himself."
	
	para "I'm afraid he might"
	line "be lost."
	done

.BeatenText:
	text "Where could he be?"
	done
	
TrainerGlintGrove_3:
	generictrainer CAMPER, BART, EVENT_BEAT_GLINT_GROVE_TRAINER_3, .SeenText, .BeatenText
	
	text "Do you know which"
	line "way is the exit?"
	done

.SeenText:
	text "I think I'm lost."
	
	para "I lost track of my"
	line "girlfriend, and"
	
	para "now I can't find"
	line "my way back."
	done

.BeatenText:
	text "Now I'm lost AND"
	line "upset."
	done
	
TrainerGlintGrove_4:
	generictrainer TWINS, JENJAN, EVENT_BEAT_GLINT_GROVE_TRAINER_4, .SeenText, .BeatenText
	
	text "You can't win all"
	line "the time."
	done

.SeenText:
	text "JEN: Come on, JAN."
	
	para "JAN: Alright, JEN."
	done

.BeatenText:
	text "JEN: Oh well…"
	
	para "JAN: We'll do"
	line "better next time."
	done
	
TrainerGlintGrove_5:
	generictrainer TWINS, JANJEN, EVENT_BEAT_GLINT_GROVE_TRAINER_4, .SeenText, .BeatenText

	text "We're still kids."
	
	para "We'll be better"
	line "when we're older."
	done

.SeenText:
	text "JAN: Come on, JEN."
	
	para "JEN: Alright, JAN."
	done

.BeatenText:
	text "JAN: Oh well…"
	
	para "JEN: We'll do"
	line "better next time."
	done
	
TrainerGlintGrove_6:
	generictrainer BUG_CATCHER, BARNEY, EVENT_BEAT_GLINT_GROVE_TRAINER_6, .SeenText, .BeatenText
	
	text "The BUG CATCHER'S"
	line "life is not an"
	cont "easy one…"
	done

.SeenText:
	text "I figured I could"
	line "catch some cool"
	
	para "BUG TYPE #MON"
	line "around here,"
	
	para "but all I can find"
	line "are WEEDLE!"
	done

.BeatenText:
	text "GAHH!"
	
	para "WEEDLE!"
	done

GlintGroveStanley:
	setevent EVENT_GLINT_GROVE_STANLEY
	opentext
	writetext GlintGroveStanleyText1
	waitbutton
	closetext
	faceplayer
	opentext
	writetext GlintGroveStanleyText2
	waitbutton
	spriteface GLINTGROVE_STANLEY, DOWN
	closetext
	pause 30
	faceplayer
	opentext
	writetext GlintGroveStanleyText3
	buttonsound
	verbosegiveitem LIBRARY_CARD
	setflag ENGINE_MET_STANLEY
;	callasm .MetStanley
	writetext GlintGroveStanleyText4
	buttonsound
	closetext
	checkcode VAR_FACING
	if_equal LEFT, .YouAreFacingLeft
	applymovement GLINTGROVE_STANLEY, Movement_GlintGroveStanley1
	disappear GLINTGROVE_STANLEY
	end
	
.YouAreFacingLeft
	applymovement GLINTGROVE_STANLEY, Movement_GlintGroveStanley2
	disappear GLINTGROVE_STANLEY
	end
	
;.MetStanley
;	ld hl, wMetGymLeaderFlags
;	set 0, [hl] ; metstanley
;	ret
	
GlintGroveNPC1:
	jumptextfaceplayer GlintGroveNPC1Text
	
GlintGroveNPC2:
	jumptextfaceplayer GlintGroveNPC2Text
	
GlintGroveNPC3:
	jumptextfaceplayer GlintGroveNPC3Text
	
GlintGroveNPC4:
	faceplayer
	opentext
	checkevent EVENT_TRIO_BROS2
	iffalse .NPC4_2
	writetext GlintGroveNPC4Text1
	waitbutton
	spriteface GLINTGROVE_NPC4, RIGHT
	closetext
	end
	
.NPC4_2
	writetext GlintGroveNPC4Text2
	waitbutton
	spriteface GLINTGROVE_NPC4, RIGHT
	closetext
	end
	
Movement_GlintGroveTrioPlayer:
	step_down
	step_end
	
Movement_GlintGroveTrioRed1:
	remove_fixed_facing
	step_up
	step_end
	
Movement_GlintGroveTrioRed2:
	remove_fixed_facing
	step_right
	step_up
	step_end
	
Movement_GlintGroveTrioRed3:
	fix_facing
	big_step_down
	step_end
	
Movement_GlintGroveTrioRed4:
	step_right
	step_up
	step_up
	step_up
	step_end
	
Movement_GlintGroveTrioRed5:
	step_left
	step_up
	step_up
	step_up
	step_end
	
Movement_GlintGroveTrioBlue1:
	remove_fixed_facing
	step_left
	step_left
	step_end
	
Movement_GlintGroveTrioBlue2:
	remove_fixed_facing
	step_left
	step_end
	
Movement_GlintGroveTrioBlue3:
	fix_facing
	big_step_right
	step_end
	
Movement_GlintGroveTrioBlue4:
	step_up
	step_up
	step_end
	
Movement_GlintGroveTrioBlue5:
	step_down
	step_left
	step_left
	step_up
	step_up
	step_up
	step_end
	
Movement_GlintGroveTrioYellow1:
	remove_fixed_facing
	step_right
	step_end
	
Movement_GlintGroveTrioYellow2:
	remove_fixed_facing
	step_right
	step_right
	step_end
	
Movement_GlintGroveTrioYellow3:
	fix_facing
	big_step_left
	step_end
	
Movement_GlintGroveTrioYellow4:
	step_down
	step_right
	step_right
	step_up
	step_up
	step_up
	step_end
	
Movement_GlintGroveTrioYellow5:
	step_up
	step_up
	step_end
	
Movement_GlintGroveStanley1:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
Movement_GlintGroveStanley2:
	step_down
	step_right
	step_right
	step_up
	step_right
	step_right
	step_right
	step_right
	step_right
	step_end
	
GlintGrove_TrioText1:
	text "Hmm…"
	
	para "It seems you've"
	line "found our secret"
	cont "spot."
	done
	
GlintGrove_TrioText2:
	text "We've been coming"
	line "here to study the"
	cont "SMEARGLE."
	done
	
GlintGrove_TrioText3:
	text "They seem to con-"
	line "gregate in this"
	cont "hollow."
	done
	
GlintGrove_TrioText4:
	text "My name is RED."
	done
	
GlintGrove_TrioText5:
	text "I'm BLUE."
	done
	
GlintGrove_TrioText6:
	text "And I'm YELLOW."
	done
	
GlintGrove_TrioText7:
	text "Together we're the"
	line "TRIO BROS."
	done
	
GlintGrove_TrioText8:
	text "We've heard rumors"
	line "that there is a"
	
	para "special-colored"
	line "SMEARGLE that"
	cont "hangs sround here."
	done
	
GlintGrove_TrioText9:
	text "We haven't managed"
	line "to find any signs"
	cont "of it though."
	done
	
GlintGrove_TrioText10:
	text "WHAT!?"
	
	para "You saw it?"
	done
	
GlintGrove_TrioText11:
	text "And you battled"
	line "it?"
	done
	
GlintGrove_TrioText12:
	text "That's amazing!"
	done
	
GlintGrove_TrioText13:
	text "You must be quite"
	line "the TRAINER."
	done
	
GlintGrove_TrioText14:
	text "Seriously!"
	done
	
GlintGrove_TrioText15:
	text "Indeed."
	done
	
GlintGrove_TrioText16:
	text "TRAINER!"
	
	para "Please have a"
	line "battle with me."
	
	para "If that elusive"
	line "SMEARGLE deemed"
	
	para "you worthy, then"
	line "you must be some-"
	cont "thing else."
	done
	
GlintGrove_TrioText17:
	text "No! No!"
	
	para "Battle me!"
	done
	
GlintGrove_TrioText18:
	text "I would also app-"
	line "riciate a battle."
	done
	
GlintGrove_TrioText19:
	text "So, who's it going"
	line "to be?"
	done
	
GlintGrove_TrioTextWait:
	text "Wait TRAINER!"
	
	para "Please battle one"
	line "of us."
	done
	
GlintGrove_TrioRedBattleText1:
	text "You'll fight me?"
	done
	
GlintGrove_TrioRedBattleText2:
	text "Great. Here goes."
	done
	
GlintGrove_TrioRedBattleText3:
	text "Oh…"
	done
	
GlintGrove_TrioRedWinText:
	text "Wow."
	
	para "You're good."
	done
	
GlintGrove_TrioRedLoseText:
	text "I won?"
	done
	
GlintGrove_TrioRedAfterBattleText1:
	text "Wow."
	
	para "It's pretty clear"
	line "why SMEARGLE"
	
	para "revealed itself"
	line "to you."
	
	para "You're no joke."
	
	done
	
GlintGrove_TrioRedAfterBattleText2:
	text "Hmm…"
	
	para "You lost, but"
	line "you're not bad."
	
	para "I can see why"
	line "SMEARGLE chose"
	
	para "to reveal itself"
	line "to you."
	done
	
GlintGrove_TrioBlueBattleText1:
	text "You wanna fight"
	line "me?"
	done
	
GlintGrove_TrioBlueBattleText2:
	text "Yes! Let's do it!"
	done
	
GlintGrove_TrioBlueBattleText3:
	text "Really?"
	done
	
GlintGrove_TrioBlueWinText:
	text "Haha! Nice!"
	done
	
GlintGrove_TrioBlueLoseText:
	text "For real?"
	done
	
GlintGrove_TrioBlueAfterBattleText1:
	text "SMEARGLE was right"
	line "about you."
	
	para "You're crazy good."
	done
	
GlintGrove_TrioBlueAfterBattleText2:
	text "That's it?"
	
	para "You weren't so"
	line "tough."
	
	para "I wonder why"
	line "SMEARGLE would"
	
	para "reveal itself to"
	line "you."
	done
	
GlintGrove_TrioYellowBattleText1:
	text "Would you care to"
	line "battle me?"
	done
	
GlintGrove_TrioYellowBattleText2:
	text "Excellent."
	done
	
GlintGrove_TrioYellowBattleText3:
	text "I see…"
	done
	
GlintGrove_TrioYellowWinText:
	text "Just as I"
	line "suspected."
	done
	
GlintGrove_TrioYellowLoseText:
	text "Interesting…"
	done
	
GlintGrove_TrioYellowAfterBattleText1:
	text "You are indeed "
	line "quite a talented"
	cont "TRAINER."
	
	para "I can see why"
	line "SMEARGLE revealed"
	cont "itself to you."
	done
	
GlintGrove_TrioYellowAfterBattleText2:
	text "Although you lost,"
	line "you seem to hold"
	cont "some potential."
	
	para "Perhaps that's the"
	line "reason SMEARGLE"
	
	para "revealed itself to"
	line "you."
	done
	
GlintGrove_TrioAfterBattleText1:
	text "Thank you TRAINER."
	done
	
GlintGrove_TrioAfterBattleText2:
	text "We're gonna keep"
	line "studying the"
	cont "SMEARGLE here."
	done
	
GlintGrove_TrioAfterBattleText3:
	text "Perhaps we'll meet"
	line "again someday."
	done
	
GlintGrove_TrioAfterBattleText4:
	text "We'll be on our"
	line "way."
	
	para "Goodbye, TRAINER."
	done
	
GlintGroveStanleyText1:
	text "I see…"
	
	para "Interesting…"
	done
	
GlintGroveStanleyText2:
	text "I came here to"
	line "study this tree."
	
	para "It seems to radi-"
	line "ate some sort of"
	cont "strange energy."
	
	para "I believe that"
	line "energy is what"
	
	para "attracts FAIRY"
	line "TYPE #MON to"
	cont "this forest."
	done
	
GlintGroveStanleyText3:
	text "You're taking the"
	line "GYM CHALLENGE,"
	cont "correct?"
	
	para "You should visit "
	line "the #MON GYM in"
	cont "GLINT CITY."
	
	para "They won't let you"
	line "in without one of"
	cont "these."
	done
	
GlintGroveStanleyText4:
	text "Good luck at the"
	line "GYM, TRAINER."
	
	para "I've heard the"
	line "LEADER is an"
	cont "excellent battler."
	done
	
GlintGroveNPC1Text:
	text "You didn't hear it"
	line "from me, but they"
	
	para "say there's a"
	line "secret spot some-"
	
	para "where in this"
	line "forest."
	
	para "Where?"
	
	para "Oh, I have no"
	line "idea."
	
	para "It's probably just"
	line "a rumor."
	done
	
GlintGroveNPC2Text:
	text "I saw a #MON"
	line "with a long tail"
	cont "in the grass!"
	
	para "My mom won't"
	line "believe me, but I"
	cont "saw it!"
	
	para "Honest!"
	done
	
GlintGroveNPC3Text:
	text "This grove is such"
	line "a pleasant place"
	cont "for a hike."
	
	para "I can see why the"
	line "FAIRY #MON"
	cont "are drawn here."
	done
	
GlintGroveNPC4Text1:
	text "I think I see a"
	line "clearing in the" 
	cont "trees down river."
	
	para "I wish I could"
	line "explore it, but"
	cont "I can't swim!"
	done
	
GlintGroveNPC4Text2:
	text "So what was over"
	line "there?"
	
	para "A nest of"
	line "SMEARGLE and"
	cont "three weird guys?"
	
	para "Man."
	
	para "I really need to"
	line "learn how to swim."
	done
	
GlintGroveTrioRed:
	opentext
	writetext GlintGrove_TrioRedBattleText1
	yesorno
	iffalse GlintGroveTrioRedNo
	writetext GlintGrove_TrioRedBattleText2
	waitbutton
	
	winlosstext GlintGrove_TrioRedWinText, GlintGrove_TrioRedLoseText
	setlasttalked GLINTGROVE_TRIO_RED
	loadtrainer TRIOBROR, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iffalse .GlintGroveTrioRedYouWon
	jump .GlintGroveTrioRedYouLost
	
.GlintGroveTrioRedYouWon:
	opentext
	writetext GlintGrove_TrioRedAfterBattleText1
	buttonsound
	jump GlintGroveTrioFinish
	
.GlintGroveTrioRedYouLost:
	special HealParty
	opentext
	writetext GlintGrove_TrioRedAfterBattleText2
	buttonsound
	jump GlintGroveTrioFinish
	
GlintGroveTrioBlue:
	opentext
	writetext GlintGrove_TrioBlueBattleText1
	yesorno
	iffalse GlintGroveTrioBlueNo
	writetext GlintGrove_TrioBlueBattleText2
	waitbutton
	
	winlosstext GlintGrove_TrioBlueWinText, GlintGrove_TrioBlueLoseText
	setlasttalked GLINTGROVE_TRIO_BLUE
	loadtrainer TRIOBROB, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iffalse .GlintGroveTrioBlueYouWon
	jump .GlintGroveTrioBlueYouLost
	
.GlintGroveTrioBlueYouWon:
	opentext
	writetext GlintGrove_TrioBlueAfterBattleText1
	buttonsound
	jump GlintGroveTrioFinish
	
.GlintGroveTrioBlueYouLost:
	special HealParty
	opentext
	writetext GlintGrove_TrioBlueAfterBattleText2
	buttonsound
	jump GlintGroveTrioFinish
	
GlintGroveTrioYellow:
	opentext
	writetext GlintGrove_TrioYellowBattleText1
	yesorno
	iffalse GlintGroveTrioYellowNo
	writetext GlintGrove_TrioYellowBattleText2
	waitbutton
	
	winlosstext GlintGrove_TrioYellowWinText, GlintGrove_TrioYellowLoseText
	setlasttalked GLINTGROVE_TRIO_YELLOW
	loadtrainer TRIOBROY, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	iffalse .GlintGroveTrioYellowYouWon
	jump .GlintGroveTrioYellowYouLost
	
.GlintGroveTrioYellowYouWon:
	opentext
	writetext GlintGrove_TrioYellowAfterBattleText1
	buttonsound
	jump GlintGroveTrioFinish
	
.GlintGroveTrioYellowYouLost:
	special HealParty
	opentext
	writetext GlintGrove_TrioYellowAfterBattleText2
	buttonsound
	
GlintGroveTrioFinish
	pause 10
	spriteface PLAYER, DOWN
	writetext GlintGrove_TrioAfterBattleText1
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioAfterBattleText2
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioAfterBattleText3
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioAfterBattleText4
	waitbutton
	closetext
	checkevent EVENT_TALKING_TO_TRIO_BROS2
	iftrue .GlintGroveTrioFinish2
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue4
	playsound SFX_EXIT_BUILDING
	disappear GLINTGROVE_TRIO_BLUE
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed4
	playsound SFX_EXIT_BUILDING
	disappear GLINTGROVE_TRIO_RED
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow4
	playsound SFX_EXIT_BUILDING
	disappear GLINTGROVE_TRIO_YELLOW
	setevent EVENT_TRIO_BROS
	clearevent EVENT_TRIO_BROS2
	end
	
.GlintGroveTrioFinish2:
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow5
	playsound SFX_EXIT_BUILDING
	disappear GLINTGROVE_TRIO_YELLOW
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed5
	playsound SFX_EXIT_BUILDING
	disappear GLINTGROVE_TRIO_RED
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue5
	playsound SFX_EXIT_BUILDING
	disappear GLINTGROVE_TRIO_BLUE
	setevent EVENT_TRIO_BROS
	clearevent EVENT_TRIO_BROS2
	end
	
	
GlintGroveTrioRedNo:
	writetext GlintGrove_TrioRedBattleText3
	waitbutton
	closetext
	end
	
GlintGroveTrioBlueNo:
	writetext GlintGrove_TrioBlueBattleText3
	waitbutton
	closetext
	end
	
GlintGroveTrioYellowNo:
	writetext GlintGrove_TrioYellowBattleText3
	waitbutton
	closetext
	end
	
GlintGroveTrioTrigger1:
	special Special_StopRunning
	checkevent EVENT_TRIO_BROS
	iftrue GlintGroveTrioTriggerEnd
	checkevent EVENT_TALKING_TO_TRIO_BROS1
	iftrue GlintGroveTrioWait
	setevent EVENT_TALKING_TO_TRIO_BROS1
	applymovement PLAYER, Movement_GlintGroveTrioPlayer
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed1
	opentext
	writetext GlintGrove_TrioText1
	waitbutton
	closetext
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue1
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText2
	waitbutton
	closetext
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow1
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText3
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText4
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText5
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText6
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText7
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText8
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText9
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed3
	opentext
	writetext GlintGrove_TrioText10
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue3
	opentext
	writetext GlintGrove_TrioText11
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow3
	opentext
	writetext GlintGrove_TrioText12
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed1
	opentext
	writetext GlintGrove_TrioText13
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue2
	opentext
	writetext GlintGrove_TrioText14
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow1
	opentext
	writetext GlintGrove_TrioText15
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText16
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText17
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText18
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText19
	waitbutton
	closetext
	end
	
GlintGroveTrioTrigger2:
	special Special_StopRunning
	checkevent EVENT_TRIO_BROS
	iftrue GlintGroveTrioTriggerEnd
	checkevent EVENT_TALKING_TO_TRIO_BROS2
	iftrue GlintGroveTrioWait
	setevent EVENT_TALKING_TO_TRIO_BROS2
	applymovement PLAYER, Movement_GlintGroveTrioPlayer
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed2
	opentext
	writetext GlintGrove_TrioText1
	waitbutton
	closetext
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue2
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText2
	waitbutton
	closetext
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow2
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText3
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText4
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText5
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText6
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText7
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText8
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText9
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed3
	opentext
	writetext GlintGrove_TrioText10
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue3
	opentext
	writetext GlintGrove_TrioText11
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow3
	opentext
	writetext GlintGrove_TrioText12
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement GLINTGROVE_TRIO_RED, Movement_GlintGroveTrioRed1
	opentext
	writetext GlintGrove_TrioText13
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	applymovement GLINTGROVE_TRIO_BLUE, Movement_GlintGroveTrioBlue2
	opentext
	writetext GlintGrove_TrioText14
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applymovement GLINTGROVE_TRIO_YELLOW, Movement_GlintGroveTrioYellow1
	opentext
	writetext GlintGrove_TrioText15
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText16
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	opentext
	writetext GlintGrove_TrioText17
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	opentext
	writetext GlintGrove_TrioText18
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	opentext
	writetext GlintGrove_TrioText19
	waitbutton
	closetext
	end
	
GlintGroveTrioTriggerEnd:
	end
	
GlintGroveTrioWait:
	opentext
	writetext GlintGrove_TrioTextWait
	waitbutton
	closetext
	applymovement PLAYER, Movement_GlintGroveTrioPlayer
	end
	
;GlintGroveClue:
;	checkitem CLUE_2
;	iffalse .end
;	checkitem CLUE_3
;	iftrue .end
;	opentext
;	writetext GlintGroveClueText
;	waitbutton
;	verbosegiveitem CLUE_3
;	closetext
;	end
;.end
;	killsfx
;	end
	
;GlintGroveClueText:
;	text "You find something"
;	line "under the bench…"
	
;	para "It's another clue!"
;	done
