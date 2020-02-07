EastTrainCabin2_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event 1,  4, EAST_TRAIN_CABIN_1, 2
	warp_event 14,  4, EAST_TRAIN_CABIN_3, 1

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	person_event SPRITE_SITTING_BIRD_KEEPER,  6,  2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EastTrainCabin2NPC1, -1
	person_event SPRITE_SITTING_POKEFAN,  2, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, EastTrainCabin2NPC2, -1
	person_event SPRITE_SITTING_TWIN,  2, 11, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, EastTrainCabin2NPC3, -1
	person_event SPRITE_SITTING_LADY,  2,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, EastTrainCabin2NPC4, -1
	person_event SPRITE_SITTING_GENTLEMAN,  6,  7, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, EastTrainCabin2NPC5, -1
	person_event SPRITE_OFFICER,  3,  2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, EastTrainCabin2Officer, EVENT_SNARE_ON_TRAIN
	person_event SPRITE_SNARE,  2,  3, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, EastTrainCabin2Snare1, EVENT_ALWAYS_SET
	person_event SPRITE_SNARE_GIRL,  6,  9, SPRITEMOVEDATA_STANDING_UP, 3, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, EastTrainCabin2Snare2, EVENT_ALWAYS_SET

	const_def 1 ; object constants
	const EAST_TRAIN_CABIN_2_NPC1
	const EAST_TRAIN_CABIN_2_NPC2
	const EAST_TRAIN_CABIN_2_NPC3
	const EAST_TRAIN_CABIN_2_NPC4
	const EAST_TRAIN_CABIN_2_NPC5
	
EastTrainCabin2NPC1:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_1
	iftrue .afterbattle
	writetext EastTrainCabin2NPC1Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_HARDCORE_ENCOUNTER
	writetext EastTrainCabin2NPC1StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext EastTrainCabin2NPC1WinText, 0
	setlasttalked EAST_TRAIN_CABIN_2_NPC1
	loadtrainer BIRD_KEEPER, JAZZ
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	setevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_1
	end
.afterbattle
	writetext EastTrainCabin2NPC1AfterBattleText
	waitbutton
	closetext
	end
.saidno
	writetext EastTrainCabin2NPC1SaidNoText
	waitbutton
	closetext
	end
.snare
	writetext EastTrainCabin2NPC1Text2
.end
	waitbutton
	closetext
	end
	
EastTrainCabin2NPC2:
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	spriteface EAST_TRAIN_CABIN_2_NPC2, UP
.yourefacingright
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_2
	iftrue .afterbattle
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext EastTrainCabin2NPC2Text1Boy
	jump .cont
.girl
	writetext EastTrainCabin2NPC2Text1Girl
.cont
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	writetext EastTrainCabin2NPC2StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext EastTrainCabin2NPC2WinText, 0
	setlasttalked EAST_TRAIN_CABIN_2_NPC2
	loadtrainer POKEFANF, URSALA
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	spriteface EAST_TRAIN_CABIN_2_NPC2, LEFT
	setevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_2
	end
.afterbattle
	readvar VAR_PLAYER_GENDER
	if_equal FEMALE, .girl
	if_equal PIPPI, .girl
	writetext EastTrainCabin2NPC2AfterBattleTextBoy
	jump .cont2
.girl2
	writetext EastTrainCabin2NPC2AfterBattleTextGirl
.cont2
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC2, LEFT
	closetext
	end
.saidno
	writetext EastTrainCabin2NPC2SaidNoText
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC2, LEFT
	closetext
	end
.snare
	writetext EastTrainCabin2NPC2Text2
.end
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC2, LEFT
	closetext
	end
	
EastTrainCabin2NPC3:
	faceplayer
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_2
	iftrue .text3
	writetext EastTrainCabin2NPC3Text1
	jump .end
.text2
	writetext EastTrainCabin2NPC3Text2
	jump .end
.text3
	writetext EastTrainCabin2NPC3Text3
.end
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC3, RIGHT
	closetext
	end
	
EastTrainCabin2NPC4:
	checkcode VAR_FACING
	if_equal RIGHT, .yourefacingright
	spriteface EAST_TRAIN_CABIN_2_NPC4, UP
.yourefacingright
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .snare
	checkevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_3
	iftrue .afterbattle
	writetext EastTrainCabin2NPC4Text1
	yesorno
	iffalse .saidno
	special SaveMusic
	playmusic MUSIC_GENTLEMAN_ENCOUNTER
	writetext EastTrainCabin2NPC4StartBattleText
	waitbutton
	closetext
	waitsfx
	winlosstext EastTrainCabin2NPC4WinText, 0
	setlasttalked EAST_TRAIN_CABIN_2_NPC4
	loadtrainer LADY, GRETCHEN
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	special RestoreMusic
	spriteface EAST_TRAIN_CABIN_2_NPC4, LEFT
	setevent EVENT_BEAT_EAST_TRAIN_CABIN_2_TRAINER_3
	end
