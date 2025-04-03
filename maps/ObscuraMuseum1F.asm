ObscuraMuseum1F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script ObscuraMuseum1FTrigger0
	scene_script ObscuraMuseum1FTrigger1
	scene_script ObscuraMuseum1FTrigger2

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ObscuraMuseum1FCallback

	db 5 ; warp events
	warp_def 15,  8, 1, OBSCURA_CITY
	warp_def 15,  9, 2, OBSCURA_CITY
	warp_def  8, 23, 4, OBSCURA_MUSEUM_EMPLOYEE_ROOM
	warp_def -1, -1, 4, OBSCURA_CITY
	warp_def  0,  3, 1, OBSCURA_MUSEUM_2F

	db 6 ; coord events
	coord_event  8, 12, 0, ObscuraMuseum1FStopYouL
	coord_event  9, 12, 0, ObscuraMuseum1FStopYou
	coord_event 11, 10, 0, ObscuraMuseum1FStopYou2
	coord_event  9,  2, 2, ObscuraMuseum1FRockyScript1
	coord_event  9,  4, 2, ObscuraMuseum1FRockyScript2
	coord_event  9,  5, 2, ObscuraMuseum1FRockyScript3

	db 30 ; bg events
	signpost  1, 10, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 11, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 12, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  1, 13, SIGNPOST_UP, ObscuraMuseumBooks
	signpost  5,  2, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  5,  3, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  5,  4, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  5,  5, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  7,  2, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  7,  3, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  7,  4, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  7,  5, SIGNPOST_JUMPTEXT, ObscuraMuseumArtifactText
	signpost  0,  2, SIGNPOST_JUMPTEXT, ObscuraMuseum1FSign
	signpost  8, 22, SIGNPOST_JUMPTEXT, ObscuraMuseumEmployeeSign
	bg_event 20,  9, SIGNPOST_ITEM + BOTTLE_CAP, EVENT_MUSEUM_1F_HIDDEN_BOTTLE_CAP
	signpost 16,  8, SIGNPOST_IFSET, ObscuraMuseumLockedDoor
	signpost 16,  9, SIGNPOST_IFSET, ObscuraMuseumLockedDoor
	signpost  6,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumArcheopsFossilText
	signpost  7,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumArcheopsFossilText
	signpost  8,  8, SIGNPOST_JUMPTEXT, ObscuraMuseumArcheopsFossilText
	signpost  6,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumArcheopsFossilText
	signpost  7,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumArcheopsFossilText
	signpost  8,  9, SIGNPOST_JUMPTEXT, ObscuraMuseumArcheopsFossilText
	signpost  4, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumCarracostaFossilText
	signpost  5, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumCarracostaFossilText
	signpost  6, 12, SIGNPOST_JUMPTEXT, ObscuraMuseumCarracostaFossilText
	signpost  4, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumCarracostaFossilText
	signpost  5, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumCarracostaFossilText
	signpost  6, 13, SIGNPOST_JUMPTEXT, ObscuraMuseumCarracostaFossilText
	signpost  9, 19, SIGNPOST_UP, ObscuraMuseum1FVendingMachine

	db 9 ; object events
	person_event SPRITE_RECEPTIONIST, 12, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum1FReceptionist1, -1
	person_event SPRITE_ROCKY,  3,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum1FRockyScript, EVENT_MUSEUM_1F_ROCKY_SCENE
	person_event SPRITE_SNARE_GIRL,  3,  8, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_MUSEUM_1F_ROCKY_SCENE
	person_event SPRITE_MATRON,  4, 16, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMuseum1FNPC1, -1
	person_event SPRITE_CUTE_GIRL, 13,  1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObscuraMuseum1FNPC2, -1
	object_event  2, 13, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, BAYLEEF, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, ObscuraMuseum1FBayleef, -1
	person_event SPRITE_SNARE,  7, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, ObscuraMuseum1FSnare1, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE,  1,  4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 3, ObscuraMuseum1FSnare2, EVENT_SNARE_GONE_FROM_MUSEUM
	person_event SPRITE_SNARE_GIRL, 12,  1, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_GENERICTRAINER, 0, ObscuraMuseum1FSnare3, EVENT_SNARE_GONE_FROM_MUSEUM
	
	
	const_def 1 ; object constants
	const OBSCURA_MUSEUM_1F_RECEPTIONIST_1
	const OBSCURA_MUSEUM_1F_ROCKY
	const OBSCURA_MUSEUM_1F_SNARE_NPC
	const OBSCURA_MUSEUM_1F_NPC1
	const OBSCURA_MUSEUM_1F_NPC2
	
