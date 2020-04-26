EastTrainCabin1_MapScriptHeader:
	db 3 ; scene scripts
	scene_script EastTrainCabin1Trigger0
	scene_script EastTrainCabin1Trigger1
	scene_script EastTrainCabin1Trigger2

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 1,  4, EAST_TRAIN_CABOOSE, 1
	warp_event 14,  4, EAST_TRAIN_CABIN_2, 1

	db 0 ; coord events

	db 11 ; bg events
	signpost  2,  7, SIGNPOST_RIGHT, EastTrainCabin1PlayersSeat
	signpost  2,  4, SIGNPOST_RIGHT, EastTrainCabin1OtherSeat
	signpost  2,  8, SIGNPOST_LEFT, EastTrainCabin1OtherSeat
	signpost  2, 10, SIGNPOST_RIGHT, EastTrainCabin1OtherSeat
	signpost  2, 11, SIGNPOST_LEFT, EastTrainCabin1OtherSeat
	signpost  6,  2, SIGNPOST_LEFT, EastTrainCabin1OtherSeat
	signpost  6,  4, SIGNPOST_RIGHT, EastTrainCabin1OtherSeat
	signpost  6,  7, SIGNPOST_RIGHT, EastTrainCabin1OtherSeat
	signpost  6,  8, SIGNPOST_LEFT, EastTrainCabin1OtherSeat
	signpost  6, 11, SIGNPOST_LEFT, EastTrainCabin1OtherSeat
	signpost  6, 13, SIGNPOST_RIGHT, EastTrainCabin1OtherSeat

	db 10 ; object events
	person_event SPRITE_SITTING_LADY,  2,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, EastTrainCabin1Healer, -1
	person_event SPRITE_SITTING_PONYTAIL,  6,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, EastTrainCabin1NPC1, -1
	person_event SPRITE_SITTING_GENTLEMAN,  2,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EastTrainCabin1NPC2, -1
	person_event SPRITE_SITTING_YOUNGSTER,  6, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EastTrainCabin1NPC3, -1
	person_event SPRITE_SITTING_GUY,  2, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EastTrainCabin1NPC4, -1
	person_event SPRITE_OFFICER,  3, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EastTrainCabin1Officer, EVENT_SNARE_ON_TRAIN
	person_event SPRITE_OFFICER,  4,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EastTrainCabin1SnareOfficer, EVENT_EAST_TRAIN_CABIN_1_SNARE_OFFICER
	person_event SPRITE_DISGUISEMAN,  2,  3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EastTrainCabin1Snare1, EVENT_BEAT_EAST_TRAIN_CABIN_1_SNARE_1
	person_event SPRITE_SNARE,  2,  9, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, EastTrainCabin1Snare2, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE,  6, 12, SPRITEMOVEDATA_STANDING_UP, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, EastTrainCabin1Snare3, EVENT_ALWAYS_SET


	const_def 1 ; object constants
	const EAST_TRAIN_CABIN_1_HEALER
	const EAST_TRAIN_CABIN_1_NPC1
	const EAST_TRAIN_CABIN_1_NPC2
	const EAST_TRAIN_CABIN_1_NPC3
	const EAST_TRAIN_CABIN_1_NPC4
	const EAST_TRAIN_CABIN_1_OFFICER
	const EAST_TRAIN_CABIN_1_SNARE_OFFICER_STAND
	const EAST_TRAIN_CABIN_1_SNARE_OFFICER
	const EAST_TRAIN_CABIN_1_SNARE2
	const EAST_TRAIN_CABIN_1_SNARE3
	
EastTrainCabin1Trigger0:
	pause 20
	playsound SFX_ELEVATOR_END
	opentext
	writetext EastTrainCabin1ArrivingSoonText
	waitbutton
	closetext
	pause 5
	setflag ENGINE_PUNKS_IN_STARGLOW
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm EastTrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	dotrigger $2
	end
	
