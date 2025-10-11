StdScripts::
	dba PokeCenterNurseScript
	dba DifficultBookshelfScript
	dba PictureBookshelfScript
	dba MagazineBookshelfScript
	dba TeamRocketOathScript
	dba IncenseBurnerScript
	dba MerchandiseShelfScript
	dba TownMapScript
	dba WindowScript
	dba TVScript
	dba Radio1Script
	dba Radio2Script
	dba TrashCanScript
	dba StrengthBoulderScript
	dba SmashRockScript
	dba PokeCenterSignScript
	dba MartSignScript
	dba GoldenrodRocketsScript
	dba RadioTowerRocketsScript
	dba ElevatorButtonScript
	dba DayToTextScript
	dba BugContestResultsWarpScript
	dba BugContestResultsScript
	dba InitializeEventsScript
	dba AskNumber1MScript
	dba AskNumber2MScript
	dba RegisteredNumberMScript
	dba NumberAcceptedMScript
	dba NumberDeclinedMScript
	dba PhoneFullMScript
	dba RematchMScript
	dba GiftMScript
	dba PackFullMScript
	dba RematchGiftMScript
	dba AskNumber1FScript
	dba AskNumber2FScript
	dba RegisteredNumberFScript
	dba NumberAcceptedFScript
	dba NumberDeclinedFScript
	dba PhoneFullFScript
	dba RematchFScript
	dba GiftFScript
	dba PackFullFScript
	dba RematchGiftFScript
	dba GymStatue0Script
	dba GymStatue1Script
	dba GymStatue2Script
	dba GymStatue3Script
	dba ReceiveItemScript
	dba PCScript
	dba GameCornerCoinVendorScript
	dba HappinessCheckScript
	dba CutTreeScript
	dba RefrigeratorScript
	dba SinkScript
	dba StoveScript
	dba VendingMachineScript
	dba TreeGrottoScript
	dba CaveGrottoScript
	dba IceBlockScript
	dba AtmScript
	dba PokeCenterChanseyScript
	dba DeadLampScript
	dba LitLampScript
	dba SunflowerScript
	dba TempleTimerEndScript

PokeCenterNurseScript:
	opentext
;	checkevent EVENT_NURSE_SAW_FOUR_TRAINER_STARS
;	iftrue .four_star_center
	checktime 1 << MORN
	iftrue .morn
	checktime 1 << DAY
	iftrue .day
	checktime 1 << DUSK
	iftrue .dusk
	checktime 1 << NITE
	iftrue .nite
	jump .ok

.morn
	farwritetext NurseMornText
	jump .ok
.day
	farwritetext NurseDayText
	jump .ok
.dusk
	farwritetext NurseDuskText
	jump .ok
.nite
	farwritetext NurseNiteText
.ok
	checkevent EVENT_USED_POKE_CENTER
	iffalse .first_time
	checkcode VAR_PARTYCOUNT
	if_equal 0, .nopokemon
	buttonsound
	farwritetext StdBlankText
	pause 6
	farwritetext NurseTakePokemonText
	jump .return
.first_time
	buttonsound
	farwritetext StdBlankText
	pause 6
	farwritetext NurseWelcomeText
	buttonsound
	farwritetext StdBlankText
	pause 6
	farwritetext NurseAskHealText
	buttonsound
	farwritetext StdBlankText
	pause 6
.answer_heal
	checkcode VAR_PARTYCOUNT
	if_equal 0, .nopokemon
	farwritetext NurseTakePokemonText
.return
	pause 10
	turnobject LAST_TALKED, LEFT
	pause 10
	special HealParty
	special SaveMusic
	playmusic MUSIC_NONE
	writebyte 0 ; Machine is at a Pokemon Center
	special HealMachineAnim
	pause 30
	special RestoreMusic
	turnobject LAST_TALKED, DOWN
	pause 10
	

	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_POKERUS ; nurse already talked about pokerus
	iftrue .no
	special SpecialCheckPokerus
	iftrue .pokerus
.no
	checkevent EVENT_USED_POKE_CENTER
	iftrue .done
	farwritetext NurseReturnPokemonText
	pause 20
.done
	farwritetext StdBlankText
	pause 6
	farwritetext NurseGoodbyeText
	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10
	spriteface PLAYER, DOWN
	setevent EVENT_USED_POKE_CENTER
	callasm ResetPalsAfterNurse
	endtext
	
