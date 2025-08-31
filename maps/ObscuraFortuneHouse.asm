ObscuraFortuneHouse_MapScriptHeader:
	db 0 ; scene scripts

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 7, 2, 5, OBSCURA_CITY
	warp_def 7, 3, 5, OBSCURA_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	person_event SPRITE_BREEDER, 4, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObscuraFortuneHouseTeller, -1
	tapeball_event  2,  2, MUSIC_TITLE, 1, EVENT_MUSIC_TITLE
	
ObscuraFortuneHouseTeller:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FORTUNE_TELLER
	iftrue .talked_once
	writetext ObscuraFortuneHouseTellerText1
	yesorno
	iffalse .no
	writetext ObscuraFortuneHouseTellerText2
	setevent EVENT_TALKED_TO_FORTUNE_TELLER
	jump .cont
.talked_once
	writetext ObscuraFortuneHouseTellerText3
	yesorno
	iffalse .no
	writetext ObscuraFortuneHouseTellerText2
.cont
	loadmenu .ObscuraFortuneHouseTellerMenuData
	verticalmenu
	closewindow
	if_equal $1, .tms
	if_equal $2, .tapes
	if_equal $3, .decos
	if_equal $4, .encounters
.tms
	closetext
	end
.tapes
	callasm ObscuraFortuneHouseTellerSetupTapesAsm
	waitbutton
	closetext
	end
.decos
	callasm ObscuraFortuneHouseTellerSetupDecosAsm
	waitbutton
	closetext
	end
.encounters
	callasm ObscuraFortuneHouseTellerSetupUniqueEncountersAsm
	waitbutton
	closetext
	end
.no
	closetext
	end

.ObscuraFortuneHouseTellerMenuData
	db $40 ; flags
	db 02, 00 ; start coords
	db 11, 19 ; end coords
	dw .MenuDataObscuraFortuneHouseTeller
	db 1 ; default option
; 0x48e04

.MenuDataObscuraFortuneHouseTeller: ; 0x48e04
	db $80 ; flags
	db 4 ; items
	db "TMs@"
	db "AUDIO CASSETTES@"
	db "ROOM DECOR@"
	db "UNIQUE ENCOUNTERS@"
	
ObscuraFortuneHouseTellerText1:
	text "Welcome to-<WAIT_S><LNBRK><LNBRK>Cough! Cough!"
	
	para "Aagh! Whew!"
	
	para "Uhhhhgh…"
	
	para "Sorry about that."
	
	para "Welcome to AUNTIE"
	line "ENIGMA'S DISCOUNT"
	cont "HOUSE 'O FORTUNES!"
	
	para "You see my ad on"
	line "ROUTE 22?"
	
	para "Ha!<WAIT_S> That baby pays"
	line "for itself,"
	cont "I swear!"
	
	para "Anyhoo, whatcha"
	line "need, kiddo?"
	
	para "Oh right, you want"
	line "your fortune told."
	
	para "I shoulda known"
	line "on account of me"
	cont "being psychic and"
	cont "all."
	
	para "Well, it'll cost"
	line "ya!"
	
	para "After tax, it'll"
	line "be ¥1500. Deal?"
	done
	
ObscuraFortuneHouseTellerText2:
	text "Well then,"
	line "what do you want"
	cont "to ask about?"
	done
	
ObscuraFortuneHouseTellerText3:
	text "Welcome to AUNTIE"
	line "ENIGMA'S DISCOUNT"
	cont "HOUSE 'O FORTUNES!"
	
	para "You want your"
	line "fortune told?"
	
	para "Well, it'll cost"
	line "ya!"
	
	para "After tax, it'll"
	line "be ¥1500. Deal?"
	done
	
ObscuraFortuneHouseTellerSetupTapesAsm:
	ld a, NUM_TAPE_PLAYER_SONGS
	ld [wCurBattleMon], a
	ld hl, TAPE_FLAGS_START
	jr ObscuraFortuneHouseTellerAsm

ObscuraFortuneHouseTellerSetupDecosAsm:
	ld a, 4 ;number of tracked decos + 1
	ld [wCurBattleMon], a
	ld hl, DECO_FLAGS_START
	jr ObscuraFortuneHouseTellerAsm
	
ObscuraFortuneHouseTellerSetupUniqueEncountersAsm:
	ld a, 34 ;number of unique encounters + 1
	ld [wCurBattleMon], a
	ld hl, UNIQUE_ENCOUNTER_FLAGS_START
; fallthru
ObscuraFortuneHouseTellerAsm:
	xor a
	ld c, a
	ld a, [wCurBattleMon]
	ld b, a
.loop
	inc c
	push bc
	ld a, c
	cp b
	jr z, .no_more
	xor a
	ld b, a
	push hl
	inc hl
	add hl, bc
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	pop bc
	jr nz, .loop
	
