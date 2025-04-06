FightingDojo_MapScriptHeader:
	db 3 ; scene scripts
	scene_script FightingDojoTrigger0
	scene_script FightingDojoTrigger1
	scene_script FightingDojoTrigger2

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  9, ROUTE_23, 2
	warp_event  4,  9, ROUTE_23, 2

	db 0 ; coord events

	db 3 ; bg events
	signpost  2,  3, SIGNPOST_UP, FightingDojoSign1
	signpost  2,  4, SIGNPOST_UP, FightingDojoSign2
	signpost  1,  6, SIGNPOST_JUMPTEXT, FightingDojoDoorText

	db 5 ; object events
	person_event SPRITE_MASTER,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FightingDojoMaster, EVENT_FIGHTING_DOJO_MASTER_GONE
	person_event SPRITE_BLACK_BELT,  0,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BATTLE_GIRL,  0,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_MASTER,  5,  4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET
	person_event SPRITE_MASTER,  5,  4, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ALWAYS_SET

	
	const_def 1 ; object constants
	const FIGHTING_DOJO_MASTER
	const FIGHTING_DOJO_BLACKBELT
	const FIGHTING_DOJO_BATTLE_GIRL
	const FIGHTING_DOJO_BAG_APPEAR
	const FIGHTING_DOJO_BAG
	
FightingDojoTrigger0:
	end
	
FightingDojoTrigger1:
	callasm TestOfMindAsm2
	applymovement PLAYER, Movement_FightingDojoStupidHackyThing
	applyonemovement PLAYER, remove_fixed_facing
	playmusic MUSIC_DOJO
	clearevent EVENT_TEST_OF_MIND_ACTIVE
	callasm LoadMapPals
	special FadeInPalettes
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	opentext
	writetext FightingDojoMasterTestFailedText
	waitbutton
	closetext
	dotrigger $0
	end
	
FightingDojoTrigger2:
	playmusic MUSIC_NONE
	playsound SFX_SUPER_EFFECTIVE
	callasm TestOfMindAsm2
	opentext
	writetext FightingDojoMasterTestOverText2
	pause 30
	closetext
	pause 20
	playmusic MUSIC_DOJO
	clearevent EVENT_TEST_OF_BODY_ACTIVE
	setevent EVENT_FINISHED_TRIAL_OF_BODY
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	pause 10
	opentext
	writetext FightingDojoMasterTestOverText
	waitbutton
	closetext
	pause 10
	playsound SFX_WATER_GUN
	spriteface FIGHTING_DOJO_BAG, UP
	pause 2
	disappear FIGHTING_DOJO_BAG
	pause 20
	playsound SFX_WATER_GUN
	appear FIGHTING_DOJO_MASTER
	spriteface FIGHTING_DOJO_MASTER, UP
	pause 2
	spriteface FIGHTING_DOJO_MASTER, DOWN
	pause 20
	loadvar wPlayerState, PLAYER_NORMAL
	callasm ReplaceKrisSprite
	applymovement PLAYER, Movement_FightingDojoPlayerReturn
	spriteface PLAYER, UP
	pause 5
	opentext
	writetext FightingDojoMasterTestofBodyPassedText
	waitbutton
	verbosegivetmhm TM_BULK_UP
	writetext FightingDojoMasterTestofBodyPassedText2
	buttonsound
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_FINISHED_TRIAL_OF_MIND
	iftrue .finished
	writetext FightingDojoMasterOneMoreTestText
	waitbutton
	closetext
	dotrigger $0
	end
.finished
	writetext FightingDojoMasterTestsDoneText
	waitbutton
	closetext
	dotrigger $0
	end	
	
FightingDojoMaster:
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .got_strength
	writetext FightingDojoMasterText1
	yesorno
	iffalse .no
	writetext FightingDojoMasterText2
	yesorno
	iffalse .no_rest
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	opentext
.no_rest
	writetext FightingDojoMasterText3
	waitbutton
	closetext
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight
	if_equal UP, .YouAreFacingUp
;.YouAreFacingLeft
	applymovement PLAYER, Movement_FightingDojoPlayerLeft
	jump .cont
.YouAreFacingRight
	applymovement PLAYER, Movement_FightingDojoPlayerRight
	jump .cont
