LusterCityResidential_MapScriptHeader:
	db 2 ; scene scripts
	scene_script LusterCityResidentialTrigger0
	scene_script LusterCityResidentialTrigger1

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, ResidentialCallback

	db 11 ; warp events
	warp_def 20, 12, 1, LUSTER_SEWERS_B1F
	warp_def 25, 11, 1, LUSTER_MART
	warp_def 25, 17, 1, LUSTER_POKECENTER
	warp_def 24,  7, 1, LUSTER_APARTMENT_1_1F
	warp_def 34, 11, 1, LUSTER_APARTMENT_2_1F
	warp_def 44, 11, 1, LUSTER_APARTMENT_3_1F
	warp_def 44,  6, 1, LUSTER_APARTMENT_4_1F
	warp_def 34, 17, 1, LUSTER_APARTMENT_5_1F
	warp_def 44, 17, 1, LUSTER_APARTMENT_6_1F
	warp_def 55, 22, 1, ROUTE_11_GATE
	warp_def 55, 23, 2, ROUTE_11_GATE

	db 18 ; coord events
	xy_trigger 0, 41, 21, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 0, 33,  5, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 0, 21, 24, 0, LusterCityResidentialLight, 0, 0
	xy_trigger 1, 20, 24, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 21, 23, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 22, 24, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 32,  5, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 33,  6, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 34,  5, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 40, 21, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 41, 22, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 42, 21, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 43, 21, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 39, 21, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 23, 24, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 19, 24, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 31,  5, 0, LusterCityResidentialDark, 0, 0
	xy_trigger 1, 35,  5, 0, LusterCityResidentialDark, 0, 0

	db 11 ; bg events
	signpost 18, 13, SIGNPOST_READ, LusterTrashcan1
	signpost 18, 14, SIGNPOST_READ, LusterTrashcan2
	signpost 35, 14, SIGNPOST_READ, LusterTrashcan3
	signpost 35, 20, SIGNPOST_READ, LusterTrashcan4
	signpost 45, 14, SIGNPOST_READ, LusterTrashcan5
	signpost 45, 20, SIGNPOST_READ, LusterTrashcan6
	signpost 45,  9, SIGNPOST_READ, LusterTrashcan7
	signpost 12, 27, SIGNPOST_READ, LusterSign1
	signpost 15, 23, SIGNPOST_READ, LusterSign2
	signpost 53, 21, SIGNPOST_READ, LusterSign3
	signpost 34, 11, SIGNPOST_READ, LusterEmptyApartment

	db 20 ; object events
	person_event SPRITE_TRAFFIC_LIGHT, 44, 25, SPRITEMOVEDATA_TILE_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_TRAFFIC_LIGHT, 24, 20, SPRITEMOVEDATA_TILE_UP, 1, 1, -1, -1, (1 << 3) | PAL_OW_SILVER, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_FAT_GUY, 39,  6, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC1, -1
	person_event SPRITE_COOLTRAINER_F, 29, 12, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster1NPC2, -1
	person_event SPRITE_BIRD_KEEPER, 30, 24, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Luster1NPC3, -1
	person_event SPRITE_YOUNGSTER, 25, 15, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster1NPC4, -1
	person_event SPRITE_COOLTRAINER_F, 33, 21, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, Luster1NPC5, -1
	person_event SPRITE_YOUNGSTER, 39, 16, SPRITEMOVEDATA_WANDER, 0, 2, -1, -1, (1 << 3) | PAL_OW_TEAL, PERSONTYPE_SCRIPT, 0, Luster1NPC6, -1
	person_event SPRITE_LASS, 26, 19, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster1NPC7, -1
	person_event SPRITE_SCHOOLGIRL, 47,  8, SPRITEMOVEDATA_WANDER, 2, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Luster1NPC8, -1
	person_event SPRITE_YOUNGSTER, 51, 21, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, Luster1NPC9, -1
	object_event 14, 44, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, MEOWTH, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC10, -1
	object_event 14, 25, SPRITE_MON_ICON, SPRITEMOVEDATA_POKEMON, 0, PIKACHU, -1, -1, PAL_NPC_BROWN, PERSONTYPE_SCRIPT, 0, Luster1NPC11, -1
	person_event SPRITE_GENTLEMAN,  9, 22, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster1NPC12, -1
	person_event SPRITE_CUTE_GIRL, 26,  5, SPRITEMOVEDATA_WANDER, 1, 0, -1, -1, (1 << 3) | PAL_OW_PINK, PERSONTYPE_SCRIPT, 0, Luster1NPC13, -1
	person_event SPRITE_POKEMANIAC, 49, 13, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, Luster1NPC14, -1
	person_event SPRITE_NIDOKING_LEADER, 20, 13, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterPunkLeader, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_NIDOKING_F, 21, 13, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterPunk1, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_NIDOKING_M, 19, 13, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_PURPLE, PERSONTYPE_SCRIPT, 0, LusterPunk2, EVENT_HELPED_NIDOKINGS
	person_event SPRITE_BURGLAR, 44,  9, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, LusterShadyGuy, -1


	const_def 1 ; object constants
	const LUSTER1STREETLIGHT1
	const LUSTER1STREETLIGHT2
	const LUSTER1NPC1
	const LUSTER1NPC2
	const LUSTER1NPC3
	const LUSTER1NPC4
	const LUSTER1NPC5
	const LUSTER1NPC6
	const LUSTER1NPC7
	const LUSTER1NPC8
	const LUSTER1NPC9
	const LUSTER1NPC10
	const LUSTER1NPC11
	const LUSTER1NPC12
	const LUSTER1NPC13
	const LUSTER1NPC14
	const LUSTERPUNKLEADER
	const LUSTERPUNK1
	const LUSTERPUNK2
	const LUSTERSHADYGUY
	