.loop2
	ld a, [wCurBattleMon]
	dec a
	call RandomRange
	ld [wCurTMHM], a
	ld c, a
	xor a
	ld b, a
	push hl
	inc hl
	add hl, bc
	ld e, l
	ld d, h
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	pop hl
	jr nz, .loop2
	ld a, [wCurBattleMon]
	cp 4 ;number of tracked decos + 1
	jr z, .decos
	cp NUM_TAPE_PLAYER_SONGS
	jr z, .tape
	cp 34 ;number of unique encounters + 1
	jr z, .unique_encounters
	
.no_more
	pop hl
	ld hl, NoMoreFortunesText
	jp PrintText
	
.tape
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	ld hl, TellerTapeText
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText
	
.decos
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	ld hl, TellerDecosText
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText
	
.unique_encounters
	ld a, [wCurTMHM]
	ld e, a
	ld d, 0
	ld hl, TellerUniqueEncounterText
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText

NoMoreFortunesText:
	text "NO MORE"
	done

TellerTapeText:
	dw Music_TitleScreenText
	dw Music_SunsetBayText
	dw Music_MomText
	dw Music_PokemonCenterText
	dw Music_RivalEncounterText
	dw Music_RivalBattleText
	dw Music_Route1Text
	dw Music_WildBattleText
	dw Music_WildPokemonVictoryText
	dw Music_DayBreakVillageText
	dw Music_Route2Text
	dw Music_YoungsterEncounterText
	dw Music_TrainerBattleText
	dw Music_TrainerVictoryText
	dw Music_DayBreakGrottoText
	dw Music_GlintCityText
	dw Music_GlintGroveText
	dw Music_GymText
	dw Music_GymBattleText
	dw Music_GymLeaderVictoryText
	dw Music_EvolutionText
	dw Music_LassEncounterText
	dw Music_SnareInvasionText
	dw Music_TeamSnareEncounterText
	dw Music_SnareBattleText
	dw Music_SnareVictoryText
	dw Music_EncounterGymLeaderText
	dw Music_StarglowValleyText
	dw Music_Route4Text
	dw Music_HikerEncounterText
	dw Music_LavaText
	dw Music_WildBossBattleText
	dw Music_SunbeamIslandText
	dw Music_GscGameCornerText
	dw Music_SpruceLabText
	dw Music_SnareThemeText
	dw Music_SnareAdminBattleText
	dw Music_EventideText
	dw Music_EventideVillageText
	dw Music_DodrioRaceText
	dw Music_FlickerStationText
	dw Music_PokemaniacEncounterText
	dw Music_Route10Text
	dw Music_TwinkleTownText
	dw Music_LusterSewerText
	dw Music_TrainText
	dw Music_LusterCityText
	dw Music_HardcoreEncounterText
	dw Music_MinibossBattleText
	dw Music_Route12Text
	dw Music_WaterRouteText
	dw Music_ShimmerCityText
	dw Music_BrilloTownText
	dw Music_OasisText
	dw Music_SnareLeaderBattleText
	dw Music_GentlemanEncounterText
	dw Music_BarText
	dw Music_DarknessText
	dw Music_AutumnText
	dw Music_DojoText
	dw Music_UnderwaterText
	dw Music_Route28Text
	dw Music_MinasThemeText
	dw Music_RBYWildBattleText
	dw Music_RivalBattle2Text
	dw Music_ErikaText
	dw Music_ObscuraText
	
 Music_TitleScreenText:
	text "TITLE SCREEN"
	done
	
 Music_SunsetBayText:
	text "SUNSET BAY"
	done
	
 Music_MomText:
	text "MOM"
	done
	
 Music_PokemonCenterText:
	text "#MON CENTER"
	done
	
 Music_RivalEncounterText:
 	text "RIVAL ENCOUNTER"
	done
	
 Music_RivalBattleText:
 	text "RIVAL BATTLE"
	done
	
 Music_Route1Text:
 	text "ROUTE 1"
	done
	
 Music_WildBattleText:
 	text "WILD BATTLE"
	done
	
 Music_WildPokemonVictoryText:
 	text "WILD VICTORY"
	done
	
 Music_DayBreakVillageText:
 	text "DAYBREAK VILLAGE"
	done
	
 Music_Route2Text:
 	text "ROUTE 2"
	done
	
 Music_YoungsterEncounterText:
 	text "YOUNGSTER"
	line "ENCOUNTER"
	done
	
 Music_TrainerBattleText:
 	text "TRAINER BATTLE"
	done
	
 Music_TrainerVictoryText:
 	text "TRAINER VICTORY"
	done
	
 Music_DayBreakGrottoText:
 	text "DAYBREAK GROTTO"
	done
	
 Music_GlintCityText:
 	text "GLINT CITY"
	done
	
 Music_GlintGroveText:
 	text "GLINT GROVE"
	done
	
 Music_GymText:
 	text "GYM"
	done
	
 Music_GymBattleText:
 	text "GYM BATTLE"
	done
	
 Music_GymLeaderVictoryText:
 	text "GYM VICTORY"
	done
	
 Music_EvolutionText:
 	text "EVOLUTION"
	done
	
 Music_LassEncounterText:
 	text "LASS ENCOUNTER"
	done
	
 Music_SnareInvasionText:
 	text "SNARE INVASION"
	done
	
 Music_TeamSnareEncounterText:
 	text "SNARE ENCOUNTER"
	done
	
 Music_SnareBattleText:
 	text "SNARE BATTLE"
	done
	
 Music_SnareVictoryText:
 	text "SNARE VICTORY"
	done
	
 Music_EncounterGymLeaderText:
 	text "GYM LEADER"
	line "ENCOUNTER"
	done
	
 Music_StarglowValleyText:
 	text "STARGLOW VALLEY"
	done
	
 Music_Route4Text:
 	text "ROUTE 4"
	done
	
 Music_HikerEncounterText:
 	text "HIKER ENCOUNTER"
	done
	
 Music_LavaText:
 	text "LAVA"
	done
	
 Music_WildBossBattleText:
 	text "WILD BOSS"
	done
	
 Music_SunbeamIslandText:
 	text "SUNBEAM ISLAND"
	done
	
 Music_GscGameCornerText:
 	text "GSC GAME CORNER"
	done
	
 Music_SpruceLabText:
 	text "SPRUCE LAB"
	done
	
 Music_SnareThemeText:
 	text "SNARE THEME"
	done
	
 Music_SnareAdminBattleText:
 	text "SNARE ADMIN"
	line "BATTLE"
	done
	
 Music_EventideText:
 	text "EVENTIDE FOREST"
	done
	
 Music_EventideVillageText:
 	text "EVENTIDE VILLAGE"
	done
	
 Music_DodrioRaceText:
 	text "DODRIO RACE"
	done
	
 Music_FlickerStationText:
 	text "FLICKER STATION"
	done
	
 Music_PokemaniacEncounterText:
 	text "#MANIAC"
	line "ENCOUNTER"
	done
	
 Music_Route10Text:
 	text "ROUTE 10"
	done
	
 Music_TwinkleTownText:
 	text "TWINKLE TOWN"
	done
	
 Music_LusterSewerText:
 	text "LUSTER SEWER"
	done
	
 Music_TrainText:
 	text "TRAIN"
	done
	
 Music_LusterCityText:
 	text "LUSTER CITY"
	done
	
 Music_HardcoreEncounterText:
 	text "HARDCORE ENCOUNTER"
	done
	
 Music_MinibossBattleText:
 	text "MINIBOSS TRAINER"
	done
	
 Music_Route12Text:
 	text "ROUTE 12"
	done
	
 Music_WaterRouteText:
 	text "WATER ROUTES"
	done
	
 Music_ShimmerCityText:
 	text "SHIMMER CITY"
	done
	
 Music_BrilloTownText:
 	text "BRILLO TOWN"
	done
	
 Music_OasisText:
 	text "OASIS"
	done
	
 Music_SnareLeaderBattleText:
 	text "SNARE LEADER"
	line "BATTLE"
	done
	
 Music_GentlemanEncounterText:
 	text "GENTLEMAN"
	line "ENCOUNTER"
	done
	
 Music_BarText:
 	text "MOOMOOS"
	done
	
 Music_DarknessText:
 	text "DARKNESS"
	done
	
 Music_AutumnText:
 	text "AUTUMN"
	done
	
 Music_DojoText:
 	text "DOJO"
	done
	
 Music_UnderwaterText:
 	text "UNDERWATER"
	done
	
 Music_Route28Text:
 	text "ROUTE 28"
	done
	
 Music_MinasThemeText:
 	text "MINAS THEME"
	done
	
 Music_RBYWildBattleText:
 	text "LEGENDARY BIRDS"
	done
	
 Music_RivalBattle2Text:
 	text "RIVAL BATTLE 2"
	done
	
 Music_ErikaText:
 	text "RADIANT TOWN"
	done
	
 Music_ObscuraText:
	text "OBSCURA CITY"
	done
	
