TrainCabin2_MapScriptHeader:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, TrainCabin2Callback

	db 2 ; warp events
	warp_event 1,  4, TRAIN_CABIN_1, 2
	warp_event 14,  4, EAST_TRAIN_CAB, 255

	db 0 ; coord events

	db 0 ; bg events

	db 12 ; object events
	person_event SPRITE_SITTING_BIRD_KEEPER,  6,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC1, -1
	person_event SPRITE_SITTING_POKEFANF,  2, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC2, -1
	person_event SPRITE_SITTING_TWIN,  2, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC3, -1
	person_event SPRITE_SITTING_LADY,  2,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC4, -1
	person_event SPRITE_SITTING_GENTLEMAN,  6, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC5, -1
	person_event SPRITE_SITTING_TWIN,  6,  5, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC6, -1
	person_event SPRITE_SITTING_TWIN,  6,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, TrainCabin2NPC7, -1
	person_event SPRITE_OFFICER,  4, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainCabin2Officer, EVENT_TRAIN_DOWN_OFFICER_GONE
	person_event SPRITE_SNARE,  2,  3, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainCabin2Snare1, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE_GIRL,  6,  9, SPRITEMOVEDATA_STANDING_UP, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, TrainCabin2Snare2, EVENT_ALWAYS_SET
	person_event SPRITE_OFFICER,  4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainCabin2Officer, EVENT_TRAIN_GOING_EAST
	person_event SPRITE_OFFICER,  4, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TrainCabin2Officer, EVENT_TRAIN_GOING_WEST

	const_def 1 ; object constants
	const TRAIN_CABIN_2_NPC1
	const TRAIN_CABIN_2_NPC2
	const TRAIN_CABIN_2_NPC3
	const TRAIN_CABIN_2_NPC4
	const TRAIN_CABIN_2_NPC5
	const TRAIN_CABIN_2_NPC6
	const TRAIN_CABIN_2_NPC7
	const TRAIN_CABIN_2_OFFICER_1
	const TRAIN_CABIN_2_SNARE_1
	const TRAIN_CABIN_2_SNARE_2
	const TRAIN_CABIN_2_OFFICER_2
	const TRAIN_CABIN_2_OFFICER_3
	
TrainCabin2Callback:
	checkevent EVENT_SAVED_TRAIN
	iftrue .skip
	moveperson TRAIN_CABIN_2_OFFICER_2, -2,-2
	moveperson TRAIN_CABIN_2_OFFICER_3, -2,-2
.skip
	checkevent EVENT_TRAIN_GOING_WEST
	iffalse .end
	changeblock $2, $0, $21
	changeblock $4, $0, $22
	changeblock $6, $0, $23
	changeblock $8, $0, $21
	changeblock $a, $0, $22
	changeblock $c, $0, $23
	warpmod 1, TRAIN_CABIN_1
	return
.end
	warpmod 1, EAST_TRAIN_CAB
	return
	
TrainCabin2NPC1:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_1
	iftrue .afterbattle
	writetext TrainCabin2NPC1Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext TrainCabin2NPC1StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin2NPC1WinText, 0
	setlasttalked TRAIN_CABIN_2_NPC1
	loadtrainer BIRD_KEEPER, JAZZ
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_1
	end
.afterbattle
	writetext TrainCabin2NPC1AfterBattleText
	waitbutton
	closetext
	end
.saidno
	writetext TrainCabin2NPC1SaidNoText
	waitbutton
	closetext
	end
.snare
	writetext TrainCabin2NPC1Text2
.end
	waitbutton
	closetext
	end
	
TrainCabin2NPC2:
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	spriteface TRAIN_CABIN_2_NPC2, UP
.yourefacingright
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_2
	iftrue .afterbattle
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext TrainCabin2NPC2Text1Boy
	jump .cont
.girl
	writetext TrainCabin2NPC2Text1Girl
.cont
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext TrainCabin2NPC2StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin2NPC2WinText, 0
	setlasttalked TRAIN_CABIN_2_NPC2
	loadtrainer POKEFANF, URSALA
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	spriteface TRAIN_CABIN_2_NPC2, LEFT
	setevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_2
	end
.afterbattle
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext TrainCabin2NPC2AfterBattleTextBoy
	jump .cont2
.girl2
	writetext TrainCabin2NPC2AfterBattleTextGirl
.cont2
	waitbutton
	spriteface TRAIN_CABIN_2_NPC2, LEFT
	closetext
	end
.saidno
	writetext TrainCabin2NPC2SaidNoText
	waitbutton
	spriteface TRAIN_CABIN_2_NPC2, LEFT
	closetext
	end