LusterCityResidentialTrigger0:
	checkflag ENGINE_STREETLIGHTS
	iftrue .checkmorn
	checktime 1<<NITE
	iffalse .end
	changeblock $18, $14, $84
	changeblock $4, $20, $85
	changeblock $14, $28, $85
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm LusterCityStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.checkmorn
	checktime 1<<MORN
	iffalse .end
	changeblock $18, $14, $80
	changeblock $4, $20, $81
	changeblock $14, $28, $81
	setflag ENGINE_STREETLIGHTS
	callasm GenericFinishBridge
	callasm LusterCityStreetlightPaletteUpdateThingMoreWordsExtraLongStyle
	end
.end
	end
	
LusterCityResidentialTrigger1:
	end
	
LusterCityStreetlightPaletteUpdateThingMoreWordsExtraLongStyle:
	farcall CheckCurrentMapXYTriggers
	ret nc
	ld hl, wCurCoordEventScriptAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapScriptHeaderBank]
	farjp CallScript
	
	
ResidentialCallback:
	checktime 1<<NITE
	iffalse .notnite
	changeblock $18, $14, $84
	changeblock $4, $20, $85
	changeblock $14, $28, $85
.notnite
	checkevent EVENT_DOUBLE_LANDMARK_SIGN
	iffalse .cont
	domaptrigger LUSTER_CITY_SHOPPING, $0
	setevent EVENT_IN_RESIDENTIAL_DISTRICT
	clearevent EVENT_IN_SHOPPING_DISTRICT
	clearevent EVENT_IN_BUSINESS_DISTRICT

.cont
	checkevent EVENT_LUSTER_TRASHCAN_1
	iftrue .OpenSesame1
.cont1
	checkevent EVENT_LUSTER_TRASHCAN_2
	iftrue .OpenSesame2
.cont2
	checkevent EVENT_LUSTER_TRASHCAN_3
	iftrue .OpenSesame3
.cont3
	checkevent EVENT_LUSTER_TRASHCAN_4
	iftrue .OpenSesame4
.cont4
	checkevent EVENT_LUSTER_TRASHCAN_5
	iftrue .OpenSesame5
.cont5
	checkevent EVENT_LUSTER_TRASHCAN_6
	iftrue .OpenSesame6
.cont6
	checkevent EVENT_LUSTER_TRASHCAN_7
	iftrue .OpenSesame7
.cont7
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .OpenSesameSewer
	return

.OpenSesame1:
	changeblock $c, $12, $52
	jump .cont1

.OpenSesame2:
	changeblock $e, $12, $53
	jump .cont2
	
.OpenSesame3:
	changeblock $e, $22, $4d
	jump .cont3
	
.OpenSesame4:
	changeblock $14, $22, $4c
	jump .cont4
	
.OpenSesame5:
	changeblock $e, $2c, $4d
	jump .cont5
	
.OpenSesame6:
	changeblock $14, $2c, $4c
	jump .cont6

.OpenSesame7:
	changeblock $8, $2c, $58
	jump .cont7
	
.OpenSesameSewer:
	checkevent EVENT_CLEARED_LUSTER_SEWERS
	iftrue .movepunks2
	moveperson LUSTERPUNKLEADER, $10, $14
	moveperson LUSTERPUNK2, $10, $13
	moveperson LUSTERPUNK1, $10, $15
.openmanhole
	changeblock $c, $14, $5a
	return
.movepunks2
	moveperson LUSTERPUNKLEADER, $e, $14
	moveperson LUSTERPUNK2, $e, $13
	moveperson LUSTERPUNK1, $e, $15
	jump .openmanhole
	
LusterCityResidentialLight:
	checktime 1<<NITE
	iffalse .notnite
	setflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $1
.notnite
	end
	
LusterCityResidentialDark:
	clearflag ENGINE_NEAR_CAMPFIRE
	special Special_UpdatePalsInstant
	dotrigger $0
	end

LusterSign1:
	jumptext LusterSign1Text
	
LusterSign2:
	jumptext LusterSign2Text
	
LusterSign3:
	jumptext LusterSign3Text
	
LusterEmptyApartment:
	jumptext LusterEmptyApartmentText
	
Luster1NPC1:
	jumptextfaceplayer Luster1NPC1Text
		
Luster1NPC2:
	jumptextfaceplayer Luster1NPC2Text
	
Luster1NPC3:
	jumptextfaceplayer Luster1NPC3Text
	
Luster1NPC4:
	jumptextfaceplayer Luster1NPC4Text
		