TellerDecosText:
	dw MareepDollText
	dw GirafarigDollText
	
MareepDollText:
	text "MAREEP DOLL"
	done
	
GirafarigDollText:
	text "GIRAFARIG DOLL"
	done
	
TellerUniqueEncounterText:
	dw UniqueEncounterTeacherText
	dw UniqueEncounterMinaGlintGroveText
	dw UniqueEncounterLedianBossText
	dw UniqueEncounterDisguiseMasterMtOnwaText
	dw UniqueEncounterMagmarBossText
	dw UniqueEncounterElectabuzzBossText
	dw UniqueEncounterSudowoodoBossText
	dw UniqueEncounterSpiritombBossText
	dw UniqueEncounterMamoswineBossText
	dw UniqueEncounterMinaJournalText
	dw UniqueEncounterMinaRoute6Text
	dw UniqueEncounterMinaRoute11Text
	dw UniqueEncounterMinaRadiantFieldText
	dw UniqueEncounterMinaRoute29Text
	dw UniqueEncounterMinaRoute10Text
	dw UniqueEncounterMallCopText
	dw UniqueEncounterDisguiseMasterLusterSewerText
	dw UniqueEncounterFrankieText
	dw UniqueEncounterMukBossText
	dw UniqueEncounterPorygonBossText
	dw UniqueEncounterPatchesText
	dw UniqueEncounterDisguiseMasterHuntersThicketText
	dw UniqueEncounterLedianRangerText
	dw UniqueEncounterClefableBossText
	dw UniqueEncounterLaprasBossText
	dw UniqueEncounterDrakloakBossText
	dw UniqueEncounterDisguiseMasterRoute18Text
	dw UniqueEncounterVolcaronaBossText
	dw UniqueEncounterCursolaBossText
	dw UniqueEncounterErikaText
	dw UniqueEncounterMimikyuBossText
	dw UniqueEncounterDittoBossText
	dw UniqueEncounterNoivernBossText
	
