SelectMonFromParty: ; 50000
	call DisableSpriteUpdates
	xor a
	ld [wPartyMenuActionText], a
	call ClearBGPalettes
	call InitPartyMenuLayout
	call ApplyTilemapInVBlank
	call SetPalettes
	call DelayFrame
	call PartyMenuSelect
	jp ReturnToMapWithSpeechTextbox

SelectTradeOrDaycareMon::
	xor a
	jp SelectMonFinish

SelectEncounterHouseMon::
	ld a, 6
	jp SelectMonFinish
	
SelectFishMarketSellMon::
	ld a, 10
SelectMonFinish::
	ld [wPartyMenuActionText], a
	call DisableSpriteUpdates
	call ClearBGPalettes
	call InitPartyMenuLayout
	call ApplyTilemapInVBlank
	ld b, CGB_PARTY_MENU
	call GetCGBLayout
	call SetPalettes
	call DelayFrame
	call PartyMenuSelect
	jp ReturnToMapWithSpeechTextbox

InitPartyMenuLayout: ; 5003f
	call LoadPartyMenuGFX
	call InitPartyMenuWithCancel
	call InitPartyMenuGFX
	call WritePartyMenuTilemap
	jp PrintPartyMenuText
; 5004f

LoadPartyMenuGFX: ; 5004f
	call LoadFontsBattleExtra
	farcall InitPartyMenuPalettes ; engine/color.asm
	farjp ClearSpriteAnims2
; 5005f


WritePartyMenuTilemap: ; 0x5005f
	call Load1bppFont
	call Load1bppFrame
	ld hl, wOptions1
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl] ; Disable text delay
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill ; blank the tilemap
	call GetPartyMenuTilemapPointers ; This reads from a pointer table???
.loop
	ld a, [hli]
	cp $ff
	jr z, .end ; 0x5007a $8
	push hl
	ld hl, .Jumptable
	rst JumpTable
	pop hl
	jr .loop ; 0x50082 $f3
.end
	pop af
	ld [wOptions1], a
	ret
; 0x50089

.Jumptable: ; 50089
	dw PlacePartyNicknames
	dw PlacePartyHPBar
	dw PlacePartyMenuHPDigits
	dw PlacePartyMonLevel
	dw PlacePartyMonStatus
	dw PlacePartyMonTMHMCompatibility
	dw PlacePartyMonEvoStoneCompatibility
	dw PlacePartyMonGender
	dw PlacePartyMonRemindable
; 5009b

PlacePartyNicknames: ; 5009b
	hlcoord 3, 1
	ld a, [wPartyCount]
	and a
	jr z, .end
	ld c, a
	ld b, $0
.loop
	push bc
	push hl
	push hl
	ld hl, wPartyMonNicknames
	ld a, b
	call GetNick
	pop hl
	call PlaceString
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop

.end
	dec hl
	dec hl
	ld de, .CANCEL
	jp PlaceString
; 500c8

.CANCEL: ; 500c8
	db "CANCEL@"
; 500cf


PlacePartyHPBar: ; 500cf
	xor a
	ld [wHPPalIndex], a
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, $0
	hlcoord 11, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .skip
	push hl
	call PlacePartymonHPBar
	pop hl
	ld d, $6
	farcall DrawBattleHPBar
	ld hl, wHPPals
	ld a, [wHPPalIndex]
	ld c, a
	ld b, $0
	add hl, bc
	call SetHPPal
	ld b, CGB_PARTY_MENU_HP_PALS
	call GetCGBLayout
.skip
	ld hl, wHPPalIndex
	inc [hl]
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret
; 50117

PlacePartymonHPBar: ; 50117
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
	rst AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted
	xor a
	ld e, a
	ld c, a
	ret

.not_fainted
	dec hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	predef ComputeHPBarPixels
	ret
; 50138

PlacePartyMenuHPDigits: ; 50138
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, $0
	hlcoord 13, 1
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1HP
	rst AddNTimes
	ld e, l
	ld d, h
	pop hl
	push de
	lb bc, 2, 3
	call PrintNum
	pop de
	ld a, "/"
	ld [hli], a
	inc de
	inc de
	lb bc, 2, 3
	call PrintNum

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret
; 50176

PlacePartyMonLevel: ; 50176
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 7, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Level
	rst AddNTimes
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	cp 100 ; This is distinct from MAX_LEVEL.
	jr nc, .ThreeDigits
	ld a, "<LV>"
	ld [hli], a
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	; jr .okay
.ThreeDigits:
	lb bc, PRINTNUM_LEFTALIGN | 1, 3