ObscuraMuseum1FTrigger0:
ObscuraMuseum1FTrigger1:
ObscuraMuseum1FTrigger2:
	end
	
ObscuraMuseum1FCallback:
	domaptrigger OBSCURA_MUSEUM_2F, $0
	checkevent EVENT_SNARE_AT_MUSEUM
	iffalse .skip
	changeblock $8, $e, $93
.skip
	clearevent EVENT_MUSEUM_FAILED_TERMINAL
	callasm MusuemKeyboardAsm3
	return
	
ObscuraMuseum1FVendingMachine:
	opentext
.Start:
	special PlaceMoneyTopRight
	farwritetext VendingMachineText
	waitbutton
	checkevent EVENT_ROCK_CANDY_SOLD_OUT
	iftrue .sold_out
	loadmenu .MenuData
	jump .cont
.sold_out
	loadmenu .MenuDataSoldOut
.cont
	verticalmenu
	closewindow
	ifequal $1, .FreshWater
	ifequal $2, .SodaPop
	ifequal $3, .RageCandyBar
	ifequal $4, .RockCandy
	refreshscreen
	closetext
	end

.FreshWater:
	checkmoney $0, 200
	ifequal $2, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem FRESH_WATER
	iffalse .Start
	itemtotext FRESH_WATER, $0
	jump .ExtraItem

.SodaPop:
	checkmoney $0, 300
	ifequal $2, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney $0, 300
	itemtotext SODA_POP, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem SODA_POP
	iffalse .Start
	itemtotext SODA_POP, $0
	jump .ExtraItem

.RageCandyBar:
	checkmoney $0, 400
	ifequal $2, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NotEnoughSpace
	takemoney $0, 400
	itemtotext RAGECANDYBAR, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem RAGECANDYBAR
	iffalse .Start
	itemtotext RAGECANDYBAR, $0
	jump .ExtraItem

.RockCandy
	checkevent EVENT_ROCK_CANDY_SOLD_OUT
	iftrue .sold_out2
	checkmoney $0, 1500
	ifequal $2, .NotEnoughMoney
	giveitem ROCK_CANDY
	iffalse .NotEnoughSpace
	takemoney $0, 1500
	itemtotext ROCK_CANDY, $0
	scall .VendItem
	setevent EVENT_ROCK_CANDY_SOLD_OUT
	random $20
	ifnotequal $0, .Start
	giveitem ROCK_CANDY
	iffalse .Start
	itemtotext ROCK_CANDY, $0
	jump .ExtraItem

.sold_out2
	writetext ObscuraMuseum1FSoldOutText
	waitbutton
	jump .Start

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	farwritetext VendingMachineClangText
	buttonsound
	giveitemnotification
	end

.ExtraItem:
	pause 10
	playsound SFX_ENTER_DOOR
	farwritetext VendingMachineScoreText
	buttonsound
	giveitemnotification
	jump .Start

.NotEnoughMoney:
	farwritetext VendingMachineNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	farwritetext VendingMachineNoSpaceText
	waitbutton
	jump .Start

.MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 13, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 5 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "RAGECANDYBAR ¥400@"
	db "ROCK CANDY  ¥1500@"
	db "CANCEL@"
	
.MenuDataSoldOut:
	db $40 ; flags
	db 02, 00 ; start coords
	db 13, 19 ; end coords
	dw .MenuDataSoldOut2
	db 1 ; default option

.MenuDataSoldOut2:
	db $80 ; flags
	db 5 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "RAGECANDYBAR ¥400@"
	db "SOLD OUT@"
	db "CANCEL@"
	
ObscuraMuseum1FSoldOutText:
	text "You got the"
	line "last one!"
	done
	