.nopokemon
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LAST_TALKED, 15
	opentext
	writetext .NurseNoPokemonText
	buttonsound
	jump .done
	end

.pokerus
	farwritetext NursePokerusText
	waitbutton
	closetext
	callasm ResetPalsAfterNurse
	setflag ENGINE_POKERUS
	specialphonecall SPECIALCALL_POKERUS
	end
	
.NurseNoPokemonText:
	text "Oh!"
	
	para "You don't seem"
	line "to be carrying"
	cont "any #MON."
	done
	
ResetPalsAfterNurse:
	call SetPalettes
	ret

IceBlockScript:
	farjumptext IceBlockText
	
AtmScript:
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	callasm CheckPCOff
	iftrue .PC_Off
	checkflag ENGINE_TRAINER_CARD
	iffalse .no_card
	opentext
	special Special_BankOfMom
	endtext
.no_card
	jumptext AtmNoCardText
.PC_Off
	jumptext PCOffText
	
AtmNoCardText:
	text "Welcome!"
	
	para "Please insert"
	line "ATM CARD."
	done
	
PokeCenterChanseyScript:
	opentext TEXTBOX_POKEMON, CHANSEY
	writetext PokeCenterChanseyText
	cry CHANSEY
	waitbutton
	closetext
	end
	
PokeCenterChanseyText:
	text "Sii!"
	done
	
SunflowerScript:
	callasm CheckSunflowerOrHerbs
	ifequal $1, .herbs
	farjumptext SunflowerText
.herbs
	farjumptext HerbsText
	
CheckSunflowerOrHerbs:
	ld a, [wMapGroup]
	cp GROUP_ROUTE_28
	jr z, .herbs
	ld a, 0
	ld [wScriptVar], a
	ret
.herbs
	ld a, 1
	ld [wScriptVar], a
	ret
	
DeadLampScript:
	farjumptext DeadLampText
	
LitLampScript:
	farjumptext LitLampText
	
DifficultBookshelfScript:
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText

RefrigeratorScript:
	farjumptext RefrigeratorText

SinkScript:
	farjumptext SinkText

StoveScript:
	farjumptext StoveText

TownMapScript:
	opentext
	farwritetext TownMapText
	waitbutton
	special Special_TownMap
	endtext

WindowScript:
	farjumptext WindowText

TVScript:
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	farjumptext TVText

WrongSideScript:
	farjumptext WrongSideText

Radio1Script:
	farjumptext RadioText

Radio2Script:
	farjumptext RadioText

IsKantoRadioOffAir:
	call RegionCheck
	ld a, e
	cp SOUTH_ONWA_REGION
	jr nz, .no
	ld a, [wPokegearFlags]
	bit 3, a
	jr nz, .no
	ld a, TRUE
	jr .ok
.no
	xor a ; ld a, FALSE
.ok
	ld [wScriptVar], a
	ret

TrashCanScript: ; 0xbc1a5
	farjumptext TrashCanText

PCScript:
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	opentext
	callasm CheckPCOff
	iftrue .PC_Off
	special PokemonCenterPC
	endtext
.PC_Off
	writetext PCOffText
	waitbutton
	endtext
	
PCOffText:
	text "The screen is"
	line "black."
	
	para "It's no use…"
	done
	
CheckPCOff:
	ld a, [wMapMusic]
	cp MUSIC_NONE
	ld a, 0
	jr nz, .not_off
	ld a, 1
.not_off
	ld [wScriptVar], a
	ret
	

ElevatorButtonScript:
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farjump AskStrengthScript

SmashRockScript:
	farjump AskRockSmashScript

PokeCenterSignScript:
	farjumptext PokeCenterSignText

MartSignScript:
	farjumptext MartSignText

DayToTextScript:
	checkcode VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	stringtotext .SundayText, 0
	end
.Monday:
	stringtotext .MondayText, 0
	end
.Tuesday:
	stringtotext .TuesdayText, 0
	end
.Wednesday:
	stringtotext .WednesdayText, 0
	end
.Thursday:
	stringtotext .ThursdayText, 0
	end
.Friday:
	stringtotext .FridayText, 0
	end
.Saturday:
	stringtotext .SaturdayText, 0
	end
.SundayText:
	db "SUNDAY@"
.MondayText:
	db "MONDAY@"
.TuesdayText:
	db "TUESDAY@"
.WednesdayText:
	db "WEDNESDAY@"