.YouAreFacingUp
	applymovement PLAYER, Movement_FightingDojoPlayerUp
.cont
	setlasttalked FIGHTING_DOJO_BLACKBELT
	scall FightingDojoOpponentAppear
	opentext
	writetext FightingDojoBlackbelt1Text1
	waitbutton
	closetext
	waitsfx
	winlosstext FightingDojoBlackbelt1WinText, 0
	loadtrainer BLACKBELT_T, KIYO
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
	writetext FightingDojoBlackbelt1Text2
	waitbutton
	closetext
	scall FightingDojoOpponentLeave
	pause 15
	spriteface PLAYER, UP
	opentext
	writetext FightingDojoMasterText4
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	
	pause 30
	setlasttalked FIGHTING_DOJO_BATTLE_GIRL
	scall FightingDojoOpponentAppear
	opentext
	writetext FightingDojoBattleGirl1Text1
	waitbutton
	closetext
	waitsfx
	winlosstext FightingDojoBattleGirl1WinText, 0
	loadtrainer BATTLE_GIRL, KIMIKO
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
	writetext FightingDojoBattleGirl1Text2
	waitbutton
	closetext
	scall FightingDojoOpponentLeave
	pause 15
	spriteface PLAYER, UP
	opentext
	writetext FightingDojoMasterText4
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	
	pause 30
	setlasttalked FIGHTING_DOJO_BATTLE_GIRL
	scall FightingDojoOpponentAppear
	opentext
	writetext FightingDojoBattleGirl2Text1
	waitbutton
	closetext
	waitsfx
	winlosstext FightingDojoBattleGirl2WinText, 0
	loadtrainer BATTLE_GIRL, SAYORI
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
	writetext FightingDojoBattleGirl2Text2
	waitbutton
	closetext
	scall FightingDojoOpponentLeave
	pause 15
	spriteface PLAYER, UP
	opentext
	writetext FightingDojoMasterText4
	waitbutton
	closetext
	spriteface PLAYER, RIGHT
	
	pause 30
	setlasttalked FIGHTING_DOJO_BLACKBELT
	scall FightingDojoOpponentAppear
	opentext
	writetext FightingDojoBlackbelt2Text1
	waitbutton
	closetext
	waitsfx
	winlosstext FightingDojoBlackbelt2WinText, 0
	loadtrainer BLACKBELT_T, YUJI
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	opentext
	writetext FightingDojoBlackbelt2Text2
	waitbutton
	closetext
	scall FightingDojoOpponentLeave
	
	pause 15
	spriteface PLAYER, UP
	opentext
	writetext FightingDojoMasterText5
	waitbutton
	closetext
	pause 10
	special Special_FadeOutMusic
	pause 30
	playsound SFX_WATER_GUN
	spriteface FIGHTING_DOJO_MASTER, UP
	pause 2
	disappear FIGHTING_DOJO_MASTER
	pause 10
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 20
	applyonemovement PLAYER, turn_step_left
	spriteface PLAYER, LEFT
	pause 10
	applyonemovement PLAYER, turn_step_right
	spriteface PLAYER, RIGHT
	pause 10
	applyonemovement PLAYER, turn_step_left
	spriteface PLAYER, LEFT
	moveperson FIGHTING_DOJO_MASTER, $4, $5
	pause 30
	playsound SFX_WATER_GUN
	appear FIGHTING_DOJO_MASTER
	spriteface FIGHTING_DOJO_MASTER, UP
	pause 2
	spriteface FIGHTING_DOJO_MASTER, LEFT
	pause 20
	spriteface PLAYER, RIGHT
	pause 20
	opentext
	writetext FightingDojoMasterText6	
	waitbutton
	closetext
	pause 20
	setlasttalked FIGHTING_DOJO_MASTER
	winlosstext FightingDojoMasterWinText, FightingDojoMasterLoseText
	loadtrainer DOJO_MASTER, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_NORMAL
	startbattle
	reloadmapafterbattle
	playmusic MUSIC_DOJO
	opentext
	writetext FightingDojoMasterText7
	waitbutton
	closetext
	playsound SFX_FULL_HEAL
	waitsfx
	pause 10
	opentext
	writetext FightingDojoMasterText10
	special HealParty
	waitbutton
	closetext
	pause 30
	playsound SFX_WATER_GUN
	spriteface FIGHTING_DOJO_MASTER, UP
	pause 2
	disappear FIGHTING_DOJO_MASTER
	pause 10
	domaptrigger ROUTE_23, $2
	end
