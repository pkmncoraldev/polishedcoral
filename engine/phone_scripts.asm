UnusedPhoneScript: ; 0xbcea5
	farwritetext UnusedPhoneText
	end

; Mom

MomPhoneScript: ; 0xbceaa
	checkevent EVENT_TALKED_TO_MOM
	iffalse .beginning
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iffalse .gogetmon
	checkcode VAR_SPECIALPHONECALL
	if_equal SPECIALCALL_MOMCOMEGETTRAINERCARD, .comegettrainercard1
	checkevent EVENT_CAN_CALL_TRAINER_CARD
	iftrue .comegettrainercard2
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	iftrue .callaboutisland2

	checkevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	iftrue .callaboutisland1

.normal
	farwritetext MomPhoneNormalText
	end

.beginning
	farwritetext MomPhoneBeginningText
	end

.gogetmon
	farwritetext SunsetMomText2
	end

.callaboutisland1
	farwritetext MomPhoneGoToIsland1Text
	setevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	setevent EVENT_LAKEHOUSE_SOFTLOCK_PREVENTION
	end

.callaboutisland2
	farwritetext MomPhoneGoToIsland2Text
	end
	
.comegettrainercard1
	farwritetext MomPhoneComeGetTrainerCard1Text
	setevent EVENT_CAN_CALL_TRAINER_CARD
	specialphonecall SPECIALCALL_NONE
	domaptrigger ROUTE_1_GATE, $0
	end
	
.comegettrainercard2
	farwritetext MomPhoneComeGetTrainerCard2Text
	end
	
; Bill

BillPhoneScript1: ; 0xbcfc5
	checktime 1 << DAY
	iftrue .daygreet
	checktime 1 << NITE
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	buttonsound
	jump .main

.daygreet ; 0xbcfd7
	farwritetext BillPhoneDayGreetingText
	buttonsound
	jump .main

.nitegreet ; 0xbcfdf
	farwritetext BillPhoneNiteGreetingText
	buttonsound
	jump .main

.main ; 0xbcfe7
	farwritetext BillPhoneGenericText
	buttonsound
	checkcode VAR_BOXSPACE
	RAM2MEM $0
	ifequal $0, .full
	ifless $6, .nearlyfull
	farwritetext BillPhoneNotFullText
	end

.nearlyfull ; 0xbcffd
	farwritetext BillPhoneNearlyFullText
	end

.full ; 0xbd002
	farwritetext BillPhoneFullText
	jump BillPhoneScriptCheckForBoxes

BillPhoneScript2: ; 0xbd007
	ret
;	checkcode VAR_SPECIALPHONECALL
;	ifequal SPECIALCALL_SECONDBADGE, BillPhoneScriptSecondBadge
;	farwritetext BillPhoneNewlyFullText
BillPhoneScriptCheckForBoxes:
	ret
;	special BillBoxSwitchCheck
;	ifequal 0, BillPhoneWholePCFull
;	farwritetext BillWantNextBox
;	farwritetext UnknownText_0x1c462a
;	yesorno
;	iffalse .refused
;	special BillBoxSwitch
;	jump .hang_up

.refused
	farwritetext BillCallMeToSwitch
.hang_up
	farwritetext BillThankYouText
	end

BillPhoneScriptSecondBadge:
	farwritetext BillPhoneSecondBadgeText
	specialphonecall SPECIALCALL_NONE
	end

BillPhoneWholePCFull:
	farwritetext BillWholePCFullText
	waitbutton
	end

; Spruce

SprucePhoneScript: ; 0xbd081
	checkcode VAR_SPECIALPHONECALL
	if_equal SPECIALCALL_COMETOISLAND, .cometoisland
	if_equal SPECIALCALL_POKERUS, .pokerus
	
	checkevent EVENT_SPRUCELAB_SPRUCE3_GONE ;done pokeflute cutscene
	iftrue .normal
	
	checkevent EVENT_FIRST_TRIP_TO_ISLAND
	iftrue .onisland
	
	checkevent EVENT_CALLED_SPRUCE_CANT_GET_ON_ISLAND
	iftrue .cometoisland4
	
	checkevent EVENT_CAN_CALL_SPRUCE_ABOUT_ISLAND
	iftrue .cometoisland3
	
	checkevent EVENT_SPRUCE_CALLED_COME_TO_ISLAND
	iftrue .cometoisland2

.normal
	farwritetext SprucePhoneNormalText
	special ProfOaksPCBoot
	farwritetext SprucePhoneNormalText2
	end
.cometoisland
	farwritetext SprucePhoneComeToIslandText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_SPRUCE_CALLED_COME_TO_ISLAND
	addcellnum PHONE_SPRUCE
	end
.cometoisland2
	farwritetext SprucePhoneComeToIsland2Text
	end
.cometoisland3
	farwritetext SprucePhoneComeToIsland3Text
	setevent EVENT_CALLED_SPRUCE_CANT_GET_ON_ISLAND
	end
.cometoisland4
	farwritetext SprucePhoneComeToIsland4Text
	end
.onisland
	farwritetext SprucePhoneOnIslandText
	end
	
.pokerus
	end

PhoneScript_Random2:
	random 2
	end

PhoneScript_Random3:
	random 3
	end

PhoneScript_Random4:
	random 4
	end

PhoneScript_Random5:
	random 5
	end

PhoneScript_Random11:
	random 11
	end