.ThursdayText:
	db "THURSDAY@"
.FridayText:
	db "FRIDAY@"
.SaturdayText:
	db "SATURDAY@"

GoldenrodRocketsScript:
;	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	end

RadioTowerRocketsScript:
	end

TempleTimerEndScript:
	special FadeOutPalettes
	killsfx
	playsound SFX_THUNDER
	waitsfx
	opentext
	writetext TempleRoofCollapseText
	waitbutton
	closetext
	waitsfx
	special Special_FadeOutMusic
	pause 5
	special Special_ForcePlayerStateNormal
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_TEMPLE_RUMBLING
	dotrigger $0
	domaptrigger DESERT_TEMPLE_1, $0
	disappear 1 ; DESERT_TEMPLE_SHAKE_OBJECT
	callasm CheckTempleMapAsm
	ifequal 2, .top_left		; DESERT_TEMPLE_TOP_LEFT
	ifequal 3, .top_right	; DESERT_TEMPLE_TOP_RIGHT
	ifequal 4, .lower_left	; DESERT_TEMPLE_LOWER_LEFT
;.lower_right
	clearevent EVENT_DESERT_TEMPLE_SWITCH_4
	warpfacing RIGHT, DESERT_TEMPLE_LOWER_RIGHT, 0, 20
	end
.top_left
	clearevent EVENT_DESERT_TEMPLE_SWITCH_5
	warpfacing LEFT, DESERT_TEMPLE_TOP_LEFT, 11, 2
	end
.top_right
	clearevent EVENT_DESERT_TEMPLE_SWITCH_6
	warpfacing RIGHT, DESERT_TEMPLE_TOP_RIGHT, 0, 16
	end
.lower_left
	clearevent EVENT_DESERT_TEMPLE_SWITCH_3
	warpfacing LEFT, DESERT_TEMPLE_LOWER_LEFT, 27, 10
	end
	
TempleRoofCollapseText:
	text "The roof"
	line "collapsed!"
	done
	
CheckTempleMapAsm:
	ld a, [wMapNumber]
	ld [wScriptVar], a
	ret

BugContestResultsWarpScript:
;	special ClearBGPalettes
;	scall BugContestResults_CopyContestantsToResults
;	setevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
;	clearevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
;	setevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
;	warp ROUTE_36_NATIONAL_PARK_GATE, $0, $4
;	applymovement PLAYER, Movement_ContestResults_WalkAfterWarp
	; fallthrough

BugContestResultsScript:
;	clearflag ENGINE_BUG_CONTEST_TIMER
;	clearevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
;	clearevent EVENT_CONTEST_OFFICER_HAS_PRIZE
;	opentext
;	farwritetext ContestResults_ReadyToJudgeText
;	waitbutton
;	special BugContestJudging
;	RAM2MEM $0
;	ifequal 1, .FirstPlace
;	ifequal 2, .SecondPlace
;	ifequal 3, .ThirdPlace
;	copybytetovar wBugContestOfficerPrize
;	itemtotext $0, $1
;	farwritetext ContestResults_ConsolationPrizeText
;	buttonsound
;	waitsfx
;	copybytetovar wBugContestOfficerPrize
;	verbosegiveitem ITEM_FROM_MEM
;	iftrue .GotConsolationPrize
;	farwritetext BugContestPrizeNoRoomText
;	buttonsound
;	setevent EVENT_CONTEST_OFFICER_HAS_PRIZE
;.GotConsolationPrize
;	farwritetext ContestResults_DidNotWinText
;	buttonsound
;	jump .FinishUp

;.FirstPlace
;	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
;.SecondPlace
;.ThirdPlace
;	copybytetovar wBugContestOfficerPrize
;	itemtotext $0, $1
;	farwritetext ContestResults_PlayerWonAPrizeText
;	waitbutton
;	copybytetovar wBugContestOfficerPrize
;	verbosegiveitem ITEM_FROM_MEM
;	iftrue .GotWinnersPrize
;	farwritetext BugContestPrizeNoRoomText
;	buttonsound
;	setevent EVENT_CONTEST_OFFICER_HAS_PRIZE
;.GotWinnersPrize
;	farwritetext ContestResults_JoinUsNextTimeText
;	buttonsound
;.FinishUp
;	checkevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
;	iffalse .DidNotLeaveMons
;	farwritetext ContestResults_ReturnPartyText
;	waitbutton
;	special ContestReturnMons
;.DidNotLeaveMons
;	special CheckPartyFullAfterContest
;	ifequal $0, .CleanUp
;	ifequal $2, .CleanUp
;	farwritetext ContestResults_PartyFullText
;	waitbutton
;.CleanUp
;	closetext
;	setscene $0
;	setmapscene ROUTE_35_NATIONAL_PARK_GATE, $0
;	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
;	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
;	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
;	setflag ENGINE_DAILY_BUG_CONTEST
;	special PlayMapMusic
	end