.no
	writetext FightingDojoMasterTextNo
	waitbutton
	closetext
	end
.got_strength
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .skip_trials_intro
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext FightingDojoMasterText9
	yesorno
	iffalse .no_rest2
	closetext
	special FadeOutPalettesBlack
	special HealParty
	special SaveMusic
	playmusic MUSIC_HEAL
	pause 60
	special RestoreMusic
	callasm LoadMapPals
	special FadeInPalettes
	opentext
.no_rest2
	checkevent EVENT_FINISHED_TRIAL_OF_MIND
	iftrue .testofbody
	checkevent EVENT_FINISHED_TRIAL_OF_BODY
	iftrue .testofmind
	writetext FightingDojoMasterText8
	buttonsound
	farwritetext StdBlankText
	pause 6
.skip_trials_intro
	checkevent EVENT_FINISHED_TRIAL_OF_MIND
	iftrue .testofbody
	checkevent EVENT_FINISHED_TRIAL_OF_BODY
	iftrue .testofmind
	writetext FightingDojoMasterText11
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequal $1, .testofmind
	ifequal $2, .testofbody
	waitbutton
	closetext
	end
.testofmind
	checkevent EVENT_FINISHED_TRIAL_OF_MIND
	iftrue TrialOfMindTimesUp.finished
	writetext FightingDojoMasterTestofMindText
	yesorno
	iffalse .said_no
	closetext
	pause 5
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight2
	if_equal UP, .YouAreFacingUp2
	applymovement PLAYER, Movement_FightingDojoPlayerLeft
	jump .testofmind_cont
.YouAreFacingRight2
	applymovement PLAYER, Movement_FightingDojoPlayerRight
	jump .testofmind_cont
.YouAreFacingUp2
	applymovement PLAYER, Movement_FightingDojoPlayerUp
.testofmind_cont
	pause 10
	applyonemovement PLAYER, turn_step_down
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	special Special_FadeOutMusic
	pause 20
	opentext
	writetext FightingDojoMasterCountdown3
	pause 25
	writetext FightingDojoMasterCountdown2
	pause 25
	writetext FightingDojoMasterCountdown1
	pause 25
	writetext FightingDojoMasterCountdownBegin
	pause 25
	closetext
	special FadeOutPalettesBlack
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	callasm TestOfMindAsm
	setevent EVENT_TEST_OF_MIND_ACTIVE
	end
.testofbody
	checkevent EVENT_FINISHED_TRIAL_OF_BODY
	iftrue TrialOfMindTimesUp.finished
	writetext FightingDojoMasterTestofBodyText
	yesorno
	iffalse .said_no
	closetext
	pause 5
	checkcode VAR_FACING
	if_equal RIGHT, .YouAreFacingRight3
	if_equal UP, .YouAreFacingUp3
	applymovement PLAYER, Movement_FightingDojoPlayerLeft
	jump .testofbody_cont
.YouAreFacingRight3
	applymovement PLAYER, Movement_FightingDojoPlayerRight
	jump .testofbody_cont
.YouAreFacingUp3
	applymovement PLAYER, Movement_FightingDojoPlayerUp
.testofbody_cont
	spriteface PLAYER, RIGHT
	loadvar wPlayerState, PLAYER_PHOTO_3
	callasm ReplaceKrisSprite
	pause 10
	special Special_FadeOutMusic
	pause 20
	playsound SFX_WATER_GUN
	spriteface FIGHTING_DOJO_MASTER, UP
	pause 2
	disappear FIGHTING_DOJO_MASTER
	pause 20
	playsound SFX_WATER_GUN
	appear FIGHTING_DOJO_BAG_APPEAR
	applyonemovement PLAYER, remove_fixed_facing
	pause 2
	spriteface FIGHTING_DOJO_BAG_APPEAR, LEFT
	appear FIGHTING_DOJO_BAG
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	disappear FIGHTING_DOJO_BAG_APPEAR
	pause 20
	opentext
	writetext FightingDojoMasterCountdown3
	pause 25
	writetext FightingDojoMasterCountdown2
	pause 25
	writetext FightingDojoMasterCountdown1
	pause 25
	writetext FightingDojoMasterCountdownBegin
	pause 25
	closetext
	playmusic MUSIC_GSC_GAME_CORNER
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	callasm TestOfMindAsm
	setevent EVENT_TEST_OF_BODY_ACTIVE
	end