.snare
	writetext TrainCabin2NPC2Text2
.end
	waitbutton
	spriteface TRAIN_CABIN_2_NPC2, LEFT
	closetext
	end
	
TrainCabin2NPC3:
	faceplayer
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	checkevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_2
	iftrue .text3
	writetext TrainCabin2NPC3Text1
	jump .end
.text2
	writetext TrainCabin2NPC3Text2
	jump .end
.text3
	writetext TrainCabin2NPC3Text3
.end
	waitbutton
	spriteface TRAIN_CABIN_2_NPC3, RIGHT
	closetext
	end
	
TrainCabin2NPC4:
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	spriteface TRAIN_CABIN_2_NPC4, UP
.yourefacingright
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_3
	iftrue .afterbattle
	writetext TrainCabin2NPC4Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	writetext TrainCabin2NPC4StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin2NPC4WinText, 0
	setlasttalked TRAIN_CABIN_2_NPC4
	loadtrainer LADY, GRETCHEN
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	spriteface TRAIN_CABIN_2_NPC4, LEFT
	setevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_3
	end
.afterbattle
	writetext TrainCabin2NPC4AfterBattleText
	waitbutton
	spriteface TRAIN_CABIN_2_NPC4, LEFT
	closetext
	end
.saidno
	writetext TrainCabin2NPC4SaidNoText
	waitbutton
	spriteface TRAIN_CABIN_2_NPC4, LEFT
	closetext
	end
.snare
	writetext TrainCabin2NPC4Text2
.end
	waitbutton
	spriteface TRAIN_CABIN_2_NPC4, LEFT
	closetext
	end
	
TrainCabin2NPC5:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext TrainCabin2NPC5Text1
	jump .end
.text2
	writetext TrainCabin2NPC5Text2
.end
	waitbutton
	closetext
	end
	
TrainCabin2NPC6:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_4
	iftrue .afterbattle
	writetext TrainCabin2NPC6Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_LASS_ENCOUNTER
	writetext TrainCabin2NPC6StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin2NPC6WinText, 0
	setlasttalked TRAIN_CABIN_2_NPC6
	loadtrainer TWINS, TIAMIA
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_4
	end
.afterbattle
	writetext TrainCabin2NPC6AfterBattleText
	waitbutton
	closetext
	end
.saidno
	writetext TrainCabin2NPC6SaidNoText
	waitbutton
	closetext
	end
.snare
	writetext TrainCabin2NPC6Text2
.end
	waitbutton
	closetext
	end
	
TrainCabin2NPC7:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_4
	iftrue .afterbattle
	writetext TrainCabin2NPC7Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_LASS_ENCOUNTER
	writetext TrainCabin2NPC7StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext TrainCabin2NPC7WinText, 0
	setlasttalked TRAIN_CABIN_2_NPC7
	loadtrainer TWINS, MIATIA
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_TRAIN_CABIN_2_TRAINER_4
	end
.afterbattle
	writetext TrainCabin2NPC7AfterBattleText
	waitbutton
	closetext
	end
.saidno
	writetext TrainCabin2NPC7SaidNoText
	waitbutton
	closetext
	end
.snare
	writetext TrainCabin2NPC7Text2
.end
	waitbutton
	closetext
	end	
	
TrainCabin2Officer:
	jumptextfaceplayer TrainCabin2OfficerText
	
TrainCabin2Snare1:
	generictrainer GRUNTM, TRAIN_GRUNTM_5, EVENT_BEAT_TRAIN_CABIN_2_SNARE_1, .SeenText, .BeatenText

	text "I don't deserve"
	line "this!"
	
	para "I'm the forth"
	line "highest ranked"
	cont "grunt on this"
	cont "train!"
	done

.SeenText:
	text "Listen here."
	
	para "I'm the forth"
	line "highest ranked"
	cont "grunt on this"
	cont "train!"
	
	para "You'd better"
	line "respect that!"
	done

.BeatenText:
	text "You little creep!"
	done
	end
	
TrainCabin2Snare2:
	generictrainer GRUNTF, TRAIN_GRUNTF_2, EVENT_BEAT_TRAIN_CABIN_2_SNARE_2, .SeenText, .BeatenText

	text "There goes my"
	line "raise…"
	done

.SeenText:
	text "A kid?"
	
	para "If I take you out"
	line "and steal your"
	cont "#MON,"
	
	para "I might get a"
	line "raise!"
	done

.BeatenText:
	text "Not today,"
	line "I guess…"
	done
	end
	