; 0xbc31e

BugContestResults_CopyContestantsToResults: ; 0xbc380
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
;	iftrue .skip1
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_1B
;.skip1
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
;	iftrue .skip2
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_2B
;.skip2
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
;	iftrue .skip3
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_3B
;.skip3
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
;	iftrue .skip4
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_4B
;.skip4
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
;	iftrue .skip5
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_5B
;.skip5
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
;	iftrue .skip6
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_6B
;.skip6
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
;	iftrue .skip7
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_7B
;.skip7
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
;	iftrue .skip8
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_8B
;.skip8
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
;	iftrue .skip9
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_9B
;.skip9
;	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
;	iftrue .skip10
;	clearevent EVENT_BUG_CATCHING_CONTESTANT_10B
;.skip10
	end

InitializeEventsScript:
	setevent EVENT_INITIALIZED_EVENTS
	setevent EVENT_HAVENT_BEAT_STANLEY
	setevent EVENT_HAVENT_BEAT_RODNEY
	setevent EVENT_HAVENT_BEAT_WENDY
	setevent EVENT_HAVENT_BEAT_CHARLIE
	setevent EVENT_HAVENT_BEAT_POLLY
	setevent EVENT_HAVENT_BEAT_LEILANI
	setevent EVENT_HAVENT_BEAT_ROCKY
	setevent EVENT_HAVENT_BEAT_DARCY
	setevent EVENT_PLAYER_HOUSE_MOM_2
	setevent EVENT_PLAYER_HOUSE_MOM_3
	setevent EVENT_LIGHTHOUSE_KIDS_DIE
	setevent EVENT_SPOOKHOUSE_SAW_GHOST_1
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN
	setevent EVENT_SUNBEAM_SPRUCE_GONE
	setevent EVENT_SPRUCELAB_SPRUCE2_GONE
	setevent EVENT_SPRUCELAB_SPRUCE3_GONE
	setevent EVENT_SPRUCELAB_MUNCH2_GONE
	setevent EVENT_SPRUCELAB_MUNCH3_GONE
	setevent EVENT_SPOOKHOUSE_TV_ROOM_GIRLS_GONE
	setevent EVENT_STARGLOW_CAVERN_DISGUISEMAN_2
	setevent EVENT_STARGLOW_HOUSE
	setevent EVENT_GLINT_CONTACT_GUY_2
	setevent EVENT_PLAYER_CUTSCENE_SILVER
	setevent EVENT_PLAYER_CUTSCENE_ALT
	setevent EVENT_SUNSET_STRAND
	setevent EVENT_STARGLOW_MAIN_PUNK_2
	setevent EVENT_PUNKS_HAVENT_LEFT_STARGLOW
	setevent EVENT_BEAT_TRAIN_CABIN_1_SNARE_1
	setevent EVENT_LUSTER_SEWERS_FLOODED
	setevent EVENT_BIKINIP
	setevent EVENT_BIKINIBL
	setevent EVENT_BIKINIBR
	setevent EVENT_HAVENT_SAVED_SUNBEAM
	setevent EVENT_HAVENT_SAVED_BIKESHOP_OWNERS_SON
	setevent EVENT_STARGLOW_CAVERN_FOSSIL_GUY
	setevent EVENT_EVENTIDE_GYM_BLUE_SWITCH
	setevent EVENT_EVENTIDE_GYM_BLACK_SWITCH
	setevent EVENT_TORCH_2_UNLIT
	setevent EVENT_TORCH_3_UNLIT
	setevent EVENT_TORCH_4_UNLIT
	setevent EVENT_TORCH_5_UNLIT
	setevent EVENT_TORCH_6_UNLIT
	setevent EVENT_TORCH_7_UNLIT
	setevent EVENT_TORCH_8_UNLIT
	setevent EVENT_TORCH_9_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_1_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_2_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_3_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_4_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_5_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_6_UNLIT
	setevent EVENT_ICE_TEMPLE_CAMPFIRE_7_UNLIT
	setevent EVENT_BLUE_ROOM_STEAM_1
	setevent EVENT_BLUE_ROOM_STEAM_2
	setevent EVENT_BLUE_ROOM_STEAM_3
	setevent EVENT_YELLOW_ROOM_STEAM_1
	setevent EVENT_YELLOW_ROOM_STEAM_2
	setevent EVENT_YELLOW_ROOM_STEAM_3
	setevent EVENT_RED_ROOM_STEAM_1
	setevent EVENT_RED_ROOM_STEAM_2
	setevent EVENT_RED_ROOM_STEAM_3
	setevent EVENT_SNES
	setevent EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	setevent EVENT_NO_BALL_SHOP_DISCOUNT
	setevent EVENT_SHIMMER_BOATMAN
	setevent EVENT_BRILLO_BOATMAN
	setevent EVENT_FLICKER_STATION_TRAIN_TICKET
	setevent EVENT_FLICKER_TRAIN_STATION_SNARE
	setevent EVENT_BRILLO_CLERK_2_GONE
	setevent EVENT_SPOOKHOUSE_BALL_LEFT_GONE
	setevent EVENT_ROUTE_18_DISGUISEMAN2
	setevent EVENT_SEASIDE_CAVE_GUY_NOT_SPINNING
	setevent EVENT_BOTTOM_PATCHES_GONE
	setevent EVENT_POLLY_NOT_IN_BOUTIQUE
	setevent EVENT_POLLY_NOT_IN_ELECTRONICS
	setevent EVENT_POLLY_NOT_IN_BALL_SHOP
	setevent EVENT_POLLY_NOT_IN_KOFFING_BEAN
	setevent EVENT_POLLY_NOT_IN_SHINY_SHARDS
	setevent EVENT_LUSTER_SEWERS_B1F_POKEBALL
	setevent EVENT_RADIANT_GYM_ACTIVE
	setevent EVENT_RADIANT_GYM_INACTIVE
	setevent EVENT_ROUTE_10_EAST_POKE_BALL_BLIZZARD
	setevent EVENT_MIMIKYU_RIGHT
	setevent EVENT_ROUTE_24_MUSHROOM_5
	setevent EVENT_GOT_FIVESTARHELM
	setevent EVENT_DECO_BED_1
	setevent EVENT_DECO_POSTER_7
	setevent EVENT_HAVENT_MADE_IT_TO_SOUTH_ONWA
	setevent EVENT_MINA_NOT_AT_HOME
	setevent EVENT_MINA_APARTMENT_EMPTY
	setevent EVENT_ROUTE_6_MINA_GONE
	setevent EVENT_ROUTE_11_MINA_GONE
	setevent EVENT_RADIANT_FIELD_MINA_GONE
	setevent EVENT_ROUTE_29_MINA_GONE
	setevent EVENT_ROUTE_10_MINA_GONE
	setevent EVENT_INN_1F_UNFORTUNATE_CUSTOMER
	setevent EVENT_CROSSROADS_UNFORTUNATE_CUSTOMER
	setevent EVENT_INN_1F_SNARE_GIRL
	setevent EVENT_INN_1F_ROOM_SNARE
	setevent EVENT_INN_1F_LOBBY_SNARE
	setevent EVENT_INN_2F_SNARE_HALLWAY
	setevent EVENT_INN_3F_SNARE_HALLWAY
	setevent EVENT_ROUTE_11_BRIDGE_NOT_BUILT
	setevent EVENT_SNARE_AT_MUSEUM
	setevent EVENT_MUSEUM_NO_CLAY_POT
	setevent EVENT_MUSEUM_NO_DRAGON_STONE
	setevent EVENT_OBSCURA_CITY_ROCKY_GONE
	setevent EVENT_MUSEUM_ROPE_LEFT
	setevent EVENT_MUSEUM_BARRIER_DOWN
	setevent EVENT_MUSEUM_SNARE_GUY_GONE
	setevent EVENT_HIDE_CORAL_STAR_1
	setevent EVENT_HIDE_CORAL_STAR_2
	setevent EVENT_HIDE_CORAL_STAR_3
	setevent EVENT_HIDE_CORAL_STAR_4
	setevent EVENT_UNDERWATER_TEMPLE_2_CURSOLA
	setevent EVENT_BRILLO_MART_NORMAL_CLERK_GONE
	setevent EVENT_ROUTE_18_NORTH_POKE_BALL_EARTHQUAKE
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_JOURNAL
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_6
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_11
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_RADIANT_FIELD
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_29
	setevent EVENT_UNIQUE_ENCOUNTER_MINA_ROUTE_10
	setevent EVENT_HAVENT_BEEN_TO_LUSTER_CITY
	setevent EVENT_SCARY_PAINTING_GONE_2
	setevent EVENT_ROUTE_11_2_BONE
	setevent EVENT_ROUTE_11_2_FLOATING_BALL
	setevent EVENT_SPOOKHOUSE_NOT_LOCKED
	setevent EVENT_CLEANSE_TAG_GONE
	setevent EVENT_ROUTE_22_MEDIC_GONE
	setevent EVENT_ALWAYS_SET
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_PUNKS_IN_STARGLOW
	setflag ENGINE_PUNKS_ON_SUNBEAM
	setevent EVENT_RUNNING_SHOES
	variablesprite SPRITE_DISGUISEMAN, SPRITE_BALL_CUT_FRUIT
	variablesprite SPRITE_BATHER_VARIABLE_1, SPRITE_BATHER_1
	variablesprite SPRITE_BATHER_VARIABLE_2, SPRITE_BATHER_1
	variablesprite SPRITE_GENERAL_VARIABLE_1, SPRITE_ELDER
	variablesprite SPRITE_ICESKATER_VARIABLE, SPRITE_SNOWGIRL_SKATE
	variablesprite SPRITE_BAGGAGE, SPRITE_MISC_BAGGAGE
	variablesprite SPRITE_LEILANI_VARIABLE, SPRITE_LEILANI_CHAIR
	domaptrigger OBSCURA_MUSEUM_1F, $2
	domaptrigger GLINT_GROVE_UNDERGROUND, $2
	return

