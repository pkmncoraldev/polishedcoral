TrainCabin1_MapScriptHeader:
	db 3 ; scene scripts
	scene_script TrainCabin1Trigger0
	scene_script TrainCabin1Trigger1
	scene_script TrainCabin1Trigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, TrainCabin1Callback

	db 4 ; warp events
	warp_event 1,  4, EAST_TRAIN_CABOOSE, 255
	warp_event 14,  4, TRAIN_CABIN_2, 1
	warp_event  7,  2, FLICKER_TRAIN_CUTSCENE, 2
	warp_event  6,  2, LUSTER_TRAIN_CUTSCENE, 1

	db 0 ; coord events

	db 11 ; bg events
	signpost  2,  7, SIGNPOST_RIGHT, TrainCabin1PlayersSeat
	signpost  2,  4, SIGNPOST_RIGHT, TrainCabin1OtherSeat
	signpost  2,  8, SIGNPOST_LEFT, TrainCabin1OtherSeat
	signpost  2, 10, SIGNPOST_RIGHT, TrainCabin1OtherSeat
	signpost  2, 11, SIGNPOST_LEFT, TrainCabin1OtherSeat
	signpost  6,  2, SIGNPOST_LEFT, TrainCabin1OtherSeat
	signpost  6,  4, SIGNPOST_RIGHT, TrainCabin1OtherSeat
	signpost  6,  7, SIGNPOST_RIGHT, TrainCabin1OtherSeat
	signpost  6,  8, SIGNPOST_LEFT, TrainCabin1OtherSeat
	signpost  6, 11, SIGNPOST_LEFT, TrainCabin1OtherSeat
	signpost  6, 13, SIGNPOST_RIGHT, TrainCabin1OtherSeat

	db 12 ; object events
	person_event SPRITE_SITTING_LADY,  2,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, TrainCabin1Healer, -1
	person_event SPRITE_SITTING_PONYTAIL,  6,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, TrainCabin1NPC1, -1
	person_event SPRITE_SITTING_GENTLEMAN,  2,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrainCabin1NPC2, -1
	person_event SPRITE_SITTING_YOUNGSTER,  6, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrainCabin1NPC3, -1
	person_event SPRITE_SITTING_GUY,  2, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrainCabin1NPC4, -1
	person_event SPRITE_OFFICER,  3, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainCabin1Officer, EVENT_TRAIN_DOWN_OFFICER_GONE
	person_event SPRITE_OFFICER,  4,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrainCabin1SnareOfficer, EVENT_TRAIN_CABIN_1_SNARE_OFFICER
	person_event SPRITE_DISGUISEMAN,  2,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrainCabin1Snare1, EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	person_event SPRITE_SNARE,  2,  9, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainCabin1Snare2, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE,  6, 12, SPRITEMOVEDATA_STANDING_UP, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainCabin1Snare3, EVENT_ALWAYS_SET
	person_event SPRITE_OFFICER,  4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainCabin1OfficerCaboose, EVENT_TRAIN_GOING_WEST
	person_event SPRITE_OFFICER,  4, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainCabin1OfficerCaboose, EVENT_TRAIN_GOING_EAST


	const_def 1 ; object constants
	const TRAIN_CABIN_1_HEALER
	const TRAIN_CABIN_1_NPC1
	const TRAIN_CABIN_1_NPC2
	const TRAIN_CABIN_1_NPC3
	const TRAIN_CABIN_1_NPC4
	const TRAIN_CABIN_1_OFFICER
	const TRAIN_CABIN_1_SNARE_OFFICER_STAND
	const TRAIN_CABIN_1_SNARE_OFFICER
	const TRAIN_CABIN_1_SNARE2
	const TRAIN_CABIN_1_SNARE3
	const TRAIN_CABIN_1_OFFICER_2
	const TRAIN_CABIN_1_OFFICER_3
	
TrainCabin1Callback:
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	checkevent EVENT_SAVED_TRAIN
	iftrue .skip
	moveperson TRAIN_CABIN_1_OFFICER_2, -2,-2
	moveperson TRAIN_CABIN_1_OFFICER_3, -2,-2
.skip
	checkevent EVENT_TRAIN_GOING_WEST
	iffalse .end
	changeblock $2, $0, $21
	changeblock $4, $0, $22
	changeblock $6, $0, $23
	changeblock $8, $0, $21
	changeblock $a, $0, $22
	changeblock $c, $0, $23
	warpmod 2, TRAIN_CABIN_2
	return
.end
	warpmod 1, EAST_TRAIN_CABOOSE
	return
	
