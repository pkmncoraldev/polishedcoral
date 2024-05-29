Script_BattleWhiteout:: ; 0x124c1
	callasm BattleBGMap
	jump Script_Whiteout
; 0x124c8

Script_OverworldWhiteout:: ; 0x124c8
	refreshscreen
	callasm OverworldWhiteoutFade

Script_Whiteout: ; 0x124ce
	scall WhiteoutHandleEvents
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
	callasm HalveMoney
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
	setevent EVENT_ALWAYS_SET
	clearevent EVENT_ROUTE_20_GRASS_YELLOW
	clearevent EVENT_TRAIN_GOING_EAST
	clearevent EVENT_TRAIN_GOING_WEST
	clearevent EVENT_SNOWSTORM_HAPPENING
	clearevent EVENT_SANDSTORM_HAPPENING
	clearevent EVENT_AIRPORT_FENCE
	clearevent EVENT_CAPE_LIGHTHOUSE_COLORS
	setevent EVENT_HARBOR_BINOCULAR_COLORS
	loadvar wTimeOfDayPalFlags, $40 | 0
	domaptrigger SUNSET_CAPE, $0
	domaptrigger ROUTE_10, $0
	domaptrigger ROUTE_18_NORTH, $0
	domaptrigger DESERT_WASTELAND_1, $0
	domaptrigger ROUTE_20, $0
	domaptrigger LUSTER_SEWERS_B1F, $0
	domaptrigger LUSTER_SEWERS_B2F, $0
	domaptrigger CONNECTING_CAVERN, $0
	domaptrigger KOMORE_COMMUNITY_CENTER, $0
	domaptrigger SUNSET_CAPE, $0
	domaptrigger SHIMMER_HARBOR, $0
	clearevent EVENT_ON_DODRIO_RANCH
	clearevent EVENT_AT_AIRPORT
	clearevent EVENT_SET_ROUTE_27
	clearevent EVENT_ON_ROUTE_27
	clearflag ENGINE_NEAR_CAMPFIRE
	clearevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT
	clearevent EVENT_DOUBLE_LANDMARK_SIGN
	clearevent EVENT_LAKE_ROCKS_BROWN
	clearevent EVENT_GLINT_GROVE_EAST_ROCKS_BROWN
	clearevent EVENT_BRILLO_MARACTUS_GREEN
	clearevent EVENT_ROUTE_3_ROCKS_BROWN
	clearflag ENGINE_ENCOUNTER_HOUSE
	loadvar wJukeboxSong, 0
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

HalveMoney:
	xor a
	ld [wSpinning], a

; Halve the player's money.
	ld hl, wMoney
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	ret


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