Luster1NPC5:
	jumptextfaceplayer Luster1NPC5Text
	
Luster1NPC6:
	jumptextfaceplayer Luster1NPC6Text
	
Luster1NPC7:
	jumptextfaceplayer Luster1NPC7Text
	
Luster1NPC8:
	jumptextfaceplayer Luster1NPC8Text
	
Luster1NPC9:
	jumptextfaceplayer Luster1NPC9Text
		
Luster1NPC10:
	opentext
	writetext Luster1NPC10Text
	cry MEOWTH
	waitbutton
	closetext
	end
	
Luster1NPC11:
	opentext
	writetext Luster1NPC11Text
	cry PIKACHU
	waitbutton
	closetext
	end
	
Luster1NPC12:
	faceplayer
	opentext
	writetext Luster1NPC12Text
	waitbutton
	closetext
	spriteface LUSTER1NPC12, DOWN
	end
	
Luster1NPC13:
	jumptextfaceplayer Luster1NPC13Text
	
Luster1NPC14:
	jumptextfaceplayer Luster1NPC14Text
	
LusterTrashcan1:
	checkevent EVENT_LUSTER_TRASHCAN_1
	iftrue LusterTrashcanOnlyTrash
	changeblock $c, $12, $52
	setevent EVENT_LUSTER_TRASHCAN_1
	jump LusterTrashcanEnd
	
LusterTrashcan2:
	checkevent EVENT_LUSTER_TRASHCAN_2
	iftrue LusterTrashcanOnlyTrash
	changeblock $e, $12, $53
	setevent EVENT_LUSTER_TRASHCAN_2
	jump LusterTrashcanEnd
	
LusterTrashcan3:
	checkevent EVENT_LUSTER_TRASHCAN_3
	iftrue LusterTrashcanOnlyTrash
	changeblock $e, $22, $4d
	setevent EVENT_LUSTER_TRASHCAN_3
	jump LusterTrashcanEnd
	
LusterTrashcan4:
	checkevent EVENT_LUSTER_TRASHCAN_4
	iftrue LusterTrashcanOnlyTrash
	changeblock $14, $22, $4c
	setevent EVENT_LUSTER_TRASHCAN_4
	jump LusterTrashcanEnd
	
LusterTrashcan5:
	checkevent EVENT_LUSTER_TRASHCAN_5
	iftrue LusterTrashcanOnlyTrash
	changeblock $e, $2c, $4d
	setevent EVENT_LUSTER_TRASHCAN_5
	jump LusterTrashcanEnd
	
LusterTrashcan6:
	checkevent EVENT_LUSTER_TRASHCAN_6
	iftrue LusterTrashcanOnlyTrash
	changeblock $14, $2c, $4c
	setevent EVENT_LUSTER_TRASHCAN_6
	jump LusterTrashcanEnd
	
LusterTrashcan7:
	checkevent EVENT_LUSTER_TRASHCAN_7
	iftrue LusterTrashcanOnlyTrash
	changeblock $8, $2c, $58
	setevent EVENT_LUSTER_TRASHCAN_7
;fallthrough
	
LusterTrashcanEnd:
	opentext
	writetext LusterTrashcanText1
	playsound SFX_SANDSTORM
	waitsfx
	buttonsound
	callasm LusterTrashcanAsm
	closetext
	end
	
LusterTrashcanEmpty:
	jumptext LusterTrashcanTextEmpty
	
LusterTrashcanOnlyTrash:
	jumptext LusterTrashcanTextOnlyTrash
	
LusterPunkLeader:
	checkevent EVENT_CLEARED_LUSTER_SEWERS
	iftrue .clearedsewers
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .gogetpackage
	checkitem THE_THING
	iftrue .takethething
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .speechloop
	opentext
	writetext LusterPunkLeaderText1
	waitbutton
	closetext
	pause 10
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNKLEADER, 15
	pause 7
	faceplayer
	opentext
	writetext LusterPunkLeaderText4
	waitbutton
	closetext
	applyonemovement PLAYER, fix_facing
	follow PLAYER, LUSTERPUNKLEADER
	applyonemovement PLAYER, step_right
	stopfollow
	applyonemovement PLAYER, remove_fixed_facing
	pause 10
	spriteface LUSTERPUNK1, RIGHT
	applyonemovement LUSTERPUNK1, step_right
	opentext
	writetext LusterPunk1Text2
	waitbutton
	closetext
	pause 10
	spriteface LUSTERPUNK2, RIGHT
	applyonemovement LUSTERPUNK2, step_right
	opentext
	writetext LusterPunk2Text2
	waitbutton
	closetext
	pause 25
	spriteface LUSTERPUNK1, UP
	opentext
	writetext LusterPunk1Text3
	waitbutton
	closetext
	pause 15
	spriteface LUSTERPUNK2, DOWN
	opentext
	writetext LusterPunk2Text3
	waitbutton
	closetext
	pause 15
	spriteface LUSTERPUNKLEADER, LEFT
	opentext
	writetext LusterPunkLeaderText5
	waitbutton
	closetext
	pause 50
	spriteface LUSTERPUNKLEADER, RIGHT
	pause 10
	spriteface LUSTERPUNK1, RIGHT
	spriteface LUSTERPUNK2, RIGHT
	opentext
	writetext LusterPunkLeaderText6
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERPUNKLEADER, step_left
	pause 10
	spriteface LUSTERPUNK2, DOWN
	opentext
	writetext LusterPunk2Text4
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERPUNK2, step_left
	spriteface LUSTERPUNK2, DOWN
	spriteface LUSTERPUNK1, UP
	opentext
	writetext LusterPunk1Text4
	waitbutton
	closetext
	pause 10
	applyonemovement LUSTERPUNK1, step_left
	spriteface LUSTERPUNK1, UP
	setevent EVENT_CAN_GET_THE_THING
	end
