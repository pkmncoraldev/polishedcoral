ObscuraMuseum1F_MapScriptHeader:
	db 3 ; scene scripts
	scene_script ObscuraMuseum1FTrigger0
	scene_script ObscuraMuseum1FTrigger1
	scene_script ObscuraMuseum1FTrigger2

	db 0 ; callbacks

	db 5 ; warp events
	warp_def 13,  8, 1, OBSCURA_CITY
	warp_def 13,  9, 2, OBSCURA_CITY
	warp_def  9, 24, 3, OBSCURA_CITY
	warp_def 10, 24, 4, OBSCURA_CITY
	warp_def  0,  4, 1, OBSCURA_MUSEUM_2F

	db 3 ; coord events
	coord_event  8, 12, 0, ObscuraMuseum1FStopYouL
	coord_event  9, 12, 0, ObscuraMuseum1FStopYou
	coord_event 11, 10, 0, ObscuraMuseum1FStopYou2

	db 0 ; bg events

	db 1 ; object events
	person_event SPRITE_RECEPTIONIST, 12, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraMuseum1FReceptionist1, -1
	
	
	const_def 1 ; object constants
	const OBSCURA_MUSEUM_1F_RECEPTIONIST_1
	
ObscuraMuseum1FTrigger0:
ObscuraMuseum1FTrigger1:
ObscuraMuseum1FTrigger2:
	end
	
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
	