TrainCabin1Trigger0:
	applyonemovement PLAYER, remove_fixed_facing
	pause 20
	playsound SFX_ELEVATOR_END
	opentext
	checkevent EVENT_TRAIN_GOING_WEST
	iffalse .luster
	writetext TrainCabin1ArrivingSoonText2
	waitbutton
	closetext
	jump .cont
.luster
	writetext TrainCabin1ArrivingSoonText
	waitbutton
	closetext
.cont
	pause 5
	setflag ENGINE_PUNKS_IN_STARGLOW
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm TrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	dotrigger $2
	end
	
TrainCabin1Trigger1:
	dotrigger $2
	variablesprite SPRITE_DISGUISEMAN, SPRITE_OFFICER
	disappear TRAIN_CABIN_1_SNARE_OFFICER_STAND
	disappear TRAIN_CABIN_1_SNARE_OFFICER
	moveperson TRAIN_CABIN_1_SNARE_OFFICER, 2, 4
	appear TRAIN_CABIN_1_SNARE_OFFICER
	applymovement TRAIN_CABIN_1_SNARE_OFFICER, Movement_TrainCabin1SnareOfficer
	spriteface TRAIN_CABIN_1_SNARE_OFFICER, UP
	opentext
	writetext TrainCabin1SnareOfficerText1
	waitbutton
	closetext
	pause 20
	special FadeInTextboxPalettes
	pause 20
	opentext
	writetext EastTrainCaboosePAText4
	writetext TrainCabin1SnareOfficerText2
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm TrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	spriteface PLAYER, DOWN
	applyonemovement TRAIN_CABIN_1_SNARE_OFFICER, step_left
	follow TRAIN_CABIN_1_SNARE_OFFICER, PLAYER
	applymovement TRAIN_CABIN_1_SNARE_OFFICER, Movement_TrainCabin1SnareOfficer2
	stopfollow
	spriteface TRAIN_CABIN_1_SNARE_OFFICER, DOWN
	spriteface PLAYER, UP
	pause 5
	opentext
	writetext TrainCabin1SnareOfficerText3
	waitbutton
	changeblock $0, $4, $14
	closetext
	pause 5
	follow PLAYER, TRAIN_CABIN_1_SNARE_OFFICER
	applyonemovement PLAYER, step_left
	stopfollow
	spriteface TRAIN_CABIN_1_SNARE_OFFICER, LEFT
	setevent EVENT_TRAIN_CABIN_1_SNARE_OFFICER
	warpcheck
	end
	
TrainCabin1Trigger2:
	end
	
TrainCabin1OfficerCaboose:
	jumptextfaceplayer TrainCabin1OfficerCabooseText
	end
	
TrainCabin1Snare1:
	opentext
	writetext TrainCabin1Snare1Text1
	waitbutton
	closetext
	special SaveMusic
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	spriteface TRAIN_CABIN_1_SNARE_OFFICER, DOWN
	showemote EMOTE_SHOCK, TRAIN_CABIN_1_SNARE_OFFICER, 15
	opentext
	writetext TrainCabin1Snare1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin1Snare1WinText, 0
	setlasttalked TRAIN_CABIN_1_SNARE_OFFICER
	loadtrainer GRUNTF, TRAIN_GRUNTF_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	opentext
	writetext TrainCabin1Snare1Text3
	waitbutton
	closetext
	applyonemovement TRAIN_CABIN_1_SNARE_OFFICER, turn_step_down
	playsound SFX_BUMP
	applymovement PLAYER, Movement_TrainCabin1Snare1_Player
	applymovement TRAIN_CABIN_1_SNARE_OFFICER, Movement_TrainCabin1Snare1
	disappear TRAIN_CABIN_1_SNARE_OFFICER
	end
	
TrainCabin1Snare2:
	generictrainer GRUNTM, TRAIN_GRUNTM_3, EVENT_BEAT_TRAIN_CABIN_1_SNARE_2, .SeenText, .BeatenText

	text "Ok. Ok."
	
	para "I really wish you"
	line "just sat down like"
	cont "everyone else…"
	done

.SeenText:
	text "Get back to your"
	line "seat, punk!"
	done

.BeatenText:
	text "Cripes!"
	done
	end
	
TrainCabin1Snare3:
	generictrainer GRUNTM, TRAIN_GRUNTM_4, EVENT_BEAT_TRAIN_CABIN_1_SNARE_3, .SeenText, .BeatenText

	text "There's still"
	line "plenty of us to"
	cont "get through."
	
	para "I'm not worried at"
	line "all."
	done