EastTrainCabin1Trigger1:
;	TODO: set blackoutmod to the train
	setevent EVENT_DONE_SNARE_TRAIN
	dotrigger $2
	variablesprite SPRITE_DISGUISEMAN, SPRITE_OFFICER
	disappear EAST_TRAIN_CABIN_1_SNARE_OFFICER_STAND
	disappear EAST_TRAIN_CABIN_1_SNARE_OFFICER
	moveperson EAST_TRAIN_CABIN_1_SNARE_OFFICER, 2, 4
	appear EAST_TRAIN_CABIN_1_SNARE_OFFICER
	applymovement EAST_TRAIN_CABIN_1_SNARE_OFFICER, Movement_EastTrainCabin1SnareOfficer
	spriteface EAST_TRAIN_CABIN_1_SNARE_OFFICER, UP
	opentext
	writetext EastTrainCabin1SnareOfficerText1
	waitbutton
	closetext
	pause 20
	callasm EastTrainCabin1FadeInAsm
	pause 20
	opentext
	writetext EastTrainCaboosePAText4
	writetext EastTrainCabin1SnareOfficerText2
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm EastTrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	spriteface PLAYER, DOWN
	applyonemovement EAST_TRAIN_CABIN_1_SNARE_OFFICER, step_left
	follow EAST_TRAIN_CABIN_1_SNARE_OFFICER, PLAYER
	applymovement EAST_TRAIN_CABIN_1_SNARE_OFFICER, Movement_EastTrainCabin1SnareOfficer2
	stopfollow
	spriteface EAST_TRAIN_CABIN_1_SNARE_OFFICER, DOWN
	spriteface PLAYER, UP
	pause 5
	opentext
	writetext EastTrainCabin1SnareOfficerText3
	waitbutton
	changeblock $0, $4, $14
	closetext
	pause 5
	follow PLAYER, EAST_TRAIN_CABIN_1_SNARE_OFFICER
	applyonemovement PLAYER, step_left
	stopfollow
	spriteface EAST_TRAIN_CABIN_1_SNARE_OFFICER, LEFT
	setevent EVENT_EAST_TRAIN_CABIN_1_SNARE_OFFICER
	warpcheck
	end
	
EastTrainCabin1Trigger2:
	end
	
EastTrainCabin1Snare1:
	opentext
	writetext EastTrainCabin1Snare1Text1
	waitbutton
	closetext
	special SaveMusic
	playmusic MUSIC_TEAM_SNARE_ENCOUNTER
	spriteface EAST_TRAIN_CABIN_1_SNARE_OFFICER, DOWN
	showemote EMOTE_SHOCK, EAST_TRAIN_CABIN_1_SNARE_OFFICER, 15
	opentext
	writetext EastTrainCabin1Snare1Text2
	waitbutton
	closetext
	waitsfx
	winlosstext EastTrainCabin1Snare1WinText, 0
	setlasttalked EAST_TRAIN_CABIN_1_SNARE_OFFICER
	loadtrainer GRUNTF, TRAIN_GRUNTF_1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_EAST_TRAIN_CABIN_1_SNARE_1
	opentext
	writetext EastTrainCabin1Snare1Text3
	waitbutton
	closetext
	applyonemovement EAST_TRAIN_CABIN_1_SNARE_OFFICER, turn_step_down
	playsound SFX_BUMP
	applymovement PLAYER, Movement_EastTrainCabin1Snare1_Player
	applymovement EAST_TRAIN_CABIN_1_SNARE_OFFICER, Movement_EastTrainCabin1Snare1
	disappear EAST_TRAIN_CABIN_1_SNARE_OFFICER
	end
	
EastTrainCabin1Snare2:
	generictrainer GRUNTM, TRAIN_GRUNTM_3, EVENT_BEAT_EAST_TRAIN_CABIN_1_SNARE_2, .SeenText, .BeatenText

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
	
EastTrainCabin1Snare3:
	generictrainer GRUNTM, TRAIN_GRUNTM_4, EVENT_BEAT_EAST_TRAIN_CABIN_1_SNARE_3, .SeenText, .BeatenText

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
	
EastTrainCabin1NPC1:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext EastTrainCabin1NPC1Text1
	jump .end
.text2
	writetext EastTrainCabin1NPC1Text2
.end
	waitbutton
	closetext
	end
	
EastTrainCabin1NPC2:
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	faceplayer
	opentext
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_1_TRAINER_1
	iftrue .afterbattle
	writetext EastTrainCabin1NPC2Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	writetext EastTrainCabin1NPC2StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext EastTrainCabin1NPC2WinText, 0
	setlasttalked EAST_TRAIN_CABIN_1_NPC2
	loadtrainer GENTLEMAN, HOWARD
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_EAST_TRAIN_CABIN_1_TRAINER_1
	jump .endnormal
.afterbattle
	writetext EastTrainCabin1NPC2AfterBattleText
	waitbutton
	closetext
.endnormal
	spriteface EAST_TRAIN_CABIN_1_NPC2, RIGHT
	end
.saidno
	writetext EastTrainCabin1NPC2SaidNoText
	waitbutton
	closetext
	jump .endnormal
.snare
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_1_SNARE_1
	iffalse .snarethere
	faceplayer
	opentext
	checkevent EVENT_GOT_EAST_TRAIN_CABIN_1_NUGGET
	iftrue .gotnugget
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext EastTrainCabin1NPC2Text3Boy
	jump .cont
.girl
	writetext EastTrainCabin1NPC2Text3Girl
.cont
	waitbutton
	verbosegiveitem NUGGET
	setevent EVENT_GOT_EAST_TRAIN_CABIN_1_NUGGET
.gotnugget
	writetext EastTrainCabin1NPC2Text4
	jump .end