ObscuraMuseumArcheopsFossilText:
	text "This will be a"
	line "giant ARCHEOPS"
	cont "fossil."
	done
	
ObscuraMuseumCarracostaFossilText:
	text "This will be a"
	line "giant CARRACOSTA"
	cont "fossil."
	done
	
ObscuraMuseumLockedDoor:
	dw EVENT_SNARE_AT_MUSEUM
	jumptext ObscuraMuseumLockedDoorText
	
ObscuraMuseumLockedDoorText:
	text "It's blocked from"
	line "the other side."
	done
	
ObscuraMuseum1FNPC1:
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseum1FNPC1Text1
.snare
	jumptextfaceplayer ObscuraMuseum1FNPC1Text2
	
ObscuraMuseum1FNPC2:
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	jumptextfaceplayer ObscuraMuseum1FNPC2Text1
.snare
	checkevent EVENT_BEAT_MUSEUM_GRUNT_5
	iftrue .beat
	opentext
	writetext ObscuraMuseum1FNPC2Text2
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_1F_NPC2, UP
	end
.beat
	jumptextfaceplayer ObscuraMuseum1FNPC2Text3

ObscuraMuseum1FNPC1Text1:
	text "TEXT 1"
	done
	
ObscuraMuseum1FNPC1Text2:
	text "Who are these"
	line "people?"
	
	para "What do they want?"
	done
	
ObscuraMuseum1FNPC2Text1:
	text "TEXT 1"
	done
	
ObscuraMuseum1FNPC2Text2:
	text "NO!"
	
	para "I won't give you"
	line "my BAYLEEF!"
	done
	
ObscuraMuseum1FNPC2Text3:
	text "This jerk was"
	line "trying to take my"
	cont "#MON!"
	
	para "That's messed up!"
	done
	
ObscuraMuseum1FBayleef:
	opentext
	writetext ObscuraMuseum1FBayleefText
	cry BAYLEEF
	waitbutton
	closetext
	end
	
ObscuraMuseum1FBayleefText:
	text "BAYLEEF: Bay lee?"
	done

ObscuraMuseum1FRockyScript1:
	special Special_StopRunning
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	spriteface PLAYER, DOWN
	jump ObscuraMuseum1FRockyScript
	
ObscuraMuseum1FRockyScript2:
	special Special_StopRunning
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	spriteface PLAYER, UP
	jump ObscuraMuseum1FRockyScript
	
ObscuraMuseum1FRockyScript3:
	special Special_StopRunning
	applyonemovement PLAYER, step_up
	pause 10
;fallthru
ObscuraMuseum1FRockyScript:
	applyonemovement OBSCURA_MUSEUM_1F_ROCKY, turn_step_left
	opentext
	writetext ObscuraMuseum1FRockyText1
	waitbutton
	closetext
	pause 10
	applyonemovement OBSCURA_MUSEUM_1F_SNARE_NPC, turn_step_right
	opentext
	writetext ObscuraMuseum1FSnareNPCText
	waitbutton
	closetext
	applymovement OBSCURA_MUSEUM_1F_SNARE_NPC, Movement_ObscuraMuseum1FSnareRun
	disappear OBSCURA_MUSEUM_1F_SNARE_NPC
	pause 10
	setlasttalked OBSCURA_MUSEUM_1F_ROCKY
	faceplayer
	opentext
	writetext ObscuraMuseum1FRockyText2
	waitbutton
	closetext
	applymovement OBSCURA_MUSEUM_1F_ROCKY, Movement_ObscuraMuseum1FRocky
	disappear OBSCURA_MUSEUM_1F_ROCKY
	dotrigger $1
	end
	
ObscuraMuseum1FSnareNPCText:
	text "Eeep!<WAIT_M>"
	line "This guy is tough!"
	done
	
ObscuraMuseum1FRockyText1:
	text "???: You guys are"
	line "all talk."
	
	para "You think you can"
	line "just come in here"
	cont "and run amuck?"
	
	para "That's not gonna"
	line "happen!"
	done
	