AskNumber1MScript:
	end

AskNumber2MScript:
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedMScript:
	end

NumberDeclinedMScript:
	end

PhoneFullMScript:
	end

RematchMScript:
	end

GiftMScript:
	end

PackFullMScript:
	end

RematchGiftMScript:
	end

AskNumber1FScript:
	end

AskNumber2FScript:
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedFScript: ; 0xbcbd3
	end

NumberDeclinedFScript:
	end

PhoneFullFScript:
	end

RematchFScript:
	end

GiftFScript:
	end

PackFullFScript:
	end

RematchGiftFScript:
	end

GymStatue0Script:
	mapnametotext $0
	opentext
	farwritetext GymStatue_CityGymText
	waitendtext

GymStatue1Script:
	mapnametotext $0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_WinningTrainersText
	waitendtext

GymStatue2Script:
	mapnametotext $0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_TwoWinningTrainersText
	waitendtext

GymStatue3Script:
	mapnametotext $0
	opentext
	farwritetext GymStatue_CityGymText
	buttonsound
	farwritetext GymStatue_ThreeWinningTrainersText
	waitendtext

ReceiveItemScript: ; 0xbcdb9
	waitsfx
	changetextboxspeaker
	farwritetext ReceivedItemText
	playsound SFX_ITEM
	waitsfx
	end
