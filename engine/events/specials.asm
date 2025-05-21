Special:: ; c01b
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	jp FarCall_hl
; c029

INCLUDE "data/special_pointers.asm"

SpecialNone: ; c224
	ret
; c225
Special_RestorePlayerPalette:
	ld a, [wPlayerInitialPalette]
	ld [wPlayerPalette], a
	ret

Special_SetPlayerPalette: ; c225
	ld a, [wScriptVar]
	ld d, a
	farjp SetPlayerPalette
; c230

Special_SetCopycatPalette:
	ld a, [wScriptVar]
	ld d, a
	farjp SetCopycatPalette

Special_GameCornerPrizeMonCheckDex: ; c230
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wd265], a
	farcall NewPokedexEntry
	jp ExitAllMenus
; c252

SpecialSeenMon: ; c252
	ld a, [wScriptVar]
	dec a
	jp SetSeenMon
; c25a

Special_FindGreaterThanThatLevel: ; c25a
	ld a, [wScriptVar]
	ld b, a
	farcall _FindGreaterThanThatLevel
	jr z, FoundNone
	jr FoundOne

Special_FindAtLeastThatHappy: ; c268
	ld a, [wScriptVar]
	ld b, a
	farcall _FindAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

Special_FindThatSpecies: ; c276
	ld a, [wScriptVar]
	ld b, a
	farcall _FindThatSpecies
	jr z, FoundNone
	jr FoundOne

Special_FindThatSpeciesYourTrainerID: ; c284
	ld a, [wScriptVar]
	ld b, a
	farcall _FindThatSpeciesYourTrainerID
	jr z, FoundNone
	; fallthrough

FoundOne: ; c292
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone: ; c298
	xor a
	ld [wScriptVar], a
	ret
; c29d

SpecialNameRival: ; 0xc29d
	ld b, $2 ; rival
	ld de, wRivalName
	farcall _NamingScreen
	; default to "Silver"
	ld hl, wRivalName
	ld de, .DefaultRivalName
	jp InitName
; 0xc2b2

.DefaultRivalName: ; 0xc2b2
	db "Silver@"

SpecialTrendyPhrase:
	ld b, $3 ; trendy phrase
	ld de, wTrendyPhrase
	farcall _NamingScreen
	; default to "Nothing"
	ld hl, wTrendyPhrase
	ld de, .DefaultTrendyPhrase
	jp InitName
; 0xc2b2

.DefaultTrendyPhrase:
	db "Nothing@"

SpecialNameRater: ; c2b9
	farjp NameRater
; c2c0

Special_TownMap: ; c2c0
	call FadeToMenu
	farcall _TownMap
	jp ExitAllMenus
; c2cd

Special_DisplayLinkRecord: ; c2da
	call FadeToMenu
	farcall DisplayLinkRecord
	jp ExitAllMenus
; c2e7

Special_PlayerHousePC: ; c2e7
	xor a
	ld [wScriptVar], a
	farcall _PlayerHousePC
	ld a, c
	ld [wScriptVar], a
	ret
; c2f6

BugContestJudging: ; c34a
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	dec a
	jr z, .firstplace
	dec a
	jr z, .secondplace
	dec a
	jr z, .thirdplace
	ld a, SHED_SHELL
	jr .finish
.firstplace
	ld a, SUN_STONE
	ld hl, wStatusFlags
	bit 6, [hl] ; hall of fame
	jr z, .finish
	ld a, DAWN_STONE - MOON_STONE + 1
	call RandomRange
	add MOON_STONE
	jr .finish
.secondplace
	ld a, EVERSTONE
	jr .finish
.thirdplace
	ld a, SITRUS_BERRY
.finish
	ld [wBugContestOfficerPrize], a
	ret
; c355

MapRadio: ; c355
	ret
;	ld a, [wScriptVar]
;	ld e, a
;	farjp PlayRadio
; c360

Special_UnownPuzzle: ; c360
	call FadeToMenu
	farcall UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	jp ExitAllMenus
; c373

Special_SlotMachine: ; c373
	call Special_CheckCoins
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	jr Special_StartGameCornerGame
; c380

