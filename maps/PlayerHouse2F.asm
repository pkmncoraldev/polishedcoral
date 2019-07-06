PlayerHouse2F_MapScriptHeader:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, PlayerHouse2FInitializeRoom
	callback MAPCALLBACK_TILES, PlayerHouse2FSetSpawn

	db 1 ; warp events
	warp_event  7,  0, PLAYER_HOUSE_1F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  1, SIGNPOST_UP, PlayerHousePC
	bg_event  3,  1, SIGNPOST_READ, PlayerHouseRadio
	bg_event  5,  1, SIGNPOST_READ, PlayerHouseBookshelf
	bg_event  1,  1, SIGNPOST_READ, PlayerHouseCloset

	db 1 ; object events
	object_event  4,  2, SPRITE_SNES, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GameConsole, -1

	const_def 1 ; object constants
	const PLAYERHOUSE2F_SNES
	
PlayerHouse2FInitializeRoom:
;	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInizialization
	jumpstd initializeevents
	return

.SkipInizialization:
	return

PlayerHouse2FSetSpawn:
;	special ToggleMaptileDecorations
	return

PlayerHouseBookshelf:
	jumpstd picturebookshelf
	
GameConsole:
	pause 4
	playmusic MUSIC_SNES_KIRBY
	opentext
	writetext GameConsoleText_Kirby
	waitbutton
	closetext
	special RestartMapMusic
	giveitem BICYCLE
	end

PlayerHouseRadio:

if DEF(DEBUG)

	opentext
	; time
	special Special_SetDayOfWeek
	special Special_InitialClearDSTFlag
	; full pokegear
	setflag ENGINE_POKEGEAR
	setflag ENGINE_PHONE_CARD
	setflag ENGINE_MAP_CARD
	setflag ENGINE_RADIO_CARD
	setflag ENGINE_EXPN_CARD
	; pokedex
	setflag ENGINE_POKEDEX
	setflag ENGINE_UNOWN_DEX
	; all tms+hms
x = 0
rept NUM_TMS + NUM_HMS
	givetmhm x
x = x + 1
endr
	; all items
x = 1
rept $fe
	giveitem x, 99
x = x + 1
endr
	; all decorations
x = EVENT_DECO_BED_1
rept EVENT_DECO_BIG_LAPRAS_DOLL - EVENT_DECO_BED_1 + 1
	setevent x
x = x + 1
endr
	; max money
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 1000000
	givemoney $0, 999999
	givecoins 50000
	loadvar wBattlePoints, 250
	; all badges
	setflag ENGINE_ZEPHYRBADGE
	setflag ENGINE_HIVEBADGE
	setflag ENGINE_PLAINBADGE
	setflag ENGINE_FOGBADGE
	setflag ENGINE_STORMBADGE
	setflag ENGINE_MINERALBADGE
	setflag ENGINE_GLACIERBADGE
	setflag ENGINE_RISINGBADGE
	setflag ENGINE_BOULDERBADGE
	setflag ENGINE_CASCADEBADGE
	setflag ENGINE_THUNDERBADGE
	setflag ENGINE_RAINBOWBADGE
	setflag ENGINE_MARSHBADGE
	setflag ENGINE_SOULBADGE
	setflag ENGINE_VOLCANOBADGE
	setflag ENGINE_EARTHBADGE
	setevent EVENT_BEAT_FALKNER
	setevent EVENT_BEAT_BUGSY
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_BEAT_MORTY
	setevent EVENT_BEAT_CHUCK
	setevent EVENT_BEAT_JASMINE
	setevent EVENT_BEAT_PRYCE
	setevent EVENT_BEAT_CLAIR
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_BLAINE
	setevent EVENT_BEAT_BLUE
	setevent EVENT_BEAT_ELITE_FOUR
	setevent EVENT_BEAT_ELITE_FOUR_AGAIN
	setevent EVENT_BATTLE_TOWER_OPEN
	clearevent EVENT_BATTLE_TOWER_CLOSED
	; fly anywhere
	setflag ENGINE_FLYPOINT_SUNSET
	setflag ENGINE_FLYPOINT_CHERRYGROVE
	setflag ENGINE_FLYPOINT_VIOLET
	setflag ENGINE_FLYPOINT_UNION_CAVE
	setflag ENGINE_FLYPOINT_AZALEA
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_FLYPOINT_ECRUTEAK
	setflag ENGINE_FLYPOINT_OLIVINE
	setflag ENGINE_FLYPOINT_CIANWOOD
	setflag ENGINE_FLYPOINT_MAHOGANY
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	setflag ENGINE_FLYPOINT_BLACKTHORN
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	setflag ENGINE_FLYPOINT_PALLET
	setflag ENGINE_FLYPOINT_VIRIDIAN
	setflag ENGINE_FLYPOINT_PEWTER
	setflag ENGINE_FLYPOINT_MT_MOON
	setflag ENGINE_FLYPOINT_CERULEAN
	setflag ENGINE_FLYPOINT_VERMILION
	setflag ENGINE_FLYPOINT_CELADON
	setflag ENGINE_FLYPOINT_ROCK_TUNNEL
	setflag ENGINE_FLYPOINT_LAVENDER
	setflag ENGINE_FLYPOINT_FUCHSIA
	setflag ENGINE_FLYPOINT_SAFFRON
	setflag ENGINE_FLYPOINT_CINNABAR
	; magnet train works
	setevent EVENT_RESTORED_POWER_TO_KANTO
	; post-e4
	setflag ENGINE_CREDITS_SKIP
	setflag ENGINE_HAVE_SHINY_CHARM
	; good party
	givepoke MEWTWO, 100, ARMOR_SUIT
	loadvar wPartyMon1EVs+0, 252
	loadvar wPartyMon1EVs+1, 252
	loadvar wPartyMon1EVs+2, 252
	loadvar wPartyMon1EVs+3, 252
	loadvar wPartyMon1EVs+4, 252
	loadvar wPartyMon1EVs+5, 252
	loadvar wPartyMon1DVs+0, $ff
	loadvar wPartyMon1DVs+1, $ff
	loadvar wPartyMon1DVs+2, $ff
	loadvar wPartyMon1Personality, ABILITY_2 | MODEST
	loadvar wPartyMon1Stats+0, 999 / $100
	loadvar wPartyMon1Stats+1, 999 % $100
	loadvar wPartyMon1Stats+2, 999 / $100
	loadvar wPartyMon1Stats+3, 999 % $100
	loadvar wPartyMon1Stats+4, 999 / $100
	loadvar wPartyMon1Stats+5, 999 % $100
	loadvar wPartyMon1Stats+6, 999 / $100
	loadvar wPartyMon1Stats+7, 999 % $100
	loadvar wPartyMon1Stats+8, 999 / $100
	loadvar wPartyMon1Stats+9, 999 % $100
	; hm slaves
	givepoke MEW, 100, LEFTOVERS
	givepoke MEW, 100, LEFTOVERS
	loadvar wPartyMon2Moves+0, FLY
	loadvar wPartyMon2Moves+1, SURF
	loadvar wPartyMon2Moves+2, STRENGTH
	loadvar wPartyMon2Moves+3, CUT
	loadvar wPartyMon2PP+0, 15
	loadvar wPartyMon2PP+1, 15
	loadvar wPartyMon2PP+2, 15
	loadvar wPartyMon2PP+3, 30
	loadvar wPartyMon3Moves+0, FLASH
	loadvar wPartyMon3Moves+1, ROCK_SMASH
	loadvar wPartyMon3Moves+2, WHIRLPOOL
	loadvar wPartyMon3Moves+3, WATERFALL
	loadvar wPartyMon3PP+0, 20
	loadvar wPartyMon3PP+1, 15
	loadvar wPartyMon3PP+2, 15
	loadvar wPartyMon3PP+3, 15
	; fill pokedex
	callasm FillPokedex
	; intro events
	addcellnum PHONE_MOM
	setmapscene PLAYER_HOUSE_1F, $1
	setevent EVENT_PLAYER_HOUSE_MOM_1
	clearevent EVENT_PLAYER_HOUSE_MOM_2
	closetext
	end