.said_no
	writetext FightingDojoMasterTextNo2
	waitbutton
	closetext
	end
	
.MenuData:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 16 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db "TRIAL OF MIND@"
	db "TRIAL OF BODY@"
	db "CANCEL@"
	
TrialOfMindTimesUp::
	playmusic MUSIC_DOJO
	clearevent EVENT_TEST_OF_MIND_ACTIVE
	callasm TestOfMindAsm2
	callasm LoadMapPals
	special FadeInPalettes
	setevent EVENT_FINISHED_TRIAL_OF_MIND
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	pause 10
	opentext
	writetext FightingDojoMasterTestOverText
	waitbutton
	closetext
	applymovement PLAYER, Movement_FightingDojoPlayerReturn
	spriteface PLAYER, UP
	pause 5
	opentext
	writetext FightingDojoMasterTestofMindPassedText
	waitbutton
	verbosegivetmhm TM_CALM_MIND
	writetext FightingDojoMasterTestofMindPassedText2
	buttonsound
	farwritetext StdBlankText
	pause 6
	checkevent EVENT_FINISHED_TRIAL_OF_BODY
	iftrue .finished
	writetext FightingDojoMasterOneMoreTestText
	waitbutton
	closetext
	end
.finished
	writetext FightingDojoMasterTestsDoneText
	waitbutton
	closetext
	end
	
TrialOfBodyTimesUp::
	callasm TestOfMindAsm2
	playmusic MUSIC_DOJO
	clearevent EVENT_TEST_OF_BODY_ACTIVE
	loadvar wRanchRaceFrames, 0
	loadvar wRanchRaceSeconds, 0
	loadvar wCurrentAirportBaggage, 0
	opentext
	writetext FightingDojoMasterTestFailedText
	waitbutton
	closetext
	pause 10
	playsound SFX_WATER_GUN
	spriteface FIGHTING_DOJO_BAG, UP
	pause 2
	disappear FIGHTING_DOJO_BAG
	pause 20
	playsound SFX_WATER_GUN
	appear FIGHTING_DOJO_MASTER
	spriteface FIGHTING_DOJO_MASTER, UP
	pause 2
	spriteface FIGHTING_DOJO_MASTER, DOWN
	pause 20
	end
	
TestOfMindAsm:
	ld a, TILESET_RANCH
	ld [wTileset], a
	farcall DeferredLoadGraphics
	farcall DecompressMetatiles
	farjp ActivateMapAnims
	
TestOfMindAsm2:
	ld a, TILESET_HOUSE_2
	ld [wTileset], a
	farcall DeferredLoadGraphics
	farcall DecompressMetatiles
	farjp ActivateMapAnims
	
FightingDojoOpponentAppear:
	pause 30
	playsound SFX_DOUBLE_SLAP
	changeblock $4, $0, $d1
	changeblock $6, $0, $d0
	callasm GenericFinishBridge
	pause 10
	applymovement2 Movement_FightingDojoBlackbelts0
	pause 5
	spriteface LAST_TALKED, UP
	pause 10
	playsound SFX_POISON_STING
	changeblock $4, $0, $1f
	changeblock $6, $0, $35
	callasm GenericFinishBridge
	pause 5
	applymovement2 Movement_FightingDojoBlackbelts1
	end
	
FightingDojoOpponentLeave:
	pause 10
	applymovement2 Movement_FightingDojoBlackbelts2
	pause 10
	playsound SFX_DOUBLE_SLAP
	changeblock $4, $0, $d1
	changeblock $6, $0, $d0
	callasm GenericFinishBridge
	pause 5
	applymovement2 Movement_FightingDojoBlackbelts3
	pause 10
	playsound SFX_POISON_STING
	changeblock $4, $0, $1f
	changeblock $6, $0, $35
	callasm GenericFinishBridge
	end

FightingDojoSign1:
	jumptext FightingDojoSign1Text
	
FightingDojoSign2:
	jumptext FightingDojoSign2Text