.snarethere
	opentext
	writetext EastTrainCabin1NPC2Text2
.end
	waitbutton
	spriteface EAST_TRAIN_CABIN_1_NPC2, RIGHT
	closetext
	end
	
EastTrainCabin1NPC3:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_1_TRAINER_2
	iftrue .afterbattle
	writetext EastTrainCabin1NPC3Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext EastTrainCabin1NPC3StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext EastTrainCabin1NPC3WinText, 0
	setlasttalked EAST_TRAIN_CABIN_1_NPC3
	loadtrainer YOUNGSTER, JIMMY
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_EAST_TRAIN_CABIN_1_TRAINER_2
	end
.afterbattle
	writetext EastTrainCabin1NPC3AfterBattleText
	waitbutton
	closetext
	end
.saidno
	writetext EastTrainCabin1NPC3SaidNoText
	waitbutton
	closetext
	end
.snare
	writetext EastTrainCabin1NPC3Text2
.end
	waitbutton
	closetext
	end

EastTrainCabin1NPC4:
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	spriteface EAST_TRAIN_CABIN_1_NPC4, UP
.yourefacingright
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext EastTrainCabin1NPC4Text1
	jump .end
.text2
	writetext EastTrainCabin1NPC4Text2
.end
	waitbutton
	spriteface EAST_TRAIN_CABIN_1_NPC4, LEFT
	closetext
	end
	
EastTrainCabin1Officer:
	jumptextfaceplayer EastTrainCabin1OfficerText
	
EastTrainCabin1SnareOfficer:
	faceplayer
	opentext
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext EastTrainCabin1SnareOfficerTextBoy
	jump .end
.girl
	writetext EastTrainCabin1SnareOfficerTextGirl
.end
	waitbutton
	closetext
	end
	
EastTrainCabin1PlayersSeat:
	opentext
	writetext EastTrainCabin1PlayersSeatText1
	yesorno
	iffalse .no
	closetext
	applyonemovement PLAYER, slow_step_right
	spriteface PLAYER, LEFT
	callasm EastTrainCabin1PlayersSeatAsm
	pause 20
	special FadeOutPalettes
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	callasm EastTrainCabin1FadeInAsm
	pause 10
	special RestoreMusic
	pause 10
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .notnow
	writetext EastTrainCabin1PlayersSeatText3
	yesorno
	iffalse .no2
	closetext
	pause 5
	callasm EastTrainCabin1BlackFadeAsm
	checkevent EVENT_DONE_SNARE_TRAIN
	iffalse .startsnaretrain	
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm EastTrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	end
.no
	closetext
	end
.no2
	closetext
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm EastTrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	end
.startsnaretrain
	pause 30
	dotrigger $1
	end
.notnow
	writetext EastTrainCabin1PlayersSeatText2
	waitbutton
	closetext
	waitbuttonseat
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	callasm EastTrainCabin1PlayersSeatGetUpAsm
	applyonemovement PLAYER, slow_step_left
	clearflag ENGINE_PUNKS_IN_STARGLOW
	end
	
EastTrainCabin1OtherSeat:
	jumptext EastTrainCabin1OtherSeatText
	
EastTrainCabin1Healer:
	faceplayer
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext EastTrainCabin1HealerText1
	jump .cont
.text2
	writetext EastTrainCabin1HealerText2
.cont
	waitbutton
	spriteface EAST_TRAIN_CABIN_1_HEALER, RIGHT
	closetext
	end
	
EastTrainCabin1ArrivingSoonText:
	text "PA: Ding-dong!"
	
	para "This is your"
	line "engineer speaking."
	
	para "Next stop:"
	line "LUSTER CITY!"
	
	para "Please feel free"
	line "to move around the"
	cont "cabins."
	done
	
EastTrainCabin1PlayersSeatText1:
	text "Cop a squat and"
	line "rest for a bit?"
	done
	
EastTrainCabin1PlayersSeatText2:
	text "Your #MON feel"
	line "rested!"

	para "Better get going!"
	done
	
EastTrainCabin1PlayersSeatText3:
	text "Your #MON feel"
	line "rested!"

	para "Take a nap until"
	line "the train arrives?"
	done
	
EastTrainCabin1HealerText1:
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
	
EastTrainCabin1HealerText2:
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
	
EastTrainCabin1PlayersSeatAsm:
	ld a, PLAYER_SITTING
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
EastTrainCabin1PlayersSeatGetUpAsm:
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
EastTrainCabin1FadeInAsm:
	ld b, CGB_MAPPALS
	call GetCGBLayout
	farcall LoadRegularTextboxPalette
	farjp FadeInPalettes
	
EastTrainCabin1BlackFadeAsm:
	ld c, 10
	call FadeToBlack
	ret
	
EastTrainCabin1OtherSeatText:
	text "That's not your"
	line "seat."
	
	para "You shouldn't sit"
	line "there."
	done
	