TrainCabin2NPC1Text1:
	text "Yo!"

	para "How about a battle"
	line "real quick?"
	done

TrainCabin2NPC1Text2:
	text "They've gotta be"
	line "crazy if they"
	cont "think they can"
	cont "take my #MON!"
	done

TrainCabin2NPC1StartBattleText:
	text "Very cool!"
	done

TrainCabin2NPC1WinText:
	text "Ah!"
	
	para "Ya got me!"
	done

TrainCabin2NPC1AfterBattleText:
	text "You beat me good…"
	done

TrainCabin2NPC1SaidNoText:
	text "Guess not…"
	done

TrainCabin2NPC2Text1Boy:
	text "Hello, young man."
	
	para "Would you like to"
	line "battle?"
	done

TrainCabin2NPC2Text1Girl:
	text "Hello, young lady."
	
	para "Would you like to"
	line "battle?"
	done

	
TrainCabin2NPC2Text2:
	text "Shhh…"
	
	para "It's going to be"
	line "alright…"
	done

TrainCabin2NPC2StartBattleText:
	text "Alright then!"
	done

TrainCabin2NPC2WinText:
	text "Well done!"
	done

TrainCabin2NPC2AfterBattleTextBoy:
	text "You did great,"
	line "young man."
	done

TrainCabin2NPC2AfterBattleTextGirl:
	text "You did great,"
	line "young lady."
	done

TrainCabin2NPC2SaidNoText:
	text "That's ok I"
	line "guess…"
	done

TrainCabin2NPC3Text1:
	text "You'll never beat"
	line "my mommy!"
	done

TrainCabin2NPC3Text2:
	text "MOMMY!"
	
	para "Who are these men?"
	done

TrainCabin2NPC3Text3:
	text "You beat my mommy?"
	
	para "How!?"
	done

TrainCabin2NPC4Text1:
	text "Hif fuff hefifoo!"
	
	para "Ha lof ha feef ha"
	line "hih faih!"
	
	para "Hou hu fih fu"
	line "fahuh?"
	done

TrainCabin2NPC4Text2:
	text "Hu fofi ha?"
	done

TrainCabin2NPC4StartBattleText:
	text "Ha hi feh!"
	done

TrainCabin2NPC4WinText:
	text "Hu feef he!"
	done

TrainCabin2NPC4AfterBattleText:
	text "Huh faf, fufi!"
	done

TrainCabin2NPC4SaidNoText:
	text "Fi ha?"
	done

TrainCabin2NPC5Text1:
	text "…"
	
	para "…"
	
	para "He's sleeping"
	line "soundly…"
	done
TrainCabin2NPC5Text2:
	text "…"
	
	para "…"
	
	para "He's still sleeping"
	line "soundly…"
	done

TrainCabin2OfficerText:
	text "This is the CAB."
	
	para "It's where the"
	line "CONDUCTOR drives"
	cont "the train."
	
	para "Passengers aren't"
	line "allowed in here."
	done
	
TrainCabin2NPC6Text1:
	text "Are we there yet?"
	
	para "I'm so bored!"
	
	para "Wanna battle with"
	line "us?"
	done
	
TrainCabin2NPC6Text2:
	text "WAAAHH!"
	
	para "Please don't take"
	line "my #MON!"
	done
	
TrainCabin2NPC6StartBattleText:
	text "YAY!"
	
	para "Come on, MIA!"
	done
	
TrainCabin2NPC6WinText:
	text "TIA: WAAAHH!"
	
	para "MIA: It's alright,"
	line "TIA."
	done

TrainCabin2NPC6AfterBattleText:
	text "Sniff… sniff…"
	
	para "We lost…"
	done

TrainCabin2NPC6SaidNoText:
	text "Aww…"
	
	para "No fun!"
	done
	
TrainCabin2NPC7Text1:
	text "Hi."
	
	para "Do you want to"
	line "battle with my"
	cont "sister and I?"
	done
	
TrainCabin2NPC7Text2:
	text "TIA!"
	
	para "Please stop"
	line "crying…"
	done
	
TrainCabin2NPC7StartBattleText:
	text "Ok!"
	
	para "Let's go, TIA!"
	done
	
TrainCabin2NPC7WinText:
	text "TIA: WAAAHH!"
	
	para "MIA: It's alright,"
	line "TIA."
	done

TrainCabin2NPC7AfterBattleText:
	text "Sorry about my"
	line "sister."
	
	para "She can be so"
	line "childish."
	done

TrainCabin2NPC7SaidNoText:
	text "I see…"
	done
	