.SeenText:
	text "We've taken over"
	line "this train,"
	
	para "so you'd better"
	line "listen to us!"
	done

.BeatenText:
	text "Gah Lee!"
	done
	end
	
TrainCabin1NPC1:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	checkevent EVENT_TRAIN_GOING_WEST
	iftrue .west
	writetext TrainCabin1NPC1Text1
	jump .end
.text2
	writetext TrainCabin1NPC1Text2
	jump .end
.west
	writetext TrainCabin1NPC1Text3
.end
	waitbutton
	closetext
	end
	
TrainCabin1NPC2:
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	faceplayer
	opentext
	checkevent EVENT_BEAT_TRAIN_CABIN_1_TRAINER_1
	iftrue .afterbattle
	writetext TrainCabin1NPC2Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	writetext TrainCabin1NPC2StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin1NPC2WinText, 0
	setlasttalked TRAIN_CABIN_1_NPC2
	loadtrainer GENTLEMAN, HOWARD
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_TRAIN_CABIN_1_TRAINER_1
	jump .endnormal
.afterbattle
	writetext TrainCabin1NPC2AfterBattleText
	waitbutton
	closetext
.endnormal
	spriteface TRAIN_CABIN_1_NPC2, RIGHT
	end
.saidno
	writetext TrainCabin1NPC2SaidNoText
	waitbutton
	closetext
	jump .endnormal
.snare
	checkevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	iffalse .snarethere
	faceplayer
	opentext
	checkevent EVENT_GOT_TRAIN_CABIN_1_NUGGET
	iftrue .gotnugget
	checkevent EVENT_PLAYER_IS_CORA
	iftrue .girl
	checkevent EVENT_PLAYER_IS_PIPPI
	iftrue .girl
	checkevent EVENT_PLAYER_IS_LEAF
	iftrue .girl
	checkevent EVENT_PLAYER_IS_KRIS
	iftrue .girl
	writetext TrainCabin1NPC2Text3Boy
	jump .cont
.girl
	writetext TrainCabin1NPC2Text3Girl
.cont
	waitbutton
	verbosegiveitem NUGGET
	setevent EVENT_GOT_TRAIN_CABIN_1_NUGGET
.gotnugget
	writetext TrainCabin1NPC2Text4
	jump .end
.snarethere
	opentext
	writetext TrainCabin1NPC2Text2
.end
	waitbutton
	spriteface TRAIN_CABIN_1_NPC2, RIGHT
	closetext
	end
	
TrainCabin1NPC3:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_TRAIN_CABIN_1_TRAINER_2
	iftrue .afterbattle
	writetext TrainCabin1NPC3Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext TrainCabin1NPC3StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin1NPC3WinText, 0
	setlasttalked TRAIN_CABIN_1_NPC3
	loadtrainer YOUNGSTER, JIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_TRAIN_CABIN_1_TRAINER_2
	end
.afterbattle
	writetext TrainCabin1NPC3AfterBattleText
	waitbutton
	closetext
	end
.saidno
	writetext TrainCabin1NPC3SaidNoText
	waitbutton
	closetext
	end
.snare
	writetext TrainCabin1NPC3Text2
.end
	waitbutton
	closetext
	end

TrainCabin1NPC4:
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	spriteface TRAIN_CABIN_1_NPC4, UP
.yourefacingright
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext TrainCabin1NPC4Text1
	jump .end
.text2
	writetext TrainCabin1NPC4Text2
.end
	waitbutton
	spriteface TRAIN_CABIN_1_NPC4, LEFT
	closetext
	end
	
TrainCabin1Officer:
	checkevent EVENT_SAVED_TRAIN
	iftrue .saved
	jumptextfaceplayer TrainCabin1OfficerText
.saved
	jumptextfaceplayer TrainCabin1OfficerText2
	
TrainCabin1SnareOfficer:
	faceplayer
	opentext
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext TrainCabin1SnareOfficerTextBoy
	jump .end
.girl
	writetext TrainCabin1SnareOfficerTextGirl
.end
	waitbutton
	closetext
	end
	
