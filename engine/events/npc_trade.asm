NPCTrade:: ; fcba8
	ld a, e
	ld [wJumptableIndex], a
	call Trade_GetDialog
	ld b, CHECK_FLAG
	call TradeFlagAction
	ld a, TRADE_AFTER
	jp nz, .done

	ld a, TRADE_INTRO
	call PrintTradeText

	call YesNoBox
	ld a, TRADE_CANCEL
	jp c, .done

; Select givemon from party
	farcall SelectTradeOrDaycareMon
	ld a, TRADE_CANCEL
	jp c, .done

	ld e, TRADE_GIVEMON
	call GetTradeAttribute
	ld a, [wCurPartySpecies]
	cp [hl]
	ld a, TRADE_WRONG
	jp nz, .done

	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNickTradeMon
	
	ld b, SET_FLAG
	call TradeFlagAction

	ld hl, ConnectLinkCableText
	call PrintText
	
	call DoNPCTrade
	call .TradeAnimation
	call GetTradeMonNames

	ld hl, TradedForText
	call PrintText
	
	ld e, TRADE_DIALOG
	call GetTradeAttribute
	ld a, 0
	cp [hl]
	jr z, .trade1
	ld a, 1
	cp [hl]
	jr z, .trade2
	ld a, 2
	cp [hl]
	jr z, .trade3
	ld a, 3
	cp [hl]
	jr z, .trade4
	ld a, 4
	cp [hl]
	jr z, .trade5
	ld a, 5
	cp [hl]
	jr z, .trade6
	ld a, 6
	cp [hl]
	jr z, .trade7
	ld a, 7
	cp [hl]
	jr z, .trade8
	ld a, 8
	cp [hl]
	jr z, .trade9
	ld a, 9
	cp [hl]
	jr z, .trade10
	jr .cont
.trade1
	ld hl, wBackupName
	ld de, wTradeScytherName
	ld bc, NAME_LENGTH
	rst CopyBytes
	jr .cont
.trade2
	ld hl, wBackupName
	ld de, wTradeGloomName
	ld bc, NAME_LENGTH
	rst CopyBytes
	jr .cont
.trade3
	ld hl, wBackupName
	ld de, wTradeSneaselName
	ld bc, NAME_LENGTH
	rst CopyBytes
	jr .cont
.trade4
	ld hl, wBackupName
	ld de, wTradeCroagunkName
	ld bc, NAME_LENGTH
	rst CopyBytes
	jr .cont
.trade5
	ld hl, wBackupName
	ld de, wTradeMeowthName
	ld bc, NAME_LENGTH
	rst CopyBytes
	jr .cont
.trade6
	ld hl, wBackupName
	ld de, wTradeCacneaName
	ld bc, NAME_LENGTH
	rst CopyBytes
	jr .cont
.trade7
.trade8
.trade9
.trade10
.cont
	call RestartMapMusic

	ld a, TRADE_COMPLETE

.done
	jp PrintTradeText
; fcc07

.TradeAnimation: ; fcc07
	call DisableSpriteUpdates
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	predef TradeAnimation
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	jp ReturnToMapWithSpeechTextbox
; fcc23

TradeFlagAction: ; fcc4a
	ld hl, wTradeFlags
	ld a, [wJumptableIndex]
	ld c, a
	predef FlagPredef
	ld a, c
	and a
	ret
; fcc59

Trade_GetDialog: ; fcc59
	ld e, TRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	ld [wcf64], a
	ret
; fcc63

DoNPCTrade: ; fcc63
	ld e, TRADE_GIVEMON
	call GetTradeAttribute
	ld a, [hl]
	ld [wPlayerTrademonSpecies], a

	ld e, TRADE_GETMON
	call GetTradeAttribute
	ld a, [hl]
	ld [wOTTrademonSpecies], a

	ld a, [wPlayerTrademonSpecies]
	ld de, wPlayerTrademonSpeciesName
	call GetTradeMonName
	call CopyTradeName

	ld a, [wOTTrademonSpecies]
	ld de, wOTTrademonSpeciesName
	call GetTradeMonName
	call CopyTradeName

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonOTName
	call CopyTradeName

	ld hl, wPlayerName
	ld de, wPlayerTrademonSenderName
	call CopyTradeName

	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonID
	call Trade_CopyTwoBytes

	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonDVs
	call Trade_CopyThreeBytes

	ld hl, wPartyMon1Personality
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld de, wPlayerTrademonPersonality
	call Trade_CopyTwoBytes

	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld b, h
	ld c, l
	farcall GetCaughtGender
	ld a, c
	ld [wPlayerTrademonCaughtData], a

	xor a
	ld [wOTTrademonCaughtData], a

	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfCurrentPartymon
	ld a, [hl]
	ld [wCurPartyLevel], a
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	xor a
	ld [wMonType], a
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	predef TryAddMonToParty

	ld e, TRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	cp 3
	ld b, MALE
	jr c, .male2
	ld b, FEMALE