EastTrainCabin1SnareOfficerTextBoy:
	text "Go back to your"
	line "seat, twerp."
	
	para "I mean, sir!"
	done
	
EastTrainCabin1SnareOfficerTextGirl:
	text "Go back to your"
	line "seat, twerp."
	
	para "I mean, ma'am!"
	done
	
EastTrainCabin1SnareOfficerText1:
	text "Excuse me."
	done
	
EastTrainCabin1SnareOfficerText2:
	text "There seems to be"
	line "an issue with your"
	cont "ticket."
	
	para "Follow me…"
	done

EastTrainCabin1SnareOfficerText3:
	text "In you go…"
	done
	
EastTrainCabin1NPC1Text1:
	text "I can't wait to get"
	line "to LUSTER CITY!"
	
	para "I'm going to do so"
	line "much shopping!"
	
	para "Can't this stupid"
	line "train go any"
	cont "faster?"
	done
	
EastTrainCabin1NPC1Text2:
	text "EEEEK!"
	
	para "Who are these"
	line "weirdos?"
	done
	
EastTrainCabin1NPC2Text1:
	text "Hello."
	
	para "Would you care for"
	line "a battle to pass"
	cont "the time?"
	done
	
EastTrainCabin1NPC2StartBattleText:
	text "Excellent!"
	
	para "I'll show you the"
	line "power of my prized"
	cont "#MON!"
	done
	
EastTrainCabin1NPC2SaidNoText:
	text "How unfortunate."
	done
	
EastTrainCabin1NPC2WinText:
	text "You've bested me!"
	done
	
EastTrainCabin1NPC2AfterBattleText:
	text "Well done!"
	
	para "That was good fun."
	done
	
EastTrainCabin1NPC2Text2:
	text "Young lady, I"
	line "will not be giving"
	cont "you my #MON."
	
	para "I suggest you"
	line "move along."
	done
	
EastTrainCabin1NPC2Text3Boy:
	text "Thank you, young"
	line "man."
	
	para "There was no way"
	line "I was giving that"
	cont "ruffian my prized"
	cont "#MON."
	
	para "Please, take this"
	line "as thanks."
	done
	
EastTrainCabin1NPC2Text3Girl:
	text "Thank you, young"
	line "lady."
	
	para "There was no way"
	line "I was giving that"
	cont "ruffian my prized"
	cont "#MON."
	
	para "Please, take this"
	line "as thanks."
	done
	
EastTrainCabin1NPC2Text4:
	text "Don't push yourself"
	line "too hard."
	done
	
EastTrainCabin1NPC3Text1:
	text "What's up?"
	
	para "You want to"
	line "battle?"
	done
	
EastTrainCabin1NPC3Text2:
	text "TEAM SNARE?"
	
	para "I've heard of these"
	line "guys."
	
	para "What a bunch of"
	line "lowlifes…"
	done
	
EastTrainCabin1NPC3WinText:
	text "Done in!"
	done
	
EastTrainCabin1NPC3AfterBattleText:
	text "You're pretty"
	line "good!"
	done
	
EastTrainCabin1NPC3StartBattleText:
	text "Ah yeah!"
	
	para "Here we go!"
	done
	
EastTrainCabin1NPC3SaidNoText:
	text "Lame!"
	done
	
EastTrainCabin1NPC4Text1:
	text "This train is"
	line "great."
	
	para "It makes my com-"
	line "mute to work much"
	cont "work much quicker!"
	done
	
EastTrainCabin1NPC4Text2:
	text "Oh come on."
	
	para "Now I'm going to be"
	line "late to work…"
	done
	
EastTrainCabin1OfficerText:
	text "Hmm…"
	
	para "Is that guy over"
	line "there new?"
	
	para "Why is his uniform"
	line "a different color?"
	done
	
EastTrainCabin1Snare1Text1:
	text "I'm getting tired"
	line "of this, old man."
	
	para "Hand it over!"
	done
	
EastTrainCabin1Snare1Text2:
	text "What are you doing"
	line "out of your seat?"
	
	para "Argh…"
	
	para "You two are really"
	line "ticking me off!"
	done
	
EastTrainCabin1Snare1Text3:
	text "Well, this could "
	line "be going better…"
	
	para "Forget this!"
	done
	
EastTrainCabin1Snare1WinText:
	text "Argh…"
	done
	
Movement_EastTrainCabin1Snare1:
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
	
Movement_EastTrainCabin1Snare1_Player:
	fix_facing
	jump_step_down
	remove_fixed_facing
	step_end
	
Movement_EastTrainCabin1SnareOfficer:
	step_right
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end
	
Movement_EastTrainCabin1SnareOfficer2:
	step_down
	step_left
	step_left
	step_left
	step_left
	step_up
	step_end
	