Special_MoogooMankey: ; c380
;	call Special_CheckCoins
;	ret c
	ld a, BANK(_MoogooMankey)
	ld hl, _MoogooMankey
	jr Special_StartGameCornerGame

Special_CardFlip: ; c380
;	call Special_CheckCoins
;	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	; fallthrough
; c38d

;Special_DummyNonfunctionalGameCornerGame: ; c38d
;	call Special_CheckCoins
;	ret c
;	ld a, BANK(_DummyGame)
;	ld hl, _DummyGame
;	call Special_StartGameCornerGame
;	ret
;; c39a

Special_StartGameCornerGame: ; c39a
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	call FarCall_hl
	jp ExitAllMenus
; c3ae

Special_CheckCoins: ; c3ae
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret
; c3d1

.NoCoinsText: ; 0xc3d1
	; You have no coins.
	text_jump UnknownText_0x1bd3d7
	db "@"
; 0xc3d6

.NoCoinCaseText: ; 0xc3d6
	; You don't have a COIN CASE.
	text_jump UnknownText_0x1bd3eb
	db "@"
; 0xc3db

ScriptReturnCarry: ; c3e2
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret
; c3ef

Special_ActivateFishingSwarm: ; c3fc
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	ret
; c403

StoreSwarmMapIndices:: ; c403
	ld a, c
	and a
	jr nz, .yanma
; swarm dark cave violet entrance
	ld a, d
	ld [wDunsparceMapGroup], a
	ld a, e
	ld [wDunsparceMapNumber], a
	ret

.yanma
	ld a, d
	ld [wYanmaMapGroup], a
	ld a, e
	ld [wYanmaMapNumber], a
	ret
; c419

SpecialCheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	farcall CheckPokerus
	jp ScriptReturnCarry
; c422

Special_ResetLuckyNumberShowFlag: ; c422
	farcall RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res 0, [hl]
	farjp LoadOrRegenerateLuckyIDNumber
; c434

Special_CheckLuckyNumberShowFlag: ; c434
	farcall CheckLuckyNumberShowFlag
	jp ScriptReturnCarry
; c43d

SpecialSnorlaxAwake: ; 0xc43d
; Check if the Poké Flute channel is playing.

; outputs:
; wScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_NONE
	jr nz, .nope
	ld a, TRUE
	jr .done
.nope
	xor a
.done
	ld [wScriptVar], a
	ret

PlayCurMonCry: ; c472
	ld a, [wCurPartySpecies]
	jp PlayCry
; c478

