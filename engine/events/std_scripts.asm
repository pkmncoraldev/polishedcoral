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
;	checkcode VAR_TRAINER_STARS
;	ifnotequal 4, .ask_heal
;	farwritetext NurseFourTrainerStarsText
;	setevent EVENT_NURSE_SAW_FOUR_TRAINER_STARS
;	jump .answer_heal

;.ask_heal
	buttonsound
	farwritetext StdBlankText
	pause 6
	farwritetext NurseAskHealText
.answer_heal
	yesorno
	iffalse .done
;	jump .heal_pokemon

;.four_star_center
;	farwritetext NurseTheUsualText
;	yesorno
;	iffalse .done
;.heal_pokemon
	checkcode VAR_PARTYCOUNT
	if_equal 0, .nopokemon
	farwritetext NurseTakePokemonText
	pause 20
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
	callasm ResetPalsAfterNurse
	waitendtext
	
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
	opentext
	special Special_BankOfMom
	endtext
	
PokeCenterChanseyScript:
	opentext
	writetext PokeCenterChanseyText
	cry CHANSEY
	waitbutton
	closetext
	end
	
PokeCenterChanseyText:
	text "CHANSEY: Sii!"
	done
	
DeadLampScript:
	farjumptext DeadLampText
	
LitLampScript:
	farjumptext LitLampText
	
DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
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
	cp KANTO_REGION
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
	special PokemonCenterPC
	endtext

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
	setevent EVENT_HAVENT_BEAT_LEADER5
	setevent EVENT_HAVENT_BEAT_LEADER6
	setevent EVENT_HAVENT_BEAT_LEADER7
	setevent EVENT_HAVENT_BEAT_LEADER8
	setevent EVENT_PLAYER_HOUSE_MOM_2
	setevent EVENT_LIGHTHOUSE_KIDS_DIE
	setevent EVENT_TRIO_BROS
	setevent EVENT_TRIO_BROS2
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
	variablesprite SPRITE_BAGGAGE, SPRITE_ICE_BLOCK
	return

AskNumber1MScript:
	end
;	special RandomPhoneMon
;	checkcode VAR_CALLERID
;	ifequal PHONE_SCHOOLBOY_JACK, .Jack
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_FISHER_RALPH, .Ralph
;	ifequal PHONE_HIKER_ANTHONY, .Anthony
;	ifequal PHONE_CAMPER_TODD, .Todd
;	ifequal PHONE_JUGGLER_IRWIN, .Irwin
;	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_POKEMANIAC_BRENT, .Brent
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji
;	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackAskNumber1Text
	end
.Huey:
	farwritetext HueyAskNumber1Text
	end
.Gaven:
	farwritetext GavenAskNumber1Text
	end
.Jose:
	farwritetext JoseAskNumber1Text
	end
.Joey:
	farwritetext JoeyAskNumber1Text
	end
.Wade:
	farwritetext WadeAskNumber1Text
	end
.Ralph:
	farwritetext RalphAskNumber1Text
	end
.Anthony:
	farwritetext AnthonyAskNumber1Text
	end
.Todd:
	farwritetext ToddAskNumber1Text
	end
.Irwin:
	farwritetext IrwinAskNumber1Text
	end
.Arnie:
	farwritetext ArnieAskNumber1Text
	end
.Alan:
	farwritetext AlanAskNumber1Text
	end
.Chad:
	farwritetext ChadAskNumber1Text
	end
.Derek:
	farwritetext DerekAskNumber1Text
	end
.Tully:
	farwritetext TullyAskNumber1Text
	end
.Brent:
	farwritetext BrentAskNumber1Text
	end
.Vance:
	farwritetext VanceAskNumber1Text
	end
.Wilton:
	farwritetext WiltonAskNumber1Text
	end
.Kenji:
	farwritetext KenjiAskNumber1Text
	end
.Parry:
	farwritetext ParryAskNumber1Text
	end

AskNumber2MScript:
	end
;	special RandomPhoneMon
;	checkcode VAR_CALLERID
;	ifequal PHONE_SCHOOLBOY_JACK, .Jack
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_FISHER_RALPH, .Ralph
;	ifequal PHONE_HIKER_ANTHONY, .Anthony
;	ifequal PHONE_CAMPER_TODD, .Todd
;	ifequal PHONE_JUGGLER_IRWIN, .Irwin
;	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_POKEMANIAC_BRENT, .Brent
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji
;	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackAskNumber2Text
	end