ObscuraMuseum1FRockyText2:
	text "And who are you?"
	
	para "…<WAIT_L><PLAYER>, huh?"
	
	para "You're here to"
	line "challenge the"
	cont "GYM LEADER?"
	
	para "Well, that's me,"
	line "but I kinda have"
	cont "my hands full at"
	cont "the moment."
	
	para "…"
	
	para "ROCKY?<WAIT_M>"
	line "No, I'm not ROCKY!"
	
	para "Who told you that"
	line "was my name!?"
	
	para "It's ROCKFORD,"
	line "got it!?"
	
	para "Not ROCKY,<WAIT_S>"
	line "ROCKFORD!"
	
	para "…<WAIT_S>sigh…"
	
	para "Well anyway, you"
	line "seem like you can"
	cont "hold your own."
	
	para "If you help me"
	line "take care of these"
	cont "guys, I'll give you"
	cont "your GYM BATTLE."
	
	para "Alright, let's get"
	line "to work."
	done
	
Movement_ObscuraMuseum1FSnareRun:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	run_step_left
	run_step_left
	run_step_left
	step_end
	
Movement_ObscuraMuseum1FRocky:
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
	
ObscuraMuseum1FSnare1:
	generictrainer GRUNTM, MUSEUM_GRUNTM_1, EVENT_BEAT_MUSEUM_GRUNT_1, .SeenText, .BeatenText

	text "Well, you got in."
	
	para "Nothing I can do"
	line "about that now."
	done

.SeenText:
	text "How'd you get in"
	line "here?"
	
	para "We have the front"
	line "door blocked!"
	done

.BeatenText:
	text "How?"
	done
	
ObscuraMuseum1FSnare2:
	generictrainer GRUNTM, MUSEUM_GRUNTM_2, EVENT_BEAT_MUSEUM_GRUNT_2, .SeenText, .BeatenText

	text "I wonder if this"
	line "stone thing is"
	cont "worth a lot of"
	cont "moolah!"
	done

.SeenText:
	text "We're here for"
	line "some kinda stone"
	cont "or something."
	
	para "Not sure what"
	line "that's all about."
	done

.BeatenText:
	text "I don't know"
	line "nothing!"
	done
	
ObscuraMuseum1FSnare3:
	generictrainer GRUNTF, MUSEUM_GRUNTF_1, EVENT_BEAT_MUSEUM_GRUNT_3, .SeenText, .BeatenText

	text "Whatever."
	
	para "We're here for"
	line "something more"
	cont "important, anyway."
	done

.SeenText:
	text "We aren't here to"
	line "steal #MON."
	
	para "But I may as well"
	line "take a few for"
	cont "myself!"
	done

.BeatenText:
	text "Alright, fine!"
	done
	
ObscuraMuseum1FSign:
	text "FLOOR 1"
	done
	
ObscuraMuseum2FSign:
	text "FLOOR 2"
	done
	
ObscuraMuseum3FSign:
	text "FLOOR 3"
	done
	
ObscuraMuseumEmployeeSign:
	text "Employees"
	line "only."
	done
	
ObscuraMuseumFossilText:
	text "Small #MON"
	line "fossils."
	done
	
ObscuraMuseumWoodText:
	text "Pieces of ancient"
	line "petrified wood."
	done
	
ObscuraMuseumArtifactText:
	text "Various artifacts"
	line "of ancient civili-"
	cont "zations."
	done
	
ObscuraMuseumBooks:
	jumptext ObscuraMuseumBooksText
	
ObscuraMuseumBooksText:
	text "It's stuffed full"
	line "of dense journals"
	cont "and textbooks."
	done
	
ObscuraMuseum1FStopYouL:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, OBSCURA_MUSEUM_1F_RECEPTIONIST_1, 15
	opentext
	writetext ObscuraMuseum1FReceptionistTextStop
	waitbutton
	closetext
	checkcode VAR_FACING
	ifequal UP, .normal
.scold
	applyonemovement PLAYER, step_right
	scall ObscuraMuseum1FScold
	end
.normal
	applyonemovement PLAYER, step_right
	scall ObscuraMuseum1FBuyTicket
	end

ObscuraMuseum1FStopYou:
	special Special_StopRunning
	checkcode VAR_FACING
	ifequal UP, .normal