TrainCabin1PlayersSeat:
	opentext
	writetext TrainCabin1PlayersSeatText1
	yesorno
	iffalse .no
	closetext
	applyonemovement PLAYER, slow_step_right
	spriteface PLAYER, LEFT
	callasm TrainCabin1PlayersSeatAsm
	pause 20
	special FadeOutPalettes
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special FadeInTextboxPalettes;FadeOutPalettesBlack
	pause 10
	special RestoreMusic
	pause 10
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .notnow
	writetext TrainCabin1PlayersSeatText3
	yesorno
	iffalse .no2
	closetext
	pause 5
	special FadeOutPalettesBlack
	pause 30
	checkevent EVENT_DONE_SNARE_TRAIN
	iffalse .startsnaretrain
	changeblock $6, $2, $1b
	callasm TrainCabin1PlayersSeatGetUpAsm
	clearflag ENGINE_PUNKS_IN_STARGLOW
	applyonemovement PLAYER, hide_person
	playsound SFX_ELEVATOR_END
	opentext
	checkevent EVENT_TRAIN_GOING_WEST
	iffalse .luster
	writetext TrainCabin1PlayersSeatArriveTextFlicker
	waitbutton
	closetext
	pause 10
	domaptrigger FLICKER_TRAIN_CUTSCENE, $1
	warpcheck
	end
.luster
	writetext TrainCabin1PlayersSeatArriveTextLuster
	waitbutton
	closetext
	pause 10
	applyonemovement PLAYER, big_step_left
	domaptrigger LUSTER_TRAIN_STATION, $1
	warpcheck
	end
.no
	closetext
	end
.no2
	closetext
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm TrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	end
.startsnaretrain
	pause 30
	dotrigger $1
	end
.notnow
	writetext TrainCabin1PlayersSeatText2
	waitbutton
	closetext
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm TrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	end
	
TrainCabin1OtherSeat:
	jumptext TrainCabin1OtherSeatText
	
TrainCabin1Healer:
	faceplayer
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext TrainCabin1HealerText1
	jump .cont
.text2
	writetext TrainCabin1HealerText2
.cont
	waitbutton
	spriteface TRAIN_CABIN_1_HEALER, RIGHT
	closetext
	end
	
TrainCabin1OfficerCabooseText:
	text "This is the"
	line "CABOOSE."
	
	para "Passengers aren't"
	line "allowed in here."
	done
	
TrainCabin1ArrivingSoonText:
	text "PA: Ding-dong!"
	
	para "This is your"
	line "CONDUCTOR."
	
	para "Next stop:"
	line "LUSTER CITY!"
	
	para "Please feel free"
	line "to move around the"
	cont "cabins."
	done
	
TrainCabin1ArrivingSoonText2:
	text "PA: Ding-dong!"
	
	para "This is your"
	line "CONDUCTOR."
	
	para "Next stop:"
	line "FLICKER STATION!"
	
	para "Please feel free"
	line "to move around the"
	cont "cabins."
	done
	
TrainCabin1PlayersSeatText1:
	text "Cop a squat and"
	line "rest for a bit?"
	done
	
TrainCabin1PlayersSeatText2:
	text "Your #MON feel"
	line "rested!"

	para "Better get going!"
	done
	
TrainCabin1PlayersSeatText3:
	text "Your #MON feel"
	line "rested!"

	para "Take a nap until"
	line "the train arrives?"
	done
	
TrainCabin1HealerText1:
	text "Most folks who"
	line "ride this train"
	cont "love friendly"
	cont "conversation."
	
	para "Some passengers"
	line "might even want"
	cont "to battle."
	
	para "Remember to take"
	line "a seat over there"
	cont "and rest if your"
	cont "#MON need a"
	cont "breather."
	done
	
TrainCabin1HealerText2:
	text "Oh dear!"
	
	para "What a horrible"
	line "racket those hoo-"
	cont "ligans are making."
	
	para "Remember to take"
	line "a seat over there"
	cont "and rest if your"
	cont "#MON need a"
	cont "breather."
	done
	
TrainCabin1PlayersSeatAsm:
	ld a, PLAYER_SITTING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
TrainCabin1PlayersSeatGetUpAsm:
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
TrainCabin1OtherSeatText:
	text "That's not your"
	line "seat."
	
	para "You shouldn't sit"
	line "there."
	done
	
TrainCabin1SnareOfficerTextBoy:
	text "Go back to your"
	line "seat, twerp."
	
	para "I mean, sir!"
	done
	
TrainCabin1SnareOfficerTextGirl:
	text "Go back to your"
	line "seat, twerp."
	
	para "I mean, ma'am!"
	done
	
TrainCabin1SnareOfficerText1:
	text "Excuse me."
	done
	
TrainCabin1SnareOfficerText2:
	text "There seems to be"
	line "an issue with your"
	cont "ticket."
	
	para "Follow me…"
	done

TrainCabin1SnareOfficerText3:
	text "In you go…"
	done
	