.gogetpackage
	faceplayer
	opentext
	writetext LusterPunkLeaderText7
	waitbutton
	closetext
	spriteface LUSTERPUNKLEADER, LEFT
	end
.takethething
	faceplayer
	opentext
	writetext LusterPunkLeaderText2
	waitbutton
	writetext LusterPunkLeaderTextGiveThing
	playsound SFX_LEVEL_UP 
	waitsfx
	closetext
	pause 10
	spriteface LUSTERPUNKLEADER, LEFT
	opentext
	writetext LusterPunkLeaderText8
	waitbutton
	closetext
	pause 30
	spriteface LUSTERPUNKLEADER, RIGHT
	pause 10
	opentext
	writetext LusterPunkLeaderText9
	waitbutton
	closetext
	applyonemovement LUSTERPUNK2, step_right
	spriteface LUSTERPUNK2, DOWN
	spriteface PLAYER, UP
	opentext
	writetext LusterPunkLeaderText9_2
	waitbutton
	closetext
	applyonemovement LUSTERPUNK1, step_right
	spriteface LUSTERPUNK1, UP
	spriteface PLAYER, DOWN
	opentext
	writetext LusterPunkLeaderText9_3
	waitbutton
	closetext
	spriteface PLAYER, LEFT
	applyonemovement LUSTERPUNKLEADER, turn_step_right
	opentext
	writetext LusterPunkLeaderText9_4
.yesnoloop
	yesorno
	iffalse .saidno
	writetext LusterPunkLeaderTextYes
	waitbutton
	closetext
	pause 10
	
	special FadeOutPalettesBlack
	applyonemovement PLAYER, step_right
	disappear LUSTERPUNKLEADER
	disappear LUSTERPUNK2
	disappear LUSTERPUNK1
	moveperson LUSTERPUNKLEADER, $10, $14
	moveperson LUSTERPUNK2, $10, $13
	moveperson LUSTERPUNK1, $10, $15
	appear LUSTERPUNKLEADER
	appear LUSTERPUNK2
	appear LUSTERPUNK1
	changeblock $c, $14, $5a
	closetext
	takeitem THE_THING
	setevent EVENT_LUSTER_SEWER_OPEN
	spriteface LUSTERPUNKLEADER, LEFT
	spriteface PLAYER, RIGHT
	pause 10
	opentext
	writetext LusterPunkLeaderTextOpen1
	playsound SFX_SANDSTORM
	waitsfx
	pause 20
	writetext LusterPunkLeaderTextOpen2
	playsound SFX_SLUDGE_BOMB
	waitsfx
	closetext
	pause 20
	special FadeInTextboxPalettes
	pause 10
	jumptext LusterPunkLeaderText10
.speechloop
	jumptextfaceplayer LusterPunkLeaderText3
.saidno
	writetext LusterPunkLeaderTextNo
	jump .yesnoloop
.clearedsewers
	checkcode VAR_FACING
	if_equal LEFT, .clearedsewersright
	applymovement LUSTERPUNKLEADER, Movement_LusterResidentialPunkLeader1
	pause 5
	opentext
	writetext LusterPunkLeaderText11
	waitbutton
	closetext
	applymovement LUSTERPUNK2, Movement_LusterResidentialPunks1
	spriteface LUSTERPUNK2, DOWN
	opentext
	writetext LusterPunk2Text8
	waitbutton
	closetext
	applymovement LUSTERPUNK1, Movement_LusterResidentialPunks1
	spriteface LUSTERPUNK1, UP
	opentext
	writetext LusterPunk1Text8
	yesorno
	iffalse .saidno2
.clearedsewersreturn
	closetext
	pause 5
	playmusic MUSIC_NONE
	spriteface LUSTERPUNKLEADER, RIGHT
	pause 48
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	pause 20
	applymovement LUSTERPUNKLEADER, Movement_LusterResidentialPunkLeader2
	pause 20
	spriteface LUSTERPUNKLEADER, LEFT
	jump .clearedsewersfinish
.clearedsewersright
	applymovement LUSTERPUNKLEADER, Movement_LusterResidentialPunkLeader2
	pause 5
	opentext
	writetext LusterPunkLeaderText11
	waitbutton
	closetext
	applymovement LUSTERPUNK2, Movement_LusterResidentialPunks2
	spriteface LUSTERPUNK2, DOWN
	opentext
	writetext LusterPunk2Text8
	waitbutton
	closetext
	applymovement LUSTERPUNK1, Movement_LusterResidentialPunks2
	spriteface LUSTERPUNK1, UP
	opentext
	writetext LusterPunk1Text8
	yesorno
	iffalse .saidno2