; .okay
	call PrintNum

.next
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret
; 501b2

PlacePartyMonStatus: ; 501b2
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 4, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld a, b
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Status
	rst AddNTimes
	ld e, l
	ld d, h
	pop hl
	call PlaceStatusString

.next
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret
; 501e0

PlacePartyMonTMHMCompatibility: ; 501e0
	ld a, 0
	ld [wCurPartyMon], a
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld hl, wPartySpecies
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Form
	call GetPartyLocation
	ld a, [hl]
	and FORM_MASK
	ld [wCurForm], a
	predef CanLearnTMHMMove
	pop hl
	call .PlaceAbleNotAble
	call PlaceString

.next
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret
; 50215

.PlaceAbleNotAble: ; 50215
	ld a, c
	and a
	jr nz, .able
	ld de, .string_not_able
	ret

.able
	ld de, .string_able
	ret
; 50221

.string_able ; 50221
	db "ABLE@"
; 50226

.string_not_able ; 50226
	db "NOT ABLE@"
; 5022f

PlacePartyMonEvoStoneCompatibility:
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	
	; d = party index
	ld d, b
	ld a, b
	ld [wTempMon], a
	; e = species
	ld a, d
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld e, [hl]
	; b = form
	ld a, d
	ld hl, wPartyMon1Form
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
	
	and FORM_MASK
	ld b, a
	; c = species
	ld c, e
	; bc = index
	call GetSpeciesAndFormIndex
	dec bc
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc

	call .DetermineCompatibility
	pop hl
	call PlaceString

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret

.GetGenderAndWriteInC
	push bc
	push hl
	ld b, a
	ld hl, wCurPartyMon
	ld a, [hl]
	push af
	ld [hl], b
	xor a
	ld [wMonType], a
	predef GetGender
	ld c, a
	pop af
	ld [wCurPartyMon], a
	ld a, c
	pop hl
	pop bc
	ld c, a
	ret

.DetermineCompatibility
	push bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarHalfword
	ld de, wStringBuffer1
	ld bc, 9
	ld a, BANK(EvosAttacks)
	call FarCopyBytes
	xor a
	ld [de], a
	ld hl, wStringBuffer1
	pop bc
.loop2
	ld a, [hli]
	and a
	jr z, .nope
	inc hl
	inc hl
	cp EVOLVE_STAT
	jr z, .nope ; reasons
	cp EVOLVE_ITEM
	jr z, .checkItem
	cp EVOLVE_ITEM_MALE
	jr z, .checkItemMale
	cp EVOLVE_ITEM_FEMALE
	jr z, .checkItemFemale
	cp EVOLVE_TRADE
	jr nz, .loop2
; trade

	ld a, [wCurItem]
	cp LINK_CABLE
	jr nz, .loop2
	push hl
	push bc
	ld a, [wTempMon]
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	rst AddNTimes
	ld a, [hl]
;	cp EVERSTONE
	pop bc
	pop hl

	jr .checkHeldItem
.checkItemMale
	ld a, c
	dec a
	jr .goBackToLoop2IfNonZero
.checkItemFemale
	ld a, c
	and a
.goBackToLoop2IfNonZero
	jr nz, .loop2
.checkItem
	ld a, [wCurItem]
.checkHeldItem
	dec hl
	dec hl
	cp [hl]
	jr z, .able
	ld a, [hli]
	inc hl
	inc a
	jr nz, .loop2
.able
	ld de, .string_able
	ret
.nope
	ld de, .string_not_able
	ret
; 502a3

.string_able ; 502a3
	db "ABLE@"
; 502a8
.string_not_able ; 502a8
	db "NOT ABLE@"
; 502b1


PlacePartyMonGender: ; 502b1
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 10, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	ld [wCurPartySpecies], a
	ld a, [wCurPartyMon]
	push af
	ld a, b
	ld [wCurPartyMon], a
	push hl
	xor a
	ld [wMonType], a
	call GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "<MALE>"
	jr nz, .got_gender
	ld a, "<FEMALE>"

.got_gender
	pop hl
	ld [hli], a
	pop af
	ld [wCurPartyMon], a

.next
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop

	ld a, [wPartyMenuCursor]
	dec a
	ld [wCurPartyMon], a
	ld b, CGB_PARTY_MENU
	jp GetCGBLayout
; 502ee


PlacePartyMonRemindable: ; 501e0
	ld a, [wPartyCount]
	and a
	ret z
	ld c, a
	ld b, 0
	hlcoord 12, 2