.male2
	ld e, TRADE_BALL
	call GetTradeAttribute
	ld a, [hl]
	ld c, a
	farcall SetGiftPartyMonCaughtData

	ld e, TRADE_NICK
	call GetTradeAttribute
	ld de, wOTTrademonNickname
	call CopyTradeName

	ld hl, wPartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonNickname
	call CopyTradeName

	ld e, TRADE_OT_NAME
	call GetTradeAttribute
	push hl
	ld de, wOTTrademonOTName
	call CopyTradeName
	pop hl
	ld de, wOTTrademonSenderName
	call CopyTradeName

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonOTName
	call CopyTradeName

	ld e, TRADE_DVS
	call GetTradeAttribute
	ld de, wOTTrademonDVs
	call Trade_CopyThreeBytes

	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonDVs
	call Trade_CopyThreeBytes

	ld e, TRADE_PERSONALITY
	call GetTradeAttribute
	ld de, wOTTrademonPersonality
	call Trade_CopyTwoBytes

	ld hl, wPartyMon1Personality
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonPersonality
	call Trade_CopyTwoBytes

	ld e, TRADE_OT_ID
	call GetTradeAttribute
	ld de, wOTTrademonID + 1
	call Trade_CopyTwoBytesReverseEndian

	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	ld hl, wOTTrademonID
	call Trade_CopyTwoBytes

	ld e, TRADE_ITEM
	call GetTradeAttribute
	push hl
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call Trade_GetAttributeOfLastPartymon
	pop hl
	ld a, [hl]
	ld [de], a

	push af
	push bc
	push de
	push hl
	ld a, [wCurPartyMon]
	push af
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	farcall ComputeNPCTrademonStats
	pop af
	ld [wCurPartyMon], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; fcdc2


GetTradeAttribute: ; 0xfcdc2
	ld d, 0
	push de
	ld a, [wJumptableIndex]
	and $f
	swap a
	ld e, a
	ld d, 0
	ld hl, NPCTrades
	add hl, de
	add hl, de
	pop de
	add hl, de
	ret
; 0xfcdd7

Trade_GetAttributeOfCurrentPartymon: ; fcdd7
	ld a, [wCurPartyMon]
	rst AddNTimes
	ret
; fcdde

Trade_GetAttributeOfLastPartymon: ; fcdde
	ld a, [wPartyCount]
	dec a
	rst AddNTimes
	ld e, l
	ld d, h
	ret
; fcde8

GetTradeMonName: ; fcde8
	push de
	ld [wd265], a
	call GetBasePokemonName
	ld hl, wStringBuffer1
	pop de
	ret
; fcdf4

CopyTradeName: ; fcdf4
	ld bc, NAME_LENGTH
	rst CopyBytes
	ret
; fcdfb

Trade_CopyTwoBytes: ; fce0f
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; fce15

Trade_CopyTwoBytesReverseEndian: ; fce15
	ld a, [hli]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	ret
; fce1b

Trade_CopyThreeBytes:
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

GetTradeMonNames: ; fce1b
	ld e, TRADE_GETMON
	call GetTradeAttribute
	ld a, [hl]
	call GetTradeMonName

	ld de, wStringBuffer2
	call CopyTradeName

	ld e, TRADE_GIVEMON
	call GetTradeAttribute
	ld a, [hl]
	call GetTradeMonName

	ld de, wMonOrItemNameBuffer
	call CopyTradeName

	ld hl, wStringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr nz, .loop

	ld [hl], "@"
	ret
; fce58


INCLUDE "data/events/npc_trades.asm"


PrintTradeText: ; fcf38
	push af
	call GetTradeMonNames
	pop af
	ld bc, 2 * 10
	ld hl, TradeTexts
	rst AddNTimes
	ld a, [wcf64]
	ld c, a
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText
; fcf53

TradeTexts: ; fcf53
; intro
	dw TradeIntroText1
	dw TradeIntroText2
	dw TradeIntroText3
	dw TradeIntroText4
	dw TradeIntroText5
	dw TradeIntroText6
	dw TradeIntroText1
	dw TradeIntroText1
	dw TradeIntroText1
	dw TradeIntroText1

