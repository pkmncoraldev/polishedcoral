UnusedPhoneScript: ; 0xbcea5
	farwritetext UnusedPhoneText
	end

; Mom

MomPhoneScript: ; 0xbceaa
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

; Elm

SprucePhoneScript1: ; 0xbd00d
	end

SprucePhoneScript2: ; 0xbd081
	checkcode VAR_SPECIALPHONECALL
	if_equal SPECIALCALL_COMETOISLAND, .cometoisland
	checkevent EVENT_GOT_POKEFLUTE
	iffalse .cometoisland2
	farwritetext SprucePhoneNormalText
	special ProfOaksPCBoot
	farwritetext SprucePhoneNormalText2
	waitbutton
	end
.cometoisland
	farwritetext SprucePhoneComeToIslandText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_SPRUCE_CALLED_COME_TO_ISLAND
	addcellnum PHONE_SPRUCE
	end
.cometoisland2
	checkevent EVENT_CAN_GET_PASS_FROM_MOM
	iftrue .cometoisland3
	farwritetext SprucePhoneComeToIsland2Text
	waitbutton
	end
.cometoisland3
	checkevent EVENT_CALLED_SPRUCE_CANT_GET_ON_ISLAND
	iftrue .cometoisland4
	farwritetext SprucePhoneComeToIsland3Text
	waitbutton
	end
.cometoisland4
	farwritetext SprucePhoneComeToIsland4Text
	waitbutton
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