.loop
	push bc
	push hl
	call PartyMenuCheckEgg
	jr z, .next
	push hl
	ld hl, wPartySpecies
	ld e, b
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wCurPartySpecies], a
	farcall GetForgottenMoves
	pop hl
	call .PlaceAbleNotAble
	call PlaceString

.next
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	pop bc
	inc b
	dec c
	jr nz, .loop
	ret
; 50215

.PlaceAbleNotAble: ; 50215
	ld a, c
	and a
	jr nz, .able
	ld de, .string_not_able
	ret

.able
	ld de, .string_able
	ret
; 50221

.string_able ; 50221
	db "ABLE@"
; 50226

.string_not_able ; 50226
	db "NOT ABLE@"
; 5022f


PartyMenuCheckEgg: ; 50389
	ld a, wPartySpecies % $100
	add b
	ld e, a
	ld a, wPartySpecies / $100
	adc 0
	ld d, a
	ld a, [de]
	cp EGG
	ret
; 50396

GetPartyMenuTilemapPointers: ; 50396
	ld a, [wPartyMenuActionText]
	and $f0
	jr nz, .skip
	ld a, [wPartyMenuActionText]
	and $f
	ld e, a
	ld d, 0
	ld hl, PartyMenuQualityPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.skip
	ld hl, PartyMenuQualityPointers.Default
	ret
; 503b2

INCLUDE "data/party_menu_qualities.asm"


InitPartyMenuGFX: ; 503e0
	ld hl, wPartyCount
	ld a, [hli]
	and a
	ret z
	ld c, a
	xor a
	ldh [hObjectStructIndexBuffer], a
.loop
	push bc
	push hl
	farcall LoadPartyMenuMonIcon
	ldh a, [hObjectStructIndexBuffer]
	inc a
	ldh [hObjectStructIndexBuffer], a
	pop hl
	pop bc
	dec c
	jr nz, .loop
	farjp PlaySpriteAnimations
; 50405

InitPartyMenuWithCancel: ; 50405
; with cancel
	xor a
	ld [wSwitchMon], a
	ld de, PartyMenuAttributes
	call SetMenuAttributes
	ld a, [wPartyCount]
	inc a
	ld [w2DMenuNumRows], a ; list length
	dec a
	ld b, a
	ld a, [wPartyMenuCursor]
	and a
	jr z, .skip
	inc b
	cp b
	jr c, .done

.skip
	ld a, 1

.done
	ld [wMenuCursorY], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ret
; 5042d

InitPartyMenuNoCancel: ; 0x5042d
; no cancel
	ld de, PartyMenuAttributes
	call SetMenuAttributes
	ld a, [wPartyCount]
	ld [w2DMenuNumRows], a ; list length
	ld b, a
	ld a, [wPartyMenuCursor]
	and a
	jr z, .skip
	inc b
	cp b
	jr c, .done
.skip
	ld a, 1
.done
	ld [wMenuCursorY], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuJoypadFilter], a
	ret
; 5044f (14:444f)

PartyMenuAttributes: ; 5044f
; cursor y
; cursor x
; num rows
; num cols
; bit 6: animate sprites  bit 5: wrap around
; ?
; distance between items (hi: y, lo: x)
; allowed buttons (mask)
	db 1, 0
	db 0, 1
	db $60, $00
	dn 2, 0
	db 0
; 50457