.clearedsewersrightreturn
	closetext
	pause 5
	playmusic MUSIC_NONE
	spriteface LUSTERPUNKLEADER, LEFT
	pause 48
	playmusic MUSIC_ENCOUNTER_GYM_LEADER
	pause 20
	applymovement LUSTERPUNKLEADER, Movement_LusterResidentialPunkLeader1
	pause 20
	spriteface LUSTERPUNKLEADER, RIGHT
.clearedsewersfinish
	opentext
	writetext LusterPunkLeaderText12
	waitbutton
	verbosegiveitem SKATEBOARD
	writetext LusterPunkLeaderText13
	waitbutton
	closetext
	pause 10
	special FadeOutPalettesBlack
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear LUSTERPUNKLEADER
	disappear LUSTERPUNK1
	disappear LUSTERPUNK2
	pause 10
	special FadeInTextboxPalettes
	playmusic MUSIC_LUSTER_CITY
	setevent EVENT_HELPED_NIDOKINGS
	clearevent EVENT_LUSTER_PUNKS_NOT_IN_APARTMENT
	end
.saidno2
	writetext LusterPunk1Text14
	yesorno
	iffalse .saidno2
	checkcode VAR_FACING
	if_equal LEFT, .clearedsewersrightreturn
	jump .clearedsewersreturn
	
LusterPunk1:
	checkevent EVENT_CLEARED_LUSTER_SEWERS
	iftrue .clearedsewers
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .gogetpackage
	checkitem THE_THING
	iftrue .havethething
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .speechloop
	opentext
	writetext LusterPunk1Text1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNK1, 15
	pause 7
	faceplayer
	opentext
	writetext LusterPunk1Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK1, LEFT
	end
.gogetpackage
	faceplayer
	opentext
	writetext LusterPunk1Text5
	waitbutton
	closetext
	spriteface LUSTERPUNK1, UP
	end
.havethething
	faceplayer
	opentext
	writetext LusterPunk1Text6
	waitbutton
	closetext
	spriteface LUSTERPUNK1, UP
	end
.speechloop
	jumptextfaceplayer LusterPunk1Text7
.clearedsewers
	jumptextfaceplayer LusterPunk1Text9
	
LusterPunk2:
	checkevent EVENT_CLEARED_LUSTER_SEWERS
	iftrue .clearedsewers
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .gogetpackage
	checkitem THE_THING
	iftrue .havethething
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .speechloop
	opentext
	writetext LusterPunk2Text1
	waitbutton
	closetext
	playsound SFX_PAY_DAY
	showemote EMOTE_SHOCK, LUSTERPUNK2, 15
	pause 7
	faceplayer
	opentext
	writetext LusterPunk2Text2
	waitbutton
	closetext
	spriteface LUSTERPUNK2, LEFT
	end
.gogetpackage
	faceplayer
	opentext
	writetext LusterPunk2Text5
	waitbutton
	closetext
	spriteface LUSTERPUNK2, DOWN
	end
.havethething
	faceplayer
	opentext
	writetext LusterPunk2Text6
	waitbutton
	closetext
	spriteface LUSTERPUNK2, DOWN
	end
.speechloop
	jumptextfaceplayer LusterPunk2Text7
.clearedsewers
	jumptextfaceplayer LusterPunk2Text9
	
LusterShadyGuy:
	checkevent EVENT_LUSTER_SEWER_OPEN
	iftrue .seweropen
	checkevent EVENT_GOT_THE_THING
	iftrue .alreadygotpackage
	checkevent EVENT_CAN_GET_THE_THING
	iftrue .getpackage
	faceplayer
	opentext
	writetext LusterShadyGuyText1
	waitbutton
	closetext
	spriteface LUSTERSHADYGUY, LEFT
	end
.getpackage
	faceplayer
	opentext
	writetext LusterShadyGuyText2
	waitbutton
	verbosegiveitem THE_THING
	writetext LusterShadyGuyText3
	waitbutton
	closetext
	setevent EVENT_GOT_THE_THING
	clearevent EVENT_CAN_GET_THE_THING
	spriteface LUSTERSHADYGUY, LEFT
	end
.alreadygotpackage
	faceplayer
	opentext
	writetext LusterShadyGuyText3
	waitbutton
	closetext
	spriteface LUSTERSHADYGUY, LEFT
	end
.seweropen
	faceplayer
	opentext
	writetext LusterShadyGuyText4
	waitbutton
	closetext
	spriteface LUSTERSHADYGUY, LEFT
	end
	
LusterTrashcanAsm:
	call Random
	cp 1 + 33 percent
	jr c, LusterTrashcanAsmBattle
	call Random
	cp 1 + 33 percent
	jr c, LusterTrashcanAsmItem
	jr LusterTrashcanAsmText
	ret
	
LusterTrashcanAsmBattle:
	farcall TrashMonEncounter
	ld a, BANK(LusterTrashcanWildBattleScript)
	ld hl, LusterTrashcanWildBattleScript
	call CallScript
	scf
	ret

	