; cancel
	dw TradeCancelText1
	dw TradeCancelText2
	dw TradeCancelText3
	dw TradeCancelText4
	dw TradeCancelText5
	dw TradeCancelText6
	dw TradeCancelText1
	dw TradeCancelText1
	dw TradeCancelText1
	dw TradeCancelText1

; wrong mon
	dw TradeWrongText1
	dw TradeWrongText2
	dw TradeWrongText3
	dw TradeWrongText4
	dw TradeWrongText5
	dw TradeWrongText6
	dw TradeWrongText1
	dw TradeWrongText1
	dw TradeWrongText1
	dw TradeWrongText1

; completed
	dw TradeCompleteText1
	dw TradeCompleteText2
	dw TradeCompleteText3
	dw TradeCompleteText4
	dw TradeCompleteText5
	dw TradeCompleteText6
	dw TradeCompleteText1
	dw TradeCompleteText1
	dw TradeCompleteText1
	dw TradeCompleteText1

; after
	dw TradeAfterText1
	dw TradeAfterText2
	dw TradeAfterText3
	dw TradeAfterText4
	dw TradeAfterText5
	dw TradeAfterText6
	dw TradeAfterText1
	dw TradeAfterText1
	dw TradeAfterText1
	dw TradeAfterText1
; fcf7b


ConnectLinkCableText: ; 0xfcf7b
	; OK, connect the Game Link Cable.
	text_jump UnknownText_0x1bd407
	db "@"
; 0xfcf80


TradedForText: ; 0xfcf80
	; traded givemon for getmon
	text_jump UnknownText_0x1bd429
	start_asm
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld hl, .done
	ret

.done
	; sound_dex_fanfare_80_109
	; interpret_data
	text_jump UnknownText_0x1bd445
	db "@"
; 0xfcf97


TradeIntroText1:
	text_jump UnknownText_TradeIntroText1
	db "@"

TradeCancelText1:
	text_jump UnknownText_TradeCancelText1
	db "@"

TradeWrongText1:
	text_jump UnknownText_TradeWrongText1
	db "@"

TradeCompleteText1:
	text_jump UnknownText_TradeCompleteText1
	db "@"

TradeAfterText1:
	text_jump UnknownText_TradeAfterText1
	db "@"
	
TradeIntroText2:
	text_jump UnknownText_TradeIntroText2
	db "@"

TradeCancelText2:
	text_jump UnknownText_TradeCancelText2
	db "@"

TradeWrongText2:
	text_jump UnknownText_TradeWrongText2
	db "@"

TradeCompleteText2:
	text_jump UnknownText_TradeCompleteText2
	db "@"

TradeAfterText2:
	text_jump UnknownText_TradeAfterText2
	db "@"

TradeIntroText3:
	text_jump UnknownText_TradeIntroText3
	db "@"

TradeCancelText3:
	text_jump UnknownText_TradeCancelText3
	db "@"

TradeWrongText3:
	text_jump UnknownText_TradeWrongText3
	db "@"

TradeCompleteText3:
	text_jump UnknownText_TradeCompleteText3
	db "@"

TradeAfterText3:
	text_jump UnknownText_TradeAfterText3
	db "@"
	
TradeIntroText4:
	text_jump UnknownText_TradeIntroText4
	db "@"

TradeCancelText4:
	text_jump UnknownText_TradeCancelText4
	db "@"

TradeWrongText4:
	text_jump UnknownText_TradeWrongText4
	db "@"

TradeCompleteText4:
	text_jump UnknownText_TradeCompleteText4
	db "@"

TradeAfterText4:
	text_jump UnknownText_TradeAfterText4
	db "@"
	
TradeIntroText5:
	text_jump UnknownText_TradeIntroText5
	db "@"

TradeCancelText5:
	text_jump UnknownText_TradeCancelText5
	db "@"

TradeWrongText5:
	text_jump UnknownText_TradeWrongText5
	db "@"

TradeCompleteText5:
	text_jump UnknownText_TradeCompleteText5
	db "@"

TradeAfterText5:
	text_jump UnknownText_TradeAfterText5
	db "@"
	
TradeIntroText6:
	text_jump UnknownText_TradeIntroText6
	db "@"

TradeCancelText6:
	text_jump UnknownText_TradeCancelText6
	db "@"

TradeWrongText6:
	text_jump UnknownText_TradeWrongText6
	db "@"

TradeCompleteText6:
	text_jump UnknownText_TradeCompleteText6
	db "@"

TradeAfterText6:
	text_jump UnknownText_TradeAfterText6
	db "@"