UniqueEncounterTeacherText:
	text "TEACHER"
	done
	
UniqueEncounterMinaGlintGroveText:
	text "MINA"
	line "GLINT GROVE"
	done
	
UniqueEncounterLedianBossText:
	text "LEDIAN BOSS"
	done
	
UniqueEncounterDisguiseMasterMtOnwaText:
	text "DISGUISE MASTER"
	line "MT OWNA"
	done
	
UniqueEncounterMagmarBossText:
	text "MAGMAR BOSS"
	done
	
UniqueEncounterElectabuzzBossText:
	text "ELECTABUZZ BOSS"
	done
	
UniqueEncounterSudowoodoBossText:
	text "SUDOWOODO BOSS"
	done
	
UniqueEncounterSpiritombBossText:
	text "SPIRITOMB BOSS"
	done
	
UniqueEncounterMamoswineBossText:
	text "MAMOSWINE BOSS"
	done
	
UniqueEncounterMinaJournalText:
	text "MINA"
	line "JOURNAL"
	done
	
UniqueEncounterMinaRoute6Text:
	text "MINA"
	line "ROUTE 6"
	done
	
UniqueEncounterMinaRoute11Text:
	text "MINA"
	line "ROUTE 11"
	done
	
UniqueEncounterMinaRadiantFieldText:
	text "MINA"
	line "RADIANT FIELD"
	done
	
UniqueEncounterMinaRoute29Text:
	text "MINA"
	line "ROUTE 29"
	done
	
UniqueEncounterMinaRoute10Text:
	text "MINA"
	line "ROUTE 10"
	done
	
UniqueEncounterMallCopText:
	text "MALL COP"
	done
	
UniqueEncounterDisguiseMasterLusterSewerText:
	text "DISGUISE MASTER"
	line "LUSTER SEWER"
	done
	
UniqueEncounterFrankieText:
	text "FRANKIE"
	done
	
UniqueEncounterMukBossText:
	text "MUK BOSS"
	done
	
UniqueEncounterPorygonBossText:
	text "PORYGON BOSS"
	done
	
UniqueEncounterPatchesText:
	text "PATCHES"
	done
	
UniqueEncounterDisguiseMasterHuntersThicketText:
	text "DISGUISE MASTER"
	line "HUNTERS THICKET"
	done
	
UniqueEncounterLedianRangerText:
	text "LEDIAN RANGER"
	done
	
UniqueEncounterClefableBossText:
	text "CLEFABLE BOSS"
	done
	
UniqueEncounterLaprasBossText:
	text "LAPRAS BOSS"
	done
	
UniqueEncounterDrakloakBossText:
	text "DRAKLOAK BOSS"
	done
	
UniqueEncounterDisguiseMasterRoute18Text:
	text "DISGUISE MASTER"
	line "ROUTE 18"
	done
	
UniqueEncounterVolcaronaBossText:
	text "VOLCARONA BOSS"
	done
	
UniqueEncounterCursolaBossText:
	text "CURSOLA BOSS"
	done
	
UniqueEncounterErikaText:
	text "ERIKA"
	done
	
UniqueEncounterMimikyuBossText:
	text "MIMIKYU BOSS"
	done
	
UniqueEncounterDittoBossText:
	text "DITTO BOSS"
	done
	
UniqueEncounterNoivernBossText:
	text "NOIVERN BOSS"
	done