LusterTrashcanAsmItem:
	ld hl, .TrashcanItems
	call Random
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	jr .loop
.ok
	ld a, [hli]
	cp -1
	ld a, NO_ITEM
	jr z, .done
	ld a, [hl]
.done
	ld [wScriptVar], a
	
	ld b, BANK(LusterTrashcanItemScript)
	ld de, LusterTrashcanItemScript
	push de
	ld hl, wScriptStackSize
	ld e, [hl]
	inc [hl]
	ld d, $0
	ld hl, wScriptStack
	add hl, de
	add hl, de
	add hl, de
	pop de
	ld a, [wScriptBank]
	ld [hli], a
	ld a, [wScriptPos]
	ld [hli], a
	ld a, [wScriptPos + 1]
	ld [hl], a
	ld a, b
	ld [wScriptBank], a
	ld a, e
	ld [wScriptPos], a
	ld a, d
	ld [wScriptPos + 1], a
	ret

.TrashcanItems:
	db 2, MASTER_BALL
	db 5, BIG_NUGGET
	db 18, STAR_PIECE
	db 18, LEFTOVERS
	db 25, NUGGET
	db 36, BLACK_SLUDGE
	db 47, STARDUST
	db 52, SUPER_REPEL
	db 52, SUPER_POTION
	db -1

LusterTrashcanItemScript:
	verbosegiveitem ITEM_FROM_MEM
	closetext
	end
	
LusterTrashcanAsmText:
	ld hl, LusterTrashcanTextJump1
	call PrintText
	ret
	
LusterTrashcanWildBattleScript:
	copybytetovar wTempWildMonSpecies
	randomwildmon
	startbattle
	reloadmapafterbattle
	end
	
LusterTrashcanTextJump1:
	text_jump LusterTrashcanTextOnlyTrash
	text_waitbutton
	
LusterTrashcanTextJump2:
	db "@@"
	
LusterEmptyApartmentText:
	text "It's locked…"
	
	para "There's a sign on"
	line "the door."
	
	para "“FOR RENT”"
	done
	
LusterTrashcanText1:
	text "<PLAYER> dug"
	line "through the trash…"
	
	para "Rustle… rustle…"
	done
	
LusterTrashcanTextOnlyTrash:
	text "Nope, there's"
	line "only trash here."
	done
	
LusterTrashcanTextEmpty:
	text "It's empty…"
	done
	
LusterTrashcanText2:
	text "It's empty…"
	done
	
LusterSign1Text:
	text "LUSTER TRAIN"
	line "STATION"
	done
	
LusterSign2Text:
	text "LUSTER CITY"
	
	para "The bustling"
	line "center of the"
	cont "ONWA REGION."
	done
	
LusterSign3Text:
	text "SOUTH:"
	line "ROUTE 8"
	done
	
LusterPunkLeaderText1:
	text "Gah!"
	
	para "This just ain't"
	line "right!"
	done
	
LusterPunkLeaderText2:
	text "Did you get that"
	line "uh…"
	cont "“THING”?"
	
	para "Hand it over!"
	done
	
LusterPunkLeaderText3:
	text "You got this, kid."
	
	para "I hope…"
	done
	
LusterPunkLeaderText4:
	text "What're you lookin'"
	line "at?"
	
	para "Mind your own"
	line "business, kid!"
	done
	
LusterPunkLeaderText5:
	text "Hmm…"
	
	para "I guess that could"
	line "work,"
	
	para "but I'm not so sure"
	line "this kid can even"
	cont "handle it…"
	done
	
LusterPunkLeaderText6:
	text "Alright."
	
	para "How about this?"
	
	para "If you do this"
	line "favor for me,"
	
	para "I'll give you"
	line "something good in"
	cont "return."
	
	para "But first, you"
	line "gotta prove you" 
	cont "got what it takes."
	
	para "I have an"
	line "associate who"
	cont "has a uh…" 
	cont "“THING” I need."
	
	para "He's somewhere in"
	line "the neighborhood."
	
	para "If you can find"
	line "him and bring the"
	cont "uh…"
	cont "“THING” to me,"
	
	para "I'll let you help"
	line "me out."
	
	para "Yeah…"
	
	para "Now get to it!"
	done
	
LusterPunkLeaderText7:
	text "Did you get that"
	line "uh…"
	cont "“THING”?"
	
	para "What are you"
	line "waiting for?"
	done
	
LusterPunkLeaderText8:
	text "Hmm…"
	
	para "Uh huh…"
	
	para "Mhmm…"
	done
	
LusterPunkLeaderText9:
	text "It's all here."
	
	para "You did good, kid."
	
	para "Maybe you DO have"
	line "what it takes to"
	cont "help me out."
	
	para "Alright, here's"
	line "what's up."
	
	para "We're known around"
	line "these parts as"
	cont "“THE NIDOKINGS”!"
	done
	
LusterPunkLeaderText9_2:
	text "“You'll wish you"
	line "NIDO-RAN while you"
	cont "could."
	done
	
LusterPunkLeaderText9_3:
	text "But now there's"
	line "NIDORI-NO escape!"
	done
	