; 0xbcdc3

GameCornerCoinVendorScript: ; 0xbcdcd
	faceplayer
	opentext
	checkitem COIN_CASE
	iftrue CoinVendor_IntroScript
	farwritetext CoinVendor_WelcomeText
	waitbutton
	verbosegiveitem COIN_CASE
	givecoins 50
	setevent EVENT_BRILLO_CLERK_1_GONE
	clearevent EVENT_BRILLO_CLERK_2_GONE
	farwritetext CoinVendor_WelcomeText2
	waitendtext
; 0xbcde0

CoinVendor_IntroScript: ; 0xbcde0
	farwritetext CoinVendor_IntroText

.loop ; 0xbcde4
	special Special_DisplayMoneyAndCoinBalance
	loadmenu .MenuDataHeader
	verticalmenu
	closewindow
	ifequal $1, .Buy50
	ifequal $2, .Buy500
	jump .Cancel
; 0xbcdf7

.Buy50: ; 0xbcdf7
	checkcoins 49950
	ifequal $0, .CoinCaseFull
	checkmoney $0, 1000
	ifequal $2, .NotEnoughMoney
	givecoins 50
	takemoney $0, 1000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy50CoinsText
	waitbutton
	jump .loop
; 0xbce1b

.Buy500: ; 0xbce1b
	checkcoins 49500
	ifequal $0, .CoinCaseFull
	checkmoney $0, 10000
	ifequal $2, .NotEnoughMoney
	givecoins 500
	takemoney $0, 10000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy500CoinsText
	waitbutton
	jump .loop
