Script_BattleWhiteout:: ; 0x124c1
	callasm BattleBGMap
	jump Script_Whiteout
; 0x124c8

Script_OverworldWhiteout:: ; 0x124c8
	refreshscreen
	callasm OverworldWhiteoutFade

Script_Whiteout: ; 0x124ce
	scall WhiteoutHandleEvents
	callasm LoseMoney
	iffalse .whiteout_text
	callasm DetermineWildBattlePanic
	iffalse .whiteout_wild_text
	writetext .WhitedOutToTrainerText
	jump .text_done
.whiteout_wild_text
	writetext .WhitedOutToWildText
	jump .text_done
.whiteout_text
	writetext .WhitedOutText
.text_done
	waitbutton
	special FadeOutPalettes
	pause 40
	special HealPartyEvenForNuzlocke
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .bug_contest
	callasm GetWhiteoutSpawn
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
	checkevent EVENT_VISITED_POKEMON_CENTER_ONCE
	iffalse .nolandmarksign
	special Special_StartLandmarkTimer
	endall
	
.nolandmarksign
	special Special_StopLandmarkTimer
	domaptrigger SUNSET_BAY, $4
	endall

.bug_contest
	jumpstd bugcontestresultswarp
; 0x124f5

.WhitedOutText: ; 0x124f5
	; is out of useable #MON!  whited out!
	text_jump WhiteoutText
	db "@"
; 0x124fa

.WhitedOutToWildText:
	text_jump WhiteoutToWildText
	db "@"

.WhitedOutToTrainerText:
	text_jump WhiteoutToTrainerText
	db "@"

WhiteoutHandleEvents:
	checkevent EVENT_TRAIN_GOING_EAST
	iffalse .skip
	checkitem TRAIN_PASS
	iftrue .skip
	giveitem TRAIN_TICKET
.skip
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	clearevent EVENT_SNOWSTORM_HAPPENING
	clearevent EVENT_SANDSTORM_HAPPENING
	clearevent EVENT_AIRPORT_FENCE
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger SUNSET_CAPE, $0
	domaptrigger ROUTE_10, $0
	domaptrigger DESERT_ROUTE_NORTH, $0
	domaptrigger DESERT_WASTELAND_1, $0
	clearevent EVENT_ON_DODRIO_RANCH
	clearevent EVENT_AT_AIRPORT
	clearflag ENGINE_NEAR_CAMPFIRE
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_LAKE_ROCKS_BROWN
	clearevent EVENT_BRILLO_MARACTUS_GREEN
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	clearflag ENGINE_ENCOUNTER_HOUSE
	end
	
OverworldWhiteoutFade:
	farcall FadeOutPalettes
	call ClearTileMap
	call ClearSprites
	ld b, CGB_DIPLOMA
	call GetCGBLayout
	jp SetPalettes


BattleBGMap: ; 1250a
	ld b, CGB_BATTLE_GRAYSCALE
	call GetCGBLayout
	jp SetPalettes
; 12513

; Gen VI money loss code by TPP Anniversary Crystal 251
; https://github.com/TwitchPlaysPokemon/tppcrystal251pub/blob/public/main.asm
LoseMoney: ; 12513
	xor a
	ld [wSpinning], a
	ld hl, wMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	ld a, 0 ; not xor a; preserve carry flag
	jr z, .load
	; 806e1
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	cp 9
	jr c, .okay
	ld c, 8
.okay
	ld b, 0
	ld hl, .BasePayouts
	add hl, bc
	ld a, [hl]
	ld [hMultiplier], a
	ld a, [wPartyCount]
	ld c, a
	ld b, 0
	ld hl, wPartyMon1Level
	ld de, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [hl]
	cp b
	jr c, .next
	ld b, a
.next
	add hl, de
	dec c
	jr nz, .loop
	xor a
	ld [hMultiplicand], a
	ld [hMultiplicand + 1], a
	ld a, b
	ld [hMultiplicand + 2], a
	call Multiply
	ld de, hMoneyTemp
	ld hl, hProduct + 1
	call .copy
	ld de, wMoney
	ld bc, hMoneyTemp
	push bc
	push de
	farcall CompareMoney
	jr nc, .nonzero
	ld hl, wMoney
	ld de, hMoneyTemp
	call .copy
.nonzero
	pop de
	pop bc
	farcall TakeMoney
	ld a, 1
.load
	ld [wScriptVar], a
	ret

.copy
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

.BasePayouts
	db 8
	db 16
	db 24
	db 36
	db 48
	db 64
	db 80
	db 100
	db 120


DetermineWildBattlePanic:
	ld hl, wWildBattlePanic
	ld a, [hl]
	and $1
	ld [wScriptVar], a
	xor a
	ld [hl], a
	ret


GetWhiteoutSpawn: ; 12527
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret
; 1253d
