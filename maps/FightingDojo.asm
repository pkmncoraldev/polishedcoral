FightingDojo_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_event  3,  9, ROUTE_23, 2
	warp_event  4,  9, ROUTE_23, 2

	db 0 ; coord events

	db 2 ; bg events
	signpost  2,  3, SIGNPOST_UP, FightingDojoSign1
	signpost  2,  4, SIGNPOST_UP, FightingDojoSign2

	db 3 ; object events
	person_event SPRITE_MASTER,  2,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, FightingDojoMaster, EVENT_FIGHTING_DOJO_MASTER_GONE
	person_event SPRITE_BLACK_BELT,  0,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_BATTLE_GIRL,  0,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	
	
	const_def 1 ; object constants
	const FIGHTING_DOJO_MASTER
	const FIGHTING_DOJO_BLACKBELT
	const FIGHTING_DOJO_BATTLE_GIRL
	
FightingDojoMaster:
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .done
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
	winlosstext FightingDojoMasterWinText, 0
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
.done
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
	writetext FightingDojoMasterText8
	waitbutton
	closetext
	end
	
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
	text "Your quest next"
	line "takes you to the"
	cont "GYM in OBSCURA"
	cont "CITY."
	
	para "I must warn you."
	
	para "I sense much hard-"
	line "ship on the way."
	
	para "You should prepare"
	line "for anything and"
	cont "remain vigilant."
	
	para "Until we meet"
	line "again, child…"
	
	para "Farewell…"
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
	
FightingDojoMasterWinText:
	text "…"
	done
	
FightingDojoMasterTextNo:
	text "Then begone…"
	done
	