FillPokedex:
	ld a, 1
	ld [wUnlockedUnownMode], a
	ld [wFirstUnownSeen], a
	ld [wFirstMagikarpSeen], a
	ld hl, wUnownDex
	ld a, 1
rept NUM_UNOWN
	ld [hli], a
	inc a
endr
	ld hl, wPokedexSeen
	call .Fill
	ld hl, wPokedexCaught
.Fill:
	ld a, %11111111
	ld bc, 31 ; 001-248
	call ByteFill
	ld a, %00011111
	ld [hl], a ; 249-253
	ret

else

	jumpstd radio1

endc


PlayerHousePC:
	opentext
	special Special_PlayerHousePC
	iftrue .Warp
	endtext
.Warp:
	warp NONE, 0, 0
	end

PlayerHouseCloset:
	opentext
	writetext ChangeColorQuestionText
	yesorno
	iffalse .end
	writetext ChangeColorText
	waitbutton
	refreshscreen $0
	loadmenu .PlayerHouseChangeColorMenuData
	verticalmenu
	closewindow
	pause 10
	applymovement PLAYER, ChangeColorMovement1
	playsound SFX_TWINKLE
	callasm SetPlayerPalKrisHouse
	writetext ChangeColorText2
	waitbutton
	closetext
	end
	
.end
	closetext
	end

.PlayerHouseChangeColorMenuData: ; 0x48dfc
	db $40 ; flags
	db 00, 05 ; start coords
	db 16, 15 ; end coords
	dw .MenuData2PalKrisHouse
	db 1 ; default option
; 0x48e04

.MenuData2PalKrisHouse: ; 0x48e04
	db $a1 ; flags
	db 7 ; items
	db "Red@"
	db "Blue@"
	db "Green@"
	db "Brown@"
	db "Purple@"
	db "Pink@"
	db "Yellow@"

ChangeColorMovement1:
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	turn_head_down
	turn_head_left
	turn_head_up
	turn_head_right
	step_sleep 1
	turn_head_down
	step_sleep 1
	turn_head_left
	step_sleep 1
	turn_head_up
	step_sleep 1
	turn_head_right
	step_sleep 2
	turn_head_down
	step_sleep 2
	turn_head_left
	step_sleep 2
	turn_head_up
	step_sleep 3
	turn_head_right
	step_sleep 6
	turn_head_down
	step_sleep 12
	step_end
	
GameConsoleText_SMW:
	text "It's an SNES."
	
	para "A man wearing"
	line "overalls is riding"
	cont "a green dinosaur."
	done
	
GameConsoleText_Kirby:
	text "It's an SNES."
	
	para "A Pink Puff is"
	line "eating everything"
	cont "in its path."
	done
	
ChangeColorText:
	text "Select your"
	line "favorite color."
	done
	
ChangeColorText2:
	text "Lookin' good!"
	done
	
ChangeColorQuestionText:
	text "Change your"
	line "clothes?"
	done
	
KrisRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

KrisRadioText2:
	text "#MON CHANNEL!"
	done

KrisRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

KrisRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

SetPlayerPalKrisHouse:
	ld a, [wMenuCursorY] ; 1 - 8
	sub $1
	ld [wPlayerPalette], a
	ld [wPlayerInitialPalette], a
	ret