.Huey:
	farwritetext HueyAskNumber2Text
	end
.Gaven:
	farwritetext GavenAskNumber2Text
	end
.Jose:
	farwritetext JoseAskNumber2Text
	end
.Joey:
	farwritetext JoeyAskNumber2Text
	end
.Wade:
	farwritetext WadeAskNumber2Text
	end
.Ralph:
	farwritetext RalphAskNumber2Text
	end
.Anthony:
	farwritetext AnthonyAskNumber2Text
	end
.Todd:
	farwritetext ToddAskNumber2Text
	end
.Irwin:
	farwritetext IrwinAskNumber2Text
	end
.Arnie:
	farwritetext ArnieAskNumber2Text
	end
.Alan:
	farwritetext AlanAskNumber2Text
	end
.Chad:
	farwritetext ChadAskNumber2Text
	end
.Derek:
	farwritetext DerekAskNumber2Text
	end
.Tully:
	farwritetext TullyAskNumber2Text
	end
.Brent:
	farwritetext BrentAskNumber2Text
	end
.Vance:
	farwritetext VanceAskNumber2Text
	end
.Wilton:
	farwritetext WiltonAskNumber2Text
	end
.Kenji:
	farwritetext KenjiAskNumber2Text
	end
.Parry:
	farwritetext ParryAskNumber2Text
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedMScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_SCHOOLBOY_JACK, .Jack
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_FISHER_RALPH, .Ralph
;	ifequal PHONE_HIKER_ANTHONY, .Anthony
;	ifequal PHONE_CAMPER_TODD, .Todd
;	ifequal PHONE_JUGGLER_IRWIN, .Irwin
;	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_POKEMANIAC_BRENT, .Brent
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji
;	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackNumberAcceptedText
	waitendtext

.Huey:
	farwritetext HueyNumberAcceptedText
	waitendtext

.Gaven:
	farwritetext GavenNumberAcceptedText
	waitendtext

.Jose:
	farwritetext JoseNumberAcceptedText
	waitendtext

.Joey:
	farwritetext JoeyNumberAcceptedText
	waitendtext

.Wade:
	farwritetext WadeNumberAcceptedText
	waitendtext

.Ralph:
	farwritetext RalphNumberAcceptedText
	waitendtext

.Anthony:
	farwritetext AnthonyNumberAcceptedText
	waitendtext

.Todd:
	farwritetext ToddNumberAcceptedText
	waitendtext

.Irwin:
	farwritetext IrwinNumberAcceptedText
	waitendtext

.Arnie:
	farwritetext ArnieNumberAcceptedText
	waitendtext

.Alan:
	farwritetext AlanNumberAcceptedText
	waitendtext

.Chad:
	farwritetext ChadNumberAcceptedText
	waitendtext

.Derek:
	farwritetext DerekNumberAcceptedText
	waitendtext

.Tully:
	farwritetext TullyNumberAcceptedText
	waitendtext

.Brent:
	farwritetext BrentNumberAcceptedText
	waitendtext

.Vance:
	farwritetext VanceNumberAcceptedText
	waitendtext

.Wilton:
	farwritetext WiltonNumberAcceptedText
	waitendtext

.Kenji:
	farwritetext KenjiNumberAcceptedText
	waitendtext

.Parry:
	farwritetext ParryNumberAcceptedText
	waitendtext

NumberDeclinedMScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_SCHOOLBOY_JACK, .Jack
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_FISHER_RALPH, .Ralph
;	ifequal PHONE_HIKER_ANTHONY, .Anthony
;	ifequal PHONE_CAMPER_TODD, .Todd
;	ifequal PHONE_JUGGLER_IRWIN, .Irwin
;	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_POKEMANIAC_BRENT, .Brent
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji
;	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackNumberDeclinedText
	waitendtext

.Huey:
	farwritetext HueyNumberDeclinedText
	waitendtext

.Gaven:
	farwritetext GavenNumberDeclinedText
	waitendtext

.Jose:
	farwritetext JoseNumberDeclinedText
	waitendtext

.Joey:
	farwritetext JoeyNumberDeclinedText
	waitendtext

.Wade:
	farwritetext WadeNumberDeclinedText
	waitendtext

.Ralph:
	farwritetext RalphNumberDeclinedText
	waitendtext

.Anthony:
	farwritetext AnthonyNumberDeclinedText
	waitendtext