Movement_FightingDojoBlackbelts0:
	step_down
	step_down
	step_end

Movement_FightingDojoBlackbelts1:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_end

Movement_FightingDojoBlackbelts2:
	step_right
	step_right
	step_up
	step_up
	step_up
	step_end

Movement_FightingDojoBlackbelts3:
	step_up
	step_up
	step_end

Movement_FightingDojoPlayerLeft:
	step_down
	step_down
	step_down
	step_right
	step_end
	
Movement_FightingDojoPlayerReturn:
	step_left
	step_left
	step_up
	step_up
	step_end
	
Movement_FightingDojoPlayerRight:
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_end
	
Movement_FightingDojoPlayerUp:
	step_down
	step_down
	step_right
	step_right
	step_end	

Movement_FightingDojoStupidHackyThing:
	fix_facing
	big_step_down
	big_step_up
	remove_fixed_facing
	step_end
	
FightingDojoSign1Text:
	text "Strengthen the"
	line "body by sharpening"
	cont "the mind…"
	done
	
FightingDojoSign2Text:
	text "Sharpen the mind"
	line "by strengthening"
	cont "the body…"
	done
	
FightingDojoBlackbelt1Text1:
	text "I am your first"
	line "opponent…"
	
	para "and also your"
	line "last!"
	done
	
FightingDojoBlackbelt1WinText:
	text "You've bested me…"
	done
	
FightingDojoBlackbelt1Text2:
	text "My confidence got"
	line "the better of me…"
	
	para "I will improve…"
	done
	
FightingDojoBlackbelt2Text1:
	text "I am so close to"
	line "enlightenment!"
	
	para "The MASTER says"
	line "so!"
	done
	
FightingDojoBlackbelt2WinText:
	text "A stumble in my"
	line "path…"
	done
	
FightingDojoBlackbelt2Text2:
	text "I won't let this"
	line "deter me."
	
	para "I will carry on my"
	line "path!"
	done
	
FightingDojoBattleGirl1Text1:
	text "I will be your"
	line "next opponent!"
	
	para "I hope we both"
	line "learn much from"
	cont "this battle!"
	done
	
FightingDojoBattleGirl1WinText:
	text "I understand…"
	done

FightingDojoBattleGirl1Text2:
	text "I've learned much"
	line "from you and your"
	cont "#MON!"
	
	para "Thank you!"
	done
	
FightingDojoBattleGirl2Text1:
	text "Your trial ends"
	line "here!"
	
	para "I will destroy"
	line "you!"
	done
	
FightingDojoBattleGirl2WinText:
	text "RAAAAGH!"
	done

FightingDojoBattleGirl2Text2:
	text "You've humiliated"
	line "me…"
	
	para "I must redeem"
	line "myself in the eyes"
	cont "of the MASTER."
	done
	
FightingDojoMasterText1:
	text "Child…"
	
	para "Have you come here"
	line "for guidance?"
	
	para "Here we hone our"
	line "bodies and minds"
	cont "through #MON"
	cont "battle…"
	
	para "If enlightenment"
	line "is what you seek,"
	
	para "you must engage my"
	line "four disciples in"
	cont "battle one by one."
	done
	
FightingDojoMasterText2:
	text "There will be no"
	line "time for rest"
	cont "between battles."
	
	para "Will you rest and"
	line "mediate first?"
	done
	
FightingDojoMasterText3:
	text "Then let us"
	line "begin…"
	done
	
FightingDojoMasterText4:
	text "MASTER: Excellent…<WAIT_M>"
	line "Let us continue…"
	done
	
FightingDojoMasterText5:
	text "MASTER: Excellent…"
	
	para "…"
	
	para "You have bested"
	line "my four disciples"
	cont "in battle…"
	
	para "Indeed, you have"
	line "done well…"
	
	para "…"
	
	para "However, you are"
	line "not finished…"
	
	para "Your last"
	line "opponent…"
	done
	
FightingDojoMasterText6:
	text "…shall be myself!"
	done
	
FightingDojoMasterText7:
	text "…"
	
	para "You have proven"
	line "yourself…"
	
	para "I shall restore"
	line "your #MON with"
	cont "my power."
	done
	