.afterbattle
	writetext EastTrainCabin2NPC4AfterBattleText
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC4, LEFT
	closetext
	end
.saidno
	writetext EastTrainCabin2NPC4SaidNoText
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC4, LEFT
	closetext
	end
.snare
	writetext EastTrainCabin2NPC4Text2
.end
	waitbutton
	spriteface EAST_TRAIN_CABIN_2_NPC4, LEFT
	closetext
	end
	
EastTrainCabin2NPC5:
	opentext
	checkflag ENGINE_PUNKS_ON_TRAIN
	iftrue .text2
	writetext EastTrainCabin2NPC5Text1
	jump .end
.text2
	writetext EastTrainCabin2NPC5Text2
.end
	waitbutton
	closetext
	end
	
EastTrainCabin2Officer:
	jumptextfaceplayer EastTrainCabin2OfficerText
	
EastTrainCabin2Snare1:
	generictrainer GRUNTM, 8, EVENT_BEAT_EAST_TRAIN_CABIN_2_SNARE_1, .SeenText, .BeatenText

	text "I don't deserve"
	line "this!"
	
	para "I'm the second"
	line "highest ranked"
	cont "grunt on this"
	cont "train!"
	done

.SeenText:
	text "Listen here."
	
	para "I'm the second"
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
	
EastTrainCabin2Snare2:
	generictrainer GRUNTF, 3, EVENT_BEAT_EAST_TRAIN_CABIN_2_SNARE_2, .SeenText, .BeatenText

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
	
EastTrainCabin2NPC1Text1:
	text "Yo!"

	para "How about a battle"
	line "real quick?"
	done

EastTrainCabin2NPC1Text2:
	text "They've gotta be"
	line "crazy if they"
	cont "think they can"
	cont "take my #MON!"
	done

EastTrainCabin2NPC1StartBattleText:
	text "Very cool!"
	done

EastTrainCabin2NPC1WinText:
	text "Ah!"
	
	para "Ya got me!"
	done

EastTrainCabin2NPC1AfterBattleText:
	text "You beat me good…"
	done

EastTrainCabin2NPC1SaidNoText:
	text "Guess not…"
	done

EastTrainCabin2NPC2Text1Boy:
	text "Hello, young man."
	
	para "Would you like to"
	line "battle?"
	done

EastTrainCabin2NPC2Text1Girl:
	text "Hello, young lady."
	
	para "Would you like to"
	line "battle?"
	done

	
EastTrainCabin2NPC2Text2:
	text "Shhh…"
	
	para "It's going to be"
	line "alright…"
	done

EastTrainCabin2NPC2StartBattleText:
	text "Alright then!"
	done

EastTrainCabin2NPC2WinText:
	text "Well done!"
	done

EastTrainCabin2NPC2AfterBattleTextBoy:
	text "You did great,"
	line "young man."
	done

EastTrainCabin2NPC2AfterBattleTextGirl:
	text "You did great,"
	line "young lady."
	done

EastTrainCabin2NPC2SaidNoText:
	text "Aww…"
	
	para "No fun!"
	done

EastTrainCabin2NPC3Text1:
	text "You'll never beat"
	line "my mommy!"
	done

EastTrainCabin2NPC3Text2:
	text "MOMMY!"
	
	para "Who are these men?"
	done

EastTrainCabin2NPC3Text3:
	text "You beat my mommy?"
	
	para "How!?"
	done

EastTrainCabin2NPC4Text1:
	text "Hif fuff hefifoo!"
	
	para "Ha lof ha feef ha"
	line "hih faih!"
	
	para "Hou hu fih fu"
	line "fahuh?"
	done

EastTrainCabin2NPC4Text2:
	text "Hu fofi ha?"
	done

EastTrainCabin2NPC4StartBattleText:
	text "Ha hi feh!"
	done

EastTrainCabin2NPC4WinText:
	text "Hu feef he!"
	done

EastTrainCabin2NPC4AfterBattleText:
	text "Huh faf, fufi!"
	done

EastTrainCabin2NPC4SaidNoText:
	text "Fi ha?"
	done

EastTrainCabin2NPC5Text1:
	text "…"
	
	para "…"
	
	para "He's sleeping"
	line "soundly…"
	done
EastTrainCabin2NPC5Text2:
	text "…"
	
	para "…"
	
	para "He's still sleeping"
	line "soundly…"
	done

EastTrainCabin2OfficerText:
	text "This uniform is"
	line "so stuffy."
	
	para "This stupid hat"
	line "is too tall."
	
	para "I'm seriously"
	line "upset here…"
	done