LusterPunkLeaderText9_4:
	text "Cuz we're THE"
	line "NIDOKINGS!”"
	
	para "We strike fear in"
	line "the hearts of kids"
	cont "and little old"
	cont "ladies everywhere!"
	
	para "…"
	
	para "At least we DID…"
	
	para "Ya see, the sewers"
	line "here used to be"
	cont "our turf."
	
	para "That is until a"
	line "few days ago."
	
	para "Those no-good"
	line "thugs, the"
	cont "“BUNEARY BOYS”"
	cont "came in and forced"
	cont "us out!"
	
	para "They're makin' a"
	line "mess of the place!"
	
	para "There's only room"
	line "for one group of"
	cont "no-good thugs"
	cont "around here,"
	cont "and that's us!"
	
	para "“THE NIDOKINGS”!"
	
	para "So what I need"
	line "ya to do is go"
	cont "down there and"
	cont "knock some sense"
	cont "into those losers."
	
	para "I'd do it myself,"
	line "but they've done"
	cont "somethin' to the"
	cont "water."
	
	para "It's NASTY!"
	
	para "Even worse than"
	line "usual…"
	
	para "My #MON won't"
	line "get near it!"
	
	para "Anyway, if you"
	line "can take out their"
	cont "leader FRANKIE,"
	
	para "I'm sure the rest"
	line "of those rotten"
	cont "“BUNEARYS” will"
	cont "turn tail and run."
	
	para "I'll make it worth"
	line "your while."
	
	para "What do ya say,"
	line "kid?"
	done
	
LusterPunkLeaderText10:
	text "Alright, now get"
	line "down there and"
	cont "do it for"
	cont "“THE NIDOKINGS”!"

	para "You got this, kid."
	
	para "I hope…"
	done
	
	
LusterPunkLeaderTextGiveThing:
	text "<PLAYER> handed"
	line "over “THE THING”."
	done
	
LusterPunkLeaderTextYes:
	text "That's it!"
	
	para "You won't regret"
	line "it."
	done
	
LusterPunkLeaderTextNo:
	text "What's that?"
	
	para "Couldn't quite hear"
	line "ya."
	
	para "You wanna repeat"
	line "that?"
	done
	
LusterPunkLeaderTextOpen1:
	text "Rattle… rattle…"
	done
	
LusterPunkLeaderTextOpen2:
	text "CLANG!"
	done
	
LusterPunkLeaderText11:
	text "Kid!"
	
	para "You're alive!"
	
	para "Tell me some good"
	line "news!"
	
	para "Didja drive out"
	line "that rotton,"
	cont "no-good, FRANKIE?"	
	done
	
LusterPunkLeaderText12:
	text "YES!"
	
	para "KID!"
	
	para "YOU ROCK!"
	
	para "You beat 'em up,"
	
	para "punched them out"
	line "big time,"
	
	para "kicked their"
	line "butts,"
	
	para "bit their heads"
	line "off,"
	
	para "spit in their"
	line "eyes,"
	
	para "and made them wet"
	line "their pants!"
	
	para "I'll bet the water's"
	line "even started to"
	cont "clear up by now!"
	
	para "Thank you!"
	
	para "Now we can finally"
	line "get back to what"
	cont "we do best:"
	
	para "Terrorizing the"
	line "good people of"
	cont "LUSTER CITY!"
	
	para "Here, kid."
	
	para "I told you I'd"
	line "make this worth"
	cont "your while!"
	done
	
LusterPunkLeaderText13:
	text "That SKATEBOARD"
	line "let's you roll"
	cont "around in style!"
	
	para "It's faster than"
	line "walking,"
	
	para "but you have to"
	line "kick every once in"
	cont "a while for speed."
	
	para "You can also only"
	line "skate on certain"
	cont "surfaces."
	
	para "You can't roll on"
	line "grass, gravel, or"
	cont "other bumpy stuff!"
	
	para "You should stop"
	line "by the SKATE SHOP"
	cont "at the MALL."
	
	para "I know a guy that"
	line "works there."
	
	para "He can teach you"
	line "some cool tricks!"
	
	para "…"
	
	para "Anyway, we're outta"
	line "here!"
	
	para "Come visit us in"
	line "down here anytime."
	
	para "As far as we're"
	line "concerned,"
	
	para "you're one of us"
	line "now kid!"
	done
	
LusterPunk1Text14:
	text "Aw, you're kidding,"
	line "right?"
	
	para "You totally took"
	line "FRANKIE down,"
	cont "right?"
	done
	
LusterPunk1Text1:
	text "What are we"
	line "gonna do?"
	done
	
LusterPunk1Text2:
	text "Buzz off!"
	done
	
LusterPunk1Text3:
	text "Hey wait…"
	
	para "We can't show our"
	line "faces down there,"
	
	para "but what if we"
	line "sent the kid down"
	cont "there to deal with"
	cont "it instead?"
	done
	
LusterPunk1Text4:
	text "Good thinkin',"
	line "boss!"
	done
	
LusterPunk1Text5:
	text "Get going!"
	done
	
LusterPunk1Text6:
	text "Did you get it?"
	done
	
LusterPunk1Text7:
	text "Show 'em what"
	line "for!"
	done
	