.scold
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, OBSCURA_MUSEUM_1F_RECEPTIONIST_1, 15
	spriteface PLAYER, RIGHT
	scall ObscuraMuseum1FScold
	end
.normal
	spriteface PLAYER, RIGHT
	scall ObscuraMuseum1FBuyTicket
	end
	
ObscuraMuseum1FStopYou2:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface OBSCURA_MUSEUM_1F_RECEPTIONIST_1, UP
	showemote EMOTE_SHOCK, OBSCURA_MUSEUM_1F_RECEPTIONIST_1, 15
	spriteface PLAYER, DOWN
;fallthru
ObscuraMuseum1FScold:
	opentext
	writetext ObscuraMuseum1FReceptionistText3
	buttonsound
	farwritetext StdBlankText
	pause 6
	special PlaceMoneyTopRight
	writetext ObscuraMuseum1FReceptionistText4
	waitbutton
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	opentext
	writetext ObscuraMuseum1FReceptionistText5
	waitbutton
	closetext
	dotrigger $1
	end
	
.nomoney
	writetext ObscuraMuseum1FReceptionistText6
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	special Special_StopRunning
	waitsfx
	warp2 DOWN, OBSCURA_CITY, $10, $0e
	end
	
ObscuraMuseum1FBuyTicket:
	opentext
	special PlaceMoneyTopRight
	writetext ObscuraMuseum1FReceptionistText1
	yesorno
	iffalse .no
	checkmoney $0, 500
	if_equal $2, .nomoney
	playsound SFX_TRANSACTION
	takemoney $0, 500
	special PlaceMoneyTopRight
	pause 15
	refreshscreen $0
	opentext
	writetext ObscuraMuseum1FReceptionistText
	waitbutton
	closetext
	dotrigger $1
	end
.no
	writetext ObscuraMuseum1FReceptionistTextNo
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	end
.nomoney
	writetext ObscuraMuseum1FReceptionistTextNoMoney
	waitbutton
	closetext
	applyonemovement PLAYER, step_down
	end
	
ObscuraMuseum1FReceptionist1:
	faceplayer
	opentext
	checkevent EVENT_SNARE_AT_MUSEUM
	iftrue .snare
	writetext ObscuraMuseum1FReceptionistText
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_1F_RECEPTIONIST_1, LEFT
	end
.snare
	writetext ObscuraMuseum1FReceptionistTextSnare
	waitbutton
	closetext
	spriteface OBSCURA_MUSEUM_1F_RECEPTIONIST_1, LEFT
	end
	
ObscuraMuseum1FReceptionistText:
	text "Enjoy your visit!"
	done
	
ObscuraMuseum1FReceptionistTextNo:
	text "Come again!"
	done
	
ObscuraMuseum1FReceptionistTextNoMoney:
	text "Oh, I'm sorry.<WAIT_S>"
	line "You don't have enough!"
	
	para "Come again!"
	done
	
ObscuraMuseum1FReceptionistTextStop:
	text "Excuse me!"
	done
	
ObscuraMuseum1FReceptionistTextSnare:
	text "Normally I'd scold"
	line "you for sneaking"
	cont "in without paying."
	
	para "However, now's not"
	line "the time!"
	done
	
ObscuraMuseum1FReceptionistText1:
	text "Welcome to the"
	line "OBSCURA CITY"
	cont "MUSEUM OF SCIENCE."
	
	para "It's ¥500 for a"
	line "ticket."
	
	para "Would you like to"
	line "come in?"
	done
	
ObscuraMuseum1FReceptionistText3:
	text "Hey! <WAIT_S>You didn't"
	line "pay the entry fee!"
	
	para "Did you think you"
	line "could sneak in"
	cont "under my nose?"
	done
	
	
ObscuraMuseum1FReceptionistText4:
	text "It's ¥500."
	
	para "Pay up,"
	line "troublemaker."
	done
	
ObscuraMuseum1FReceptionistText5:
	text "Alright, don't try"
	line "sneaking in again,"
	cont "got it?"
	
	para "Enjoy your visit!"
	done
	
ObscuraMuseum1FReceptionistText6:
	text "You can't pay?"
	
	para "Out you go!"
	done
	
