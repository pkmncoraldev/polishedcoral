UnusedPhoneScript: ; 0xbcea5
	end
	
SpamCallPhoneScript:
	specialphonecall SPECIALCALL_NONE
	callasm DecSpamCall
	random $7
	ifequal $0, .one
	ifequal $1, .two
	ifequal $2, .three
	ifequal $3, .four
	ifequal $4, .five
	farwritetext SpamPhoneText6
	callasm ChineseSpamCall
	end
.one
	farwritetext SpamPhoneText1
	end
.two
	farwritetext SpamPhoneText2
	end
.three
	farwritetext SpamPhoneText3
	end
.four
	farwritetext SpamPhoneText4
	end
.five
	farwritetext SpamPhoneText5
	end
	
ChineseSpamCall:
	ld a, [wTextBoxFlags]
	push af
	ld a, 3
	ld [wTextBoxFlags], a
	call LoadChineseFont
	ld de, .ChineseString1
	call PlaceChineseString
	ld de, .ChineseString2
	call PlaceChineseString
	ld de, .ChineseString3
	call PlaceChineseString
	call ClearSpeechBox
	call LoadStandardFont
	farcall _LoadPhoneTile
	pop af
	ld [wTextBoxFlags], a
	ret
	
.ChineseString1:
	db $99, $9a, $97, $9b, $9c, $9d, $9e, $9f, $a0, $a1, $98, $fe
	db $a1, $a2, $a3, $a4, $a5, $a6, $a7, $ff
	
.ChineseString2:
	db $9a, $97, $a8, $a9, $aa, $9c, $9d, $ab, $ac, $ad, $ae, $98, $ff
	
.ChineseString3
	db $af, $b0, $b1, $b2, $97, $b3, $b4, $b5, $b6, $b7, $b8, $b9, $98, $fe
	db $ba, $ac, $ab, $bb, $aa, $bc, $bd, $a0, $be, $bf, $c0, $98, $a4, $a6, $a7, $ff
	
PlaceChineseString:
	hlcoord 1, 13
	ld b, 0
	ld c, SCREEN_WIDTH
.loop
	push af
	call PrintLetterDelay
	pop af
	ld a, [de]
	cp $ff
	jr z, .next_page
	cp $fe
	jr z, .next_line
	cp $99
	jr c, .punct
	ld [hl], a
	add a, $28
.finish_character
	push hl
	add hl, bc	
	ld [hl], a
	pop hl
	inc de
	inc hl
	jr .loop
.punct
	push af
	ld a, " "
	ld [hl], a
	pop af
	jr .finish_character
.next_line
	inc de
	hlcoord 1, 15
	jr .loop
.next_page
	call LoadBlinkingCursor
	call Text_WaitBGMap
	call ButtonSound
	call ClearSpeechBox
	call UnloadBlinkingCursor
	ld c, 12
	call DelayFrames
	ret
	
	ld c, 255
	call DelayFrames
	jp LoadStandardFont

DecSpamCall:
	call Random
	ld a, $3
	call RandomRange
	add 1
	ld [wSpamCallSteps], a
	ld a, $50
	call RandomRange
	ld [wSpamCallSteps+1], a
	ld a, [wSpamCalls]
	cp 0
	ret z
	dec a
	ld [wSpamCalls], a
	ret

WendyPhoneScript:
	checkevent EVENT_MADE_IT_TO_SOUTH_ONWA
	iftrue .south
	farwritetext WendyPhoneText1
	end
.south
	farwritetext WendyVoicemailText
	end

AutoPhoneScript:
	checkcode VAR_SPECIALPHONECALL
	if_equal SPECIALCALL_COMEGETUPGRADEDBIKE, .comegetupgradedbike
	checkitem BICYCLE
	iftrue .normal
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
	if_equal SPECIALCALL_MOMCALLABOUTBANKCARD, .comegetbankcard
	if_equal SPECIALCALL_MOMCOMEGETTRAINERCARD, .comegettrainercard1
	if_equal SPECIALCALL_MOMCALLABOUTTEAMSNARE, .teamsnare
	callasm CallingMomCheckPlayerRoomAsm
	iftrue .upstairs
	checkevent EVENT_MOM_CAN_GET_BANK_CARD
	iftrue .bankcard2
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
	
.bankcard2
	farwritetext MomPhoneComeGetBankCardText2
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
	
.comegetbankcard
	farwritetext MomPhoneComeGetBankCardText
	setevent EVENT_MOM_CALLED_ABOUT_BANK_CARD
	setevent EVENT_MOM_CAN_GET_BANK_CARD
	setevent EVENT_PLAYER_HOUSE_MOM_1
	setevent EVENT_PLAYER_HOUSE_MOM_2
	clearevent EVENT_PLAYER_HOUSE_MOM_3
	specialphonecall SPECIALCALL_NONE
	callasm DecSpamCall
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
	checkevent EVENT_GOT_CYNDAQUIL_FROM_SPRUCE
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