LusterPunk1Text8:
	text "Spit it out!"
	done
	
LusterPunk1Text9:
	text "Did ya do it?"
	done
	
LusterPunk2Text1:
	text "This just ain't"
	line "fair, man…"
	done
	
LusterPunk2Text2:
	text "Not now, punk!"
	done
	
LusterPunk2Text3:
	text "Yeah!"
	
	para "She's right, boss!"
	
	para "That could work!"
	done
	
LusterPunk2Text4:
	text "Killing two birds"
	line "with one stone!"
	done
	
LusterPunk2Text5:
	text "What are you still"
	line "doing here?"
	done
	
LusterPunk2Text6:
	text "Took you long"
	line "enough…"
	done
	
LusterPunk2Text7:
	text "You got this!"
	done
	
LusterPunk2Text8:
	text "Yeah, tell us!"
	done
	
LusterPunk2Text9:
	text "How'd it go?"
	done
	
LusterShadyGuyText1:
	text "What are you"
	line "lookin' at?"
	
	para "I ain't doin' any-"
	line "thing shady!"
	done
	
LusterShadyGuyText2:
	text "You the one?"
	
	para "They sent a kid?"
	
	para "…"
	
	para "Ah whatever!"
	
	para "Here's the uh…"
	line "“THING”."
	
	para "Take it and get"
	line "outta here."
	done

LusterShadyGuyText3:
	text "Scram!"
	
	para "We don't know each"
	line "other, capiche?"
	done

LusterShadyGuyText4:
	text "What do you want"
	line "now?"
	
	para "Scram!"
	
	para "We don't know each"
	line "other, capiche?"
	done

Luster1NPC1Text:
	text "Sometimes I forget"
	line "just how big this"
	cont "city is…"
	
	para "It's honestly a"
	line "bit overwhelming!"
	done

Luster1NPC2Text:
	text "Whenever I get"
	line "sad or blue,"
	
	para "I take a trip to"
	line "the SHOPPING MALL."
	
	para "Then I forget all"
	line "about what I was"
	cont "worried about!"
	done

Luster1NPC3Text:
	text "I just got a new"
	line "haircut."
	
	para "I went with a new"
	line "style instead of"
	cont "my usual one…"
	
	para "It makes me look"
	line "tough, right?"
	
	para "Right…?"
	done

Luster1NPC4Text:
	text "Why do we have"
	line "#MART here,"
	cont "anyway?"

	para "We already have"
	line "the SHOPPING MALL!"
	
	para "How much shopping"
	line "does one city"
	cont "need?"
	done

Luster1NPC5Text:
	text "I love living in"
	line "the big city,"
	
	para "but some days I"
	line "do miss living"
	cont "back home…"
	
	para "Oh, who am I"
	line "kidding?"
	
	para "No I don't!"
	done

Luster1NPC6Text:
	text "There's some cool"
	line "dudes that hang"
	cont "out at the PARK"
	cont "to the SOUTH."
	
	para "I wish I had a"
	line "SKATEBOARD like"
	cont "them!"
	done

Luster1NPC7Text:
	text "LUSTER CITY has"
	line "two #MON"
	cont "CENTERS."

	para "There's this one"
	line "here, and also one"
	cont "in the SHOPPING"
	cont "MALL."

	para "Pretty convenient"
	line "if you ask me!"
	done

Luster1NPC8Text:
	text "I'm not supposed to"
	line "play in the"
	cont "street."
	
	para "Don't tell my"
	line "parents."
	done

Luster1NPC9Text:
	text "The PARK is down"
	line "this way."
	
	para "It leads outta"
	line "the city,"
	
	para "so be ready for"
	line "some battles!"
	done

Luster1NPC10Text:
	text "MEOWTH: Mee!"
	line "Owth!"
	done

Luster1NPC11Text:
	text "PIKACHU: Chu!"
	line "Pika-chu!"
	done

Luster1NPC12Text:
	text "They say sitting"
	line "by the traintracks"
	cont "is bad for your"
	cont "hearing."
	
	para "Nonsense!"
	
	para "It's not even that"
	line "loud."
	
	para "In fact, it's been"
	line "getting quieter"
	cont "lately…"
	done

Luster1NPC13Text:
	text "You aren't from"
	line "around here, huh?"
	
	para "You look totally"
	line "lost!"
	done

Luster1NPC14Text:
	text "There are 3"
	line "distinct districts"
	cont "in LUSTER CITY."
	
	para "Right now, you're"
	line "in the HOUSING"
	cont "DISTRICT."
	
	para "There's also the"
	line "SHOPPING DISTRICT"
	cont "and the BUSINESS"
	cont "DISCTRICT."
	done
	
Movement_LusterResidentialPunkLeader1:
	turn_step_left
	turn_step_left
	turn_step_left
	step_end
	
Movement_LusterResidentialPunkLeader2:
	turn_step_right
	turn_step_right
	turn_step_right
	step_end

Movement_LusterResidentialPunks1:
	turn_step_left
	turn_step_left
	turn_step_left
	run_step_left
	step_end
	
Movement_LusterResidentialPunks2:
	turn_step_right
	turn_step_right
	turn_step_right
	run_step_right
	step_end