; 0xbce3f

.NotEnoughMoney: ; 0xbce3f
	farwritetext CoinVendor_NotEnoughMoneyText
	waitendtext
; 0xbce46

.CoinCaseFull: ; 0xbce46
	farwritetext CoinVendor_CoinCaseFullText
	waitendtext
; 0xbce4d

.Cancel: ; 0xbce4d
	farwritetext CoinVendor_CancelText
	waitendtext
; 0xbce54

.MenuDataHeader:
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"
; 0xbce7f


HappinessCheckScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless 50, .Unhappy
	ifless 150, .KindaHappy
	farwritetext HappinessText3
	waitendtext

.KindaHappy:
	farwritetext HappinessText2
	waitendtext

.Unhappy:
	farwritetext HappinessText1
	waitendtext

Movement_ContestResults_WalkAfterWarp: ; bcea1
	step_right
	step_down
	turn_head_up
	step_end
; bcea5

CutTreeScript:
	farjump AskCutTreeScript

VendingMachineScript::
	checkcode VAR_FACING
	ifnotequal UP, WrongSideScript
	opentext
.Start:
	special PlaceMoneyTopRight
	farwritetext VendingMachineText
	waitbutton
	loadmenu .MenuData
	verticalmenu
	closewindow
	ifequal $1, .FreshWater
	ifequal $2, .SodaPop
	ifequal $3, .RageCandyBar
	refreshscreen
	closetext
	end

.FreshWater:
	checkmoney $0, 200
	ifequal $2, .NotEnoughMoney
	giveitem FRESH_WATER
	iffalse .NotEnoughSpace
	takemoney $0, 200
	itemtotext FRESH_WATER, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem FRESH_WATER
	iffalse .Start
	itemtotext FRESH_WATER, $0
	jump .ExtraItem

.SodaPop:
	checkmoney $0, 300
	ifequal $2, .NotEnoughMoney
	giveitem SODA_POP
	iffalse .NotEnoughSpace
	takemoney $0, 300
	itemtotext SODA_POP, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem SODA_POP
	iffalse .Start
	itemtotext SODA_POP, $0
	jump .ExtraItem

.RageCandyBar:
	checkmoney $0, 400
	ifequal $2, .NotEnoughMoney
	giveitem RAGECANDYBAR
	iffalse .NotEnoughSpace
	takemoney $0, 400
	itemtotext RAGECANDYBAR, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem RAGECANDYBAR
	iffalse .Start
	itemtotext RAGECANDYBAR, $0
	jump .ExtraItem

.VendItem:
	pause 10
	playsound SFX_ENTER_DOOR
	farwritetext VendingMachineClangText
	buttonsound
	giveitemnotification
	end

.ExtraItem:
	pause 10
	playsound SFX_ENTER_DOOR
	farwritetext VendingMachineScoreText
	buttonsound
	giveitemnotification
	jump .Start

.NotEnoughMoney:
	farwritetext VendingMachineNoMoneyText
	waitbutton
	jump .Start

.NotEnoughSpace:
	farwritetext VendingMachineNoSpaceText
	waitbutton
	jump .Start

.MenuData:
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db $80 ; flags
	db 4 ; items
	db "FRESH WATER  ¥200@"
	db "SODA POP     ¥300@"
	db "RAGECANDYBAR ¥400@"
	db "CANCEL@"

TreeGrottoScript:
;	scall _HiddenGrottoInitScript
;	iffalse_endtext
;	closetext
;	playsound SFX_EXIT_BUILDING
;	special FadeOutPalettes
;	pause 15
;	callasm _HiddenGrottoBackupMap
;	warpfacing UP, HIDDEN_TREE_GROTTO, 4, 15
	end

CaveGrottoScript:
;	scall _HiddenGrottoInitScript
;	iffalse_endtext
;	closetext
;	playsound SFX_EXIT_BUILDING
;	special FadeOutPalettes
;	pause 15
;	callasm _HiddenGrottoBackupMap
;	warpfacing UP, HIDDEN_CAVE_GROTTO, 35, 85
	end