TrainCabin1NPC1Text1:
	text "I can't wait to get"
	line "to LUSTER CITY!"
	
	para "I'm going to do so"
	line "much shopping!"
	
	para "Can't this stupid"
	line "train go any"
	cont "faster?"
	done
	
TrainCabin1NPC1Text2:
	text "EEEEK!"
	
	para "Who are these"
	line "weirdos?"
	done
	
TrainCabin1NPC1Text3:
	text "I had a great time"
	line "in LUSTER CITY!"
	
	para "I never wanted"
	line "to leave…"
	done
	
TrainCabin1NPC2Text1:
	text "Hello."
	
	para "Would you care for"
	line "a battle to pass"
	cont "the time?"
	done
	
TrainCabin1NPC2StartBattleText:
	text "Excellent!"
	
	para "I'll show you the"
	line "power of my prized"
	cont "#MON!"
	done
	
TrainCabin1NPC2SaidNoText:
	text "How unfortunate."
	done
	
TrainCabin1NPC2WinText:
	text "You've bested me!"
	done
	
TrainCabin1NPC2AfterBattleText:
	text "Well done!"
	
	para "That was good fun."
	done
	
TrainCabin1NPC2Text2:
	text "Young lady, I"
	line "will not be giving"
	cont "you my #MON."
	
	para "I suggest you"
	line "move along."
	done
	
TrainCabin1NPC2Text3Boy:
	text "Thank you, young"
	line "man."
	
	para "There was no way"
	line "I was giving that"
	cont "ruffian my prized"
	cont "#MON."
	
	para "Please, take this"
	line "as thanks."
	done
	
TrainCabin1NPC2Text3Girl:
	text "Thank you, young"
	line "lady."
	
	para "There was no way"
	line "I was giving that"
	cont "ruffian my prized"
	cont "#MON."
	
	para "Please, take this"
	line "as thanks."
	done
	
TrainCabin1NPC2Text4:
	text "Don't push yourself"
	line "too hard."
	done
	
TrainCabin1NPC3Text1:
	text "What's up?"
	
	para "You want to"
	line "battle?"
	done
	
TrainCabin1NPC3Text2:
	text "TEAM SNARE?"
	
	para "I've heard of these"
	line "guys."
	
	para "What a bunch of"
	line "lowlifes…"
	done
	
TrainCabin1NPC3WinText:
	text "Done in!"
	done
	
TrainCabin1NPC3AfterBattleText:
	text "You're pretty"
	line "good!"
	done
	
TrainCabin1NPC3StartBattleText:
	text "Ah yeah!"
	
	para "Here we go!"
	done
	
TrainCabin1NPC3SaidNoText:
	text "Lame!"
	done
	
TrainCabin1NPC4Text1:
	text "This train is"
	line "great."
	
	para "It makes my com-"
	line "mute to and from"
	cont "work much quicker!"
	done
	
TrainCabin1NPC4Text2:
	text "Oh come on."
	
	para "Now I'm going to be"
	line "late to work…"
	done
	
TrainCabin1OfficerText:
	text "Hmm…"
	
	para "Is that guy over"
	line "there new?"
	
	para "Why is his uniform"
	line "a different color?"
	done
	
TrainCabin1OfficerText2:
	text "This uniform is"
	line "so stuffy."
	
	para "This stupid hat"
	line "is too tall."
	
	para "I'm seriously"
	line "upset here…"
	done
	
TrainCabin1Snare1Text1:
	text "I'm getting tired"
	line "of this, old man."
	
	para "Hand it over!"
	done
	
TrainCabin1Snare1Text2:
	text "What are you doing"
	line "out of your seat?"
	
	para "Argh…"
	
	para "You two are really"
	line "ticking me off!"
	done
	
TrainCabin1Snare1Text3:
	text "Well, this could "
	line "be going better…"
	
	para "Forget this!"
	done
	
TrainCabin1Snare1WinText:
	text "Argh…"
	done
	
TrainCabin1PlayersSeatArriveTextLuster:
	text "PA: Ding-dong!"
	
	para "Now arriving in"
	line "LUSTER CITY."
	done
	
TrainCabin1PlayersSeatArriveTextFlicker:
	text "PA: Ding-dong!"
	
	para "Now arriving at"
	line "FLICKER STATION."
	done
	
Movement_TrainCabin1Snare1:
	turn_step_down
	turn_step_down
	turn_step_down
	run_step_down
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	run_step_right
	step_end
	
Movement_TrainCabin1Snare1_Player:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_TrainCabin1SnareOfficer:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end
	
Movement_TrainCabin1SnareOfficer2:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end
	