.Todd:
	farwritetext ToddNumberDeclinedText
	waitendtext

.Irwin:
	farwritetext IrwinNumberDeclinedText
	waitendtext

.Arnie:
	farwritetext ArnieNumberDeclinedText
	waitendtext

.Alan:
	farwritetext AlanNumberDeclinedText
	waitendtext

.Chad:
	farwritetext ChadNumberDeclinedText
	waitendtext

.Derek:
	farwritetext DerekNumberDeclinedText
	waitendtext

.Tully:
	farwritetext TullyNumberDeclinedText
	waitendtext

.Brent:
	farwritetext BrentNumberDeclinedText
	waitendtext

.Vance:
	farwritetext VanceNumberDeclinedText
	waitendtext

.Wilton:
	farwritetext WiltonNumberDeclinedText
	waitendtext

.Kenji:
	farwritetext KenjiNumberDeclinedText
	waitendtext

.Parry:
	farwritetext ParryNumberDeclinedText
	waitendtext

PhoneFullMScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_SCHOOLBOY_JACK, .Jack
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_FISHER_RALPH, .Ralph
;	ifequal PHONE_HIKER_ANTHONY, .Anthony
;	ifequal PHONE_CAMPER_TODD, .Todd
;	ifequal PHONE_JUGGLER_IRWIN, .Irwin
;	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_POKEMANIAC_BRENT, .Brent
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji
;	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackPhoneFullText
	waitendtext

.Huey:
	farwritetext HueyPhoneFullText
	waitendtext

.Gaven:
	farwritetext GavenPhoneFullText
	waitendtext

.Jose:
	farwritetext JosePhoneFullText
	waitendtext

.Joey:
	farwritetext JoeyPhoneFullText
	waitendtext

.Wade:
	farwritetext WadePhoneFullText
	waitendtext

.Ralph:
	farwritetext RalphPhoneFullText
	waitendtext

.Anthony:
	farwritetext AnthonyPhoneFullText
	waitendtext

.Todd:
	farwritetext ToddPhoneFullText
	waitendtext

.Irwin:
	farwritetext IrwinPhoneFullText
	waitendtext

.Arnie:
	farwritetext ArniePhoneFullText
	waitendtext

.Alan:
	farwritetext AlanPhoneFullText
	waitendtext

.Chad:
	farwritetext ChadPhoneFullText
	waitendtext

.Derek:
	farwritetext DerekPhoneFullText
	waitendtext

.Tully:
	farwritetext TullyPhoneFullText
	waitendtext

.Brent:
	farwritetext BrentPhoneFullText
	waitendtext

.Vance:
	farwritetext VancePhoneFullText
	waitendtext

.Wilton:
	farwritetext WiltonPhoneFullText
	waitendtext

.Kenji:
	farwritetext KenjiPhoneFullText
	waitendtext

.Parry:
	farwritetext ParryPhoneFullText
	waitendtext

RematchMScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_SCHOOLBOY_JACK, .Jack
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_FISHER_RALPH, .Ralph
;	ifequal PHONE_HIKER_ANTHONY, .Anthony
;	ifequal PHONE_CAMPER_TODD, .Todd
;	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_POKEMANIAC_BRENT, .Brent
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext JackRematchText
	waitendtext

.Huey:
	farwritetext HueyRematchText
	waitendtext

.Gaven:
	farwritetext GavenRematchText
	waitendtext

.Jose:
	farwritetext JoseRematchText
	waitendtext

.Joey:
	farwritetext JoeyRematchText
	waitendtext

.Wade:
	farwritetext WadeRematchText
	waitendtext

.Ralph:
	farwritetext RalphRematchText
	waitendtext

.Anthony:
	farwritetext AnthonyRematchText
	waitendtext

.Todd:
	farwritetext ToddRematchText
	waitendtext

.Arnie:
	farwritetext ArnieRematchText
	waitendtext

.Alan:
	farwritetext AlanRematchText
	waitendtext

.Chad:
	farwritetext ChadRematchText
	waitendtext

.Tully:
	farwritetext TullyRematchText
	waitendtext

.Brent:
	farwritetext BrentRematchText
	waitendtext

.Vance:
	farwritetext VanceRematchText
	waitendtext

.Wilton:
	farwritetext WiltonRematchText
	waitendtext

.Parry:
	farwritetext ParryRematchText
	waitendtext

GiftMScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji

.Jose:
	farwritetext JoseGiftText
	buttonsound
	end
