UnusedPhoneScript: ; 0xbcea5
	farwritetext UnusedPhoneText
	end

WendyPhoneScript:
	checkevent EVENT_MADE_IT_TO_SOUTH_ONWA
	iftrue .south
	farwritetext WendyPhoneText1
	end
.south
	farwritetext WendyVoicemailText
	end

AutoPhoneScript:
	checkitem BICYCLE
	iftrue .normal
	checkcode VAR_SPECIALPHONECALL
	if_equal SPECIALCALL_COMEGETUPGRADEDBIKE, .comegetupgradedbike
	checkevent EVENT_CAN_PICK_UP_BIKE
	iffalse .cantgetbikeyet
	farwritetext AutoPhoneComeGetBikeText2
	end
.cantgetbikeyet
	farwritetext AutoPhoneNotReadyText
	end
.normal
	farwritetext AutoPhoneNormalText
	end
.comegetupgradedbike
	farwritetext AutoPhoneComeGetBikeText
	setevent EVENT_CAN_PICK_UP_BIKE
	specialphonecall SPECIALCALL_NONE
	end
; Mom

CallingMomCheckPlayerRoomAsm:
	xor a
	ld [wScriptVar], a
	ld a, [wMapGroup]
	cp GROUP_PLAYER_HOUSE_2F
	ret nz
	ld a, [wMapNumber]
	cp MAP_PLAYER_HOUSE_2F
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

MomPhoneScript: ; 0xbceaa
	checkcode VAR_SPECIALPHONECALL
	if_equal SPECIALCALL_MOMCOMEGETTRAINERCARD, .comegettrainercard1
	if_equal SPECIALCALL_MOMCALLABOUTTEAMSNARE, .teamsnare
	callasm CallingMomCheckPlayerRoomAsm
	iftrue .upstairs
	checkevent EVENT_GOT_A_POKEMON_FROM_SPRUCE
	iffalse .gogetmon
	checkevent EVENT_CAN_CALL_TRAINER_CARD
	iftrue .comegettrainercard2
	checkevent EVENT_CALLED_MOM_CANT_GET_ON_ISLAND
	iftrue .callaboutisland2

	checkevent EVENT_CAN_CALL_MOM_ABOUT_ISLAND
	iftrue .callaboutisland1

.normal
	farwritetext MomPhoneNormalText
	end

.upstairs
	farwritetext MomPhoneBeginningText
	end

.gogetmon
	farwritetext SunsetMomText2
	end
	
.teamsnare
	farwritetext MomTeamSnareText
	setevent EVENT_MOM_CALLED_ABOUT_TEAM_SNARE
	specialphonecall SPECIALCALL_NONE
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
	if_equal SPECIALCALL_GAVEANCIENTBALL, .ancientball
	if_equal SPECIALCALL_SPRUCECALLABOUTBIRD, .bird
	if_equal SPECIALCALL_COMETOISLAND, .cometoisland
	if_equal SPECIALCALL_POKERUS, .pokerus
	
	checkevent EVENT_SPRUCE_BUSY_SIGNAL
	iftrue .busy
	
	checkevent EVENT_SPRUCE_CAN_RECALL_ABOUT_ANCIENTBALL
	iftrue .ancientball
	
	checkevent EVENT_GOT_POKEFLUTE
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
.busy
	farwritetext SpruceVoicemailText
	end
.ancientball
	clearevent EVENT_SPRUCE_BUSY_SIGNAL
	setevent EVENT_SPRUCE_CAN_GET_MASTER_BALL
	setevent EVENT_SPRUCE_CAN_RECALL_ABOUT_ANCIENTBALL
	specialphonecall SPECIALCALL_NONE
	farwritetext SprucePhoneAncientBallText
	end
.bird
	setevent EVENT_FIRST_BIRD_ACTIVE
	setevent EVENT_SPRUCE_CALLED_ABOUT_BIRD
	specialphonecall SPECIALCALL_NONE
	checkevent EVENT_GOT_BULBASAUR_FROM_SPRUCE
	iftrue .articuno
	checkevent EVENT_GOT_CHIKORITA_FROM_SPRUCE
	iftrue .articuno
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .zapdos
	checkevent EVENT_GOT_CHARMANDER_FROM_SPRUCE
	iftrue .zapdos
;.moltres
	farwritetext SprucePhoneMoltresText
	setevent EVENT_MOLTRES_ACTIVE
	special InitRoamMoltres
	end
.zapdos
	farwritetext SprucePhoneZapdosText
	setevent EVENT_ZAPDOS_ACTIVE
	special InitRoamZapdos
	end
.articuno
	farwritetext SprucePhoneArticunoText
	setevent EVENT_ARTICUNO_ACTIVE
	special InitRoamArticuno
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