PartyMenuSelect: ; 0x50457
; sets carry if exitted menu.
	call DoMenuJoypadLoop
	call PlaceHollowCursor
	ld a, [wPartyCount]
	inc a
	ld b, a
	ld a, [wMenuCursorY] ; menu selection?
	cp b
	jr z, .exitmenu ; CANCEL
	ld [wPartyMenuCursor], a
	ldh a, [hJoyLast]
	ld b, a
	bit B_BUTTON_F, b
	jr nz, .exitmenu ; B button
	ld a, [wMenuCursorY]
	dec a
	ld [wCurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld a, MON_FORM ; aka MON_IS_EGG
	call GetPartyParamLocation
	ld a, [hl]
	and FORM_MASK
	ld [wCurForm], a
	

	ld de, SFX_READ_TEXT_2
	call PlaySFX
	push bc
	call SFXDelay2
	pop bc
	and a
	ret

.exitmenu
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	push bc
	call SFXDelay2
	pop bc
	scf
	ret
; 0x5049a


PrintPartyMenuText: ; 5049a
	hlcoord 0, 14
	lb bc, 2, 18
	call TextBox
	ld a, [wPartyCount]
	and a
	jr nz, .haspokemon
	ld de, YouHaveNoPKMNString
	jr .gotstring
.haspokemon ; 504ae
	ld a, [wPartyMenuActionText]
	and $f ; drop high nibble
	ld hl, PartyMenuStrings
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
.gotstring ; 504be
	ld a, [wOptions1]
	push af
	set NO_TEXT_SCROLL, a ; disable text delay
	ld [wOptions1], a
	hlcoord 1, 16 ; Coord
	call PlaceString
	pop af
	ld [wOptions1], a
	ret
; 0x504d2

PartyMenuStrings: ; 0x504d2
; needs to match PartyMenuQualityPointers
	dw ChooseAMonString
	dw UseOnWhichPKMNString
	dw WhichPKMNString
	dw TeachWhichPKMNString
	dw MoveToWhereString
	dw UseOnWhichPKMNString
	dw ShowHerAPKMNString ; Probably used to be ChooseAFemalePKMNString
	dw ChooseAMonString ; Probably used to be ChooseAMalePKMNString
	dw ToWhichPKMNString
	dw TutorWhichPKMNString
	dw SellWhichPKMNString

ChooseAMonString: ; 0x504e4
	db "Choose a #MON.@"
UseOnWhichPKMNString: ; 0x504f3
	db "Use on which <PK><MN>?@"
WhichPKMNString: ; 0x50504
	db "Which <PK><MN>?@"
TeachWhichPKMNString: ; 0x5050e
	db "Teach which <PK><MN>?@"
TutorWhichPKMNString: ; 0x5050e
	db "Tutor which <PK><MN>?@"
MoveToWhereString: ; 0x5051e
	db "Move to where?@"
ToWhichPKMNString: ; 0x50549
	db "To which <PK><MN>?@"
ShowHerAPKMNString:
	db "Show which <PK><MN>?@"
SellWhichPKMNString:
	db "Sell which <PK><MN>?@"
YouHaveNoPKMNString: ; 0x50556
	db "You have no <PK><MN>!@"


PrintPartyMenuActionText: ; 50566
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	call GetNick
	ld a, [wPartyMenuActionText]
	and $f
	ld hl, .MenuActionTexts
	jp .PrintText
; 5057b

.MenuActionTexts: ; 5057b
	dw .Text_CuredOfPoison
	dw .Text_BurnWasHealed
	dw .Text_Defrosted
	dw .Text_WokeUp
	dw .Text_RidOfParalysis
	dw .Text_RecoveredSomeHP
	dw .Text_HealthReturned
	dw .Text_Revitalized
	dw .Text_GrewToLevel
	dw .Text_CameToItsSenses
	dw .Text_BarelyHoldOn
; 5058f

.Text_RecoveredSomeHP: ; 0x5058f
	; recovered @ HP!
	text_jump UnknownText_0x1bc0a2
	db "@"
; 0x50594

.Text_CuredOfPoison: ; 0x50594
	; 's cured of poison.
	text_jump UnknownText_0x1bc0bb
	db "@"
; 0x50599

.Text_RidOfParalysis: ; 0x50599
	; 's rid of paralysis.
	text_jump UnknownText_0x1bc0d2
	db "@"
; 0x5059e

.Text_BurnWasHealed: ; 0x5059e
	; 's burn was healed.
	text_jump UnknownText_0x1bc0ea
	db "@"
; 0x505a3

.Text_Defrosted: ; 0x505a3
	; was defrosted.
	text_jump UnknownText_0x1bc101
	db "@"
; 0x505a8

.Text_WokeUp: ; 0x505a8
	; woke up.
	text_jump UnknownText_0x1bc115
	db "@"
; 0x505ad

.Text_HealthReturned: ; 0x505ad
	; 's health returned.
	text_jump UnknownText_0x1bc123
	db "@"
; 0x505b2

.Text_Revitalized: ; 0x505b2
	; is revitalized.
	text_jump UnknownText_0x1bc13a
	db "@"
; 0x505b7

.Text_GrewToLevel: ; 0x505b7
	; grew to level @ !@ @
	text_jump UnknownText_0x1bc14f
	db "@"
; 0x505bc

.Text_CameToItsSenses: ; 0x505bc
	; came to its senses.
	text_jump UnknownText_0x1bc16e
	db "@"
; 0x505c1

.Text_BarelyHoldOn: ; 0x505bc
	; is barely holding on!
	text_jump UnknownText_BarelyHoldOn
	db "@"


.PrintText: ; 505c1
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wOptions1]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions1], a
	call PrintText
	pop af
	ld [wOptions1], a
	ret
; 505da