.Wade:
	farwritetext WadeGiftText
	buttonsound
	end
.Alan:
	farwritetext AlanGiftText
	buttonsound
	end
.Derek:
	farwritetext DerekGiftText
	buttonsound
	end
.Tully:
	farwritetext TullyGiftText
	buttonsound
	end
.Wilton:
	farwritetext WiltonGiftText
	buttonsound
	end
.Kenji:
	farwritetext KenjiGiftText
	buttonsound
	end

PackFullMScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BUG_CATCHER_WADE, .Wade
;	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
;	ifequal PHONE_POKEFANM_DEREK, .Derek
;	ifequal PHONE_FISHER_TULLY, .Tully
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_FISHER_WILTON, .Wilton
;	ifequal PHONE_BLACKBELT_KENJI, .Kenji
;	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyPackFullText
	waitendtext

.Jose:
	farwritetext JosePackFullText
	waitendtext

.Joey:
	farwritetext JoeyPackFullText
	waitendtext

.Wade:
	farwritetext WadePackFullText
	waitendtext

.Alan:
	farwritetext AlanPackFullText
	waitendtext

.Derek:
	farwritetext DerekPackFullText
	waitendtext

.Tully:
	farwritetext TullyPackFullText
	waitendtext

.Vance:
	farwritetext VancePackFullText
	waitendtext

.Wilton:
	farwritetext WiltonPackFullText
	waitendtext

.Kenji:
	farwritetext KenjiPackFullText
	waitendtext

.Parry:
	farwritetext ParryPackFullText
	waitendtext

RematchGiftMScript:
	end
;	opentext
;	checkcode VAR_CALLERID
;	ifequal PHONE_SAILOR_HUEY, .Huey
;	ifequal PHONE_YOUNGSTER_JOEY, .Joey
;	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
;	ifequal PHONE_HIKER_PARRY, .Parry

.Huey:
	farwritetext HueyRematchGiftText
	buttonsound
	end
.Joey:
	farwritetext JoeyRematchGiftText
	buttonsound
	end
.Vance:
	farwritetext VanceRematchGiftText
	buttonsound
	end
.Parry:
	farwritetext ParryRematchGiftText
	buttonsound
	end

AskNumber1FScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_COOLTRAINERF_BETH, .Beth
;	ifequal PHONE_COOLTRAINERF_REENA, .Reena
;	ifequal PHONE_PICNICKER_LIZ, .Liz
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyAskNumber1Text
	end
.Beth:
	farwritetext BethAskNumber1Text
	end
.Reena:
	farwritetext ReenaAskNumber1Text
	end
.Liz:
	farwritetext LizAskNumber1Text
	end
.Gina:
	farwritetext GinaAskNumber1Text
	end
.Dana:
	farwritetext DanaAskNumber1Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber1Text
	end
.Erin:
	farwritetext ErinAskNumber1Text
	end

AskNumber2FScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_COOLTRAINERF_BETH, .Beth
;	ifequal PHONE_COOLTRAINERF_REENA, .Reena
;	ifequal PHONE_PICNICKER_LIZ, .Liz
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyAskNumber2Text
	end
.Beth:
	farwritetext BethAskNumber2Text
	end
.Reena:
	farwritetext ReenaAskNumber2Text
	end
.Liz:
	farwritetext LizAskNumber2Text
	end
.Gina:
	farwritetext GinaAskNumber2Text
	end
.Dana:
	farwritetext DanaAskNumber2Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber2Text
	end
.Erin:
	farwritetext ErinAskNumber2Text
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	end

NumberAcceptedFScript: ; 0xbcbd3
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_COOLTRAINERF_BETH, .Beth
;	ifequal PHONE_COOLTRAINERF_REENA, .Reena
;	ifequal PHONE_PICNICKER_LIZ, .Liz
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyNumberAcceptedText
	waitendtext

.Beth:
	farwritetext BethNumberAcceptedText
	waitendtext

.Reena:
	farwritetext ReenaNumberAcceptedText
	waitendtext

.Liz:
	farwritetext LizNumberAcceptedText
	waitendtext

.Gina:
	farwritetext GinaNumberAcceptedText
	waitendtext

.Dana:
	farwritetext DanaNumberAcceptedText
	waitendtext

.Tiffany:
	farwritetext TiffanyNumberAcceptedText
	waitendtext

.Erin:
	farwritetext ErinNumberAcceptedText
	waitendtext

NumberDeclinedFScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_COOLTRAINERF_BETH, .Beth
;	ifequal PHONE_COOLTRAINERF_REENA, .Reena
;	ifequal PHONE_PICNICKER_LIZ, .Liz
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyNumberDeclinedText
	waitendtext

.Beth:
	farwritetext BethNumberDeclinedText
	waitendtext

.Reena:
	farwritetext ReenaNumberDeclinedText
	waitendtext

.Liz:
	farwritetext LizNumberDeclinedText
	waitendtext

.Gina:
	farwritetext GinaNumberDeclinedText
	waitendtext

.Dana:
	farwritetext DanaNumberDeclinedText
	waitendtext

.Tiffany:
	farwritetext TiffanyNumberDeclinedText
	waitendtext

.Erin:
	farwritetext ErinNumberDeclinedText
	waitendtext

PhoneFullFScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_COOLTRAINERF_BETH, .Beth
;	ifequal PHONE_COOLTRAINERF_REENA, .Reena
;	ifequal PHONE_PICNICKER_LIZ, .Liz
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyPhoneFullText
	waitendtext

.Beth:
	farwritetext BethPhoneFullText
	waitendtext

.Reena:
	farwritetext ReenaPhoneFullText
	waitendtext

.Liz:
	farwritetext LizPhoneFullText
	waitendtext

.Gina:
	farwritetext GinaPhoneFullText
	waitendtext

.Dana:
	farwritetext DanaPhoneFullText
	waitendtext

.Tiffany:
	farwritetext TiffanyPhoneFullText
	waitendtext

.Erin:
	farwritetext ErinPhoneFullText
	waitendtext

RematchFScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_COOLTRAINERF_BETH, .Beth
;	ifequal PHONE_COOLTRAINERF_REENA, .Reena
;	ifequal PHONE_PICNICKER_LIZ, .Liz
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beth:
	farwritetext BethRematchText
	waitendtext

.Reena:
	farwritetext ReenaRematchText
	waitendtext

.Liz:
	farwritetext LizRematchText
	waitendtext

.Gina:
	farwritetext GinaRematchText
	waitendtext

.Dana:
	farwritetext DanaRematchText
	waitendtext

.Tiffany:
	farwritetext TiffanyRematchText
	waitendtext

.Erin:
	farwritetext ErinRematchText
	waitendtext

GiftFScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany

.Beverly:
	farwritetext BeverlyGiftText
	buttonsound
	end
.Gina:
	farwritetext GinaGiftText
	buttonsound
	end
.Dana:
	farwritetext DanaGiftText
	buttonsound
	end
.Tiffany:
	farwritetext TiffanyGiftText
	buttonsound
	end

PackFullFScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
;	ifequal PHONE_PICNICKER_GINA, .Gina
;	ifequal PHONE_LASS_DANA, .Dana
;	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext BeverlyPackFullText
	waitendtext

.Gina:
	farwritetext GinaPackFullText
	waitendtext

.Dana:
	farwritetext DanaPackFullText
	waitendtext

.Tiffany:
	farwritetext TiffanyPackFullText
	waitendtext

.Erin:
	farwritetext ErinPackFullText
	waitendtext

RematchGiftFScript:
	end
;	checkcode VAR_CALLERID
;	ifequal PHONE_PICNICKER_ERIN, .Erin

.Erin:
	opentext
	farwritetext ErinRematchGiftText
	buttonsound
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
	ifequal $3, .Lemonade
	endtext

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

.Lemonade:
	checkmoney $0, 350
	ifequal $2, .NotEnoughMoney
	giveitem LEMONADE
	iffalse .NotEnoughSpace
	takemoney $0, 350
	itemtotext LEMONADE, $0
	scall .VendItem
	random $20
	ifnotequal $0, .Start
	giveitem LEMONADE
	iffalse .Start
	itemtotext LEMONADE, $0
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
	db "LEMONADE     ¥350@"
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

_HiddenGrottoInitScript:
	callasm .StoreCurHiddenGrotto
	opentext
	farwritetext HiddenGrottoText
	yesorno
	end

.StoreCurHiddenGrotto:
	ld a, [wScriptVar]
	ld [wCurHiddenGrotto], a
	ret

_HiddenGrottoBackupMap:
	ld a, [wMapGroup]
	ld [wBackupMapGroup], a
	ld a, [wMapNumber]
	ld [wBackupMapNumber], a
	ret