Special_FadeOutMusic: ; c48f
	ld a, MUSIC_NONE % $100
	ld [wMusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [wMusicFadeIDHi], a
	ld a, $2
	ld [wMusicFade], a
	ret
; c49f

Diploma: ; c49f
	call FadeToMenu
	farcall _Diploma
	jp ExitAllMenus
; c4ac

;Special_GetOvercastIndex::
;	call GetOvercastIndex
;	ld [wScriptVar], a
;	ret

CheckIfTrendyPhraseIsLucky:
	xor a
	ld [wScriptVar], a
	ld hl, wTrendyPhrase
	ld bc, .KeyPhrase
	ld d, 6
.loop
	ld a, [bc]
	ld e, a
	ld a, [hli]
	cp e
	ret nz
	inc bc
	dec d
	jr nz, .loop
	ld a, 1
	ld [wScriptVar], a
	ret

.KeyPhrase:
	db "Lucky@"

RespawnOneOffs:
	ld a, SUDOWOODO - 1
	call CheckCaughtMon
	jr nz, .CaughtSudowoodo
	eventflagreset EVENT_LAKE_ONWA_SUDOWOODO
.CaughtSudowoodo
	ret

BillBoxSwitchCheck::
	ld a, [wCurBox]
	cp NUM_BOXES - 1
	jr nz, .notbox14
	ld a, -1
.notbox14
	inc a
.billboxloop
	inc a
	ld c, a
	push af
	farcall GetBoxCountWithC
	cp MONS_PER_BOX
	jr nz, .foundspace
	pop af
	dec a
	cp NUM_BOXES - 1
	jr nz, .notlastbox
	ld a, -1
.notlastbox
	inc a
	ld c, a
	ld a, [wCurBox]
	cp c
	ld a, c
	jr nz, .billboxloop
	xor a
	ld [wScriptVar], a
	ret

.foundspace
	pop af
	dec a
	ld [wScriptVar], a
	ld [wEngineBuffer1], a
	ret

BillBoxSwitch::
	; back up wMisc to wDecompressScratch
	ld hl, wMisc
	ld de, wDecompressScratch
	ld bc, (wMiscEnd - wMisc)
	ld a, BANK(wDecompressScratch)
	call FarCopyWRAM
	; change boxes (overwrites wMisc)
	ld a, [wEngineBuffer1]
	ld e, a
	farcall ChangeBoxSaveGameNoConfirm
	; restore wMisc from wDecompressScratch
	ld hl, wDecompressScratch
	ld de, wMisc
	ld bc, (wMiscEnd - wMisc)
	ld a, BANK(wDecompressScratch)
	jp FarCopyWRAM

Special_StopRunning:
	xor a
	ldh [hJoyDown], a
	ld a, [wPlayerState]
	cp PLAYER_SKATEBOARD_MOVING
	jr nz, .not_skating
	ld a, PLAYER_SKATEBOARD
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
.not_skating
	ld a, [wPlayerState]
	cp PLAYER_RUN
	ret nz
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Special_ForceSkateboard:
	xor a
	ldh [hJoyDown], a
	ld a, 1
	ld [wOnSkateboard], a
	ld a, PLAYER_SKATEBOARD
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Special_ForcePlayerStateNormal:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Special_MakePlayerInvisible:
	xor a
	ld [wOnBike], a
	ld [wOnSkateboard], a
	ld [wStuckInSandCounter], a
	ld a, PLAYER_INVISIBLE
	ld [wPlayerState], a
	call ReplaceKrisSprite
	ret
	
Special_UpdatePalsInstant:
	ld hl, wUnknBGPals palette 7

; save wram bank
	ldh a, [rSVBK]
	ld b, a
; wram bank 5
	ld a, 5
	ldh [rSVBK], a

; push palette
	ld c, 4 ; NUM_PAL_COLORS
.push
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push de
	dec c
	jr nz, .push

; restore wram bank
	ld a, b
	ldh [rSVBK], a


; update cgb pals
	ld b, CGB_MAPPALS
	call GetCGBLayout
	
; restore bg palette 7
	ld hl, wUnknBGPals palette 7 + 1 palettes - 1 ; last byte in UnknBGPals

; save wram bank
	ldh a, [rSVBK]
	ld d, a
; wram bank 5
	ld a, 5
	ldh [rSVBK], a

; pop palette
	ld e, 4 ; NUM_PAL_COLORS
.pop
	pop bc
	ld [hl], c
	dec hl
	ld [hl], b
	dec hl
	dec e
	jr nz, .pop

; restore wram bank
	ld a, d
	ldh [rSVBK], a

	ld a, [wTileset]
	cp TILESET_PLAYER_HOUSE
	jp z, .skip
; update palettes
	farcall _UpdateTimePals
	
.skip
; successful change
	scf
	ret
	
Special_SaveLostGirl:
	ld c, 20
	call DelayFrames
	ld a, [wLostGirls]
	inc a
	ld [wLostGirls], a
	ld c, a
	ld a, NUM_LOST_GIRLS
	sub c
	ld [wItemQuantityChangeBuffer], a
	ld a, [wLostGirls]
	cp NUM_LOST_GIRLS - 1
	jr z, .saved_all_but_one
	cp NUM_LOST_GIRLS
	jr z, .saved_all
	ld a, BANK(SavedGirlScript)
	ld hl, SavedGirlScript
	call CallScript
	ret
.saved_all_but_one
	ld a, BANK(SavedAlmostAllGirlsScript)
	ld hl, SavedAlmostAllGirlsScript
	call CallScript
	ret
.saved_all
	ld a, BANK(SavedAllGirlsScript)
	ld hl, SavedAllGirlsScript
	call CallScript
	ret

SavedGirlScript:
	jumptext SavedGirlText
	
SavedGirlText:
	text "You found @"
	text_from_ram wStringBuffer1
	text "!"
	
	para "@"
	deciram wItemQuantityChangeBuffer, 1, 2
	text " girls"
	line "remaining."
	done
	
SavedAlmostAllGirlsScript:
	jumptext SavedAlmostAllGirlsText
	
SavedAlmostAllGirlsText:
	text "You found @"
	text_from_ram wStringBuffer1
	text "!"
	
	para "@"
	deciram wItemQuantityChangeBuffer, 1, 2
	text " girl"
	line "remaining."
	done
	
SavedAllGirlsScript:
	opentext
	writetext SavedAllGirlsText1
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	farwritetext StdBlankText
	pause 6
	writetext SavedAllGirlsText2
	waitbutton
	closetext
	clearevent EVENT_RADIANT_GYM_ACTIVE
	setevent EVENT_RADIANT_GYM_INACTIVE
	setevent EVENT_SAVED_ALL_LOST_GIRLS
	setevent EVENT_ERIKA_OUTSIDE_ORPAHANGE
	end
	
SavedAllGirlsText1:
	text "You found all the"
	line "girls!"
	done
	
SavedAllGirlsText2:
	text "Better go tell"
	line "ERIKA."
	done
	
Special_DotDotDot:
	call MenuBoxCoord2Tile
	ld de, $0e * SCREEN_WIDTH + 1
	add hl, de
	ld [hl], "…"
	call ApplyTilemapInVBlank
	ld c, 60
	call DelayFrames
	inc hl
	inc hl
	ld [hl], "…"
	call ApplyTilemapInVBlank
	ld c, 60
	call DelayFrames
	inc hl
	inc hl
	ld [hl], "…"
	call ApplyTilemapInVBlank
	ld c, 60
	call DelayFrames
	ret
	
Special_MinaGoodbye:
	ld a, [wMinaEncounters]
	cp 1
	jr z, .one
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	cp 5
	jr z, .five
.zero
	ld hl, MinaGoodbyeText0
	jr .end
.one
	ld hl, MinaGoodbyeText1
	jr .end
.two
	ld hl, MinaGoodbyeText2
	jr .end
.three
	ld hl, MinaGoodbyeText3
	jr .end
.four
	ld hl, MinaGoodbyeText4
	jr .end
.five
	ld hl, MinaGoodbyeText5
	jr .end
.end
	call PrintText
	ld a, [wMinaEncounters]
	inc a
	ld [wMinaEncounters], a
	scf
	ret
	
MinaGoodbyeText0:
	text "ALOLA,"
	line "<PLAYER>."
	
	para "Err… <WAIT_M>I mean…"

	para "Goodbye!"
	done
	
MinaGoodbyeText1:
	text "ALOLA,"
	line "<PLAYER>."
	
	para "Oh, <WAIT_S>I did it"
	line "again!"

	para "Goodbye!"
	done
	
MinaGoodbyeText2:
	text "ALOLA,"
	line "<PLAYER>."
	
	para "Gah! <WAIT_M> I did it"
	line "again!"
	
	para "Goodbye!"
	done
	
MinaGoodbyeText3:
	text "ALO- <WAIT_S>Ah!<WAIT_M> I caught"
	line "myself that time!"
	
	para "Goodbye,"
	line "<PLAYER>."
	done
	
MinaGoodbyeText4:
	text "Goodbye,"
	line "<PLAYER>."
	
	para "Heh. <WAIT_M>I didn't say"
	line "ALOLA this time!"
	done
	
MinaGoodbyeText5:
	text "ALOLA,"
	line "<PLAYER>."
	
	para "I mean- <WAIT_M>"
	line "Ah, forget it!"
	done
	
Special_DisableInput:
	set 6, a
	ld [wInputFlags], a
	ld [wForceStand], a
	ret
	
Special_EnableInput:
	xor a
	ld [wInputFlags], a
	ld [wForceStand], a
	ret
	