FightingDojoMasterText8:
	text "We shall resume"
	line "your training."
	
	para "You have already"
	line "proven your worth"
	cont "against my loyal"
	cont "disciples."
	
	para "The time has come"
	line "for you to conquer"
	cont "your trials."
	done
	
FightingDojoMasterText9:
	text "You have returned."
	
	para "Will you rest and"
	line "mediate?"
	done
	
FightingDojoMasterText10:
	text "I see what is"
	line "on your mind."
	
	para "There is no need"
	line "for words…"
	
	para "A tree has fallen"
	line "and my disciple"
	cont "thinks he cannot"
	cont "move it…"
	
	para "…<WAIT_L><WAIT_M>He will…"
	done
	
FightingDojoMasterText11:
	text "There are two"
	line "trials."
	
	para "The TRIAL OF MIND,"
	line "and the TRIAL OF"
	cont "BODY."
	
	para "Which will you"
	line "attempt first?"
	done
	
FightingDojoMasterTestofMindText:
	text "To strengthen one's"
	line "body, one must"
	cont "sharpen the mind."
	
	para "This can be done"
	line "through the TRIAL"
	cont "OF MIND."
	
	para "You shall remain"
	line "still with your"
	cont "eyes shut for"
	cont "3 minutes."
	
	para "You shall not"
	line "move."
	
	para "You shall only"
	line "breathe."
	
	para "If you so much as"
	line "twitch, the trial"
	cont "will end."
	
	para "…"
	
	para "Shall we begin?"
	done
	
FightingDojoMasterTestFailedText:
	text "Enough!"
	
	para "You have failed."
	
	para "You must attempt"
	line "the trial again."
	done
	
FightingDojoMasterTestofMindPassedText:
	text "You have conquered"
	line "the TRIAL OF MIND."
	
	para "As a reward, you"
	line "shall have this."
	done
	
FightingDojoMasterTestofMindPassedText2:
	text "CALM MIND allows"
	line "the user to focus"
	cont "themselves."
	
	para "This raises both"
	line "their SPCL. ATK"
	cont "and SPCL DEF."
	
	para "…"
	done
	
FightingDojoMasterTestofBodyText:
	text "To sharpen one's"
	line "mind, one must"
	cont "strengthen the"
	cont "body."
	
	para "This can be done"
	line "through the TRIAL"
	cont "OF BODY."
	
	para "You shall have"
	line "30 seconds to"
	cont "strike me as many"
	cont "times as you can."
	
	para "Press the"
	line "A BUTTON to"
	cont "throw a punch."
	
	para "If you fail to"
	line "hit me 200 times,"
	cont "you will start"
	cont "again."
	
	para "…"
	
	para "Shall we begin?"
	done
	
FightingDojoMasterTestofBodyPassedText:
	text "You have conquered"
	line "the TRIAL OF BODY."
	
	para "As a reward, you"
	line "shall have this."
	done
	
FightingDojoMasterTestofBodyPassedText2:
	text "BULK UP allows the"
	line "user to hone their"
	cont "body's muscle."
	
	para "This raises both"
	line "their ATTACK and"
	cont "DEFENSE."
	
	para "…"
	done
	
FightingDojoMasterOneMoreTestText:
	text "One trial remains."
	done
	
FightingDojoMasterTestsDoneText:
	text "Both trials are"
	line "complete."
	
	para "Your training"
	line "here is done."
	
	para "Go out into the"
	line "world and continue"
	cont "your training as"
	cont "your own master."
	done
	
FightingDojoMasterTestOverText:
	text "Excellent…<WAIT_M>"
	line "You've done well."
	done
	
FightingDojoMasterTestOverText2:
	text "Enough!"
	done
	
FightingDojoMasterWinText:
	text "…"
	done
	
FightingDojoMasterLoseText:
FightingDojoMasterTextNo:
	text "Then begone…"
	done
	
FightingDojoMasterTextNo2:
	text "Ready yourself"
	line "and return."
	done
	
FightingDojoMasterCountdown3:
	text "3…"
	done
	
FightingDojoMasterCountdown2:
	text "2…"
	done
	
FightingDojoMasterCountdown1:
	text "1…"
	done
	
FightingDojoMasterCountdownBegin:
	text "Begin."
	done
	
FightingDojoDoorText:
	text "An ornate shoji."
	done
	